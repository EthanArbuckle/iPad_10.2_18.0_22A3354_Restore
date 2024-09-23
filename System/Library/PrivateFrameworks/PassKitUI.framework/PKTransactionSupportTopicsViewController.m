@implementation PKTransactionSupportTopicsViewController

- (PKTransactionSupportTopicsViewController)initWithAccount:(id)a3 transaction:(id)a4 transactionSourceCollection:(id)a5 familyCollection:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PKTransactionSupportTopicsViewController *v18;
  PKTransactionSupportTopicsViewController *v19;
  uint64_t v20;
  NSSet *physicalCards;
  uint64_t v22;
  PKPaymentService *paymentService;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v28 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKTransactionSupportTopicsViewController;
  v18 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v29, sel_initWithProvisioningController_context_delegate_, 0, 0, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_transaction, a4);
    objc_storeStrong((id *)&v19->_transactionSourceCollection, a5);
    objc_storeStrong((id *)&v19->_familyCollection, a6);
    objc_storeStrong((id *)&v19->_accountUserCollection, a7);
    v20 = -[NSSet copy](v19->_physicalCards, "copy");
    physicalCards = v19->_physicalCards;
    v19->_physicalCards = (NSSet *)v20;

    v19->_loadingTopics = 0;
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v19);
    paymentService = v19->_paymentService;
    v19->_paymentService = (PKPaymentService *)v22;

    -[PKTransactionSupportTopicsViewController navigationItem](v19, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v19, sel__cancelTapped);
    objc_msgSend(v24, "setLeftBarButtonItem:", v25);

    objc_msgSend(v24, "setBackButtonDisplayMode:", 2);
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_TITLE"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:", v26);

  }
  return v19;
}

- (void)_fetchSupportTopics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  self->_loadingTopics = 1;
  -[PKTransactionSupportTopicsViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  v3 = objc_alloc_init(MEMORY[0x1E0D669E0]);
  -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseURL:", v4);

  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountIdentifier:", v5);

  objc_msgSend(v3, "setTransaction:", self->_transaction);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKTransactionSupportTopicsViewController__fetchSupportTopics__block_invoke;
  v7[3] = &unk_1E3E66110;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "supportTopicsWithRequest:completion:", v3, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __63__PKTransactionSupportTopicsViewController__fetchSupportTopics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PKTransactionSupportTopicsViewController__fetchSupportTopics__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __63__PKTransactionSupportTopicsViewController__fetchSupportTopics__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  PKBusinessChatTransactionDisputeContext *v12;
  void *v13;
  PKBusinessChatTransactionDisputeContext *v14;
  id *v15;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1368) = 0;
    v15 = WeakRetained;
    objc_msgSend(WeakRetained, "_setNeedsUpdateContentUnavailableConfiguration");
    objc_msgSend(*(id *)(a1 + 32), "topics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "topics");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "topics");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_reloadSectionControllerWithTopics:", v6);
      }
      else
      {
        objc_msgSend(v15[163], "accountUserForTransaction:", v15[160]);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v15[162];
        objc_msgSend(v6, "altDSID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "familyMemberForAltDSID:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v15[160], "transactionType");
        if ((unint64_t)(v10 - 13) < 2)
        {
          v11 = 11;
        }
        else if (v10 == 7)
        {
          if (objc_msgSend(v15[160], "adjustmentTypeReason") == 3)
            v11 = 12;
          else
            v11 = 13;
        }
        else if (v10 == 10)
        {
          v11 = 9;
        }
        else
        {
          v11 = 5;
        }
        v12 = [PKBusinessChatTransactionDisputeContext alloc];
        objc_msgSend(v15[161], "paymentPass");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[PKBusinessChatTransactionDisputeContext initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:](v12, "initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:", v13, v15[160], v15[159], v6, v9, v15[164], v11);

        objc_msgSend(v15, "_openBusinessChatWithContext:", v14);
      }

    }
    else
    {
      objc_msgSend(v15, "_redirectUserToLegacyReportIssue");
    }
    WeakRetained = v15;
  }

}

