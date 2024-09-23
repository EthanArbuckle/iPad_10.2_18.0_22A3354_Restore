@implementation PKPasscodeUpgradeFlowController

- (PKPasscodeUpgradeFlowController)init
{

  return 0;
}

- (PKPasscodeUpgradeFlowController)initWithPaymentProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 flowRenderer:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPasscodeUpgradeFlowController *v17;
  PKPasscodeUpgradeFlowController *v18;
  void *v19;
  id completionHandler;
  objc_super v22;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PKPasscodeUpgradeFlowController;
  v17 = -[PKPasscodeUpgradeFlowController init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_context = a4;
    objc_storeStrong((id *)&v17->_provisioningController, a3);
    objc_storeWeak((id *)&v18->_setupDelegate, v14);
    v19 = _Block_copy(v16);
    completionHandler = v18->_completionHandler;
    v18->_completionHandler = v19;

    objc_storeWeak((id *)&v18->_flowRenderer, v15);
  }

  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPasscodeUpgradeFlowController;
  -[PKPasscodeUpgradeFlowController dealloc](&v4, sel_dealloc);
}

- (void)showPasscodeUpgradeFlow
{
  -[PKPasscodeUpgradeFlowController showPasscodeUpgradeFlow:](self, "showPasscodeUpgradeFlow:", 0);
}

- (void)forceShowPasscodeUpgradeFlow
{
  -[PKPasscodeUpgradeFlowController showPasscodeUpgradeFlow:](self, "showPasscodeUpgradeFlow:", 1);
}

- (void)showPasscodeUpgradeFlow:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  NSObject *v12;
  _BOOL4 upgradeRequiredToAddNewPass;
  PKPaymentProvisioningController *provisioningController;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id location;
  uint8_t buf[4];
  PKPasscodeUpgradeFlowController *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC4768];
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_dismissPasscodeUpgradeFlow, v6, 0);

  v8 = -[PKPaymentProvisioningController isPasscodeUpgradeRequired](self->_provisioningController, "isPasscodeUpgradeRequired");
  if (v3)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "%@: Force beginning passcode upgrade flow", buf, 0xCu);
    }

    -[PKPasscodeUpgradeFlowController _showPasscodeUpgradeExplanation](self, "_showPasscodeUpgradeExplanation");
  }
  else
  {
    v10 = v8;
    if (self->_upgradeRequiredToAddNewPass)
      v11 = 1;
    else
      v11 = v8;
    if (v11 == 1)
    {
      objc_initWeak(&location, self);
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        upgradeRequiredToAddNewPass = self->_upgradeRequiredToAddNewPass;
        *(_DWORD *)buf = 138412802;
        v20 = self;
        v21 = 1024;
        v22 = v10;
        v23 = 1024;
        v24 = upgradeRequiredToAddNewPass;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "%@: Preflighting passcode upgrade (strong passcode required for added pass: %d, strong passcode required to add new pass: %d)", buf, 0x18u);
      }

      provisioningController = self->_provisioningController;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __59__PKPasscodeUpgradeFlowController_showPasscodeUpgradeFlow___block_invoke;
      v16[3] = &unk_1E3E7AC10;
      objc_copyWeak(&v17, &location);
      v16[4] = self;
      -[PKPaymentProvisioningController preflightPasscodeUpgradeWithCompletion:](provisioningController, "preflightPasscodeUpgradeWithCompletion:", v16);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = self;
        _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "%@: Skipping passcode upgrade", buf, 0xCu);
      }

      -[PKPasscodeUpgradeFlowController _completeWithShouldContinue:error:](self, "_completeWithShouldContinue:error:", 1, 0);
    }
  }
}

void __59__PKPasscodeUpgradeFlowController_showPasscodeUpgradeFlow___block_invoke(uint64_t a1, int a2, char a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7 || !a2)
    {
      PKLogFacilityTypeGetObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v19 = v16;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "%@: Passcode upgrade failed with error: %@", buf, 0x16u);
      }

      v12 = v9;
      v13 = 0;
      v14 = v7;
    }
    else
    {
      if ((a3 & 1) == 0)
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __59__PKPasscodeUpgradeFlowController_showPasscodeUpgradeFlow___block_invoke_2;
        v17[3] = &unk_1E3E61388;
        v17[4] = *(_QWORD *)(a1 + 32);
        v17[5] = WeakRetained;
        dispatch_async(MEMORY[0x1E0C80D38], v17);
        goto LABEL_13;
      }
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "%@: Passcode upgrade flow not needed - passcode meets requirements", buf, 0xCu);
      }

      v12 = v9;
      v13 = 1;
      v14 = 0;
    }
    objc_msgSend(v12, "_completeWithShouldContinue:error:", v13, v14);
  }
