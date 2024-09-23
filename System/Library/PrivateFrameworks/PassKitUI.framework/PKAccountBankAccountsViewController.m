@implementation PKAccountBankAccountsViewController

- (PKAccountBankAccountsViewController)initWithAccount:(id)a3 paymentWebService:(id)a4 context:(int64_t)a5
{
  id v9;
  id v10;
  PKAccountBankAccountsViewController *v11;
  PKAccountBankAccountsViewController *v12;
  uint64_t v13;
  PKAccountService *accountService;
  NSMutableArray *v15;
  NSMutableArray *deletingFundingSources;
  void *v17;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKAccountBankAccountsViewController;
  v11 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v20, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 2);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a3);
    v12->_accountFeatureIdentifier = objc_msgSend(v9, "feature");
    objc_storeStrong((id *)&v12->_paymentWebService, a4);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    accountService = v12->_accountService;
    v12->_accountService = (PKAccountService *)v13;

    v12->_context = a5;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletingFundingSources = v12->_deletingFundingSources;
    v12->_deletingFundingSources = v15;

    -[PKAccountBankAccountsViewController navigationItem](v12, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v18);

    v12->_loadingFundingSources = 0;
    -[PKAccountService registerObserver:](v12->_accountService, "registerObserver:", v12);

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKAccountBankAccountsViewController;
  -[PKSectionTableViewController dealloc](&v3, sel_dealloc);
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
  uint64_t v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKAccountBankAccountsViewController;
  -[PKSectionTableViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PKAccountBankAccountsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setAllowsSelectionDuringEditing:", 1);
  if (PKPaymentSetupContextIsBridge())
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v5);

    objc_msgSend(v3, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    objc_msgSend(v4, "tableViewSeparatorColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSeparatorColor:", v8);

    objc_msgSend(v4, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSectionIndexColor:", v9);

    objc_msgSend(v4, "foregroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSectionIndexBackgroundColor:", v10);

    if (objc_msgSend(v4, "hasDarkAppearance"))
      v11 = 2;
    else
      v11 = 0;
    objc_msgSend(v3, "setIndicatorStyle:", v11);

  }
  if (!-[PKAccountBankAccountsViewController _hasBankAccounts](self, "_hasBankAccounts"))
    -[PKAccountBankAccountsViewController _reloadFundingSources](self, "_reloadFundingSources");
  -[PKAccountBankAccountsViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67930]);

}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (self->_loadingFundingSources)
  {
    v4 = (void *)MEMORY[0x1E0DC3698];
    v5 = a3;
    objc_msgSend(v4, "loadingConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatedConfigurationForState:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[PKAccountBankAccountsViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v7);

}

- (void)_reloadFundingSources
{
  NSMutableArray *availableFundingSources;
  NSMutableArray *unavailableFundingSourcesWithVerification;
  NSMutableArray *unavailableFundingSourcesWithoutVerification;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_loadingFundingSources)
  {
    self->_loadingFundingSources = 1;
    -[PKAccountBankAccountsViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
    availableFundingSources = self->_availableFundingSources;
    self->_availableFundingSources = 0;

    unavailableFundingSourcesWithVerification = self->_unavailableFundingSourcesWithVerification;
    self->_unavailableFundingSourcesWithVerification = 0;

    unavailableFundingSourcesWithoutVerification = self->_unavailableFundingSourcesWithoutVerification;
    self->_unavailableFundingSourcesWithoutVerification = 0;

    -[PKAccountBankAccountsViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__PKAccountBankAccountsViewController__reloadFundingSources__block_invoke;
    v7[3] = &unk_1E3E65F18;
    objc_copyWeak(&v8, &location);
    -[PKAccountBankAccountsViewController preflightWithCompletion:](self, "preflightWithCompletion:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __60__PKAccountBankAccountsViewController__reloadFundingSources__block_invoke(uint64_t a1, char a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1192) = 0;
    objc_msgSend(WeakRetained, "_setNeedsUpdateContentUnavailableConfiguration");
    objc_msgSend(v6, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

    if (v10)
    {
      if ((a2 & 1) == 0)
      {
        objc_msgSend(v6[135], "feature");
        PKAccountDisplayableError();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
        objc_msgSend(v6, "presentViewController:animated:completion:", v9, 1, 0);

      }
    }
  }

}

- (void)_setAndFilterFundingSources:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSMutableArray *v14;
  void *v15;
  NSMutableArray *unavailableFundingSourcesWithVerification;
  NSMutableArray *v17;
  NSMutableArray *unavailableFundingSourcesWithoutVerification;
  NSMutableArray *v19;
  NSMutableArray *availableFundingSources;
  void *v21;
  NSMutableArray *v23;
  NSMutableArray *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "fundingDetails");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          v13 = objc_msgSend(v12, "status");
          v14 = v4;
          if (v13 == 2)
          {
            objc_msgSend(v12, "verificationDetails");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
              v14 = v23;
            else
              v14 = v24;
          }
          -[NSMutableArray addObject:](v14, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  unavailableFundingSourcesWithVerification = self->_unavailableFundingSourcesWithVerification;
  self->_unavailableFundingSourcesWithVerification = v23;
  v17 = v23;

  unavailableFundingSourcesWithoutVerification = self->_unavailableFundingSourcesWithoutVerification;
  self->_unavailableFundingSourcesWithoutVerification = v24;
  v19 = v24;

  availableFundingSources = self->_availableFundingSources;
  self->_availableFundingSources = v4;

  -[PKAccountBankAccountsViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reloadData");

}

- (void)_toggleEditingMode
{
  id v3;

  -[PKAccountBankAccountsViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:animated:", objc_msgSend(v3, "isEditing") ^ 1, 1);
  -[PKAccountBankAccountsViewController _updateEditButtonIfNecessary](self, "_updateEditButtonIfNecessary");

}

- (void)_updateEditButtonIfNecessary
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[PKAccountBankAccountsViewController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PKAccountBankAccountsViewController _hasBankAccounts](self, "_hasBankAccounts"))
  {
    -[PKAccountBankAccountsViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEditing");

    if (v4)
      v5 = 0;
    else
      v5 = 2;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", v5, self, sel__editButtonPressed_);
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

  }
  else
  {
    objc_msgSend(v7, "setRightBarButtonItem:", 0);
  }

}

- (BOOL)_isBankAccountIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", objc_msgSend(v4, "section"));
  if (v5 == 2)
  {
    v6 = objc_msgSend(v4, "row");
    v7 = 1144;
  }
  else
  {
    if (v5 == 1)
    {
      v8 = objc_msgSend(v4, "row") == 0;
      goto LABEL_9;
    }
    if (v5)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v6 = objc_msgSend(v4, "row");
    v7 = 1128;
  }
  v8 = v6 < objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "count");
LABEL_9:

  return v8;
}

- (void)_didSelectDeleteBankAccountAtIndexPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  PKPaymentWebService *paymentWebService;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKAccountBankAccountsViewController _fundingSourceForIndexPath:](self, "_fundingSourceForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", objc_msgSend(v6, "section"));
  if (v9 > 2)
  {
    v10 = 0;
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    v10 = *(id *)((char *)&self->super.super.super.super.super.isa + *off_1E3E743D0[v9]);
    if (!v8)
      goto LABEL_7;
  }
  if ((-[NSMutableArray containsObject:](self->_deletingFundingSources, "containsObject:", v8) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_deletingFundingSources, "addObject:", v8);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v11, "startAnimating");
    -[PKAccountBankAccountsViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellForRowAtIndexPath:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setEditingAccessoryView:", v11);
    objc_msgSend(v13, "setAccessoryView:", v11);
    v14 = objc_alloc_init(MEMORY[0x1E0D66988]);
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccountIdentifier:", v15);

    -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBaseURL:", v16);

    objc_msgSend(v8, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFundingSourceIdentifier:", v17);

    objc_initWeak(&location, self);
    paymentWebService = self->_paymentWebService;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __100__PKAccountBankAccountsViewController__didSelectDeleteBankAccountAtIndexPath_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E3E742C0;
    objc_copyWeak(&v23, &location);
    v22 = v7;
    v20 = v8;
    v21 = v10;
    -[PKPaymentWebService deleteFundingSourceWithRequest:completion:](paymentWebService, "deleteFundingSourceWithRequest:completion:", v14, v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
LABEL_7:
  (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

}

void __100__PKAccountBankAccountsViewController__didSelectDeleteBankAccountAtIndexPath_withCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__PKAccountBankAccountsViewController__didSelectDeleteBankAccountAtIndexPath_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E3E74298;
  objc_copyWeak(&v15, a1 + 7);
  v14 = a1[6];
  v10 = a1[4];
  v11 = v5;
  v12 = v6;
  v13 = a1[5];
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v15);
}

void __100__PKAccountBankAccountsViewController__didSelectDeleteBankAccountAtIndexPath_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void **v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_indexPathForFundingSourceIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setEditingAccessoryView:", 0);
    objc_msgSend(v6, "setAccessoryView:", 0);

  }
  objc_msgSend(WeakRetained[145], "removeObject:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40) && !*(_QWORD *)(a1 + 48))
  {
    v9 = objc_msgSend(WeakRetained, "_sectionTypeForSection:", objc_msgSend(v4, "section"));
    objc_msgSend(*(id *)(a1 + 56), "removeObject:", *(_QWORD *)(a1 + 32));
    if (!v4)
      goto LABEL_25;
    v10 = objc_msgSend(WeakRetained[142], "count");
    v11 = -objc_msgSend(WeakRetained[143], "count");
    if (v9 == 2)
    {
      if (v10 != v11)
      {
        v18 = objc_msgSend(WeakRetained[143], "count");
        objc_msgSend(WeakRetained, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          v22 = v4;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "deleteRowsAtIndexPaths:withRowAnimation:", v20, 100);

          objc_msgSend(WeakRetained, "tableView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v4, "section"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_reloadSectionHeaderFooters:withRowAnimation:", v15, 100);
          goto LABEL_24;
        }
        v21 = v4;
        v13 = (void *)MEMORY[0x1E0C99D20];
        v14 = &v21;
        goto LABEL_23;
      }
      objc_msgSend(WeakRetained, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v4, "section"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v12;
      v17 = v15;
    }
    else
    {
      if (v9 != 1)
      {
        if (v9)
          goto LABEL_25;
        objc_msgSend(WeakRetained, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v4;
        v13 = (void *)MEMORY[0x1E0C99D20];
        v14 = (void **)v23;
LABEL_23:
        objc_msgSend(v13, "arrayWithObjects:count:", v14, 1, v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deleteRowsAtIndexPaths:withRowAnimation:", v15, 100);
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", objc_msgSend(v4, "section"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
        objc_msgSend(v12, "addIndex:", objc_msgSend(v4, "section") + 1);
      objc_msgSend(WeakRetained, "tableView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v16;
      v17 = v12;
    }
    objc_msgSend(v16, "deleteSections:withRowAnimation:", v17, 100);
LABEL_24:

LABEL_25:
    if ((objc_msgSend(WeakRetained, "_hasBankAccounts") & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      objc_msgSend(WeakRetained, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setEditing:", 0);

      objc_msgSend(WeakRetained, "reloadData");
      objc_msgSend(WeakRetained, "_updateEditButtonIfNecessary");
    }
    goto LABEL_7;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(WeakRetained[135], "feature");
  PKAccountDisplayableError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, 0);

LABEL_7:
LABEL_9:

}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  unint64_t accountFeatureIdentifier;
  id *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[6];
  id v20;
  id location;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  if (!-[PKAccountBankAccountsViewController _hasBankAccounts](self, "_hasBankAccounts"))
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__45;
    v22[4] = __Block_byref_object_dispose__45;
    v23 = 0;
    objc_initWeak(&location, self);
    v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v6 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke;
    v19[3] = &unk_1E3E74310;
    v19[4] = self;
    objc_copyWeak(&v20, &location);
    v19[5] = v22;
    objc_msgSend(v5, "addOperation:", v19);
    accountFeatureIdentifier = self->_accountFeatureIdentifier;
    if (accountFeatureIdentifier == 2)
    {
      v15[0] = v6;
      v15[1] = 3221225472;
      v15[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_7;
      v15[3] = &unk_1E3E74338;
      v15[4] = self;
      v8 = &v16;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v5, "addOperation:", v15);
    }
    else
    {
      if (accountFeatureIdentifier != 5)
      {
LABEL_9:
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_10;
        v11[3] = &unk_1E3E74360;
        objc_copyWeak(&v14, &location);
        v13 = v22;
        v12 = v4;
        v10 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v9, v11);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&v20);

        objc_destroyWeak(&location);
        _Block_object_dispose(v22, 8);

        goto LABEL_10;
      }
      v17[0] = v6;
      v17[1] = 3221225472;
      v17[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_4;
      v17[3] = &unk_1E3E74338;
      v17[4] = self;
      v8 = &v18;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v5, "addOperation:", v17);
    }
    objc_destroyWeak(v8);
    goto LABEL_9;
  }
  if (v4)
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
LABEL_10:

}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 1112);
  objc_msgSend(*(id *)(v10 + 1080), "accountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_2;
  v15[3] = &unk_1E3E701B0;
  objc_copyWeak(&v19, (id *)(a1 + 48));
  v18 = *(_QWORD *)(a1 + 40);
  v13 = v9;
  v17 = v13;
  v14 = v8;
  v16 = v14;
  objc_msgSend(v11, "updatePaymentFundingSourcesForAccountIdentifier:force:completion:", v12, 1, v15);

  objc_destroyWeak(&v19);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E742E8;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  v12 = v6;
  v13 = v5;
  v10 = *(_OWORD *)(a1 + 40);
  v7 = (id)v10;
  v15 = v10;
  v14 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v16);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v2 = *(void **)(a1 + 32);
    if (v2)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v2);
    objc_msgSend(WeakRetained, "_setAndFilterFundingSources:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "_updateEditButtonIfNecessary");
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, BOOL))(v3 + 16))(v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32) != 0);
  }

}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1112);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_5;
  v13[3] = &unk_1E3E643E8;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v14 = v12;
  objc_msgSend(v10, "defaultAccountForFeature:completion:", 2, v13);

  objc_destroyWeak(&v16);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_5(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_6;
  block[3] = &unk_1E3E643C0;
  objc_copyWeak(&v14, a1 + 6);
  v10 = v5;
  v11 = v6;
  v13 = a1[5];
  v12 = a1[4];
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (v4 && !*(_QWORD *)(a1 + 40))
    {
      v8 = WeakRetained;
      objc_storeStrong(WeakRetained + 136, v4);
      v3 = v8;
      v7 = *(_QWORD *)(a1 + 56);
      if (v7)
      {
        v6 = *(void (**)(void))(v7 + 16);
        goto LABEL_8;
      }
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 56);
      if (v5)
      {
        v6 = *(void (**)(void))(v5 + 16);
        v8 = v3;
LABEL_8:
        v6();
        v3 = v8;
      }
    }
  }

}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1112);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_8;
  v13[3] = &unk_1E3E643E8;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v14 = v12;
  objc_msgSend(v10, "defaultAccountForFeature:completion:", 5, v13);

  objc_destroyWeak(&v16);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_8(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_9;
  block[3] = &unk_1E3E643C0;
  objc_copyWeak(&v14, a1 + 6);
  v10 = v5;
  v11 = v6;
  v13 = a1[5];
  v12 = a1[4];
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_9(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (v4 && !*(_QWORD *)(a1 + 40))
    {
      v8 = WeakRetained;
      objc_storeStrong(WeakRetained + 136, v4);
      v3 = v8;
      v7 = *(_QWORD *)(a1 + 56);
      if (v7)
      {
        v6 = *(void (**)(void))(v7 + 16);
        goto LABEL_8;
      }
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 56);
      if (v5)
      {
        v6 = *(void (**)(void))(v5 + 16);
        v8 = v3;
LABEL_8:
        v6();
        v3 = v8;
      }
    }
  }

}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_11;
    block[3] = &unk_1E3E64A20;
    v4 = *(_OWORD *)(a1 + 32);
    v3 = (id)v4;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_11(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  v2 = a1 + 32;
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 8) + 8) + 40))
  {
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  else if (result)
  {
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  }
  return result;
}

