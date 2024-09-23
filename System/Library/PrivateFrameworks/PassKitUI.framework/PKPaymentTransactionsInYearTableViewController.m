@implementation PKPaymentTransactionsInYearTableViewController

- (PKPaymentTransactionsInYearTableViewController)initWithDateFromYear:(id)a3 calendar:(id)a4 transactionSourceCollection:(id)a5 familyCollection:(id)a6 detailViewStyle:(int64_t)a7 paymentServiceDataProvider:(id)a8 contactResolver:(id)a9 peerPaymentWebService:(id)a10 account:(id)a11
{
  id v17;
  id v18;
  id v19;
  PKPaymentTransactionsInYearTableViewController *v20;
  PKPaymentTransactionsInYearTableViewController *v21;
  PKPaymentTransactionCellController *v22;
  PKPaymentTransactionCellController *transactionCellController;
  uint64_t v24;
  PKDashboardTransactionFetcher *transactionFetcher;
  PKPaymentTransactionDetailsFactory *v26;
  PKPaymentTransactionDetailsFactory *transactionDetailsFactory;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v17 = a3;
  v35 = a4;
  v34 = a5;
  v30 = a6;
  v33 = a6;
  v32 = a8;
  v18 = a9;
  v31 = a10;
  v19 = a11;
  v36.receiver = self;
  v36.super_class = (Class)PKPaymentTransactionsInYearTableViewController;
  v20 = -[PKPaymentTransactionsInYearTableViewController initWithStyle:](&v36, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"));
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_dateFromYear, a3);
    objc_storeStrong((id *)&v21->_calendar, a4);
    objc_storeStrong((id *)&v21->_transactionSourceCollection, a5);
    objc_storeStrong((id *)&v21->_paymentServiceDataProvider, a8);
    objc_storeStrong((id *)&v21->_contactResolver, a9);
    objc_storeStrong((id *)&v21->_peerPaymentWebService, a10);
    v21->_detailViewStyle = a7;
    objc_storeStrong((id *)&v21->_familyCollection, v30);
    v22 = -[PKPaymentTransactionCellController initWithContactResolver:]([PKPaymentTransactionCellController alloc], "initWithContactResolver:", v18);
    transactionCellController = v21->_transactionCellController;
    v21->_transactionCellController = v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithTransactionSourceCollection:paymentDataProvider:", v21->_transactionSourceCollection, v21->_paymentServiceDataProvider);
    transactionFetcher = v21->_transactionFetcher;
    v21->_transactionFetcher = (PKDashboardTransactionFetcher *)v24;

    -[PKDashboardTransactionFetcher setDelegate:](v21->_transactionFetcher, "setDelegate:", v21);
    v26 = -[PKPaymentTransactionDetailsFactory initWithContactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:]([PKPaymentTransactionDetailsFactory alloc], "initWithContactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:", v21->_contactResolver, v21->_peerPaymentWebService, v21->_paymentServiceDataProvider, v21->_detailViewStyle);
    transactionDetailsFactory = v21->_transactionDetailsFactory;
    v21->_transactionDetailsFactory = v26;

    objc_storeStrong((id *)&v21->_account, a11);
  }

  return v21;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionsInYearTableViewController;
  -[PKPaymentTransactionsInYearTableViewController viewDidLoad](&v9, sel_viewDidLoad);
  objc_msgSend((id)objc_opt_class(), "titleForYear:", self->_dateFromYear);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionsInYearTableViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  -[PKPaymentTransactionsInYearTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionTableCellReuseIdentifier"));
  objc_msgSend(v5, "setEstimatedRowHeight:", 76.0);
  objc_msgSend(v5, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v5, "pkui_setupForReadableContentGuide");
  -[PKPaymentTransactionsInYearTableViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  if (PKBankConnectEnabled())
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__PKPaymentTransactionsInYearTableViewController_viewDidLoad__block_invoke;
    v6[3] = &unk_1E3E61C58;
    objc_copyWeak(&v7, &location);
    -[PKPaymentTransactionsInYearTableViewController _loadBankConnectAccountWithCompletion:](self, "_loadBankConnectAccountWithCompletion:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKPaymentTransactionsInYearTableViewController _fetchDataAndRevealContent](self, "_fetchDataAndRevealContent");
  }

}

void __61__PKPaymentTransactionsInYearTableViewController_viewDidLoad__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_fetchDataAndRevealContent");

  }
}

