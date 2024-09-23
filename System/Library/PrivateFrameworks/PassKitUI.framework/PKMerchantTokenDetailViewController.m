@implementation PKMerchantTokenDetailViewController

- (PKMerchantTokenDetailViewController)initWithMerchantToken:(id)a3
{
  id v5;
  PKMerchantTokenDetailViewController *v6;
  PKMerchantTokenDetailViewController *v7;
  uint64_t v8;
  PKPaymentWebService *webService;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PKPeerPaymentAccount *peerPaymentAccount;
  id v16;
  id v17;
  void *v18;
  void *v19;
  PKPaymentTransactionCellController *v20;
  PKPaymentTransactionCellController *transactionPresenter;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKMerchantTokenDetailViewController;
  v6 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v23, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1), 5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_merchantToken, a3);
    v7->_showMerchantIcon = PKMerchantTokensForceMerchantIconsEnabled();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v8 = objc_claimAutoreleasedReturnValue();
    webService = v7->_webService;
    v7->_webService = (PKPaymentWebService *)v8;

    -[PKMerchantTokenDetailViewController navigationItem](v7, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v10, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    objc_msgSend(v5, "merchantName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v7->_showMerchantIcon && objc_msgSend(v11, "length"))
      objc_msgSend(v10, "setTitle:", v12);
    if (-[PKMerchantToken isAppleCashPaymentToken](v7->_merchantToken, "isAppleCashPaymentToken"))
    {
      objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "account");
      v14 = objc_claimAutoreleasedReturnValue();
      peerPaymentAccount = v7->_peerPaymentAccount;
      v7->_peerPaymentAccount = (PKPeerPaymentAccount *)v14;

      objc_msgSend(v13, "registerObserver:", v7);
      v16 = objc_alloc_init(MEMORY[0x1E0C97298]);
      v17 = objc_alloc(MEMORY[0x1E0D66C60]);
      -[PKMerchantTokenDetailViewController _contactKeysToFetch](v7, "_contactKeysToFetch");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithContactStore:keysToFetch:", v16, v18);

      v20 = -[PKPaymentTransactionCellController initWithContactResolver:context:]([PKPaymentTransactionCellController alloc], "initWithContactResolver:context:", v19, 0);
      transactionPresenter = v7->_transactionPresenter;
      v7->_transactionPresenter = v20;

    }
  }

  return v7;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (-[PKMerchantToken isAppleCashPaymentToken](self->_merchantToken, "isAppleCashPaymentToken"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__PKMerchantTokenDetailViewController_preflightWithCompletion___block_invoke;
    v5[3] = &unk_1E3E61590;
    v6 = v4;
    -[PKMerchantTokenDetailViewController _updateRecurringPaymentsWithCompletion:](self, "_updateRecurringPaymentsWithCompletion:", v5);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

uint64_t __63__PKMerchantTokenDetailViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PKMerchantToken merchantTokenId](self->_merchantToken, "merchantTokenId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke;
  v9[3] = &unk_1E3E6F600;
  v7 = v6;
  v10 = v7;
  objc_copyWeak(&v12, &location);
  v8 = v4;
  v11 = v8;
  objc_msgSend(v5, "recurringPaymentsWithCompletion:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke(id *a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_2;
  v17[3] = &unk_1E3E6F5B0;
  v18 = a1[4];
  v5 = a2;
  objc_msgSend(v5, "pk_firstObjectPassingTest:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_3;
  v15[3] = &unk_1E3E6F5D8;
  v16 = a1[4];
  objc_msgSend(v5, "pk_objectsPassingTest:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_4;
  v10[3] = &unk_1E3E689E0;
  objc_copyWeak(&v14, a1 + 6);
  v11 = v6;
  v12 = v7;
  v13 = a1[5];
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v14);
}

uint64_t __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "fundingSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mpanIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
        v10 = objc_msgSend(v7, "isEqualToString:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 1 && objc_msgSend(v3, "sentByMe"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "fundingSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mpanIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
        v10 = objc_msgSend(v7, "isEqualToString:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 140, *(id *)(a1 + 32));
    objc_storeStrong(WeakRetained + 142, *(id *)(a1 + 40));
    if (objc_msgSend(WeakRetained, "isViewLoaded"))
      objc_msgSend(WeakRetained, "reloadData");
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKMerchantTokenDetailViewController;
  -[PKSectionTableViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKMerchantTokenDetailViewController _setUpViews](self, "_setUpViews");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKMerchantTokenDetailViewController;
  -[PKMerchantTokenDetailViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  v3 = (void *)MEMORY[0x1E0D66A58];
  v4 = *MEMORY[0x1E0D69910];
  v5 = *MEMORY[0x1E0D68F50];
  v9[0] = *MEMORY[0x1E0D68AA0];
  v9[1] = v5;
  v6 = *MEMORY[0x1E0D68E10];
  v10[0] = *MEMORY[0x1E0D68C50];
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subject:sendEvent:", v4, v7);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKMerchantTokenDetailViewController;
  -[PKMerchantTokenDetailViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  if ((-[PKMerchantTokenDetailViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[PKMerchantTokenDetailViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D69910];
    v6 = *MEMORY[0x1E0D68B18];
    v7 = *MEMORY[0x1E0D68858];
    v11[0] = *MEMORY[0x1E0D68AA0];
    v11[1] = v7;
    v8 = *MEMORY[0x1E0D687C0];
    v12[0] = v6;
    v12[1] = v8;
    v11[2] = *MEMORY[0x1E0D68F50];
    v12[2] = *MEMORY[0x1E0D68E10];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subject:sendEvent:", v5, v9);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKMerchantTokenDetailViewController;
  -[PKMerchantTokenDetailViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[PKMerchantTokenDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenDetailViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

  -[PKMerchantTokenDetailViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[PKMerchantTokenLoadingView setFrame:](self->_loadingView, "setFrame:", v7, v9, v11, v13);
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKMerchantTokenDetailViewController;
  -[PKMerchantTokenDetailViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKMerchantTokenDetailViewController;
  -[PKMerchantTokenDetailViewController viewLayoutMarginsDidChange](&v12, sel_viewLayoutMarginsDidChange);
  -[PKMerchantTokenDetailViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKMerchantTokenLoadingView setLayoutMargins:](self->_loadingView, "setLayoutMargins:", v5, v7, v9, v11);
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  PKMerchantTokenDetailViewController *v3;

  v3 = self;
  LOBYTE(self) = 1;
  switch(a3)
  {
    case 1uLL:
      if (-[PKMerchantToken isAppleCashPaymentToken](v3->_merchantToken, "isAppleCashPaymentToken"))
        LOBYTE(self) = v3->_peerPaymentAccount == 0;
      else
        LOBYTE(self) = 1;
      break;
    case 2uLL:
      LODWORD(self) = -[PKMerchantToken isAppleCashPaymentToken](v3->_merchantToken, "isAppleCashPaymentToken");
      if ((_DWORD)self)
        LOBYTE(self) = -[PKPeerPaymentAccount supportsRecurringPayments](v3->_peerPaymentAccount, "supportsRecurringPayments");
      break;
    case 3uLL:
      LODWORD(self) = -[PKMerchantToken isAppleCashPaymentToken](v3->_merchantToken, "isAppleCashPaymentToken");
      if ((_DWORD)self)
        LOBYTE(self) = -[PKPeerPaymentAccount supportsThresholdTopUp](v3->_peerPaymentAccount, "supportsThresholdTopUp");
      break;
    case 5uLL:
      LOBYTE(self) = 0;
      break;
    default:
      return (char)self;
  }
  return (char)self;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;
  int64_t result;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  result = 1;
  switch(v5)
  {
    case 0uLL:
      result = self->_showMerchantIcon;
      break;
    case 2uLL:
      result = -[NSArray count](self->_recurringPayments, "count");
      break;
    case 3uLL:
      result = self->_autoReload != 0;
      break;
    case 5uLL:
      result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section")))
  {
    case 0uLL:
      -[PKMerchantTokenDetailViewController _headerCellForTableView:atIndexPath:](self, "_headerCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1uLL:
      -[PKMerchantTokenDetailViewController _managePaymentMethodCellForTableView:atIndexPath:](self, "_managePaymentMethodCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2uLL:
      -[PKMerchantTokenDetailViewController _manageRecurringPaymentCellForTableView:atIndexPath:](self, "_manageRecurringPaymentCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3uLL:
      -[PKMerchantTokenDetailViewController _manageAutoReloadCellForTableView:atIndexPath:](self, "_manageAutoReloadCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4uLL:
      -[PKMerchantTokenDetailViewController _deletePaymentMethodCellForTableView:atIndexPath:](self, "_deletePaymentMethodCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;

  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 2)
  {
    v5 = -[NSArray count](self->_recurringPayments, "count");
    if (v5)
    {
      PKLocalizedPeerPaymentRecurringString(CFSTR("MERCHANT_TOKEN_RECURRING_PAYMENTS"));
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
  unint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v13;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v5 == 4)
  {
    if (-[PKMerchantToken isAMPPaymentToken](self->_merchantToken, "isAMPPaymentToken"))
    {
      v8 = CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_APPLE_FOOTER");
LABEL_12:
      PKLocalizedMerchantTokensString(&v8->isa);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v9 = (void *)v10;
      return v9;
    }
    if (-[PKMerchantToken isDeferredPayment](self->_merchantToken, "isDeferredPayment"))
    {
      PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_DEFERRED_FOOTER"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMerchantToken merchantName](self->_merchantToken, "merchantName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMerchantToken merchantName](self->_merchantToken, "merchantName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
      goto LABEL_22;
    }
    if (!-[PKMerchantToken isAppleCashPaymentToken](self->_merchantToken, "isAppleCashPaymentToken"))
    {
      PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_FOOTER"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMerchantToken merchantName](self->_merchantToken, "merchantName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
      PKStringWithValidatedFormat();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v11 = CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_CASH_FOOTER");
LABEL_25:
    PKLocalizedPeerPaymentRecurringString(&v11->isa);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v5 == 1)
  {
    if (-[PKMerchantToken isAMPPaymentToken](self->_merchantToken, "isAMPPaymentToken"))
    {
      PKPrimaryAppleAccountEmail();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_MANAGE_APPLE_PAYMENT_METHOD_FOOTER_NO_EMAIL"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

        return v9;
      }
      PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_MANAGE_APPLE_PAYMENT_METHOD_FOOTER"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (!-[PKMerchantToken isAppleCashPaymentToken](self->_merchantToken, "isAppleCashPaymentToken")
      || self->_peerPaymentAccount)
    {
      v8 = CFSTR("MERCHANT_TOKEN_DETAIL_MANAGE_PAYMENT_METHOD_FOOTER");
      goto LABEL_12;
    }
    v11 = CFSTR("MERCHANT_TOKEN_DETAIL_MANAGE_CASH_PAYMENT_METHOD_FOOTER");
    goto LABEL_25;
  }
  v9 = 0;
  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3)) - 1 < 4;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  double v7;

  v6 = a3;
  if ((unint64_t)(a4 - 1) >= 3)
  {
    if (a4 == 4)
    {
      v7 = 35.0;
    }
    else if (a4)
    {
      v7 = 0.0;
    }
    else if (self->_showMerchantIcon)
    {
      v7 = 26.0;
    }
    else
    {
      v7 = 0.0;
    }
  }
  else if (-[PKMerchantTokenDetailViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, a4) <= 0)
  {
    v7 = 0.0;
  }
  else
  {
    v7 = 25.0;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v13, 1);
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v13, "section")))
  {
    case 1uLL:
      -[PKMerchantToken merchantTokenManagementURL](self->_merchantToken, "merchantTokenManagementURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        if ((-[PKMerchantToken isAppleCashPaymentToken](self->_merchantToken, "isAppleCashPaymentToken") & 1) == 0)
          goto LABEL_13;
        goto LABEL_11;
      }
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68B18], *MEMORY[0x1E0D68AA0]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68E10], *MEMORY[0x1E0D68F50]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68E18], *MEMORY[0x1E0D68858]);
      -[PKMerchantToken appleMerchantId](self->_merchantToken, "appleMerchantId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safelySetObject:forKey:", v8, *MEMORY[0x1E0D68E20]);

      objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D69910], v7);
      if (-[PKMerchantToken isAMPPaymentToken](self->_merchantToken, "isAMPPaymentToken"))
      {
        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "openSensitiveURL:withOptions:", v6, 0);
LABEL_12:

        goto LABEL_13;
      }
      if (-[PKMerchantToken isAppleCashPaymentToken](self->_merchantToken, "isAppleCashPaymentToken"))
      {
LABEL_11:
        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=PASSBOOK"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "openSensitiveURL:withOptions:", v10, 0);

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "canOpenURL:", v6);

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "openURL:options:completionHandler:", v6, MEMORY[0x1E0C9AA70], 0);
        goto LABEL_12;
      }
LABEL_13:

LABEL_14:
      return;
    case 2uLL:
      -[PKMerchantTokenDetailViewController _didSelectRecurringPaymentAtIndexPath:](self, "_didSelectRecurringPaymentAtIndexPath:", v13);
      goto LABEL_14;
    case 3uLL:
      -[PKMerchantTokenDetailViewController _didSelectAutoReloadManagement](self, "_didSelectAutoReloadManagement");
      goto LABEL_14;
    case 4uLL:
      -[PKMerchantTokenDetailViewController _didSelectDeletePaymentMethod](self, "_didSelectDeletePaymentMethod");
      goto LABEL_14;
    default:
      goto LABEL_14;
  }
}

- (void)_setUpViews
{
  -[PKMerchantTokenDetailViewController _setUpTableView](self, "_setUpTableView");
  -[PKMerchantTokenDetailViewController _setUpLoadingView](self, "_setUpLoadingView");
}

- (void)_setUpTableView
{
  id v2;

  -[PKMerchantTokenDetailViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HeaderCell"));
  objc_msgSend(v2, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ManagePaymentMethodCell"));
  objc_msgSend(v2, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ManageAutoReloadCell"));
  objc_msgSend(v2, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ManageRecurringPayment"));
  objc_msgSend(v2, "setAlwaysBounceVertical:", 0);

}

- (void)_setUpLoadingView
{
  PKMerchantTokenLoadingView *v3;
  PKMerchantTokenLoadingView *v4;
  PKMerchantTokenLoadingView *loadingView;
  PKMerchantTokenLoadingView *v6;
  void *v7;
  id v8;

  -[PKMerchantTokenDetailViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [PKMerchantTokenLoadingView alloc];
  v4 = -[PKMerchantTokenLoadingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  loadingView = self->_loadingView;
  self->_loadingView = v4;

  v6 = self->_loadingView;
  PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_LOADING_TEXT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenLoadingView setLoadingText:](v6, "setLoadingText:", v7);

  -[PKMerchantTokenLoadingView setHidden:](self->_loadingView, "setHidden:", 1);
  objc_msgSend(v8, "addSubview:", self->_loadingView);

}

- (void)_showLoadingView
{
  id v3;

  -[PKMerchantTokenDetailViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenLoadingView setHidden:](self->_loadingView, "setHidden:", 0);
  objc_msgSend(v3, "bringSubviewToFront:", self->_loadingView);
  -[PKMerchantTokenDetailViewController _disableNavigation](self, "_disableNavigation");

}

- (void)_hideLoadingView
{
  -[PKMerchantTokenLoadingView setHidden:](self->_loadingView, "setHidden:", 1);
  -[PKMerchantTokenDetailViewController _enableNavigation](self, "_enableNavigation");
}

- (void)_enableNavigation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKMerchantTokenDetailViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  -[PKMerchantTokenDetailViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactivePopGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

}

- (void)_disableNavigation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKMerchantTokenDetailViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  -[PKMerchantTokenDetailViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactivePopGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

}

- (id)_headerCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HeaderCell"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCellWithMerchantToken:", self->_merchantToken);
  return v5;
}

- (id)_managePaymentMethodCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ManagePaymentMethodCell"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultContentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKMerchantToken isAMPPaymentToken](self->_merchantToken, "isAMPPaymentToken"))
  {
    PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_MANAGE_APPLE_PAYMENT_METHOD"));
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v8 = (void *)v7;
    objc_msgSend(v6, "setText:", v7);
    goto LABEL_7;
  }
  if (-[PKMerchantToken isAppleCashPaymentToken](self->_merchantToken, "isAppleCashPaymentToken")
    && !self->_peerPaymentAccount)
  {
    PKLocalizedPeerPaymentRecurringString(CFSTR("MERCHANT_TOKEN_DETAIL_MANAGE_CASH_PAYMENT_METHOD"));
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_MANAGE_PAYMENT_METHOD"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantToken merchantName](self->_merchantToken, "merchantName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKStringWithValidatedFormat();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v10, v9);

LABEL_7:
  objc_msgSend(v6, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PKBridgeUsesDarkAppearance() & 1) != 0)
    BPSBridgeTintColor();
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v12);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  return v5;
}

- (id)_deletePaymentMethodCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ManagePaymentMethodCell"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultContentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKMerchantToken isDeferredPayment](self->_merchantToken, "isDeferredPayment"))
    v7 = CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_DEFERRED_BUTTON_TEXT");
  else
    v7 = CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_BUTTON_TEXT");
  PKLocalizedMerchantTokensString(&v7->isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(v6, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v10);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  return v5;
}

- (id)_manageRecurringPaymentCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  PKPaymentTransactionTableCell *v7;
  NSArray *recurringPayments;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ManageRecurringPayment"), v6);
  v7 = (PKPaymentTransactionTableCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[PKPaymentTransactionTableCell initWithStyle:reuseIdentifier:]([PKPaymentTransactionTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("ManageRecurringPayment"));
  -[PKPaymentTransactionTableCell setAdditionalInsets:](v7, "setAdditionalInsets:", 0.0, 7.0, 0.0, 7.0);
  recurringPayments = self->_recurringPayments;
  v9 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](recurringPayments, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKPeerPaymentTransactionForRecurringPayment();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionCellController configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:](self->_transactionPresenter, "configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:", v7, v11, 0, 0, 0, 0, 0, 0);

  return v7;
}

- (id)_manageAutoReloadCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ManageAutoReloadCell"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultContentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentRecurringString(CFSTR("MERCHANT_TOKEN_MANAGE_AUTO_RELOAD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  objc_msgSend(v4, "setAccessoryType:", 1);
  objc_msgSend(v4, "setContentConfiguration:", v5);

  return v4;
}

- (void)_didSelectAutoReloadManagement
{
  PKPeerPaymentThresholdTopUpController *autoReloadController;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKPeerPaymentThresholdTopUpController *v8;
  PKPeerPaymentThresholdTopUpController *v9;

  autoReloadController = self->_autoReloadController;
  if (!autoReloadController)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D66F18]);
    -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passWithUniqueID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[PKPeerPaymentThresholdTopUpController initWithPeerPaymentAccount:pass:context:passLibraryDataProvider:delegate:]([PKPeerPaymentThresholdTopUpController alloc], "initWithPeerPaymentAccount:pass:context:passLibraryDataProvider:delegate:", self->_peerPaymentAccount, v7, 0, v4, self);
    v9 = self->_autoReloadController;
    self->_autoReloadController = v8;

    autoReloadController = self->_autoReloadController;
  }
  -[PKPeerPaymentThresholdTopUpController presentTopUpFlowForRecurringPayment:](autoReloadController, "presentTopUpFlowForRecurringPayment:", self->_autoReload);
}

- (void)_didSelectRecurringPaymentAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKPeerPaymentRecurringPaymentDetailViewController *v8;
  void *v9;
  PKPeerPaymentRecurringPaymentDetailViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[NSArray objectAtIndex:](self->_recurringPayments, "objectAtIndex:", objc_msgSend(a3, "row"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D673F8]);
  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPeerPaymentWebService:", v5);

  -[PKPeerPaymentAccount recurringPaymentsFeatureDescriptor](self->_peerPaymentAccount, "recurringPaymentsFeatureDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
  objc_msgSend(v14, "recipientAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKPeerPaymentRecurringPaymentDetailViewController initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:](v8, "initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:", v14, v9, 2, 0, v6, 0);

  objc_msgSend(v7, "minimumAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecurringPaymentDetailViewController setMinimumAmount:](v10, "setMinimumAmount:", v11);

  objc_msgSend(v7, "maximumAmount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecurringPaymentDetailViewController setMaximumAmount:](v10, "setMaximumAmount:", v12);

  -[PKMerchantTokenDetailViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", v10, 1);

}

- (void)_didSelectDeletePaymentMethod
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v3 = -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  if (-[PKMerchantToken isAMPPaymentToken](self->_merchantToken, "isAMPPaymentToken"))
  {
    PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_APPLE_SHEET_MESSAGE"));
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (-[PKMerchantToken isDeferredPayment](self->_merchantToken, "isDeferredPayment"))
  {
    v5 = CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_DEFERRED_SHEET_MESSAGE");
    goto LABEL_10;
  }
  if (!-[PKMerchantToken isAppleCashPaymentToken](self->_merchantToken, "isAppleCashPaymentToken"))
  {
    v5 = CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_SHEET_MESSAGE");
LABEL_10:
    PKLocalizedMerchantTokensString(&v5->isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMerchantToken merchantName](self->_merchantToken, "merchantName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKStringWithValidatedFormat();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      goto LABEL_8;
    goto LABEL_11;
  }
  PKLocalizedPeerPaymentRecurringString(CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_CASH_SHEET_MESSAGE"));
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v4;
  if (v3)
  {
LABEL_8:
    PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_SHEET_TITLE"));
    v7 = v6;
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_11:
  v7 = 0;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v7, v3, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_SHEET_CANCEL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v12);

  if (-[PKMerchantToken isDeferredPayment](self->_merchantToken, "isDeferredPayment"))
    v13 = CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_DEFERRED_SHEET_CONFIRM");
  else
    v13 = CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_SHEET_CONFIRM");
  PKLocalizedMerchantTokensString(&v13->isa);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__PKMerchantTokenDetailViewController__didSelectDeletePaymentMethod__block_invoke;
  v17[3] = &unk_1E3E61D68;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v14, 2, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v15);
  objc_msgSend(v9, "setPreferredAction:", v15);
  if (v9)
    -[PKMerchantTokenDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

uint64_t __68__PKMerchantTokenDetailViewController__didSelectDeletePaymentMethod__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteMerchantToken");
}

- (void)_deleteMerchantToken
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PKPaymentWebService *webService;
  _QWORD v12[5];
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  -[PKMerchantTokenDetailViewController _showLoadingView](self, "_showLoadingView");
  v3 = objc_alloc_init(MEMORY[0x1E0D66CB8]);
  -[PKMerchantToken merchantTokenId](self->_merchantToken, "merchantTokenId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMerchantTokenId:", v4);

  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D69910];
  v7 = *MEMORY[0x1E0D68B18];
  v8 = *MEMORY[0x1E0D68F50];
  v13[0] = *MEMORY[0x1E0D68AA0];
  v13[1] = v8;
  v9 = *MEMORY[0x1E0D68E10];
  v14[0] = v7;
  v14[1] = v9;
  v13[2] = *MEMORY[0x1E0D68858];
  v14[2] = *MEMORY[0x1E0D68E30];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject:sendEvent:", v6, v10);

  webService = self->_webService;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PKMerchantTokenDetailViewController__deleteMerchantToken__block_invoke;
  v12[3] = &unk_1E3E65130;
  v12[4] = self;
  -[PKPaymentWebService deleteMerchantTokenWithRequest:completion:](webService, "deleteMerchantTokenWithRequest:completion:", v3, v12);

}

void __59__PKMerchantTokenDetailViewController__deleteMerchantToken__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__PKMerchantTokenDetailViewController__deleteMerchantToken__block_invoke_2;
  v2[3] = &unk_1E3E64C10;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __59__PKMerchantTokenDetailViewController__deleteMerchantToken__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_enableNavigation");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1152));
    objc_msgSend(WeakRetained, "merchantTokenDetailViewController:didDeleteMerchantToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080));
  }
  else
  {
    objc_msgSend(v3, "_hideLoadingView");
    PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_FAILED_SHEET_TITLE"));
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_FAILED_SHEET_MESSAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", WeakRetained, v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedMerchantTokensString(CFSTR("MERCHANT_TOKEN_DETAIL_DELETE_FAILED_SHEET_DISMISS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);

    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)recurringPaymentsChanged
{
  -[PKMerchantTokenDetailViewController _updateRecurringPaymentsWithCompletion:](self, "_updateRecurringPaymentsWithCompletion:", 0);
}

- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKMerchantTokenDetailViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4
{
  -[PKMerchantTokenDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4
{
  -[PKMerchantTokenDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)thresholdTopUpController:(id)a3 requestsPopViewController:(id)a4
{
  id v4;
  id v5;

  -[PKMerchantTokenDetailViewController navigationController](self, "navigationController", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (id)presentationSceneIdentifierForTopUpController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKMerchantTokenDetailViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)thresholdTopUpControllerCompletedSetup:(id)a3
{
  void *v3;
  id v4;

  -[PKMerchantTokenDetailViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)_contactKeysToFetch
{
  void *v2;
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v3 = _MergedGlobals_5();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", objc_msgSend(v4, "_supportsForceTouch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend((Class)off_1EE4C3C30(), "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C966A8];
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PKMerchantTokenDetailViewControllerDelegate)delegate
{
  return (PKMerchantTokenDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionPresenter, 0);
  objc_storeStrong((id *)&self->_recurringPayments, 0);
  objc_storeStrong((id *)&self->_autoReloadController, 0);
  objc_storeStrong((id *)&self->_autoReload, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_merchantToken, 0);
}

@end
