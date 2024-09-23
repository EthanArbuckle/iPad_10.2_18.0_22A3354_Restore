@implementation PKPeerPaymentAssociatedAccountViewController

- (PKPeerPaymentAssociatedAccountViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 account:(id)a5 context:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKPeerPaymentAssociatedAccountViewController *v14;
  PKPeerPaymentAssociatedAccountViewController *v15;
  uint64_t v16;
  PKPeerPaymentWebService *peerPaymentWebSerivce;
  uint64_t v18;
  PKPeerPaymentService *peerPaymentService;
  void *v20;
  id *p_peerPaymentAccount;
  void *v22;
  uint64_t v23;
  PKPeerPaymentPreferences *preferences;
  PKPaymentService *v25;
  PKPaymentService *paymentService;
  void *v27;
  int v28;
  id *v29;
  id v30;
  void *v31;
  uint64_t v32;
  PKPeerPaymentAccount *associatedAccount;
  uint64_t v34;
  PKTransactionSource *transactionSource;
  PKPaymentService *v36;
  void *v37;
  NSObject *p_super;
  PKPaymentTransactionCellController *v39;
  PKPaymentTransactionCellController *transactionPresenter;
  void *v41;
  void *v42;
  void *v43;
  PKFamilyMember **p_familyMember;
  id *v46;
  uint8_t buf[8];
  _QWORD v48[4];
  PKPeerPaymentAssociatedAccountViewController *v49;
  objc_super v50;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v50.receiver = self;
  v50.super_class = (Class)PKPeerPaymentAssociatedAccountViewController;
  v14 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v50, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1), 7);
  v15 = v14;
  if (v14)
  {
    v14->_context = a6;
    p_familyMember = &v14->_familyMember;
    objc_storeStrong((id *)&v14->_familyMember, a3);
    objc_storeStrong((id *)&v15->_familyCollection, a4);
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v16 = objc_claimAutoreleasedReturnValue();
    peerPaymentWebSerivce = v15->_peerPaymentWebSerivce;
    v15->_peerPaymentWebSerivce = (PKPeerPaymentWebService *)v16;

    -[PKPeerPaymentWebService peerPaymentService](v15->_peerPaymentWebSerivce, "peerPaymentService");
    v18 = objc_claimAutoreleasedReturnValue();
    peerPaymentService = v15->_peerPaymentService;
    v15->_peerPaymentService = (PKPeerPaymentService *)v18;

    v20 = v13;
    if (!v13)
    {
      -[PKPeerPaymentService account](v15->_peerPaymentService, "account");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    p_peerPaymentAccount = (id *)&v15->_peerPaymentAccount;
    objc_storeStrong((id *)&v15->_peerPaymentAccount, v20);
    if (!v13)

    -[PKPeerPaymentService preferences](v15->_peerPaymentService, "preferences", p_familyMember);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    preferences = v15->_preferences;
    v15->_preferences = (PKPeerPaymentPreferences *)v23;

    v25 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
    paymentService = v15->_paymentService;
    v15->_paymentService = v25;

    -[PKPaymentService setDelegate:](v15->_paymentService, "setDelegate:", v15);
    v15->_detailViewStyle = 1;
    objc_msgSend(v12, "currentUser");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isOrganizer");
    v29 = (id *)MEMORY[0x1E0D68C80];
    if (!v28)
      v29 = (id *)MEMORY[0x1E0D68C88];
    objc_storeStrong((id *)&v15->_viewerFamilyMemberTypeAnalyticsKey, *v29);

    v30 = *p_peerPaymentAccount;
    objc_msgSend(v11, "altDSID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "peerPaymentAccountWithAltDSID:", v31);
    v32 = objc_claimAutoreleasedReturnValue();
    associatedAccount = v15->_associatedAccount;
    v15->_associatedAccount = (PKPeerPaymentAccount *)v32;

    if (v15->_associatedAccount)
    {
      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPeerPaymentAccount:", v15->_associatedAccount);
      transactionSource = v15->_transactionSource;
      v15->_transactionSource = (PKTransactionSource *)v34;

    }
    -[PKPeerPaymentAssociatedAccountViewController _updatePeerPaymentAccountWithNewAccount:](v15, "_updatePeerPaymentAccountWithNewAccount:", *p_peerPaymentAccount);
    if (objc_msgSend(*p_peerPaymentAccount, "supportsFamilySharing"))
    {
      v36 = v15->_paymentService;
      -[PKTransactionSource transactionSourceIdentifiers](v15->_transactionSource, "transactionSourceIdentifiers");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __102__PKPeerPaymentAssociatedAccountViewController_initWithFamilyMember_familyCollection_account_context___block_invoke;
      v48[3] = &unk_1E3E62288;
      v49 = v15;
      -[PKPaymentService hasTransactionsForTransactionSourceIdentifiers:completion:](v36, "hasTransactionsForTransactionSourceIdentifiers:completion:", v37, v48);

      p_super = &v49->super.super.super.super.super;
    }
    else
    {
      PKLogFacilityTypeGetObject();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, p_super, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", buf, 2u);
      }
    }

    if (objc_msgSend(*p_peerPaymentAccount, "supportsRecurringPayments"))
    {
      v39 = -[PKPaymentTransactionCellController initWithContactResolver:context:]([PKPaymentTransactionCellController alloc], "initWithContactResolver:context:", 0, 1);
      transactionPresenter = v15->_transactionPresenter;
      v15->_transactionPresenter = v39;

      -[PKPeerPaymentAssociatedAccountViewController _loadRecurringPayments](v15, "_loadRecurringPayments");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", v15, sel__peerPaymentAccountChanged_, *MEMORY[0x1E0D6B288], v15->_peerPaymentService);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v15, sel__peerPaymentPreferencesChanged_, *MEMORY[0x1E0D6B298], v15->_peerPaymentService);

    -[PKPeerPaymentService registerObserver:](v15->_peerPaymentService, "registerObserver:", v15);
    if (v15->_context == 3)
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_FAMILY_TITLE"));
    else
      objc_msgSend(*v46, "labelName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAssociatedAccountViewController setTitle:](v15, "setTitle:", v43);

  }
  return v15;
}

void __102__PKPeerPaymentAssociatedAccountViewController_initWithFamilyMember_familyCollection_account_context___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __102__PKPeerPaymentAssociatedAccountViewController_initWithFamilyMember_familyCollection_account_context___block_invoke_2;
  v3[3] = &unk_1E3E64C10;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __102__PKPeerPaymentAssociatedAccountViewController_initWithFamilyMember_familyCollection_account_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1192) = *(_BYTE *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 100);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentAssociatedAccountViewController;
  -[PKPeerPaymentAssociatedAccountViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  v4 = *MEMORY[0x1E0D698D8];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D698D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    self->_didBeginReporter = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v4);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentAssociatedAccountViewController;
  -[PKPeerPaymentAssociatedAccountViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  if (self->_didBeginReporter)
  {
    -[PKPeerPaymentAssociatedAccountViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", self);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D698D8]);
      self->_didBeginReporter = 0;
    }
  }
}

- (id)familyMemberTransactionViewController
{
  PKFamilyMemberTransactionsViewController *v3;
  PKFamilyMember *familyMember;
  PKFamilyMemberCollection *familyCollection;
  PKTransactionSource *transactionSource;
  PKPeerPaymentAccount *peerPaymentAccount;
  PKPeerPaymentWebService *peerPaymentWebSerivce;
  id v9;
  PKFamilyMemberTransactionsViewController *v10;

  v3 = [PKFamilyMemberTransactionsViewController alloc];
  familyMember = self->_familyMember;
  familyCollection = self->_familyCollection;
  transactionSource = self->_transactionSource;
  peerPaymentAccount = self->_peerPaymentAccount;
  peerPaymentWebSerivce = self->_peerPaymentWebSerivce;
  v9 = objc_alloc_init(MEMORY[0x1E0D67100]);
  v10 = -[PKFamilyMemberTransactionsViewController initWithFamilyMember:familyCollection:transactionSource:account:peerPaymentAccount:peerPaymentWebService:detailViewStyle:paymentServiceDataProvider:mode:](v3, "initWithFamilyMember:familyCollection:transactionSource:account:peerPaymentAccount:peerPaymentWebService:detailViewStyle:paymentServiceDataProvider:mode:", familyMember, familyCollection, transactionSource, 0, peerPaymentAccount, peerPaymentWebSerivce, 1, v9, 1);

  return v10;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  int v5;
  int v6;
  void *v7;
  int v8;

  if (-[PKPeerPaymentAccount supportsFamilySharing](self->_peerPaymentAccount, "supportsFamilySharing"))
  {
    v5 = -[PKPeerPaymentAccount isParticipantAccountLockedByOwner](self->_associatedAccount, "isParticipantAccountLockedByOwner");
    v6 = v5;
    switch(a3)
    {
      case 0uLL:
        LOBYTE(v8) = 1;
        return v8;
      case 1uLL:
        if (!-[PKPeerPaymentAccount supportsRecurringPayments](self->_peerPaymentAccount, "supportsRecurringPayments"))goto LABEL_10;
        return PKPaymentSetupContextIsBridge() ^ 1;
      case 2uLL:
      case 3uLL:
      case 5uLL:
        -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isOrganizer") & (v6 ^ 1);
        goto LABEL_4;
      case 4uLL:
        LOBYTE(v8) = v5 ^ 1;
        return v8;
      case 6uLL:
        if (-[PKPeerPaymentAssociatedAccountViewController shouldMapSection:](self, "shouldMapSection:", 5))
          goto LABEL_10;
        -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isOrganizer") & v6;
LABEL_4:

        break;
      default:
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentAssociatedAccountViewController;
  -[PKPeerPaymentAssociatedAccountViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  if ((-[PKPeerPaymentAccount supportsFamilySharing](self->_peerPaymentAccount, "supportsFamilySharing") & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", v12, 2u);
    }

    v5 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FEATURE_NOT_SUPPORTED_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FEATURE_NOT_SUPPORTED_MESSAGE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAction:", v11);
    PKAccessibilityIDAlertSet(v8, (void *)*MEMORY[0x1E0D67B70]);
    -[PKPeerPaymentAssociatedAccountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)_peerPaymentAccountChanged:(id)a3
{
  PKPeerPaymentService *peerPaymentService;
  _QWORD v4[5];

  peerPaymentService = self->_peerPaymentService;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PKPeerPaymentAssociatedAccountViewController__peerPaymentAccountChanged___block_invoke;
  v4[3] = &unk_1E3E654F8;
  v4[4] = self;
  -[PKPeerPaymentService updateAccountWithCompletion:](peerPaymentService, "updateAccountWithCompletion:", v4);
}

void __75__PKPeerPaymentAssociatedAccountViewController__peerPaymentAccountChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PKPeerPaymentAssociatedAccountViewController__peerPaymentAccountChanged___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __75__PKPeerPaymentAssociatedAccountViewController__peerPaymentAccountChanged___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePeerPaymentAccountWithNewAccount:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateSectionVisibilityAndReloadIfNecessaryForAllSections");
}

- (void)_peerPaymentPreferencesChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPeerPaymentAssociatedAccountViewController__peerPaymentPreferencesChanged___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __79__PKPeerPaymentAssociatedAccountViewController__peerPaymentPreferencesChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountViewController preferences changed", buf, 2u);
  }

  v3 = *(_QWORD **)(a1 + 32);
  if (v3[147])
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Not updating associated account preferences since another preferences update is in flight", v4, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1194) = 1;
  }
  else
  {
    objc_msgSend(v3, "_updatePreferencesFromPeerPaymentServiceAndReloadView");
  }
}

- (void)_updatePreferencesFromPeerPaymentServiceAndReloadView
{
  void *v3;
  id obj;

  -[PKPeerPaymentService preferences](self->_peerPaymentService, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v3, "copy");

  self->_preferencesChanged = 0;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferences, obj);
    -[PKSectionTableViewController updateSectionVisibilityAndReloadIfNecessaryForAllSections](self, "updateSectionVisibilityAndReloadIfNecessaryForAllSections");
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4))
  {
    case 0uLL:
      if (self->_hasPaymentTransactions)
        result = 3;
      else
        result = 2;
      break;
    case 1uLL:
      result = -[NSArray count](self->_recurringPayments, "count") + 1;
      break;
    case 2uLL:
      result = 4;
      break;
    case 3uLL:
      result = 2;
      break;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      result = 1;
      break;
    default:
      result = 0;
      break;
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
      -[PKPeerPaymentAssociatedAccountViewController _detailsCellForTableView:atIndexPath:](self, "_detailsCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1uLL:
      -[PKPeerPaymentAssociatedAccountViewController _recurringPaymentsCellForTableView:atIndexPath:](self, "_recurringPaymentsCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2uLL:
      -[PKPeerPaymentAssociatedAccountViewController _sendRestrictionsCellForTableView:atIndexPath:](self, "_sendRestrictionsCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3uLL:
      -[PKPeerPaymentAssociatedAccountViewController _receiveRestrictionsCellForTableView:atIndexPath:](self, "_receiveRestrictionsCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      -[PKPeerPaymentAssociatedAccountViewController _notificationsCellForTableView:atIndexPath:](self, "_notificationsCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5uLL:
      -[PKPeerPaymentAssociatedAccountViewController _disableCellForTableView:atIndexPath:](self, "_disableCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6uLL:
      -[PKPeerPaymentAssociatedAccountViewController _enableCellForTableView:atIndexPath:](self, "_enableCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v6, "section")))
  {
    case 0uLL:
      -[PKPeerPaymentAssociatedAccountViewController _detailsCellSelectedForTableView:atIndexPath:](self, "_detailsCellSelectedForTableView:atIndexPath:", v7, v6);
      break;
    case 1uLL:
      -[PKPeerPaymentAssociatedAccountViewController _recurringPaymentsCellSelectedForTableView:atIndexPath:](self, "_recurringPaymentsCellSelectedForTableView:atIndexPath:", v7, v6);
      break;
    case 2uLL:
      -[PKPeerPaymentAssociatedAccountViewController _sendRestrictionsCellSelectedForTableView:atIndexPath:](self, "_sendRestrictionsCellSelectedForTableView:atIndexPath:", v7, v6);
      break;
    case 3uLL:
      -[PKPeerPaymentAssociatedAccountViewController _receiveRestrictionsCellSelectedForTableView:atIndexPath:](self, "_receiveRestrictionsCellSelectedForTableView:atIndexPath:", v7, v6);
      break;
    case 5uLL:
      -[PKPeerPaymentAssociatedAccountViewController _disableCellSelectedForTableView:atIndexPath:](self, "_disableCellSelectedForTableView:atIndexPath:", v7, v6);
      break;
    case 6uLL:
      -[PKPeerPaymentAssociatedAccountViewController _enableCellSelectedForTableView:atIndexPath:](self, "_enableCellSelectedForTableView:atIndexPath:", v7, v6);
      break;
    default:
      break;
  }
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section")))
  {
    case 0uLL:
      v8 = -[PKPeerPaymentAssociatedAccountViewController _detailsCellShouldHighlightForTableView:atIndexPath:](self, "_detailsCellShouldHighlightForTableView:atIndexPath:", v6, v7);
      goto LABEL_10;
    case 1uLL:
      v8 = -[PKPeerPaymentAssociatedAccountViewController _recurringPaymentsCellShouldHighlightForTableView:atIndexPath:](self, "_recurringPaymentsCellShouldHighlightForTableView:atIndexPath:", v6, v7);
      goto LABEL_10;
    case 2uLL:
      v8 = -[PKPeerPaymentAssociatedAccountViewController _sendRestrictionsCellShouldHighlightForTableView:atIndexPath:](self, "_sendRestrictionsCellShouldHighlightForTableView:atIndexPath:", v6, v7);
      goto LABEL_10;
    case 3uLL:
      v8 = -[PKPeerPaymentAssociatedAccountViewController _receiveRestrictionsCellShouldHighlightForTableView:atIndexPath:](self, "_receiveRestrictionsCellShouldHighlightForTableView:atIndexPath:", v6, v7);
      goto LABEL_10;
    case 4uLL:
      v8 = -[PKPeerPaymentAssociatedAccountViewController _notificationsCellShouldHighlightForTableView:atIndexPath:](self, "_notificationsCellShouldHighlightForTableView:atIndexPath:", v6, v7);
      goto LABEL_10;
    case 5uLL:
      v8 = -[PKPeerPaymentAssociatedAccountViewController _disableCellShouldHighlightForTableView:atIndexPath:](self, "_disableCellShouldHighlightForTableView:atIndexPath:", v6, v7);
      goto LABEL_10;
    case 6uLL:
      v8 = -[PKPeerPaymentAssociatedAccountViewController _enableCellShouldHighlightForTableView:atIndexPath:](self, "_enableCellShouldHighlightForTableView:atIndexPath:", v6, v7);
LABEL_10:
      v9 = v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4))
  {
    case 1uLL:
      PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_HISTORY_RECURRING_PAYMENTS"));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RESTRICTIONS_SECTION_TITLE"));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3uLL:
      PKLocalizedNearbyPeerPaymentString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RECEIVE_RESTRICTIONS_SECTION_TITLE"));
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = (void *)v5;
      break;
    case 4uLL:
      -[PKFamilyMember firstName](self->_familyMember, "firstName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_NOTIFICATIONS"), CFSTR("%@"), v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v4;
  void *v5;

  v4 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v4 == 4)
  {
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_NOTIFICATIONS_TRANSACTIONS_FOOTER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v4 == 1)
  {
    PKLocalizedPeerPaymentRecurringString(CFSTR("FAMILY_SETTING_FOOTER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  PKFooterHyperlinkView *v7;
  void *v8;

  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT211325"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentRecurringString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RESTRICTIONS_FOOTER_LINK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentRecurringString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RESTRICTIONS_FOOTER"), CFSTR("%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(PKFooterHyperlinkView);
    PKAttributedStringByAddingLinkToSubstring(v6, v5, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFooterHyperlinkView setAttributedText:](v7, "setAttributedText:", v8);

    -[PKFooterHyperlinkView setAction:](v7, "setAction:", &__block_literal_global_43);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __81__PKPeerPaymentAssociatedAccountViewController_tableView_viewForFooterInSection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = (void *)MEMORY[0x1E0CA5878];
    v3 = a2;
    objc_msgSend(v2, "defaultWorkspace");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:configuration:completionHandler:", v3, 0, 0);

  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __98__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "transactionSourceIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v4 + 1192))
    {
      *(_BYTE *)(v4 + 1192) = 1;
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadSections:withRowAnimation:", v5, 100);

    }
  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "transactionSourceIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1192);

    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 1144);
      objc_msgSend(*(id *)(v3 + 1136), "transactionSourceIdentifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2;
      v7[3] = &unk_1E3E62288;
      v7[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v4, "hasTransactionsForTransactionSourceIdentifiers:completion:", v5, v7);

    }
  }
  else
  {

  }
}

void __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_3;
  v2[3] = &unk_1E3E64C10;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  if (!*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1192) = 0;
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadSections:withRowAnimation:", v1, 100);

  }
}

- (void)_detailsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  if (v7 == 1)
  {
    -[PKPeerPaymentAssociatedAccountViewController _actionsCellSelectedForTableView:atIndexPath:](self, "_actionsCellSelectedForTableView:atIndexPath:", v10, v6);
  }
  else if (v7 == 2)
  {
    -[PKPeerPaymentAssociatedAccountViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAssociatedAccountViewController familyMemberTransactionViewController](self, "familyMemberTransactionViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushViewController:animated:", v9, 1);

  }
}

- (void)_recurringPaymentsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  PKPeerPaymentRecurringPaymentDetailViewController *v11;
  void *v12;
  PKPeerPaymentRecurringPaymentDetailViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  PKPeerPaymentRemoteMessagesComposer *v19;
  PKAmountKeypadViewController *v20;
  PKNavigationController *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;

  v5 = objc_msgSend(a4, "row", a3);
  v6 = objc_alloc(MEMORY[0x1E0D673F8]);
  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithPeerPaymentWebService:", v7);

  -[PKPeerPaymentAccount recurringPaymentsFeatureDescriptor](self->_peerPaymentAccount, "recurringPaymentsFeatureDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 < -[NSArray count](self->_recurringPayments, "count"))
  {
    -[NSArray objectAtIndex:](self->_recurringPayments, "objectAtIndex:", v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
    objc_msgSend(v10, "recipientAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKPeerPaymentRecurringPaymentDetailViewController initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:](v11, "initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:", v10, v12, 2, 0, v8, 0);

    objc_msgSend(v9, "minimumAmount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailViewController setMinimumAmount:](v13, "setMinimumAmount:", v14);

    objc_msgSend(v9, "maximumAmount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailViewController setMaximumAmount:](v13, "setMaximumAmount:", v15);

    -[PKPeerPaymentAssociatedAccountViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pushViewController:animated:", v13, 1);
LABEL_6:

    goto LABEL_7;
  }
  v24 = 0;
  v25 = 0;
  v17 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:account:unableReason:displayableError:](PKPeerPaymentActionController, "canPerformPeerPaymentAction:account:unableReason:displayableError:", 3, self->_peerPaymentAccount, &v25, &v24);
  v10 = v24;
  if (!v17)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __103__PKPeerPaymentAssociatedAccountViewController__recurringPaymentsCellSelectedForTableView_atIndexPath___block_invoke;
    v23[3] = &unk_1E3E612E8;
    v23[4] = self;
    +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:](PKPeerPaymentActionController, "alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:", v25, v10, v23);
    v13 = (PKPeerPaymentRecurringPaymentDetailViewController *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAssociatedAccountViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentViewController:animated:completion:", v13, 1, 0);
    goto LABEL_6;
  }
  -[PKFamilyMember appleID](self->_familyMember, "appleID");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = -[PKPeerPaymentRemoteMessagesComposer initWithPeerPaymentController:presentingViewController:actionType:sourceType:]([PKPeerPaymentRemoteMessagesComposer alloc], "initWithPeerPaymentController:presentingViewController:actionType:sourceType:", v8, self, 2, 1);
  v20 = -[PKAmountKeypadViewController initWithRemoteMessagesComposer:recipientAddress:sendFlowType:familyCollection:]([PKAmountKeypadViewController alloc], "initWithRemoteMessagesComposer:recipientAddress:sendFlowType:familyCollection:", v19, v18, 2, self->_familyCollection);
  -[PKAmountKeypadViewController setShowCancelButton:](v20, "setShowCancelButton:", 1);
  v21 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v20);
  -[PKPeerPaymentAssociatedAccountViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "presentViewController:animated:completion:", v21, 1, 0);
  v10 = (id)v18;
LABEL_7:

}

uint64_t __103__PKPeerPaymentAssociatedAccountViewController__recurringPaymentsCellSelectedForTableView_atIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openPaymentSetupWithNetworkWhitelist:paymentSetupMode:", 0, 0);
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWebService:", v8);

  objc_msgSend(v9, "setAllowedPaymentNetworks:", v6);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v9, "setAllowedFeatureIdentifiers:", v10);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E3E61A30;
  objc_copyWeak(v14, &location);
  v11 = v9;
  v13 = v11;
  v14[1] = (id)a4;
  objc_msgSend(v11, "preflightWithCompletion:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11[2];
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E3E61A08;
  objc_copyWeak(v11, a1 + 5);
  v12 = a2;
  v6 = a1[4];
  v11[1] = a1[6];
  v9 = v6;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v11);
}

void __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPaymentSetupMode:", *(_QWORD *)(a1 + 56));
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v10[3] = &unk_1E3E619E0;
      v10[4] = v3;
      v11 = v4;
      v5 = v4;
      objc_msgSend(v5, "preflightWithCompletion:", v10);

    }
    else
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v7;
      +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

    }
  }

}

