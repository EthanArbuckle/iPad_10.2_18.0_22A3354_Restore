@implementation PKPayLaterMerchandisingModalViewController

- (PKPayLaterMerchandisingModalViewController)initWithConfiguration:(id)a3
{
  id v5;
  PKPayLaterMerchandisingModalViewController *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  PKPayLaterMerchandisingUtilities *utilities;
  uint64_t v11;
  UIActivityIndicatorView *spinner;
  id v13;
  void *v14;
  uint64_t v15;
  WKWebView *webView;
  UIScrollView *v17;
  UIScrollView *scrollView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIButton *closeButton;
  _QWORD v34[4];
  id v35;
  objc_super v36;
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKPayLaterMerchandisingModalViewController;
  v6 = -[PKPayLaterMerchandisingModalViewController init](&v36, sel_init);
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPayLaterMerchandisingModalViewController _viewControllerDescription](v6, "_viewControllerDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v8;
      v40 = 2112;
      v41 = v5;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Creating %@ with configuration %@", buf, 0x16u);

    }
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0D67038], "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    utilities = v6->_utilities;
    v6->_utilities = (PKPayLaterMerchandisingUtilities *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v6->_spinner;
    v6->_spinner = (UIActivityIndicatorView *)v11;

    -[UIActivityIndicatorView startAnimating](v6->_spinner, "startAnimating");
    -[UIActivityIndicatorView sizeToFit](v6->_spinner, "sizeToFit");
    v13 = objc_alloc(MEMORY[0x1E0CEF630]);
    -[PKPayLaterMerchandisingModalViewController _webViewConfiguration](v6, "_webViewConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithFrame:configuration:", v14, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    webView = v6->_webView;
    v6->_webView = (WKWebView *)v15;

    -[WKWebView setUIDelegate:](v6->_webView, "setUIDelegate:", v6);
    -[WKWebView setNavigationDelegate:](v6->_webView, "setNavigationDelegate:", v6);
    -[PKPayLaterMerchandisingModalViewController _setupWebView:](v6, "_setupWebView:", v6->_webView);
    v17 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    scrollView = v6->_scrollView;
    v6->_scrollView = v17;

    -[UIScrollView pinchGestureRecognizer](v6->_scrollView, "pinchGestureRecognizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEnabled:", 0);

    -[UIScrollView setShowsHorizontalScrollIndicator:](v6->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v6->_scrollView, "setShowsVerticalScrollIndicator:", 1);
    -[UIScrollView setMultipleTouchEnabled:](v6->_scrollView, "setMultipleTouchEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 5, 25.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v22;
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configurationWithPaletteColors:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "configurationByApplyingConfiguration:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setImage:", v27);
    objc_initWeak((id *)buf, v6);
    v29 = (void *)MEMORY[0x1E0DC3428];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __68__PKPayLaterMerchandisingModalViewController_initWithConfiguration___block_invoke;
    v34[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v35, (id *)buf);
    objc_msgSend(v29, "actionWithHandler:", v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v28, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    closeButton = v6->_closeButton;
    v6->_closeButton = (UIButton *)v31;

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);

  }
  return v6;
}

void __68__PKPayLaterMerchandisingModalViewController_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentingViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = v3;
  }

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPayLaterMerchandisingModalViewController _viewControllerDescription](self, "_viewControllerDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "%@ finished loading", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PKPayLaterMerchandisingModalViewController_webView_didFinishNavigation___block_invoke;
  v10[3] = &unk_1E3E61310;
  objc_copyWeak(&v11, (id *)buf);
  -[PKPayLaterMerchandisingModalViewController _calculateWebViewHeightWithCompletion:](self, "_calculateWebViewHeightWithCompletion:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

void __74__PKPayLaterMerchandisingModalViewController_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_showSpinnerView:showWebView:animate:completion:", 0, 1, 1, 0);
    WeakRetained = v2;
  }

}

