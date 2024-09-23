@implementation PKSubcredentialInvitationAcceptedViewController

- (PKSubcredentialInvitationAcceptedViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  PKSubcredentialInvitationAcceptedViewController *v9;
  PKSubcredentialInvitationAcceptedViewController *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[PKExplanationViewController initWithContext:](self, "initWithContext:", 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    -[PKSubcredentialInvitationAcceptedViewController navigationItem](v10, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidesBackButton:", 1);

  }
  return v10;
}

- (void)preflightWithCompletion:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  PKSubcredentialInvitationFlowControllerProtocol *flowController;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  _QWORD block[4];
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  uint8_t buf[16];
  id location;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_initWeak(&location, self);
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Preflighting invitation accepted view controller...", buf, 2u);
  }

  v5 = dispatch_group_create();
  v6 = v5;
  if (self->_flowController)
  {
    dispatch_group_enter(v5);
    flowController = self->_flowController;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke;
    v42[3] = &unk_1E3E64AF8;
    objc_copyWeak(&v44, &location);
    v43 = v6;
    -[PKSubcredentialInvitationFlowControllerProtocol nextViewControllerFromProvisioningOperation:withCompletion:](flowController, "nextViewControllerFromProvisioningOperation:withCompletion:", self, v42);

    objc_destroyWeak(&v44);
  }
  -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass", v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[PKSubcredentialProvisioningFlowControllerContext provisionedRemotePass](self->_provisioningContext, "provisionedRemotePass");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "secureElementPass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paymentApplications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v14);
        self->_radioTechnologyType |= objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "supportedRadioTechnologies");
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v15);
  }

  if (v11)
  {
    dispatch_group_enter(v6);
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize](PKHeroCardExplanationHeaderView, "recommendedCardImageSize");
    v19 = v18;
    v21 = v20;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_2;
    v35[3] = &unk_1E3E67C70;
    objc_copyWeak(&v37, &location);
    v23 = v6;
    v36 = v23;
    objc_msgSend(v22, "snapshotWithPass:size:completion:", v11, v35, v19, v21);

    -[PKSubcredentialProvisioningFlowControllerContext localDeviceWebService](self->_provisioningContext, "localDeviceWebService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "targetDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_group_enter(v23);
      objc_msgSend(v11, "uniqueID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_11;
      v32[3] = &unk_1E3E62FA0;
      objc_copyWeak(&v34, &location);
      v33 = v23;
      objc_msgSend(v25, "paymentWebService:isPassExpressWithUniqueIdentifier:completion:", v24, v26, v32);

      objc_destroyWeak(&v34);
    }

    objc_destroyWeak(&v37);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Preflighting invitation accepted view controller with no pass", buf, 2u);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_16;
  block[3] = &unk_1E3E61590;
  v31 = v29;
  v27 = v29;
  dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&location);
}

