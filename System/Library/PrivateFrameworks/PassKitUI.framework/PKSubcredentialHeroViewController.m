@implementation PKSubcredentialHeroViewController

- (PKSubcredentialHeroViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  PKSubcredentialHeroViewController *v9;
  PKSubcredentialHeroViewController *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[PKExplanationViewController initWithContext:](self, "initWithContext:", 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    -[PKExplanationViewController setExplanationViewControllerDelegate:](v10, "setExplanationViewControllerDelegate:", v10);
  }

  return v10;
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKCredentialPairingExplanationHeaderView *v15;
  void *v16;
  PKCredentialPairingExplanationHeaderView *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKSubcredentialHeroViewController;
  -[PKExplanationViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 1);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShowPrivacyView:", 1);
  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialPairingFlowControllerContext configuration](self->_provisioningContext, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provisioningTemplateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "provisioningString:templateIdentifier:", CFSTR("CAR_KEY_HERO_VIEW_TITLE"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "setTitleText:", v7);
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("CAR_KEY_HERO_VIEW_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleText:", v8);

  }
  objc_msgSend(v4, "provisioningString:templateIdentifier:", CFSTR("CAR_KEY_HERO_VIEW_BODY"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v3, "setBodyText:", v9);
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("CAR_KEY_HERO_VIEW_BODY"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBodyText:", v10);

  }
  objc_msgSend(v3, "dockView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provisioningString:templateIdentifier:", CFSTR("CONTINUE"), v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "setTitle:forState:", v13, 0);
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("CONTINUE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v14, 0);

  }
  v15 = [PKCredentialPairingExplanationHeaderView alloc];
  -[PKSubcredentialPairingFlowControllerContext configuration](self->_provisioningContext, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKCredentialPairingExplanationHeaderView initWithConfiguration:](v15, "initWithConfiguration:", v16);
  objc_msgSend(v3, "setHeroView:", v17);

  objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialHeroViewController addChildViewController:](self, "addChildViewController:", v18);
  -[PKExplanationViewController setPrivacyLinkController:](self, "setPrivacyLinkController:", v18);
  objc_msgSend(v18, "didMoveToParentViewController:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  PKSubcredentialPairingFlowControllerContext *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKSubcredentialHeroViewController;
  -[PKSubcredentialHeroViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  v4 = self->_provisioningContext;
  v5 = -[PKSubcredentialPairingFlowControllerContext referralSource](v4, "referralSource");
  -[PKSubcredentialPairingFlowControllerContext brandId](v4, "brandId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKSubcredentialPairingAnalyticsReporter beginSubcredentialPairingSessionWithReferralSource:brandId:page:](PKSubcredentialPairingAnalyticsReporter, "beginSubcredentialPairingSessionWithReferralSource:brandId:page:", v5, v6, 0);
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 1, 0);
  -[PKSubcredentialPairingFlowControllerProtocol provisioningWasCanceledWithOperation:](self->_flowController, "provisioningWasCanceledWithOperation:", self);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKSubcredentialPairingFlowControllerProtocol *flowController;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (self->_flowController)
  {
    +[PKSubcredentialPairingAnalyticsReporter sendButtonPressWithButtonTag:page:](PKSubcredentialPairingAnalyticsReporter, "sendButtonPressWithButtonTag:page:", 0, 0);
    -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
    -[PKExplanationViewController explanationView](self, "explanationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dockView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setButtonsEnabled:", 0);

    flowController = self->_flowController;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__PKSubcredentialHeroViewController_explanationViewDidSelectContinue___block_invoke;
    v9[3] = &unk_1E3E62638;
    objc_copyWeak(&v10, &location);
    -[PKSubcredentialPairingFlowControllerProtocol nextViewControllerFromProvisioningOperation:withCompletion:](flowController, "nextViewControllerFromProvisioningOperation:withCompletion:", self, v9);
    objc_destroyWeak(&v10);
  }
  else
  {
    -[PKSubcredentialHeroViewController presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  objc_destroyWeak(&location);

}

void __70__PKSubcredentialHeroViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __70__PKSubcredentialHeroViewController_explanationViewDidSelectContinue___block_invoke_2;
      v8[3] = &unk_1E3E61C58;
      objc_copyWeak(&v9, v4);
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", v3, 1, v8);

      objc_destroyWeak(&v9);
    }
    else
    {
      objc_msgSend(WeakRetained[130], "provisioningFinishedWithOperation:", WeakRetained);
    }
  }

}

void __70__PKSubcredentialHeroViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);
    objc_msgSend(v4, "explanationView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dockView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setButtonsEnabled:", 1);

    WeakRetained = v4;
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
}

@end