- (id)_addBankAccountInformationViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKAddBankAccountInformationViewController *v8;
  PKNavigationController *v9;

  v3 = -[PKAccount type](self->_account, "type");
  if (v3 == 4)
  {
    -[PKAccount savingsDetails](self->_account, "savingsDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v4;
    objc_msgSend(v4, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66BC8]), "initWithType:", 1);
  v8 = -[PKAddBankAccountInformationViewController initWithDelegate:bankInformation:accountCountryCode:featureAccount:]([PKAddBankAccountInformationViewController alloc], "initWithDelegate:bankInformation:accountCountryCode:featureAccount:", self, v7, v6, self->_account);
  -[PKAddBankAccountInformationViewController setOfferKeychainPreFill:](v8, "setOfferKeychainPreFill:", -[PKAccountBankAccountsViewController _hasBankAccounts](self, "_hasBankAccounts") ^ 1);
  v9 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
  -[PKNavigationController setSupportedInterfaceOrientations:](v9, "setSupportedInterfaceOrientations:", 2);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 2);
  }

  return v9;
}

- (void)_presentAddBankAccount
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (-[PKAccount stateReason](self->_account, "stateReason") == 14)
  {
    PKLocalizedMadisonString(CFSTR("ACCOUNT_MERGE_INITIATED_ERROR_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("ACCOUNT_MERGE_INITIATED_ERROR_MESSAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v5 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
    -[PKAccountBankAccountsViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    -[PKAccountBankAccountsViewController _addBankAccountInformationViewController](self, "_addBankAccountInformationViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKAccountBankAccountsViewController navigationController](self, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

- (void)_presentContactSupport
{
  uint64_t v3;
  void *v4;
  id v5;
  PKAccountSupportTopicsViewController *v6;
  PKNavigationController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PKAccount type](self->_account, "type");
  if (v3 == 1)
  {
    -[PKAccount associatedPassUniqueID](self->_account, "associatedPassUniqueID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v6 = (PKAccountSupportTopicsViewController *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v7 = (PKNavigationController *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke_2;
    v16[3] = &unk_1E3E61E98;
    v16[4] = self;
    -[PKAccountSupportTopicsViewController getPassesWithUniqueIdentifiers:handler:](v6, "getPassesWithUniqueIdentifiers:handler:", v7, v16);
    goto LABEL_6;
  }
  if (v3 != 4)
    return;
  -[PKAccount savingsDetails](self->_account, "savingsDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactNumber");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
  {
    v6 = -[PKAccountSupportTopicsViewController initWithAccount:]([PKAccountSupportTopicsViewController alloc], "initWithAccount:", self->_account);
    v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
    -[PKAccountBankAccountsViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

LABEL_6:
    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "length"))
    goto LABEL_8;
  v9 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedFeatureString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, 0, 1);
  v6 = (PKAccountSupportTopicsViewController *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke;
  v17[3] = &unk_1E3E61D68;
  v5 = v5;
  v18 = v5;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v5, 0, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountSupportTopicsViewController addAction:](v6, "addAction:", v12);

  v13 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountSupportTopicsViewController addAction:](v6, "addAction:", v15);

  -[PKAccountBankAccountsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
LABEL_7:

LABEL_8:
}

void __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  PKTelephoneURLFromPhoneNumber();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

void __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  PKBusinessChatPassDetailsContext *v4;
  PKBusinessChatController *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
    {
      v4 = -[PKBusinessChatPassDetailsContext initWithPass:]([PKBusinessChatPassDetailsContext alloc], "initWithPass:", v3);
      v5 = objc_alloc_init(PKBusinessChatController);
      -[PKBusinessChatController openBusinessChatWithContext:completion:](v5, "openBusinessChatWithContext:completion:", v4, 0);

    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke_3;
      v6[3] = &unk_1E3E61388;
      v6[4] = *(_QWORD *)(a1 + 32);
      v7 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], v6);

    }
  }

}

