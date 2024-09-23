@implementation PKRemoteDocumentationViewController

- (WKWebView)webView
{
  WKWebView *webView;
  id v4;
  WKWebView *v5;
  WKWebView *v6;

  webView = self->_webView;
  if (!webView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEF630]);
    v5 = (WKWebView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_webView;
    self->_webView = v5;

    -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](self->_webView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
    webView = self->_webView;
  }
  return webView;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;

  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
    v5 = self->_activityIndicatorView;
    self->_activityIndicatorView = v4;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    activityIndicatorView = self->_activityIndicatorView;
  }
  return activityIndicatorView;
}

- (UIBarButtonItem)dismissButton
{
  UIBarButtonItem *dismissButton;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  dismissButton = self->_dismissButton;
  if (!dismissButton)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_handleDismiss_);
    v5 = self->_dismissButton;
    self->_dismissButton = v4;

    dismissButton = self->_dismissButton;
  }
  return dismissButton;
}

- (void)setIsLoading:(BOOL)a3
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  if (self->_isLoading != a3)
  {
    self->_isLoading = a3;
    if (a3)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke;
      v5[3] = &unk_1E3E612E8;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.3);
    }
    else
    {
      v3[4] = self;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke_2;
      v4[3] = &unk_1E3E612E8;
      v4[4] = self;
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke_3;
      v3[3] = &unk_1E3E62288;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v4, v3, 0.3);
    }
  }
}

void __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activityIndicatorView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activityIndicatorView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activityIndicatorView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopAnimating");

}

- (PKRemoteDocumentationViewController)initWithContext:(int64_t)a3 URL:(id)a4
{
  id v7;
  PKRemoteDocumentationViewController *v8;
  PKRemoteDocumentationViewController *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKRemoteDocumentationViewController;
  v8 = -[PKRemoteDocumentationViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_context = a3;
    objc_storeStrong((id *)&v8->_url, a4);
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKRemoteDocumentationViewController;
  -[PKRemoteDocumentationViewController viewDidLoad](&v5, sel_viewDidLoad);
  PKProvisioningBackgroundColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PKRemoteDocumentationViewController setupWebView](self, "setupWebView");
  -[PKRemoteDocumentationViewController setupActivityIndicatorView](self, "setupActivityIndicatorView");
  -[PKRemoteDocumentationViewController setupDismissButton](self, "setupDismissButton");
  -[PKRemoteDocumentationViewController loadContent](self, "loadContent");
}

- (void)setupWebView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  -[PKRemoteDocumentationViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[PKRemoteDocumentationViewController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentInsetAdjustmentBehavior:", 3);

  -[PKRemoteDocumentationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController webView](self, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[PKRemoteDocumentationViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController webView](self, "webView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v25;
  -[PKRemoteDocumentationViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController webView](self, "webView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v20;
  -[PKRemoteDocumentationViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController webView](self, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leftAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v11;
  -[PKRemoteDocumentationViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController webView](self, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addConstraints:", v17);

}

- (void)setupActivityIndicatorView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  -[PKRemoteDocumentationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController activityIndicatorView](self, "activityIndicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[PKRemoteDocumentationViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController activityIndicatorView](self, "activityIndicatorView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  -[PKRemoteDocumentationViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController activityIndicatorView](self, "activityIndicatorView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraints:", v13);

  -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
}

- (void)setupDismissButton
{
  void *v3;
  id v4;

  -[PKRemoteDocumentationViewController dismissButton](self, "dismissButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDocumentationViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v4);

}

- (void)loadContent
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[PKRemoteDocumentationViewController setIsLoading:](self, "setIsLoading:", 1);
  v3 = (void *)MEMORY[0x1E0CB39E0];
  -[PKRemoteDocumentationViewController url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithURL:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[WKWebView loadRequest:](self->_webView, "loadRequest:", v6);
}

- (void)dismiss
{
  -[PKRemoteDocumentationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  -[PKRemoteDocumentationViewController navigation:didFinishWithError:](self, "navigation:didFinishWithError:", a4, 0);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  -[PKRemoteDocumentationViewController navigation:didFinishWithError:](self, "navigation:didFinishWithError:", a4, a5);
}

- (void)navigation:(id)a3 didFinishWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PKRemoteDocumentationViewController_navigation_didFinishWithError___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __69__PKRemoteDocumentationViewController_navigation_didFinishWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setIsLoading:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "url");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v9 = v3;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKRemoteDocumentationViewController - Error trying to load %@: %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "dismissButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);

    return objc_msgSend(*(id *)(a1 + 32), "presentFatalErrorAlert");
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__PKRemoteDocumentationViewController_navigation_didFinishWithError___block_invoke_18;
    v7[3] = &unk_1E3E612E8;
    v7[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, 0.3);
  }
}

void __69__PKRemoteDocumentationViewController_navigation_didFinishWithError___block_invoke_18(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)presentFatalErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__PKRemoteDocumentationViewController_presentFatalErrorAlert__block_invoke;
  v10[3] = &unk_1E3E61D68;
  v10[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v9);
  -[PKRemoteDocumentationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __61__PKRemoteDocumentationViewController_presentFatalErrorAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, int64_t);

  v7 = (void (**)(id, int64_t))a5;
  v7[2](v7, -[PKRemoteDocumentationViewController handleNavigationAction:](self, "handleNavigationAction:", a4));

}

- (int64_t)handleNavigationAction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "navigationType");
  if (v5 == -1)
  {
    v8 = 1;
  }
  else
  {
    if (!v5 && !-[PKRemoteDocumentationViewController isWithinBuddy](self, "isWithinBuddy"))
    {
      objc_msgSend(v4, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKRemoteDocumentationViewController openURLInSafari:](self, "openURLInSafari:", v7);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)isWithinBuddy
{
  -[PKRemoteDocumentationViewController context](self, "context");
  return PKPaymentSetupContextIsSetupAssistant();
}

- (void)openURLInSafari:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CA5878];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:configuration:completionHandler:", v4, 0, 0);

}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
