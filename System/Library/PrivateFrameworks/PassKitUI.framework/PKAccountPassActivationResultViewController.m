@implementation PKAccountPassActivationResultViewController

- (PKAccountPassActivationResultViewController)initWithAccountFlowController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5
{
  id v9;
  id v10;
  PKAccountPassActivationResultViewController *v11;
  PKAccountPassActivationResultViewController *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountPassActivationResultViewController;
  v11 = -[PKExplanationViewController initWithContext:](&v16, sel_initWithContext_, a4);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v12->_accountController, a3);
    -[PKAccountFlowController accountCredential](v12->_accountController, "accountCredential");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_featureIdentifier = objc_msgSend(v14, "feature");

    v12->_setupContext = a4;
  }

  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  CLInUseAssertion *v7;
  CLInUseAssertion *inUseAssertion;
  objc_super v9;

  v3 = a3;
  if (!self->_inUseAssertion)
  {
    v5 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CLInUseAssertion *)objc_msgSend(v5, "newAssertionForBundle:withReason:", v6, CFSTR("Passbook showing add card UI"));
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v7;

  }
  v9.receiver = self;
  v9.super_class = (Class)PKAccountPassActivationResultViewController;
  -[PKAccountPassActivationResultViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v6;
  objc_super v7;

  v3 = a3;
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v6 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)PKAccountPassActivationResultViewController;
  -[PKAccountPassActivationResultViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (void)dealloc
{
  CLInUseAssertion *inUseAssertion;
  objc_super v4;

  -[CLInUseAssertion invalidate](self->_inUseAssertion, "invalidate");
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;

  -[UINotificationFeedbackGenerator deactivate](self->_cardAddedFeedbackGenerator, "deactivate");
  v4.receiver = self;
  v4.super_class = (Class)PKAccountPassActivationResultViewController;
  -[PKAccountPassActivationResultViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  PKApplyHeroCardView *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAccountPassActivationResultViewController;
  -[PKExplanationViewController loadView](&v7, sel_loadView);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningSecondaryBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTopBackgroundColor:", v4);
  v5 = -[PKApplyHeroCardView initWithFeatureIdentifier:]([PKApplyHeroCardView alloc], "initWithFeatureIdentifier:", self->_featureIdentifier);
  objc_msgSend(v3, "setTopBackgroundColor:", v4);
  -[PKApplyHeroCardView setBackgroundColor:](v5, "setBackgroundColor:", v4);
  objc_msgSend(v3, "setHeroView:", v5);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKAccountPassActivationResultViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesBackButton:animated:", 1, 0);

  -[PKAccountPassActivationResultViewController _updateUI](self, "_updateUI");
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UINotificationFeedbackGenerator *v5;
  UINotificationFeedbackGenerator *cardAddedFeedbackGenerator;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAccountPassActivationResultViewController;
  -[PKExplanationViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3A58]);
  -[PKAccountPassActivationResultViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UINotificationFeedbackGenerator *)objc_msgSend(v3, "initWithView:", v4);
  cardAddedFeedbackGenerator = self->_cardAddedFeedbackGenerator;
  self->_cardAddedFeedbackGenerator = v5;

  -[UINotificationFeedbackGenerator activateWithCompletionBlock:](self->_cardAddedFeedbackGenerator, "activateWithCompletionBlock:", 0);
  -[PKAccountFlowController performInitalOperations](self->_accountController, "performInitalOperations");
}

- (void)accountFlowController:(id)a3 requestsPresentationOfViewController:(id)a4
{
  objc_storeStrong((id *)&self->_nextViewController, a4);
  self->_showingLoadingIndicator = 0;
  -[PKAccountPassActivationResultViewController _updateUI](self, "_updateUI");
}

- (void)accountFlowController:(id)a3 requestsPresentationOfDisplayableError:(id)a4
{
  -[PKAccountPassActivationResultViewController _presentDisplayableError:](self, "_presentDisplayableError:", a4);
}

- (void)_updateUI
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD aBlock[5];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKAccountPassActivationResultViewController__updateUI__block_invoke;
  aBlock[3] = &unk_1E3E6DF00;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  if (PKPaymentSetupContextIsBridge())
  {
    v4 = objc_alloc_init(getNPKCompanionAgentConnectionClass_6());
    v6[0] = v2;
    v6[1] = 3221225472;
    v6[2] = __56__PKAccountPassActivationResultViewController__updateUI__block_invoke_2;
    v6[3] = &unk_1E3E78DB8;
    v7 = v3;
    objc_msgSend(v4, "defaultCardUniqueID:", v6);
    v5 = v7;
  }
  else
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", 0);
    objc_msgSend(v4, "defaultPaymentPassUniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v3 + 2))(v3, v5);
  }

}

