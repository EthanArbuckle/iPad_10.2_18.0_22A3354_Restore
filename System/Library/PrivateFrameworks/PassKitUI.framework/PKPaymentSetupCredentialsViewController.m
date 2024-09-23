@implementation PKPaymentSetupCredentialsViewController

- (PKPaymentSetupCredentialsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 credentials:(id)a5 product:(id)a6 allowsManualEntry:(BOOL)a7 reporter:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  PKPaymentSetupCredentialsViewController *v18;
  PKPaymentSetupCredentialsSectionController *v19;
  PKPaymentSetupCredentialsSectionController *sectionController;
  objc_super v22;

  v9 = a7;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentSetupCredentialsViewController;
  v18 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v22, sel_initWithProvisioningController_context_delegate_, v14, a4, 0);
  if (v18)
  {
    v19 = -[PKPaymentSetupCredentialsSectionController initWithCredentials:provisioningController:context:product:]([PKPaymentSetupCredentialsSectionController alloc], "initWithCredentials:provisioningController:context:product:", v15, v14, a4, v16);
    sectionController = v18->_sectionController;
    v18->_sectionController = v19;

    -[PKPaymentSetupCredentialsSectionController setDelegate:](v18->_sectionController, "setDelegate:", v18);
    -[PKPaymentSetupCredentialsSectionController setDataChangeDelegate:](v18->_sectionController, "setDataChangeDelegate:", v18);
    objc_storeStrong((id *)&v18->_product, a6);
    -[PKPaymentSetupOptionsViewController setAllowsManualEntry:](v18, "setAllowsManualEntry:", v9);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v18, "setUseItemIdentityWhenUpdating:", 1);
    objc_storeStrong((id *)&v18->_reporter, a8);
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[LAContext invalidate](self->_localAuthenticationContext, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupCredentialsViewController;
  -[PKPaymentSetupCredentialsViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupCredentialsViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v3, "setAllowsSelectionDuringEditing:", 1);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E68]);
  -[PKPaymentSetupProduct configuration](self->_product, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 6)
  {
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_BANK_EXTENSION_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupProduct displayName](self->_product, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_BANK_EXTENSION_SUBTITLE"), CFSTR("%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v5 == 11)
  {
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_CARKEY_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_CARKEY_SUBTITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_showPrivacyDisclosure = 2;
  }
  else
  {
    if (v5 == 9)
      PKLocalizedAquamanString(CFSTR("ACCOUNTS_ON_FILE"));
    else
      PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_YOUR_CARDS_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_YOUR_CARDS_SUBTITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v6);
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v8);
  -[PKPaymentSetupOptionsViewController setNoResultsIcon:](self, "setNoResultsIcon:", 0);
  -[PKPaymentSetupOptionsViewController setNoResultsTitle:](self, "setNoResultsTitle:", 0);
  PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_YOUR_CARDS_NO_RESULTS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setNoResultsSubtitle:](self, "setNoResultsSubtitle:", v9);

  -[PKPaymentSetupCredentialsViewController _configureAndUpdateDockView](self, "_configureAndUpdateDockView");
  v14[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v10, 0);

  -[PKPaymentSetupCredentialsViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  v11 = -[PKPaymentSetupOptionsViewController context](self, "context");
  -[PKPaymentSetupCredentialsViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentSetupApplyContextAppearance(v11, v12);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupCredentialsViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPaymentSetupCredentialsSectionController reloadCredentialStores](self->_sectionController, "reloadCredentialStores");
  -[PKPaymentSetupCredentialsViewController _updateEditButtonVisibility](self, "_updateEditButtonVisibility");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupCredentialsViewController;
  -[PKPaymentSetupOptionsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupCredentialsViewController;
  -[PKDynamicCollectionViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKPaymentSetupCredentialsViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D69950];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69950]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    self->_didBeginWalletProvisioningSubject = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v3);
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginWalletProvisioningSubject)
  {
    self->_didBeginWalletProvisioningSubject = 0;
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69950]);
  }
}

- (void)reloadAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v3 = a3;
  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupCredentialsViewController;
  -[PKPaymentSetupOptionsViewController setSections:animated:](&v6, sel_setSections_animated_, v5, v3);

}

- (void)presentRefundFlowForCredential:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupCredentialsViewController _presentProvisioningFlowForCredentials:](self, "_presentProvisioningFlowForCredentials:", v6, v7, v8);
}

