@implementation PKPaymentSetupNavigationController

- (PKPaymentSetupNavigationController)init
{

  return 0;
}

- (PKPaymentSetupNavigationController)initWithProvisioningController:(id)a3 context:(int64_t)a4
{
  id v7;
  PKPaymentSetupNavigationController *v8;
  PKPaymentSetupNavigationController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupNavigationController;
  v8 = -[PKPaymentSetupDismissibleNavigationController initWithContext:](&v11, sel_initWithContext_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_provisioningController, a3);
    v9->_showsWelcomeViewController = 1;
    v9->_allowsManualEntry = 1;
    v9->_rootViewControllerNeedsConfiguration = 1;
  }

  return v9;
}

- (int64_t)_preferredModalPresentationStyle
{
  unint64_t v2;

  v2 = -[PKPaymentSetupDismissibleNavigationController context](self, "context");
  if (v2 > 0xA)
    return -2;
  else
    return qword_19DF181C0[v2];
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupNavigationController;
  -[PKPaymentSetupDismissibleNavigationController viewDidLoad](&v3, sel_viewDidLoad);
  PKPaymentSetupApplyContextAppearance(-[PKPaymentSetupDismissibleNavigationController context](self, "context"), self);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupNavigationController;
  -[PKPaymentSetupDismissibleNavigationController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPaymentSetupNavigationController _reconfigureRootViewControllerWithCompletion:](self, "_reconfigureRootViewControllerWithCompletion:", 0);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupNavigationController;
  -[PKPaymentSetupNavigationController viewDidMoveToWindow:shouldAppearOrDisappear:](&v7, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3
    || (-[PKPaymentSetupNavigationController presentedViewController](self, "presentedViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    -[PKPaymentProvisioningController noteProvisioningUserInterfaceDidAppear](self->_provisioningController, "noteProvisioningUserInterfaceDidAppear");
  }
  else
  {
    -[PKPaymentProvisioningController noteProvisioningUserInterfaceDidDisappear](self->_provisioningController, "noteProvisioningUserInterfaceDidDisappear");
  }
}

- (void)_reconfigureRootViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  id v9;
  int64_t v10;
  PKPaymentProvisioningController *provisioningController;
  id WeakRetained;
  void *v13;
  int64_t paymentSetupMode;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMainThread");

  if ((v6 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPaymentSetupNavigationControllerException called off main queue"));
  if (self->_rootViewControllerNeedsConfiguration)
  {
    self->_rootViewControllerNeedsConfiguration = 0;
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke;
    aBlock[3] = &unk_1E3E61590;
    v21 = v4;
    v8 = _Block_copy(aBlock);
    PKTimeProfileBegin();
    v9 = objc_alloc(MEMORY[0x1E0D67540]);
    v10 = -[PKPaymentSetupDismissibleNavigationController context](self, "context");
    provisioningController = self->_provisioningController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_groupsController);
    v13 = (void *)objc_msgSend(v9, "initWithEnvironment:provisioningController:groupsController:", v10, provisioningController, WeakRetained);

    paymentSetupMode = self->_paymentSetupMode;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke_2;
    v18[3] = &unk_1E3E61590;
    v15 = v8;
    v19 = v15;
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke_3;
    v16[3] = &unk_1E3E61310;
    objc_copyWeak(&v17, &location);
    +[PKProvisioningFlowBridge startPaymentSetupFlowWithNavController:context:mode:preflightCompletion:completion:](PKProvisioningFlowBridge, "startPaymentSetupFlowWithNavController:context:mode:preflightCompletion:completion:", self, v13, paymentSetupMode, v18, v16);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }

}

uint64_t __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t result;

  PKLogFacilityTypeGetObject();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)PKTimeProfileEnd();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__PKPaymentSetupNavigationController__reconfigureRootViewControllerWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", WeakRetained);
    WeakRetained = v2;
  }

}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PKPaymentSetupNavigationController_preflightWithCompletion___block_invoke;
  v6[3] = &unk_1E3E61590;
  v7 = v4;
  v5 = v4;
  -[PKPaymentSetupNavigationController _reconfigureRootViewControllerWithCompletion:](self, "_reconfigureRootViewControllerWithCompletion:", v6);

}

