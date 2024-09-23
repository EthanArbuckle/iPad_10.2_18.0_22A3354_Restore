@implementation PKAccountOtherCardNumbersViewController

- (PKAccountOtherCardNumbersViewController)initWithPhysicalCard:(id)a3 paymentPass:(id)a4 account:(id)a5 context:(int64_t)a6 preferDefaultTitle:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  PKAccountOtherCardNumbersViewController *v16;
  PKAccountOtherCardNumbersViewController *v17;
  uint64_t v18;
  PKAccountService *accountService;
  id v20;
  void *v21;
  void *v22;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKAccountOtherCardNumbersViewController;
  v16 = -[PKAccountOtherCardNumbersViewController initWithStyle:](&v24, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1));
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_physicalCard, a3);
    objc_storeStrong((id *)&v17->_paymentPass, a4);
    objc_storeStrong((id *)&v17->_account, a5);
    v17->_context = a6;
    v17->_preferDefaultTitle = a7;
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v18 = objc_claimAutoreleasedReturnValue();
    accountService = v17->_accountService;
    v17->_accountService = (PKAccountService *)v18;

    -[PKAccountService registerObserver:](v17->_accountService, "registerObserver:", v17);
    if (-[PKAccount feature](v17->_account, "feature") == 2)
    {
      v20 = objc_alloc(MEMORY[0x1E0C99D48]);
      v21 = (void *)objc_msgSend(v20, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
      -[PKAccount productTimeZone](v17->_account, "productTimeZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTimeZone:", v22);

      v17->_isPhysicalCardExpired = -[PKPhysicalCard isExpiredInCalendar:](v17->_physicalCard, "isExpiredInCalendar:", v21);
    }
    else
    {
      v17->_isPhysicalCardExpired = 0;
    }
  }

  return v17;
}

