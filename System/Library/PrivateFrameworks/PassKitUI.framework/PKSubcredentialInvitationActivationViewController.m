@implementation PKSubcredentialInvitationActivationViewController

- (PKSubcredentialInvitationActivationViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  PKSubcredentialInvitationActivationViewController *v9;
  PKSubcredentialInvitationActivationViewController *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[PKExplanationViewController initWithContext:](self, "initWithContext:", 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    -[PKSubcredentialInvitationActivationViewController navigationItem](v10, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidesBackButton:", 1);

  }
  return v10;
}

- (void)preflightWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (unint64_t)operation
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PKHeroCardExplanationHeaderView *v19;
  PKHeroCardExplanationHeaderView *heroCardView;
  PKHeroCardExplanationHeaderView *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  BOOL v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  NSString *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)PKSubcredentialInvitationActivationViewController;
  -[PKExplanationViewController viewDidLoad](&v41, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTopBackgroundColor:", v4);

  PKLocalizedCredentialString(CFSTR("CAR_KEY_ADDED_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v5);

  -[PKSubcredentialInvitationFlowControllerContext localDeviceInvitation](self->_provisioningContext, "localDeviceInvitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalInvitationMessage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "activationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D66F40]);
    objc_msgSend(MEMORY[0x1E0D66F38], "vehicleEnteredPin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithOptions:", v10);

  }
  objc_msgSend(v7, "primaryOption");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizationKeyPostfix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SHARE_ACTIVATION_OVERVIEW_TITLE_"), "stringByAppendingString:", v11);
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();

  PKLocalizedShareableCredentialString(v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v12);

  objc_msgSend(v7, "localizationKeyPostfix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SHARE_ACTIVATION_REDEMPTION_BODY_"), "stringByAppendingString:", v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();

  PKLocalizedShareableCredentialString(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v15);

  PKLocalizedString(CFSTR("DONE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "primaryButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:forState:", v16, 0);

  v19 = -[PKHeroCardExplanationHeaderView initWithImage:]([PKHeroCardExplanationHeaderView alloc], "initWithImage:", 0);
  heroCardView = self->_heroCardView;
  self->_heroCardView = v19;

  -[PKHeroCardExplanationHeaderView setPadding:](self->_heroCardView, "setPadding:", 1);
  v21 = self->_heroCardView;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHeroCardExplanationHeaderView setBackgroundColor:](v21, "setBackgroundColor:", v22);

  -[PKHeroCardExplanationHeaderView setSize:](self->_heroCardView, "setSize:", 4);
  objc_msgSend(v3, "setHeroView:", self->_heroCardView);
  objc_initWeak(&location, self);
  -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    -[PKSubcredentialProvisioningFlowControllerContext provisionedRemotePass](self->_provisioningContext, "provisionedRemotePass");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  -[PKHeroCardExplanationHeaderView cardImage](self->_heroCardView, "cardImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    v28 = 1;
  else
    v28 = v26 == 0;
  v29 = !v28;

  if (v29)
  {
    +[PKHeroCardExplanationHeaderView recommendedCardImageSize](PKHeroCardExplanationHeaderView, "recommendedCardImageSize");
    v31 = v30;
    v33 = v32;
    +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __64__PKSubcredentialInvitationActivationViewController_viewDidLoad__block_invoke;
    v38[3] = &unk_1E3E627B0;
    objc_copyWeak(&v39, &location);
    objc_msgSend(v34, "snapshotWithPass:size:completion:", v26, v38, v31, v33);

    objc_destroyWeak(&v39);
  }

  objc_destroyWeak(&location);
}

void __64__PKSubcredentialInvitationActivationViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PKSubcredentialInvitationActivationViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __64__PKSubcredentialInvitationActivationViewController_viewDidLoad__block_invoke_2(uint64_t a1)
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
  void *v5;
  PKSubcredentialInvitationFlowControllerProtocol *flowController;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PKSubcredentialInvitationActivationViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  flowController = self->_flowController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__PKSubcredentialInvitationActivationViewController_explanationViewDidSelectContinue___block_invoke;
  v7[3] = &unk_1E3E62638;
  objc_copyWeak(&v8, &location);
  -[PKSubcredentialInvitationFlowControllerProtocol nextViewControllerFromProvisioningOperation:withCompletion:](flowController, "nextViewControllerFromProvisioningOperation:withCompletion:", self, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __86__PKSubcredentialInvitationActivationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", 1);

    if (v7)
    {
      objc_msgSend(v4, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:delay:completion:", v7, 1, 2000000000, 0);

    }
    else
    {
      objc_msgSend(v4[131], "provisioningFinishedWithOperation:", v4);
    }
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
  objc_storeStrong((id *)&self->_heroCardView, 0);
}

@end
