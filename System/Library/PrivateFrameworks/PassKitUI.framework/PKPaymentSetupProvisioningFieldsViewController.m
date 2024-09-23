@implementation PKPaymentSetupProvisioningFieldsViewController

- (PKPaymentSetupProvisioningFieldsViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  return -[PKPaymentSetupProvisioningFieldsViewController initWithProvisioningController:context:setupDelegate:](self, "initWithProvisioningController:context:setupDelegate:", 0, a4, a5, a6);
}

- (PKPaymentSetupProvisioningFieldsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5
{
  return -[PKPaymentSetupProvisioningFieldsViewController initWithProvisioningController:context:setupDelegate:setupFieldsModel:](self, "initWithProvisioningController:context:setupDelegate:setupFieldsModel:", a3, a4, a5, 0);
}

- (PKPaymentSetupProvisioningFieldsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v10;
  id v11;
  void *v12;
  PKPaymentSetupProvisioningFieldsViewController *v13;
  RemoteUIController *v14;
  RemoteUIController *termsUIController;
  objc_super v17;

  v10 = a6;
  v11 = a5;
  objc_msgSend(a3, "webService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentSetupProvisioningFieldsViewController;
  v13 = -[PKPaymentSetupFieldsViewController initWithWebService:context:setupDelegate:setupFieldsModel:](&v17, sel_initWithWebService_context_setupDelegate_setupFieldsModel_, v12, a4, v11, v10);

  if (v13)
  {
    v14 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E0D872F0]);
    termsUIController = v13->_termsUIController;
    v13->_termsUIController = v14;

    -[RemoteUIController setDelegate:](v13->_termsUIController, "setDelegate:", v13);
  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CLInUseAssertion invalidate](self->_CLInUse, "invalidate");
  -[UINotificationFeedbackGenerator deactivate](self->_cardAddedFeedbackGenerator, "deactivate");
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupProvisioningFieldsViewController;
  -[PKPaymentSetupTableViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UINotificationFeedbackGenerator *v5;
  UINotificationFeedbackGenerator *cardAddedFeedbackGenerator;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupProvisioningFieldsViewController;
  -[PKPaymentSetupFieldsViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3A58]);
  -[PKPaymentSetupProvisioningFieldsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UINotificationFeedbackGenerator *)objc_msgSend(v3, "initWithView:", v4);
  cardAddedFeedbackGenerator = self->_cardAddedFeedbackGenerator;
  self->_cardAddedFeedbackGenerator = v5;

  -[UINotificationFeedbackGenerator activateWithCompletionBlock:](self->_cardAddedFeedbackGenerator, "activateWithCompletionBlock:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  CLInUseAssertion *v7;
  CLInUseAssertion *CLInUse;
  objc_super v9;

  v3 = a3;
  if (!self->_CLInUse)
  {
    v5 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CLInUseAssertion *)objc_msgSend(v5, "newAssertionForBundle:withReason:", v6, CFSTR("Passbook showing add card UI"));
    CLInUse = self->_CLInUse;
    self->_CLInUse = v7;

  }
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupProvisioningFieldsViewController;
  -[PKPaymentSetupFieldsViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  CLInUseAssertion *CLInUse;
  CLInUseAssertion *v6;
  objc_super v7;

  v3 = a3;
  CLInUse = self->_CLInUse;
  if (CLInUse)
  {
    -[CLInUseAssertion invalidate](CLInUse, "invalidate");
    v6 = self->_CLInUse;
    self->_CLInUse = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupProvisioningFieldsViewController;
  -[PKPaymentSetupFieldsViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (id)_cardDetailsFooterView
{
  PKPaymentSetupFooterView *cardDetailsFooterView;
  PKPaymentSetupFooterView *v4;
  int64_t v5;
  PKPaymentSetupFooterView *v6;
  PKPaymentSetupFooterView *v7;
  void *v8;
  PKPaymentSetupFooterView *v9;
  void *v10;
  PKPaymentSetupFooterView *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v18;

  cardDetailsFooterView = self->_cardDetailsFooterView;
  if (!cardDetailsFooterView)
  {
    v4 = [PKPaymentSetupFooterView alloc];
    v5 = -[PKPaymentSetupTableViewController context](self, "context");
    v6 = -[PKPaymentSetupFooterView initWithFrame:context:](v4, "initWithFrame:context:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_cardDetailsFooterView;
    self->_cardDetailsFooterView = v6;

    -[PKPaymentSetupFooterView manualEntryButton](self->_cardDetailsFooterView, "manualEntryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_addDifferentCard_, 0x2000);

    v9 = self->_cardDetailsFooterView;
    if (self->_hideSetupLaterButton)
    {
      -[PKPaymentSetupFooterView setSetupLaterButton:](v9, "setSetupLaterButton:", 0);
    }
    else
    {
      -[PKPaymentSetupFooterView setupLaterButton](v9, "setupLaterButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_setupLater_, 0x2000);

    }
    v11 = self->_cardDetailsFooterView;
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    -[PKPaymentSetupFooterView sizeThatFits:](v11, "sizeThatFits:", CGRectGetWidth(v18), 3.40282347e38);
    v14 = v13;
    v16 = v15;

    -[PKPaymentSetupFooterView setFrame:](self->_cardDetailsFooterView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v14, v16);
    cardDetailsFooterView = self->_cardDetailsFooterView;
  }
  return cardDetailsFooterView;
}

- (void)suppressFooterViewSkipCardButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CGRect v7;

  -[PKPaymentSetupProvisioningFieldsViewController _cardDetailsFooterView](self, "_cardDetailsFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSkipCardButton:", 0);

  -[PKPaymentSetupProvisioningFieldsViewController _cardDetailsFooterView](self, "_cardDetailsFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProvisioningFieldsViewController footerView](self, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "_tableFooterHeightDidChangeToHeight:", CGRectGetHeight(v7));

}

- (void)suppressFooterViewSetupLaterButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CGRect v7;

  -[PKPaymentSetupProvisioningFieldsViewController _cardDetailsFooterView](self, "_cardDetailsFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSetupLaterButton:", 0);

  -[PKPaymentSetupProvisioningFieldsViewController _cardDetailsFooterView](self, "_cardDetailsFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProvisioningFieldsViewController footerView](self, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "_tableFooterHeightDidChangeToHeight:", CGRectGetHeight(v7));

}

- (void)suppressFooterViewManualEntryButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CGRect v7;

  -[PKPaymentSetupProvisioningFieldsViewController _cardDetailsFooterView](self, "_cardDetailsFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setManualEntryButton:", 0);

  -[PKPaymentSetupProvisioningFieldsViewController _cardDetailsFooterView](self, "_cardDetailsFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProvisioningFieldsViewController footerView](self, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "_tableFooterHeightDidChangeToHeight:", CGRectGetHeight(v7));

}

- (void)setNotificationTextInFooterView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CGRect v10;

  v4 = a3;
  -[PKPaymentSetupProvisioningFieldsViewController _cardDetailsFooterView](self, "_cardDetailsFooterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v4);

  -[PKPaymentSetupProvisioningFieldsViewController _cardDetailsFooterView](self, "_cardDetailsFooterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProvisioningFieldsViewController footerView](self, "footerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v9, "_tableFooterHeightDidChangeToHeight:", CGRectGetHeight(v10));

}

- (void)showVerifiedUIForPass:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void (*v15)(id);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "supportsBarcodePayment");
  v6 = (void *)MEMORY[0x1E0D66A58];
  v7 = *MEMORY[0x1E0D69900];
  v24[0] = *MEMORY[0x1E0D698F8];
  v24[1] = v7;
  v24[2] = *MEMORY[0x1E0D69950];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D68F50];
  v22[0] = *MEMORY[0x1E0D68AA0];
  v22[1] = v9;
  v10 = *MEMORY[0x1E0D697F0];
  v23[0] = *MEMORY[0x1E0D68C50];
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subjects:sendEvent:", v8, v11);

  -[PKPaymentSetupFieldsViewController showCheckmarkAnimated:](self, "showCheckmarkAnimated:", 1);
  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v14 = v13;
  if (!v5)
  {
    if (objc_msgSend(v4, "accessType") == 3)
    {
      objc_msgSend(v14, "appendString:", CFSTR("KEY_ADDED"));
      objc_msgSend(v12, "appendString:", CFSTR("KEY_ADDED_MESSAGE"));
    }
    else
    {
      if (objc_msgSend(v4, "associatedAccountFeatureIdentifier") == 4)
      {
        objc_msgSend(v14, "appendString:", CFSTR("CARD_ADDED_TITLE"));
        objc_msgSend(v12, "appendString:", CFSTR("CARD_ADDED_BODY"));
        v15 = (void (*)(id))MEMORY[0x1E0D6BD50];
        MEMORY[0x1E0D6BD50](v14);
        goto LABEL_9;
      }
      objc_msgSend(v14, "appendString:", CFSTR("CARD_ADDED"));
      -[PKPaymentSetupFieldsViewController webService](self, "webService");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "targetDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deviceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("CARD_ADDED_MESSAGE"), objc_msgSend(v18, "isEqualToString:", CFSTR("Apple Watch")));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v19);

    }
    v15 = (void (*)(id))MEMORY[0x1E0D6BDD0];
    MEMORY[0x1E0D6BDD0](v14);
    goto LABEL_9;
  }
  objc_msgSend(v13, "appendString:", CFSTR("ACCOUNT_ADDED"));
  objc_msgSend(v12, "appendString:", CFSTR("ACCOUNT_ADDED_MESSAGE"));
  v15 = (void (*)(id))MEMORY[0x1E0D6BD88];
  MEMORY[0x1E0D6BD88](v14);
LABEL_9:
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v15(v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController hideActivitySpinnerWithTitle:subtitle:animated:](self, "hideActivitySpinnerWithTitle:subtitle:animated:", v20, v21, 0);

  -[PKPaymentSetupFieldsViewController endUserInteraction](self, "endUserInteraction");
}

- (void)displayTermsForTermsURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPortraitNavigationController *v9;
  void *v10;
  void *v11;
  void *v12;
  RemoteUIController *termsUIController;
  PKPortraitNavigationController *v14;
  void *v15;
  void *v16;
  PKPaymentSetupProvisioningFieldsViewController *v17;
  _QWORD v18[4];
  PKPortraitNavigationController *v19;
  PKPaymentSetupProvisioningFieldsViewController *v20;
  id v21;
  id v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKPaymentSetupProvisioningFieldsViewController parentViewController](self, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    -[PKPaymentSetupProvisioningFieldsViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rootViewController");
    v17 = (PKPaymentSetupProvisioningFieldsViewController *)objc_claimAutoreleasedReturnValue();

    if (v17 != self)
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
      goto LABEL_6;
    }
  }
  -[PKPaymentSetupProvisioningFieldsViewController resignFirstResponder](self, "resignFirstResponder");
  v9 = objc_alloc_init(PKPortraitNavigationController);
  -[PKPortraitNavigationController setModalInPresentation:](v9, "setModalInPresentation:", 1);
  -[RemoteUIController setNavigationController:](self->_termsUIController, "setNavigationController:", v9);
  -[RemoteUIController loader](self->_termsUIController, "loader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController webService](self, "webService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowNonSecureHTTP:", objc_msgSend(v12, "devSigned"));

  objc_initWeak(&location, self);
  termsUIController = self->_termsUIController;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E3E635C0;
  objc_copyWeak(&v23, &location);
  v14 = v9;
  v19 = v14;
  v20 = self;
  v22 = v7;
  v21 = v6;
  -[RemoteUIController loadURL:postBody:completion:](termsUIController, "loadURL:postBody:completion:", v21, 0, v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

LABEL_6:
}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E3E63598;
  objc_copyWeak(&v15, (id *)(a1 + 64));
  v16 = a2;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  v14 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 48);
  v13 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v15);
}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      PKPaymentSetupApplyContextAppearance(objc_msgSend(WeakRetained, "context"), *(void **)(a1 + 32));
      v5 = objc_msgSend(*(id *)(a1 + 40), "pkui_userInterfaceIdiomSupportsLargeLayouts");
      v6 = MEMORY[0x1E0C809B0];
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "topViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "navigationController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v7 && v8)
        {
          objc_msgSend(v7, "navigationItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setHidesBackButton:", 1);

          objc_msgSend(v9, "pushViewController:animated:", v7, 1);
          aBlock[0] = v6;
          aBlock[1] = 3221225472;
          aBlock[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_3;
          aBlock[3] = &unk_1E3E612E8;
          v31 = v9;
          v11 = _Block_copy(aBlock);

        }
        else
        {
          objc_msgSend(v8, "setModalPresentationStyle:", 3);
          objc_msgSend(v4, "presentViewController:withTransition:completion:", v9, 1, 0);
          v28[0] = v6;
          v28[1] = 3221225472;
          v28[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_4;
          v28[3] = &unk_1E3E61310;
          objc_copyWeak(&v29, v2);
          v11 = _Block_copy(v28);
          objc_destroyWeak(&v29);
        }

      }
      else
      {
        objc_msgSend(v4, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
        v26[0] = v6;
        v26[1] = 3221225472;
        v26[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_5;
        v26[3] = &unk_1E3E61310;
        objc_copyWeak(&v27, v2);
        v11 = _Block_copy(v26);
        objc_destroyWeak(&v27);
      }
      v14 = (void *)v4[153];
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_6;
      v22[3] = &unk_1E3E7B750;
      objc_copyWeak(&v25, v2);
      v15 = v11;
      v23 = v15;
      v24 = *(id *)(a1 + 64);
      objc_msgSend(v14, "setHandlerForElementName:handler:", CFSTR("agree"), v22);
      v16 = (void *)v4[153];
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_7;
      v18[3] = &unk_1E3E7B750;
      objc_copyWeak(&v21, v2);
      v17 = v15;
      v19 = v17;
      v20 = *(id *)(a1 + 64);
      objc_msgSend(v16, "setHandlerForElementName:handler:", CFSTR("disagree"), v18);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v25);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v33 = v13;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Error loading terms UI at %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
  }

}

