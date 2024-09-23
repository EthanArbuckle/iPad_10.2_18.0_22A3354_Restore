@implementation SKUIApplicationLicenseViewController

- (SKUIApplicationLicenseViewController)initWithLicenseAgreementPage:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIApplicationLicenseViewController *v13;
  uint64_t v14;
  SKUIApplicationLicensePage *licensePage;
  objc_super v17;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIApplicationLicenseViewController initWithLicenseAgreementPage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIApplicationLicenseViewController;
  v13 = -[SKUIApplicationLicenseViewController init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v4, "copy");
    licensePage = v13->_licensePage;
    v13->_licensePage = (SKUIApplicationLicensePage *)v14;

  }
  return v13;
}

- (SKUIApplicationLicenseViewController)initWithLicenseAgreementURL:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIApplicationLicenseViewController *v13;
  uint64_t v14;
  NSURL *url;
  objc_super v17;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIApplicationLicenseViewController initWithLicenseAgreementURL:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIApplicationLicenseViewController;
  v13 = -[SKUIApplicationLicenseViewController init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v4, "copy");
    url = v13->_url;
    v13->_url = (NSURL *)v14;

  }
  return v13;
}

- (void)reloadData
{
  SSVLoadURLOperation *v3;
  SSVLoadURLOperation *loadOperation;
  SSVLoadURLOperation *v5;
  void *v6;
  SSVLoadURLOperation *v7;
  void *v8;
  void *v9;
  SSVLoadURLOperation *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id location;

  if (!self->_licensePage && !self->_loadOperation)
  {
    if (self->_url)
    {
      v3 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", self->_url);
      loadOperation = self->_loadOperation;
      self->_loadOperation = v3;

      v5 = self->_loadOperation;
      +[SSVURLDataConsumer consumer](SKUIApplicationLicenseDataConsumer, "consumer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVLoadURLOperation setDataConsumer:](v5, "setDataConsumer:", v6);

      v7 = self->_loadOperation;
      -[SKUIViewController clientContext](self, "clientContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForConfigurationKey:", CFSTR("sfsuffix"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVLoadURLOperation setStoreFrontSuffix:](v7, "setStoreFrontSuffix:", v9);

      objc_initWeak(&location, self);
      v10 = self->_loadOperation;
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __50__SKUIApplicationLicenseViewController_reloadData__block_invoke;
      v15 = &unk_1E73A83A0;
      objc_copyWeak(&v16, &location);
      -[SSVLoadURLOperation setOutputBlock:](v10, "setOutputBlock:", &v12);
      -[SKUIViewController operationQueue](self, "operationQueue", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addOperation:", self->_loadOperation);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

void __50__SKUIApplicationLicenseViewController_reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SKUIApplicationLicenseViewController_reloadData__block_invoke_2;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __50__SKUIApplicationLicenseViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_displayPage:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)loadView
{
  WKWebView *webView;
  WKWebView *v4;
  WKWebView *v5;
  WKWebView *v6;
  void *v7;
  void *v8;
  void *v9;
  SKUIApplicationLicensePage *licensePage;
  void *v11;
  id v12;

  webView = self->_webView;
  if (!webView)
  {
    v4 = (WKWebView *)objc_alloc_init(MEMORY[0x1E0CEF630]);
    v5 = self->_webView;
    self->_webView = v4;

    v6 = self->_webView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[WKWebView scrollView](self->_webView, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    licensePage = self->_licensePage;
    webView = self->_webView;
    if (licensePage)
    {
      -[SKUIApplicationLicensePage licenseAgreementHTML](licensePage, "licenseAgreementHTML");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[WKWebView loadHTMLString:baseURL:](webView, "loadHTMLString:baseURL:", v11, 0);

      webView = self->_webView;
    }
  }
  -[SKUIApplicationLicenseViewController setView:](self, "setView:", webView);
  -[SKUIViewController showDefaultNavigationItems](self, "showDefaultNavigationItems");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUIApplicationLicenseViewController reloadData](self, "reloadData");
  v5.receiver = self;
  v5.super_class = (Class)SKUIApplicationLicenseViewController;
  -[SKUIViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)_displayPage:(id)a3 error:(id)a4
{
  id v7;
  SSVLoadURLOperation *loadOperation;
  SKUIApplicationLicensePage **p_licensePage;
  WKWebView *webView;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  if (v7)
  {
    -[SKUIViewController showError:](self, "showError:", v7);
  }
  else
  {
    p_licensePage = &self->_licensePage;
    objc_storeStrong((id *)&self->_licensePage, a3);
    webView = self->_webView;
    if (webView)
    {
      -[SKUIApplicationLicensePage licenseAgreementHTML](*p_licensePage, "licenseAgreementHTML");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[WKWebView loadHTMLString:baseURL:](webView, "loadHTMLString:baseURL:", v11, 0);

    }
    -[SKUIApplicationLicensePage title](*p_licensePage, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIApplicationLicenseViewController setTitle:](self, "setTitle:", v13);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_licensePage, 0);
}

- (void)initWithLicenseAgreementPage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithLicenseAgreementURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
