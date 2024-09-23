@implementation PKSubcredentialPairingViewController

- (PKSubcredentialPairingViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  PKSubcredentialPairingViewController *v9;
  PKSubcredentialPairingViewController *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[PKSubcredentialPairingViewController init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    -[PKSubcredentialPairingViewController navigationItem](v10, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidesBackButton:animated:", 1, 0);

  }
  return v10;
}

- (void)dealloc
{
  PKAppletSubcredentialPairingSession *pairingSession;
  objc_super v4;

  pairingSession = self->_pairingSession;
  if (pairingSession)
    -[PKAppletSubcredentialPairingSession endSession](pairingSession, "endSession");
  -[PKSubcredentialPairingViewController setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PKSubcredentialPairingViewController;
  -[PKSubcredentialPairingViewController dealloc](&v4, sel_dealloc);
}

- (unint64_t)operation
{
  return 3;
}

- (id)pairingSessionWithDelegate:(id)a3
{
  PKAppletSubcredentialPairingSession *v4;
  PKAppletSubcredentialPairingSession *pairingSession;

  objc_msgSend(MEMORY[0x1E0D66A98], "createSessionWithDelegate:", a3);
  v4 = (PKAppletSubcredentialPairingSession *)objc_claimAutoreleasedReturnValue();
  pairingSession = self->_pairingSession;
  self->_pairingSession = v4;

  return self->_pairingSession;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PKCredentialProvisioningView *v5;
  PKCredentialProvisioningView *provisioningView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKSubcredentialPairingViewController;
  -[PKSubcredentialPairingViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKSubcredentialPairingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = -[PKCredentialProvisioningView initWithContext:]([PKCredentialProvisioningView alloc], "initWithContext:", self->_provisioningContext);
  provisioningView = self->_provisioningView;
  self->_provisioningView = v5;

  -[PKCredentialProvisioningView setState:](self->_provisioningView, "setState:", 5);
  -[PKSubcredentialPairingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_provisioningView);

}

- (void)viewWillLayoutSubviews
{
  PKCredentialProvisioningView *provisioningView;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSubcredentialPairingViewController;
  -[PKSubcredentialPairingViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  provisioningView = self->_provisioningView;
  -[PKSubcredentialPairingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutFrame");
  -[PKCredentialProvisioningView setFrame:](provisioningView, "setFrame:");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSubcredentialPairingViewController;
  -[PKSubcredentialPairingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKSubcredentialPairingViewController startProvisioning](self, "startProvisioning");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSubcredentialPairingViewController;
  -[PKSubcredentialPairingViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKSubcredentialPairingViewController setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
}

- (void)hostApplicationDidEnterBackground
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Host did enter background", v4, 2u);
  }

  -[PKSubcredentialPairingViewController setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
}

- (void)handleCancelButton
{
  NSObject *v3;
  PKSubcredentialProvisioningViewModelProtocol *provisioningViewModel;
  PKSubcredentialPairingFlowControllerProtocol *flowController;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "User cancelled key pairing", buf, 2u);
  }

  if (self->_isCancelling)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Cancellation already in progress", buf, 2u);
    }

  }
  else
  {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 1, 2);
    if (self->_provisioningViewModel)
    {
      self->_isCancelling = 1;
      provisioningViewModel = self->_provisioningViewModel;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __58__PKSubcredentialPairingViewController_handleCancelButton__block_invoke;
      v7[3] = &unk_1E3E612E8;
      v7[4] = self;
      -[PKSubcredentialProvisioningViewModelProtocol cancelProvisioningWithCompletion:](provisioningViewModel, "cancelProvisioningWithCompletion:", v7);
    }
    else
    {
      flowController = self->_flowController;
      if (flowController)
      {
        -[PKSubcredentialPairingFlowControllerProtocol provisioningWasCanceledWithOperation:](flowController, "provisioningWasCanceledWithOperation:", self);
      }
      else
      {
        -[PKSubcredentialPairingViewController presentingViewController](self, "presentingViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

      }
    }
  }
}

void __58__PKSubcredentialPairingViewController_handleCancelButton__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKSubcredentialPairingViewController_handleCancelButton__block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__PKSubcredentialPairingViewController_handleCancelButton__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "endSession");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 968);
  *(_QWORD *)(v2 + 968) = 0;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1016);
  if (v4)
  {
    objc_msgSend(v4, "provisioningWasCanceledWithOperation:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 992) = 0;
}

- (void)updateUIForState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    PKStringForSubcredentialProvisioningState();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Updating UI for state %@", (uint8_t *)&v10, 0xCu);

  }
  -[PKCredentialProvisioningView setState:](self->_provisioningView, "setState:", a3);
  v7 = 0;
  if ((unint64_t)a3 > 0x10)
    goto LABEL_11;
  if (((1 << a3) & 0x164) != 0)
    goto LABEL_9;
  if (((1 << a3) & 0x10001) != 0)
  {
    LOBYTE(v7) = 1;
    goto LABEL_11;
  }
  if (a3 != 1)
  {
LABEL_11:
    -[PKSubcredentialPairingViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", 0);
    if ((v7 & 1) == 0)
      goto LABEL_14;
    goto LABEL_12;
  }
  v7 = 1;
LABEL_9:
  -[PKSubcredentialPairingViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_handleCancelButton);
  objc_msgSend(v8, "setLeftBarButtonItem:", v9);

  if (!v7)
    goto LABEL_14;
LABEL_12:
  if (!self->_outstandingAlert)
    -[PKSubcredentialPairingViewController setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
LABEL_14:

}

- (void)startProvisioning
{
  PKSubcredentialProvisioningViewModelProtocol *provisioningViewModel;
  NSObject *v4;
  _BOOL4 v5;
  PKSubcredentialProvisioningViewModelProtocol *v6;
  PKSubcredentialProvisioningViewModelProtocol *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  provisioningViewModel = self->_provisioningViewModel;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (provisioningViewModel)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring request to start provisioning while provisioning", buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Starting provisioning", v8, 2u);
    }

    -[PKSubcredentialPairingViewController setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 1);
    -[PKSubcredentialPairingFlowControllerProtocol localDeviceProvisioningViewModelForOperation:](self->_flowController, "localDeviceProvisioningViewModelForOperation:", self);
    v6 = (PKSubcredentialProvisioningViewModelProtocol *)objc_claimAutoreleasedReturnValue();
    v7 = self->_provisioningViewModel;
    self->_provisioningViewModel = v6;

    -[PKSubcredentialProvisioningViewModelProtocol startProvisioning](self->_provisioningViewModel, "startProvisioning");
  }
}

