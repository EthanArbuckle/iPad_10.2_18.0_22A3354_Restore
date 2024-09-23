@implementation PKSubcredentialPairingCompletedViewController

- (PKSubcredentialPairingCompletedViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  PKSubcredentialPairingCompletedViewController *v9;
  PKSubcredentialPairingCompletedViewController *v10;
  PKHeroCardExplanationHeaderView *v11;
  PKHeroCardExplanationHeaderView *heroCardView;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = -[PKExplanationViewController initWithContext:](self, "initWithContext:", 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    v11 = -[PKHeroCardExplanationHeaderView initWithImage:]([PKHeroCardExplanationHeaderView alloc], "initWithImage:", 0);
    heroCardView = v10->_heroCardView;
    v10->_heroCardView = v11;

    -[PKSubcredentialPairingCompletedViewController navigationItem](v10, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidesBackButton:animated:", 1, 0);

  }
  return v10;
}

- (unint64_t)operation
{
  return 4;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  PKSubcredentialPairingFlowControllerProtocol *flowController;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  uint8_t buf[16];
  id location[2];

  v4 = a3;
  objc_initWeak(location, self);
  v5 = dispatch_group_create();
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Preflighting pairing completed view controller", buf, 2u);
  }

  v7 = MEMORY[0x1E0C809B0];
  if (self->_flowController)
  {
    dispatch_group_enter(v5);
    flowController = self->_flowController;
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke;
    v27[3] = &unk_1E3E64AF8;
    objc_copyWeak(&v29, location);
    v28 = v5;
    -[PKSubcredentialPairingFlowControllerProtocol nextViewControllerFromProvisioningOperation:withCompletion:](flowController, "nextViewControllerFromProvisioningOperation:withCompletion:", self, v27);

    objc_destroyWeak(&v29);
  }
  -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    dispatch_group_enter(v5);
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize](PKHeroCardExplanationHeaderView, "recommendedCardImageSize");
    v11 = v10;
    v13 = v12;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_2;
    v24[3] = &unk_1E3E67C70;
    objc_copyWeak(&v26, location);
    v15 = v5;
    v25 = v15;
    objc_msgSend(v14, "snapshotWithPass:size:completion:", v9, v24, v11, v13);

    -[PKSubcredentialProvisioningFlowControllerContext localDeviceWebService](self->_provisioningContext, "localDeviceWebService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "targetDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_group_enter(v15);
      objc_msgSend(v9, "uniqueID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v7;
      v21[1] = 3221225472;
      v21[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_45;
      v21[3] = &unk_1E3E62FA0;
      objc_copyWeak(&v23, location);
      v22 = v15;
      objc_msgSend(v17, "paymentWebService:isPassExpressWithUniqueIdentifier:completion:", v16, v18, v21);

      objc_destroyWeak(&v23);
    }

    objc_destroyWeak(&v26);
    if (v4)
    {
LABEL_9:
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_50;
      block[3] = &unk_1E3E61590;
      v20 = v4;
      dispatch_group_notify(v5, MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Preflighting pairing completed view controller with no pass", buf, 2u);
    }

    if (v4)
      goto LABEL_9;
  }

  objc_destroyWeak(location);
}

void __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 131, a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  block[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
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
    objc_msgSend(WeakRetained[130], "setCardImage:", *(_QWORD *)(a1 + 32));
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

void __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_45(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_2_46;
  block[3] = &unk_1E3E67148;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7 = a2;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

void __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_2_46(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 1032) = *(_BYTE *)(a1 + 48);
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 48))
      v5 = "Yes";
    else
      v5 = "No";
    v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Pass is express: %s", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __73__PKSubcredentialPairingCompletedViewController_preflightWithCompletion___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Pairing completed view controller preflight completed", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  __CFString *v8;
  int IsAvailable;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id location;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)PKSubcredentialPairingCompletedViewController;
  -[PKExplanationViewController viewDidLoad](&v48, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  PKProvisioningSecondaryBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTopBackgroundColor:", v4);

  -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devicePrimaryPaymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v6;
  v7 = objc_msgSend(v6, "supportsUWB");
  if (self->_isPassExpress)
  {
    if ((v7 & 1) != 0)
    {
      v8 = CFSTR("EXPRESS_CAR_KEY_ADDED_FACEID_UWB_PHONE_BODY");
      goto LABEL_11;
    }
    IsAvailable = PKPearlIsAvailable();
    v10 = CFSTR("EXPRESS_CAR_KEY_ADDED_TOUCHID_PHONE_ONLY_BODY");
    v11 = CFSTR("EXPRESS_CAR_KEY_ADDED_FACEID_PHONE_ONLY_BODY");
  }
  else
  {
    if ((v7 & 1) != 0)
    {
      v8 = CFSTR("CAR_KEY_ADDED_FACEID_UWB_AND_NFC_PHONE_ONLY_BODY");
      goto LABEL_11;
    }
    IsAvailable = PKPearlIsAvailable();
    v10 = CFSTR("CAR_KEY_ADDED_TOUCHID_PHONE_ONLY_BODY");
    v11 = CFSTR("CAR_KEY_ADDED_FACEID_PHONE_ONLY_BODY");
  }
  if (IsAvailable)
    v10 = (__CFString *)v11;
  v8 = v10;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialPairingFlowControllerContext configuration](self->_provisioningContext, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "provisioningTemplateIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "provisioningString:templateIdentifier:", CFSTR("CAR_KEY_ADDED_TITLE"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v3, "setTitleText:", v15);
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("CAR_KEY_ADDED_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleText:", v16);

  }
  objc_msgSend(v12, "provisioningString:templateIdentifier:", v8, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    PKLocalizedCredentialString(&v8->isa);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  v43 = v8;
  if (objc_msgSend(v44, "blockingSupportedUWBDueToHardware"))
  {
    v42 = v12;
    PKLocalizedCredentialString(CFSTR("CAR_KEY_ADDED_NFC_PERF_WARNING"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "rangeOfCharacterFromSet:", v22);
    v25 = v24;

    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" %@"), v21);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v20, "substringWithRange:", v23, v25);
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@%@"), v21, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByReplacingCharactersInRange:withString:", v23, v25, v28);
      v26 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v27;
    }
    v12 = v42;

    v20 = (void *)v26;
  }
  objc_msgSend(v3, "setBodyText:", v20);
  objc_msgSend(v12, "provisioningString:templateIdentifier:", CFSTR("CONTINUE"), v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    v31 = v29;
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("CONTINUE"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = v31;

  objc_msgSend(v3, "dockView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "primaryButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTitle:forState:", v32, 0);

  objc_initWeak(&location, self);
  -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHeroCardExplanationHeaderView cardImage](self->_heroCardView, "cardImage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36 && v35)
  {
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize](PKHeroCardExplanationHeaderView, "recommendedCardImageSize");
    v38 = v37;
    v40 = v39;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __60__PKSubcredentialPairingCompletedViewController_viewDidLoad__block_invoke;
    v45[3] = &unk_1E3E627B0;
    objc_copyWeak(&v46, &location);
    objc_msgSend(v41, "snapshotWithPass:size:completion:", v35, v45, v38, v40);

    objc_destroyWeak(&v46);
  }
  objc_msgSend(v3, "setHeroView:", self->_heroCardView);

  objc_destroyWeak(&location);
}

void __60__PKSubcredentialPairingCompletedViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PKSubcredentialPairingCompletedViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __60__PKSubcredentialPairingCompletedViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[130], "setCardImage:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSubcredentialPairingCompletedViewController;
  -[PKSubcredentialPairingCompletedViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  +[PKSubcredentialPairingAnalyticsReporter sendViewDidAppearWithPage:](PKSubcredentialPairingAnalyticsReporter, "sendViewDidAppearWithPage:", 3);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;

  if (self->_nextVC)
  {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 0, 3);
    -[PKSubcredentialPairingCompletedViewController navigationController](self, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_presentPaymentSetupViewController:animated:completion:", self->_nextVC, 1, 0);

  }
  else
  {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 3, 3);
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
