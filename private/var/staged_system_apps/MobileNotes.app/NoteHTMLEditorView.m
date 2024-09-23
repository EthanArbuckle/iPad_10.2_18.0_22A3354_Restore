@implementation NoteHTMLEditorView

- (BOOL)performActionForDataDetectedInURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DDDetectionController sharedController](DDDetectionController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NoteHTMLEditorView webView](self, "webView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_dataDetectionResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultActionForURL:results:context:", v4, v7, 0));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NoteHTMLEditorView webView](self, "webView"));
    objc_msgSend(v5, "performAction:inView:interactionDelegate:", v8, v9, 0);

  }
  return v8 != 0;
}

@end