uint64_t __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke_3(uint64_t a1)
{
  void *v2;
  PKSecureElementPassContactIssuerHelper *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1176);
  if (!v2)
  {
    v3 = objc_alloc_init(PKSecureElementPassContactIssuerHelper);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1176);
    *(_QWORD *)(v4 + 1176) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setDelegate:");
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1176);
    objc_msgSend(*(id *)(a1 + 40), "secureElementPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPass:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setFeatureIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1176);
  }
  return objc_msgSend(v2, "presentContactViewController:", 1);
}

- (void)_presentLinkAccountForFundingSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  PKApplyControllerConfiguration *v15;
  PKApplyController *v16;
  PKApplyController *applyController;
  PKApplyController *v18;
  void *v19;
  PKApplyController *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v4 = a3;
  if (!self->_loadingLinkAccountFlow)
  {
    self->_loadingLinkAccountFlow = 1;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v5, "startAnimating");
    v6 = (void *)MEMORY[0x1E0CB36B0];
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBankAccountsViewController _indexPathForFundingSourceIdentifier:](self, "_indexPathForFundingSourceIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathForRow:inSection:", 1, objc_msgSend(v8, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAccountBankAccountsViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellForRowAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAccessoryView:", v5);
    v12 = objc_alloc(MEMORY[0x1E0D67230]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithWebService:", v13);

    v15 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:]([PKApplyControllerConfiguration alloc], "initWithSetupDelegate:context:provisioningController:", self, 0, v14);
    -[PKApplyControllerConfiguration setFeature:](v15, "setFeature:", -[PKAccount feature](self->_account, "feature"));
    -[PKApplyControllerConfiguration setApplicationType:](v15, "setApplicationType:", 6);
    -[PKApplyControllerConfiguration setVerificationType:](v15, "setVerificationType:", 2);
    -[PKApplyControllerConfiguration setFundingSource:](v15, "setFundingSource:", v4);
    -[PKApplyControllerConfiguration setAccount:](v15, "setAccount:", self->_account);
    v16 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v15);
    applyController = self->_applyController;
    self->_applyController = v16;

    v18 = self->_applyController;
    -[PKAccount applyServiceURL](self->_account, "applyServiceURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyController setApplyServiceURL:](v18, "setApplyServiceURL:", v19);

    objc_initWeak(&location, self);
    v20 = self->_applyController;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __75__PKAccountBankAccountsViewController__presentLinkAccountForFundingSource___block_invoke;
    v21[3] = &unk_1E3E63C50;
    objc_copyWeak(&v23, &location);
    v22 = v4;
    -[PKApplyController nextViewControllerWithCompletion:](v20, "nextViewControllerWithCompletion:", v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
}

void __75__PKAccountBankAccountsViewController__presentLinkAccountForFundingSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__PKAccountBankAccountsViewController__presentLinkAccountForFundingSource___block_invoke_2;
  v9[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __75__PKAccountBankAccountsViewController__presentLinkAccountForFundingSource___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  PKNavigationController *v3;
  void *v4;
  PKNavigationController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      v3 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v4 = *(void **)(a1 + 40);
      if (!v4)
      {
LABEL_7:
        v6 = (void *)MEMORY[0x1E0CB36B0];
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_indexPathForFundingSourceIdentifier:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "indexPathForRow:inSection:", 1, objc_msgSend(v8, "section"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "tableView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cellForRowAtIndexPath:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setAccessoryView:", 0);
        v12[1194] = 0;

        WeakRetained = v12;
        goto LABEL_8;
      }
      v3 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
    }
    v5 = v3;
    objc_msgSend(v12, "presentViewController:animated:completion:", v3, 1, 0);

    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)_hasBankAccounts
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableArray count](self->_availableFundingSources, "count");
  v4 = -[NSMutableArray count](self->_unavailableFundingSourcesWithVerification, "count") + v3;
  return v4 + -[NSMutableArray count](self->_unavailableFundingSourcesWithoutVerification, "count") != 0;
}