- (void)_loadBankConnectAccountWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FKBankConnectAccountsProvider *v7;
  FKBankConnectAccountsProvider *bankConnectAccountsProvider;
  FKBankConnectAccountsProvider *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PKPaymentTransactionsInYearTableViewController *v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryAccountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (FKBankConnectAccountsProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0CADCE8]), "initWithPrimaryAccountIdentifier:", v6);
  bankConnectAccountsProvider = self->_bankConnectAccountsProvider;
  self->_bankConnectAccountsProvider = v7;

  -[FKBankConnectAccountsProvider setDelegate:](self->_bankConnectAccountsProvider, "setDelegate:", self);
  objc_initWeak(&location, self);
  v9 = self->_bankConnectAccountsProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__PKPaymentTransactionsInYearTableViewController__loadBankConnectAccountWithCompletion___block_invoke;
  v12[3] = &unk_1E3E77B80;
  objc_copyWeak(&v16, &location);
  v10 = v6;
  v13 = v10;
  v14 = self;
  v11 = v4;
  v15 = v11;
  -[FKBankConnectAccountsProvider accountAndReconsentStatusWithCompletion:](v9, "accountAndReconsentStatusWithCompletion:", v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __88__PKPaymentTransactionsInYearTableViewController__loadBankConnectAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__PKPaymentTransactionsInYearTableViewController__loadBankConnectAccountWithCompletion___block_invoke_2;
  v12[3] = &unk_1E3E68530;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  v13 = v5;
  v14 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(&v18);
}

void __88__PKPaymentTransactionsInYearTableViewController__loadBankConnectAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v15 = WeakRetained;
    v4 = objc_msgSend(*(id *)(a1 + 32), "consentStatus");
    if (*(_QWORD *)(a1 + 40)
      || (v5 = v4,
          objc_msgSend(*(id *)(a1 + 32), "account"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          !v6)
      || v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "institution");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v15[147];
      v15[147] = v7;

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CADD20]), "initWithPrimaryAccountIdentifier:dateFromYear:groupType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 1016), 1);
      v10 = objc_loadWeakRetained(v2);
      objc_msgSend(v9, "setDelegate:", v10);

      objc_msgSend(v9, "performFetchAndStartObservingNotifications");
      v11 = (void *)v15[146];
      v15[146] = v9;
      v12 = v9;

      objc_msgSend(*(id *)(a1 + 32), "institution");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v15[147];
      v15[147] = v13;

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    WeakRetained = v15;
  }

}

- (void)_fetchDataAndRevealContent
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PKPaymentTransactionsInYearTableViewController__fetchDataAndRevealContent__block_invoke;
  v3[3] = &unk_1E3E62FA0;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[PKPaymentTransactionsInYearTableViewController _fetchDataWithCompletion:](self, "_fetchDataWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __76__PKPaymentTransactionsInYearTableViewController__fetchDataAndRevealContent__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__PKPaymentTransactionsInYearTableViewController__fetchDataAndRevealContent__block_invoke_2;
    v5[3] = &unk_1E3E612E8;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "transitionWithView:duration:options:animations:completion:", v4, 5242880, v5, 0, 0.3);

    WeakRetained[1144] = 1;
    objc_msgSend(WeakRetained, "_setNeedsUpdateContentUnavailableConfiguration");
  }

}

void __76__PKPaymentTransactionsInYearTableViewController__fetchDataAndRevealContent__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;
  _QWORD v5[5];

  if (self->_contentRevealed)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __99__PKPaymentTransactionsInYearTableViewController__updateContentUnavailableConfigurationUsingState___block_invoke;
    v5[3] = &unk_1E3E612E8;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 0, v5, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3698], "loadingConfiguration", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionsInYearTableViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v4);

  }
}

