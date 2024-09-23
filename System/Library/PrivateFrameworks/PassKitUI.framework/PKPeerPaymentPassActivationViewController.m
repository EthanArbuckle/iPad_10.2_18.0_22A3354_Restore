@implementation PKPeerPaymentPassActivationViewController

- (PKPeerPaymentPassActivationViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5;
  PKPeerPaymentPassActivationViewController *v6;
  PKPeerPaymentPassActivationViewController *v7;
  id *p_peerPaymentSetupFlowController;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  PKPeerPaymentSetupFlowHeroView *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PKPeerPaymentSetupFlowHeroView *heroView;
  void *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentPassActivationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v21, sel_initWithContext_, objc_msgSend(v5, "context"));
  v7 = v6;
  if (v6)
  {
    p_peerPaymentSetupFlowController = (id *)&v6->_peerPaymentSetupFlowController;
    objc_storeStrong((id *)&v6->_peerPaymentSetupFlowController, a3);
    objc_msgSend(*p_peerPaymentSetupFlowController, "setParentViewController:", v7);
    objc_msgSend(*p_peerPaymentSetupFlowController, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "peerPaymentSetupConfigurationType");

    if (!v10)
    {
      objc_msgSend(*p_peerPaymentSetupFlowController, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setupDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v7->_setupDelegate, v12);

    }
    v7->_operations = 58;
    -[PKExplanationViewController explanationView](v7, "explanationView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [PKPeerPaymentSetupFlowHeroView alloc];
    objc_msgSend(v5, "passSnapShot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "peerPaymentCredential");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PKPeerPaymentSetupFlowHeroView initWithPeerPaymentPassSnapShot:peerPaymentCredential:](v14, "initWithPeerPaymentPassSnapShot:peerPaymentCredential:", v15, v16);
    heroView = v7->_heroView;
    v7->_heroView = (PKPeerPaymentSetupFlowHeroView *)v17;

    objc_msgSend(v13, "setHeroView:", v7->_heroView);
    -[PKPeerPaymentPassActivationViewController navigationItem](v7, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidesBackButton:animated:", 1, 0);

    -[PKExplanationViewController setShowCancelButton:](v7, "setShowCancelButton:", 0);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentPassActivationViewController;
  -[PKExplanationViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setTopMargin:", 12.0);
  objc_msgSend(v5, "setManualEntryButton:", 0);
  objc_msgSend(v5, "setSetupLaterButton:", 0);
  -[PKPeerPaymentPassActivationViewController _beginSetup](self, "_beginSetup");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[PKPeerPaymentPassActivationViewController _invalidateCLInUseAssertion](self, "_invalidateCLInUseAssertion");
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentPassActivationViewController;
  -[PKPeerPaymentPassActivationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)dealloc
{
  objc_super v3;

  -[PKPeerPaymentPassActivationViewController _invalidateCLInUseAssertion](self, "_invalidateCLInUseAssertion");
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentPassActivationViewController;
  -[PKPeerPaymentPassActivationViewController dealloc](&v3, sel_dealloc);
}

- (void)_invalidateCLInUseAssertion
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v4;

  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
}

- (BOOL)shouldPushTerms
{
  return 0;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  if (self->_state == 2)
    -[PKPeerPaymentPassActivationViewController _handleActivatedState](self, "_handleActivatedState", a3);
  else
    -[PKPeerPaymentPassActivationViewController _terminateSetupFlow](self, "_terminateSetupFlow", a3);
}

- (void)_terminateSetupFlow
{
  NSObject *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint8_t v9[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v9, 2u);
  }

  -[PKPeerPaymentSetupFlowController flowItemDelegate](self->_peerPaymentSetupFlowController, "flowItemDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "peerPaymentSetupFlowControllerDidFinish:", self->_peerPaymentSetupFlowController);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v7 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);
    }
    else
    {
      -[PKPeerPaymentPassActivationViewController presentingViewController](self, "presentingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }

}

- (void)_beginSetup
{
  void *v3;
  void *v4;
  CLInUseAssertion *v5;
  CLInUseAssertion *inUseAssertion;
  PKPeerPaymentSetupFlowController *peerPaymentSetupFlowController;
  unint64_t operations;
  _QWORD v9[5];

  -[PKPeerPaymentPassActivationViewController _setState:](self, "_setState:", 1);
  if (!self->_inUseAssertion)
  {
    v3 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (CLInUseAssertion *)objc_msgSend(v3, "newAssertionForBundle:withReason:", v4, CFSTR("Peer Payment registration"));
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v5;

  }
  peerPaymentSetupFlowController = self->_peerPaymentSetupFlowController;
  operations = self->_operations;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__PKPeerPaymentPassActivationViewController__beginSetup__block_invoke;
  v9[3] = &unk_1E3E63138;
  v9[4] = self;
  -[PKPeerPaymentSetupFlowController nextViewControllerAfterPerfomingOperations:completion:](peerPaymentSetupFlowController, "nextViewControllerAfterPerfomingOperations:completion:", operations, v9);
}

void __56__PKPeerPaymentPassActivationViewController__beginSetup__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCLInUseAssertion");
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentDisplayableError:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
  }
  else if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v9, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __56__PKPeerPaymentPassActivationViewController__beginSetup__block_invoke_2;
      v11[3] = &unk_1E3E62288;
      v11[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "pk_presentPaymentSetupViewController:animated:completion:", v7, 1, v11);

    }
    else
    {
      objc_msgSend(v9, "_setState:", 2);
    }
  }

}

uint64_t __56__PKPeerPaymentPassActivationViewController__beginSetup__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
}