LABEL_13:

}

uint64_t __59__PKPasscodeUpgradeFlowController_showPasscodeUpgradeFlow___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "%@: Beginning passcode upgrade flow", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_showPasscodeUpgradeExplanation");
}

- (void)dismissPasscodeUpgradeFlow
{
  NSObject *v3;
  int v4;
  PKPasscodeUpgradeFlowController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "%@: Dismissing passcode upgrade flow", (uint8_t *)&v4, 0xCu);
  }

  -[PKPasscodeUpgradeFlowController _completeWithShouldContinue:error:](self, "_completeWithShouldContinue:error:", 0, 0);
}

- (void)beginShowingViewController
{
  NSObject *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Passcode Upgrade Flow: Beginning showing view controller", v4, 2u);
  }

  ++self->_presentedViewControllerCount;
}

- (void)endedShowingViewController
{
  NSObject *v3;
  int64_t presentedViewControllerCount;
  uint8_t v5[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Passcode Upgrade Flow: Ended showing view controller", buf, 2u);
  }

  presentedViewControllerCount = self->_presentedViewControllerCount;
  self->_presentedViewControllerCount = presentedViewControllerCount - 1;
  if (presentedViewControllerCount <= 1 && self->_completionHandler)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Passcode Upgrade Flow: Last view controller removed, dismissing flow...", v5, 2u);
    }

    -[PKPasscodeUpgradeFlowController dismissPasscodeUpgradeFlow](self, "dismissPasscodeUpgradeFlow");
  }
}

- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  void *v2;
  void *v3;

  -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaymentWebServiceTargetDeviceProtocol *)v3;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4;

  objc_msgSend(a3, "pk_zString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPasscodeUpgradeFlowController _showNewDevicePasscodeViewControllerWithCurrentPasscode:](self, "_showNewDevicePasscodeViewControllerWithCurrentPasscode:", v4);

}

- (void)newDevicePasscodeViewController:(id)a3 didFinishSettingPasscode:(BOOL)a4 withError:(id)a5
{
  -[PKPasscodeUpgradeFlowController _completeWithShouldContinue:error:](self, "_completeWithShouldContinue:error:", a4, a5);
}

- (void)_completeWithShouldContinue:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PKPasscodeUpgradeFlowController *v13;
  id v14;
  BOOL v15;
  uint8_t buf[4];
  PKPasscodeUpgradeFlowController *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v17 = self;
    v18 = 2112;
    if (v4)
      v8 = CFSTR("YES");
    v19 = v8;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "%@: Called complete with shouldContinue:%@ error:%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);

  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PKPasscodeUpgradeFlowController__completeWithShouldContinue_error___block_invoke;
  v11[3] = &unk_1E3E625C0;
  objc_copyWeak(&v14, (id *)buf);
  v15 = v4;
  v12 = v6;
  v13 = self;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __69__PKPasscodeUpgradeFlowController__completeWithShouldContinue_error___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id v5;
  id v6;
  int v7;
  id v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  id *v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v14 = WeakRetained;
    objc_msgSend(WeakRetained[2], "passcodeUpgradeCompleted:", *(unsigned __int8 *)(a1 + 56));
    v4 = v14[3];
    if (v4)
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
      v5 = v14[3];
      v14[3] = 0;

      v6 = v14[8];
      v14[8] = 0;

    }
    v7 = objc_msgSend(*(id *)(a1 + 40), "_isWatchTarget");
    v3 = v14;
    if (v7)
    {
      v8 = objc_loadWeakRetained(v14 + 7);
      v9 = objc_opt_respondsToSelector();

      v10 = objc_loadWeakRetained(v14 + 7);
      if ((v9 & 1) != 0)
      {
        v11 = objc_loadWeakRetained(v14 + 5);
        objc_msgSend(v11, "topViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "viewController:didExitPasscodeUpgradeForPasscodeUpgradeFlowController:withShouldContinue:error:", v12, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
LABEL_9:

        v3 = v14;
        goto LABEL_10;
      }
      v13 = objc_opt_respondsToSelector();

      v3 = v14;
      if ((v13 & 1) != 0)
      {
        v10 = objc_loadWeakRetained(v14 + 7);
        v11 = objc_loadWeakRetained(v14 + 5);
        objc_msgSend(v11, "topViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "viewController:didExitPasscodeUpgradeWithShouldContinue:error:", v12, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
        goto LABEL_9;
      }
    }
  }
LABEL_10:

}

