@implementation PKAddCredentialToWatchViewController

- (PKAddCredentialToWatchViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PKAddCredentialToWatchViewController *v10;
  PKAddCredentialToWatchViewController *v11;
  PKHeroCardWatchExplainationHeaderView *v12;
  PKHeroCardWatchExplainationHeaderView *heroCardView;
  PKAddCredentialToWatchViewController *v14;
  NSObject *v15;
  __int16 v17[8];

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "provisionedPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[PKExplanationViewController initWithContext:](self, "initWithContext:", objc_msgSend(v8, "setupContext"));
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_flowController, a3);
      objc_storeStrong((id *)&v11->_provisioningContext, a4);
      v12 = objc_alloc_init(PKHeroCardWatchExplainationHeaderView);
      heroCardView = v11->_heroCardView;
      v11->_heroCardView = v12;

      -[PKExplanationViewController setExplanationViewControllerDelegate:](v11, "setExplanationViewControllerDelegate:", v11);
    }
    self = v11;
    v14 = self;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 0;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "No provisionined pass to share with", (uint8_t *)v17, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setIdleTimerDisabled:forReason:", 0, CFSTR("Subcredential Remote Device Pairing"));

  v4.receiver = self;
  v4.super_class = (Class)PKAddCredentialToWatchViewController;
  -[PKAddCredentialToWatchViewController dealloc](&v4, sel_dealloc);
}

- (unint64_t)operation
{
  return 5;
}

- (id)sharingSessionWithDelegate:(id)a3
{
  PKAppletSubcredentialSharingSession *v4;
  PKAppletSubcredentialSharingSession *sharingSession;

  objc_msgSend(MEMORY[0x1E0D66AB0], "createSessionWithDelegate:", a3);
  v4 = (PKAppletSubcredentialSharingSession *)objc_claimAutoreleasedReturnValue();
  sharingSession = self->_sharingSession;
  self->_sharingSession = v4;

  return self->_sharingSession;
}

