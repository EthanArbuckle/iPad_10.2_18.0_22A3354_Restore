@implementation PSUICarrierSpaceMyAccountWebViewController

- (PSUICarrierSpaceMyAccountWebViewController)initWithURLString:(id)a3
{
  id v4;
  PSUICarrierSpaceMyAccountWebViewController *v5;
  uint64_t v6;
  NSURL *myAccountURL;
  uint64_t v8;
  UIBarButtonItem *cancelButton;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSUICarrierSpaceMyAccountWebViewController;
  v5 = -[PSUICarrierSpaceMyAccountWebViewController init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    myAccountURL = v5->_myAccountURL;
    v5->_myAccountURL = (NSURL *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v5, sel_dismissMyAccount);
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (UIBarButtonItem *)v8;

  }
  return v5;
}

- (PSUICarrierSpaceMyAccountWebViewController)initWithWebView:(id)a3 url:(id)a4
{
  id v7;
  id v8;
  PSUICarrierSpaceMyAccountWebViewController *v9;
  PSUICarrierSpaceMyAccountWebViewController *v10;
  uint64_t v11;
  UIBarButtonItem *cancelButton;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PSUICarrierSpaceMyAccountWebViewController;
  v9 = -[PSUICarrierSpaceMyAccountWebViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webView, a3);
    objc_storeStrong((id *)&v10->_myAccountURL, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v10, sel_dismissMyAccount);
    cancelButton = v10->_cancelButton;
    v10->_cancelButton = (UIBarButtonItem *)v11;

  }
  return v10;
}

- (void)loadView
{
  WKWebView *v3;
  WKWebView *v4;
  id v5;
  void *v6;
  WKWebView *v7;
  WKWebView *webView;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSUICarrierSpaceMyAccountWebViewController;
  -[PSUICarrierSpaceMyAccountWebViewController loadView](&v11, sel_loadView);
  -[PSUICarrierSpaceMyAccountWebViewController addCancelButton](self, "addCancelButton");
  if (!self->_webView)
  {
    v5 = objc_alloc(MEMORY[0x24BDFA918]);
    -[PSUICarrierSpaceMyAccountWebViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = (WKWebView *)objc_msgSend(v5, "initWithFrame:");
    webView = self->_webView;
    self->_webView = v7;

    -[WKWebView scrollView](self->_webView, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    goto LABEL_5;
  }
  -[PSUICarrierSpaceMyAccountWebViewController view](self, "view");
  v3 = (WKWebView *)objc_claimAutoreleasedReturnValue();
  v4 = self->_webView;

  if (v3 != v4)
LABEL_5:
    -[PSUICarrierSpaceMyAccountWebViewController setView:](self, "setView:", self->_webView);
}

- (void)dismissMyAccount
{
  -[PSUICarrierSpaceMyAccountWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSUICarrierSpaceMyAccountWebViewController;
  -[PSUICarrierSpaceMyAccountWebViewController viewDidLoad](&v7, sel_viewDidLoad);
  if (self->_webView)
  {
    v3 = (void *)MEMORY[0x24BDD1840];
    -[PSUICarrierSpaceMyAccountWebViewController myAccountURL](self, "myAccountURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestWithURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[WKWebView loadRequest:](self->_webView, "loadRequest:", v5);
  }
}

- (void)addCancelButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  UIBarButtonItem *cancelButton;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[PSUICarrierSpaceMyAccountWebViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  v7 = v5;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    objc_msgSend(v5, "setRightBarButtonItem:animated:", cancelButton, 1);
  else
    objc_msgSend(v5, "setLeftBarButtonItem:animated:", cancelButton, 1);

}

- (NSURL)myAccountURL
{
  return self->_myAccountURL;
}

- (void)setMyAccountURL:(id)a3
{
  objc_storeStrong((id *)&self->_myAccountURL, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_myAccountURL, 0);
}

@end