- (void)_fetchAccountUserInfo:(id)a3
{
  id v4;
  void *v5;
  PKAccountService *accountService;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_loadingAccountUserInfo)
  {
    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
  else
  {
    self->_loadingAccountUserInfo = 1;
    -[PKSectionTableViewController reloadData](self, "reloadData");
    objc_initWeak(&location, self);
    accountService = self->_accountService;
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__PKAccountBankAccountsViewController__fetchAccountUserInfo___block_invoke;
    v8[3] = &unk_1E3E74388;
    objc_copyWeak(&v10, &location);
    v9 = v5;
    -[PKAccountService userInfoForAccountIdentifier:forceFetch:completion:](accountService, "userInfoForAccountIdentifier:forceFetch:completion:", v7, 1, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __61__PKAccountBankAccountsViewController__fetchAccountUserInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__PKAccountBankAccountsViewController__fetchAccountUserInfo___block_invoke_2;
  v9[3] = &unk_1E3E689E0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __61__PKAccountBankAccountsViewController__fetchAccountUserInfo___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1193) = 0;
    v8 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      PKAccountDisplayableError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      objc_msgSend(v8, "presentViewController:animated:completion:", v5, 1, 0);
      v6 = *(_QWORD *)(a1 + 48);
      if (v6)
        (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

    }
    else
    {
      objc_storeStrong(WeakRetained + 137, *(id *)(a1 + 40));
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
        (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, *(_QWORD *)(a1 + 40) != 0);
    }
    objc_msgSend(v8, "reloadData");
    v3 = v8;
  }

}