- (void)loadView
{
  uint64_t IsBridge;
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
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKAddCredentialToWatchViewController;
  -[PKExplanationViewController loadView](&v24, sel_loadView);
  -[PKSubcredentialProvisioningFlowControllerContext setupContext](self->_provisioningContext, "setupContext");
  IsBridge = PKPaymentSetupContextIsBridge();
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", IsBridge);
  -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCredentialString(CFSTR("CAR_KEY_ADD_TO_APPLE_WATCH_TITLE"), CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKExplanationViewController explanationView](self, "explanationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setShowPrivacyView:", 0);
  objc_msgSend(v7, "setTopMargin:", 0.0);
  objc_msgSend(v7, "setTitleText:", v6);
  PKLocalizedCredentialString(CFSTR("CAR_KEY_ADD_TO_APPLE_WATCH_BODY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBodyText:", v8);

  objc_msgSend(v7, "setForceShowSetupLaterButton:", IsBridge ^ 1);
  objc_msgSend(v7, "dockView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("ADD_NOW"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  objc_msgSend(v9, "footerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSkipCardButton:", 0);
  objc_msgSend(v12, "setManualEntryButton:", 0);
  if ((IsBridge & 1) == 0)
  {
    objc_msgSend(v12, "setupLaterButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:forState:", v14, 0);

  }
  objc_initWeak(&location, self);
  -[PKHeroCardWatchExplainationHeaderView cardImage](self->_heroCardView, "cardImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !v15)
  {
    -[PKHeroCardWatchExplainationHeaderView recommendedCardImageSize](self->_heroCardView, "recommendedCardImageSize");
    v17 = v16;
    v19 = v18;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __48__PKAddCredentialToWatchViewController_loadView__block_invoke;
    v21[3] = &unk_1E3E627B0;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v20, "snapshotWithPass:size:completion:", v4, v21, v17, v19);

    objc_destroyWeak(&v22);
  }
  objc_msgSend(v7, "setHeroView:", self->_heroCardView);
  objc_destroyWeak(&location);

}

void __48__PKAddCredentialToWatchViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PKAddCredentialToWatchViewController_loadView__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __48__PKAddCredentialToWatchViewController_loadView__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[132], "setCardImage:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  PKSubcredentialPairingFlowControllerContext *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAddCredentialToWatchViewController;
  -[PKAddCredentialToWatchViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[PKSubcredentialProvisioningFlowControllerContext setupContext](self->_provisioningContext, "setupContext");
  if (PKPaymentSetupContextIsBridge())
  {
    v4 = self->_provisioningContext;
    v5 = -[PKSubcredentialPairingFlowControllerContext referralSource](v4, "referralSource");
    -[PKSubcredentialPairingFlowControllerContext brandId](v4, "brandId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKSubcredentialPairingAnalyticsReporter beginSubcredentialPairingSessionWithReferralSource:brandId:page:](PKSubcredentialPairingAnalyticsReporter, "beginSubcredentialPairingSessionWithReferralSource:brandId:page:", v5, v6, 4);
  }
  else
  {
    +[PKSubcredentialPairingAnalyticsReporter sendViewDidAppearWithPage:](PKSubcredentialPairingAnalyticsReporter, "sendViewDidAppearWithPage:", 4);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddCredentialToWatchViewController;
  -[PKAddCredentialToWatchViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setIdleTimerDisabled:forReason:", 0, CFSTR("Subcredential Remote Device Pairing"));

  -[PKAddCredentialToWatchViewController invalidateUserAuth](self, "invalidateUserAuth");
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[8];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Preflighting add to watch completed view controller", buf, 2u);
  }

  -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKHeroCardWatchExplainationHeaderView recommendedCardImageSize](self->_heroCardView, "recommendedCardImageSize");
    v8 = v7;
    v10 = v9;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__PKAddCredentialToWatchViewController_preflightWithCompletion___block_invoke;
    v12[3] = &unk_1E3E627D8;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    objc_msgSend(v11, "snapshotWithPass:size:completion:", v6, v12, v8, v10);

    objc_destroyWeak(&v14);
  }
  else if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Add to watch completed view controller preflight completed with no pass image", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

  objc_destroyWeak(&location);
}

void __64__PKAddCredentialToWatchViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKAddCredentialToWatchViewController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __64__PKAddCredentialToWatchViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  __int16 v5[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[132], "setCardImage:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Add to watch completed view controller preflight completed", (uint8_t *)v5, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)invalidateUserAuth
{
  LAContext *v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = self->_LAContext;
  if (v2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating user auth early", v4, 2u);
    }

    -[LAContext invalidate](v2, "invalidate");
  }

}

- (void)startProvisioning
{
  PKSubcredentialProvisioningViewModelProtocol *provisioningViewModel;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  PKSubcredentialProvisioningViewModelProtocol *v7;
  PKSubcredentialProvisioningViewModelProtocol *v8;
  uint8_t v9[16];
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
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Starting to provision credential on watch", v9, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setIdleTimerDisabled:forReason:", 1, CFSTR("Subcredential Remote Device Pairing"));

    -[PKSubcredentialPairingFlowControllerProtocol remoteDeviceProvisioningViewModelForOperation:](self->_flowController, "remoteDeviceProvisioningViewModelForOperation:", self);
    v7 = (PKSubcredentialProvisioningViewModelProtocol *)objc_claimAutoreleasedReturnValue();
    v8 = self->_provisioningViewModel;
    self->_provisioningViewModel = v7;

    -[PKSubcredentialProvisioningViewModelProtocol startProvisioning](self->_provisioningViewModel, "startProvisioning");
  }
}