uint64_t __62__PKPaymentSetupNavigationController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)setPaymentSetupMode:(int64_t)a3
{
  if (self->_paymentSetupMode != a3)
  {
    self->_paymentSetupMode = a3;
    if ((unint64_t)(a3 - 2) <= 3)
      -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](self, "setShowsWelcomeViewController:", 0);
  }
}

- (void)setShowsWelcomeViewController:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_showsWelcomeViewController != a3)
  {
    self->_showsWelcomeViewController = a3;
    if (!self->_rootViewControllerNeedsConfiguration)
    {
      PKLogFacilityTypeGetObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupNavigationController: WARNING: setShowsWelcomeViewController called after view configured", v4, 2u);
      }

    }
  }
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_allowsManualEntry != a3)
  {
    self->_allowsManualEntry = a3;
    if (!self->_rootViewControllerNeedsConfiguration)
    {
      PKLogFacilityTypeGetObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupNavigationController: WARNING: setAllowsManualEntry called after view configured", v4, 2u);
      }

    }
  }
}

- (void)cancelButtonPressed:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  char v7;
  void *v8;
  id v9;
  id v10;
  objc_super v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained((id *)&self->_setupDelegate);
      objc_msgSend(v9, "paymentSetupDidFinish:withError:", self, v8);

    }
    else
    {
      v10 = objc_loadWeakRetained((id *)&self->_setupDelegate);
      objc_msgSend(v10, "paymentSetupDidFinish:", self);

    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPaymentSetupNavigationController;
    -[PKPaymentSetupDismissibleNavigationController cancelButtonPressed:](&v11, sel_cancelButtonPressed_, v4);
  }

}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  PKPaymentSetupDelegate **p_setupDelegate;
  id WeakRetained;
  id v6;
  void *v7;

  p_setupDelegate = &self->_setupDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_setupDelegate);
    objc_msgSend(v6, "paymentSetupDidFinish:", self);

    objc_storeWeak((id *)p_setupDelegate, 0);
  }
  else
  {
    -[PKPaymentSetupNavigationController presentingViewController](self, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  -[PKPaymentProvisioningController noteProvisioningUserInterfaceDidDisappear](self->_provisioningController, "noteProvisioningUserInterfaceDidDisappear");
}

- (void)viewController:(id)a3 requestPresentPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  PKPaymentSetupDelegate **p_setupDelegate;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  id v13;
  id v14;

  v14 = a4;
  v7 = a5;
  p_setupDelegate = &self->_setupDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_setupDelegate);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained((id *)p_setupDelegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)p_setupDelegate);
      objc_msgSend(v13, "paymentSetupRequestPresentPassUniqueIdentifier:completion:", v14, v7);

    }
  }

}

- (BOOL)viewController:(id)a3 requestsReturnToPresentationMarker:(unint64_t)a4 reset:(BOOL)a5
{
  if (a5)
    -[PKPaymentProvisioningController reset](self->_provisioningController, "reset", a3);
  return -[UINavigationController _pk_popToViewControllerPresentationMarker:animated:](self, "_pk_popToViewControllerPresentationMarker:animated:", a4, 1);
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  PKPaymentSetupDelegate **p_setupDelegate;
  id WeakRetained;
  id v6;
  char v7;
  id v8;
  id v9;

  p_setupDelegate = &self->_setupDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_setupDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 1, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_loadWeakRetained((id *)p_setupDelegate);
      objc_msgSend(v8, "paymentSetupDidFinish:withError:", self, v9);

    }
    else
    {
      v9 = objc_loadWeakRetained((id *)p_setupDelegate);
      objc_msgSend(v9, "paymentSetupDidFinish:", self);
    }
  }
  else
  {
    -[PKPaymentSetupNavigationController presentingViewController](self, "presentingViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)viewController:(id)a3 didShowProvisioningError:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained
    && (v8 = WeakRetained,
        v9 = objc_loadWeakRetained((id *)&self->_setupDelegate),
        v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0)
    && (-[PKPaymentSetupDismissibleNavigationController context](self, "context"),
        !PKPaymentSetupContextIsBridge()))
  {
    v11 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    objc_msgSend(v11, "paymentSetupDidShowError:", v6);

  }
  else
  {
    -[PKPaymentSetupNavigationController viewControllerDidTerminateSetupFlow:](self, "viewControllerDidTerminateSetupFlow:", v12);
  }

}