id __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "popViewControllerAnimated:", 1);
}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

void __96__PKPaymentSetupProvisioningFieldsViewController_displayTermsForTermsURL_withCompletionHandler___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

- (void)addDifferentCard:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "provisioningViewControllerDidSelectManualEntry:", self);

}

- (void)setupLater:(id)a3
{
  id v4;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68490], 0, a3);
  -[PKPaymentSetupFieldsViewController setupDelegate](self, "setupDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerDidTerminateSetupFlow:", self);

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v6;

  if (self->_termsUIController == a3)
  {
    v6 = a4;
    PKPaymentSetupApplyContextAppearance(-[PKPaymentSetupTableViewController context](self, "context"), v6);

  }
}

- (id)defaultHeaderViewTitle
{
  return (id)PKLocalizedPaymentString(CFSTR("ADD_CARD"));
}

- (id)defaultHeaderViewSubTitle
{
  return (id)PKLocalizedPaymentString(CFSTR("ENTER_CARD_INFO_MANUAL"));
}

- (void)updateLocationAuthorization
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  -[PKPaymentSetupTableViewController context](self, "context");
  if (PKPaymentSetupContextIsSetupAssistant())
  {
    if (objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled"))
    {
      v2 = (void *)MEMORY[0x1E0C9E3C8];
      PKPassKitCoreBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundlePath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v2) = objc_msgSend(v2, "authorizationStatusForBundlePath:", v4);

      if (!(_DWORD)v2)
      {
        PKLogFacilityTypeGetObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Setting authorization status for PassKitCore to WhenInUse", v8, 2u);
        }

        v6 = (void *)MEMORY[0x1E0C9E3C8];
        PKPassKitCoreBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAuthorizationStatusByType:forBundle:", 4, v7);

      }
    }
  }
}