- (void)presentUnavailableDetailsForCredential:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupCredentialsViewController _presentProvisioningFlowForCredentials:](self, "_presentProvisioningFlowForCredentials:", v6, v7, v8);
}

- (void)showMaxSelectionAlertForCredential:(id)a3
{
  PKPaymentSetupProduct *product;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  product = self->_product;
  v5 = a3;
  -[PKPaymentSetupProduct configuration](product, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  v8 = -[PKPaymentSetupCredentialsSectionController maximumNumberOfSelectableCredentials](self->_sectionController, "maximumNumberOfSelectableCredentials");
  if (v8 == -1)
  {
    PKLocalizedPaymentString(CFSTR("MAX_CARDS_SELECTED_TITLE_GENERIC"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7 == 9)
      PKLocalizedAquamanString(CFSTR("MAX_ACCOUNTS_SELECTED_TITLE"), CFSTR("%lu"), v8);
    else
      PKLocalizedString(CFSTR("MAX_CARDS_SELECTED_TITLE"), CFSTR("%lu"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (id)v9;
  objc_msgSend(v5, "longDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPaymentString(CFSTR("MAX_CARDS_SELECTED_MESSAGE"), CFSTR("%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v16, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("MAX_CARDS_SELECTED_BUTTON"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v15);

  -[PKPaymentSetupCredentialsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
}

- (void)showDeleteConfirmationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKPaymentSetupCredentialsViewController *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  if (v4)
  {
    -[PKPaymentSetupCredentialsViewController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[PKPaymentSetupCredentialsViewController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topViewController");
      v7 = (PKPaymentSetupCredentialsViewController *)objc_claimAutoreleasedReturnValue();

      if (v7 == self)
      {
        PKLocalizedPaymentString(CFSTR("DELETE_CARD_CONFIRMATION_ALERT_TITLE"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("DELETE_CARD_CONFIRMATION_ALERT_CONFIRM_BUTTON"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = MEMORY[0x1E0C809B0];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __80__PKPaymentSetupCredentialsViewController_showDeleteConfirmationWithCompletion___block_invoke;
        v24[3] = &unk_1E3E61CA8;
        v14 = v4;
        v25 = v14;
        objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 2, v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v15);

        v16 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("DELETE_CARD_CONFIRMATION_ALERT_CANCEL_BUTTON"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v13;
        v20 = 3221225472;
        v21 = __80__PKPaymentSetupCredentialsViewController_showDeleteConfirmationWithCompletion___block_invoke_2;
        v22 = &unk_1E3E61CA8;
        v23 = v14;
        objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, &v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v18, v19, v20, v21, v22);

        -[PKPaymentSetupCredentialsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
        goto LABEL_6;
      }
    }
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
LABEL_6:

}

uint64_t __80__PKPaymentSetupCredentialsViewController_showDeleteConfirmationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PKPaymentSetupCredentialsViewController_showDeleteConfirmationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showUnableToDeleteCredentialError
{
  void *v3;
  void *v4;
  PKPaymentSetupCredentialsViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[PKPaymentSetupCredentialsViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  -[PKPaymentSetupCredentialsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (PKPaymentSetupCredentialsViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    PKLocalizedPaymentString(CFSTR("UNABLE_TO_DELETE_CARD_ERROR_ALERT_TITLE"));
    v11 = objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("UNABLE_TO_DELETE_CARD_ERROR_ALERT_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v11, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("UNABLE_TO_DELETE_CARD_ERROR_ALERT_BUTTON"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v10);

    -[PKPaymentSetupCredentialsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    v3 = (void *)v11;
LABEL_2:

  }
}

- (void)showUnableToDeleteSafariCredentialError
{
  void *v3;
  void *v4;
  PKPaymentSetupCredentialsViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[PKPaymentSetupCredentialsViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  -[PKPaymentSetupCredentialsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (PKPaymentSetupCredentialsViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    PKLocalizedVirtualCardString(CFSTR("SAFARI_CARD_IMPORT_UNABLE_TO_DELETE_CARD_ERROR_ALERT_TITLE"));
    v11 = objc_claimAutoreleasedReturnValue();
    PKLocalizedVirtualCardString(CFSTR("SAFARI_CARD_IMPORT_UNABLE_TO_DELETE_CARD_ERROR_ALERT_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v11, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("UNABLE_TO_DELETE_CARD_ERROR_ALERT_BUTTON"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v10);

    -[PKPaymentSetupCredentialsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    v3 = (void *)v11;
LABEL_2:

  }
}

- (void)showCredentialDeletionError
{
  void *v3;
  void *v4;
  PKPaymentSetupCredentialsViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[PKPaymentSetupCredentialsViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  -[PKPaymentSetupCredentialsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (PKPaymentSetupCredentialsViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    PKLocalizedPaymentString(CFSTR("DELETE_CARD_ERROR_ALERT_TITLE"));
    v11 = objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("DELETE_CARD_ERROR_ALERT_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v11, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("DELETE_CARD_ERROR_ALERT_BUTTON"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v10);

    -[PKPaymentSetupCredentialsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    v3 = (void *)v11;
LABEL_2:

  }
}

- (void)setShowNoResultsView:(BOOL)a3
{
  -[PKPaymentSetupOptionsViewController setShowNoResultsView:animated:](self, "setShowNoResultsView:animated:", a3, 1);
  -[PKPaymentSetupCredentialsViewController _updateEditButtonVisibility](self, "_updateEditButtonVisibility");
}

- (void)_configureAndUpdateDockView
{
  $96EE1C12479E9B303E9C2794B92A11A2 v3;
  _BOOL4 v4;
  int IsExpressSetupAssistant;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t showPrivacyDisclosure;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;

  v3 = ($96EE1C12479E9B303E9C2794B92A11A2)-[PKPaymentSetupCredentialsSectionController credentialSelectionState](self->_sectionController, "credentialSelectionState");
  v4 = -[PKPaymentSetupOptionsViewController allowsManualEntry](self, "allowsManualEntry");
  -[PKPaymentSetupOptionsViewController context](self, "context");
  IsExpressSetupAssistant = PKPaymentSetupContextIsExpressSetupAssistant();
  v6 = IsExpressSetupAssistant;
  if (v3.var0 || v4 || (IsExpressSetupAssistant & 1) != 0)
  {
    -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (!self->_isDockViewConfigured)
    {
      self->_isDockViewConfigured = 1;
      objc_msgSend(v23, "primaryButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnabled:", 1);
      objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__continueButtonPressed, 0x2000);
      PKLocalizedPaymentString(CFSTR("CONTINUE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:forState:", v8, 0);

      objc_msgSend(v23, "setButtonsEnabled:", 1);
      objc_msgSend(v23, "footerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v6)
      {
        objc_msgSend(v9, "setForceShowSetupLaterButton:", 1);
        objc_msgSend(v10, "setupLaterButton");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__setupLaterTapped, 0x2000);

      }
      if (v4)
      {
        objc_msgSend(v10, "manualEntryButton");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__presentManualAddController, 0x2000);
        -[PKPaymentSetupProduct configuration](self->_product, "configuration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "type");

        if (v14 == 9)
          PKLocalizedAquamanString(CFSTR("ADD_A_DIFFERENT_ACCOUNT"));
        else
          PKLocalizedPaymentString(CFSTR("ADD_A_NEW_CARD"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTitle:forState:", v15, 0);

      }
      if (-[PKPaymentSetupOptionsViewController allowsManualEntry](self, "allowsManualEntry")
        && -[PKPaymentSetupCredentialsViewController _readerModeIsSupported](self, "_readerModeIsSupported"))
      {
        objc_msgSend(v10, "secondaryActionButton");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_TRANSFER_BALANCE_MESSAGE"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTitle:forState:", v17, 0);

        objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__transferExistingCardTapped, 0x2000);
      }
      objc_msgSend(v10, "setButtonsEnabled:", 1);
      if (!v4)
        objc_msgSend(v10, "setManualEntryButton:", 0);
      if ((v6 & 1) == 0)
        objc_msgSend(v10, "setSetupLaterButton:", 0);

    }
    showPrivacyDisclosure = self->_showPrivacyDisclosure;
    if (showPrivacyDisclosure == 1
      || !showPrivacyDisclosure && (PKPaymentSetupContextIsNonExpressSetupAssistant() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 255);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupOptionsViewController setPrivacyLink:](self, "setPrivacyLink:", v19);

    }
    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEditing");

    LOBYTE(v20) = v21 ^ 1;
    objc_msgSend(v23, "setButtonsEnabled:", v21 ^ 1u);
    objc_msgSend(v23, "primaryButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEnabled:", v20 & ((unsigned __int16)(*(_WORD *)&v3 & 0x100) >> 8));

  }
  else
  {
    self->_isDockViewConfigured = 0;
    -[PKPaymentSetupOptionsViewController removeSetupDockView](self, "removeSetupDockView");
  }
}

- (BOOL)_readerModeIsSupported
{
  void *v3;
  BOOL v4;

  if (!objc_msgSend(MEMORY[0x1E0D66C68], "isSupported"))
    return 0;
  -[PKPaymentSetupProduct provisioningMethodMetadataForType:](self->_product, "provisioningMethodMetadataForType:", *MEMORY[0x1E0D6AE40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (-[PKPaymentSetupProduct allSupportedProtocols](self->_product, "allSupportedProtocols") & 4) == 0
      || PKFelicaSecureElementIsAvailable() != 0;
  else
    v4 = 0;

  return v4;
}

- (void)_presentCredentialDoubleCheckAlert:(id)a3 continueHandler:(id)a4 setupLaterHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  void (**v28)(_QWORD);
  _QWORD v29[5];
  id v30;
  void (**v31)(_QWORD);

  v8 = a3;
  v9 = (void (**)(_QWORD))a4;
  v10 = (void (**)(_QWORD))a5;
  -[PKPaymentSetupOptionsViewController context](self, "context");
  if ((PKPaymentSetupContextIsiOSSetupAssistant() & 1) != 0)
  {
    objc_msgSend(v8, "accountCredential");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedFeatureString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedFeatureString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke;
      v29[3] = &unk_1E3E683F0;
      v29[4] = self;
      v30 = v8;
      v31 = v9;
      objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v21);

      v22 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedFeatureString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v20;
      v26[1] = 3221225472;
      v26[2] = __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_2;
      v26[3] = &unk_1E3E683C8;
      v27 = v13;
      v28 = v10;
      v24 = v13;
      objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v25);

      -[PKPaymentSetupCredentialsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
    }
    else if (v9)
    {
      v9[2](v9);
    }

  }
  else
  {
    v10[2](v10);
  }

}

uint64_t __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 1272), "setCredential:selected:", a1[5], 1);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_3;
  v4[3] = &unk_1E3E61590;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "scheduleSetupReminderForAccountWithIdentifier:completion:", v3, v4);

}

void __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_4;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __112__PKPaymentSetupCredentialsViewController__presentCredentialDoubleCheckAlert_continueHandler_setupLaterHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_continueButtonPressed
{
  id v3;
  void *v4;
  _QWORD aBlock[5];

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPaymentSetupCredentialsViewController__continueButtonPressed__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v3 = v4;
  PKRequestContactAccessWithCompletion();

}

void __65__PKPaymentSetupCredentialsViewController__continueButtonPressed__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "selectedCredentials");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_requestAuthAndStartProvisioningForCredentials:", v2);

}

void __65__PKPaymentSetupCredentialsViewController__continueButtonPressed__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "unselectedCredentialRequiringAction");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (id)v2;
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "_presentCredentialDoubleCheckAlert:continueHandler:setupLaterHandler:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_transferExistingCardTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "credentialsViewControllerDidSelectSecondaryManualEntry:", self);

}

- (void)_setupLaterTapped
{
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD);
  void *v6;
  _QWORD v7[5];
  _QWORD aBlock[5];

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 3);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKPaymentSetupCredentialsViewController__setupLaterTapped__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __60__PKPaymentSetupCredentialsViewController__setupLaterTapped__block_invoke_2;
  v7[3] = &unk_1E3E612E8;
  v7[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(v7);
  -[PKPaymentSetupCredentialsSectionController availableCredentialRequiringAction](self->_sectionController, "availableCredentialRequiringAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PKPaymentSetupCredentialsViewController _presentCredentialDoubleCheckAlert:continueHandler:setupLaterHandler:](self, "_presentCredentialDoubleCheckAlert:continueHandler:setupLaterHandler:", v6, v4, v5);
  else
    v5[2](v5);

}

void __60__PKPaymentSetupCredentialsViewController__setupLaterTapped__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "selectedCredentials");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "count");
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "_requestAuthAndStartProvisioningForCredentials:", v4);
  else
    objc_msgSend(v3, "_terminateSetupFlow");

}

uint64_t __60__PKPaymentSetupCredentialsViewController__setupLaterTapped__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateSetupFlow");
}

- (void)_presentManualAddController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  objc_msgSend(WeakRetained, "credentialsViewControllerDidSelectManualEntry:", self);

}

- (void)_reportSelectedCredentials:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v20 = *MEMORY[0x1E0D6AFE8];
    v19 = *MEMORY[0x1E0D69498];
    v18 = *MEMORY[0x1E0D6AFF0];
    v7 = *MEMORY[0x1E0D694A0];
    v8 = *MEMORY[0x1E0D694A8];
    v9 = &stru_1E3E7D690;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "cardType");
        v12 = v8;
        switch(v11)
        {
          case 0:
            goto LABEL_11;
          case 1:
            v12 = v7;
            goto LABEL_11;
          case 2:
            v12 = v18;
            goto LABEL_11;
          case 3:
            v12 = v19;
            goto LABEL_11;
          case 4:
            v12 = v20;
LABEL_11:
            -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("%@,"), v12);
            v13 = objc_claimAutoreleasedReturnValue();

            v9 = (__CFString *)v13;
            break;
          default:
            continue;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v5);
  }
  else
  {
    v9 = &stru_1E3E7D690;
  }
  reporter = self->_reporter;
  v15 = *MEMORY[0x1E0D69488];
  v25[0] = *MEMORY[0x1E0D68AA0];
  v25[1] = v15;
  v26[0] = *MEMORY[0x1E0D68B28];
  v26[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](reporter, "reportEvent:", v16);

}

- (void)_requestAuthAndStartProvisioningForCredentials:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  -[PKPaymentSetupCredentialsViewController _setUserInteractionEnabled:](self, "_setUserInteractionEnabled:", 0);
  -[PKPaymentSetupCredentialsViewController _reportSelectedCredentials:](self, "_reportSelectedCredentials:", v4);
  if (-[PKPaymentSetupCredentialsSectionController doesContainCredentialThatRequiresAuth:](self->_sectionController, "doesContainCredentialThatRequiresAuth:", v4))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __90__PKPaymentSetupCredentialsViewController__requestAuthAndStartProvisioningForCredentials___block_invoke;
    v5[3] = &unk_1E3E77EC8;
    v5[4] = self;
    v6 = v4;
    -[PKPaymentSetupCredentialsViewController _requestExternalizedAuthIfNeededWithCompletion:](self, "_requestExternalizedAuthIfNeededWithCompletion:", v5);

  }
  else
  {
    -[PKPaymentSetupCredentialsViewController _presentProvisioningFlowForCredentials:](self, "_presentProvisioningFlowForCredentials:", v4);
  }

}

void __90__PKPaymentSetupCredentialsViewController__requestAuthAndStartProvisioningForCredentials___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (v5)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = *(id *)(a1 + 40);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "state", (_QWORD)v13);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setExternalizedAuth:", v6);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_presentProvisioningFlowForCredentials:", *(_QWORD *)(a1 + 40), (_QWORD)v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setUserInteractionEnabled:", 1);
  }

}

