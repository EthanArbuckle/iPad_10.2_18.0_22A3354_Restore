@implementation UIWebRotatingAlertController

- (UIWebRotatingAlertController)initWithUIWebDocumentView:(id)a3
{
  id v5;
  UIWebRotatingAlertController *v6;
  UIWebRotatingAlertController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIWebRotatingAlertController;
  v6 = -[_UIRotatingAlertController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_webBrowserView, a3);

  return v7;
}

- (void)_disableWebView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WebThreadLock();
  -[UIWebDocumentView webView](self->_webBrowserView, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeoutsPaused:", 1);

  -[UIWebDocumentView webView](self->_webBrowserView, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wasDeferringCallbacks = objc_msgSend(v5, "defersCallbacks");

  -[UIWebDocumentView webView](self->_webBrowserView, "webView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefersCallbacks:", 1);

}

- (void)_enableWebView
{
  void *v3;
  void *v4;
  id v5;

  WebThreadLock();
  -[UIWebDocumentView webView](self->_webBrowserView, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeoutsPaused:", 0);

  -[UIWebDocumentView webView](self->_webBrowserView, "webView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefersCallbacks:", self->_wasDeferringCallbacks);

}

- (void)dealloc
{
  objc_super v3;

  -[UIWebRotatingAlertController _enableWebView](self, "_enableWebView");
  v3.receiver = self;
  v3.super_class = (Class)UIWebRotatingAlertController;
  -[_UIRotatingAlertController dealloc](&v3, sel_dealloc);
}

- (void)doneWithSheet
{
  UIWebDocumentView *webBrowserView;
  objc_super v4;

  -[UIWebRotatingAlertController _enableWebView](self, "_enableWebView");
  webBrowserView = self->_webBrowserView;
  self->_webBrowserView = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIWebRotatingAlertController;
  -[_UIRotatingAlertController doneWithSheet](&v4, sel_doneWithSheet);
}

- (BOOL)presentSheet
{
  objc_super v4;

  -[UIWebRotatingAlertController _disableWebView](self, "_disableWebView");
  v4.receiver = self;
  v4.super_class = (Class)UIWebRotatingAlertController;
  return -[_UIRotatingAlertController presentSheet](&v4, sel_presentSheet);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webBrowserView, 0);
}

@end