- (void)_redirectUserToLegacyReportIssue
{
  PKReportIssueViewController *v3;
  PKPaymentTransaction *transaction;
  PKTransactionSourceCollection *transactionSourceCollection;
  void *v6;
  PKReportIssueViewController *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = [PKReportIssueViewController alloc];
  transaction = self->_transaction;
  transactionSourceCollection = self->_transactionSourceCollection;
  -[PKTransactionSourceCollection paymentPass](transactionSourceCollection, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKReportIssueViewController initWithTransaction:transactionSourceCollection:paymentPass:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:detailViewStyle:context:](v3, "initWithTransaction:transactionSourceCollection:paymentPass:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:detailViewStyle:context:", transaction, transactionSourceCollection, v6, self->_familyCollection, self->_account, self->_accountUserCollection, 0, self->_physicalCards, 0, 0);

  -[PKTransactionSupportTopicsViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setViewControllers:animated:", v9, 0);

  }
}

- (void)_reloadSectionControllerWithTopics:(id)a3
{
  id v4;
  PKDashboardPaymentTransactionItemPresenter *v5;
  PKDashboardPaymentTransactionItem *v6;
  PKTransactionSupportTransactionSectionController *v7;
  void *v8;
  PKTransactionSupportTransactionSectionController *v9;
  PKTransactionSupportTransactionSectionController *transactionSectionController;
  PKAccountSupportTopicsSectionController *v11;
  PKAccount *account;
  void *v13;
  void *v14;
  PKAccountSupportTopicsSectionController *v15;
  PKAccountSupportTopicsSectionController *sectionTopicController;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  PKAccountSupportTopicsSectionController *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  PKTransactionSupportStatementNameSectionController *v27;
  PKTransactionSupportStatementNameSectionController *merchantNameSectionController;
  PKTransactionSupportStatementNameSectionController *v29;
  void *v30;
  PKDashboardPaymentTransactionItemPresenter *v31;
  _QWORD v32[2];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[PKDashboardPaymentTransactionItemPresenter initWithContext:detailViewStyle:avatarViewDelegate:]([PKDashboardPaymentTransactionItemPresenter alloc], "initWithContext:detailViewStyle:avatarViewDelegate:", 5, 0, self);
    v6 = -[PKDashboardPaymentTransactionItem initWithTransactionSourceCollection:familyCollection:transaction:account:accountUserCollection:bankConnectInstitution:]([PKDashboardPaymentTransactionItem alloc], "initWithTransactionSourceCollection:familyCollection:transaction:account:accountUserCollection:bankConnectInstitution:", self->_transactionSourceCollection, self->_familyCollection, self->_transaction, self->_account, self->_accountUserCollection, 0);
    v7 = [PKTransactionSupportTransactionSectionController alloc];
    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v5;
    v9 = -[PKTransactionSupportTransactionSectionController initWithTransactionItem:transactionItemPresenter:collectionView:](v7, "initWithTransactionItem:transactionItemPresenter:collectionView:", v6, v5, v8);
    transactionSectionController = self->_transactionSectionController;
    self->_transactionSectionController = v9;

    v11 = [PKAccountSupportTopicsSectionController alloc];
    account = self->_account;
    PKLocalizedFeatureString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedUppercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKAccountSupportTopicsSectionController initWithAccount:topics:sectionTitle:delegate:](v11, "initWithAccount:topics:sectionTitle:delegate:", account, v4, v14, self);
    sectionTopicController = self->_sectionTopicController;
    self->_sectionTopicController = v15;

    -[PKPaymentTransaction merchant](self->_transaction, "merchant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rawName");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18 || (objc_msgSend(v17, "name"), (v18 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v17, "displayName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v18;
      v20 = v19;
      if (v18 == v20)
      {

      }
      else
      {
        v21 = v20;
        if (!v20)
        {

LABEL_12:
          v27 = -[PKTransactionSupportStatementNameSectionController initWithMerchantStatementName:]([PKTransactionSupportStatementNameSectionController alloc], "initWithMerchantStatementName:", v18);
          merchantNameSectionController = self->_merchantNameSectionController;
          self->_merchantNameSectionController = v27;

          v29 = self->_merchantNameSectionController;
          v33[0] = self->_transactionSectionController;
          v33[1] = v29;
          v33[2] = self->_sectionTopicController;
          v24 = (void *)MEMORY[0x1E0C99D20];
          v25 = v33;
          v26 = 3;
          goto LABEL_13;
        }
        v22 = objc_msgSend(v18, "isEqualToString:", v20);

        if ((v22 & 1) == 0)
          goto LABEL_12;
      }
    }
    v23 = self->_sectionTopicController;
    v32[0] = self->_transactionSectionController;
    v32[1] = v23;
    v24 = (void *)MEMORY[0x1E0C99D20];
    v25 = v32;
    v26 = 2;
LABEL_13:
    objc_msgSend(v24, "arrayWithObjects:count:", v25, v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v30, 1);

    goto LABEL_14;
  }
  -[PKTransactionSupportTopicsViewController openBusinessChatForTopic:](self, "openBusinessChatForTopic:", 0);