- (void)_presentProvisioningFlowForCredentials:(id)a3
{
  PKPaymentSetupCredentialsViewControllerFlowDelegate **p_flowDelegate;
  id v5;
  id WeakRetained;

  p_flowDelegate = &self->_flowDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_flowDelegate);
  objc_msgSend(WeakRetained, "credentialsViewController:didSelectCredentials:", self, v5);

}

- (void)_setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  -[PKPaymentSetupCredentialsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v3);

  -[PKPaymentSetupCredentialsViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  if (self->_isDockViewConfigured)
  {
    -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "footerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setButtonsEnabled:", v3);

    objc_msgSend(v14, "primaryButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v3)
    {
      -[PKPaymentSetupCredentialsSectionController selectedCredentials](self->_sectionController, "selectedCredentials");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEnabled:", objc_msgSend(v12, "count") != 0);

    }
    else
    {
      objc_msgSend(v10, "setEnabled:", 0);
    }

    objc_msgSend(v14, "primaryButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShowSpinner:", v3 ^ 1);

  }
}

- (void)_terminateSetupFlow
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_flowDelegate);
    objc_msgSend(v5, "credentialsViewControllerDidTerminate:", self);

  }
  else
  {
    -[PKPaymentSetupCredentialsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_requestExternalizedAuthIfNeededWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  int64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  void (**v11)(id, uint64_t, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  _QWORD v17[5];
  void (**v18)(id, uint64_t, _QWORD);
  id v19;
  _QWORD aBlock[5];
  id v21;
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = -[PKPaymentSetupOptionsViewController context](self, "context");
  if (PKPaymentSetupContextIsSetupAssistant()
    && ((-[PKPaymentSetupOptionsViewController provisioningController](self, "provisioningController"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = objc_msgSend(v6, "hasExternalizedAuth"),
         v6,
         v5 != 5)
     || v7))
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("N");
      if (v7)
        v16 = CFSTR("Y");
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "CredentialsVC requestExternaliziedAuthIfNeededWithCompletion returning %@ for buddy.", buf, 0xCu);
    }

    v4[2](v4, 1, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("N");
      if (v5 == 4)
        v9 = CFSTR("Y");
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "CredentialsVC requestExternaliziedAuthIfNeededWithCompletion shouldGetAuthFromWatch %@.", buf, 0xCu);
    }

    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke;
    aBlock[3] = &unk_1E3E61850;
    aBlock[4] = self;
    v11 = v4;
    v21 = v11;
    v12 = _Block_copy(aBlock);
    v13 = v12;
    if (v5 == 4)
    {
      -[PKPaymentSetupOptionsViewController provisioningController](self, "provisioningController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_151;
      v17[3] = &unk_1E3E77F18;
      v17[4] = self;
      v18 = v11;
      v19 = v13;
      objc_msgSend(v14, "requestExternalizedAuthForWatchWithVisibleViewController:completion:", self, v17);

    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }

  }
}