- (PKAccountOtherCardNumbersViewController)initWithPaymentPass:(id)a3 account:(id)a4 context:(int64_t)a5 preferDefaultTitle:(BOOL)a6
{
  id v11;
  id v12;
  PKAccountOtherCardNumbersViewController *v13;
  PKAccountOtherCardNumbersViewController *v14;
  uint64_t v15;
  PKAccountService *accountService;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountOtherCardNumbersViewController;
  v13 = -[PKAccountOtherCardNumbersViewController initWithStyle:](&v18, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1));
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_paymentPass, a3);
    objc_storeStrong((id *)&v14->_account, a4);
    v14->_context = a5;
    v14->_preferDefaultTitle = a6;
    v14->_isPhysicalCardExpired = 0;
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    accountService = v14->_accountService;
    v14->_accountService = (PKAccountService *)v15;

    -[PKAccountService registerObserver:](v14->_accountService, "registerObserver:", v14);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKAccountOtherCardNumbersViewController;
  -[PKAccountOtherCardNumbersViewController dealloc](&v3, sel_dealloc);
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PKAccountOtherCardNumbersViewController;
  -[PKSettingsTableViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[PKAccountOtherCardNumbersViewController _updateCardNumbersConfigurationAnimated:](self, "_updateCardNumbersConfigurationAnimated:", 1);
  -[PKAccountOtherCardNumbersViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  if (!self->_preferDefaultTitle)
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (PKVirtualCardEnabledWithWebService() && !-[PKAccount feature](self->_account, "feature"))
    {
      v16 = -[PKPaymentPass hasActiveVirtualCard](self->_paymentPass, "hasActiveVirtualCard");

      if (v16)
      {
        -[PKAccountOtherCardNumbersViewController navigationItem](self, "navigationItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_OTHER_TITLE"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTitle:", v18);

      }
    }
    else
    {

    }
    if (-[PKAccount feature](self->_account, "feature") == 2)
    {
      -[PKAccountOtherCardNumbersViewController navigationItem](self, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_OTHER_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v7);

    }
  }
  -[PKAccountOtherCardNumbersViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("footer"));

  if (-[PKAccountOtherCardNumbersViewController _isVirtualCardSupportedButNotEnabled](self, "_isVirtualCardSupportedButNotEnabled"))
  {
    -[PKAccountOtherCardNumbersViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
    v9 = (void *)MEMORY[0x1E0D66A58];
    v10 = *MEMORY[0x1E0D69910];
    v11 = *MEMORY[0x1E0D68AA0];
    v21[0] = *MEMORY[0x1E0D68C50];
    v12 = *MEMORY[0x1E0D68F50];
    v20[0] = v11;
    v20[1] = v12;
    -[PKAccountOtherCardNumbersViewController _analyticsPageTag](self, "_analyticsPageTag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subject:sendEvent:", v10, v14);

  }
  -[PKAccountOtherCardNumbersViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67870]);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAccountOtherCardNumbersViewController;
  -[PKAccountOtherCardNumbersViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[PKAccountOtherCardNumbersViewController _isVirtualCardSupportedButNotEnabled](self, "_isVirtualCardSupportedButNotEnabled"))
  {
    -[PKAccountOtherCardNumbersViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
  }
}

- (BOOL)_isVirtualCardSupportedButNotEnabled
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKVirtualCardEnabledWithWebService()
    && -[PKPaymentPass supportsVirtualCardNumber](self->_paymentPass, "supportsVirtualCardNumber"))
  {
    v4 = -[PKPaymentPass hasActiveVirtualCard](self->_paymentPass, "hasActiveVirtualCard") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_analyticsPageTag
{
  id *v2;

  if (self->_context == 3)
    v2 = (id *)MEMORY[0x1E0D69870];
  else
    v2 = (id *)MEMORY[0x1E0D688F8];
  return *v2;
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D69910];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    self->_didBeginPassManagementSubject = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v3);
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginPassManagementSubject)
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69910]);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (-[PKSettingsTableViewController indexOfSectionWithIdentifier:](self, "indexOfSectionWithIdentifier:", CFSTR("physicalCardNumber")) == a4)
  {
    v7 = CFSTR("ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_NUMBERS_TITANIUM_SECONDARY");
LABEL_5:
    -[PKAccountOtherCardNumbersViewController _localizedStringForKey:](self, "_localizedStringForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (-[PKSettingsTableViewController indexOfSectionWithIdentifier:](self, "indexOfSectionWithIdentifier:", CFSTR("applePayCardNumber")) == a4)
  {
    v7 = CFSTR("ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_NUMBERS_APPLE_PAY_SECONDARY");
    goto LABEL_5;
  }
  if (-[PKSettingsTableViewController indexOfSectionWithIdentifier:](self, "indexOfSectionWithIdentifier:", CFSTR("PIN")) == a4)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PIN_MESSAGE"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PKSettingsTableViewController indexOfSectionWithIdentifier:](self, "indexOfSectionWithIdentifier:", CFSTR("setUpVirtualCard")) != a4)
    {
      v10 = 0;
      goto LABEL_7;
    }
    if (-[PKPaymentPass associatedAccountFeatureIdentifier](self->_paymentPass, "associatedAccountFeatureIdentifier") == 1)
      PKLocalizedCashVPANString(CFSTR("CARD_NUMBERS_OTHER_SET_UP_VIRTUAL_CARD_NUMBER_SECONDARY_CASH"));
    else
      PKLocalizedVirtualCardString(CFSTR("CARD_NUMBERS_OTHER_SET_UP_VIRTUAL_CARD_NUMBER_SECONDARY"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  v9 = (void *)v8;
  -[PKAccountOtherCardNumbersViewController _groupedFooterWithText:tableView:](self, "_groupedFooterWithText:tableView:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v10;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)_updateCardNumbersConfigurationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char HasDismissedPhysicalCardExpiredCardNumbersMessage;
  PKPaymentPass *paymentPass;
  PKSettingsTableViewConfiguration *v13;
  void *v14;
  uint64_t v15;
  PKSettingsTableViewConfiguration *v16;

  v3 = a3;
  v16 = objc_alloc_init(PKSettingsTableViewConfiguration);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKVirtualCardEnabledWithWebService())
  {
    v6 = -[PKPaymentPass hasActiveVirtualCard](self->_paymentPass, "hasActiveVirtualCard");

    if ((v6 & 1) == 0
      && -[PKPaymentPass supportsVirtualCardNumber](self->_paymentPass, "supportsVirtualCardNumber"))
    {
      -[PKAccountOtherCardNumbersViewController _appendSetUpVirtualCardSectionToConfiguration:](self, "_appendSetUpVirtualCardSectionToConfiguration:", v16);
    }
  }
  else
  {

  }
  if (!-[PKAccount feature](self->_account, "feature"))
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((PKVirtualCardEnabledWithWebService() & 1) != 0)
    {
      v8 = -[PKPaymentPass hasActiveVirtualCard](self->_paymentPass, "hasActiveVirtualCard");

      if ((v8 & 1) == 0)
        -[PKAccountOtherCardNumbersViewController _appendNetworkSectionToConfiguration:](self, "_appendNetworkSectionToConfiguration:", v16);
    }
    else
    {

    }
  }
  if (self->_physicalCard
    || !-[PKAccount feature](self->_account, "feature")
    && (-[PKPaymentPass primaryAccountNumberSuffix](self->_paymentPass, "primaryAccountNumberSuffix"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "length"),
        v14,
        v15))
  {
    if (self->_isPhysicalCardExpired)
    {
      if (-[PKAccount supportsRequestPhysicalCard](self->_account, "supportsRequestPhysicalCard"))
      {
        if (-[PKAccount state](self->_account, "state") == 1)
        {
          -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPhysicalCard identifier](self->_physicalCard, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          HasDismissedPhysicalCardExpiredCardNumbersMessage = PKAppleCardHasDismissedPhysicalCardExpiredCardNumbersMessage();

          if ((HasDismissedPhysicalCardExpiredCardNumbersMessage & 1) == 0)
            -[PKAccountOtherCardNumbersViewController _appendPhysicalCardExpiredMessageSectionToConfiguration:](self, "_appendPhysicalCardExpiredMessageSectionToConfiguration:", v16);
        }
      }
    }
    -[PKAccountOtherCardNumbersViewController _appendPhysicalCardNumberSectionToConfiguration:](self, "_appendPhysicalCardNumberSectionToConfiguration:", v16);
  }
  if (self->_paymentPass)
  {
    -[PKAccountOtherCardNumbersViewController _appendApplePayCardNumberSectionToConfiguration:](self, "_appendApplePayCardNumberSectionToConfiguration:", v16);
    paymentPass = self->_paymentPass;
  }
  else
  {
    paymentPass = 0;
  }
  if (-[PKPaymentPass hasAssociatedPeerPaymentAccount](paymentPass, "hasAssociatedPeerPaymentAccount"))
    -[PKAccountOtherCardNumbersViewController _appendPinSectionToConfiguration:](self, "_appendPinSectionToConfiguration:", v16);
  v13 = v16;
  if (v16)
  {
    -[PKSettingsTableViewController applyConfiguration:animated:](self, "applyConfiguration:animated:", v16, v3);
    v13 = v16;
  }

}

- (void)_appendNetworkSectionToConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  PKKeyValueTableViewSettingsRow *v8;
  void *v9;
  PKKeyValueTableViewSettingsRow *v10;
  void *v11;
  PKTableViewDiffableDataSourceSection *v12;

  v4 = a3;
  v12 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("network"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPaymentPass devicePrimaryPaymentApplication](self->_paymentPass, "devicePrimaryPaymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentNetworkIdentifier");
  PKDisplayablePaymentNetworkNameForPaymentCredentialType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PKKeyValueTableViewSettingsRow alloc];
  PKLocalizedCardNumbersString(CFSTR("CARD_NUMBERS_VIRTUAL_PAYMENT_NETWORK_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKKeyValueTableViewSettingsRow initWithIdentifier:title:value:](v8, "initWithIdentifier:title:value:", CFSTR("network"), v9, v7);

  objc_msgSend(v5, "addObject:", v10);
  v11 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendSection:rows:", v12, v11);

}

- (void)_appendSetUpVirtualCardSectionToConfiguration:(id)a3
{
  id v4;
  PKTableViewDiffableDataSourceSection *v5;
  id v6;
  PKButtonTableViewSettingsRow *v7;
  void *v8;
  PKButtonTableViewSettingsRow *v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("setUpVirtualCard"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = [PKButtonTableViewSettingsRow alloc];
  PKLocalizedVirtualCardString(CFSTR("CARD_NUMBERS_OTHER_SET_UP_VIRTUAL_CARD_NUMBER"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__PKAccountOtherCardNumbersViewController__appendSetUpVirtualCardSectionToConfiguration___block_invoke;
  v11[3] = &unk_1E3E6A900;
  v11[4] = self;
  v9 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v7, "initWithIdentifier:title:tapHandler:", CFSTR("setUpVirtualCard"), v8, v11);

  -[PKButtonTableViewSettingsRow setEnabled:](v9, "setEnabled:", 1);
  objc_msgSend(v6, "addObject:", v9);
  v10 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "appendSection:rows:", v5, v10);

}

void __89__PKAccountOtherCardNumbersViewController__appendSetUpVirtualCardSectionToConfiguration___block_invoke(uint64_t a1)
{
  PKVirtualCardEnrollmentViewController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = -[PKVirtualCardEnrollmentViewController initWithPaymentPass:context:delegate:]([PKVirtualCardEnrollmentViewController alloc], "initWithPaymentPass:context:delegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v2);
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v3, 1, 0);
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D69910];
  v6 = *MEMORY[0x1E0D68AA0];
  v12[0] = *MEMORY[0x1E0D68B18];
  v7 = *MEMORY[0x1E0D68F50];
  v11[0] = v6;
  v11[1] = v7;
  objc_msgSend(*(id *)(a1 + 32), "_analyticsPageTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = *MEMORY[0x1E0D68858];
  v9 = *MEMORY[0x1E0D694B0];
  v12[1] = v8;
  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", v5, v10);

}

- (void)_appendPhysicalCardExpiredMessageSectionToConfiguration:(id)a3
{
  id v4;
  PKTableViewDiffableDataSourceSection *v5;
  PKMessageTableViewSettingsRow *v6;
  void *v7;
  PKMessageTableViewSettingsRow *v8;
  uint64_t v9;
  PKButtonTableViewSettingsRow *v10;
  void *v11;
  PKButtonTableViewSettingsRow *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("physicalCardExpiredMessage"));
  v6 = [PKMessageTableViewSettingsRow alloc];
  -[PKAccountOtherCardNumbersViewController _contentConfigurationForExpiredCardMessage](self, "_contentConfigurationForExpiredCardMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKMessageTableViewSettingsRow initWithIdentifier:contentConfiguration:](v6, "initWithIdentifier:contentConfiguration:", CFSTR("physicalCardExpiredMessage"), v7);

  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__PKAccountOtherCardNumbersViewController__appendPhysicalCardExpiredMessageSectionToConfiguration___block_invoke;
  v19[3] = &unk_1E3E61310;
  objc_copyWeak(&v20, &location);
  -[PKMessageTableViewSettingsRow setActionOnDismiss:](v8, "setActionOnDismiss:", v19);
  v10 = [PKButtonTableViewSettingsRow alloc];
  PKLocalizedFeatureString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  v15 = 3221225472;
  v16 = __99__PKAccountOtherCardNumbersViewController__appendPhysicalCardExpiredMessageSectionToConfiguration___block_invoke_2;
  v17 = &unk_1E3E6A928;
  objc_copyWeak(&v18, &location);
  v12 = -[PKButtonTableViewSettingsRow initWithIdentifier:title:tapHandler:](v10, "initWithIdentifier:title:tapHandler:", CFSTR("physicalCardExpiredMessageAction"), v11, &v14);

  -[PKButtonTableViewSettingsRow setStyle:](v12, "setStyle:", 2, v14, v15, v16, v17);
  -[PKButtonTableViewSettingsRow setEnabled:](v12, "setEnabled:", 1);
  v22[0] = v8;
  v22[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendSection:rows:", v5, v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __99__PKAccountOtherCardNumbersViewController__appendPhysicalCardExpiredMessageSectionToConfiguration___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[131], "accountIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[129], "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppleCardSetHasDismissedPhysicalCardExpiredCardNumbersMessage();

    objc_msgSend(v4, "_updateCardNumbersConfigurationAnimated:", 1);
    WeakRetained = v4;
  }

}

void __99__PKAccountOtherCardNumbersViewController__appendPhysicalCardExpiredMessageSectionToConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentReplaceExpiredPhysicalCard");
    WeakRetained = v2;
  }

}

- (id)_contentConfigurationForExpiredCardMessage
{
  void *v2;
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
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v3);

  objc_msgSend(v2, "textProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938], *MEMORY[0x1E0DC1420]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  PKLocalizedFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSecondaryText:", v6);

  objc_msgSend(v2, "secondaryTextProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  objc_msgSend(v2, "secondaryTextProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v10);

  objc_msgSend(v2, "setTextToSecondaryTextVerticalPadding:", 5.0);
  PKPassKitUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLForResource:withExtension:", CFSTR("MessageAlert"), CFSTR("pdf"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = PKUIScreenScale();
  PKUIImageFromPDF(v12, 42.0, 42.0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setImage:", v14);
  objc_msgSend(v2, "imageProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 42.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPreferredSymbolConfiguration:", v16);

  objc_msgSend(v2, "setImageToTextPadding:", 12.0);
  objc_msgSend(v2, "imageProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setReservedLayoutSize:", 42.0, 42.0);

  objc_msgSend(v2, "setDirectionalLayoutMargins:", 12.0, 20.0, 12.0, 20.0);
  return v2;
}

- (void)_presentReplaceExpiredPhysicalCard
{
  PKAccountService *accountService;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  accountService = self->_accountService;
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke;
  v5[3] = &unk_1E3E62B38;
  objc_copyWeak(&v6, &location);
  -[PKAccountService accountUsersForAccountWithIdentifier:completion:](accountService, "accountUsersForAccountWithIdentifier:completion:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66940]), "initWithAccountUsers:", v3);
    objc_msgSend(v6, "currentAccountUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)WeakRetained + 134);
    objc_msgSend(*((id *)WeakRetained + 131), "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke_2;
    v11[3] = &unk_1E3E6A978;
    objc_copyWeak(&v13, v4);
    v10 = v7;
    v12 = v10;
    objc_msgSend(v8, "physicalCardsForAccountWithIdentifier:completion:", v9, v11);

    objc_destroyWeak(&v13);
  }

}

void __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  PKPhysicalCardController *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  PKPhysicalCardController *v9;
  uint64_t v10;
  _QWORD v11[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [PKPhysicalCardController alloc];
    v4 = WeakRetained[134];
    v5 = WeakRetained[130];
    v6 = WeakRetained[131];
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    v9 = -[PKPhysicalCardController initWithAccountService:paymentPass:account:accountUser:physicalCards:](v3, "initWithAccountService:paymentPass:account:accountUser:physicalCards:", v4, v5, v6, v7, v8);

    v10 = WeakRetained[132];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke_3;
    v11[3] = &unk_1E3E6A950;
    v11[4] = WeakRetained;
    -[PKPhysicalCardController replaceFlowViewControllerForReason:content:currentPhysicalCard:completion:](v9, "replaceFlowViewControllerForReason:content:currentPhysicalCard:completion:", 1, v10, 0, v11);

  }
}

void __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKNavigationController *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v7);
    -[PKNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

    goto LABEL_6;
  }
  if (v5)
  {
    v6 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_appendPhysicalCardNumberSectionToConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKKeyValueTableViewSettingsRow *v13;
  void *v14;
  PKKeyValueTableViewSettingsRow *v15;
  void *v16;
  PKKeyValueTableViewSettingsRow *v17;
  void *v18;
  PKKeyValueTableViewSettingsRow *v19;
  void *v20;
  void *v21;
  PKTableViewDiffableDataSourceSection *v22;

  v4 = a3;
  v22 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("physicalCardNumber"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PKAccount feature](self->_account, "feature") == 2)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    PKPANMask();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKPANMask();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPhysicalCard FPANSuffix](self->_physicalCard, "FPANSuffix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKMaskedPaymentPAN();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@ %@"), v7, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLTRString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKPaymentPass primaryAccountNumberSuffix](self->_paymentPass, "primaryAccountNumberSuffix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKMaskedPaymentPAN();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v13 = [PKKeyValueTableViewSettingsRow alloc];
  -[PKAccountOtherCardNumbersViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_NUMBERS_TITANIUM_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PKKeyValueTableViewSettingsRow initWithIdentifier:title:value:](v13, "initWithIdentifier:title:value:", CFSTR("physicalCardNumber"), v14, v12);

  -[PKKeyValueTableViewSettingsRow setSensitive:](v15, "setSensitive:", 1);
  objc_msgSend(v5, "addObject:", v15);
  -[PKPhysicalCard formattedExpiration](self->_physicalCard, "formattedExpiration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = [PKKeyValueTableViewSettingsRow alloc];
    -[PKAccountOtherCardNumbersViewController _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_NUMBERS_TITANIUM_EXPIRATION_TITLE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PKKeyValueTableViewSettingsRow initWithIdentifier:title:value:](v17, "initWithIdentifier:title:value:", CFSTR("physicalCardExpiration"), v18, v16);

    if (self->_isPhysicalCardExpired)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKKeyValueTableViewSettingsRow setSecondaryTextColor:](v19, "setSecondaryTextColor:", v20);

    }
    objc_msgSend(v5, "addObject:", v19);
  }
  else
  {
    v19 = v15;
  }
  v21 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendSection:rows:", v22, v21);

}

- (void)_appendApplePayCardNumberSectionToConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  PKTableViewDiffableDataSourceSection *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  v12 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("applePayCardNumber"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPaymentPass devicePaymentApplications](self->_paymentPass, "devicePaymentApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPass sortedPaymentApplications:ascending:](self->_paymentPass, "sortedPaymentApplications:ascending:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__PKAccountOtherCardNumbersViewController__appendApplePayCardNumberSectionToConfiguration___block_invoke;
  v13[3] = &unk_1E3E6A9A0;
  v13[4] = self;
  v14 = v8;
  v15 = v5;
  v9 = v5;
  v10 = v8;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);
  v11 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "appendSection:rows:", v12, v11);

}

void __91__PKAccountOtherCardNumbersViewController__appendApplePayCardNumberSectionToConfiguration___block_invoke(id *a1, void *a2)
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
  void *v14;
  id v15;
  PKKeyValueTableViewSettingsRow *v16;
  id v17;

  v17 = a2;
  PKSanitizedDeviceAccountNumberForPaymentApplication();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*((id *)a1[4] + 131), "feature") == 2)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    PKPANMask();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKPANMask();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ %@"), v5, v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLTRString();
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v3;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v17, "applicationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("applePayCardNumber"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "_localizedStringForKey:", CFSTR("ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_NUMBERS_APPLE_PAY_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(a1[5], "count") >= 2)
  {
    objc_msgSend(v17, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;

      v12 = v15;
    }

  }
  v16 = -[PKKeyValueTableViewSettingsRow initWithIdentifier:title:value:]([PKKeyValueTableViewSettingsRow alloc], "initWithIdentifier:title:value:", v11, v12, v8);
  -[PKKeyValueTableViewSettingsRow setSensitive:](v16, "setSensitive:", 1);
  objc_msgSend(a1[6], "addObject:", v16);

}