LABEL_14:

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTransactionSupportTopicsViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PKPaymentSetupOptionsViewController setHeaderBackgroundColor:](self, "setHeaderBackgroundColor:", v3);
  -[PKTransactionSupportTopicsViewController _fetchSupportTopics](self, "_fetchSupportTopics");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTransactionSupportTopicsViewController;
  -[PKPaymentSetupOptionsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionSupportTopicsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (self->_loadingTopics)
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
  -[PKTransactionSupportTopicsViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v7);

}

- (void)showExplanationForTopic:(id)a3
{
  unint64_t v4;
  PKAccountSupportTopicExplanationViewController *v5;
  PKReportIssueViewController *v6;
  PKPaymentTransaction *transaction;
  PKTransactionSourceCollection *transactionSourceCollection;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "issueType");
  if (v4 < 4)
  {
    v5 = -[PKAccountSupportTopicExplanationViewController initWithAccount:topic:delegate:]([PKAccountSupportTopicExplanationViewController alloc], "initWithAccount:topic:delegate:", self->_account, v11, self);
LABEL_5:
    -[PKTransactionSupportTopicsViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v5, 1);

    goto LABEL_6;
  }
  if (v4 == 4)
  {
    v6 = [PKReportIssueViewController alloc];
    transaction = self->_transaction;
    transactionSourceCollection = self->_transactionSourceCollection;
    -[PKTransactionSourceCollection paymentPass](transactionSourceCollection, "paymentPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKReportIssueViewController initWithTransaction:transactionSourceCollection:paymentPass:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:detailViewStyle:context:](v6, "initWithTransaction:transactionSourceCollection:paymentPass:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:detailViewStyle:context:", transaction, transactionSourceCollection, v9, self->_familyCollection, self->_account, self->_accountUserCollection, 0, self->_physicalCards, 0, 1);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)deselectCells
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKTransactionSupportTopicsViewController;
  -[PKDynamicCollectionViewController deselectCells](&v2, sel_deselectCells);
}

- (void)reloadItem:(id)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTransactionSupportTopicsViewController;
  -[PKDynamicCollectionViewController reloadItem:animated:](&v4, sel_reloadItem_animated_, a3, a4);
}

- (BOOL)shouldShowSupportLink:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;

  if (objc_msgSend(a3, "action") != 1)
    return 1;
  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (PKIsPhone() && v4)
  {
    if ((objc_msgSend(v4, "useRawMerchantData") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v4, "mapsMerchant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

    }
  }

  return v5;
}

