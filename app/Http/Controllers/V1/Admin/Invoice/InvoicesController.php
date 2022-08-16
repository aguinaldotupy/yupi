<?php

namespace Crater\Http\Controllers\V1\Admin\Invoice;

use Crater\Http\Controllers\Controller;
use Crater\Http\Requests;
use Crater\Http\Requests\DeleteInvoiceRequest;
use Crater\Http\Resources\InvoiceResource;
use Crater\Jobs\GenerateInvoicePdfJob;
use Crater\Models\Invoice;
use Illuminate\Http\Request;

class InvoicesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        \DB::enableQueryLog();

        $this->authorize('viewAny', Invoice::class);

        $limit = $request->input('limit', 10);

        $invoices = Invoice::whereCompany()
            ->applyFilters($request->all())
            ->select([
                'invoices.id',
                'invoices.invoice_date',
                'invoices.invoice_number',
                'invoices.status',
                'invoices.due_amount',
                'invoices.total',
                'invoices.created_at',
                'invoices.paid_status',
                'invoices.overdue',
                'invoices.unique_hash',
                'invoices.customer_id',
                'invoices.viewed',
                'invoices.sent',
                'invoices.invoice_date',
                'invoices.due_date',
                'invoices.company_id',
            ])->with([
                'customer',
                'customer.currency',
                'company.abilities',
            ])->latest()
            ->paginateData($limit);

        return (InvoiceResource::collection($invoices))
            ->additional(['meta' => [
                'invoice_total_count' => Invoice::whereCompany()->count(),
                'query_log' => $log = \DB::getQueryLog(),
                'timing' => array_reduce($log, function ($carry, $item) {
                    $carry += $item['time'];
                    return $carry;
                }, 0),
            ]]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Requests\InvoicesRequest $request)
    {
        $this->authorize('create', Invoice::class);

        $invoice = Invoice::createInvoice($request);

        if ($request->has('invoiceSend')) {
            $invoice->send($request->subject, $request->body);
        }

        GenerateInvoicePdfJob::dispatch($invoice);

        return new InvoiceResource($invoice);
    }

    /**
     * Display the specified resource.
     *
     * @param  \Crater\Models\Invoice $invoice
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Request $request, Invoice $invoice)
    {
        $this->authorize('view', $invoice);

        return new InvoiceResource($invoice);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  Invoice $invoice
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Requests\InvoicesRequest $request, Invoice $invoice)
    {
        $this->authorize('update', $invoice);

        $invoice = $invoice->updateInvoice($request);

        if (is_string($invoice)) {
            return respondJson($invoice, $invoice);
        }

        GenerateInvoicePdfJob::dispatch($invoice, true);

        return new InvoiceResource($invoice);
    }

    /**
     * delete the specified resources in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function delete(DeleteInvoiceRequest $request)
    {
        $this->authorize('delete multiple invoices');

        Invoice::deleteInvoices($request->ids);

        return response()->json([
            'success' => true,
        ]);
    }
}
