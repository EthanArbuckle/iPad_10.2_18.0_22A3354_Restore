@implementation PKPeerPaymentExplanationViewController

- (PKPeerPaymentExplanationViewController)initWithProvisoningController:(id)a3 setupDelegate:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6 credential:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKPeerPaymentExplanationViewController *v16;
  PKPeerPaymentSetupFlowProvisionConfiguration *v17;
  PKPeerPaymentSetupFlowProvisionConfiguration *configuration;
  PKPeerPaymentSetupFlowController *v19;
  PKPeerPaymentSetupFlowController *peerPaymentSetupFlowController;
  void *v21;
  PKPeerPaymentSetupFlowHeroView *v22;
  void *v23;
  PKPeerPaymentSetupFlowHeroView *v24;
  int IsSetupAssistant;
  void *v26;
  void *v27;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentExplanationViewController;
  v16 = -[PKExplanationViewController initWithContext:](&v29, sel_initWithContext_, a6);
  if (v16)
  {
    v17 = -[PKPeerPaymentSetupFlowProvisionConfiguration initWithSetupDelegate:]([PKPeerPaymentSetupFlowProvisionConfiguration alloc], "initWithSetupDelegate:", v13);
    configuration = v16->_configuration;
    v16->_configuration = v17;

    v19 = -[PKPeerPaymentSetupFlowController initWithPeerPaymentCredential:provisioningController:passLibraryDataProvider:configuration:context:]([PKPeerPaymentSetupFlowController alloc], "initWithPeerPaymentCredential:provisioningController:passLibraryDataProvider:configuration:context:", v15, v12, v14, v16->_configuration, a6);
    peerPaymentSetupFlowController = v16->_peerPaymentSetupFlowController;
    v16->_peerPaymentSetupFlowController = v19;

    -[PKPeerPaymentSetupFlowController setParentViewController:](v16->_peerPaymentSetupFlowController, "setParentViewController:", v16);
    v16->_operations = 31;
    -[PKExplanationViewController explanationView](v16, "explanationView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = [PKPeerPaymentSetupFlowHeroView alloc];
    -[PKPeerPaymentSetupFlowController passSnapShot](v16->_peerPaymentSetupFlowController, "passSnapShot");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PKPeerPaymentSetupFlowHeroView initWithPeerPaymentPassSnapShot:peerPaymentCredential:](v22, "initWithPeerPaymentPassSnapShot:peerPaymentCredential:", v23, v15);

    objc_msgSend(v21, "setHeroView:", v24);
    IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    if (IsSetupAssistant)
    {
      -[PKPeerPaymentExplanationViewController navigationItem](v16, "navigationItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHidesBackButton:animated:", 0, 0);

    }
    -[PKExplanationViewController setShowCancelButton:](v16, "setShowCancelButton:", IsSetupAssistant ^ 1u);
    objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController setPrivacyLinkController:](v16, "setPrivacyLinkController:", v27);

  }
  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int IsSystemOverlay;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentExplanationViewController;
  -[PKExplanationViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentExplanationViewController _titleText](self, "_titleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  -[PKPeerPaymentExplanationViewController _bodyText](self, "_bodyText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(v3, "setShowPrivacyView:", 1);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setTopMargin:", 12.0);
  objc_msgSend(v3, "setBodyDataDetectorTypes:", 0);
  objc_msgSend(v3, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentSetupFlowController provisioningController](self->_peerPaymentSetupFlowController, "provisioningController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "credentialProvisioningQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v7, "skipCardButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__terminateSetupFlow, 0x2000);

  }
  if (self->_hidesSetupLater)
  {
    objc_msgSend(v7, "setSetupLaterButton:", 0);
    goto LABEL_9;
  }
  -[PKPeerPaymentSetupFlowController peerPaymentCredential](self->_peerPaymentSetupFlowController, "peerPaymentCredential");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "paymentMode") == 2)
  {
    -[PKExplanationViewController context](self, "context");
    IsSystemOverlay = PKPaymentSetupContextIsSystemOverlay();

    if (!IsSystemOverlay)
      goto LABEL_9;
    objc_msgSend(v7, "secondaryActionButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedNearbyPeerPaymentString(CFSTR("NEARBY_PAYMENT_RECEIVER_SETUP_REQUIRED_DECLINE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v14, 0);

    objc_msgSend(v12, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v16);

    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__terminateSetupFlow, 0x2000);
    -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  }

LABEL_9:
  if (self->_allowsManualEntry)
  {
    objc_msgSend(v7, "manualEntryButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("ADD_A_DIFFERENT_CARD"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:forState:", v18, 0);

    objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel__addDifferentCard, 0x2000);
  }
  else
  {
    objc_msgSend(v7, "setManualEntryButton:", 0);
  }

}

