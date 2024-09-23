@implementation PKBasicWebViewController

- (PKBasicWebViewController)initWithURL:(id)a3
{
  id v5;
  PKBasicWebViewController *v6;
  PKBasicWebViewController *v7;
  WKWebView *v8;
  WKWebView *webView;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKBasicWebViewController;
  v6 = -[PKBasicWebViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = (WKWebView *)objc_alloc_init(MEMORY[0x1E0CEF630]);
    webView = v7->_webView;
    v7->_webView = v8;

    -[WKWebView setNavigationDelegate:](v7->_webView, "setNavigationDelegate:", v7);
    -[PKBasicWebViewController view](v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v7->_webView);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIActivityIndicatorView *v8;
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PKBasicWebViewController;
  -[PKBasicWebViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[PKBasicWebViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v5 = (void *)MEMORY[0x1E0DC3428];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__PKBasicWebViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v5, "actionWithHandler:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithBarButtonSystemItem:primaryAction:", 24, v6);

  v8 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v8;

  v10 = self->_activityIndicator;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](v10, "setColor:", v11);

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_activityIndicator);
  v18[0] = v7;
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItems:", v13);

  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __39__PKBasicWebViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKBasicWebViewController;
  -[PKBasicWebViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", self->_url);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WKWebView loadRequest:](self->_webView, "loadRequest:", v4);

}

- (void)viewWillLayoutSubviews
{
  WKWebView *webView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKBasicWebViewController;
  -[PKBasicWebViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  webView = self->_webView;
  -[PKBasicWebViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[WKWebView setFrame:](webView, "setFrame:");

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKBasicWebViewController_webView_didFinishNavigation___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __56__PKBasicWebViewController_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "stopAnimating");
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(id, uint64_t);

  v11 = (void (**)(id, uint64_t))a5;
  objc_msgSend(a4, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_5;
  if ((objc_msgSend(v8, "isEqual:", self->_url) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openURL:withOptions:", v8, 0);

LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = 1;
LABEL_6:
  v11[2](v11, v9);

}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