void __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 132, a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  block[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
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

void __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_11(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_2_12;
  block[3] = &unk_1E3E67148;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7 = a2;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

void __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_2_12(uint64_t a1)
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
    *((_BYTE *)WeakRetained + 1040) = *(_BYTE *)(a1 + 48);
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

uint64_t __75__PKSubcredentialInvitationAcceptedViewController_preflightWithCompletion___block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Preflighting invitation accepted view controller completed", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (unint64_t)operation
{
  return 2;
}

- (void)viewDidLoad
{
  unint64_t radioTechnologyType;
  int IsAvailable;
  __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKHeroCardExplanationHeaderView *v15;
  PKHeroCardExplanationHeaderView *heroCardView;
  PKHeroCardExplanationHeaderView *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)PKSubcredentialInvitationAcceptedViewController;
  -[PKExplanationViewController viewDidLoad](&v32, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  radioTechnologyType = self->_radioTechnologyType;
  if (self->_isPassExpress)
  {
    if ((radioTechnologyType & 2) != 0)
    {
      v7 = CFSTR("EXPRESS_CAR_KEY_ADDED_FACEID_UWB_PHONE_BODY");
      goto LABEL_11;
    }
    IsAvailable = PKPearlIsAvailable();
    v5 = CFSTR("EXPRESS_CAR_KEY_ADDED_TOUCHID_PHONE_ONLY_BODY");
    v6 = CFSTR("EXPRESS_CAR_KEY_ADDED_FACEID_PHONE_ONLY_BODY");
  }
  else
  {
    if ((radioTechnologyType & 2) != 0)
    {
      v7 = CFSTR("CAR_KEY_ADDED_FACEID_UWB_AND_NFC_PHONE_ONLY_BODY");
      goto LABEL_11;
    }
    IsAvailable = PKPearlIsAvailable();
    v5 = CFSTR("CAR_KEY_ADDED_TOUCHID_PHONE_ONLY_BODY");
    v6 = CFSTR("CAR_KEY_ADDED_FACEID_PHONE_ONLY_BODY");
  }
  if (IsAvailable)
    v5 = (__CFString *)v6;
  v7 = v5;
LABEL_11:
  -[PKExplanationViewController explanationView](self, "explanationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setShowPrivacyView:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTopBackgroundColor:", v9);

  PKLocalizedCredentialString(CFSTR("CAR_KEY_ADDED_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleText:", v10);

  PKLocalizedCredentialString(&v7->isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBodyText:", v11);

  PKLocalizedPaymentString(CFSTR("CONTINUE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dockView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:forState:", v12, 0);

  v15 = -[PKHeroCardExplanationHeaderView initWithImage:]([PKHeroCardExplanationHeaderView alloc], "initWithImage:", 0);
  heroCardView = self->_heroCardView;
  self->_heroCardView = v15;

  -[PKHeroCardExplanationHeaderView setPadding:](self->_heroCardView, "setPadding:", 1);
  v17 = self->_heroCardView;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHeroCardExplanationHeaderView setBackgroundColor:](v17, "setBackgroundColor:", v18);

  -[PKHeroCardExplanationHeaderView setSize:](self->_heroCardView, "setSize:", 4);
  objc_msgSend(v8, "setHeroView:", self->_heroCardView);
  objc_initWeak(&location, self);
  -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    -[PKSubcredentialProvisioningFlowControllerContext provisionedRemotePass](self->_provisioningContext, "provisionedRemotePass");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  -[PKHeroCardExplanationHeaderView cardImage](self->_heroCardView, "cardImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23 && v22)
  {
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize](PKHeroCardExplanationHeaderView, "recommendedCardImageSize");
    v25 = v24;
    v27 = v26;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __62__PKSubcredentialInvitationAcceptedViewController_viewDidLoad__block_invoke;
    v29[3] = &unk_1E3E627B0;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v28, "snapshotWithPass:size:completion:", v22, v29, v25, v27);

    objc_destroyWeak(&v30);
  }

  objc_destroyWeak(&location);
}

void __62__PKSubcredentialInvitationAcceptedViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__PKSubcredentialInvitationAcceptedViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __62__PKSubcredentialInvitationAcceptedViewController_viewDidLoad__block_invoke_2(uint64_t a1)
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

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "User acknowledged provisioning, flow completed successfully.", v7, 2u);
  }

  if (self->_nextVC)
  {
    -[PKSubcredentialInvitationAcceptedViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", self->_nextVC, 1, 0);

  }
  else
  {
    -[PKSubcredentialInvitationFlowControllerProtocol provisioningFinishedWithOperation:](self->_flowController, "provisioningFinishedWithOperation:", self);
  }

}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  -[PKSubcredentialInvitationFlowControllerProtocol provisioningFinishedWithOperation:](self->_flowController, "provisioningFinishedWithOperation:", self);
}

- (PKSubcredentialInvitationFlowControllerContext)provisioningContext
{
  return self->_provisioningContext;
}

- (void)setProvisioningContext:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningContext, a3);
}

- (PKSubcredentialInvitationFlowControllerProtocol)flowController
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