- (void)webViewDidClose:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPayLaterMerchandisingModalViewController _viewControllerDescription](self, "_viewControllerDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@ did close web view", (uint8_t *)&v6, 0xCu);

  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, uint64_t);
  PKPayLaterMerchandisingUtilities *utilities;
  PKPayLaterMerchandisingConfiguration *configuration;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, uint64_t))a5;
  utilities = self->_utilities;
  configuration = self->_configuration;
  v10 = a4;
  -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](utilities, "merchandisingBaseURLForEnviornmentType:", -[PKPayLaterMerchandisingConfiguration environmentType](configuration, "environmentType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPayLaterMerchandisingModalViewController _viewControllerDescription](self, "_viewControllerDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v15;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "%@ deciding policy for action: \"%@\", (uint8_t *)&v23, 0x16u);

  }
  objc_msgSend(v13, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  v19 = v17;
  if (v18 == v19)
  {

    v22 = 1;
LABEL_12:

    goto LABEL_14;
  }
  v20 = v19;
  if (!v18 || !v19)
  {

    goto LABEL_10;
  }
  v21 = objc_msgSend(v18, "isEqualToString:", v19);

  if ((v21 & 1) == 0)
  {
LABEL_10:
    if (!v13)
    {
      v22 = 0;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "openURL:withOptions:", v13, 0);
    v22 = 0;
    goto LABEL_12;
  }
  v22 = 1;
LABEL_14:
  v7[2](v7, v22);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterMerchandisingModalViewController;
  -[PKPayLaterMerchandisingModalViewController loadView](&v6, sel_loadView);
  -[PKPayLaterMerchandisingModalViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_scrollView);
  objc_msgSend(v3, "addSubview:", self->_spinner);
  objc_msgSend(v3, "addSubview:", self->_closeButton);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_webView);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PKPayLaterMerchandisingModalViewController _showSpinnerView:showWebView:animate:completion:](self, "_showSpinnerView:showWebView:animate:completion:", 1, 0, 0, 0);
  -[PKPayLaterMerchandisingModalViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v5, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  objc_msgSend(v5, "setBackButtonDisplayMode:", 2);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIActivityIndicatorView *spinner;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;

  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterMerchandisingModalViewController;
  -[PKPayLaterMerchandisingModalViewController viewWillLayoutSubviews](&v24, sel_viewWillLayoutSubviews);
  -[PKPayLaterMerchandisingModalViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  spinner = self->_spinner;
  -[UIActivityIndicatorView frame](spinner, "frame");
  PKRectCenteredIntegralRect();
  -[UIActivityIndicatorView setFrame:](spinner, "setFrame:");
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v5 + 0.0, v7 + v13, v9, v11 - (v13 + v15));
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v9, self->_webViewHeight);
  -[UIScrollView bounds](self->_scrollView, "bounds");
  -[WKWebView setFrame:](self->_webView, "setFrame:", *MEMORY[0x1E0C9D538] + 16.0, *(double *)(MEMORY[0x1E0C9D538] + 8) + 0.0, v17 + -32.0, self->_webViewHeight);
  -[UIButton frame](self->_closeButton, "frame");
  -[UIButton configuration](self->_closeButton, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "image");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "size");
  v21 = v20;
  v23 = v22;

  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  -[UIButton setFrame:](self->_closeButton, "setFrame:", v9 - v21 + -20.0, CGRectGetMinY(v25) + 20.0, v21, v23);

}

- (BOOL)pkui_navigationBarHidden
{
  return 1;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController received script message with name \"%@\", (uint8_t *)&v7, 0xCu);

  }
}

- (id)_webViewConfiguration
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CEF608]);
  objc_msgSend(v3, "addScriptMessageHandler:name:", self, CFSTR("modal"));
  v4 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  objc_msgSend(v4, "defaultWebpagePreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsContentJavaScript:", 1);

  objc_msgSend(v4, "setUserContentController:", v3);
  objc_msgSend(v4, "setApplicationNameForUserAgent:", CFSTR("modal"));
  v6 = objc_alloc(MEMORY[0x1E0CEF610]);
  v7 = (void *)objc_msgSend(v6, "initWithSource:injectionTime:forMainFrameOnly:", *MEMORY[0x1E0D6AC40], 1, 1);
  objc_msgSend(v3, "addUserScript:", v7);

  return v4;
}

- (void)_setupWebView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setAllowsLinkPreview:", 0);
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollEnabled:", 0);
  objc_msgSend(v5, "pinchGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v5, "setMultipleTouchEnabled:", 0);
  -[PKPayLaterMerchandisingUtilities merchandisingModalURLWithConfiguration:](self->_utilities, "merchandisingModalURLWithConfiguration:", self->_configuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:cachePolicy:timeoutInterval:", v7, 0, 10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "loadRequest:", v8);
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPayLaterMerchandisingModalViewController _viewControllerDescription](self, "_viewControllerDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v11;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "%@ loading request %@", (uint8_t *)&v12, 0x16u);

  }
}