- (BOOL)shouldPushTerms
{
  return 1;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PKPeerPaymentExplanationViewController *v14;
  id v15;
  _QWORD aBlock[5];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentExplanationViewController _showSpinner:](self, "_showSpinner:", 1);
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v6 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v17[0] = &unk_1E3FACC88;
  PKLocalizedShareableCredentialString(CFSTR("LOCAL_AUTHENTICATION_REASON"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v17[1] = &unk_1E3FACCA0;
  PKLocalizedString(CFSTR("WALLET"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = &unk_1E3FACCB8;
  v18[1] = v8;
  v18[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_60;
  v12[3] = &unk_1E3E64280;
  v14 = self;
  v15 = v5;
  v13 = v6;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v11, "evaluatePolicy:options:reply:", 1025, v9, v12);

}

uint64_t __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1040);
  v3 = *(_QWORD *)(v1 + 1032);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_2;
  v5[3] = &unk_1E3E63138;
  v5[4] = v1;
  return objc_msgSend(v2, "nextViewControllerAfterPerfomingOperations:completion:", v3, v5);
}

void __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v7 = a2;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentDisplayableError:", v8);
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
    goto LABEL_5;
  }
  if (a3)
    goto LABEL_4;
  v9 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v9, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_3;
    v11[3] = &unk_1E3E62288;
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "pk_presentPaymentSetupViewController:animated:completion:", v7, 1, v11);

  }
  else
  {
    objc_msgSend(v9, "_terminateSetupFlow");
  }
LABEL_5:

}

uint64_t __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
}

void __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_2_61;
  block[3] = &unk_1E3E64098;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __75__PKPeerPaymentExplanationViewController_explanationViewDidSelectContinue___block_invoke_2_61(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "externalizedContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "invalidate");
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("Y");
    if (!v2)
      v4 = CFSTR("N");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentExplanationViewController requested local auth and returning %@.", (uint8_t *)&v5, 0xCu);
  }

  if (v2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 56), "_showSpinner:", 0);

}

- (void)_presentDisplayableError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PKPeerPaymentExplanationViewController__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E3E612E8;
  v6[4] = self;
  v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  if (v4)
  {
    -[PKPeerPaymentExplanationViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    -[PKPeerPaymentExplanationViewController _terminateSetupFlow](self, "_terminateSetupFlow");
  }

}

uint64_t __67__PKPeerPaymentExplanationViewController__presentDisplayableError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
}

- (void)_addDifferentCard
{
  void *v3;
  void *v4;
  PKNavigationController *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[PKPeerPaymentSetupFlowController provisioningController](self->_peerPaymentSetupFlowController, "provisioningController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", -[PKExplanationViewController context](self, "context"), v3, 0);
  v5 = objc_alloc_init(PKNavigationController);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __59__PKPeerPaymentExplanationViewController__addDifferentCard__block_invoke;
  v9 = &unk_1E3E61310;
  objc_copyWeak(&v10, &location);
  +[PKProvisioningFlowBridge startManualEntryFlowWithNavController:context:completion:](PKProvisioningFlowBridge, "startManualEntryFlowWithNavController:context:completion:", v5, v4, &v6);
  -[PKPeerPaymentExplanationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __59__PKPeerPaymentExplanationViewController__addDifferentCard__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_terminateSetupFlow");

}

- (id)_titleText
{
  void *v2;
  void *v3;

  -[PKPeerPaymentSetupFlowController peerPaymentCredential](self->_peerPaymentSetupFlowController, "peerPaymentCredential");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "paymentMode") == 2)
    PKLocalizedNearbyPeerPaymentString(CFSTR("NEARBY_PAYMENT_RECEIVED_SETUP_TITLE"));
  else
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_bodyText
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  int IsBridge;

  -[PKPeerPaymentSetupFlowController peerPaymentCredential](self->_peerPaymentSetupFlowController, "peerPaymentCredential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "flowState");
  if (v4 == 6)
  {
    v5 = CFSTR("PEER_PAYMENT_SETUP_DAILY_CASH_MESSAGE");
    goto LABEL_6;
  }
  if (v4 == 2)
  {
    objc_msgSend(v3, "pendingPaymentSenderName");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (objc_msgSend(v3, "paymentMode") == 2)
        PKLocalizedNearbyPeerPaymentString(CFSTR("NEARBY_PAYMENT_RECEIVED_SETUP_PERSONALIZED_INCOMING_PAYMENT_MESSAGE"), CFSTR("%@"), v7);
      else
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_PERSONALIZED_INCOMING_PAYMENT_MESSAGE"), CFSTR("%@"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_INCOMING_PAYMENT_MESSAGE"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  if (v4 != 1)
  {
    -[PKExplanationViewController context](self, "context");
    IsBridge = PKPaymentSetupContextIsBridge();
    PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PEER_PAYMENT_SETUP_DEFAULT_MESSAGE"), IsBridge);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentRecurringString(v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v6 = (void *)v8;

    goto LABEL_15;
  }
  v5 = CFSTR("PEER_PAYMENT_SETUP_INCOMING_PAYMENT_MESSAGE");
LABEL_6:
  PKLocalizedPeerPaymentString(&v5->isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v6;
}

- (void)_terminateSetupFlow
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating peer payment setup flow", v6, 2u);
  }

  -[PKPeerPaymentSetupFlowProvisionConfiguration setupDelegate](self->_configuration, "setupDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "viewControllerDidTerminateSetupFlow:", self);
  else
    -[PKPeerPaymentExplanationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dockView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "primaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowSpinner:", v3);

  v7 = v3 ^ 1;
  objc_msgSend(v11, "setButtonsEnabled:", v7);
  -[PKPeerPaymentExplanationViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

  objc_msgSend(v8, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v7);

}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  self->_allowsManualEntry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_storeStrong((id *)&self->_peerPaymentSetupFlowController, 0);
}

@end