void __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4;
  PKPaymentSetupNavigationController *v5;

  v4 = a3;
  v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v4, 0);

  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", self);
  -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v5, "setShowsWelcomeViewController:", 0);
  return v5;
}

- (void)_sendRestrictionsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  PKFamilyMember *familyMember;
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;
  PKPeerPaymentPreferencesUpdateRequest *v11;
  void *v12;
  PKPeerPaymentPreferencesUpdateRequest *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  familyMember = self->_familyMember;
  v6 = a4;
  -[PKFamilyMember altDSID](familyMember, "altDSID");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "row");

  v8 = (id *)MEMORY[0x1E0D69318];
  v9 = 1;
  switch(v7)
  {
    case 0:
      goto LABEL_5;
    case 1:
      v8 = (id *)MEMORY[0x1E0D69310];
      v9 = 2;
      goto LABEL_5;
    case 2:
      v8 = (id *)MEMORY[0x1E0D69320];
      v9 = 3;
LABEL_5:
      v10 = *v8;
      -[PKPeerPaymentPreferences addSendRestrictionType:altDSID:](self->_preferences, "addSendRestrictionType:altDSID:", v9, v18);
      goto LABEL_6;
    case 3:
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=SCREEN_TIME&path=COMMUNICATION_LIMITS"));
      v13 = (PKPeerPaymentPreferencesUpdateRequest *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "openSensitiveURL:withOptions:", v13, 0);
      goto LABEL_10;
    case 4:
      goto LABEL_11;
    default:
      v10 = 0;
LABEL_6:
      v11 = [PKPeerPaymentPreferencesUpdateRequest alloc];
      v12 = (void *)-[PKPeerPaymentPreferences copy](self->_preferences, "copy");
      v13 = -[PKPeerPaymentPreferencesUpdateRequest initWithUpdatedPreferences:section:](v11, "initWithUpdatedPreferences:section:", v12, 2);

      -[PKPeerPaymentAssociatedAccountViewController _addPreferencesUpdateWithRequest:](self, "_addPreferencesUpdateWithRequest:", v13);
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D69288], *MEMORY[0x1E0D68AA0]);
      if (v10)
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D69290]);
      v15 = (void *)MEMORY[0x1E0D66A58];
      v16 = *MEMORY[0x1E0D698D8];
      v17 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v15, "subject:sendEvent:", v16, v17);