- (void)resetRightBarButtonState
{
  -[PKPaymentSetupFieldsViewController _setRightBarButtonItemsEnabled:](self, "_setRightBarButtonItemsEnabled:", -[PKPaymentSetupFieldsViewController isComplete](self, "isComplete"));
}

- (PKPaymentProvisioningController)paymentProvisioningController
{
  return self->_paymentProvisioningController;
}

- (void)setPaymentProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_paymentProvisioningController, a3);
}

- (BOOL)hideSetupLaterButton
{
  return self->_hideSetupLaterButton;
}

- (void)setHideSetupLaterButton:(BOOL)a3
{
  self->_hideSetupLaterButton = a3;
}

- (id)continueActionHandler
{
  return self->_continueActionHandler;
}

- (void)setContinueActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1264);
}

- (BOOL)isProvisioningHomeKey
{
  return self->_provisioningHomeKey;
}

- (BOOL)ignoreProgressDescriptionUpdates
{
  return self->_ignoreProgressDescriptionUpdates;
}

- (void)setIgnoreProgressDescriptionUpdates:(BOOL)a3
{
  self->_ignoreProgressDescriptionUpdates = a3;
}

- (PKPaymentProvisioningViewControllerDelegate)flowItemDelegate
{
  return (PKPaymentProvisioningViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
}

- (void)setFlowItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowItemDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong(&self->_continueActionHandler, 0);
  objc_storeStrong((id *)&self->_paymentProvisioningController, 0);
  objc_storeStrong((id *)&self->_cardAddedFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_CLInUse, 0);
  objc_storeStrong((id *)&self->_termsUIController, 0);
  objc_storeStrong((id *)&self->_cardDetailsFooterView, 0);
}

@end