- (id)_fundingSourceForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSMutableArray **p_unavailableFundingSourcesWithVerification;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  v7 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", v6);
  if (v7 == 2)
  {
    v8 = 1144;
LABEL_6:
    p_unavailableFundingSourcesWithVerification = (NSMutableArray **)((char *)self + v8);
    if (v5 < -[NSMutableArray count](*p_unavailableFundingSourcesWithVerification, "count"))
      goto LABEL_11;
    goto LABEL_9;
  }
  if (v7 != 1)
  {
    if (v7)
      goto LABEL_9;
    v8 = 1128;
    goto LABEL_6;
  }
  if (!v5)
  {
    v5 = v6 - 1;
    p_unavailableFundingSourcesWithVerification = &self->_unavailableFundingSourcesWithVerification;
LABEL_11:
    -[NSMutableArray objectAtIndex:](*p_unavailableFundingSourcesWithVerification, "objectAtIndex:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
LABEL_9:
  v10 = 0;
  return v10;
}

- (id)_indexPathForFundingSourceIdentifier:(id)a3
{
  id v4;
  NSMutableArray *availableFundingSources;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSMutableArray *unavailableFundingSourcesWithVerification;
  id v10;
  uint64_t v11;
  NSMutableArray *unavailableFundingSourcesWithoutVerification;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  availableFundingSources = self->_availableFundingSources;
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke;
  v22[3] = &unk_1E3E743B0;
  v7 = v4;
  v23 = v7;
  v8 = -[NSMutableArray indexOfObjectPassingTest:](availableFundingSources, "indexOfObjectPassingTest:", v22);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unavailableFundingSourcesWithVerification = self->_unavailableFundingSourcesWithVerification;
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke_2;
    v20[3] = &unk_1E3E743B0;
    v10 = v7;
    v21 = v10;
    v11 = -[NSMutableArray indexOfObjectPassingTest:](unavailableFundingSourcesWithVerification, "indexOfObjectPassingTest:", v20);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unavailableFundingSourcesWithoutVerification = self->_unavailableFundingSourcesWithoutVerification;
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke_3;
      v18[3] = &unk_1E3E743B0;
      v19 = v10;
      v13 = -[NSMutableArray indexOfObjectPassingTest:](unavailableFundingSourcesWithoutVerification, "indexOfObjectPassingTest:", v18);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = 0;
      }
      else
      {
        v15 = v13;
        v16 = -[NSMutableArray count](self->_unavailableFundingSourcesWithVerification, "count");
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v15, v16 + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v11 + 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

uint64_t __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
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

  return v8;
}

uint64_t __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
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

  return v8;
}