LABEL_10:
LABEL_11:

      return;
  }
}

- (void)_receiveRestrictionsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  PKFamilyMember *familyMember;
  id v6;
  uint64_t v7;
  uint64_t v8;
  PKPeerPaymentPreferencesUpdateRequest *v9;
  void *v10;
  PKPeerPaymentPreferencesUpdateRequest *v11;
  id v12;

  familyMember = self->_familyMember;
  v6 = a4;
  -[PKFamilyMember altDSID](familyMember, "altDSID");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "row");

  if (!v7)
  {
    v8 = 1;
    goto LABEL_6;
  }
  if (v7 != 4)
  {
    if (v7 != 1)
    {
LABEL_7:
      v9 = [PKPeerPaymentPreferencesUpdateRequest alloc];
      v10 = (void *)-[PKPeerPaymentPreferences copy](self->_preferences, "copy");
      v11 = -[PKPeerPaymentPreferencesUpdateRequest initWithUpdatedPreferences:section:](v9, "initWithUpdatedPreferences:section:", v10, 3);

      -[PKPeerPaymentAssociatedAccountViewController _addPreferencesUpdateWithRequest:](self, "_addPreferencesUpdateWithRequest:", v11);
      goto LABEL_8;
    }
    v8 = 2;
LABEL_6:
    -[PKPeerPaymentPreferences addReceiveRestrictionType:altDSID:](self->_preferences, "addReceiveRestrictionType:altDSID:", v8, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_actionsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PKFamilyMember appleID](self->_familyMember, "appleID", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount currentBalance](self->_associatedAccount, "currentBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKPeerPaymentGetSendPaymentSensitiveURL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openSensitiveURL:withOptions:", v8, 0);

  }
}