- (void)showMerchantDetailsForTransaction
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *loadingMapsTimer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  dispatch_object_t *p_loadingMapsTimer;
  OS_dispatch_source *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20[2];
  _QWORD handler[4];
  id v22;
  id location;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (!self->_loadingMapsViewController)
  {
    -[PKPaymentTransaction merchant](self->_transaction, "merchant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapsMerchant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "identifier");

    if (v5)
    {
      self->_loadingMapsViewController = 1;
      loadingMapsTimer = self->_loadingMapsTimer;
      if (loadingMapsTimer)
      {
        dispatch_source_cancel(loadingMapsTimer);
        v7 = self->_loadingMapsTimer;
        self->_loadingMapsTimer = 0;

      }
      objc_initWeak(&location, self);
      v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      p_loadingMapsTimer = (dispatch_object_t *)&self->_loadingMapsTimer;
      v10 = self->_loadingMapsTimer;
      self->_loadingMapsTimer = v8;

      v11 = self->_loadingMapsTimer;
      v12 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v13 = *p_loadingMapsTimer;
      v14 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke;
      handler[3] = &unk_1E3E61310;
      objc_copyWeak(&v22, &location);
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume(*p_loadingMapsTimer);
      v15 = objc_alloc_init(MEMORY[0x1E0CC1808]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setMuids:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v15);
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke_2;
      v19[3] = &unk_1E3E680C0;
      objc_copyWeak(v20, &location);
      v20[1] = v5;
      objc_msgSend(v18, "startWithCompletionHandler:", v19);
      objc_destroyWeak(v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }

  }
}

void __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  NSObject **v5;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[174];
    v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = v5[174];
      v5[174] = 0;

      v2 = v5;
    }
    objc_msgSend(v2, "_setBarButtonSpinnerHidden:", 0);
    v2 = v5;
  }

}

void __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12[2];

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke_3;
  v9[3] = &unk_1E3E65C70;
  objc_copyWeak(v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v12[1] = *(id *)(a1 + 40);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(v12);
}