- (void)advanceToNextState
{
  NSObject *v3;
  PKSubcredentialPairingFlowControllerProtocol *flowController;
  id v5;
  _QWORD v6[5];
  id v7;
  id buf[2];

  if (self->_flowController)
  {
    if (self->_isAdvancing)
    {
      PKLogFacilityTypeGetObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to advance flow concurrently", (uint8_t *)buf, 2u);
      }

    }
    else
    {
      self->_isAdvancing = 1;
      objc_initWeak(buf, self);
      flowController = self->_flowController;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __58__PKSubcredentialPairingViewController_advanceToNextState__block_invoke;
      v6[3] = &unk_1E3E64AF8;
      objc_copyWeak(&v7, buf);
      v6[4] = self;
      -[PKSubcredentialPairingFlowControllerProtocol nextViewControllerFromProvisioningOperation:withCompletion:](flowController, "nextViewControllerFromProvisioningOperation:withCompletion:", self, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    -[PKSubcredentialPairingViewController presentingViewController](self, "presentingViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void __58__PKSubcredentialPairingViewController_advanceToNextState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __58__PKSubcredentialPairingViewController_advanceToNextState__block_invoke_2;
      v8[3] = &unk_1E3E61C58;
      objc_copyWeak(&v9, v4);
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", v3, 1, v8);

      objc_destroyWeak(&v9);
    }
    else
    {
      objc_msgSend(WeakRetained[127], "provisioningFinishedWithOperation:", WeakRetained);
    }
  }

}

void __58__PKSubcredentialPairingViewController_advanceToNextState__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[993] = 0;

}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  PKIdleTimerAssertion *idleTimerAssertion;
  PKIdleTimerAssertion *v5;
  PKIdleTimerAssertion *v6;

  idleTimerAssertion = self->_idleTimerAssertion;
  if (!a3)
  {
    -[PKIdleTimerAssertion invalidate](idleTimerAssertion, "invalidate");
    v5 = 0;
LABEL_6:
    v6 = self->_idleTimerAssertion;
    self->_idleTimerAssertion = v5;

    return;
  }
  if (!idleTimerAssertion)
  {
    v5 = -[PKIdleTimerAssertion initWithReason:]([PKIdleTimerAssertion alloc], "initWithReason:", CFSTR("Wallet - Subcredential Pairing"));
    goto LABEL_6;
  }
}

