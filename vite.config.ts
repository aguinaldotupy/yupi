import { defineConfig } from 'laravel-vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
    server: {
        watch: {
            ignored: ['**/.env/**'],
        },
    },
    resolve: {
        alias: {
            "vue-i18n": "vue-i18n/dist/vue-i18n.cjs.js"
        }
    },
    build: {
        rollupOptions: {
            output: {
                manualChunks: {
                    // Split vendor libraries into a separate chunk
                    vendor: ['vue', 'vue-i18n', 'lodash', 'moment'],
                }
            }
        },
        chunkSizeWarningLimit: 10000 // Increase the limit to 1000 KiB
    }
}).withPlugins(
    vue
)
