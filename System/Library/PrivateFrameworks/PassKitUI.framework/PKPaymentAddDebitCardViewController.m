@implementation PKPaymentAddDebitCardViewController

- (PKPaymentAddDebitCardViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5;
  PKPaymentAddDebitCardViewController *v6;
  PKPaymentAddDebitCardViewController *v7;
  id *p_peerPaymentSetupFlowController;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentAddDebitCardViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v26, sel_initWithContext_, objc_msgSend(v5, "context"));
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
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ADD_DEBIT_CARD_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAddDebitCardViewController setTitleText:](v7, "setTitleText:", v13);

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ADD_CARD_MESSAGE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAddDebitCardViewController setBodyText:](v7, "setBodyText:", v14);

    -[PKExplanationViewController explanationView](v7, "explanationView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShowPrivacyView:", 0);
    objc_msgSend(v15, "setDelegate:", v7);
    -[PKExplanationViewController explanationView](v7, "explanationView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dockView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "primaryButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ADD_CARD_BUTTON_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:forState:", v19, 0);

    objc_msgSend(v15, "setForceShowSetupLaterButton:", 1);
    objc_msgSend(v17, "footerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setManualEntryButton:", 0);

    -[PKExplanationViewController context](v7, "context");
    LODWORD(v20) = PKPaymentSetupContextIsSetupAssistant();
    objc_msgSend(v17, "footerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setupLaterButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PEER_PAYMENT_ADD_CARD_LATER_TITLE"), (int)v20);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitle:forState:", v24, 0);

    -[PKPaymentAddDebitCardViewController setShowDebitCardHeroView:](v7, "setShowDebitCardHeroView:", 1);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAddDebitCardViewController;
  -[PKExplanationViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKPaymentAddDebitCardViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);
  objc_msgSend(v3, "setRightBarButtonItem:", 0);
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

}

- (void)setTitleText:(id)a3
{
  id v5;
  NSString *titleText;
  NSString *v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSString *v11;

  v5 = a3;
  titleText = self->_titleText;
  v11 = (NSString *)v5;
  v7 = titleText;
  if (v7 == v11)
  {

    v9 = v11;
  }
  else
  {
    if (v11 && v7)
    {
      v8 = -[NSString isEqualToString:](v11, "isEqualToString:", v7);

      if (v8)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_titleText, a3);
    -[PKExplanationViewController explanationView](self, "explanationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleText:", self->_titleText);

    -[PKPaymentAddDebitCardViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");
  }

LABEL_10:
}

- (void)setBodyText:(id)a3
{
  id v5;
  NSString *bodyText;
  NSString *v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSString *v11;

  v5 = a3;
  bodyText = self->_bodyText;
  v11 = (NSString *)v5;
  v7 = bodyText;
  if (v7 == v11)
  {

    v9 = v11;
  }
  else
  {
    if (v11 && v7)
    {
      v8 = -[NSString isEqualToString:](v11, "isEqualToString:", v7);

      if (v8)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_bodyText, a3);
    -[PKExplanationViewController explanationView](self, "explanationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBodyText:", self->_bodyText);

    -[PKPaymentAddDebitCardViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");
  }

LABEL_10:
}

- (void)setShowDebitCardHeroView:(BOOL)a3
{
  PKAddDebitCardHeroView *v4;
  void *v5;
  PKAddDebitCardHeroView *v6;
  void *v7;
  id v8;

  if (self->_showDebitCardHeroView != a3)
  {
    self->_showDebitCardHeroView = a3;
    if (a3)
    {
      v4 = [PKAddDebitCardHeroView alloc];
      -[PKPeerPaymentSetupFlowController passSnapShot](self->_peerPaymentSetupFlowController, "passSnapShot");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PKAddDebitCardHeroView initWithPassSnapShot:](v4, "initWithPassSnapShot:", v5);

      -[PKExplanationViewController explanationView](self, "explanationView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHeroView:", v6);

    }
    else
    {
      -[PKExplanationViewController explanationView](self, "explanationView");
      v6 = (PKAddDebitCardHeroView *)objc_claimAutoreleasedReturnValue();
      -[PKAddDebitCardHeroView setHeroView:](v6, "setHeroView:", 0);
    }

    -[PKPaymentAddDebitCardViewController view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

  }
}

- (BOOL)shouldPushTerms
{
  return 0;
}

- (void)_presentPaymentSetupController
{
  void *v3;
  void *v4;
  PKNavigationController *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[PKPeerPaymentSetupFlowController provisioningController](self->_peerPaymentSetupFlowController, "provisioningController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController context](self, "context");
  if (PKPaymentSetupContextIsSetupAssistant())
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", -[PKExplanationViewController context](self, "context"), v3, 0);
    v5 = objc_alloc_init(PKNavigationController);
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke;
    v8[3] = &unk_1E3E61310;
    objc_copyWeak(&v9, &location);
    +[PKProvisioningFlowBridge startManualEntryFlowWithNavController:context:completion:](PKProvisioningFlowBridge, "startManualEntryFlowWithNavController:context:completion:", v5, v4, v8);
    -[PKPaymentAddDebitCardViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_2;
    v6[3] = &unk_1E3E64E38;
    v6[4] = self;
    v7 = v3;
    objc_msgSend(v7, "preflightWithCompletion:", v6);

  }
}

void __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke(uint64_t a1)
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

void __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_3;
  v8[3] = &unk_1E3E64E10;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v11 = a2;
  v9 = v6;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_4;
    v7[3] = &unk_1E3E619E0;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v2;
    v3 = v2;
    objc_msgSend(v3, "pk_paymentSetupPreflight:", v7);

  }
  else
  {
    v4 = *(void **)(a1 + 48);
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      PKDisplayableErrorForCommonType();
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_handleProvisioningError:", v5);

  }
}

void __69__PKPaymentAddDebitCardViewController__presentPaymentSetupController__block_invoke_4(uint64_t a1, int a2)
{
  void *v2;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      objc_msgSend(*(id *)(a1 + 40), "setModalPresentationStyle:", 3);
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:withTransition:completion:", *(_QWORD *)(a1 + 40), 1, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
    }
  }
  else
  {
    PKDisplayableErrorForCommonType();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_handleProvisioningError:", v4);

  }
}

- (void)_handleProvisioningError:(id)a3
{
  id v4;

  +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAddDebitCardViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4;
  PKPaymentSetupNavigationController *v5;

  v4 = a3;
  v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v4, -[PKExplanationViewController context](self, "context"));

  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", self);
  -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v5, "setShowsWelcomeViewController:", 0);
  -[PKPaymentSetupNavigationController setAllowsManualEntry:](v5, "setAllowsManualEntry:", 1);
  return v5;
}

- (void)_terminateSetupFlow
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKPaymentAddDebitCardViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (BOOL)showDebitCardHeroView
{
  return self->_showDebitCardHeroView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_peerPaymentSetupFlowController, 0);
}

@end