- (void)subcredentialProvisioningController:(id)a3 didEnterState:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90__PKSubcredentialPairingViewController_subcredentialProvisioningController_didEnterState___block_invoke;
  v4[3] = &unk_1E3E62010;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

uint64_t __90__PKSubcredentialPairingViewController_subcredentialProvisioningController_didEnterState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateUIForState:", *(_QWORD *)(a1 + 40));
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __103__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t v18;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "endSession");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 968);
  *(_QWORD *)(v2 + 968) = 0;

  objc_msgSend(*(id *)(a1 + 40), "provisionedPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  if (v4)
  {
    objc_msgSend(v5, "setProvisionedPass:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setShowingCheckmark:animated:", 1, 1);
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "advanceToNextState", v13, v14, v15, v16);
    goto LABEL_7;
  }
  objc_msgSend(v5, "setError:", *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "shouldExitFlowOnError") & 1) != 0)
    goto LABEL_6;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1016);
  v8 = *(void **)(a1 + 48);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __103__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2;
  v16 = &unk_1E3E61388;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v18 = v10;
  objc_msgSend(v7, "alertForOperation:withError:retryHandler:cancelationHandler:", v6, v9, 0, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_6;
  objc_msgSend(v11, "message", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKSubcredentialPairingAnalyticsReporter sendOutcome:errorMessage:page:](PKSubcredentialPairingAnalyticsReporter, "sendOutcome:errorMessage:page:", 0, v12, 2);

  objc_msgSend(*(id *)(a1 + 32), "updateUIForState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v11, 1, 0);

LABEL_7:
}

uint64_t __103__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "code") == 18)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Bluetooth"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1016), "provisioningWasCanceledWithOperation:");
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __94__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "endSession");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 968);
  *(_QWORD *)(v2 + 968) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setProvisionedPass:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setShowingCheckmark:animated:", 1, 1);
  +[PKSubcredentialPairingAnalyticsReporter sendOutcome:errorMessage:page:](PKSubcredentialPairingAnalyticsReporter, "sendOutcome:errorMessage:page:", 1, 0, 2);
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v5 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke_2;
  v8[3] = &unk_1E3E61388;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume(v7);

}

uint64_t __94__PKSubcredentialPairingViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_source_cancel(v2);
  return objc_msgSend(*(id *)(a1 + 40), "advanceToNextState");
}