void __56__PKAccountPassActivationResultViewController__updateUI__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  _BYTE *v8;
  id v9;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1032);
  v4 = a2;
  objc_msgSend(v3, "accountCredential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueID");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "isEqualToString:", v9);
  v8 = *(_BYTE **)(a1 + 32);
  if (v8[1098])
  {
    objc_msgSend(v8, "_updateForLoading");
  }
  else if (v7)
  {
    objc_msgSend(v8, "_updateForMadeDefault");
  }
  else
  {
    objc_msgSend(v8, "_updateForSetupLater");
  }
  PKPaymentSetupApplyContextAppearance(objc_msgSend(*(id *)(a1 + 32), "context"), *(void **)(a1 + 32));

}

void __56__PKAccountPassActivationResultViewController__updateUI__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PKAccountPassActivationResultViewController__updateUI__block_invoke_3;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __56__PKAccountPassActivationResultViewController__updateUI__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_updateForLoading
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKExplanationViewController explanationView](self, "explanationView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showCheckmark:animated:", 0, 0);
  -[PKAccountPassActivationResultViewController _showActivationSpinner:](self, "_showActivationSpinner:", 1);
  -[PKAccountPassActivationResultViewController _willPerformProvisioningActions](self, "_willPerformProvisioningActions");
  PKLocalizedFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleText:", v5);

  objc_msgSend(v3, "setPrimaryButton:", 0);
  objc_msgSend(v4, "setSetupLaterButton:", 0);
  objc_msgSend(v4, "setManualEntryButton:", 0);

}

- (void)_updateForMadeDefault
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[PKExplanationViewController explanationView](self, "explanationView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPassActivationResultViewController _showActivationSpinner:](self, "_showActivationSpinner:", 0);
  objc_msgSend(v16, "setShowCheckmark:", 1);
  -[UINotificationFeedbackGenerator notificationOccurred:](self->_cardAddedFeedbackGenerator, "notificationOccurred:", 0);
  objc_msgSend(v3, "primaryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CONTINUE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);

  objc_msgSend(v3, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forEvents:", self, sel__handleNextStep, 0x2000);

  objc_msgSend(v4, "setSetupLaterButton:", 0);
  objc_msgSend(v4, "setManualEntryButton:", 0);
  if (-[PKAccountPassActivationResultViewController _willPerformProvisioningActions](self, "_willPerformProvisioningActions"))
  {
    PKLocalizedFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitleText:", v8);

    -[PKAccountPassActivationResultViewController _localizedStringKeyForPerformedOperationsAndMadeDefault:](self, "_localizedStringKeyForPerformedOperationsAndMadeDefault:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setBodyText:", v12);
    PKLocalizedFeatureString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setButtonExplanationText:", v13);

  }
  else
  {
    PKLocalizedFeatureString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitleText:", v14);

    PKLocalizedFeatureString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBodyText:", v15);

    objc_msgSend(v3, "setButtonExplanationText:", 0);
  }

}

- (void)_updateForSetupLater
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PKExplanationViewController explanationView](self, "explanationView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPassActivationResultViewController _showActivationSpinner:](self, "_showActivationSpinner:", 0);
  objc_msgSend(v11, "setShowCheckmark:", 1);
  -[UINotificationFeedbackGenerator notificationOccurred:](self->_cardAddedFeedbackGenerator, "notificationOccurred:", 0);
  PKLocalizedFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitleText:", v5);

  objc_msgSend(v11, "setBodyText:", 0);
  -[PKAccountPassActivationResultViewController _setupLaterBodyString](self, "_setupLaterBodyString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedBodyText:", v6);

  objc_msgSend(v4, "setSetupLaterButton:", 0);
  objc_msgSend(v4, "setManualEntryButton:", 0);
  objc_msgSend(v3, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CONTINUE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_msgSend(v3, "primaryButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forEvents:", self, sel__handleNextStep, 0x2000);

  if (-[PKAccountPassActivationResultViewController _willPerformProvisioningActions](self, "_willPerformProvisioningActions"))
  {
    PKLocalizedFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setButtonExplanationText:", v10);

  }
  else
  {
    objc_msgSend(v3, "setButtonExplanationText:", 0);
  }

}

- (void)_showActivationSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowSpinner:", v3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setIdleTimerDisabled:forReason:", v3, CFSTR("Activating Account Pass"));

  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("enabled");
    if (v3)
      v8 = CFSTR("disabled");
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = CFSTR("Activating Account Pass");
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Idle timer is: %@ for reason: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "setButtonsEnabled:", v3 ^ 1);
}

