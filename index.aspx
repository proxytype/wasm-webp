<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Webp Encode Example</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/a.out.js"></script>
    <script src="js/magic.js"></script>

    <script>

        var magic;
        var api;


        Module.onRuntimeInitialized = function () {
            api = {
                version: Module.cwrap('version', 'number', []),
                create_buffer: Module.cwrap('create_buffer', 'number', ['number', 'number']),
                destroy_buffer: Module.cwrap('destroy_buffer', '', ['number']),
                encode: Module.cwrap('encode', '', ['number', 'number', 'number', 'number']),
                get_result_pointer: Module.cwrap('get_result_pointer', 'number', ''),
                get_result_size: Module.cwrap('get_result_size', 'number', ''),
                free_result: Module.cwrap('free_result', '', ['number']),
            };
            console.log(api.version());
            magic = new Magic(api);
        };



    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <div>
                <div style="float:left">URL</div>
                <div style="float:left"><input type="text" placeholder="http://" id="url" /></div>
                <div style="float:left"><input type="button" value="Render" onclick="magic.loadImage($('#url').val())" /></div>
            </div>

            <div>
                <img src="" id="imgC" />
            </div>
    </div>
    </form>
</body>
</html>