void __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1296);
  *(_QWORD *)(v3 + 1296) = v2;

  v13[0] = &unk_1E3FADC18;
  PKLocalizedShareableCredentialString(CFSTR("LOCAL_AUTHENTICATION_REASON"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = &unk_1E3FADC30;
  v14[0] = v5;
  PKLocalizedString(CFSTR("WALLET"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(void **)(v8 + 1296);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_149;
  v11[3] = &unk_1E3E77EF0;
  v11[4] = v8;
  v12 = v9;
  objc_msgSend(v10, "evaluatePolicy:options:reply:", 1025, v7, v11);

}

void __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_149(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v4 = 0;
  if (a2 && !a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "externalizedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_QWORD *)(a1 + 32))
      v3 = CFSTR("Y");
    else
      v3 = CFSTR("N");
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "CredentialsVC requestExternaliziedAuthIfNeededWithCompletion requested local auth and returning %@.", (uint8_t *)&v6, 0xCu);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "provisioningController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeExternalizedAuth:", *(_QWORD *)(a1 + 32));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_151(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_2_152;
    block[3] = &unk_1E3E61450;
    v9 = v5;
    v7 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __90__PKPaymentSetupCredentialsViewController__requestExternalizedAuthIfNeededWithCompletion___block_invoke_2_152(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "CredentialsVC requestExternalizedAuthForWatchWithVisibleViewController returning error: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(_QWORD, BOOL, _QWORD))(a1[6] + 16))(a1[6], a1[4] == 0, 0);
  v4 = (void *)a1[4];
  if (v4)
  {
    v5 = (void *)a1[5];
    v6 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (void)_toggleEdit
{
  int v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "isEditing");
  v4 = v3 ^ 1u;
  objc_msgSend(v9, "setEditing:", v4);
  if (v3)
    v5 = CFSTR("EDIT_BUTTON");
  else
    v5 = CFSTR("DONE_BUTTON");
  PKLocalizedPaymentString(&v5->isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupCredentialsViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v6);

  -[PKPaymentSetupCredentialsSectionController setEditing:](self->_sectionController, "setEditing:", v4);
  -[PKPaymentSetupCredentialsViewController _configureAndUpdateDockView](self, "_configureAndUpdateDockView");
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 1);

}

- (void)_updateEditButtonVisibility
{
  void *v3;
  _BOOL4 v4;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  -[PKPaymentSetupCredentialsViewController navigationItem](self, "navigationItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[PKPaymentSetupCredentialsSectionController shouldShowEditButton](self->_sectionController, "shouldShowEditButton");
  if (v4 && v3 == 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("EDIT_BUTTON"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 2, self, sel__toggleEdit);

    objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67B30]);
    objc_msgSend(v11, "setRightBarButtonItem:", v10);

    goto LABEL_11;
  }
  if (v3)
    v6 = v4;
  else
    v6 = 1;
  v7 = v11;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v11, "setRightBarButtonItem:animated:", 0, 1);
LABEL_11:
    v7 = v11;
  }

}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  -[PKPaymentSetupCredentialsViewController _setUserInteractionEnabled:](self, "_setUserInteractionEnabled:", !a3, a4);
}

- (PKPaymentSetupCredentialsViewControllerFlowDelegate)flowDelegate
{
  return (PKPaymentSetupCredentialsViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (unint64_t)showPrivacyDisclosure
{
  return self->_showPrivacyDisclosure;
}

- (void)setShowPrivacyDisclosure:(unint64_t)a3
{
  self->_showPrivacyDisclosure = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_localAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