- (void)_setState:(unint64_t)a3
{
  unint64_t state;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (self->_state != a3)
  {
    self->_state = a3;
    -[PKExplanationViewController explanationView](self, "explanationView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    state = self->_state;
    if (state)
    {
      if (state == 2)
      {
        -[PKExplanationViewController context](self, "context");
        if (PKPaymentSetupContextIsSetupAssistant())
        {
          -[PKPeerPaymentPassActivationViewController _handleActivatedState](self, "_handleActivatedState");
LABEL_18:

          return;
        }
        -[PKPeerPaymentPassActivationViewController _titleStringForState](self, "_titleStringForState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTitleText:", v10);

        -[PKPeerPaymentPassActivationViewController _bodyStringForState](self, "_bodyStringForState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setBodyText:", v11);

        objc_msgSend(v21, "setTitleLineBreakStrategy:", 1);
        -[PKPeerPaymentPassActivationViewController _showSpinner:](self, "_showSpinner:", 0);
        if (self->_state == 2)
        {
          -[PKPeerPaymentSetupFlowController peerPaymentCredential](self->_peerPaymentSetupFlowController, "peerPaymentCredential");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "flowState");

          if (v13 == 2)
            -[PKPeerPaymentSetupFlowHeroView startAnimation](self->_heroView, "startAnimation");
        }
        -[PKPeerPaymentSetupFlowController peerPaymentWebService](self->_peerPaymentSetupFlowController, "peerPaymentWebService");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "targetDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setUserHasDisabledPeerPayment:", 0);

        -[PKExplanationViewController explanationView](self, "explanationView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dockView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setHidden:", 0);
        v17 = -[PKPeerPaymentPassActivationViewController _shouldShowAddDebitCardViewController](self, "_shouldShowAddDebitCardViewController");
        self->_shouldShowAddDebitCardViewController = v17;
        objc_msgSend(v9, "primaryButton");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          PKLocalizedPaymentString(CFSTR("CONTINUE"));
        else
          PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_DONE"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTitle:forState:", v19, 0);

        goto LABEL_16;
      }
      if (state == 1)
      {
        -[PKPeerPaymentPassActivationViewController _titleStringForState](self, "_titleStringForState");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTitleText:", v5);

        -[PKPeerPaymentPassActivationViewController _bodyStringForState](self, "_bodyStringForState");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setBodyText:", v6);

        objc_msgSend(v21, "setTitleLineBreakStrategy:", 1);
        -[PKPeerPaymentPassActivationViewController _showSpinner:](self, "_showSpinner:", 1);
        -[PKExplanationViewController explanationView](self, "explanationView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dockView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setHidden:", 1);

        -[PKPeerPaymentPassActivationViewController navigationItem](self, "navigationItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setRightBarButtonItem:", 0);
LABEL_16:

      }
    }
    else
    {
      -[PKPeerPaymentPassActivationViewController _showSpinner:](self, "_showSpinner:", 0);
      -[PKPeerPaymentPassActivationViewController _presentActivationFailedErrorAlert](self, "_presentActivationFailedErrorAlert");
    }
    -[PKPeerPaymentPassActivationViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentSetupApplyContextAppearance(-[PKExplanationViewController context](self, "context"), v20);
    objc_msgSend(v20, "setNeedsLayout");

    goto LABEL_18;
  }
}