uint64_t __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
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

  return v8;
}

- (unint64_t)_sectionTypeForSection:(unint64_t)a3
{
  if (!a3)
    return 0;
  if (a3 - 1 < -[NSMutableArray count](self->_unavailableFundingSourcesWithVerification, "count"))
    return 1;
  return 2;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return !self->_loadingFundingSources;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v5;

  if (self->_loadingFundingSources)
    return 0;
  v5 = -[NSMutableArray count](self->_unavailableFundingSourcesWithVerification, "count", a3);
  if (-[NSMutableArray count](self->_unavailableFundingSourcesWithoutVerification, "count")
    || -[NSMutableArray count](self->_unavailableFundingSourcesWithVerification, "count"))
  {
    return v5 + 2;
  }
  else
  {
    return v5 + 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v5 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4);
  if (v5 == 2)
  {
    v7 = -[NSMutableArray count](self->_unavailableFundingSourcesWithVerification, "count");
    v8 = -[NSMutableArray count](self->_unavailableFundingSourcesWithoutVerification, "count");
    if (v8)
      return v8 + 1;
    else
      return v7 != 0;
  }
  else if (v5 == 1)
  {
    return 2;
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    return -[NSMutableArray count](self->_availableFundingSources, "count") + 1;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  int *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", objc_msgSend(v7, "section"));
  v9 = v8;
  if (v8)
  {
    if (v8 == 1)
    {
      -[NSMutableArray count](self->_unavailableFundingSourcesWithVerification, "count");
      if (objc_msgSend(v7, "row"))
      {
        PKLocalizedFeatureString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        v14 = (id *)MEMORY[0x1E0D67CF8];
        v15 = CFSTR("LinkAccountCell");
        goto LABEL_17;
      }
LABEL_12:
      -[PKAccountBankAccountsViewController _bankAccountCellForRowAtIndexPath:](self, "_bankAccountCellForRowAtIndexPath:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (v8 != 2)
    {
      v16 = 0;
      goto LABEL_20;
    }
    v10 = &OBJC_IVAR___PKAccountBankAccountsViewController__unavailableFundingSourcesWithoutVerification;
  }
  else
  {
    v10 = &OBJC_IVAR___PKAccountBankAccountsViewController__availableFundingSources;
  }
  v11 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v10), "count");
  if (objc_msgSend(v7, "row") < v11)
    goto LABEL_12;
  if (v9 == 2)
  {
    PKLocalizedFeatureString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = (id *)MEMORY[0x1E0D67A30];
    v15 = CFSTR("ContactSupportCell");
  }
  else
  {
    -[PKAccountBankAccountsViewController _hasBankAccounts](self, "_hasBankAccounts");
    PKLocalizedFeatureString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_loadingAccountUserInfo)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v13, "startAnimating");
    }
    else
    {
      v13 = 0;
    }
    v15 = CFSTR("AddBankAccountCell");
    v14 = (id *)MEMORY[0x1E0D67848];
  }
