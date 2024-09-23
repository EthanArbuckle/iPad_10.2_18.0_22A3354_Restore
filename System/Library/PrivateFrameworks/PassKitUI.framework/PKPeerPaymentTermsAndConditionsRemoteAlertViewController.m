@implementation PKPeerPaymentTermsAndConditionsRemoteAlertViewController

- (PKPeerPaymentTermsAndConditionsRemoteAlertViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentTermsAndConditionsRemoteAlertViewController;
  return -[PKPeerPaymentTermsAndConditionsRemoteAlertViewController init](&v3, sel_init);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentTermsAndConditionsRemoteAlertViewController;
  -[PKPeerPaymentTermsAndConditionsRemoteAlertViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    objc_msgSend(v6, "bounds");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    PKSetDisplayProperties();

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentTermsAndConditionsRemoteAlertViewController;
  -[PKPeerPaymentTermsAndConditionsRemoteAlertViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentTermsAndConditionsRemoteAlertViewController;
  -[PKPeerPaymentTermsAndConditionsRemoteAlertViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKPeerPaymentTermsAndConditionsRemoteAlertViewController _dismiss](self, "_dismiss");
}

- (unint64_t)supportedInterfaceOrientations
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKPeerPaymentTermsController *v18;
  PKPeerPaymentTermsController *termsController;
  PKPeerPaymentTermsController *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v23 = v6;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentTermsAndConditionsRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 1;
  objc_msgSend(v9, "setAllowsAlertItems:", 1);
  objc_msgSend(v9, "setAllowsSiri:", 0);
  objc_msgSend(v9, "setAllowsBanners:", 1);
  objc_msgSend(v9, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v9, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v9, "setDismissalAnimationStyle:", 1);
  objc_msgSend(v9, "setWallpaperStyle:withDuration:", 0, 0.0);
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AB98]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    if (!v11)
      goto LABEL_5;
    v10 = objc_msgSend(v11, "integerValue");
  }
  objc_msgSend(v9, "setLaunchingInterfaceOrientation:", v10);
LABEL_5:
  v21 = v11;
  if (v7)
    v7[2](v7);
  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v8, "objectForKey:", CFSTR("termsURL"), v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("termsIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("passUniqueID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PKPeerPaymentTermsController initWithTermsURL:termsIdentifier:passUniqueID:webService:]([PKPeerPaymentTermsController alloc], "initWithTermsURL:termsIdentifier:passUniqueID:webService:", v14, v15, v16, v17);
  termsController = self->_termsController;
  self->_termsController = v18;

  objc_initWeak(&location, self);
  v20 = self->_termsController;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __92__PKPeerPaymentTermsAndConditionsRemoteAlertViewController_configureWithContext_completion___block_invoke;
  v24[3] = &unk_1E3E634A8;
  objc_copyWeak(&v25, &location);
  -[PKPeerPaymentTermsController presentTermsOverController:showInterstitialViewController:withCompletionHandler:](v20, "presentTermsOverController:showInterstitialViewController:withCompletionHandler:", self, 1, v24);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __92__PKPeerPaymentTermsAndConditionsRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((unint64_t)(a2 - 1) <= 1 && WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_dismiss");
    WeakRetained = v4;
  }

}

- (void)_dismiss
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__PKPeerPaymentTermsAndConditionsRemoteAlertViewController__dismiss__block_invoke;
  v2[3] = &unk_1E3E612E8;
  v2[4] = self;
  -[PKPeerPaymentTermsAndConditionsRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

void __68__PKPeerPaymentTermsAndConditionsRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
}

@end