uint64_t __99__PKPaymentTransactionsInYearTableViewController__updateContentUnavailableConfigurationUsingState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContentUnavailableConfiguration:", 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v4;

  v4 = -[NSArray count](self->_transactionsByMonth, "count", a3);
  if (-[NSArray count](self->_instantWithdrawalFeesTransactionGroups, "count"))
    return v4 + 1;
  else
    return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v6;
  void *v7;
  int64_t v8;

  v6 = -[PKPaymentTransactionsInYearTableViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4);
  if (v6 == 1)
    return -[NSArray count](self->_instantWithdrawalFeesTransactionGroups, "count");
  if (v6)
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_transactionsByMonth, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PKTransactionSourceCollection *transactionSourceCollection;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = -[PKPaymentTransactionsInYearTableViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", objc_msgSend(v7, "section"));
  if (v8 == 1)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentInstantWithdrawalTableCellReuseIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PKPaymentInstantWithdrawalTableCellReuseIdentifier"));
    -[NSArray objectAtIndex:](self->_instantWithdrawalFeesTransactionGroups, "objectAtIndex:", objc_msgSend(v7, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "row");
    if (v15 == -[NSArray count](self->_instantWithdrawalFeesTransactionGroups, "count") - 1)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_TRANSACTIONS_INSTANT_TRANSFER_FEES_YEAR_TO_DATE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPaymentTransactionsInYearTableViewController _withdrawalFeeMonthYearFormatter](self, "_withdrawalFeeMonthYearFormatter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringFromDate:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v11);

    objc_msgSend(v9, "detailTextLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "totalAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "formattedStringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v21);
    goto LABEL_14;
  }
  if (!v8)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPaymentTransactionTableCellReuseIdentifier"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_transactionsByMonth, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDataProvider deviceName](self->_paymentServiceDataProvider, "deviceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      PKDeviceName();
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v14;

    transactionSourceCollection = self->_transactionSourceCollection;
    objc_msgSend(v11, "transactionSourceIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionSourceCollection transactionSourceForTransactionSourceIdentifier:](transactionSourceCollection, "transactionSourceForTransactionSourceIdentifier:", v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKFamilyMemberCollection familyMemberForTransactionSource:](self->_familyCollection, "familyMemberForTransactionSource:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionCellController configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:](self->_transactionCellController, "configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:", v9, v11, v20, v21, self->_account, self->_detailViewStyle, v19, self);
LABEL_14:

    goto LABEL_15;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = -[PKPaymentTransactionsInYearTableViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4);
  if (v6 == 1)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_TRANSACTIONS_INSTANT_TRANSFER_FEES_SECTION_HEADER"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6)
  {
    v11 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_transactionsByMonth, "objectAtIndexedSubscript:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transactionDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionsInYearTableViewController _transactionMonthFormatter](self, "_transactionMonthFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v10, 1);
  if (!-[PKPaymentTransactionsInYearTableViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", objc_msgSend(v10, "section")))
  {
    -[NSArray objectAtIndexedSubscript:](self->_transactionsByMonth, "objectAtIndexedSubscript:", objc_msgSend(v10, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionsInYearTableViewController _transactionDetailViewControllerForTransaction:](self, "_transactionDetailViewControllerForTransaction:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionsInYearTableViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v8, 1);

  }
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  if (-[PKPaymentTransactionsInYearTableViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", objc_msgSend(v10, "section")))
  {
    v11 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_transactionsByMonth, "objectAtIndexedSubscript:", objc_msgSend(v10, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (!v16
      && (objc_msgSend(v14, "transactionView"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "shouldShowTransactionPreviewForTouchAtPoint:inView:", v9, x, y),
          v17,
          v18)
      && (-[PKPaymentTransactionsInYearTableViewController _transactionDetailViewControllerForTransaction:](self, "_transactionDetailViewControllerForTransaction:", v13), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v20 = (void *)MEMORY[0x1E0DC36B8];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __108__PKPaymentTransactionsInYearTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
      v23[3] = &unk_1E3E6A350;
      v24 = v19;
      v21 = v19;
      objc_msgSend(v20, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v23, &__block_literal_global_203);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

id __108__PKPaymentTransactionsInYearTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __108__PKPaymentTransactionsInYearTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2()
{
  return 0;
}

- (int64_t)_sectionTypeForSection:(int64_t)a3
{
  return -[NSArray count](self->_transactionsByMonth, "count") <= a3;
}

- (id)_transactionDetailViewControllerForTransaction:(id)a3
{
  id v4;
  PKDashboardTransactionFetcher *transactionFetcher;
  void *v6;
  void *v7;
  PKTransactionHistoryViewController *v8;
  uint64_t v9;

  v4 = a3;
  if (self->_peerPaymentWebService)
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68590], 0);
  if (objc_msgSend(v4, "transactionType") == 9)
  {
    transactionFetcher = self->_transactionFetcher;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardTransactionFetcher cashbackGroupForTransactionWithIdentifier:cashbackTransactionSourceCollection:](transactionFetcher, "cashbackGroupForTransactionWithIdentifier:cashbackTransactionSourceCollection:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:]([PKTransactionHistoryViewController alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v7, self->_transactionSourceCollection, self->_familyCollection, self->_account, 0, 0, 0, 0, self->_detailViewStyle);
  }
  else
  {
    if (-[PKPaymentTransactionDetailsFactory canShowTransactionHistoryForTransaction:transactionSourceCollection:](self->_transactionDetailsFactory, "canShowTransactionHistoryForTransaction:transactionSourceCollection:", v4, self->_transactionSourceCollection)&& !self->_detailViewStyle)
    {
      -[PKPaymentTransactionDetailsFactory historyViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:](self->_transactionDetailsFactory, "historyViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v4, self->_transactionSourceCollection, self->_familyCollection, self->_account, 0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPaymentTransactionDetailsFactory detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:](self->_transactionDetailsFactory, "detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:", v4, self->_transactionSourceCollection, self->_familyCollection, self->_account, 0, self->_bankConnectInstitution, 0);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (PKTransactionHistoryViewController *)v9;
  }

  return v8;
}

+ (id)titleForYear:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc(MEMORY[0x1E0C99D48]);
  v7 = (void *)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v5, "setCalendar:", v7);

  objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", CFSTR("y"));
  objc_msgSend(v5, "stringFromDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_TRANSACTIONS_IN_YEAR_FORMAT"), CFSTR("%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_transactionMonthFormatter
{
  NSDateFormatter *transactionMonthFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  transactionMonthFormatter = self->_transactionMonthFormatter;
  if (!transactionMonthFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_transactionMonthFormatter;
    self->_transactionMonthFormatter = v4;

    -[NSDateFormatter setCalendar:](self->_transactionMonthFormatter, "setCalendar:", self->_calendar);
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_transactionMonthFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("LLLL"));
    transactionMonthFormatter = self->_transactionMonthFormatter;
  }
  return transactionMonthFormatter;
}

- (id)_withdrawalFeeMonthYearFormatter
{
  NSDateFormatter *withdrawalFeeMonthYearFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  withdrawalFeeMonthYearFormatter = self->_withdrawalFeeMonthYearFormatter;
  if (!withdrawalFeeMonthYearFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_withdrawalFeeMonthYearFormatter;
    self->_withdrawalFeeMonthYearFormatter = v4;

    -[NSDateFormatter setCalendar:](self->_withdrawalFeeMonthYearFormatter, "setCalendar:", self->_calendar);
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_withdrawalFeeMonthYearFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("LLLL yyyy"));
    withdrawalFeeMonthYearFormatter = self->_withdrawalFeeMonthYearFormatter;
  }
  return withdrawalFeeMonthYearFormatter;
}

- (void)_fetchDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSCalendar *calendar;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  PKDashboardTransactionFetcher *transactionFetcher;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 6, self->_dateFromYear);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  calendar = self->_calendar;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar nextDateAfterDate:matchingComponents:options:](calendar, "nextDateAfterDate:matchingComponents:options:", v7, v5, 4098);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 4, 1, v8, 4098);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount createdDate](self->_account, "createdDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "compare:", v8) == 1 && objc_msgSend(v11, "compare:", v9) == -1)
  {
    v12 = v11;

    v8 = v12;
  }
  -[PKDashboardTransactionFetcher setLimit:startDate:endDate:](self->_transactionFetcher, "setLimit:startDate:endDate:", 0, v8, v9);
  transactionFetcher = self->_transactionFetcher;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PKPaymentTransactionsInYearTableViewController__fetchDataWithCompletion___block_invoke;
  v15[3] = &unk_1E3E61878;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  -[PKDashboardTransactionFetcher reloadTransactionsWithCompletion:](transactionFetcher, "reloadTransactionsWithCompletion:", v15);

}

uint64_t __75__PKPaymentTransactionsInYearTableViewController__fetchDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithTransactions:completion:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_updateWithTransactions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  PKPaymentTransactionsInYearTableViewController *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id obj;
  uint64_t v40;
  _QWORD block[4];
  id v42;
  PKPaymentTransactionsInYearTableViewController *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("transactionDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0x1E0C99000uLL;
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!objc_msgSend(v10, "count"))
    goto LABEL_16;
  v34 = v7;
  v36 = v8;
  v37 = v6;
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transactionDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 1024;
  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v35 = v10;
  obj = v10;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (!v40)
    goto LABEL_13;
  v17 = *(_QWORD *)v46;
  do
  {
    v18 = 0;
    v19 = v13;
    do
    {
      if (*(_QWORD *)v46 != v17)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v18);
      objc_msgSend(v20, "transactionDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v14), "date:matchesComponents:", v13, v15) & 1) == 0)
      {
        if (!objc_msgSend(v16, "count"))
          goto LABEL_11;
        v21 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(v38, "addObject:", v21);

        v22 = objc_alloc_init(*(Class *)(v11 + 3560));
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v14), "components:fromDate:", 14, v13);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v15;
        v25 = v17;
        v26 = v14;
        v27 = v11;
        v28 = self;
        v29 = v23;

        v16 = v22;
        v30 = (void *)v29;
        self = v28;
        v11 = v27;
        v14 = v26;
        v17 = v25;
        v15 = v30;
      }
      objc_msgSend(v16, "addObject:", v20);
LABEL_11:
      ++v18;
      v19 = v13;
    }
    while (v40 != v18);
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  }
  while (v40);
LABEL_13:

  if (objc_msgSend(v16, "count"))
  {
    v31 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v38, "addObject:", v31);

  }
  v8 = v36;
  v6 = v37;
  v7 = v34;
  v10 = v35;
LABEL_16:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentTransactionsInYearTableViewController__updateWithTransactions_completion___block_invoke;
  block[3] = &unk_1E3E65388;
  v42 = v38;
  v43 = self;
  v44 = v7;
  v32 = v7;
  v33 = v38;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __85__PKPaymentTransactionsInYearTableViewController__updateWithTransactions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v11 = v2;
  if (*(_QWORD *)(v4 + 1032))
  {
    v5 = objc_msgSend(v2, "isEqualToArray:");
    v3 = v11;
    v6 = v5 ^ 1u;
    v4 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v6 = 1;
  }
  objc_storeStrong((id *)(v4 + 1032), v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1120), "instantWithdrawalFeesTransactionGroups");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 1040);
  *(_QWORD *)(v8 + 1040) = v7;

  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v6);

}

