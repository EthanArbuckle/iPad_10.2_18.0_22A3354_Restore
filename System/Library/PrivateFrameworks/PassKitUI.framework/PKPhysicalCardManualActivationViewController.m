@implementation PKPhysicalCardManualActivationViewController

- (PKPhysicalCardManualActivationViewController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 paymentPass:(id)a6 physicalCard:(id)a7 activationCode:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PKPhysicalCardManualActivationViewController *v20;
  PKPhysicalCardManualActivationViewController *v21;
  PKPhysicalCardActionController *v22;
  PKPhysicalCardActionController *actionController;
  uint64_t v24;
  NSString *activationCode;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v27.receiver = self;
  v27.super_class = (Class)PKPhysicalCardManualActivationViewController;
  v20 = -[PKExplanationViewController initWithContext:](&v27, sel_initWithContext_, 0);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_physicalCard, a7);
    v22 = -[PKPhysicalCardActionController initWithAccountService:account:accountUser:delegate:]([PKPhysicalCardActionController alloc], "initWithAccountService:account:accountUser:delegate:", v14, v15, v16, v21);
    actionController = v21->_actionController;
    v21->_actionController = v22;

    v21->_feature = objc_msgSend(v15, "feature");
    objc_storeStrong((id *)&v21->_paymentPass, a6);
    v24 = objc_msgSend(v19, "copy");
    activationCode = v21->_activationCode;
    v21->_activationCode = (NSString *)v24;

    v21->_businessChatSupported = +[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat");
    -[PKExplanationViewController setShowCancelButton:](v21, "setShowCancelButton:", 1);
    -[PKExplanationViewController setShowDoneButton:](v21, "setShowDoneButton:", 0);
  }

  return v21;
}

- (void)dealloc
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v4;
  objc_super v5;

  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicalCardManualActivationViewController;
  -[PKPhysicalCardManualActivationViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  PKOrderPhysicalCardHeroView *v4;
  PKOrderPhysicalCardHeroView *hero;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPhysicalCardManualActivationViewController;
  -[PKExplanationViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PKPhysicalCardManualActivationViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

  v4 = objc_alloc_init(PKOrderPhysicalCardHeroView);
  hero = self->_hero;
  self->_hero = v4;

  -[PKOrderPhysicalCardHeroView artworkView](self->_hero, "artworkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPhysicalCard nameOnCard](self->_physicalCard, "nameOnCard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNameOnCard:", v7);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowPrivacyView:", 0);
  objc_msgSend(v8, "setHeroView:", self->_hero);
  objc_msgSend(v8, "setImageIgnoresTopSafeArea:", 1);
  -[PKPhysicalCardManualActivationViewController _setupForCurrentState](self, "_setupForCurrentState");

}

- (void)viewWillAppear:(BOOL)a3
{
  SFClient *v4;
  SFClient *sharingClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPhysicalCardManualActivationViewController;
  -[PKPhysicalCardManualActivationViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (!self->_sharingClient)
  {
    v4 = (SFClient *)objc_alloc_init(MEMORY[0x1E0D973E8]);
    sharingClient = self->_sharingClient;
    self->_sharingClient = v4;

    -[SFClient activateAssertionWithIdentifier:](self->_sharingClient, "activateAssertionWithIdentifier:", CFSTR("com.apple.sharing.PreventAppleCardActivation"));
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v5;
  SFClient *sharingClient;
  SFClient *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPhysicalCardManualActivationViewController;
  -[PKPhysicalCardManualActivationViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
  sharingClient = self->_sharingClient;
  if (sharingClient)
  {
    -[SFClient invalidate](sharingClient, "invalidate");
    v7 = self->_sharingClient;
    self->_sharingClient = 0;

  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  uint64_t v4;
  PKBusinessChatPhysicalCardContext *v5;
  PKBusinessChatController *v6;
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v8;
  _QWORD v9[5];

  if (PKDeviceSupportsReaderMode())
    v4 = 4;
  else
    v4 = 6;
  v5 = -[PKBusinessChatPhysicalCardContext initWithPaymentPass:intent:]([PKBusinessChatPhysicalCardContext alloc], "initWithPaymentPass:intent:", self->_paymentPass, v4);
  if (!self->_businessChatController)
  {
    v6 = objc_alloc_init(PKBusinessChatController);
    businessChatController = self->_businessChatController;
    self->_businessChatController = v6;

  }
  -[PKPhysicalCardManualActivationViewController _showSpinner:](self, "_showSpinner:", 1);
  v8 = self->_businessChatController;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__PKPhysicalCardManualActivationViewController_explanationViewDidSelectSetupLater___block_invoke;
  v9[3] = &unk_1E3E646D0;
  v9[4] = self;
  -[PKBusinessChatController openBusinessChatWithContext:completion:](v8, "openBusinessChatWithContext:completion:", v5, v9);

}

void __83__PKPhysicalCardManualActivationViewController_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__PKPhysicalCardManualActivationViewController_explanationViewDidSelectSetupLater___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __83__PKPhysicalCardManualActivationViewController_explanationViewDidSelectSetupLater___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    return objc_msgSend(v2, "_presentDisplayableError:");
  else
    return objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  int64_t state;
  void *v6;
  void *v7;
  CLInUseAssertion *v8;
  CLInUseAssertion *inUseAssertion;
  PKPhysicalCardActionController *actionController;
  PKPhysicalCard *physicalCard;
  id v12;

  v4 = a3;
  state = self->_state;
  if (state == 2)
  {
    v12 = v4;
    -[PKPhysicalCardManualActivationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_9:
    v4 = v12;
    goto LABEL_10;
  }
  if (!state)
  {
    v12 = v4;
    if (!self->_inUseAssertion)
    {
      v6 = (void *)MEMORY[0x1E0C9E3A8];
      PKPassKitCoreBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (CLInUseAssertion *)objc_msgSend(v6, "newAssertionForBundle:withReason:", v7, CFSTR("Activating physical card"));
      inUseAssertion = self->_inUseAssertion;
      self->_inUseAssertion = v8;

    }
    actionController = self->_actionController;
    physicalCard = self->_physicalCard;
    if (self->_activationCode)
      -[PKPhysicalCardActionController activatePhysicalCard:withActivationCode:](actionController, "activatePhysicalCard:withActivationCode:", physicalCard);
    else
      -[PKPhysicalCardActionController activatePhysicalCardWithoutActivationCode:](actionController, "activatePhysicalCardWithoutActivationCode:", physicalCard);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)physicalCardActionController:(id)a3 didChangeToState:(int64_t)a4 withError:(id)a5
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v7 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKPhysicalCardManualActivationViewController_physicalCardActionController_didChangeToState_withError___block_invoke;
  block[3] = &unk_1E3E63480;
  v10 = v7;
  v11 = a4;
  block[4] = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __104__PKPhysicalCardManualActivationViewController_physicalCardActionController_didChangeToState_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080) = 0;
      goto LABEL_6;
    case 1:
      v2 = *(_QWORD *)(a1 + 32);
      v3 = 1;
      goto LABEL_5;
    case 2:
      v2 = *(_QWORD *)(a1 + 32);
      v3 = 2;
LABEL_5:
      *(_QWORD *)(v2 + 1080) = v3;
LABEL_6:
      objc_msgSend(*(id *)(a1 + 32), "_setupForCurrentState");
      break;
    case 3:
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080) = 0;
      objc_msgSend(*(id *)(a1 + 32), "_setupForCurrentState");
      v4 = *(_QWORD *)(a1 + 40);
      if (v4)
      {
        +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056), 0, 0);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_presentDisplayableError:", v5);

      }
      break;
    default:
      return;
  }
}