- (void)_disableCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_DISABLE_ALERT_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFamilyMember firstName](self->_familyMember, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_DISABLE_ALERT_MESSAGE"), CFSTR("%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_DISABLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__PKPeerPaymentAssociatedAccountViewController__disableCellSelectedForTableView_atIndexPath___block_invoke;
  v18[3] = &unk_1E3E61D90;
  v18[4] = self;
  v19 = v5;
  v13 = v5;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 2, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
  objc_msgSend(v10, "addAction:", v14);
  v15 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_DISABLE_CANCEL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
  objc_msgSend(v10, "addAction:", v17);
  -[PKPeerPaymentAssociatedAccountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

uint64_t __93__PKPeerPaymentAssociatedAccountViewController__disableCellSelectedForTableView_atIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modifyPeerPaymentAccountState:atIndexPath:", 3, *(_QWORD *)(a1 + 40));
}

- (void)_enableCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  -[PKPeerPaymentAssociatedAccountViewController _modifyPeerPaymentAccountState:atIndexPath:](self, "_modifyPeerPaymentAccountState:atIndexPath:", 1, a4);
}

- (BOOL)_detailsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_modifyingAccount)
    goto LABEL_2;
  v11 = objc_msgSend(v7, "row");
  if (v11 == 2)
    goto LABEL_7;
  if (v11 == 1)
  {
    v9 = -[PKPeerPaymentAssociatedAccountViewController _actionsCellShouldHighlightForTableView:atIndexPath:](self, "_actionsCellShouldHighlightForTableView:atIndexPath:", v6, v8);
    goto LABEL_3;
  }
  if (v11)
