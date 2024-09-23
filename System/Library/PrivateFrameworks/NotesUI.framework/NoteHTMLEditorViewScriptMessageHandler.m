@implementation NoteHTMLEditorViewScriptMessageHandler

- (NoteHTMLEditorViewScriptMessageHandler)initWithNoteHMLEditorView:(id)a3
{
  id v4;
  NoteHTMLEditorViewScriptMessageHandler *v5;
  NoteHTMLEditorViewScriptMessageHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NoteHTMLEditorViewScriptMessageHandler;
  v5 = -[NoteHTMLEditorViewScriptMessageHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_noteHTMLEditorView, v4);

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NoteHTMLEditorViewScriptMessageHandler noteHTMLEditorView](self, "noteHTMLEditorView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didReceiveScriptMessage:", v5);

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