- (void)_showPasscodeUpgradeExplanation
{
  PKPasscodeUpgradeExplanationViewController *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD aBlock[4];
  id v15;
  id v16;
  id from;
  id location;

  objc_initWeak(&location, self);
  v3 = -[PKPasscodeUpgradeExplanationViewController initWithPasscodeUpgradeFlowController:isForWatch:]([PKPasscodeUpgradeExplanationViewController alloc], "initWithPasscodeUpgradeFlowController:isForWatch:", self, -[PKPasscodeUpgradeFlowController _isWatchTarget](self, "_isWatchTarget"));
  -[PKExplanationViewController setShowCancelButton:](v3, "setShowCancelButton:", 0);
  -[PKExplanationViewController setShowDoneButton:](v3, "setShowDoneButton:", 0);
  -[PKPasscodeUpgradeExplanationViewController setUpgradeRequiredToAddNewPass:](v3, "setUpgradeRequiredToAddNewPass:", self->_upgradeRequiredToAddNewPass);
  objc_initWeak(&from, v3);
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke;
  aBlock[3] = &unk_1E3E71770;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  v5 = _Block_copy(aBlock);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_22;
  v11[3] = &unk_1E3E61C80;
  objc_copyWeak(&v13, &location);
  v6 = v5;
  v12 = v6;
  -[PKPasscodeUpgradeExplanationViewController setContinuationHandler:](v3, "setContinuationHandler:", v11);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_38;
  v9[3] = &unk_1E3E61590;
  v7 = v6;
  v10 = v7;
  -[PKPasscodeUpgradeExplanationViewController setSetupLaterHandler:](v3, "setSetupLaterHandler:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowRenderer);
  objc_msgSend(WeakRetained, "pushViewController:animated:", v3, 1);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

void __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void (**v9)(void);
  id v10;
  void *v11;
  int v12;
  id *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = WeakRetained;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@: Terminating setup flow", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", WeakRetained, *MEMORY[0x1E0DC4768], 0);

    objc_msgSend(WeakRetained[2], "passcodeUpgradeCompleted:", 0);
    v6 = WeakRetained[3];
    WeakRetained[3] = 0;

    v7 = objc_loadWeakRetained(WeakRetained + 7);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "viewControllerDidTerminateSetupFlow:", v3);
    }
    else
    {
      v9 = (void (**)(void))WeakRetained[8];
      if (v9)
      {
        v9[2]();
        v10 = WeakRetained[8];
        WeakRetained[8] = 0;

      }
      else
      {
        objc_msgSend(v3, "presentingViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);

      }
    }

  }
}

void __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_22(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "_isWatchTarget");

  if ((v4 & 1) != 0)
  {
    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "_showChangePasscodeFlow");

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v15[0] = &unk_1E3FADFF0;
    PKLocalizedShareableCredentialString(CFSTR("LOCAL_AUTHENTICATION_REASON"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v15[1] = &unk_1E3FAE008;
    PKLocalizedString(CFSTR("WALLET"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    v15[2] = &unk_1E3FAE020;
    v16[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_32;
    v11[3] = &unk_1E3E7AC38;
    v9 = v5;
    v12 = v9;
    objc_copyWeak(&v14, v2);
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v9, "evaluatePolicy:options:reply:", 1025, v8, v11);

    objc_destroyWeak(&v14);
  }
}

void __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_32(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_2;
  v6[3] = &unk_1E3E66F40;
  v7 = v4;
  v8 = a1[4];
  v5 = v4;
  objc_copyWeak(&v10, a1 + 6);
  v9 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v10);
}

void __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  id WeakRetained;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("N");
    if (!v2)
      v4 = CFSTR("Y");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPasscodeUpgradeFlowController requested local auth and returning %@.", (uint8_t *)&v6, 0xCu);
  }

  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_showChangePasscodeFlow");

  }
}