LABEL_2:
    v9 = 0;
  else
LABEL_7:
    v9 = 1;
LABEL_3:

  return v9;
}

- (BOOL)_recurringPaymentsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount;
}

- (BOOL)_sendRestrictionsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount && (unint64_t)objc_msgSend(a4, "row", a3) < 4;
}

- (BOOL)_receiveRestrictionsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount && (unint64_t)objc_msgSend(a4, "row", a3) < 2;
}

- (BOOL)_notificationsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount;
}

- (BOOL)_actionsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount;
}

- (BOOL)_disableCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount;
}

- (BOOL)_enableCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount;
}

- (id)_detailsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  if (v8 == 2)
  {
    -[PKPeerPaymentAssociatedAccountViewController _transactionsCellForTableView:atIndexPath:](self, "_transactionsCellForTableView:atIndexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (v8 == 1)
  {
    -[PKPeerPaymentAssociatedAccountViewController _actionsCellForTableView:atIndexPath:](self, "_actionsCellForTableView:atIndexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      v10 = 0;
      goto LABEL_9;
    }
    -[PKPeerPaymentAssociatedAccountViewController _balanceCellForTableView:atIndexPath:](self, "_balanceCellForTableView:atIndexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_9:

  return v10;
}

- (id)_balanceCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  -[PKPeerPaymentAssociatedAccountViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v7, v6);

  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_BALANCE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v7, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount currentBalance](self->_associatedAccount, "currentBalance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "formattedStringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v12);

  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E0D67928]);
  return v7;
}

- (id)_recurringPaymentsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  PKPaymentTransactionTableCell *v9;
  unint64_t v10;
  double v11;
  NSArray *recurringPayments;
  PKPaymentTransactionTableCell *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  if (v8 >= -[NSArray count](self->_recurringPayments, "count"))
  {
    if (-[NSArray count](self->_recurringPayments, "count"))
    {
      PKLocalizedPeerPaymentRecurringString(CFSTR("FAMILY_SETTING_SETUP_ANOTHER_PAYMENT"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKFamilyMember firstName](self->_familyMember, "firstName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentRecurringString(CFSTR("FAMILY_SETTING_SETUP_NEW_PAYMENT"), CFSTR("%@"), v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PKPeerPaymentAssociatedAccountViewController _linkCellWithText:color:forTableView:](self, "_linkCellWithText:color:forTableView:", v14, 0, v6);
    v13 = (PKPaymentTransactionTableCell *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v13, v7);
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PKPeerPaymentFamilyMemberViewControllerTransactionCell"));
    v9 = (PKPaymentTransactionTableCell *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      v9 = -[PKPaymentTransactionTableCell initWithStyle:reuseIdentifier:]([PKPaymentTransactionTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKPeerPaymentFamilyMemberViewControllerTransactionCell"));
    v10 = PKUIGetMinScreenWidthType();
    v11 = 4.0;
    if (v10 >= 2)
      v11 = 7.0;
    -[PKPaymentTransactionTableCell setAdditionalInsets:](v9, "setAdditionalInsets:", 0.0, v11, 0.0, v11);
    recurringPayments = self->_recurringPayments;
    v13 = v9;
    -[NSArray objectAtIndex:](recurringPayments, "objectAtIndex:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKPeerPaymentTransactionForRecurringPayment();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionCellController configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:](self->_transactionPresenter, "configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:", v13, v15, self->_transactionSource, self->_familyMember, 0, self->_detailViewStyle, 0, self);

  }
  PKAccessibilityIDCellSet(v13, (void *)*MEMORY[0x1E0D67F48]);

  return v13;
}

- (id)_transactionsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[PKPeerPaymentAssociatedAccountViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v7, v6);

  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_TRANSACTIONS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v7, "setAccessoryType:", 1);
  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E0D68150]);
  return v7;
}

- (id)_sendRestrictionsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void **v11;

  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v7, "row"))
  {
    case 0:
      -[PKPeerPaymentAssociatedAccountViewController _sendRestrictionAnyoneCellForTableView:atIndexPath:](self, "_sendRestrictionAnyoneCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[PKPeerPaymentAssociatedAccountViewController _sendRestrictionContactsCellForTableView:atIndexPath:](self, "_sendRestrictionContactsCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[PKPeerPaymentAssociatedAccountViewController _sendRestrictionFamilyCellForTableView:atIndexPath:](self, "_sendRestrictionFamilyCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[PKPeerPaymentAssociatedAccountViewController _sendRestrictionScreenTimeSettingsCellForTableView:atIndexPath:](self, "_sendRestrictionScreenTimeSettingsCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }
  v10 = objc_msgSend(v7, "row");
  if (v10 > 3)
    v11 = (void **)MEMORY[0x1E0D68188];
  else
    v11 = (void **)qword_1E3E65EF0[v10];
  PKAccessibilityIDCellSet(v9, *v11);

  return v9;
}

- (id)_sendRestrictionAnyoneCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKPeerPaymentPreferences *preferences;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  -[PKPeerPaymentAssociatedAccountViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RESTRICTIONS_EVERYONE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  preferences = self->_preferences;
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPreferences restrictionsForAltDSID:](preferences, "restrictionsForAltDSID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "sendRestrictionType") == 1)
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v7, "setAccessoryType:", v13);
  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v7, v6);

  return v7;
}

- (id)_sendRestrictionContactsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKPeerPaymentPreferences *preferences;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  -[PKPeerPaymentAssociatedAccountViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RESTRICTIONS_CONTACTS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  preferences = self->_preferences;
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPreferences restrictionsForAltDSID:](preferences, "restrictionsForAltDSID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "sendRestrictionType") == 2)
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v7, "setAccessoryType:", v13);
  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v7, v6);

  return v7;
}

- (id)_sendRestrictionFamilyCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKPeerPaymentPreferences *preferences;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  -[PKPeerPaymentAssociatedAccountViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RESTRICTIONS_FAMILY"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  preferences = self->_preferences;
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPreferences restrictionsForAltDSID:](preferences, "restrictionsForAltDSID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "sendRestrictionType") == 3)
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v7, "setAccessoryType:", v13);
  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v7, v6);

  return v7;
}

