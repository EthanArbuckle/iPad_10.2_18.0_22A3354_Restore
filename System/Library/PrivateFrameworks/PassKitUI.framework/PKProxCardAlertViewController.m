@implementation PKProxCardAlertViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
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
  v8.super_class = (Class)PKProxCardAlertViewController;
  -[PKProxCardAlertViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
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
  v4.super_class = (Class)PKProxCardAlertViewController;
  -[PKProxCardAlertViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKProxCardAlertViewController _dismiss](self, "_dismiss");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
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
  id v14;
  _QWORD v15[5];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[PKProxCardAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsAlertItems:", 1);
  objc_msgSend(v8, "setAllowsSiri:", 0);
  objc_msgSend(v8, "setAllowsBanners:", 1);
  objc_msgSend(v8, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v8, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v8, "setDismissalAnimationStyle:", 0);
  objc_msgSend(v8, "setWallpaperStyle:withDuration:", 0, 0.0);
  objc_msgSend(v8, "setLaunchingInterfaceOrientation:", 1);
  if (v7)
    v7[2](v7);
  objc_msgSend(v6, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D6ABC8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProxCardAlertViewController _proxCardControllerForRequest:](self, "_proxCardControllerForRequest:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__PKProxCardAlertViewController_configureWithContext_completion___block_invoke;
    v15[3] = &unk_1E3E75948;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0D83140], "actionWithTitle:style:handler:", &stru_1E3E7D690, 0, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDismissButtonAction:", v13);

    v14 = (id)-[PKProxCardAlertViewController presentProxCardFlowWithDelegate:initialViewController:](self, "presentProxCardFlowWithDelegate:initialViewController:", self, v12);
  }
  else
  {
    -[PKProxCardAlertViewController _dismiss](self, "_dismiss");
  }

}

uint64_t __65__PKProxCardAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

- (void)_dismiss
{
  void (**v3)(_QWORD);
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PKProxCardAlertViewController__dismiss__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKProxCardAlertViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PKProxCardAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
  else
    v3[2](v3);

}

void __41__PKProxCardAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (id)_proxCardControllerForRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PKVehicleInitiatedPairingViewController *v8;

  v3 = a3;
  if (objc_msgSend(v3, "proxCardType") == 1)
  {
    v4 = v3;
    objc_msgSend(v4, "supportedTerminal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "referralSource");

    objc_msgSend(v5, "vehicleInitiatedPairingLaunchURLWithReferralSource:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKVehicleInitiatedPairingViewController initWithSupportedTerminal:launchURL:referralSource:didDismiss:]([PKVehicleInitiatedPairingViewController alloc], "initWithSupportedTerminal:launchURL:referralSource:didDismiss:", v5, v7, v6, 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
