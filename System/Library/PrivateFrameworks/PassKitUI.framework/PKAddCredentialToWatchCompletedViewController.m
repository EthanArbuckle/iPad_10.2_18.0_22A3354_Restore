@implementation PKAddCredentialToWatchCompletedViewController

- (PKAddCredentialToWatchCompletedViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  PKAddCredentialToWatchCompletedViewController *v9;
  PKAddCredentialToWatchCompletedViewController *v10;
  PKHeroCardWatchExplainationHeaderView *v11;
  PKHeroCardWatchExplainationHeaderView *heroCardView;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = -[PKExplanationViewController initWithContext:](self, "initWithContext:", objc_msgSend(v8, "setupContext"));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    v11 = objc_alloc_init(PKHeroCardWatchExplainationHeaderView);
    heroCardView = v10->_heroCardView;
    v10->_heroCardView = v11;

    -[PKAddCredentialToWatchCompletedViewController navigationItem](v10, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidesBackButton:animated:", 1, 0);

  }
  return v10;
}

- (unint64_t)operation
{
  return 6;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  PKSubcredentialPairingFlowControllerProtocol *flowController;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
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

  v6 = dispatch_group_create();
  v7 = v6;
  v8 = MEMORY[0x1E0C809B0];
  if (self->_flowController)
  {
    dispatch_group_enter(v6);
    flowController = self->_flowController;
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke;
    v22[3] = &unk_1E3E64AF8;
    objc_copyWeak(&v24, &location);
    v23 = v7;
    -[PKSubcredentialPairingFlowControllerProtocol nextViewControllerFromProvisioningOperation:withCompletion:](flowController, "nextViewControllerFromProvisioningOperation:withCompletion:", self, v22);

    objc_destroyWeak(&v24);
  }
  -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    dispatch_group_enter(v7);
    -[PKHeroCardWatchExplainationHeaderView recommendedCardImageSize](self->_heroCardView, "recommendedCardImageSize");
    v12 = v11;
    v14 = v13;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_2;
    v19[3] = &unk_1E3E67C70;
    objc_copyWeak(&v21, &location);
    v20 = v7;
    objc_msgSend(v15, "snapshotWithPass:size:completion:", v10, v19, v12, v14);

    objc_destroyWeak(&v21);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Preflighting Add to watch completed view controller with no pass", buf, 2u);
    }

  }
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_11;
  block[3] = &unk_1E3E61590;
  v18 = v4;
  v16 = v4;
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&location);
}

void __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 130, a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  block[2] = __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[129], "setCardImage:", *(_QWORD *)(a1 + 32));
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Loaded pass image: %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __73__PKAddCredentialToWatchCompletedViewController_preflightWithCompletion___block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Add to watch completed view controller preflight completed", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKAddCredentialToWatchCompletedViewController;
  -[PKExplanationViewController loadView](&v24, sel_loadView);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setTopMargin:", 0.0);
  PKLocalizedCredentialString(CFSTR("CAR_KEY_ADDED_TITLE_WATCH"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  -[PKAddCredentialToWatchCompletedViewController bodyText](self, "bodyText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(v3, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CONTINUE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_initWeak(&location, self);
  -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHeroCardWatchExplainationHeaderView cardImage](self->_heroCardView, "cardImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 && v9)
  {
    -[PKHeroCardWatchExplainationHeaderView recommendedCardImageSize](self->_heroCardView, "recommendedCardImageSize");
    v12 = v11;
    v14 = v13;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __57__PKAddCredentialToWatchCompletedViewController_loadView__block_invoke;
    v21 = &unk_1E3E627B0;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v15, "snapshotWithPass:size:completion:", v9, &v18, v12, v14);

    objc_destroyWeak(&v22);
  }
  objc_msgSend(v3, "setHeroView:", self->_heroCardView, v18, v19, v20, v21);
  objc_msgSend(v3, "dockView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "footerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setSkipCardButton:", 0);
  objc_msgSend(v17, "setManualEntryButton:", 0);
  objc_msgSend(v17, "setSetupLaterButton:", 0);

  objc_destroyWeak(&location);
}

void __57__PKAddCredentialToWatchCompletedViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKAddCredentialToWatchCompletedViewController_loadView__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __57__PKAddCredentialToWatchCompletedViewController_loadView__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[129], "setCardImage:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (id)bodyText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  __CFString *v9;
  void *v10;

  -[PKSubcredentialProvisioningFlowControllerContext provisionedRemotePass](self->_provisioningContext, "provisionedRemotePass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devicePrimaryContactlessPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subcredentials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "entitlement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "carKeyEntitlementType");

  v8 = CFSTR("FULL_ACCESS_CAR_KEY_ADDED_BODY_WATCH");
  if (v7 == 1)
    v8 = CFSTR("UNLOCK_ACCESS_CAR_KEY_ADDED_BODY_WATCH");
  if (v7 == 6)
    v9 = CFSTR("PROPRIETARY_ACCESS_CAR_KEY_ADDED_BODY_WATCH");
  else
    v9 = (__CFString *)v8;
  PKLocalizedCredentialString(&v9->isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;

  if (self->_nextVC)
  {
    -[PKAddCredentialToWatchCompletedViewController navigationController](self, "navigationController", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_presentPaymentSetupViewController:animated:completion:", self->_nextVC, 1, 0);

  }
  else
  {
    -[PKSubcredentialPairingFlowControllerProtocol provisioningFinishedWithOperation:](self->_flowController, "provisioningFinishedWithOperation:", self);
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  -[PKSubcredentialPairingFlowControllerProtocol provisioningFinishedWithOperation:](self->_flowController, "provisioningFinishedWithOperation:", self);
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
  objc_storeStrong((id *)&self->_nextVC, 0);
  objc_storeStrong((id *)&self->_heroCardView, 0);
}

@end
