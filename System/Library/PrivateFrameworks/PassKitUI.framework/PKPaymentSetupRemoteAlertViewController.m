@implementation PKPaymentSetupRemoteAlertViewController

- (PKPaymentSetupRemoteAlertViewController)init
{
  PKPaymentSetupRemoteAlertViewController *v2;
  uint64_t v3;
  PKAppProtectionCoordinator *appProtectionCoordinator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupRemoteAlertViewController;
  v2 = -[PKPaymentSetupRemoteAlertViewController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D66A60], "shared");
    v3 = objc_claimAutoreleasedReturnValue();
    appProtectionCoordinator = v2->_appProtectionCoordinator;
    v2->_appProtectionCoordinator = (PKAppProtectionCoordinator *)v3;

    -[PKAppProtectionCoordinator registerObserver:](v2->_appProtectionCoordinator, "registerObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAppProtectionCoordinator unregisterObserver:](self->_appProtectionCoordinator, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupRemoteAlertViewController;
  -[SBUIRemoteAlertServiceViewController dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)PKPaymentSetupRemoteAlertViewController;
  -[PKPaymentSetupRemoteAlertViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    objc_msgSend(v6, "bounds");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    PKSetDisplayProperties();

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupRemoteAlertViewController;
  -[PKPaymentSetupRemoteAlertViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKPaymentSetupRemoteAlertViewController _dismiss](self, "_dismiss");
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
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  PKPaymentSetupNavigationController *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PKAppProtectionCoordinator *appProtectionCoordinator;
  id v28;
  PKPaymentSetupNavigationController *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  PKPaymentSetupNavigationController *v35;
  id v36;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v32 = v6;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsAlertItems:", 1);
  objc_msgSend(v9, "setAllowsAlertStacking:", 1);
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
  v31 = v8;
  objc_msgSend(v8, "objectForKey:", CFSTR("paymentSetupRequest"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v30, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paymentSetupFeatures");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "pk_containsObjectPassingTest:", &__block_literal_global_22);

  if (v14)
    v15 = 4;
  else
    v15 = 0;
  v16 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithWebService:paymentSetupRequest:", v17, v12);

  v19 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v18, 8);
  -[PKPaymentSetupNavigationController setModalInPresentation:](v19, "setModalInPresentation:", 1);
  -[PKPaymentSetupNavigationController setSetupDelegate:](v19, "setSetupDelegate:", self);
  -[PKPaymentSetupNavigationController setPaymentSetupMode:](v19, "setPaymentSetupMode:", v15);
  v20 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    objc_msgSend(v20, "setModalPresentationStyle:", 16);
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMasksToBounds:", 1);

    objc_msgSend(v20, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", 6.0);

  }
  else
  {
    objc_msgSend(v20, "setModalPresentationStyle:", 3);
  }
  objc_msgSend(v20, "addChildViewController:", v19);
  objc_msgSend(v20, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupNavigationController view](v19, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  objc_msgSend(v20, "didMoveToParentViewController:", v19);
  objc_initWeak(&location, self);
  appProtectionCoordinator = self->_appProtectionCoordinator;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __75__PKPaymentSetupRemoteAlertViewController_configureWithContext_completion___block_invoke_2;
  v33[3] = &unk_1E3E63B10;
  objc_copyWeak(&v36, &location);
  v28 = v20;
  v34 = v28;
  v29 = v19;
  v35 = v29;
  -[PKAppProtectionCoordinator isShieldRequiredWithCompletion:](appProtectionCoordinator, "isShieldRequiredWithCompletion:", v33);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

BOOL __75__PKPaymentSetupRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 0;
}

void __75__PKPaymentSetupRemoteAlertViewController_configureWithContext_completion___block_invoke_2(id *a1, int a2)
{
  id *v4;
  id *WeakRetained;
  PKAppProtectionShieldConfiguration *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a1 + 6;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (a2)
    {
      v6 = objc_alloc_init(PKAppProtectionShieldConfiguration);
      -[PKAppProtectionShieldConfiguration setShieldType:](v6, "setShieldType:", 1);
      -[PKAppProtectionShieldConfiguration setDelegate:](v6, "setDelegate:", WeakRetained);
      -[PKAppProtectionShieldConfiguration setShowDismiss:](v6, "setShowDismiss:", 1);
      +[PKAppProtectionShieldViewController createShieldViewControllerWithConfiguration:](PKAppProtectionShieldViewController, "createShieldViewControllerWithConfiguration:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = WeakRetained[122];
      WeakRetained[122] = (id)v7;

      if (WeakRetained[122])
      {
        objc_msgSend(a1[4], "addChildViewController:");
        objc_msgSend(a1[4], "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained[122], "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSubview:", v10);

        objc_msgSend(WeakRetained[122], "didMoveToParentViewController:", a1[4]);
        objc_msgSend(a1[5], "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __75__PKPaymentSetupRemoteAlertViewController_configureWithContext_completion___block_invoke_3;
        v12[3] = &unk_1E3E63AE8;
        objc_copyWeak(&v13, v4);
        objc_msgSend(v11, "setAccessibilityElementsHiddenBlock:", v12);

        objc_destroyWeak(&v13);
      }

    }
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", a1[4], 1, 0);
  }

}

BOOL __75__PKPaymentSetupRemoteAlertViewController_configureWithContext_completion___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = WeakRetained[122] != 0;
  else
    v2 = 0;

  return v2;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)paymentSetupDidFinish:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PKPaymentSetupRemoteAlertViewController _dismiss](self, "_dismiss");
}

- (void)appProtectionCoordinatorDidGainAccess
{
  UIViewController *shieldViewController;
  void *v4;
  UIViewController *v5;

  shieldViewController = self->_shieldViewController;
  if (shieldViewController)
  {
    -[UIViewController view](shieldViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](self->_shieldViewController, "removeFromParentViewController");
    v5 = self->_shieldViewController;
    self->_shieldViewController = 0;

  }
}

- (void)_dismiss
{
  void (**v3)(_QWORD);
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentSetupRemoteAlertViewController__dismiss__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKPaymentSetupRemoteAlertViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PKPaymentSetupRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
  else
    v3[2](v3);

}

void __51__PKPaymentSetupRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
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
  objc_storeStrong((id *)&self->_appProtectionCoordinator, 0);
  objc_storeStrong((id *)&self->_shieldViewController, 0);
}

@end