- (void)subcredentialProvisioningController:(id)a3 shouldFailAfterError:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  id *v15;
  void *v16;
  uint64_t *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[16];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = PKEqualObjects();

    if ((v12 & 1) != 0)
    {
      objc_initWeak(location, self);
      v13 = objc_msgSend(v9, "code");
      self->_outstandingAlert = 0;
      if (v13 != 19)
      {
        if (v13 == 18)
        {
          v15 = (id *)&v20;
          v19 = MEMORY[0x1E0C809B0];
          v16 = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_59;
          v17 = &v19;
LABEL_13:
          v17[1] = 3221225472;
          v17[2] = (uint64_t)v16;
          v17[3] = (uint64_t)&unk_1E3E64B20;
          v17[4] = (uint64_t)self;
          v17[5] = (uint64_t)v9;
          v17[6] = (uint64_t)v10;
          objc_copyWeak(v15, location);
          dispatch_async(MEMORY[0x1E0C80D38], v17);
          objc_destroyWeak(v15);

LABEL_15:
          objc_destroyWeak(location);
          goto LABEL_16;
        }
        if (v13 != 7)
        {
          (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
          goto LABEL_15;
        }
      }
      PKLogFacilityTypeGetObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Asking if registration error should cause failure.", buf, 2u);
      }

      v15 = (id *)&v22;
      v21 = MEMORY[0x1E0C809B0];
      v16 = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke;
      v17 = &v21;
      goto LABEL_13;
    }
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v9;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Unexpected error while checking for hard failure: %@", (uint8_t *)location, 0xCu);
    }

    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
LABEL_16:

}

void __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke(id *a1)
{
  id v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  __int16 v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a1[4];
  v2 = a1[5];
  v4 = (void *)v3[127];
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2;
  v16[3] = &unk_1E3E61850;
  v6 = v2;
  v17 = v6;
  v18 = a1[6];
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_58;
  v12[3] = &unk_1E3E61B90;
  objc_copyWeak(&v15, a1 + 7);
  v13 = a1[5];
  v14 = a1[6];
  objc_msgSend(v4, "alertForOperation:withError:retryHandler:cancelationHandler:", v3, v6, v16, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    *((_BYTE *)a1[4] + 994) = 1;
    objc_msgSend(v7, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSubcredentialPairingAnalyticsReporter sendOutcome:errorMessage:page:](PKSubcredentialPairingAnalyticsReporter, "sendOutcome:errorMessage:page:", 0, v9, 2);

    objc_msgSend(a1[4], "presentViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "No alert for registration error", (uint8_t *)&v11, 2u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }

  objc_destroyWeak(&v15);
}

uint64_t __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2(uint64_t a1)
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
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "User choose to try pairing again after error: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_58(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "User choose to cancel pairing after error: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(WeakRetained, "provisioningContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldExitFlowOnError:", 1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_59(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(void **)(v3 + 1016);
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2_60;
  v15[3] = &unk_1E3E61850;
  v6 = v2;
  v16 = v6;
  v17 = *(id *)(a1 + 48);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_61;
  v12[3] = &unk_1E3E61C80;
  objc_copyWeak(&v14, (id *)(a1 + 56));
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v4, "alertForOperation:withError:retryHandler:cancelationHandler:", v3, v6, v15, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 994) = 1;
    objc_msgSend(v7, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSubcredentialPairingAnalyticsReporter sendOutcome:errorMessage:page:](PKSubcredentialPairingAnalyticsReporter, "sendOutcome:errorMessage:page:", 0, v9, 2);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "No alert for bluetooth error", v11, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

  objc_destroyWeak(&v14);
}

uint64_t __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2_60(uint64_t a1)
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
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "User choose to try pairing again after error: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __112__PKSubcredentialPairingViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_61(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "User choose to go to settings", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Bluetooth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v5, 0);

  objc_msgSend(WeakRetained, "provisioningContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldExitFlowOnError:", 1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)suppressFieldDetect
{
  return 1;
}

- (PKSubcredentialPairingFlowControllerContext)provisioningContext
{
  return self->_provisioningContext;
}

- (void)setProvisioningContext:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningContext, a3);
}

- (PKSubcredentialPairingFlowControllerProtocol)flowController
{
  return self->_flowController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowController, 0);
  objc_storeStrong((id *)&self->_provisioningContext, 0);
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_provisioningView, 0);
  objc_storeStrong((id *)&self->_provisioningViewModel, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
}

@end