- (void)viewControllerDidShowEligibilityIssue:(id)a3
{
  PKPaymentSetupDelegate **p_setupDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_setupDelegate = &self->_setupDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_setupDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_setupDelegate);
      objc_msgSend(v8, "paymentSetupDidShowEligibilityIssue");

    }
  }
}

- (void)viewController:(id)a3 requestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "paymentSetupRequestPasscodeUpgradeForPasscodeUpgradeFlowController:withVisibleViewController:completion:", v8, v11, v9);

}

- (void)viewController:(id)a3 didExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a4 withShouldContinue:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v9;
  id WeakRetained;
  id v11;

  v7 = a5;
  v11 = a4;
  v9 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "paymentSetupDidExitPasscodeUpgradeForPasscodeUpgradeFlowController:withShouldContinue:error:", v11, v7, v9);

}

- (void)viewController:(id)a3 requestPasscodeUpgradeWithCompletion:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "paymentSetupRequestPasscodeUpgradeWithVisibleViewController:completion:", v8, v6);

}

- (void)viewController:(id)a3 didExitPasscodeUpgradeWithShouldContinue:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id WeakRetained;
  id v8;

  v5 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "paymentSetupDidExitPasscodeUpgradeWithShouldContinue:error:", v5, v8);

}

+ (id)viewControllerForPresentingPaymentError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

  if (!v5)
  {
    PKLocalizedPaymentString(CFSTR("COULD_NOT_SET_UP_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("COULD_NOT_SET_UP_MESSAGE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

    if (v10)
    {
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
      v11 = objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v17 = v8;
      v7 = (void *)v11;
      v8 = (void *)v12;
      goto LABEL_16;
    }
    objc_msgSend(v3, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D6BCB8]);

    if (v14)
    {
      v15 = objc_msgSend(v3, "code");
      if ((unint64_t)(v15 - 2) >= 4 && v15)
      {
        if (v15 == 1)
        {
          PKLocalizedPaymentString(CFSTR("COULD_NOT_SET_UP_TITLE"));
          v16 = objc_claimAutoreleasedReturnValue();

          v17 = v8;
          v7 = (void *)v16;
          v8 = 0;
LABEL_16:

        }
LABEL_17:
        PKDisplayableErrorCustom();
        v6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      objc_msgSend(v3, "localizedFailureReason");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        goto LABEL_17;
    }
    else
    {
      objc_msgSend(v3, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D6B0B8]))
        goto LABEL_16;
      objc_msgSend(v3, "localizedFailureReason");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_17;
    }
    objc_msgSend(v3, "localizedFailureReason");
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "localizedRecoverySuggestion");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v6 = v3;
LABEL_18:
  v20 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);

  return v20;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKGroupsController)groupsController
{
  return (PKGroupsController *)objc_loadWeakRetained((id *)&self->_groupsController);
}

- (void)setGroupsController:(id)a3
{
  objc_storeWeak((id *)&self->_groupsController, a3);
}

- (PKPaymentSetupDelegate)setupDelegate
{
  return (PKPaymentSetupDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (BOOL)showsWelcomeViewController
{
  return self->_showsWelcomeViewController;
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (int64_t)paymentSetupMode
{
  return self->_paymentSetupMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_destroyWeak((id *)&self->_groupsController);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