- (id)presentationSceneIdentifierForPhysicalCardActionController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPhysicalCardManualActivationViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setupForCurrentState
{
  int64_t state;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 businessChatSupported;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  state = self->_state;
  if (state == 2)
  {
    PKLocalizedFeatureString();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v9 = 0;
LABEL_9:
    businessChatSupported = 0;
    goto LABEL_10;
  }
  if (state == 1)
  {
    PKLocalizedFeatureString();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    businessChatSupported = self->_businessChatSupported;
    v7 = 1;
    goto LABEL_7;
  }
  if (state)
  {
    v4 = 0;
    v6 = 0;
    v7 = 0;
    v9 = 0;
    v5 = 0;
    v17 = 0;
    goto LABEL_9;
  }
  PKLocalizedFeatureString();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  businessChatSupported = self->_businessChatSupported;
LABEL_7:
  v9 = 1;
LABEL_10:
  -[PKPhysicalCardManualActivationViewController _showSpinner:](self, "_showSpinner:", v7);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setForceShowSetupLaterButton:", businessChatSupported);
  objc_msgSend(v10, "setBodyText:", v4);
  objc_msgSend(v10, "setTitleText:", v17);
  objc_msgSend(v10, "dockView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:forState:", v5, 0);

  objc_msgSend(v11, "setButtonExplanationText:", v6);
  objc_msgSend(v10, "dockView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "footerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setSkipCardButton:", 0);
  objc_msgSend(v14, "setManualEntryButton:", 0);
  objc_msgSend(v14, "setupLaterButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:forState:", v16, 0);

  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", v9);
}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonsEnabled:", v3 ^ 1);

  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", v3);
}

- (void)_presentDisplayableError:(id)a3
{
  id v4;

  v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
  -[PKPhysicalCardManualActivationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_hero, 0);
  objc_storeStrong((id *)&self->_activationCode, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_physicalCard, 0);
}

@end