- (void)_handleNextStep
{
  UIViewController *nextViewController;
  PKAccountFlowController *accountController;
  _QWORD v5[5];

  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  if (self->_nextViewController)
  {
    -[PKAccountPassActivationResultViewController _presentViewController:](self, "_presentViewController:");
    nextViewController = self->_nextViewController;
    self->_nextViewController = 0;

  }
  else
  {
    accountController = self->_accountController;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__PKAccountPassActivationResultViewController__handleNextStep__block_invoke;
    v5[3] = &unk_1E3E62260;
    v5[4] = self;
    -[PKAccountFlowController nextViewControllerWithCompletion:](accountController, "nextViewControllerWithCompletion:", v5);
  }
}

uint64_t __62__PKAccountPassActivationResultViewController__handleNextStep__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "_presentDisplayableError:");
  else
    return objc_msgSend(v3, "_presentViewController:", a2);
}

- (BOOL)_willPerformProvisioningActions
{
  return (-[PKAccountFlowController operations](self->_accountController, "operations") & 3) != 0;
}

- (void)_presentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pk_paymentSetupSetHideSetupLaterButton:", 1);
    -[PKAccountPassActivationResultViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PKAccountPassActivationResultViewController__presentViewController___block_invoke;
    v7[3] = &unk_1E3E62288;
    v7[4] = self;
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v7);

  }
  else
  {
    -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
    -[PKAccountPassActivationResultViewController _terminateSetupFlow](self, "_terminateSetupFlow");
  }

}

uint64_t __70__PKAccountPassActivationResultViewController__presentViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

- (void)_presentDisplayableError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PKAccountPassActivationResultViewController__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E3E612E8;
  v6[4] = self;
  v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
  if (v4)
  {
    -[PKAccountPassActivationResultViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    -[PKAccountPassActivationResultViewController _terminateSetupFlow](self, "_terminateSetupFlow");
  }

}

uint64_t __72__PKAccountPassActivationResultViewController__presentDisplayableError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1032);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__PKAccountPassActivationResultViewController__presentDisplayableError___block_invoke_2;
  v5[3] = &unk_1E3E62260;
  v5[4] = v2;
  return objc_msgSend(v3, "nextViewControllerWithCompletion:", v5);
}

uint64_t __72__PKAccountPassActivationResultViewController__presentDisplayableError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentViewController:", a2);
}

- (void)_terminateSetupFlow
{
  PKPaymentSetupViewControllerDelegate **p_delegate;
  id WeakRetained;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKAccountPassActivationResultViewController presentingViewController](self, "presentingViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (id)_localizedStringKeyForPerformedOperationsAndMadeDefault:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (v3)
    v6 = CFSTR("ACCOUNT_ACTIVATED_BODY_MADE_DEFAULT_WALLET_SAFARI");
  else
    v6 = CFSTR("ACCOUNT_ACTIVATED_BODY_NOT_MADE_DEFAULT_WALLET_SAFARI");
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);
  -[PKAccountFlowController accountProvisioningController](self->_accountController, "accountProvisioningController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "didAddToAMP");

  if (v9)
    objc_msgSend(v7, "appendString:", CFSTR("_APPLEID"));
  PKFeatureIdentifierToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PKHasPairedWatchSupportingFeatureIdentifier();

  if (v11)
    objc_msgSend(v7, "appendString:", CFSTR("_WATCH"));
  v12 = (void *)objc_msgSend(v7, "copy");

  return v12;
}

- (id)_setupLaterBodyString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0DC1140]);

  PKLocalizedFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_featureIdentifier == 3)
  {

    v6 = 0;
  }
  -[PKAccountPassActivationResultViewController _localizedStringKeyForPerformedOperationsAndMadeDefault:](self, "_localizedStringKeyForPerformedOperationsAndMadeDefault:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "stringByAppendingString:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v3);

  return v11;
}

- (BOOL)didAddToAmp
{
  return self->_didAddToAmp;
}

- (void)setDidAddToAmp:(BOOL)a3
{
  self->_didAddToAmp = a3;
}

- (BOOL)didMakeAccountPassDefault
{
  return self->_didMakeAccountPassDefault;
}

- (void)setDidMakeAccountPassDefault:(BOOL)a3
{
  self->_didMakeAccountPassDefault = a3;
}

- (BOOL)showingLoadingIndicator
{
  return self->_showingLoadingIndicator;
}

- (void)setShowingLoadingIndicator:(BOOL)a3
{
  self->_showingLoadingIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_cardAddedFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountController, 0);
}

@end