LABEL_17:
  v17 = *v14;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, v15);
    objc_msgSend(v16, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v19);

  }
  objc_msgSend(v16, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "detailTextLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v12);
  objc_msgSend(v20, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  objc_msgSend(v21, "setText:", 0);
  objc_msgSend(v21, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
  objc_msgSend(v16, "setAccessoryView:", v13);
  objc_msgSend(v16, "setAccessibilityIdentifier:", v17);

LABEL_20:
  return v16;
}

- (id)_bankAccountCellForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PKAccountBankAccountsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("BankAccountCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("BankAccountCell"));
  -[PKAccountBankAccountsViewController _fundingSourceForIndexPath:](self, "_fundingSourceForIndexPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray containsObject:](self->_deletingFundingSources, "containsObject:", v7))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v8, "startAnimating");
    objc_msgSend(v6, "setAccessoryView:", v8);

    if (!v6)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v6, "setAccessoryView:", 0);
  if (v6)
LABEL_7:
    -[PKAccountBankAccountsViewController _configureBankAccountCell:withFundingSource:](self, "_configureBankAccountCell:withFundingSource:", v6, v7);
LABEL_8:

  return v6;
}

- (void)_configureBankAccountCell:(id)a3 withFundingSource:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(a4, "bankAccountRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bankName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maskedAccountNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "status");
  objc_msgSend(v19, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v6);
  objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  objc_msgSend(v10, "setText:", v7);
  objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
  if (PKPaymentSetupContextIsBridge())
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8 == 2)
      objc_msgSend(v11, "altTextColor");
    else
      objc_msgSend(v11, "textColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v13);

    PKBridgeAppearanceGetAppearanceSpecifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "altTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v15);

    PKBridgeAppearanceGetAppearanceSpecifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "foregroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v17);

  }
  else
  {
    if (v8 == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v18);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v16);
  }

  objc_msgSend(v19, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67930]);
  objc_msgSend(v19, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return -[PKAccountBankAccountsViewController _isBankAccountIndexPath:](self, "_isBankAccountIndexPath:", a4);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0DC36C8];
  PKLocalizedFeatureString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __100__PKAccountBankAccountsViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
  v16[3] = &unk_1E3E70500;
  objc_copyWeak(&v18, &location);
  v10 = v7;
  v17 = v10;
  objc_msgSend(v8, "contextualActionWithStyle:title:handler:", 1, v9, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3D08];
  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationWithActions:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setPerformsFirstActionWithFullSwipe:", 0);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

void __100__PKAccountBankAccountsViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_didSelectDeleteBankAccountAtIndexPath:withCompletionHandler:", *(_QWORD *)(a1 + 32), v7);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;

  if (-[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4) == 2)
  {
    v5 = (void *)-[NSMutableArray count](self->_unavailableFundingSourcesWithoutVerification, "count");
    if (v5)
    {
      PKLocalizedFeatureString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v6;
  void *v7;

  v6 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4);
  if (v6 != 2)
  {
    if (v6 != 1)
    {
      if (!v6)
      {
        if (-[PKAccount type](self->_account, "type") == 4)
        {
          if ((-[PKAccount isCoOwner](self->_associatedAccount, "isCoOwner") & 1) != 0)
            goto LABEL_16;
        }
        else if (-[PKAccount type](self->_account, "type") != 1
               || (-[PKAccount isCoOwner](self->_account, "isCoOwner") & 1) != 0
               || -[PKAccount type](self->_associatedAccount, "type") != 4)
        {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
LABEL_16:
      v7 = 0;
      return v7;
    }
    if (-[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4 + 1) != 2)
      goto LABEL_16;
LABEL_15:
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (-[PKAccount type](self->_account, "type") != 4)
    goto LABEL_16;
  v7 = (void *)-[NSMutableArray count](self->_unavailableFundingSourcesWithoutVerification, "count");
  if (v7)
    goto LABEL_15;
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  id v11;

  v6 = a3;
  -[PKAccountBankAccountsViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length")
    || (-[PKAccountBankAccountsViewController tableView:heightForHeaderInSection:](self, "tableView:heightForHeaderInSection:", v6, a4), v8 == *MEMORY[0x1E0DC53D8]))
  {
    v9 = 0;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v9 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  PKFooterHyperlinkView *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v6 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4);
  if (v6 == 1)
  {
    if (-[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4 + 1) != 2)
    {
      v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v9 = (PKFooterHyperlinkView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      return v9;
    }
    goto LABEL_7;
  }
  if (v6
    || -[PKAccount type](self->_account, "type") != 4
    || !-[PKAccount isCoOwner](self->_associatedAccount, "isCoOwner"))
  {
LABEL_7:
    v9 = 0;
    return v9;
  }
  PKLocalizedFeatureString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(PKFooterHyperlinkView);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT213452#family"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKAttributedStringByAddingLinkToSubstring(v8, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFooterHyperlinkView setAttributedText:](v9, "setAttributedText:", v11);

  v12 = &__block_literal_global_46;
  -[PKFooterHyperlinkView setAction:](v9, "setAction:", &__block_literal_global_46);

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  unint64_t v6;
  double result;
  unint64_t v8;

  v6 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4);
  if (v6 == 2)
    return *MEMORY[0x1E0DC53D8];
  if (v6 != 1)
  {
    result = 16.0;
    if (v6)
      return result;
    return *MEMORY[0x1E0DC53D8];
  }
  v8 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4 - 1);
  result = *MEMORY[0x1E0DC53D8];
  if (v8)
    return 16.0;
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  unint64_t v6;
  double result;
  unint64_t v8;

  v6 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4);
  if (v6 == 2)
    return *MEMORY[0x1E0DC53D8];
  if (v6 != 1)
  {
    result = 0.0;
    if (v6)
      return result;
    return *MEMORY[0x1E0DC53D8];
  }
  v8 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", a4 + 1);
  result = *MEMORY[0x1E0DC53D8];
  if (v8 != 2)
    return 0.0;
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;

  v5 = a4;
  v6 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", objc_msgSend(v5, "section"));
  if (v6 == 2)
  {
    v9 = objc_msgSend(v5, "row");
    v10 = v9 == -[NSMutableArray count](self->_unavailableFundingSourcesWithoutVerification, "count");
    goto LABEL_10;
  }
  if (v6 == 1)
  {
    if (objc_msgSend(v5, "row") == 1)
    {
      v8 = 1194;
      goto LABEL_9;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  if (v6)
    goto LABEL_13;
  v7 = objc_msgSend(v5, "row");
  if (v7 != -[NSMutableArray count](self->_availableFundingSources, "count"))
    goto LABEL_13;
  v8 = 1193;
LABEL_9:
  v10 = *((_BYTE *)&self->super.super.super.super.super.isa + v8) == 0;
LABEL_10:
  v11 = v10;
LABEL_14:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEditing"))
    -[PKAccountBankAccountsViewController _toggleEditingMode](self, "_toggleEditingMode");
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  v8 = objc_msgSend(v7, "row");
  v9 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", objc_msgSend(v7, "section"));
  if (v9 == 2)
  {
    if (v8 == -[NSMutableArray count](self->_unavailableFundingSourcesWithoutVerification, "count"))
      -[PKAccountBankAccountsViewController _presentContactSupport](self, "_presentContactSupport");
  }
  else if (v9 == 1)
  {
    if (v8 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, objc_msgSend(v7, "section"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountBankAccountsViewController _fundingSourceForIndexPath:](self, "_fundingSourceForIndexPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountBankAccountsViewController _presentLinkAccountForFundingSource:](self, "_presentLinkAccountForFundingSource:", v11);

    }
  }
  else if (!v9 && v8 == -[NSMutableArray count](self->_availableFundingSources, "count"))
  {
    if (self->_accountFeatureIdentifier == 5 && !self->_userInfo)
    {
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __73__PKAccountBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v12[3] = &unk_1E3E61C58;
      objc_copyWeak(&v13, &location);
      -[PKAccountBankAccountsViewController _fetchAccountUserInfo:](self, "_fetchAccountUserInfo:", v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PKAccountBankAccountsViewController _presentAddBankAccount](self, "_presentAddBankAccount");
    }
  }

}

void __73__PKAccountBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__PKAccountBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v3[3] = &unk_1E3E61C08;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __73__PKAccountBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained[137], "savingsUserInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primaryUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emailAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 40) && v7)
      objc_msgSend(v8, "_presentAddBankAccount");

    WeakRetained = v8;
  }

}

- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PKAccountBankAccountsViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke;
  block[3] = &unk_1E3E61B68;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __99__PKAccountBankAccountsViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "fundingDetails");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      if (objc_msgSend(v4, "status") == 2)
      {
        objc_msgSend(v4, "verificationDetails");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = *(_QWORD *)(a1 + 32);
        if (v5)
          v7 = 142;
        else
          v7 = 143;
        v8 = &v9[v7];
      }
      else
      {
        v8 = v9 + 141;
        v6 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*v8, "addObject:", v6);
      objc_storeStrong(v9 + 146, *(id *)(a1 + 32));
      objc_msgSend(v9, "reloadData");
      objc_msgSend(v9, "_updateEditButtonIfNecessary");

    }
    WeakRetained = v9;
  }

}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2;
  v3[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, &location);
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained[146], "type") == 1)
    {
      objc_msgSend(v3[146], "fundingDetails");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    if (objc_msgSend(v4, "status") == 2)
    {
      objc_msgSend(v4, "verificationDetails");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "savingsUserInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "primaryUser");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "emailAddresses");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          PKLocalizedFeatureString();
          v11 = objc_claimAutoreleasedReturnValue();
          PKLocalizedFeatureString();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedFeatureString();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedFeatureString();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1, v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_122;
          v18[3] = &unk_1E3E61D68;
          v18[4] = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v13, 0, v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addAction:", v16);

          objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v14, 0, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addAction:", v17);

          objc_msgSend(v3, "presentViewController:animated:completion:", v15, 1, 0);
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Missing account user info email! Alert cannot be displayed", buf, 2u);
          }
        }

      }
    }

  }
}