- (void)presentPaymentSheetForSharingRequest:(id)a3
{
  LAContext *v4;
  LAContext *LAContext;
  void *v6;
  PKPaymentAuthorizationCoordinator *v7;
  PKPaymentAuthorizationCoordinator *authorizationCoordinator;
  id v9;

  PKPaymentRequestFromSharingRequest();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
  LAContext = self->_LAContext;
  self->_LAContext = v4;

  -[LAContext externalizedContext](self->_LAContext, "externalizedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExternalizedContext:", v6);

  v7 = (PKPaymentAuthorizationCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67088]), "initWithPaymentRequest:", v9);
  authorizationCoordinator = self->_authorizationCoordinator;
  self->_authorizationCoordinator = v7;

  -[PKPaymentAuthorizationCoordinator setDelegate:](self->_authorizationCoordinator, "setDelegate:", self);
  -[PKPaymentAuthorizationCoordinator _setPrivateDelegate:](self->_authorizationCoordinator, "_setPrivateDelegate:", self);
  if (self->_authorizationCoordinator)
  {
    +[PKSubcredentialPairingAnalyticsReporter sendViewDidAppearWithPage:](PKSubcredentialPairingAnalyticsReporter, "sendViewDidAppearWithPage:", 5);
    -[PKPaymentAuthorizationCoordinator presentWithCompletion:](self->_authorizationCoordinator, "presentWithCompletion:", 0);
  }

}

- (void)resetState
{
  NSObject *v3;
  PKSubcredentialProvisioningViewModelProtocol *provisioningViewModel;
  PKAppletSubcredentialSharingSession *sharingSession;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Resetting the state of the watch offer view controller", v6, 2u);
  }

  provisioningViewModel = self->_provisioningViewModel;
  self->_provisioningViewModel = 0;

  -[PKAppletSubcredentialSharingSession endSession](self->_sharingSession, "endSession");
  sharingSession = self->_sharingSession;
  self->_sharingSession = 0;

}

- (void)advanceToNextState
{
  NSObject *v3;
  PKSubcredentialPairingFlowControllerProtocol *flowController;
  id v5;
  _QWORD v6[4];
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
      v6[2] = __58__PKAddCredentialToWatchViewController_advanceToNextState__block_invoke;
      v6[3] = &unk_1E3E62638;
      objc_copyWeak(&v7, buf);
      -[PKSubcredentialPairingFlowControllerProtocol nextViewControllerFromProvisioningOperation:withCompletion:](flowController, "nextViewControllerFromProvisioningOperation:withCompletion:", self, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    -[PKAddCredentialToWatchViewController presentingViewController](self, "presentingViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void __58__PKAddCredentialToWatchViewController_advanceToNextState__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(WeakRetained[136], "provisionedRemotePass");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(WeakRetained, "showActivityIndicator:", 0);
        objc_msgSend(WeakRetained, "showSuccessCheckmark:", 1);
      }
      objc_msgSend(WeakRetained, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:delay:completion:", v6, 1, 2000000000, 0);

    }
    else
    {
      objc_msgSend(WeakRetained[137], "provisioningFinishedWithOperation:", WeakRetained);
    }
  }

}

- (void)showSuccessCheckmark:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowCheckmark:", v3);

}

- (void)showActivityIndicator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowSpinner:", v3);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Requested to add credential to watch", v7, 2u);
  }

  +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 4, 4);
  -[PKAddCredentialToWatchViewController showSuccessCheckmark:](self, "showSuccessCheckmark:", 0);
  -[PKAddCredentialToWatchViewController showActivityIndicator:](self, "showActivityIndicator:", 1);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonsEnabled:", 0);

  -[PKAddCredentialToWatchViewController startProvisioning](self, "startProvisioning");
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Requested to skip adding credential to watch", v5, 2u);
  }

  +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 5, 4);
  -[PKAddCredentialToWatchViewController advanceToNextState](self, "advanceToNextState");
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Requested to cancel adding to watch", v5, 2u);
  }

  +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 1, 4);
  -[PKAddCredentialToWatchViewController advanceToNextState](self, "advanceToNextState");
}

