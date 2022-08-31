import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import WindiCSS from 'vite-plugin-windicss'

import path from 'path'

// https://vitejs.dev/config/
export default defineConfig({
  resolve: {
    alias: {
      // src 别名
      '~': path.resolve(__dirname, 'src')
    }
  },
  // 反向代理
  server: {
    proxy: {
      '/api': {
        target: 'http://ceshi13.dishait.cn',
        changeOrigin: true, //
        rewrite: path => path.replace(/^\/api/, '')
      }
    }
  },

  plugins: [vue(), WindiCSS()]
})
