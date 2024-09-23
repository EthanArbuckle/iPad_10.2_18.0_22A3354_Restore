@implementation PKPaymentSetupAssistantRegistrationViewController

+ (id)defaultWebServiceForContext:(int64_t)a3
{
  id v3;
  void *v4;

  if (PKPaymentSetupContextIsBridge())
  {
    v3 = objc_alloc_init(getNPKCompanionAgentConnectionClass());
    objc_msgSend(v3, "watchPaymentWebService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (BOOL)setupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3
{
  return 0;
}

+ (BOOL)bridgeSetupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3
{
  return 0;
}

+ (BOOL)bridgeSetupAssistantNeedsToRunWithContext:(id)a3 returningRequirements:(unint64_t *)a4
{
  return 0;
}

- (PKPaymentSetupAssistantRegistrationViewController)initWithPaymentWebService:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  PKPaymentSetupAssistantDelegateProxy *v12;
  PKPaymentSetupAssistantRegistrationViewController *v13;
  PKPaymentSetupAssistantRegistrationViewController *v14;
  void *v15;
  objc_super v17;

  v8 = (objc_class *)MEMORY[0x1E0D67230];
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithWebService:", v10);

  v12 = -[PKPaymentSetupAssistantDelegateProxy initWithDelegate:provisioningController:]([PKPaymentSetupAssistantDelegateProxy alloc], "initWithDelegate:provisioningController:", v9, v11);
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentSetupAssistantRegistrationViewController;
  v13 = -[PKPaymentSetupHeroViewController initWithProvisioningController:context:delegate:product:allowsManualEntry:](&v17, sel_initWithProvisioningController_context_delegate_product_allowsManualEntry_, v11, a4, v12, 0, 0);
  v14 = v13;
  if (v13)
  {
    -[PKPaymentSetupAssistantRegistrationViewController navigationItem](v13, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeftBarButtonItem:", 0);

    objc_storeStrong((id *)&v14->_delegateProxy, v12);
  }

  return v14;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  int IsBridge;
  PKPaymentSetupAssistantCoreController *setupAssistantCoreController;
  uint64_t v9;
  id v10;
  PKSetupAssistantContext *v11;
  PKPaymentSetupAssistantCoreController *v12;
  PKPaymentSetupAssistantCoreController *v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupAssistantRegistrationViewController starting preflight", buf, 2u);
    }

    -[PKExplanationViewController context](self, "context");
    IsBridge = PKPaymentSetupContextIsBridge();
    setupAssistantCoreController = self->_setupAssistantCoreController;
    if (!setupAssistantCoreController)
    {
      if (IsBridge)
        v9 = 2;
      else
        v9 = 1;
      v10 = objc_alloc(MEMORY[0x1E0D672C0]);
      v11 = -[PKSetupAssistantContext initWithSetupAssistant:]([PKSetupAssistantContext alloc], "initWithSetupAssistant:", v9);
      v12 = (PKPaymentSetupAssistantCoreController *)objc_msgSend(v10, "initWithSetupAssistantContext:", v11);
      v13 = self->_setupAssistantCoreController;
      self->_setupAssistantCoreController = v12;

      setupAssistantCoreController = self->_setupAssistantCoreController;
    }
    -[PKPaymentSetupHeroViewController provisioningController](self, "provisioningController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__PKPaymentSetupAssistantRegistrationViewController_preflightWithCompletion___block_invoke;
    v15[3] = &unk_1E3E62800;
    v16 = v4;
    -[PKPaymentSetupAssistantCoreController _preflightPaymentSetupProvisioningController:completion:](setupAssistantCoreController, "_preflightPaymentSetupProvisioningController:completion:", v14, v15);

    v5 = v16;
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupAssistantRegistrationViewController exiting no completion for preflight", buf, 2u);
  }

}

void __77__PKPaymentSetupAssistantRegistrationViewController_preflightWithCompletion___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__PKPaymentSetupAssistantRegistrationViewController_preflightWithCompletion___block_invoke_2;
  v3[3] = &unk_1E3E61A58;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __77__PKPaymentSetupAssistantRegistrationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentSetupAssistantRegistrationViewController;
  -[PKPaymentSetupHeroViewController viewDidLoad](&v2, sel_viewDidLoad);
  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68488], 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupAssistantRegistrationViewController;
  -[PKPaymentSetupHeroViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PKPaymentSetupHeroViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "viewControllerDidBeginSetupFlow:", self);

}

- (NSArray)requiredPaymentSetupFileURLs
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0D672C0], "requiredPaymentSetupFileURLs");
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  -[PKPaymentSetupAssistantRegistrationViewController _setUserInteractionEnabled:](self, "_setUserInteractionEnabled:", 0);
  v5 = objc_alloc(MEMORY[0x1E0D67540]);
  v6 = -[PKExplanationViewController context](self, "context");
  -[PKPaymentSetupHeroViewController provisioningController](self, "provisioningController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithEnvironment:provisioningController:groupsController:", v6, v7, 0);

  objc_msgSend(v8, "setIsFollowupSetupAssistant:", 1);
  objc_initWeak(&location, self);
  -[PKPaymentSetupAssistantRegistrationViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__PKPaymentSetupAssistantRegistrationViewController_explanationViewDidSelectContinue___block_invoke;
  v13[3] = &unk_1E3E61310;
  objc_copyWeak(&v14, &location);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __86__PKPaymentSetupAssistantRegistrationViewController_explanationViewDidSelectContinue___block_invoke_2;
  v11[3] = &unk_1E3E61310;
  objc_copyWeak(&v12, &location);
  +[PKProvisioningFlowBridge startSetupAssistantFollowupFlowWithNavController:context:preflightCompletion:completion:](PKProvisioningFlowBridge, "startSetupAssistantFollowupFlowWithNavController:context:preflightCompletion:completion:", v9, v8, v13, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __86__PKPaymentSetupAssistantRegistrationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setUserInteractionEnabled:", 0);

}

void __86__PKPaymentSetupAssistantRegistrationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "viewControllerDidTerminateSetupFlow:", v3);

    WeakRetained = v3;
  }

}

- (void)_setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PKPaymentSetupAssistantRegistrationViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dockView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setButtonsEnabled:", v3);
  objc_msgSend(v8, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowSpinner:", v3 ^ 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupAssistantCoreController, 0);
  objc_storeStrong((id *)&self->_delegateProxy, 0);
}

@end