- (id)_sendRestrictionScreenTimeSettingsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RESTRICTIONS_SCREEN_TIME_SETTINGS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAssociatedAccountViewController _linkCellWithText:color:forTableView:](self, "_linkCellWithText:color:forTableView:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v10, v6);
  return v10;
}

- (id)_receiveRestrictionsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void **v12;
  void **v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  if (v8 == 1)
  {
    -[PKPeerPaymentAssociatedAccountViewController _receiveRestrictionFamilyCellForTableView:atIndexPath:](self, "_receiveRestrictionFamilyCellForTableView:atIndexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v8)
  {
    -[PKPeerPaymentAssociatedAccountViewController _receiveRestrictionAnyoneCellForTableView:atIndexPath:](self, "_receiveRestrictionAnyoneCellForTableView:atIndexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  v11 = objc_msgSend(v7, "row");
  v12 = (void **)MEMORY[0x1E0D67B80];
  v13 = (void **)MEMORY[0x1E0D67BB8];
  if (v11 != 1)
    v13 = (void **)MEMORY[0x1E0D68188];
  if (v11)
    v12 = v13;
  PKAccessibilityIDCellSet(v10, *v12);

  return v10;
}

- (id)_receiveRestrictionAnyoneCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKPeerPaymentPreferences *preferences;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  -[PKPeerPaymentAssociatedAccountViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedNearbyPeerPaymentString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RECEIVE_RESTRICTIONS_ANYONE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  preferences = self->_preferences;
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPreferences restrictionsForAltDSID:](preferences, "restrictionsForAltDSID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "receiveRestrictionType") == 1)
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v7, "setAccessoryType:", v13);
  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v7, v6);

  return v7;
}

- (id)_receiveRestrictionFamilyCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKPeerPaymentPreferences *preferences;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  -[PKPeerPaymentAssociatedAccountViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedNearbyPeerPaymentString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RECEIVE_RESTRICTIONS_FAMILY"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  preferences = self->_preferences;
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPreferences restrictionsForAltDSID:](preferences, "restrictionsForAltDSID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "receiveRestrictionType") == 2)
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v7, "setAccessoryType:", v13);
  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v7, v6);

  return v7;
}

- (id)_notificationsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "row"))
  {
    v8 = 0;
  }
  else
  {
    -[PKPeerPaymentAssociatedAccountViewController _notificationTransactionsCellForTableView:atIndexPath:](self, "_notificationTransactionsCellForTableView:atIndexPath:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_notificationTransactionsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKPeerPaymentPreferences *preferences;
  void *v11;
  void *v12;

  v6 = a4;
  -[PKPeerPaymentAssociatedAccountViewController _switchCellWithTextColor:forTableView:](self, "_switchCellWithTextColor:forTableView:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_NOTIFICATIONS_TRANSACTIONS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v7, "setTarget:action:", self, sel__notificationTransactionsSelectionHasChanged_);
  preferences = self->_preferences;
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPreferences notificationWithType:altDSID:](preferences, "notificationWithType:altDSID:", 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setOn:", objc_msgSend(v12, "value"));
  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v7, v6);

  return v7;
}

- (id)_actionsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_ACTION_SEND_MONEY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAssociatedAccountViewController _linkCellWithText:color:forTableView:](self, "_linkCellWithText:color:forTableView:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E0D68010]);
  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v10, v6);

  return v10;
}

- (id)_disableCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_DISABLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAssociatedAccountViewController _linkCellWithText:color:forTableView:](self, "_linkCellWithText:color:forTableView:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v10, v6);
  if (self->_modifyingAccount)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v11, "startAnimating");
    objc_msgSend(v10, "setAccessoryView:", v11);

  }
  else
  {
    objc_msgSend(v10, "setAccessoryView:", 0);
  }
  PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E0D67D10]);
  return v10;
}

- (id)_enableCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_ENABLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAssociatedAccountViewController _linkCellWithText:color:forTableView:](self, "_linkCellWithText:color:forTableView:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentAssociatedAccountViewController _updateCellLoadingState:indexPath:](self, "_updateCellLoadingState:indexPath:", v10, v6);
  if (self->_modifyingAccount)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v11, "startAnimating");
    objc_msgSend(v10, "setAccessoryView:", v11);

  }
  else
  {
    objc_msgSend(v10, "setAccessoryView:", 0);
  }
  PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E0D68190]);
  return v10;
}

- (id)_defaultCellWithTextColor:(id)a3 forTableView:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("PKPeerPaymentFamilyMemberViewControllerDefaultCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PKPeerPaymentFamilyMemberViewControllerDefaultCell"));
  PKAccessibilityIDCellSet(v7, 0);
  -[PKPeerPaymentAssociatedAccountViewController _applyDefaultStylingToCell:textLabelColor:](self, "_applyDefaultStylingToCell:textLabelColor:", v7, v6);

  return v7;
}

- (id)_switchCellWithTextColor:(id)a3 forTableView:(id)a4
{
  id v6;
  PKSettingTableCell *v7;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("PKPeerPaymentFamilyMemberViewControllerSwitchCell"));
  v7 = (PKSettingTableCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[PKSettingTableCell initWithStyle:reuseIdentifier:]([PKSettingTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKPeerPaymentFamilyMemberViewControllerSwitchCell"));
  -[PKPeerPaymentAssociatedAccountViewController _applyDefaultStylingToCell:textLabelColor:](self, "_applyDefaultStylingToCell:textLabelColor:", v7, v6);

  return v7;
}

- (id)_linkCellWithText:(id)a3 color:(id)a4 forTableView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  if (a4)
  {
    v8 = a5;
    v9 = a3;
    -[PKPeerPaymentAssociatedAccountViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", a4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0DC3658];
    v12 = a5;
    v13 = a3;
    objc_msgSend(v11, "systemBlueColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAssociatedAccountViewController _defaultCellWithTextColor:forTableView:](self, "_defaultCellWithTextColor:forTableView:", v8, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", a3);

  return v10;
}

- (void)_applyDefaultStylingToCell:(id)a3 textLabelColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "textLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", 0);
  objc_msgSend(v10, "setTextColor:", v5);

  objc_msgSend(v6, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", 0);
  objc_msgSend(v6, "setAccessoryType:", 0);
  objc_msgSend(v6, "setSelectionStyle:", 3);
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);
  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 1);

  objc_msgSend(v6, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setEnabled:", 1);
}

- (void)_updateCellLoadingState:(id)a3 indexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setUserInteractionEnabled:", !self->_modifyingAccount);
  objc_msgSend(v8, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", !self->_modifyingAccount);

  objc_msgSend(v8, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", !self->_modifyingAccount);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "settingSwitch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", !self->_modifyingAccount);

  }
  else
  {
    objc_msgSend(v8, "setAccessoryView:", 0);
  }

}

- (void)_notificationTransactionsSelectionHasChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  PKPeerPaymentPreferencesUpdateRequest *v7;
  void *v8;
  PKPeerPaymentPreferencesUpdateRequest *v9;
  NSString *viewerFamilyMemberTypeAnalyticsKey;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentPreferences notificationWithType:altDSID:](self->_preferences, "notificationWithType:altDSID:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "value");
  objc_msgSend(v5, "setValue:", v6 ^ 1u);
  -[PKPeerPaymentPreferences didUpdateNotification:](self->_preferences, "didUpdateNotification:", v5);
  v7 = [PKPeerPaymentPreferencesUpdateRequest alloc];
  v8 = (void *)-[PKPeerPaymentPreferences copy](self->_preferences, "copy");
  v9 = -[PKPeerPaymentPreferencesUpdateRequest initWithUpdatedPreferences:section:](v7, "initWithUpdatedPreferences:section:", v8, 4);

  -[PKPeerPaymentAssociatedAccountViewController _addPreferencesUpdateWithRequest:](self, "_addPreferencesUpdateWithRequest:", v9);
  viewerFamilyMemberTypeAnalyticsKey = self->_viewerFamilyMemberTypeAnalyticsKey;
  if (viewerFamilyMemberTypeAnalyticsKey)
  {
    v11 = (void *)MEMORY[0x1E0D66A58];
    v12 = *MEMORY[0x1E0D698D8];
    v13 = *MEMORY[0x1E0D69780];
    v14 = *MEMORY[0x1E0D68AA0];
    v20[0] = *MEMORY[0x1E0D68F50];
    v20[1] = v14;
    v15 = *MEMORY[0x1E0D68C28];
    v21[0] = v13;
    v21[1] = v15;
    v16 = *MEMORY[0x1E0D695A0];
    v20[2] = *MEMORY[0x1E0D695D8];
    v20[3] = v16;
    v17 = (uint64_t *)MEMORY[0x1E0D695B0];
    if (v6)
      v17 = (uint64_t *)MEMORY[0x1E0D695A8];
    v18 = *v17;
    v21[2] = *MEMORY[0x1E0D69250];
    v21[3] = v18;
    v20[4] = *MEMORY[0x1E0D68C78];
    v21[4] = viewerFamilyMemberTypeAnalyticsKey;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subject:sendEvent:", v12, v19);

  }
}