- (void)transactionsChanged:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (self->_contentRevealed)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__PKPaymentTransactionsInYearTableViewController_transactionsChanged___block_invoke;
    v5[3] = &unk_1E3E61C58;
    objc_copyWeak(&v6, &location);
    -[PKPaymentTransactionsInYearTableViewController _updateWithTransactions:completion:](self, "_updateWithTransactions:completion:", v4, v5);
    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);

}

void __70__PKPaymentTransactionsInYearTableViewController_transactionsChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

    WeakRetained = v3;
  }

}

- (void)didUpdateTransactions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_contentRevealed)
  {
    self->_contentRevealed = 1;
    -[PKPaymentTransactionsInYearTableViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = objc_alloc(MEMORY[0x1E0D67370]);
        v13 = (void *)objc_msgSend(v12, "initFromFKTransaction:institution:", v11, self->_bankConnectInstitution, (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0D67370], "augmentTransactionsIfNeeded:usingDataProvider:", v5, self->_paymentServiceDataProvider);
  -[PKPaymentTransactionsInYearTableViewController transactionsChanged:](self, "transactionsChanged:", v5);

}

- (void)bankConnectConsentStatusDidChange:(unint64_t)a3
{
  id v3;
  id v4;

  if (a3)
  {
    -[PKPaymentTransactionsInYearTableViewController navigationController](self, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankConnectInstitution, 0);
  objc_storeStrong((id *)&self->_bankConnectTransactionsProvider, 0);
  objc_storeStrong((id *)&self->_bankConnectAccountsProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionDetailsFactory, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_withdrawalFeeMonthYearFormatter, 0);
  objc_storeStrong((id *)&self->_transactionMonthFormatter, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_transactionCellController, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_instantWithdrawalFeesTransactionGroups, 0);
  objc_storeStrong((id *)&self->_transactionsByMonth, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_dateFromYear, 0);
}

@end