void __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke_3(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  PKMerchantMapViewController *v12;
  void *v13;
  void *v14;
  PKMerchantMapViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[174];
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = v3[174];
      v3[174] = 0;

    }
    *((_BYTE *)v3 + 1385) = 0;
    objc_msgSend(v3, "_setBarButtonSpinnerHidden:", 1);
    if (*(_QWORD *)(a1 + 32)
      || (objc_msgSend(*(id *)(a1 + 40), "mapItems"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "count"),
          v10,
          !v11))
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 56);
        v8 = *(void **)(a1 + 32);
        if (v8)
        {
          objc_msgSend(v8, "localizedDescription");
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = CFSTR("no map items.");
        }
        v23 = 134218242;
        v24 = v7;
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKTransactionHistoryViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v23, 0x16u);
        if (v8)

      }
      v17 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPaymentString(CFSTR("DASHBOARD_MAPS_MERCHANT_ERROR"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", 0, v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("DASHBOARD_MAPS_MERCHANT_ERROR_OK_BUTTON"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v22);

      objc_msgSend(v3, "presentViewController:animated:completion:", v19, 1, 0);
    }
    else
    {
      v12 = [PKMerchantMapViewController alloc];
      objc_msgSend(*(id *)(a1 + 40), "mapItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PKMerchantMapViewController initWithMapItem:](v12, "initWithMapItem:", v14);

      objc_msgSend(v3, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pushViewController:animated:", v15, 1);

    }
  }

}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 dismissAfter:(BOOL)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  BOOL v12;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_OK_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PKTransactionSupportTopicsViewController__presentAlertWithTitle_message_dismissAfter___block_invoke;
  v11[3] = &unk_1E3E680E8;
  v12 = a5;
  v11[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v10);

  -[PKTransactionSupportTopicsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

void __88__PKTransactionSupportTopicsViewController__presentAlertWithTitle_message_dismissAfter___block_invoke(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)openBusinessChatForTopic:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  PKTransactionSupportTopicsViewController *v30;
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  -[PKPaymentTransaction accountIdentifier](self->_transaction, "accountIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = (void *)v5;
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "businessChatIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_7;
  v9 = (void *)v8;
  -[PKPaymentTransaction payments](self->_transaction, "payments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {

LABEL_7:
    goto LABEL_8;
  }
  -[PKPaymentTransaction payments](self->_transaction, "payments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCurrentlyCancellable");

  if (!v13)
  {
LABEL_8:
    -[PKTransactionSupportTopicsViewController _openBusinessChatForTopic:](self, "_openBusinessChatForTopic:", v4);
    goto LABEL_9;
  }
  self->_cancelingPayment = 1;
  -[PKTransactionSupportTopicsViewController _setBarButtonSpinnerHidden:](self, "_setBarButtonSpinnerHidden:", 0);
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
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __69__PKTransactionSupportTopicsViewController_openBusinessChatForTopic___block_invoke;
  v32[3] = &unk_1E3E61D90;
  v32[4] = self;
  v21 = v4;
  v33 = v21;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 2, v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v22);

  v23 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedFeatureString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v20;
  v27 = 3221225472;
  v28 = __69__PKTransactionSupportTopicsViewController_openBusinessChatForTopic___block_invoke_2;
  v29 = &unk_1E3E61D90;
  v30 = self;
  v31 = v21;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, &v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v25, v26, v27, v28, v29, v30);

  -[PKTransactionSupportTopicsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
LABEL_9:

}

uint64_t __69__PKTransactionSupportTopicsViewController_openBusinessChatForTopic___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelPaymentWithFallbackTopic:", *(_QWORD *)(a1 + 40));
}

uint64_t __69__PKTransactionSupportTopicsViewController_openBusinessChatForTopic___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_openBusinessChatForTopic:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1384) = 0;
  return result;
}

- (void)_setBarButtonSpinnerHidden:(BOOL)a3
{
  void *v4;
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *v8;
  void *v9;
  UIActivityIndicatorView *v10;

  if (a3)
  {
    -[PKTransactionSupportTopicsViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", 0);

    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = 0;
  }
  else
  {
    v6 = self->_activityIndicator;
    if (!v6)
    {
      v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v8 = self->_activityIndicator;
      self->_activityIndicator = v7;

      v6 = self->_activityIndicator;
    }
    -[UIActivityIndicatorView startAnimating](v6, "startAnimating");
    -[PKTransactionSupportTopicsViewController navigationItem](self, "navigationItem");
    v10 = (UIActivityIndicatorView *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_activityIndicator);
    -[UIActivityIndicatorView setRightBarButtonItem:](v10, "setRightBarButtonItem:", v9);

    activityIndicator = v10;
  }

}

- (void)_cancelPaymentWithFallbackTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentWebService *paymentWebService;
  PKPaymentWebService *v12;
  PKPaymentWebService *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  -[PKPaymentTransaction payments](self->_transaction, "payments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0D66970]);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountIdentifier:", v8);

  -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseURL:", v9);

  objc_msgSend(v6, "referenceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaymentReferenceIdentifier:", v10);

  objc_initWeak(&location, self);
  paymentWebService = self->_paymentWebService;
  if (!paymentWebService)
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v12 = (PKPaymentWebService *)objc_claimAutoreleasedReturnValue();
    v13 = self->_paymentWebService;
    self->_paymentWebService = v12;

    paymentWebService = self->_paymentWebService;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke;
  v15[3] = &unk_1E3E68138;
  objc_copyWeak(&v17, &location);
  v14 = v4;
  v16 = v14;
  -[PKPaymentWebService cancelPaymentWithRequest:completion:](paymentWebService, "cancelPaymentWithRequest:completion:", v7, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Cancel Payment => %@:%@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_67;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v10 = v6;
  v11 = *(id *)(a1 + 32);
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_67(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1384) = 0;
    objc_msgSend(WeakRetained, "_setBarButtonSpinnerHidden:", 1);
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedFeatureString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedFeatureString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_2;
      v17[3] = &unk_1E3E61D90;
      v17[4] = v3;
      v18 = *(id *)(a1 + 40);
      objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAction:", v10);

      v11 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedFeatureString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAction:", v13);

      objc_msgSend(v3, "presentViewController:animated:completion:", v7, 1, 0);
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      v14 = v3[160];
      objc_msgSend(v14, "setTransactionStatus:", 5);
      objc_msgSend(v14, "transactionSourceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_3;
      v16[3] = &unk_1E3E68110;
      v16[4] = v3;
      objc_msgSend(v7, "insertOrUpdatePaymentTransaction:forTransactionSourceIdentifier:completion:", v14, v15, v16);

    }
  }

}

