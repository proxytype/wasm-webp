# Wasm-Webp
## Web Assembly - WebP Client Encoding
functional example according this article:
https://developers.google.com/web/updates/2018/03/emscripting-a-c-library

Requirements:

### Emscripten
http://kripken.github.io/emscripten-site/docs/getting_started/downloads.html

### LibwebP
https://github.com/webmproject/libwebp

**c code of exported functions under "c" library in the project**

**compile command:**

sudo emcc -O1 -s WASM=1 -s EXTRA_EXPORTED_RUNTIME_METHODS='["cwrap"]'
-s ALLOW_MEMORY_GROWTH=1 -I libwebp webp.c libwebp/src/{dec,dsp,demux,enc,mux,utils}/*.c

**Javascript c functions signatures:**

```javascript
 api = {
       version: Module.cwrap('version', 'number', []),
       create_buffer: Module.cwrap('create_buffer', 'number', ['number', 'number']),
       destroy_buffer: Module.cwrap('destroy_buffer', '', ['number']),
       encode: Module.cwrap('encode', '', ['number', 'number', 'number', 'number']),
       get_result_pointer: Module.cwrap('get_result_pointer', 'number', ''),
       get_result_size: Module.cwrap('get_result_size', 'number', ''),
       free_result: Module.cwrap('free_result', '', ['number']),
 };
```