- (void)_handleActivatedState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  PKPaymentAddDebitCardViewController *v7;

  -[PKExplanationViewController context](self, "context");
  if ((PKPaymentSetupContextIsBridge() & 1) != 0
    || (-[PKPeerPaymentSetupFlowController provisioningController](self->_peerPaymentSetupFlowController, "provisioningController"), v3 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "credentialProvisioningQueue"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "remaining"), v4, v3, v5)|| !self->_shouldShowAddDebitCardViewController)
  {
    -[PKPeerPaymentPassActivationViewController _terminateSetupFlow](self, "_terminateSetupFlow");
  }
  else
  {
    v7 = -[PKPaymentAddDebitCardViewController initWithPeerPaymentSetupFlowController:]([PKPaymentAddDebitCardViewController alloc], "initWithPeerPaymentSetupFlowController:", self->_peerPaymentSetupFlowController);
    -[PKPeerPaymentPassActivationViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v7, 1);

  }
}

- (void)_presentDisplayableError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PKPeerPaymentPassActivationViewController__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E3E612E8;
  v6[4] = self;
  v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  if (v4)
  {
    -[PKPeerPaymentPassActivationViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    -[PKPeerPaymentPassActivationViewController _terminateSetupFlow](self, "_terminateSetupFlow");
  }

}

uint64_t __70__PKPeerPaymentPassActivationViewController__presentDisplayableError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
}

- (void)_presentActivationFailedErrorAlert
{
  void *v3;
  void *v4;
  id v5;

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_GENERIC_ERROR_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_GENERIC_ERROR_MESSAGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustom();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentPassActivationViewController _presentDisplayableError:](self, "_presentDisplayableError:", v5);
}

- (BOOL)_shouldShowAddDebitCardViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentSetupFlowController provisioningController](self->_peerPaymentSetupFlowController, "provisioningController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController context](self, "context");
  if ((PKPaymentSetupContextIsBridge() & 1) != 0
    || (objc_msgSend(v3, "credentialProvisioningQueue"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "remaining"),
        v4,
        v5))
  {
    v6 = 0;
  }
  else
  {
    -[PKPeerPaymentSetupFlowController paymentWebService](self->_peerPaymentSetupFlowController, "paymentWebService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPeerPaymentSetupFlowController passesIncludingPeerPaymentPass:isCheckingTotalPassCount:](self->_peerPaymentSetupFlowController, "passesIncludingPeerPaymentPass:isCheckingTotalPassCount:", 0, 0);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "devicePrimaryPaymentApplication", (_QWORD)v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "paymentType");

          if (v16 == 1)
          {

            v6 = 0;
            goto LABEL_24;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        if (v12)
          continue;
        break;
      }
    }

    if (PKDisableDynamicSEAllocation()
      && (v17 = objc_msgSend(v10, "pk_countObjectsPassingTest:", &__block_literal_global_16)) != 0)
    {
      v18 = v17;
      if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = objc_msgSend(v9, "maximumPaymentCards");
      }
      else
      {
        PKLogFacilityTypeGetObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v22;
          _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Target device did not respond to max payment cards. Assuming local maximum.", buf, 0xCu);

        }
        v19 = PKMaxPaymentCards();
      }
      v6 = v19 - 1 >= v18;
    }
    else
    {
      v6 = 1;
    }
LABEL_24:

  }
  return v6;
}

BOOL __82__PKPeerPaymentPassActivationViewController__shouldShowAddDebitCardViewController__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passActivationState") != 4;
}

- (id)_titleStringForState
{
  unint64_t state;
  __CFString *v3;
  void *v4;

  state = self->_state;
  if (state == 1)
  {
    v3 = CFSTR("PEER_PAYMENT_ACTIVATING");
  }
  else
  {
    if (state != 2)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("PEER_PAYMENT_ACTIVATED");
  }
  PKLocalizedPeerPaymentString(&v3->isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)_bodyStringForState
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;

  -[PKPeerPaymentSetupFlowController peerPaymentCredential](self->_peerPaymentSetupFlowController, "peerPaymentCredential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_state == 2)
  {
    v5 = objc_msgSend(v3, "flowState");
    if (v5 == 2)
    {
      objc_msgSend(v4, "pendingPaymentSenderName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_ACTIVATED_PERSONALIZED_INCOMING_PAYMENT_MESSAGE"), CFSTR("%@"), v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v5 == 1)
        v6 = CFSTR("PEER_PAYMENT_SETUP_ACTIVATED_INCOMING_PAYMENT_MESSAGE");
      else
        v6 = CFSTR("PEER_PAYMENT_SETUP_ACTIVATED_DEFAULT_MESSAGE");
      PKLocalizedPeerPaymentString(&v6->isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowSpinner:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_peerPaymentSetupFlowController, 0);
}

@end