- (void)_appendPinSectionToConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  PKKeyValueTableViewSettingsRow *v10;
  void *v11;
  PKKeyValueTableViewSettingsRow *v12;
  void *v13;
  PKTableViewDiffableDataSourceSection *v14;

  v4 = a3;
  v14 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("PIN"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPaymentPass localizedValueForFieldKey:](self->_paymentPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6A738]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PIN_DEFAULT"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = [PKKeyValueTableViewSettingsRow alloc];
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PIN_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKKeyValueTableViewSettingsRow initWithIdentifier:title:value:](v10, "initWithIdentifier:title:value:", CFSTR("PIN"), v11, v9);

  objc_msgSend(v5, "addObject:", v12);
  v13 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendSection:rows:", v14, v13);

}

- (id)_groupedFooterWithText:(id)a3 tableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("footer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "groupedFooterConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  objc_msgSend(v7, "directionalLayoutMargins");
  objc_msgSend(v7, "setDirectionalLayoutMargins:");
  objc_msgSend(v6, "setContentConfiguration:", v7);

  return v6;
}

- (id)_localizedStringForKey:(id)a3
{
  PKAccount *account;
  NSString *v5;
  void *v6;
  NSString *v7;

  account = self->_account;
  v5 = (NSString *)a3;
  if (-[PKAccount feature](account, "feature"))
  {
    -[PKAccount feature](self->_account, "feature");
    PKLocalizedFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSString substringFromIndex:](v5, "substringFromIndex:", objc_msgSend(CFSTR("ACCOUNT_SERVICE_"), "length"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    PKLocalizedCardNumbersString(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
  }

  return v6;
}

- (void)virtualCardEnrollmentViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;

  v4 = a4;
  -[PKAccountOtherCardNumbersViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  if (v4)
  {
    -[PKAccountOtherCardNumbersViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 0);

  }
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PKAccountOtherCardNumbersViewController_physicalCardsChanged_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v13, &location);
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __85__PKAccountOtherCardNumbersViewController_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  int v9;
  void *v10;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = (void *)WeakRetained[131];
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v2, "accountIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = v4;
    v7 = v6;
    if (v5 == v6)
    {

    }
    else
    {
      if (!v5 || !v6)
      {

LABEL_12:
        goto LABEL_13;
      }
      v8 = objc_msgSend(v5, "isEqualToString:", v6);

      if ((v8 & 1) == 0)
        goto LABEL_12;
    }
    v9 = *((unsigned __int8 *)WeakRetained + 1066);

    if (v9 && objc_msgSend(*(id *)(a1 + 40), "pk_hasObjectPassingTest:", &__block_literal_global_77))
    {
      *((_BYTE *)WeakRetained + 1066) = 0;
      v10 = (void *)WeakRetained[129];
      WeakRetained[129] = 0;

      objc_msgSend(WeakRetained, "_updateCardNumbersConfigurationAnimated:", 1);
    }
  }
LABEL_13:

}

uint64_t __85__PKAccountOtherCardNumbersViewController_physicalCardsChanged_forAccountIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    objc_msgSend(v2, "accountUserAltDSID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrentUserAltDSID();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = v4;
    v7 = v6;
    if (v5 == v6)
    {
      v8 = 1;
    }
    else
    {
      v8 = 0;
      if (v5 && v6)
        v8 = objc_msgSend(v5, "isEqualToString:", v6);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_physicalCard, 0);
}

@end
