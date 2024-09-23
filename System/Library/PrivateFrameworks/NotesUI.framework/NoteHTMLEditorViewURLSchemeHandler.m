@implementation NoteHTMLEditorViewURLSchemeHandler

- (NoteHTMLEditorViewURLSchemeHandler)initWithNoteHMLEditorView:(id)a3
{
  id v4;
  NoteHTMLEditorViewURLSchemeHandler *v5;
  NoteHTMLEditorViewURLSchemeHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NoteHTMLEditorViewURLSchemeHandler;
  v5 = -[NoteHTMLEditorViewURLSchemeHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_noteHTMLEditorView, v4);

  return v6;
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NoteHTMLEditorViewURLSchemeHandler noteHTMLEditorView](self, "noteHTMLEditorView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadAttachmentContentForURLSchemeTask:", v5);

}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NoteHTMLEditorViewURLSchemeHandler noteHTMLEditorView](self, "noteHTMLEditorView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopLoadingAttachmentContentForURLSchemeTask:", v5);

}

- (NoteHTMLEditorView)noteHTMLEditorView
{
  return (NoteHTMLEditorView *)objc_loadWeakRetained((id *)&self->_noteHTMLEditorView);
}

- (void)setNoteHTMLEditorView:(id)a3
{
  objc_storeWeak((id *)&self->_noteHTMLEditorView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_noteHTMLEditorView);
}

@end