- (void)subcredentialProvisioningConfiguration:(id)a3 requestUserAuthWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__PKAddCredentialToWatchViewController_subcredentialProvisioningConfiguration_requestUserAuthWithCompletion___block_invoke;
    block[3] = &unk_1E3E61450;
    block[4] = self;
    v11 = v7;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __109__PKAddCredentialToWatchViewController_subcredentialProvisioningConfiguration_requestUserAuthWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = _Block_copy(*(const void **)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1072);
  *(_QWORD *)(v3 + 1072) = v2;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "remoteDeviceConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharingRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentPaymentSheetForSharingRequest:", v6);

}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke;
  v8[3] = &unk_1E3E61388;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "alertForOperation:withError:retryHandler:cancelationHandler:", MEMORY[0x1E0C809B0], 3221225472, __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_62, &unk_1E3E612E8, *(_QWORD *)(a1 + 32), MEMORY[0x1E0C809B0], 3221225472, __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2, &unk_1E3E612E8, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "message");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSubcredentialPairingAnalyticsReporter sendOutcome:errorMessage:page:](PKSubcredentialPairingAnalyticsReporter, "sendOutcome:errorMessage:page:", 0, v4, 4);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v3, 1, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "No alert for error: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "advanceToNextState");
  }

}

uint64_t __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to try again...", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "resetState");
  objc_msgSend(*(id *)(a1 + 32), "showSuccessCheckmark:", 0);
  objc_msgSend(*(id *)(a1 + 32), "showActivityIndicator:", 1);
  objc_msgSend(*(id *)(a1 + 32), "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButtonsEnabled:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "startProvisioning");
}

uint64_t __103__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_62(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Canceling provisioning to watch...", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "advanceToNextState");
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
  v7[2] = __94__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __94__PKAddCredentialToWatchViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke(uint64_t a1)
{
  +[PKSubcredentialPairingAnalyticsReporter sendOutcome:errorMessage:page:](PKSubcredentialPairingAnalyticsReporter, "sendOutcome:errorMessage:page:", 1, 0, 4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setProvisionedRemotePass:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "advanceToNextState");
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKAddCredentialToWatchViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __81__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Authorization request did finish", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "dismissWithCompletion:", 0);
  objc_msgSend(*(id *)(a1 + 40), "invalidateUserAuth");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1072))
  {
    +[PKSubcredentialPairingAnalyticsReporter sendOutcome:errorMessage:page:](PKSubcredentialPairingAnalyticsReporter, "sendOutcome:errorMessage:page:", 0, *MEMORY[0x1E0D69618], 6);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1072) + 16))();
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 1072);
    *(_QWORD *)(v3 + 1072) = 0;

  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKAddCredentialToWatchViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeContextWithHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke;
  v7[3] = &unk_1E3E61850;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __103__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Got authorization to share credential.", buf, 2u);
    }

    +[PKSubcredentialPairingAnalyticsReporter sendOutcome:errorMessage:page:](PKSubcredentialPairingAnalyticsReporter, "sendOutcome:errorMessage:page:", 1, 0, 6);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 1072);
    objc_msgSend(*(id *)(v5 + 1080), "externalizedContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __103__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_63;
    v12[3] = &unk_1E3E61590;
    v13 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD *))(v6 + 16))(v6, v7, 0, v12);

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1072);
    *(_QWORD *)(v8 + 1072) = 0;

    v10 = v13;
    goto LABEL_9;
  }
  if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Missing authorization request completion.", buf, 2u);
  }

  +[PKSubcredentialPairingAnalyticsReporter sendOutcome:errorMessage:page:](PKSubcredentialPairingAnalyticsReporter, "sendOutcome:errorMessage:page:", 0, CFSTR("Missing authorization request completion."), 6);
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D670A8]), "initWithStatus:errors:", 1, 0);
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
LABEL_9:

  }
}

void __103__PKAddCredentialToWatchViewController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke_63(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D670A8]), "initWithStatus:errors:", 0, 0);
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  if (a4 <= 0xB && ((1 << a4) & 0xE40) != 0)
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 1, 5);
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
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong(&self->_authorizationRequestCompletion, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_heroCardView, 0);
  objc_storeStrong((id *)&self->_provisioningViewModel, 0);
  objc_storeStrong((id *)&self->_sharingSession, 0);
}

@end
