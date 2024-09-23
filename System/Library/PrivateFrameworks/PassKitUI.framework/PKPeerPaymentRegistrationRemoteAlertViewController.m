@implementation PKPeerPaymentRegistrationRemoteAlertViewController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentRegistrationRemoteAlertViewController;
  -[PKPeerPaymentRegistrationRemoteAlertViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
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
  v3.super_class = (Class)PKPeerPaymentRegistrationRemoteAlertViewController;
  -[PKPeerPaymentRegistrationRemoteAlertViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentRegistrationRemoteAlertViewController;
  -[PKPeerPaymentRegistrationRemoteAlertViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKPeerPaymentRegistrationRemoteAlertViewController _dismiss](self, "_dismiss");
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
  void *v10;
  void *v11;
  PKPeerPaymentRegistrationFlowController *v12;
  PKPeerPaymentRegistrationFlowController *flowController;
  PKPeerPaymentRegistrationFlowController *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRegistrationRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsAlertItems:", 1);
  objc_msgSend(v9, "setAllowsSiri:", 0);
  objc_msgSend(v9, "setAllowsBanners:", 1);
  objc_msgSend(v9, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v9, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v9, "setDismissalAnimationStyle:", 1);
  objc_msgSend(v9, "setWallpaperStyle:withDuration:", 0, 0.0);
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AB98]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v9, "setLaunchingInterfaceOrientation:", objc_msgSend(v10, "integerValue"));
  if (v7)
    v7[2](v7);
  v12 = -[PKPeerPaymentRegistrationFlowController initWithUserInfo:setupDelegate:]([PKPeerPaymentRegistrationFlowController alloc], "initWithUserInfo:setupDelegate:", v8, self);
  flowController = self->_flowController;
  self->_flowController = v12;

  objc_initWeak(&location, self);
  v14 = self->_flowController;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__PKPeerPaymentRegistrationRemoteAlertViewController_configureWithContext_completion___block_invoke;
  v15[3] = &unk_1E3E62638;
  objc_copyWeak(&v16, &location);
  -[PKPeerPaymentRegistrationFlowController preflightWithCompletion:](v14, "preflightWithCompletion:", v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __86__PKPeerPaymentRegistrationRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4 && WeakRetained)
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_dismiss
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__PKPeerPaymentRegistrationRemoteAlertViewController__dismiss__block_invoke;
  v2[3] = &unk_1E3E612E8;
  v2[4] = self;
  -[PKPeerPaymentRegistrationRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

void __62__PKPeerPaymentRegistrationRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
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
  objc_storeStrong((id *)&self->_flowController, 0);
}

@end