- (void)_modifyPeerPaymentAccountState:(unint64_t)a3 atIndexPath:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  _QWORD aBlock[5];
  uint8_t buf[16];

  if (!self->_modifyingAccount)
  {
    -[PKPeerPaymentAccount associatedAccountStateActionFeatureDescriptor](self->_peerPaymentAccount, "associatedAccountStateActionFeatureDescriptor", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke;
      aBlock[3] = &unk_1E3E612E8;
      aBlock[4] = self;
      v9 = _Block_copy(aBlock);
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_2;
      v16[3] = &unk_1E3E65E58;
      v16[4] = self;
      v17 = v7;
      v19 = a3;
      v10 = v9;
      v18 = v10;
      v11 = (void (**)(_QWORD))_Block_copy(v16);
      self->_modifyingAccount = 1;
      -[PKSectionTableViewController updateSectionVisibilityAndReloadIfNecessaryForAllSections](self, "updateSectionVisibilityAndReloadIfNecessaryForAllSections");
      if (a3 - 2 >= 3 && a3)
      {
        if (a3 == 1)
        {
          v13[0] = v8;
          v13[1] = 3221225472;
          v13[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_7;
          v13[3] = &unk_1E3E65E80;
          v13[4] = self;
          v14 = v10;
          v15 = v11;
          -[PKPeerPaymentAssociatedAccountViewController _presentPassworkPromptWithCompletion:](self, "_presentPassworkPromptWithCompletion:", v13);

        }
      }
      else
      {
        v11[2](v11);
      }

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Error: no feature identifier defined for associatedAccountStateActionFeatureDescriptor", buf, 2u);
      }

    }
  }
}

uint64_t __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1193) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "updateSectionVisibilityAndReloadIfNecessaryForAllSections");
}

void __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0D673E8]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithAssociatedAccountIdentifier:", v3);

  objc_msgSend(v4, "setFeatureIdentifier:", *(_QWORD *)(a1 + 40));
  PKPeerPaymentAccountStateToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1096);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_3;
  v8[3] = &unk_1E3E65E30;
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v6, "peerPaymentAssociatedAccountActionWithRequest:completion:", v4, v8);

}

void __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_4;
  v10[3] = &unk_1E3E65E08;
  v11 = v5;
  v12 = v6;
  v7 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    v9 = *(void **)(v7 + 1112);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_5;
    v12[3] = &unk_1E3E65DE0;
    v12[4] = v7;
    v13 = v8;
    objc_msgSend(v9, "updateAssociatedAccountsWithCompletion:", v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_QWORD *)(a1 + 40))
    {
      v10 = v2;
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_EMAIL_STATEMENT_ERROR_TITLE"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_EMAIL_STATEMENT_ERROR_MESSAGE"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
    v11 = v2;
    v6 = PKAlertForDisplayableErrorWithHandlers(v2, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v6, 1, 0);

  }
}

void __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_6;
  block[3] = &unk_1E3E65388;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePeerPaymentAccountWithNewAccount:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v8 = *(_QWORD *)(a1 + 48);
LABEL_12:
    (*(void (**)(void))(v8 + 16))();
    goto LABEL_13;
  }
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CFFF10];
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CFFF10]))
  {
    v7 = objc_msgSend(v4, "code");

    if (v7 == -7003)
      goto LABEL_11;
  }
  else
  {

  }
  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqual:", v6))
  {

    goto LABEL_11;
  }
  v10 = objc_msgSend(v4, "code");

  if (v10 != -7005)
  {
LABEL_11:
    v8 = *(_QWORD *)(a1 + 40);
    goto LABEL_12;
  }
  PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_8;
  v17[3] = &unk_1E3E61CA8;
  v18 = *(id *)(a1 + 40);
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v16);

  PKAccessibilityIDAlertSet(v13, (void *)*MEMORY[0x1E0D67B70]);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v13, 0, 0);

LABEL_13:
}

uint64_t __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentPassworkPromptWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[PKPeerPaymentWebService _appleAccountInformation](self->_peerPaymentWebSerivce, "_appleAccountInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0D002F8]);
  objc_msgSend(v6, "setPresentingViewController:", self);
  objc_msgSend(v5, "appleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUsername:", v7);

  objc_msgSend(v5, "aaAlternateDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAltDSID:", v8);

  objc_msgSend(v6, "setIsUsernameEditable:", 0);
  objc_msgSend(v6, "setShouldPromptForPasswordOnly:", 1);
  objc_msgSend(v6, "setAuthenticationType:", 2);
  v9 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PKPeerPaymentAssociatedAccountViewController__presentPassworkPromptWithCompletion___block_invoke;
  v11[3] = &unk_1E3E65EA8;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "authenticateWithContext:completion:", v6, v11);

}