uint64_t __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_122(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentAddBankAccount");
}

- (void)addBankAccountInformationViewController:(id)a3 didFailWithError:(id)a4
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
  v10[2] = __96__PKAccountBankAccountsViewController_addBankAccountInformationViewController_didFailWithError___block_invoke;
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

void __96__PKAccountBankAccountsViewController_addBankAccountInformationViewController_didFailWithError___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[146];
    WeakRetained[146] = 0;
    v6 = WeakRetained;

    PKAccountDisplayableError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v5, 1, 0);

    WeakRetained = v6;
  }

}

- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  -[PKAccountBankAccountsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, a6);
}

- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  -[PKAccountBankAccountsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a4, a5);
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v4;

  -[PKAccountBankAccountsViewController _reloadFundingSources](self, "_reloadFundingSources", a3);
  -[PKAccountBankAccountsViewController presentedViewController](self, "presentedViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    if (!v9 || !v8)
    {

      goto LABEL_9;
    }
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v11)
      goto LABEL_9;
  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKAccountBankAccountsViewController_didUpdatePaymentFundingSources_accountIdentifier___block_invoke;
  block[3] = &unk_1E3E61B68;
  objc_copyWeak(&v14, &location);
  v13 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
LABEL_9:

}

void __88__PKAccountBankAccountsViewController_didUpdatePaymentFundingSources_accountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_setAndFilterFundingSources:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_contactIssuerHelper, 0);
  objc_storeStrong((id *)&self->_lastAddedFundingSource, 0);
  objc_storeStrong((id *)&self->_deletingFundingSources, 0);
  objc_storeStrong((id *)&self->_unavailableFundingSourcesWithoutVerification, 0);
  objc_storeStrong((id *)&self->_unavailableFundingSourcesWithVerification, 0);
  objc_storeStrong((id *)&self->_availableFundingSources, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_associatedAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