uint64_t __66__PKPasscodeUpgradeFlowController__showPasscodeUpgradeExplanation__block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_showChangePasscodeFlow
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (-[PKPasscodeUpgradeFlowController _isWatchTarget](self, "_isWatchTarget"))
  {
    -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_flowRenderer);
      objc_msgSend(v6, "topViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke;
      v23[3] = &unk_1E3E65F18;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v5, "requestPasscodeUpgradeForPasscodeUpgradeFlowController:withVisibleViewController:completion:", self, v7, v23);

      objc_destroyWeak(&v24);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_flowRenderer);
      objc_msgSend(v10, "topViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_2;
      v21[3] = &unk_1E3E65F18;
      objc_copyWeak(&v22, &location);
      objc_msgSend(WeakRetained, "viewController:requestPasscodeUpgradeForPasscodeUpgradeFlowController:completion:", v11, self, v21);

      objc_destroyWeak(&v22);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_flowRenderer);
      objc_msgSend(v12, "topViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_3;
      v19[3] = &unk_1E3E65F18;
      objc_copyWeak(&v20, &location);
      objc_msgSend(WeakRetained, "viewController:requestPasscodeUpgradeWithCompletion:", v13, v19);

      objc_destroyWeak(&v20);
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("Error: setup delegate does not support viewController:requestPasscodeUpgradeForPasscodeUpgradeFlowController:completion:");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPasscodeUpgradeFlowController _completeWithShouldContinue:error:](self, "_completeWithShouldContinue:error:", 0, v16);
    }

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_flowRenderer);
    objc_msgSend(v8, "topViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_4;
    v17[3] = &unk_1E3E6F7D8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(WeakRetained, "viewController:willPerformPasscodeUpgradeWithCompletionHandler:", v9, v17);

    objc_destroyWeak(&v18);
  }
  else
  {
    -[PKPasscodeUpgradeFlowController _showCurrentDevicePasscodeViewController](self, "_showCurrentDevicePasscodeViewController");
  }

  objc_destroyWeak(&location);
}

void __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_completeWithShouldContinue:error:", a2, v5);

}

void __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_completeWithShouldContinue:error:", a2, v5);

}

void __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_completeWithShouldContinue:error:", a2, v5);

}

void __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  char v9;
  _QWORD v10[5];
  id v11;
  char v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "pk_zString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v7 = objc_msgSend(v6, "unlockDeviceWithPasscode:outError:", v5, &v13);
      v8 = v13;

      if (v8)
        v9 = 0;
      else
        v9 = v7;
    }
    else
    {
      v9 = 0;
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_5;
    v10[3] = &unk_1E3E64908;
    v12 = v9;
    v10[4] = WeakRetained;
    v3 = v5;
    v11 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __58__PKPasscodeUpgradeFlowController__showChangePasscodeFlow__block_invoke_5(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_showNewDevicePasscodeViewControllerWithCurrentPasscode:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v3, "_showCurrentDevicePasscodeViewController");
}

- (void)_showCurrentDevicePasscodeViewController
{
  id WeakRetained;
  PKCurrentDevicePasscodeViewController *v4;

  v4 = -[PKCurrentDevicePasscodeViewController initWithPasscodeUpgradeFlowController:]([PKCurrentDevicePasscodeViewController alloc], "initWithPasscodeUpgradeFlowController:", self);
  -[DevicePINController setPinDelegate:](v4, "setPinDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowRenderer);
  objc_msgSend(WeakRetained, "pushViewController:animated:", v4, 1);

}

- (void)_showNewDevicePasscodeViewControllerWithCurrentPasscode:(id)a3
{
  id v4;
  PKNewDevicePasscodeViewController *v5;
  id WeakRetained;
  PKNewDevicePasscodeViewController *v7;

  v4 = a3;
  v5 = [PKNewDevicePasscodeViewController alloc];
  v7 = -[PKNewDevicePasscodeViewController initWithPasscodeUpgradeFlowController:minimumPasscodeLength:withCurrentPasscode:](v5, "initWithPasscodeUpgradeFlowController:minimumPasscodeLength:withCurrentPasscode:", self, *MEMORY[0x1E0D6BB78], v4);

  -[PKNewDevicePasscodeViewController setDelegate:](v7, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowRenderer);
  objc_msgSend(WeakRetained, "pushViewController:animated:", v7, 1);

}

- (BOOL)_isWatchTarget
{
  void *v2;
  void *v3;
  void *v4;
  char IsWatch;

  -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "deviceClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsWatch = PKDeviceClassIsWatch();

  return IsWatch;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (int64_t)context
{
  return self->_context;
}

- (id)setupLaterHandler
{
  return self->_setupLaterHandler;
}

- (void)setSetupLaterHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)upgradeRequiredToAddNewPass
{
  return self->_upgradeRequiredToAddNewPass;
}

- (void)setUpgradeRequiredToAddNewPass:(BOOL)a3
{
  self->_upgradeRequiredToAddNewPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setupLaterHandler, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_destroyWeak((id *)&self->_flowRenderer);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