void __85__PKPeerPaymentAssociatedAccountViewController__presentPassworkPromptWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PKPeerPaymentAssociatedAccountViewController__presentPassworkPromptWithCompletion___block_invoke_2;
  v7[3] = &unk_1E3E618A0;
  v5 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __85__PKPeerPaymentAssociatedAccountViewController__presentPassworkPromptWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_updatePeerPaymentAccountWithNewAccount:(id)a3
{
  PKPeerPaymentAccount **p_peerPaymentAccount;
  PKPeerPaymentAccount *v6;
  void *v7;
  PKPeerPaymentAccount *v8;
  PKPeerPaymentAccount *associatedAccount;
  PKTransactionSource *v10;
  PKTransactionSource *transactionSource;
  id v12;

  p_peerPaymentAccount = &self->_peerPaymentAccount;
  objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
  v12 = a3;
  v6 = *p_peerPaymentAccount;
  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount peerPaymentAccountWithAltDSID:](v6, "peerPaymentAccountWithAltDSID:", v7);
  v8 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue();
  associatedAccount = self->_associatedAccount;
  self->_associatedAccount = v8;

  v10 = (PKTransactionSource *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPeerPaymentAccount:", self->_associatedAccount);
  transactionSource = self->_transactionSource;
  self->_transactionSource = v10;

}

- (void)_addPreferencesUpdateWithRequest:(id)a3
{
  id v5;
  PKPeerPaymentPreferencesUpdateRequest *pendingPreferencesUpdateRequest;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  PKPeerPaymentPreferencesUpdateRequest *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pendingPreferencesUpdateRequest = self->_pendingPreferencesUpdateRequest;
  if (pendingPreferencesUpdateRequest)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = pendingPreferencesUpdateRequest;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Associated Account preferences request coalesced %@ onto pending request %@", (uint8_t *)&v10, 0x16u);
    }

    -[PKPeerPaymentPreferencesUpdateRequest coalesceWithRequest:](self->_pendingPreferencesUpdateRequest, "coalesceWithRequest:", v5);
  }
  else
  {
    objc_storeStrong((id *)&self->_pendingPreferencesUpdateRequest, a3);
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Associated Account preferences request queued %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v5, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSectionTableViewController updateSectionVisibilityAndReloadIfNecessaryForSections:](self, "updateSectionVisibilityAndReloadIfNecessaryForSections:", v9);

  -[PKPeerPaymentAssociatedAccountViewController _executeNextPreferencesUpdateRequestIfPossible](self, "_executeNextPreferencesUpdateRequestIfPossible");
}

- (void)_executeNextPreferencesUpdateRequestIfPossible
{
  id *p_currentPreferencesUpdateRequest;
  PKPeerPaymentPreferencesUpdateRequest *pendingPreferencesUpdateRequest;
  id v5;
  void *v6;
  NSObject *v7;
  PKPeerPaymentService *peerPaymentService;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_currentPreferencesUpdateRequest = (id *)&self->_currentPreferencesUpdateRequest;
  if (!self->_currentPreferencesUpdateRequest)
  {
    objc_storeStrong((id *)&self->_currentPreferencesUpdateRequest, self->_pendingPreferencesUpdateRequest);
    if (*p_currentPreferencesUpdateRequest
      && (pendingPreferencesUpdateRequest = self->_pendingPreferencesUpdateRequest,
          self->_pendingPreferencesUpdateRequest = 0,
          pendingPreferencesUpdateRequest,
          (v5 = *p_currentPreferencesUpdateRequest) != 0))
    {
      v6 = v5;
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v6;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Associated Account preferences request starting %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      peerPaymentService = self->_peerPaymentService;
      objc_msgSend(v6, "updatedPreferences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke;
      v12[3] = &unk_1E3E65ED0;
      objc_copyWeak(&v14, (id *)buf);
      v10 = v6;
      v13 = v10;
      -[PKPeerPaymentService setPreferences:completion:](peerPaymentService, "setPreferences:completion:", v9, v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);

    }
    else if (self->_preferencesChanged)
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Updating preferences from peer payment since since this is the last associated accounts preference update request.", buf, 2u);
      }

      -[PKPeerPaymentAssociatedAccountViewController _updatePreferencesFromPeerPaymentServiceAndReloadView](self, "_updatePreferencesFromPeerPaymentServiceAndReloadView");
    }
  }
}

void __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke(uint64_t a1, void *a2, void *a3)
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
  v9[2] = __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke_2;
  v9[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = *(id *)(a1 + 32);
  v11 = v6;
  v12 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment Associated Account preferences request completed %@", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v5;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error updating peer payment preferences for associated account %@", buf, 0xCu);
      }

      objc_storeStrong(WeakRetained + 141, *(id *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "sections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "updateSectionVisibilityAndReloadIfNecessaryForSections:", v7);

      objc_msgSend(WeakRetained[135], "firstName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ERROR_UPDATING_PREFERENCES_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ERROR_UPDATING_PREFERENCES_MESSAGE"), CFSTR("%@"), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v14);

      objc_msgSend(WeakRetained, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke_156;
      v17[3] = &unk_1E3E612E8;
      v17[4] = WeakRetained;
      objc_msgSend(v15, "presentViewController:animated:completion:", v11, 1, v17);

    }
    else
    {
      v16 = WeakRetained[147];
      WeakRetained[147] = 0;

      objc_msgSend(WeakRetained, "_executeNextPreferencesUpdateRequestIfPossible");
    }
  }

}

uint64_t __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke_156(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1176);
  *(_QWORD *)(v2 + 1176) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_executeNextPreferencesUpdateRequestIfPossible");
}

- (void)_loadRecurringPayments
{
  PKPeerPaymentService *peerPaymentService;
  _QWORD v3[5];

  peerPaymentService = self->_peerPaymentService;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__PKPeerPaymentAssociatedAccountViewController__loadRecurringPayments__block_invoke;
  v3[3] = &unk_1E3E61E98;
  v3[4] = self;
  -[PKPeerPaymentService recurringPaymentsWithCompletion:](peerPaymentService, "recurringPaymentsWithCompletion:", v3);
}

void __70__PKPeerPaymentAssociatedAccountViewController__loadRecurringPayments__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  _QWORD block[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "recipientAltDSID");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v5;
        v14 = v13;
        if (v12 == v13)
        {

LABEL_12:
          objc_msgSend(v4, "addObject:", v11);
          continue;
        }
        if (v5 && v12)
        {
          v15 = objc_msgSend(v12, "isEqualToString:", v13);

          if (v15)
            goto LABEL_12;
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPeerPaymentAssociatedAccountViewController__loadRecurringPayments__block_invoke_2;
  block[3] = &unk_1E3E61388;
  block[4] = *(_QWORD *)(v17 + 32);
  v19 = v4;
  v16 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __70__PKPeerPaymentAssociatedAccountViewController__loadRecurringPayments__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1208);
  *(_QWORD *)(v3 + 1208) = v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSections:withRowAnimation:", v5, 100);

  }
}

- (void)paymentSetupDidFinish:(id)a3
{
  void *v3;
  id v4;

  -[PKPeerPaymentAssociatedAccountViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pkui_frontMostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurringPayments, 0);
  objc_storeStrong((id *)&self->_pendingPreferencesUpdateRequest, 0);
  objc_storeStrong((id *)&self->_currentPreferencesUpdateRequest, 0);
  objc_storeStrong((id *)&self->_viewerFamilyMemberTypeAnalyticsKey, 0);
  objc_storeStrong((id *)&self->_transactionPresenter, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_associatedAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebSerivce, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
