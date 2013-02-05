var MarkdownEditor = (function() {

    function MarkdownEditor() {}

    function bindPreview(){
        $('#editor').bind('keyup', previewMd)
    };

    function previewMd(){
        var rawText = MarkdownEditor.editor.getSession().getValue(), compiledText = MarkdownEditor.converter.makeHtml(rawText)
        MarkdownEditor.preview.html('').html(compiledText)
    };

    MarkdownEditor.getContent = function (){
        return MarkdownEditor.editor.getSession().getValue();
    };

    MarkdownEditor.initialize = function() {
        MarkdownEditor.editor = ace.edit("editor");
        MarkdownEditor.preview = $('#preview')
        MarkdownEditor.converter = new Showdown.converter();

        MarkdownEditor.editor.setTheme("ace/theme/solarized_dark");
        MarkdownEditor.editor.getSession().setMode("ace/mode/markdown");
        bindPreview();
        previewMd();
    };

    return MarkdownEditor;
})();