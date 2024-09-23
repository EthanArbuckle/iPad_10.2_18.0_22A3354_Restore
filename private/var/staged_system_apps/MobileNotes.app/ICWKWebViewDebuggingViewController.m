@implementation ICWKWebViewDebuggingViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICWKWebViewDebuggingViewController;
  -[ICWKWebViewDebuggingViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICWKWebViewDebuggingViewController webView](self, "webView"));
  objc_msgSend(v3, "setNavigationDelegate:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICWKWebViewDebuggingViewController webView](self, "webView"));
  objc_msgSend(v4, "_setInputDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWKWebViewDebuggingViewController webView](self, "webView"));
  objc_msgSend(v5, "_setEditable:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICWKWebViewDebuggingViewController webView](self, "webView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NoteHTMLEditorView baseHTMLString](NoteHTMLEditorView, "baseHTMLString"));
  v8 = objc_msgSend(v6, "loadHTMLString:baseURL:", v7, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICWKWebViewDebuggingViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setTitle:", CFSTR("WKWebView"));

}

- (void)dismiss:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICWKWebViewDebuggingViewController navigationController](self, "navigationController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, void *);
  void *v8;
  __CFString *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICWKWebViewDebuggingViewController webView](self, "webView", a3, a4));
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100082D80;
  v8 = &unk_1005522D0;
  v9 = CFSTR("var editor = document.getElementById('editor')\neditor.setAttribute('contentEditable', true);\neditor.focus();\n");
  objc_msgSend(v4, "evaluateJavaScript:completionHandler:");

}

- (BOOL)_webView:(id)a3 focusShouldStartInputSession:(id)a4
{
  return 1;
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (void)setWebView:(id)a3
{
  objc_storeWeak((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
}

@end