uint64_t __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openBusinessChatForTopic:", *(_QWORD *)(a1 + 40));
}

void __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_4;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "presentingViewController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_openBusinessChatForTopic:(id)a3
{
  void *v4;
  PKFamilyMemberCollection *familyCollection;
  void *v6;
  void *v7;
  PKBusinessChatTransactionDisputeContext *v8;
  void *v9;
  PKBusinessChatTransactionDisputeContext *v10;
  id v11;

  v11 = a3;
  -[PKAccountUserCollection accountUserForTransaction:](self->_accountUserCollection, "accountUserForTransaction:", self->_transaction);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  familyCollection = self->_familyCollection;
  objc_msgSend(v4, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFamilyMemberCollection familyMemberForAltDSID:](familyCollection, "familyMemberForAltDSID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D66908]), "initWithOtherTopicForAccount:", self->_account);
  v8 = [PKBusinessChatTransactionDisputeContext alloc];
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKBusinessChatTransactionDisputeContext initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:topic:](v8, "initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:topic:", v9, self->_transaction, self->_account, v4, v7, self->_physicalCards, v11);

  -[PKTransactionSupportTopicsViewController _openBusinessChatWithContext:](self, "_openBusinessChatWithContext:", v10);
}

- (void)_openBusinessChatWithContext:(id)a3
{
  id v4;
  PKBusinessChatController *v5;
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  if (!self->_businessChatController)
  {
    v5 = objc_alloc_init(PKBusinessChatController);
    businessChatController = self->_businessChatController;
    self->_businessChatController = v5;

  }
  objc_initWeak(&location, self);
  v7 = self->_businessChatController;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PKTransactionSupportTopicsViewController__openBusinessChatWithContext___block_invoke;
  v8[3] = &unk_1E3E61DB8;
  objc_copyWeak(&v9, &location);
  -[PKBusinessChatController openBusinessChatWithContext:completion:](v7, "openBusinessChatWithContext:completion:", v4, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __73__PKTransactionSupportTopicsViewController__openBusinessChatWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__PKTransactionSupportTopicsViewController__openBusinessChatWithContext___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __73__PKTransactionSupportTopicsViewController__openBusinessChatWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v5 = WeakRetained;
    if (v3)
    {
      v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "presentingViewController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
    }

    WeakRetained = v5;
  }

}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKTransactionSupportTopicsViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PKTransactionSupportTopicsViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __67__PKTransactionSupportTopicsViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id obj;

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 32));
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1296), obj);
    objc_msgSend(*(id *)(a1 + 40), "reloadDataForSection:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1344), 1);
  }

}

- (void)_cancelTapped
{
  -[PKTransactionSupportTopicsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingMapsTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_merchantNameSectionController, 0);
  objc_storeStrong((id *)&self->_transactionSectionController, 0);
  objc_storeStrong((id *)&self->_sectionTopicController, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
