@implementation PKPeerPaymentIdentityVerificationRemoteAlertViewController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentIdentityVerificationRemoteAlertViewController;
  -[PKPeerPaymentIdentityVerificationRemoteAlertViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
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
  v3.super_class = (Class)PKPeerPaymentIdentityVerificationRemoteAlertViewController;
  -[PKPeerPaymentIdentityVerificationRemoteAlertViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentIdentityVerificationRemoteAlertViewController;
  -[PKPeerPaymentIdentityVerificationRemoteAlertViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKPeerPaymentIdentityVerificationRemoteAlertViewController _dismiss](self, "_dismiss");
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
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PKPeerPaymentWebService *v12;
  PKPeerPaymentWebService *webService;
  void *v14;
  void *v15;
  NSObject *v16;
  PKPeerPaymentIdentityVerificationController *v17;
  PKPeerPaymentIdentityVerificationController *controller;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  -[PKPeerPaymentIdentityVerificationRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 1;
  objc_msgSend(v8, "setAllowsAlertItems:", 1);
  objc_msgSend(v8, "setAllowsBanners:", 1);
  objc_msgSend(v8, "setAllowsSiri:", 0);
  objc_msgSend(v8, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v8, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v8, "setDismissalAnimationStyle:", 1);
  objc_msgSend(v8, "setWallpaperStyle:withDuration:", 0, 0.0);
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AB98]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    if (!v11)
      goto LABEL_5;
    v10 = objc_msgSend(v11, "integerValue");
  }
  objc_msgSend(v8, "setLaunchingInterfaceOrientation:", v10);
LABEL_5:
  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v12 = (PKPeerPaymentWebService *)objc_claimAutoreleasedReturnValue();
  webService = self->_webService;
  self->_webService = v12;

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D6ABE0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67420]), "initWithData:", v14);
  PKLogFacilityTypeGetObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v15;
    _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Creating remote view controller for PKPeerPaymentIdentityVerificationResponse: %@", buf, 0xCu);
  }

  if (v6)
    v6[2](v6);
  v17 = -[PKPeerPaymentIdentityVerificationController initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:]([PKPeerPaymentIdentityVerificationController alloc], "initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:", self->_webService, v15, self, 0, 0);
  controller = self->_controller;
  self->_controller = v17;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__PKPeerPaymentIdentityVerificationRemoteAlertViewController_configureWithContext_completion___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __94__PKPeerPaymentIdentityVerificationRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "firstViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PKDeviceSupportsPeerPaymentIdentityVerification() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "pk_navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pushViewController:animated:", v2, 0);

      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984), 1, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_alertViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "presentViewController:animated:completion:", v6, 1, 0);

    }
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __94__PKPeerPaymentIdentityVerificationRemoteAlertViewController_configureWithContext_completion___block_invoke_2;
    v7[3] = &unk_1E3E612E8;
    v7[4] = *(_QWORD *)(a1 + 32);
    PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);

  }
}

void __94__PKPeerPaymentIdentityVerificationRemoteAlertViewController_configureWithContext_completion___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (id)pk_navigationController
{
  PKNavigationController *navController;
  PKNavigationController *v4;
  PKNavigationController *v5;

  navController = self->_navController;
  if (!navController)
  {
    v4 = objc_alloc_init(PKNavigationController);
    v5 = self->_navController;
    self->_navController = v4;

    -[PKNavigationController setSupportedInterfaceOrientations:](self->_navController, "setSupportedInterfaceOrientations:", 2);
    -[PKNavigationController setModalInPresentation:](self->_navController, "setModalInPresentation:", 1);
    navController = self->_navController;
  }
  return navController;
}

- (void)handleButtonActions:(id)a3
{
  id v4;

  -[PKPeerPaymentIdentityVerificationController captureController](self->_controller, "captureController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "state") == 5)
    objc_msgSend(v4, "userWantsToCancel");
  else
    -[PKPeerPaymentIdentityVerificationRemoteAlertViewController _dismiss](self, "_dismiss");

}

- (void)_dismiss
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__PKPeerPaymentIdentityVerificationRemoteAlertViewController__dismiss__block_invoke;
  v2[3] = &unk_1E3E612E8;
  v2[4] = self;
  -[PKPeerPaymentIdentityVerificationRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

void __70__PKPeerPaymentIdentityVerificationRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
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

- (id)_alertViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_ERROR_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_ERROR_MESSAGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PKPeerPaymentIdentityVerificationRemoteAlertViewController__alertViewController__block_invoke;
  v10[3] = &unk_1E3E61D68;
  v10[4] = self;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  return v5;
}

void __82__PKPeerPaymentIdentityVerificationRemoteAlertViewController__alertViewController__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
