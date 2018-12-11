var Magic = function (_api) {

    var api = _api;

    this.loadImage = function (url) {
        var image = new Image();
        image.crossOrigin = "Anonymous";
        image.onload = function () {
            createWebp(this)
        }

        image.src = url;
    }

    function createWebp(image) {

        var canvas = document.createElement('canvas');
        canvas.width = image.width;
        canvas.height = image.height;

        var ctx = canvas.getContext('2d');
        ctx.drawImage(image, 0, 0, image.width, image.height);

        var d = ctx.getImageData(0, 0, image.width, image.height);

        var p = api.create_buffer(image.width, image.height);
        Module.HEAP8.set(d.data, p);


        api.encode(p, d.width, d.height, 100);

        const resultPointer = api.get_result_pointer();
        const resultSize = api.get_result_size();
        const resultView = new Uint8Array(Module.HEAP8.buffer, resultPointer, resultSize);
        const result = new Uint8Array(resultView);

        api.free_result(resultPointer);

        const blob = new Blob([result], { type: 'image/webp' });
        const blobURL = URL.createObjectURL(blob);
        $('#imgC').attr('src', blobURL);

        delete canvas;
        delete image;

    }

}