- (void)_calculateWebViewHeightWithCompletion:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  _QWORD v18[6];
  id v19;
  _QWORD v20[5];
  _QWORD aBlock[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke;
  aBlock[3] = &unk_1E3E61C80;
  objc_copyWeak(&v23, &location);
  v7 = v4;
  v22 = v7;
  v8 = _Block_copy(aBlock);
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_2;
  v20[3] = &unk_1E3E67120;
  v20[4] = self;
  objc_msgSend(v5, "addOperation:", v20);
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_39;
  v18[3] = &unk_1E3E6AC28;
  v18[4] = self;
  objc_copyWeak(&v19, &location);
  v18[5] = v24;
  objc_msgSend(v5, "addOperation:", v18);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_44;
  v13[3] = &unk_1E3E6AC50;
  objc_copyWeak(&v17, &location);
  v10 = v8;
  v14 = v10;
  v11 = v7;
  v15 = v11;
  v16 = v24;
  v12 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v9, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v23);
  _Block_object_dispose(v24, 8);
  objc_destroyWeak(&location);

}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_QWORD *)WeakRetained + 128) = 0;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      v3 = v5;
    }
  }

}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_3;
  v11[3] = &unk_1E3E6ABD8;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "evaluateJavaScript:completionHandler:", CFSTR("document.readyState"), v11);

}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "stringValue");
  v3 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 != CFSTR("complete") && v3)
    -[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", CFSTR("complete"));

  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController readyState: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_39(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_2_42;
  v14[3] = &unk_1E3E6AC00;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  v11 = v9;
  v16 = v11;
  v12 = v8;
  v13 = *(_QWORD *)(a1 + 40);
  v15 = v12;
  v17 = v13;
  objc_msgSend(v10, "evaluateJavaScript:completionHandler:", CFSTR("document.body.scrollHeight"), v14);

  objc_destroyWeak(&v18);
}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_2_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  float v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(v5, "floatValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController encountered error getting height %@", (uint8_t *)&v12, 0xCu);
      }

    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v12 = 134217984;
      v13 = v11;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController recalcuated height to %f", (uint8_t *)&v12, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_44(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  double *WeakRetained;
  uint64_t v7;
  NSObject *v8;
  double v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_11;
  if (objc_msgSend(v5, "isCanceled"))
  {
    v7 = *((_QWORD *)WeakRetained + 128) + 1;
    *((_QWORD *)WeakRetained + 128) = v7;
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v14 = 25;
      v15 = 2048;
      v16 = v7;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController WKWebView document wasn't ready to load. Trying again in %ld miliseconds. Current rety count %ld", buf, 0x16u);
    }

    if (*((_QWORD *)WeakRetained + 128) != 200)
    {
      v10 = dispatch_time(0, 25000000);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_45;
      v11[3] = &unk_1E3E61850;
      v11[4] = WeakRetained;
      v12 = *(id *)(a1 + 40);
      dispatch_after(v10, MEMORY[0x1E0C80D38], v11);

      goto LABEL_12;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController WKWebView retry limit reached.", buf, 2u);
    }
    goto LABEL_10;
  }
  v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v9 != WeakRetained[127])
  {
    WeakRetained[127] = v9;
    objc_msgSend(WeakRetained, "view");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setNeedsLayout](v8, "setNeedsLayout");
LABEL_10:

  }
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_12:

}

uint64_t __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_calculateWebViewHeightWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_showSpinnerView:(BOOL)a3 showWebView:(BOOL)a4 animate:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[7];

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke;
  aBlock[3] = &unk_1E3E62928;
  aBlock[4] = self;
  *(double *)&aBlock[5] = (double)v7;
  *(double *)&aBlock[6] = (double)v8;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_2;
  v20[3] = &unk_1E3E61590;
  v13 = v10;
  v21 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(v20);
  if (v6)
  {
    v15 = (void *)MEMORY[0x1E0DC3F10];
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_3;
    v18[3] = &unk_1E3E61590;
    v19 = v12;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_4;
    v16[3] = &unk_1E3E614F0;
    v17 = v14;
    objc_msgSend(v15, "pkui_animateUsingOptions:animations:completion:", 4, v18, v16);

  }
  else
  {
    v12[2](v12);
    v14[2](v14);
  }

}

uint64_t __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", *(double *)(a1 + 48));
}

uint64_t __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (id)_viewControllerDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p"), objc_opt_class(), self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
