@implementation PKDashboardPassViewController

- (PKDashboardPassViewController)initWithDataSource:(id)a3 presenters:(id)a4 layout:(id)a5
{

  return 0;
}

- (PKDashboardPassViewController)initWithPass:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PKDashboardPassViewController *v10;
  uint64_t v11;
  PKPassGroupView *v12;
  void *v13;
  PKPassGroupView *v14;
  PKDashboardPassViewController *v15;
  PKDashboardPassViewController *v16;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D66DB8]);
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPassLibrary:", v6);

  objc_msgSend(v7, "loadGroupsSynchronously");
  objc_msgSend(v4, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "groupIndexForPassUniqueID:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v11 = v9;
    v12 = [PKPassGroupView alloc];
    objc_msgSend(v7, "groupAtIndex:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKPassGroupView initWithGroup:delegate:presentationState:](v12, "initWithGroup:delegate:presentationState:", v13, 0, 3);

    -[PKPassGroupView presentPassWithUniqueID:](v14, "presentPassWithUniqueID:", v8);
    v15 = -[PKDashboardPassViewController initWithPassGroupView:context:presentingViewController:](self, "initWithPassGroupView:context:presentingViewController:", v14, 0, 0);
    v16 = v15;
    if (v15)
    {
      -[PKDashboardPassViewController setFrontmostPass:](v15, "setFrontmostPass:", v4);
      -[PKDashboardViewController shouldPresentAllContent:animated:](v16, "shouldPresentAllContent:animated:", 1, 0);
    }
    self = v16;

    v10 = self;
  }

  return v10;
}

- (PKDashboardPassViewController)initWithPassGroupView:(id)a3 context:(id)a4 presentingViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PKDashboardPassGroupItemPresenter *v13;
  PKDashboardPassTilesItemPresenter *v14;
  void *v15;
  PKDashboardPassTilesItemPresenter *v16;
  uint64_t v17;
  PKDashboardBarcodePassDataSource *v18;
  PKDashboardPassMessagePresenter *v19;
  int v20;
  PKDashboardAccountModulePresenter *v21;
  PKDashboardPassViewController *v22;
  PKDashboardAuxiliaryPassInformationPresenter *v23;
  PKDashboardPaymentProductsTransitPresenter *v24;
  PKDashboardBalancePresenter *v25;
  PKDashboardBankConnectPresenter *v26;
  void *v27;
  PKDashboardPassTilesItemPresenter *v28;
  PKDashboardPassGroupItemPresenter *v29;
  PKDashboardRewardsBalancePresenter *v30;
  id v31;
  PKDashboardCenteredTextItemPresenter *v32;
  PKDashboardPassFlowLayout *v33;
  PKDashboardPassViewController *v34;
  PKDashboardPassViewController *v35;
  NSObject *v36;
  dispatch_queue_t v37;
  OS_dispatch_queue *queue;
  PKDashboardPaymentTransactionItemPresenter *v39;
  PKDashboardPaymentTransactionItemPresenter *transactionPresenter;
  uint64_t v41;
  PKAccountService *accountService;
  PKDashboardPaymentTransactionItemPresenter *v44;
  PKPayLaterEligibleSpendPresenter *v45;
  PKPayLaterFinancingPlanGroupPresenter *v46;
  PKPayLaterInstallmentPresenter *v47;
  PKPayLaterFinancingPlanPresenter *v48;
  PKPayLaterBalancePresenter *v49;
  PKDashboardTextActionItemPresenter *v50;
  PKCreditBalanceAndPaymentPresenter *v51;
  PKTransactionGroupItemPresenter *v52;
  PKDashboardPaymentProductsTransitPresenter *v53;
  id v54;
  PKDashboardAuxiliaryPassInformationPresenter *v55;
  void *v56;
  PKDashboardPassMessagePresenter *v57;
  id obja;
  PKDashboardAccountModulePresenter *obj;
  id v60;
  PKDashboardPaymentPassDataSource *v61;
  PKDashboardBarcodePassDataSource *v62;
  PKDashboardPassViewController *v63;
  void *v64;
  objc_super v65;
  _QWORD v66[19];
  _QWORD v67[5];

  v67[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "group");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "passAtIndex:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = -[PKDashboardPassGroupItemPresenter initWithPassGroupView:]([PKDashboardPassGroupItemPresenter alloc], "initWithPassGroupView:", v8);
    v14 = [PKDashboardPassTilesItemPresenter alloc];
    objc_msgSend(v8, "frontmostPassView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKDashboardPassTilesItemPresenter initWithPassView:](v14, "initWithPassView:", v15);

    v17 = objc_msgSend(v12, "passType");
    if (v17 == 1)
    {
      v63 = self;
      v60 = a4;
      v44 = -[PKDashboardPaymentTransactionItemPresenter initWithContext:detailViewStyle:avatarViewDelegate:]([PKDashboardPaymentTransactionItemPresenter alloc], "initWithContext:detailViewStyle:avatarViewDelegate:", 0, 0, v10);
      v21 = objc_alloc_init(PKDashboardAccountModulePresenter);
      v61 = -[PKDashboardPaymentPassDataSource initWithGroupView:context:]([PKDashboardPaymentPassDataSource alloc], "initWithGroupView:context:", v8, v9);
      v66[0] = v13;
      v57 = -[PKDashboardPassMessagePresenter initWithPassGroupView:]([PKDashboardPassMessagePresenter alloc], "initWithPassGroupView:", v8);
      v66[1] = v57;
      v66[2] = v16;
      v23 = [PKDashboardAuxiliaryPassInformationPresenter alloc];
      objc_msgSend(v12, "secureElementPass");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[PKDashboardAuxiliaryPassInformationPresenter initWithPass:](v23, "initWithPass:", v56);
      v66[3] = v55;
      v24 = [PKDashboardPaymentProductsTransitPresenter alloc];
      v54 = objc_alloc_init(MEMORY[0x1E0D67100]);
      v53 = -[PKDashboardPaymentProductsTransitPresenter initWithPassGroupView:paymentDataProvider:](v24, "initWithPassGroupView:paymentDataProvider:", v8, v54);
      v66[4] = v53;
      v52 = objc_alloc_init(PKTransactionGroupItemPresenter);
      v66[5] = v52;
      v51 = -[PKCreditBalanceAndPaymentPresenter initWithViewController:]([PKCreditBalanceAndPaymentPresenter alloc], "initWithViewController:", v10);
      v66[6] = v51;
      v50 = objc_alloc_init(PKDashboardTextActionItemPresenter);
      v66[7] = v50;
      v49 = objc_alloc_init(PKPayLaterBalancePresenter);
      v66[8] = v49;
      v48 = objc_alloc_init(PKPayLaterFinancingPlanPresenter);
      v66[9] = v48;
      v47 = objc_alloc_init(PKPayLaterInstallmentPresenter);
      v66[10] = v47;
      v46 = objc_alloc_init(PKPayLaterFinancingPlanGroupPresenter);
      v66[11] = v46;
      obja = v10;
      v45 = objc_alloc_init(PKPayLaterEligibleSpendPresenter);
      v66[12] = v45;
      v25 = objc_alloc_init(PKDashboardBalancePresenter);
      v66[13] = v25;
      v26 = objc_alloc_init(PKDashboardBankConnectPresenter);
      v66[14] = v26;
      v27 = v12;
      v28 = v16;
      v29 = v13;
      v30 = objc_alloc_init(PKDashboardRewardsBalancePresenter);
      v66[15] = v30;
      v66[16] = v44;
      v31 = v9;
      v32 = objc_alloc_init(PKDashboardCenteredTextItemPresenter);
      v66[17] = v32;
      v66[18] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 19);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v31;
      v13 = v29;
      v16 = v28;
      v12 = v27;

      v18 = (PKDashboardBarcodePassDataSource *)v61;
      v19 = (PKDashboardPassMessagePresenter *)v44;

      v10 = obja;
      v20 = 1;
    }
    else
    {
      if (v17)
      {
        v21 = 0;
        v18 = 0;
        v64 = 0;
        v22 = 0;
LABEL_15:

        goto LABEL_16;
      }
      v63 = self;
      v60 = a4;
      v18 = -[PKDashboardBarcodePassDataSource initWithGroupView:context:]([PKDashboardBarcodePassDataSource alloc], "initWithGroupView:context:", v8, v9);
      v67[0] = v13;
      v19 = -[PKDashboardPassMessagePresenter initWithPassGroupView:]([PKDashboardPassMessagePresenter alloc], "initWithPassGroupView:", v8);
      v67[1] = v19;
      v67[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v21 = 0;
    }

    v22 = 0;
    if (v18 && v64)
    {
      obj = v21;
      v33 = objc_alloc_init(PKDashboardPassFlowLayout);
      v65.receiver = v63;
      v65.super_class = (Class)PKDashboardPassViewController;
      v34 = -[PKDashboardViewController initWithDataSource:presenters:layout:](&v65, sel_initWithDataSource_presenters_layout_, v18, v64, v33);
      v35 = v34;
      if (v34)
      {
        v34->_lock._os_unfair_lock_opaque = 0;
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v62 = v18;
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = dispatch_queue_create("com.apple.passkit.dashboard.session", v36);
        queue = v35->_queue;
        v35->_queue = (OS_dispatch_queue *)v37;

        objc_storeStrong((id *)&v35->_passFlowLayout, v33);
        v39 = -[PKDashboardPaymentTransactionItemPresenter initWithContext:detailViewStyle:avatarViewDelegate:]([PKDashboardPaymentTransactionItemPresenter alloc], "initWithContext:detailViewStyle:avatarViewDelegate:", 0, 0, 0);
        transactionPresenter = v35->_transactionPresenter;
        v35->_transactionPresenter = v39;

        objc_storeStrong((id *)&v35->_accountModulePresenter, obj);
        objc_storeStrong((id *)&v35->_context, v60);
        objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
        v41 = objc_claimAutoreleasedReturnValue();
        accountService = v35->_accountService;
        v35->_accountService = (PKAccountService *)v41;

        v18 = v62;
        -[PKAccountService registerObserver:](v35->_accountService, "registerObserver:", v35);
        -[PKDashboardPassTilesItemPresenter setDelegate:](v16, "setDelegate:", v35);
        -[PKDashboardPassViewController _setUpNavigationItemsAnimated:](v35, "_setUpNavigationItemsAnimated:", 0);
        if (v20)
          -[PKDashboardBarcodePassDataSource setCustomDelegate:](v62, "setCustomDelegate:", v35);
      }
      self = v35;

      v22 = self;
      v21 = obj;
    }
    else
    {
      self = v63;
    }
    goto LABEL_15;
  }
  v22 = 0;
LABEL_16:

  return v22;
}

- (void)_setUpNavigationItemsAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  PKDashboardMoreMenuFactory *v7;
  PKDashboardMoreMenuFactory *moreMenuFactory;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PKDashboardViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frontmostPassView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pass");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_moreMenuFactory)
  {
    v7 = objc_alloc_init(PKDashboardMoreMenuFactory);
    moreMenuFactory = self->_moreMenuFactory;
    self->_moreMenuFactory = v7;

    -[PKDashboardMoreMenuFactory setDelegate:](self->_moreMenuFactory, "setDelegate:", self);
    -[PKDashboardPassViewController configureMoreMenuFactoryWithPass:](self, "configureMoreMenuFactoryWithPass:", v13);
  }
  -[PKDashboardPassViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackButtonDisplayMode:", 2);
  objc_msgSend(v13, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackButtonTitle:", v10);

  objc_msgSend(v9, "setLargeTitleDisplayMode:", 2);
  if (objc_msgSend(v13, "passType") == 1 && objc_msgSend(v13, "associatedAccountFeatureIdentifier") == 2)
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[PKDashboardPassViewController _updateNavigationItemsWithAccount:](self, "_updateNavigationItemsWithAccount:", v12);
  -[PKDashboardPassViewController _afterDataSourceContentLoadedUpdateNavigationItemsForPass:](self, "_afterDataSourceContentLoadedUpdateNavigationItemsForPass:", v13);

}

- (id)navigationDashboardPassVC
{
  void *v2;
  id v3;

  -[PKDashboardPassViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)_updateNavigationItemsWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  PKDashboardMoreMenuFactory *moreMenuFactory;
  id v16;
  void *v17;
  PKDashboardMoreMenuFactory *v18;
  void *v19;
  PKDashboardMoreMenuFactory *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  NSArray *v41;
  NSArray *navBarButtonTypes;
  id v43;
  NSArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKDashboardViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frontmostPassView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "hasAssociatedPeerPaymentAccount"))
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "peerPaymentService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
  if (v13 != 1)
  {
LABEL_3:
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PKDashboardPassViewController configureMoreMenuFactoryWithPass:](self, "configureMoreMenuFactoryWithPass:", v8);
    -[PKDashboardMoreMenuFactory setAccount:](self->_moreMenuFactory, "setAccount:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      moreMenuFactory = self->_moreMenuFactory;
      v16 = v5;
      objc_msgSend(v16, "familyCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardMoreMenuFactory setFamilyCollection:](moreMenuFactory, "setFamilyCollection:", v17);

      v18 = self->_moreMenuFactory;
      objc_msgSend(v16, "peerPaymentAccount");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardMoreMenuFactory setPeerPaymentAccount:](v18, "setPeerPaymentAccount:", v19);

      -[PKDashboardMoreMenuFactory setHomeKitHasHomeGuestAccessSchedule:](self->_moreMenuFactory, "setHomeKitHasHomeGuestAccessSchedule:", objc_msgSend(v16, "homeKitHasHomeGuestAccessSchedule"));
      v20 = self->_moreMenuFactory;
      objc_msgSend(v16, "homeKitHomeIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKDashboardMoreMenuFactory setHomeKitHomeIdentifier:](v20, "setHomeKitHomeIdentifier:", v21);
    }
    v58 = v5;
    -[PKDashboardMoreMenuFactory moreMenu](self->_moreMenuFactory, "moreMenu");
    v22 = &unk_1E3FACCD0;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v57 && !-[PKDashboardMoreMenuFactory forceShowMoreMenuIcon](self->_moreMenuFactory, "forceShowMoreMenuIcon"))
      v22 = &unk_1E3FACCE8;
    objc_msgSend(v14, "addObject:", v22);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v59 = v8;
    -[PKDashboardPassViewController _shareNavigationBarButtonTypesForPass:](self, "_shareNavigationBarButtonTypesForPass:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v73 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v14, "addObject:", &unk_1E3FACD00);
          objc_msgSend(v14, "addObject:", v28);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
      }
      while (v25);
    }

    if (objc_msgSend(v9, "isAppleCardPass"))
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      -[PKDashboardPassViewController _navigationBarButtonTypesForAppleCardPass:account:](self, "_navigationBarButtonTypesForAppleCardPass:account:", v9, v4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v69 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
            objc_msgSend(v14, "addObject:", &unk_1E3FACD00);
            objc_msgSend(v14, "addObject:", v34);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
        }
        while (v31);
      }

    }
    if (objc_msgSend(v9, "isPeerPaymentPass"))
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      -[PKDashboardPassViewController _navigationBarButtonTypesForPeerPaymentPass:](self, "_navigationBarButtonTypesForPeerPaymentPass:", v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v65;
        do
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v65 != v38)
              objc_enumerationMutation(v35);
            v40 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k);
            objc_msgSend(v14, "addObject:", &unk_1E3FACD00);
            objc_msgSend(v14, "addObject:", v40);
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
        }
        while (v37);
      }

    }
    if ((PKEqualObjects() & 1) == 0)
    {
      v41 = (NSArray *)objc_msgSend(v14, "copy");
      navBarButtonTypes = self->_navBarButtonTypes;
      self->_navBarButtonTypes = v41;

      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v44 = self->_navBarButtonTypes;
      v45 = -[NSArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v61;
        do
        {
          for (m = 0; m != v46; ++m)
          {
            if (*(_QWORD *)v61 != v47)
              objc_enumerationMutation(v44);
            -[PKDashboardPassViewController _navigationBarButtonForType:account:](self, "_navigationBarButtonForType:account:", objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * m), "integerValue"), v4);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "safelyAddObject:", v49);

          }
          v46 = -[NSArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
        }
        while (v46);
      }

      PKLogFacilityTypeGetObject();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = objc_msgSend(v43, "count");
        objc_msgSend(v59, "uniqueID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accountIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v77 = v51;
        v78 = 2112;
        v79 = v52;
        v80 = 2112;
        v81 = v53;
        _os_log_impl(&dword_19D178000, v50, OS_LOG_TYPE_DEFAULT, "Number of navigation items %ld for pass uniqueID %@, accountID %@", buf, 0x20u);

      }
      -[PKDashboardPassViewController navigationItem](self, "navigationItem");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setRightBarButtonItems:animated:", v43, self->_activeInterstitialController == 0);

      if (self->_activeInterstitialController)
      {
        -[PKDashboardPassViewController navigationController](self, "navigationController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "navigationBar");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "layoutIfNeeded");

        -[PKPGSVTransitionInterstitialController setNeedsUpdateForProvider:](self->_activeInterstitialController, "setNeedsUpdateForProvider:", self);
      }

    }
    -[PKDashboardPassViewController reloadMoreMenuItemsWithMenu:](self, "reloadMoreMenuItemsWithMenu:", v57);

    v5 = v58;
    v8 = v59;
  }

}

- (void)_displayAccountErrorIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  if (self->_visibility == 2)
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frontmostPassView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "passType") == 1)
    {
      v7 = v3;
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __64__PKDashboardPassViewController__displayAccountErrorIfNecessary__block_invoke;
      v9[3] = &unk_1E3E61B68;
      objc_copyWeak(&v11, &location);
      v8 = v7;
      v10 = v8;
      objc_msgSend(v8, "executeAfterContentIsLoaded:", v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);

    }
  }
}

void __64__PKDashboardPassViewController__displayAccountErrorIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKPayLaterHandleFrontOfPassAlertsWithAccount(v2, v3);

  }
}

- (void)dealloc
{
  unsigned __int8 v3;
  void *v4;
  objc_super v5;

  v3 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v3 & 1) == 0)
    -[PKDashboardPassViewController invalidate](self, "invalidate");
  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PKDashboardPassViewController;
  -[PKDashboardViewController dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  BOOL *p_invalidated;
  NSMutableArray *v5;
  NSMutableArray *sessionHandles;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BKPresenceDetectOperation *fingerDetectionOperation;
  BKPresenceDetectOperation *v13;
  NSObject *fingerTimer;
  OS_dispatch_source *v15;
  NFDCKAssertion *dckAssertion;
  NFDCKAssertion *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_invalidated = &self->_invalidated;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_invalidated))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_invalidated));
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_sessionHandles;
  sessionHandles = self->_sessionHandles;
  self->_sessionHandles = 0;

  os_unfair_lock_unlock(&self->_lock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11++), "invalidateSession", (_QWORD)v18);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  fingerDetectionOperation = self->_fingerDetectionOperation;
  if (fingerDetectionOperation)
  {
    -[BKPresenceDetectOperation setDelegate:](fingerDetectionOperation, "setDelegate:", 0);
    -[BKPresenceDetectOperation cancel](self->_fingerDetectionOperation, "cancel");
    v13 = self->_fingerDetectionOperation;
    self->_fingerDetectionOperation = 0;

  }
  fingerTimer = self->_fingerTimer;
  if (fingerTimer)
  {
    dispatch_source_cancel(fingerTimer);
    v15 = self->_fingerTimer;
    self->_fingerTimer = 0;

  }
  dckAssertion = self->_dckAssertion;
  if (dckAssertion)
  {
    -[NFDCKAssertion invalidate](dckAssertion, "invalidate");
    v17 = self->_dckAssertion;
    self->_dckAssertion = 0;

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  $77BFE790A1370D46B4241309C9753022 *p_foregroundActiveState;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDashboardPassViewController;
  -[PKDashboardPassViewController loadView](&v8, sel_loadView);
  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  p_foregroundActiveState = &self->_foregroundActiveState;
  if (v3)
    *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)objc_msgSend(v3, "registerObserver:", self);
  else
    *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)257;
  if (self->_footerVisible)
    -[PKDashboardPassViewController _createFooter](self, "_createFooter");
  -[PKDashboardPassViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDashboardViewController backgroundColor](PKDashboardPassViewController, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (id)bigInfoButton
{
  void *v3;
  void *v4;

  PKUIBigInfoButtonImageWithDefaultConfiguration();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassViewController _dashboardInfoButtonWithImage:](self, "_dashboardInfoButtonWithImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)moreInfoButton
{
  void *v3;
  void *v4;

  PKUIInfoButtonImageWithDefaultConfiguration();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassViewController _dashboardInfoButtonWithImage:](self, "_dashboardInfoButtonWithImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_dashboardInfoButtonWithImage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0DC3520];
  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKHittableDashboardButton buttonWithConfiguration:primaryAction:](PKHittableDashboardButton, "buttonWithConfiguration:primaryAction:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfigurationUpdateHandler:", &__block_literal_global_33);
  objc_msgSend(v8, "setShowsLargeContentViewer:", 1);
  PKLocalizedString(CFSTR("MORE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLargeContentTitle:", v9);

  objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D70]);
  objc_msgSend(v8, "setLargeContentImage:", v4);

  return v8;
}

uint64_t __63__PKDashboardPassViewController__dashboardInfoButtonWithImage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (void)infoTapped:(id)a3
{
  id v3;

  -[PKDashboardPassViewController navigationDashboardPassVC](self, "navigationDashboardPassVC", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentPassDetailsAnimated:action:", 1, 0);

}

- (void)moreMenuTriggered:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  PKDashboardMoreMenuFactory *moreMenuFactory;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[PKDashboardViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    moreMenuFactory = self->_moreMenuFactory;
    objc_msgSend(v6, "bankConnectLinkedAccountData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardMoreMenuFactory setBankConnectAccount:](moreMenuFactory, "setBankConnectAccount:", v9);

  }
  -[PKDashboardPassViewController menuFactoryDidUpdateMenu:](self, "menuFactoryDidUpdateMenu:", self->_moreMenuFactory);
  -[PKDashboardPassViewController navigationDashboardPassVC](self, "navigationDashboardPassVC");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D68858];
  v14[0] = *MEMORY[0x1E0D68AA0];
  v14[1] = v11;
  v12 = *MEMORY[0x1E0D68748];
  v15[0] = *MEMORY[0x1E0D68B18];
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportEventForPassIfNecessary:", v13);

}

- (id)searchButton
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
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("magnifyingglass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3520];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0DC3428];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __45__PKDashboardPassViewController_searchButton__block_invoke;
  v16 = &unk_1E3E62BD0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v8, "actionWithHandler:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKHittableDashboardButton buttonWithConfiguration:primaryAction:](PKHittableDashboardButton, "buttonWithConfiguration:primaryAction:", v7, v9, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfigurationUpdateHandler:", &__block_literal_global_93);
  PKLocalizedPaymentString(CFSTR("DASHBOARD_SEARCH_ACCESSIBILITY_LABEL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v11);
  objc_msgSend(v10, "setShowsLargeContentViewer:", 1);
  objc_msgSend(v10, "setLargeContentTitle:", v11);
  objc_msgSend(v10, "setLargeContentImage:", v3);
  objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FD8]);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v10;
}

void __45__PKDashboardPassViewController_searchButton__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationDashboardPassVC");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentSearch");

}

uint64_t __45__PKDashboardPassViewController_searchButton__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (id)presentCardNumbersButtonForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("creditcard.and.123"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3520];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x1E0DC3428];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __68__PKDashboardPassViewController_presentCardNumbersButtonForAccount___block_invoke;
  v18 = &unk_1E3E62BD0;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v10, "actionWithHandler:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKHittableDashboardButton buttonWithConfiguration:primaryAction:](PKHittableDashboardButton, "buttonWithConfiguration:primaryAction:", v9, v11, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConfigurationUpdateHandler:", &__block_literal_global_98);
  objc_msgSend(v4, "feature");
  PKLocalizedFeatureString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v13);
  objc_msgSend(v12, "setAccessibilityIdentifier:", *MEMORY[0x1E0D679E8]);
  objc_msgSend(v12, "setShowsLargeContentViewer:", 1);
  objc_msgSend(v12, "setLargeContentTitle:", v13);
  objc_msgSend(v12, "setLargeContentImage:", v5);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v12;
}

void __68__PKDashboardPassViewController_presentCardNumbersButtonForAccount___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "navigationDashboardPassVC");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentCardNumbers");
    v4 = *MEMORY[0x1E0D68B18];
    v5 = *MEMORY[0x1E0D68858];
    v8[0] = *MEMORY[0x1E0D68AA0];
    v8[1] = v5;
    v6 = *MEMORY[0x1E0D68908];
    v9[0] = v4;
    v9[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportEventForPassIfNecessary:", v7);

  }
}

uint64_t __68__PKDashboardPassViewController_presentCardNumbersButtonForAccount___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (double)_navBarButtonSpaceWidth
{
  unint64_t v2;
  double result;

  v2 = PKUIGetMinScreenType();
  result = 24.0;
  if (v2 < 3)
    return 8.0;
  return result;
}

- (id)doneButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  PKLocalizedString(CFSTR("DONE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0DC3520], "pkui_createPlainMinimalButtonConfiguration");
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBaseForegroundColor:", v5);

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0DC3518];
  v7 = (void *)MEMORY[0x1E0DC3428];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __43__PKDashboardPassViewController_doneButton__block_invoke;
  v14 = &unk_1E3E62BD0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v7, "actionWithHandler:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonWithConfiguration:primaryAction:", v4, v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setRole:", 1);
  objc_msgSend(v9, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
  objc_msgSend(v9, "sizeToFit");
  objc_msgSend(v9, "setShowsLargeContentViewer:", 1);
  objc_msgSend(v9, "setLargeContentTitle:", v3);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

void __43__PKDashboardPassViewController_doneButton__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)configureMoreMenuFactoryWithPass:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKDashboardPassViewController navigationDashboardPassVC](self, "navigationDashboardPassVC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PKDashboardMoreMenuFactory setNavigationDashboardPassVC:](self->_moreMenuFactory, "setNavigationDashboardPassVC:", v4);
  -[PKDashboardMoreMenuFactory setPass:](self->_moreMenuFactory, "setPass:", v5);

}

- (void)reloadMoreMenuItemsWithMenu:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char **v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[PKDashboardPassViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v9)
    {
      objc_msgSend(v6, "setMenu:");
      objc_msgSend(v6, "setShowsMenuAsPrimaryAction:", 1);
      v7 = &selRef_moreMenuTriggered_;
      v8 = 0x4000;
    }
    else
    {
      v7 = &selRef_infoTapped_;
      v8 = 0x2000;
    }
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, *v7, v8);
  }

}

- (id)_navigationBarButtonForType:(unint64_t)a3 account:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKPGSVTransitionInterstitialAlignmentView *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  switch(a3)
  {
    case 1uLL:
      -[PKDashboardPassViewController bigInfoButton](self, "bigInfoButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v7);
      goto LABEL_11;
    case 2uLL:
      -[PKDashboardPassViewController moreInfoButton](self, "moreInfoButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v7);
      goto LABEL_11;
    case 3uLL:
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
      -[PKDashboardPassViewController _navBarButtonSpaceWidth](self, "_navBarButtonSpaceWidth");
      objc_msgSend(v9, "setWidth:");
      break;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0DC3520];
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v7, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0DC3428];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke;
      v27[3] = &unk_1E3E62BD0;
      v15 = &v28;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v14, "actionWithHandler:", v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKHittableDashboardButton buttonWithConfiguration:primaryAction:](PKHittableDashboardButton, "buttonWithConfiguration:primaryAction:", v13, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setConfigurationUpdateHandler:", &__block_literal_global_111);
      PKLocalizedPaymentString(CFSTR("DASHBOARD_SHARE_ACCESSIBILITY_LABEL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAccessibilityLabel:", v18);
      objc_msgSend(v17, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68048]);
      objc_msgSend(v17, "setShowsLargeContentViewer:", 1);
      objc_msgSend(v17, "setLargeContentTitle:", v18);
      objc_msgSend(v17, "setLargeContentImage:", v7);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v17);
      goto LABEL_6;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle.badge.checkmark"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0DC3520];
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v7, v20, v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0DC3428];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke_3;
      v25[3] = &unk_1E3E62BD0;
      v15 = &v26;
      objc_copyWeak(&v26, &location);
      objc_msgSend(v22, "actionWithHandler:", v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKHittableDashboardButton buttonWithConfiguration:primaryAction:](PKHittableDashboardButton, "buttonWithConfiguration:primaryAction:", v13, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setConfigurationUpdateHandler:", &__block_literal_global_116);
      PKLocalizedPaymentString(CFSTR("DASHBOARD_VIEW_SHARES_ACCESSIBILITY_LABEL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAccessibilityLabel:", v18);
      objc_msgSend(v17, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E80]);
      objc_msgSend(v17, "setShowsLargeContentViewer:", 1);
      objc_msgSend(v17, "setLargeContentTitle:", v18);
      objc_msgSend(v17, "setLargeContentImage:", v7);
      objc_msgSend(v17, "sizeToFit");
      objc_msgSend(v17, "layoutIfNeeded");
      v23 = -[PKPGSVTransitionInterstitialAlignmentView initWithView:alignmentRectInsetsAdjustmentProvider:]([PKPGSVTransitionInterstitialAlignmentView alloc], "initWithView:alignmentRectInsetsAdjustmentProvider:", v17, &__block_literal_global_121);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v23);

LABEL_6:
      objc_destroyWeak(v15);

      goto LABEL_12;
    case 6uLL:
      -[PKDashboardPassViewController searchButton](self, "searchButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v7);
      goto LABEL_11;
    case 7uLL:
      -[PKDashboardPassViewController presentCardNumbersButtonForAccount:](self, "presentCardNumbersButtonForAccount:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v7);
LABEL_11:
      v9 = (void *)v8;
LABEL_12:

      break;
    default:
      v9 = 0;
      break;
  }
  objc_destroyWeak(&location);

  return v9;
}

void __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationDashboardPassVC");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentShareFlow");

}

uint64_t __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

void __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "presentSharesList");

}

uint64_t __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

double __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = a2;
  objc_msgSend(v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "bounds");
    v5 = v4;
    objc_msgSend(v3, "bounds");
    objc_msgSend(v2, "convertRect:fromView:", v3);
    if (v6 >= v5)
      v7 = 0.0;
    else
      v7 = v6 - v5;
  }
  else
  {
    v7 = *MEMORY[0x1E0DC49E8];
  }

  return v7;
}

- (id)_shareNavigationBarButtonTypesForPass:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int16 v12;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_alloc_init(MEMORY[0x1E0D67100]);
    if (objc_msgSend(v3, "passType") == 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = v3;
      objc_msgSend(v6, "devicePrimaryPaymentApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "state");

      if (v8 == 7)
      {

        goto LABEL_17;
      }
      v12 = 0;
      objc_msgSend(v6, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sharingCapabilitiesForPassIdentifier:outHasShares:outHasShareableEntitlements:", v10, (char *)&v12 + 1, &v12);

      if (objc_msgSend(v6, "supportsFeatureForCurrentDevice:", 1) && (_BYTE)v12)
        objc_msgSend(v4, "addObject:", &unk_1E3FACD18);
      if (HIBYTE(v12))
        objc_msgSend(v4, "addObject:", &unk_1E3FACD30);

    }
    else if (PKBarcodePassSharingEnabled())
    {
      objc_msgSend(v4, "addObject:", &unk_1E3FACD18);
    }
    if (objc_msgSend(v4, "count"))
    {
      v9 = (void *)objc_msgSend(v4, "copy");
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  v9 = 0;
LABEL_19:

  return v9;
}

- (id)_navigationBarButtonTypesForAppleCardPass:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "isAppleCardPass"))
  {
    v14 = 0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedAccountServiceAccountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v9;
  v12 = v11;
  if (v10 == v11)
  {

  }
  else
  {
    if (!v10 || !v11)
    {

      v13 = 0;
      goto LABEL_11;
    }
    v13 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v13)
      goto LABEL_11;
  }
  v13 = +[PKCreditAccountController shouldShowCardNumbersWithAccount:andPass:](PKCreditAccountController, "shouldShowCardNumbersWithAccount:andPass:", v6, v5);
LABEL_11:

  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "supportsSearchForPassUniqueID:", v16);

  if (v13)
    objc_msgSend(v7, "addObject:", &unk_1E3FACD48);
  if (v17)
    objc_msgSend(v7, "addObject:", &unk_1E3FACD60);
  if (objc_msgSend(v7, "count"))
    v14 = (void *)objc_msgSend(v7, "copy");
  else
    v14 = 0;

LABEL_19:
  return v14;
}

- (id)_navigationBarButtonTypesForPeerPaymentPass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "isPeerPaymentPass"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "supportsSearchForPassUniqueID:", v6);

    if (v7)
      objc_msgSend(v4, "addObject:", &unk_1E3FACD60);
    if (objc_msgSend(v4, "count"))
      v8 = (void *)objc_msgSend(v4, "copy");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDashboardPassViewController;
  -[PKDashboardPassViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  self->_visibility = 1;
  -[PKDashboardPassViewController _visibilityDidChange](self, "_visibilityDidChange");
  objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForPolicy:", 0);
  -[PKDashboardPassViewController navigationDashboardPassVC](self, "navigationDashboardPassVC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PKDashboardMoreMenuFactory setNavigationDashboardPassVC:](self->_moreMenuFactory, "setNavigationDashboardPassVC:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPassViewController;
  -[PKDashboardPassViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  self->_visibility = 2;
  -[PKDashboardPassViewController _visibilityDidChange](self, "_visibilityDidChange");
  -[PKDashboardPassViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

  v10 = *MEMORY[0x1E0D68AA0];
  v11[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassViewController reportEventForPassIfNecessary:](self, "reportEventForPassIfNecessary:", v5);

  -[PKDashboardPassViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setActivityItemsConfigurationSource:", self->_shareablePassProvider);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDashboardPassViewController;
  -[PKDashboardPassViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_visibility = 3;
  -[PKDashboardPassViewController _visibilityDidChange](self, "_visibilityDidChange");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;
  uint64_t v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0D68AA0];
  v8[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassViewController reportEventForPassIfNecessary:](self, "reportEventForPassIfNecessary:", v5);

  v6.receiver = self;
  v6.super_class = (Class)PKDashboardPassViewController;
  -[PKDashboardPassViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  self->_visibility = 0;
  -[PKDashboardPassViewController _visibilityDidChange](self, "_visibilityDidChange");
}

- (void)reportEventForPassIfNecessary:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKPass *frontmostPass;
  void *v16;
  id v17;

  v17 = a3;
  -[PKPass secureElementPass](self->_frontmostPass, "secureElementPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isIdentityPass");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D66A58], "subjectToReportDashboardAnalyticsForPass:", self->_frontmostPass);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (self->_frontmostPass && v6 != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
        objc_msgSend(v8, "setValue:forKey:", *MEMORY[0x1E0D69030], *MEMORY[0x1E0D68F50]);
        objc_msgSend(MEMORY[0x1E0D66A58], "updateIdentityEventToReportDashboardAnalytics:forPass:", v8, self->_frontmostPass);
        v9 = (void *)MEMORY[0x1E0D66A58];
        v10 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(v9, "subject:sendEvent:", v6, v10);

      }
    }

  }
  if (-[PKPass passType](self->_frontmostPass, "passType") == PKPassTypeSecureElement)
  {
    objc_msgSend(MEMORY[0x1E0D66A58], "subjectToReportDashboardAnalyticsForPass:", self->_frontmostPass);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && v11)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
      objc_msgSend(v12, "setObject:forKey:", *MEMORY[0x1E0D68FA8], *MEMORY[0x1E0D68F50]);
      objc_msgSend(v12, "setObject:forKey:", *MEMORY[0x1E0D69108], *MEMORY[0x1E0D69028]);
      v13 = (void *)MEMORY[0x1E0D66A58];
      v14 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v13, "subject:sendEvent:", v11, v14);

    }
  }
  frontmostPass = self->_frontmostPass;
  if (frontmostPass && -[PKPass passType](frontmostPass, "passType") == PKPassTypeSecureElement)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKSetLastViewedFrontOfCardDate();

  }
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDashboardPassViewController;
  -[PKDashboardPassViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
  -[PKDashboardPassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  UIButton *passcodeButton;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKDashboardPassViewController;
  v4 = a3;
  -[PKDashboardViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[PKDashboardPassViewController traitCollection](self, "traitCollection", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

  if (v6)
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[PKDashboardViewController dataSource](self, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadMessages");
      objc_msgSend(v9, "reloadSecondaryMessages");

    }
  }
  if (self->_footerVisible)
  {
    passcodeButton = self->_passcodeButton;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E0DC48D8], 18.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton pkui_updateConfigurationWithFont:](passcodeButton, "pkui_updateConfigurationWithFont:", v11);

    -[PKDashboardPassViewController _updateDefaultPasscodeButtonSize](self, "_updateDefaultPasscodeButtonSize");
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double v16;
  double v17;
  double y;
  double width;
  UIButton *passcodeButton;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v29;
  double v30;
  CGRect remainder;
  CGRect slice;
  objc_super v33;
  CGRect v34;

  v33.receiver = self;
  v33.super_class = (Class)PKDashboardPassViewController;
  -[PKDashboardPassViewController viewWillLayoutSubviews](&v33, sel_viewWillLayoutSubviews);
  -[PKDashboardPassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  objc_msgSend(v3, "bounds");
  x = v6;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v11 = *MEMORY[0x1E0DC49E8];
  v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v14 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (self->_footerBackground)
  {
    height = self->_defaultPasscodeButtonSize.height;
    v29 = fmin(self->_defaultPasscodeButtonSize.width, v8 + -24.0);
    v30 = *MEMORY[0x1E0DC49E8];
    remainder.origin.x = v6;
    remainder.origin.y = v7;
    remainder.size.width = v8;
    remainder.size.height = v9;
    v16 = height + 12.0 + 12.0;
    v17 = v5 + v16;
    if (self->_footerVisible)
    {
      CGRectDivide(*(CGRect *)&v6, &slice, &remainder, v5 + v16, CGRectMaxYEdge);
      x = slice.origin.x;
      y = slice.origin.y;
      width = slice.size.width;
      v17 = slice.size.height;
    }
    else
    {
      y = CGRectGetMaxY(*(CGRect *)&v6);
      width = remainder.size.width;
      slice.origin.x = x;
      slice.origin.y = y;
      slice.size.width = remainder.size.width;
      slice.size.height = v5 + v16;
    }
    -[_PKVisibilityBackdropView setFrame:](self->_footerBackground, "setFrame:", x, y, width, v17, *(_QWORD *)&v29);
    -[_PKVisibilityBackdropView layoutIfNeeded](self->_footerBackground, "layoutIfNeeded");
    if (self->_footerVisible)
      v14 = height + 12.0 + 12.0;
    -[_PKVisibilityBackdropView bounds](self->_footerBackground, "bounds");
    remainder = v34;
    CGRectDivide(v34, &remainder, &slice, v5, CGRectMaxYEdge);
    slice.origin.x = slice.origin.x + 12.0;
    slice.origin.y = slice.origin.y + 12.0;
    slice.size.width = slice.size.width + -24.0;
    slice.size.height = slice.size.height + -24.0;
    passcodeButton = self->_passcodeButton;
    PKSizeAlignedInRect();
    -[UIButton setFrame:](passcodeButton, "setFrame:");
    v11 = v30;
  }
  -[PKDashboardPassViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contentInset");
  if (v12 != v25 || v11 != v22 || v13 != v24 || v14 != v23)
    objc_msgSend(v21, "setContentInset:", v11, v12, v14, v13);

}

- (void)setFrontmostPass:(id)a3
{
  PKPass *v5;
  id *p_frontmostPass;
  id v7;
  void *v8;
  PKBarcodePassBoopProvider *v9;
  PKAirDropBoopPassProvider *shareablePassProvider;
  PKPass *v11;

  v5 = (PKPass *)a3;
  p_frontmostPass = (id *)&self->_frontmostPass;
  if (self->_frontmostPass != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_frontmostPass, a3);
    if (*p_frontmostPass && objc_msgSend(*p_frontmostPass, "passType") == 1)
      v7 = *p_frontmostPass;
    else
      v7 = 0;
    objc_storeStrong((id *)&self->_frontmostPaymentPass, v7);
    -[PKDashboardPassViewController _updateDigitalCarKeyAssertion](self, "_updateDigitalCarKeyAssertion");
    -[PKDashboardPassViewController _updateFingerDetection](self, "_updateFingerDetection");
    -[PKDashboardPassViewController _updateFooterAnimated:](self, "_updateFooterAnimated:", PKViewVisibilityStateIsVisible());
    -[PKDashboardPassViewController configureMoreMenuFactoryWithPass:](self, "configureMoreMenuFactoryWithPass:", *p_frontmostPass);
    -[PKDashboardMoreMenuFactory moreMenu](self->_moreMenuFactory, "moreMenu");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassViewController reloadMoreMenuItemsWithMenu:](self, "reloadMoreMenuItemsWithMenu:", v8);
    -[PKDashboardPassViewController _afterDataSourceContentLoadedUpdateNavigationItemsForPass:](self, "_afterDataSourceContentLoadedUpdateNavigationItemsForPass:", *p_frontmostPass);
    -[PKDashboardPassViewController _afterDataSourceContentLoadedUpdateFooterForPass:](self, "_afterDataSourceContentLoadedUpdateFooterForPass:", *p_frontmostPass);
    if (v11)
    {
      if (!self->_shareablePassProvider && !objc_msgSend(*p_frontmostPass, "passType"))
      {
        v9 = objc_alloc_init(PKBarcodePassBoopProvider);
        shareablePassProvider = self->_shareablePassProvider;
        self->_shareablePassProvider = (PKAirDropBoopPassProvider *)v9;

      }
      -[PKDashboardPassViewController _updateShareablePassConfiguration](self, "_updateShareablePassConfiguration");
    }

    v5 = v11;
  }

}

- (void)_updateShareablePassConfiguration
{
  void *v3;
  void *v4;
  PKAirDropBoopPassProvider *shareablePassProvider;
  void *v6;
  id v7;

  -[PKDashboardViewController dataSource](self, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frontmostPassView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  shareablePassProvider = self->_shareablePassProvider;
  objc_msgSend(v4, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAirDropBoopPassProvider setPass:passView:](shareablePassProvider, "setPass:passView:", v6, v4);

}

- (void)_afterDataSourceContentLoadedUpdateNavigationItemsForPass:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id from;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "passType") == 1)
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_initWeak(&from, v5);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__PKDashboardPassViewController__afterDataSourceContentLoadedUpdateNavigationItemsForPass___block_invoke;
    v6[3] = &unk_1E3E648C0;
    objc_copyWeak(&v8, &location);
    objc_copyWeak(&v9, &from);
    v7 = v4;
    objc_msgSend(v5, "executeAfterContentIsLoaded:", v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __91__PKDashboardPassViewController__afterDataSourceContentLoadedUpdateNavigationItemsForPass___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v2 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && v2)
  {
    objc_msgSend(v2, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = WeakRetained;
      v5 = v3;
    }
    else
    {
      objc_msgSend(v2, "peerPaymentAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6 && !objc_msgSend(a1[4], "isHomeKeyPass"))
        goto LABEL_9;
      v4 = WeakRetained;
      v5 = 0;
    }
    objc_msgSend(v4, "_updateNavigationItemsWithAccount:", v5);
LABEL_9:

  }
}

- (void)_afterDataSourceContentLoadedUpdateFooterForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id from;
  id location;

  v4 = a3;
  if (v4)
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[PKDashboardViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, v6);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__PKDashboardPassViewController__afterDataSourceContentLoadedUpdateFooterForPass___block_invoke;
    v7[3] = &unk_1E3E648C0;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    v8 = v4;
    objc_msgSend(v5, "executeAfterContentIsLoaded:", v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __82__PKDashboardPassViewController__afterDataSourceContentLoadedUpdateFooterForPass___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v2)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "dashboardContentForPassLoaded:", *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)isInvalidated
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)_visibilityDidChange
{
  id v3;

  -[PKDashboardPassViewController _updateFingerDetection](self, "_updateFingerDetection");
  -[PKDashboardPassViewController _updateDigitalCarKeyAssertion](self, "_updateDigitalCarKeyAssertion");
  -[PKDashboardPassViewController _updateFooterAnimated:](self, "_updateFooterAnimated:", 1);
  -[PKDashboardPassViewController _displayAccountErrorIfNecessary](self, "_displayAccountErrorIfNecessary");
  -[PKDashboardViewController dataSource](self, "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "visibilityDidChangeToState:", self->_visibility);

}

- (void)_updateDigitalCarKeyAssertion
{
  NFDCKAssertion *v3;
  NFDCKAssertion *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NFDCKAssertion *v12;
  id v13;
  NFDCKAssertion *dckAssertion;
  NSObject *v15;
  uint8_t v16[8];
  id v17;

  if (-[PKPaymentPass isCarKeyPass](self->_frontmostPaymentPass, "isCarKeyPass")
    && PKViewVisibilityStateIsVisible()
    && -[PKDashboardPassViewController _isForegroundActive](self, "_isForegroundActive")
    && !self->_dckAssertion)
  {
    -[PKPaymentPass secureElementPass](self->_frontmostPaymentPass, "secureElementPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "paymentApplications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subcredentials");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)PKGetClassNFDigitalCarKeySession();
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v10, "requestAssertionForKeyID:options:outError:", v11, 0, &v17);
    v12 = (NFDCKAssertion *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    dckAssertion = self->_dckAssertion;
    self->_dckAssertion = v12;

    if (!self->_dckAssertion && v13)
    {
      PKLogFacilityTypeGetObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Failed to acquire DCK key assertion", v16, 2u);
      }

    }
  }
  else
  {
    v3 = self->_dckAssertion;
    if (v3)
    {
      -[NFDCKAssertion invalidate](v3, "invalidate");
      v4 = self->_dckAssertion;
      self->_dckAssertion = 0;

    }
  }
}

- (void)_updateFingerDetection
{
  unsigned __int8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BKPresenceDetectOperation *v12;
  BKPresenceDetectOperation *fingerDetectionOperation;
  BKPresenceDetectOperation *v14;
  NSObject *fingerTimer;
  OS_dispatch_source *v16;
  BKPresenceDetectOperation *v17;
  BKPresenceDetectOperation *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((PKPearlIsAvailable() & 1) != 0
    || (PKUserIntentIsAvailable() & 1) != 0
    || (v3 = atomic_load((unsigned __int8 *)&self->_invalidated), (v3 & 1) != 0)
    || !PKViewVisibilityStateIsVisible()
    || !-[PKDashboardPassViewController _isForegroundActive](self, "_isForegroundActive")
    || !self->_frontmostPaymentPass)
  {
    fingerDetectionOperation = self->_fingerDetectionOperation;
    if (fingerDetectionOperation)
    {
      -[BKPresenceDetectOperation setDelegate:](fingerDetectionOperation, "setDelegate:", 0);
      -[BKPresenceDetectOperation cancel](self->_fingerDetectionOperation, "cancel");
      v14 = self->_fingerDetectionOperation;
      self->_fingerDetectionOperation = 0;

    }
    fingerTimer = self->_fingerTimer;
    if (fingerTimer)
    {
      dispatch_source_cancel(fingerTimer);
      v16 = self->_fingerTimer;
      self->_fingerTimer = 0;

    }
  }
  else if (!self->_fingerDetectionOperation)
  {
    -[objc_class availableDevices](_MergedGlobals_7(), "availableDevices");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
LABEL_10:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        if (objc_msgSend(v9, "type", (_QWORD)v19) == 1)
        {
          objc_msgSend((Class)off_1EE4BFD20(), "deviceWithDescriptor:error:", v9, 0);
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
            break;
        }
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v6)
            goto LABEL_10;
          goto LABEL_17;
        }
      }
      v11 = (void *)v10;

      objc_msgSend(v11, "createPresenceDetectOperationWithError:", 0);
      v17 = (BKPresenceDetectOperation *)objc_claimAutoreleasedReturnValue();
      v18 = self->_fingerDetectionOperation;
      self->_fingerDetectionOperation = v17;

      -[BKPresenceDetectOperation setPriority:](self->_fingerDetectionOperation, "setPriority:", 40);
      -[BKPresenceDetectOperation setDelegate:](self->_fingerDetectionOperation, "setDelegate:", self);
      if ((-[BKPresenceDetectOperation startWithError:](self->_fingerDetectionOperation, "startWithError:", 0) & 1) != 0)
        goto LABEL_25;
      -[BKPresenceDetectOperation setDelegate:](self->_fingerDetectionOperation, "setDelegate:", 0);
      v12 = self->_fingerDetectionOperation;
      self->_fingerDetectionOperation = 0;
    }
    else
    {
LABEL_17:
      v11 = 0;
      v12 = (BKPresenceDetectOperation *)v4;
    }

LABEL_25:
  }
}

- (void)accountDidUpdate:(id)a3
{
  -[PKDashboardPassViewController _updateFooterAnimated:](self, "_updateFooterAnimated:", PKViewVisibilityStateIsVisible());
}

- (void)_updateFooterAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  int v7;
  BOOL *p_footerVisible;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v3 = a3;
  if (!self->_frontmostPaymentPass || !PKViewVisibilityStateIsVisible())
    goto LABEL_12;
  -[PKDashboardViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_11;
  v6 = objc_msgSend(v5, "canRequestPaymentForPass:", self->_frontmostPaymentPass);

  if (!v6)
    goto LABEL_12;
  -[PKPaymentPass devicePrimaryContactlessPaymentApplication](self->_frontmostPaymentPass, "devicePrimaryContactlessPaymentApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass effectiveContactlessPaymentApplicationState](self->_frontmostPaymentPass, "effectiveContactlessPaymentApplicationState");
  if (!PKPaymentApplicationStateIsPersonalized())
  {
LABEL_11:

    goto LABEL_12;
  }
  if (v5 && (objc_msgSend(v5, "requiresConsentForDataRelease") & 1) == 0)
  {

  }
  else
  {
    v7 = -[PKPaymentPass supportsBarcodePayment](self->_frontmostPaymentPass, "supportsBarcodePayment");

    if (!v7)
      goto LABEL_12;
  }
  if ((objc_msgSend(MEMORY[0x1E0D6BFD8], "cachedStateForPolicy:", 0) & 0xF) != 9
    || -[PKPaymentPass hasAssociatedPeerPaymentAccount](self->_frontmostPaymentPass, "hasAssociatedPeerPaymentAccount")&& (objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance"), v12 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v12, "account"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v12, v14 = objc_msgSend(v13, "state"), v13, v14 == 3))
  {
LABEL_12:
    p_footerVisible = &self->_footerVisible;
    if (self->_footerVisible)
    {
      v9 = 0;
      goto LABEL_14;
    }
LABEL_34:
    -[PKDashboardPassViewController _updatePasscodeButtonTitle](self, "_updatePasscodeButtonTitle");
    return;
  }
  if (!-[PKPaymentPass isAppleCardPass](self->_frontmostPaymentPass, "isAppleCardPass")
    || (-[PKDashboardViewController dataSource](self, "dataSource"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v15,
        (isKindOfClass & 1) == 0))
  {
    p_footerVisible = &self->_footerVisible;
    if (!self->_footerVisible)
    {
      v9 = 1;
      goto LABEL_14;
    }
    goto LABEL_34;
  }
  -[PKDashboardViewController dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E3FACD00, &unk_1E3FACD18, &unk_1E3FACD30, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "state"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v19, "containsObject:", v20) ^ 1;

  }
  else
  {
    v9 = 0;
  }

  p_footerVisible = &self->_footerVisible;
  if (v9 != !self->_footerVisible)
    goto LABEL_34;
LABEL_14:
  -[PKDashboardPassViewController viewIfLoaded](self, "viewIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      -[PKDashboardPassViewController _createFooter](self, "_createFooter");
    if (v3)
    {
      objc_msgSend(v10, "layoutIfNeeded");
      *p_footerVisible = v9;
      objc_msgSend(v10, "setNeedsLayout");
      v11 = (void *)MEMORY[0x1E0DC3F10];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __55__PKDashboardPassViewController__updateFooterAnimated___block_invoke;
      v21[3] = &unk_1E3E612E8;
      v22 = v10;
      objc_msgSend(v11, "pkui_animateUsingOptions:animations:completion:", 4, v21, 0);

    }
    else
    {
      *p_footerVisible = v9;
      objc_msgSend(v10, "setNeedsLayout");
    }
  }
  else
  {
    *p_footerVisible = v9;
  }

}

uint64_t __55__PKDashboardPassViewController__updateFooterAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_createFooter
{
  void *v3;
  _PKVisibilityBackdropView *v4;
  _PKVisibilityBackdropView *v5;
  _PKVisibilityBackdropView *footerBackground;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  UIButton *passcodeButton;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id location;

  -[PKDashboardPassViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!self->_footerBackground)
    {
      v4 = [_PKVisibilityBackdropView alloc];
      v5 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:](v4, "initWithFrame:privateStyle:", -2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      footerBackground = self->_footerBackground;
      self->_footerBackground = v5;

      -[_UIBackdropView setAutoGroup:](self->_footerBackground, "setAutoGroup:", 1);
      -[_PKVisibilityBackdropView setDelegate:](self->_footerBackground, "setDelegate:", self);
      -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_footerBackground, "pkui_setVisibility:animated:", 0, 1.0);
      -[_PKVisibilityBackdropView setHidden:](self->_footerBackground, "setHidden:", 0);
      -[_PKVisibilityBackdropView setUserInteractionEnabled:](self->_footerBackground, "setUserInteractionEnabled:", 1);
      -[_PKVisibilityBackdropView setClipsToBounds:](self->_footerBackground, "setClipsToBounds:", 1);
      objc_msgSend(v3, "addSubview:", self->_footerBackground);
      objc_msgSend(v3, "setNeedsLayout");
    }
    if (!self->_passcodeButton)
    {
      v7 = (void *)MEMORY[0x1E0DC3520];
      -[PKDashboardPassViewController _passcodeButtonTitle](self, "_passcodeButtonTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E0DC48D8], 18.0));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pkui_plainConfigurationWithTitle:font:lineBreakMode:textAlignment:", v8, v9, 4, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v11 = (void *)MEMORY[0x1E0DC3428];
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __46__PKDashboardPassViewController__createFooter__block_invoke;
      v20 = &unk_1E3E62BD0;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v11, "actionWithHandler:", &v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v10, v12, v17, v18, v19, v20);
      v13 = (UIButton *)objc_claimAutoreleasedReturnValue();
      passcodeButton = self->_passcodeButton;
      self->_passcodeButton = v13;

      -[UIButton setConfigurationUpdateHandler:](self->_passcodeButton, "setConfigurationUpdateHandler:", &__block_literal_global_160);
      -[UIButton setAccessibilityIdentifier:](self->_passcodeButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
      -[_UIBackdropView contentView](self->_footerBackground, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addSubview:", self->_passcodeButton);

      -[_UIBackdropView contentView](self->_footerBackground, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C18]);

      objc_msgSend(v3, "setNeedsLayout");
      -[PKDashboardPassViewController _updatePasscodeButtonTitle](self, "_updatePasscodeButtonTitle");

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

    }
  }

}

void __46__PKDashboardPassViewController__createFooter__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_passcodeTapped:", v4);
}

void __46__PKDashboardPassViewController__createFooter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);

}

- (void)_updatePasscodeButtonTitle
{
  UIButton *passcodeButton;
  void *v4;
  id v5;

  passcodeButton = self->_passcodeButton;
  if (passcodeButton)
  {
    -[PKDashboardPassViewController _passcodeButtonTitle](self, "_passcodeButtonTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton pkui_updateConfigurationWithTitle:](passcodeButton, "pkui_updateConfigurationWithTitle:", v4);

    -[PKDashboardPassViewController _updateDefaultPasscodeButtonSize](self, "_updateDefaultPasscodeButtonSize");
    -[PKDashboardPassViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (id)_passcodeButtonTitle
{
  __CFString *v2;

  if (-[PKPaymentPass isAccessPass](self->_frontmostPaymentPass, "isAccessPass"))
    v2 = CFSTR("GENERIC_PASSCODE");
  else
    v2 = CFSTR("PAYMENT_PASSCODE");
  PKLocalizedPaymentString(&v2->isa);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateDefaultPasscodeButtonSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize *p_defaultPasscodeButtonSize;
  UIButton *passcodeButton;
  double v9;
  CGFloat v10;
  CGFloat v11;
  id v12;

  -[PKDashboardPassViewController view](self, "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  p_defaultPasscodeButtonSize = &self->_defaultPasscodeButtonSize;
  passcodeButton = self->_passcodeButton;
  objc_msgSend(v12, "bounds");
  -[UIButton sizeThatFits:](passcodeButton, "sizeThatFits:", v9 - v4 - v6, 1.79769313e308);
  p_defaultPasscodeButtonSize->width = v10;
  p_defaultPasscodeButtonSize->height = v11;

}

- (void)_passcodeTapped:(id)a3
{
  id v4;

  if (self->_frontmostPaymentPass)
  {
    -[PKDashboardViewController delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dashboardPassViewController:didRequestPaymentForPass:fromButton:", self, self->_frontmostPaymentPass, 1);

  }
}

- (void)accountAdded:(id)a3
{
  -[PKDashboardPassViewController _handleUpdatedAccount:accountRemoved:](self, "_handleUpdatedAccount:accountRemoved:", a3, 0);
}

- (void)accountChanged:(id)a3
{
  -[PKDashboardPassViewController _handleUpdatedAccount:accountRemoved:](self, "_handleUpdatedAccount:accountRemoved:", a3, 0);
}

- (void)accountRemoved:(id)a3
{
  -[PKDashboardPassViewController _handleUpdatedAccount:accountRemoved:](self, "_handleUpdatedAccount:accountRemoved:", a3, 1);
}

- (void)_handleUpdatedAccount:(id)a3 accountRemoved:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKDashboardPassViewController__handleUpdatedAccount_accountRemoved___block_invoke;
  block[3] = &unk_1E3E64908;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __70__PKDashboardPassViewController__handleUpdatedAccount_accountRemoved___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  char v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frontmostPassView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "associatedAccountServiceAccountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  if (v9 == v10)
  {

LABEL_10:
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "accountIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Updating navigation items via account %@ change", (uint8_t *)&v17, 0xCu);

    }
    if (*(_BYTE *)(a1 + 48))
      v16 = 0;
    else
      v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_updateNavigationItemsWithAccount:", v16);
    goto LABEL_16;
  }
  v11 = v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {

    goto LABEL_16;
  }
  v13 = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v13 & 1) != 0)
    goto LABEL_10;
LABEL_16:

}

- (void)reloadNavigationBarAnimated:(BOOL)a3
{
  -[PKDashboardPassViewController _setUpNavigationItemsAnimated:](self, "_setUpNavigationItemsAnimated:", 1);
}

- (void)presentActivityDeletionConfirmationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  PKDashboardPassViewController *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  if (v4)
  {
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_SHEET_TITLE_IPHONE"));
    v15 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_REMOVE_BUTTON_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_CANCEL_BUTTON_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3448];
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __83__PKDashboardPassViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke;
    v18[3] = &unk_1E3E61CA8;
    v11 = v4;
    v19 = v11;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v6, 2, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v12);

    v13 = (void *)MEMORY[0x1E0DC3448];
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __83__PKDashboardPassViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke_2;
    v16[3] = &unk_1E3E61CA8;
    v17 = v11;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v7, 1, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v14);

    -[PKDashboardPassViewController presentViewController:animated:completion:](v15, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

uint64_t __83__PKDashboardPassViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__PKDashboardPassViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *fingerTimer;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  NSObject *v12;
  OS_dispatch_source *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a4;
  v6 = a3;
  if (((!self->_fingerPresent ^ v4) & 1) == 0)
  {
    self->_fingerPresent = v4;
    if (v4)
    {
      v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      fingerTimer = self->_fingerTimer;
      self->_fingerTimer = v7;

      v9 = self->_fingerTimer;
      v10 = dispatch_time(0, 400000000);
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      objc_initWeak(&location, self);
      v11 = self->_fingerTimer;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __64__PKDashboardPassViewController_operation_presenceStateChanged___block_invoke;
      v14[3] = &unk_1E3E61310;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_event_handler(v11, v14);
      dispatch_resume((dispatch_object_t)self->_fingerTimer);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      v12 = self->_fingerTimer;
      if (v12)
      {
        dispatch_source_cancel(v12);
        v13 = self->_fingerTimer;
        self->_fingerTimer = 0;

      }
    }
  }

}

void __64__PKDashboardPassViewController_operation_presenceStateChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 145);
    v6 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = (void *)v6[145];
      v6[145] = 0;

      v2 = v6;
    }
    if (v2[153])
    {
      objc_msgSend(v2, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dashboardPassViewController:didRequestPaymentForPass:fromButton:", v6, v6[153], 0);

      v2 = v6;
    }
  }

}

- (void)_performActivationStateUpdate:(id)a3
{
  void (**v4)(_QWORD);
  int v5;
  int v6;
  int v7;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[PKDashboardPassViewController _isForegroundActive](self, "_isForegroundActive");
  v4[2](v4);

  v6 = -[PKDashboardPassViewController _isForegroundActive](self, "_isForegroundActive");
  if (v5 != v6)
  {
    v7 = v6;
    -[PKDashboardPassViewController _updateFingerDetection](self, "_updateFingerDetection");
    -[PKDashboardPassViewController _updateDigitalCarKeyAssertion](self, "_updateDigitalCarKeyAssertion");
    if (((v5 | v7 ^ 1) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForPolicy:", 0);
      -[PKDashboardPassViewController _updateFooterAnimated:](self, "_updateFooterAnimated:", 1);
    }
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  _QWORD v4[5];
  $96EE1C12479E9B303E9C2794B92A11A2 v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__PKDashboardPassViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke;
  v4[3] = &unk_1E3E64930;
  v4[4] = self;
  v5 = a4;
  -[PKDashboardPassViewController _performActivationStateUpdate:](self, "_performActivationStateUpdate:", v4);
}

uint64_t __88__PKDashboardPassViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke(uint64_t result)
{
  *(_WORD *)(*(_QWORD *)(result + 32) + 1208) = *(_WORD *)(result + 40);
  return result;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4
{
  _QWORD v4[5];
  unsigned int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__PKDashboardPassViewController_foregroundActiveArbiter_didUpdateDeactivationReasons___block_invoke;
  v4[3] = &unk_1E3E64958;
  v4[4] = self;
  v5 = a4;
  -[PKDashboardPassViewController _performActivationStateUpdate:](self, "_performActivationStateUpdate:", v4);
}

uint64_t __86__PKDashboardPassViewController_foregroundActiveArbiter_didUpdateDeactivationReasons___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 1212) = *(_DWORD *)(result + 40);
  return result;
}

- (BOOL)_isDeactivated
{
  return !self->_foregroundActiveState.foregroundActive
      || +[PKUIForegroundActiveArbiter isDeactivedForReasons:](PKUIForegroundActiveArbiter, "isDeactivedForReasons:", self->_deactivationReasons);
}

- (BOOL)_isBackgrounded
{
  return !self->_foregroundActiveState.foreground
      || +[PKUIForegroundActiveArbiter isBackgroundedForReasons:](PKUIForegroundActiveArbiter, "isBackgroundedForReasons:", self->_deactivationReasons);
}

- (BOOL)_isForegroundActive
{
  if (-[PKDashboardPassViewController _isDeactivated](self, "_isDeactivated"))
    return 0;
  else
    return !-[PKDashboardPassViewController _isBackgrounded](self, "_isBackgrounded");
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceStyle", a3) == 2)
    return 2030;
  else
    return 2010;
}

- (void)menuFactoryDidUpdateMenu:(id)a3
{
  id v4;

  objc_msgSend(a3, "moreMenu");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassViewController reloadMoreMenuItemsWithMenu:](self, "reloadMoreMenuItemsWithMenu:", v4);

}

- (void)bindInterstitialController:(id)a3
{
  objc_storeStrong((id *)&self->_activeInterstitialController, a3);
}

- (void)unbindInterstitialController:(id)a3
{
  PKPGSVTransitionInterstitialController *activeInterstitialController;

  activeInterstitialController = self->_activeInterstitialController;
  self->_activeInterstitialController = 0;

}

- (id)leadingViewsForInterstitialController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PKDashboardPassViewController navigationItem](self, "navigationItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)trailingViewsForInterstitialController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PKDashboardPassViewController navigationItem](self, "navigationItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (!objc_msgSend(v11, "isSystemItem", (_QWORD)v16) || objc_msgSend(v11, "systemItem") != 6)
          {
            objc_msgSend(v11, "customView");
            v12 = objc_claimAutoreleasedReturnValue();
            if (!v12)
              goto LABEL_13;
            v13 = (void *)v12;
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
LABEL_13:

    v14 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (void)passTilesItemPresenter:(id)a3 executeSEActionForPass:(id)a4 tile:(id)a5 withCompletion:(id)a6
{
  id v10;
  PKPass *v11;
  id v12;
  id v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  os_unfair_lock_s *p_lock;
  unsigned __int8 *v28;
  int v29;
  NSMutableArray *sessionHandles;
  NSMutableArray *v31;
  NSMutableArray *v32;
  dispatch_source_t v33;
  void *v34;
  NSObject *v35;
  dispatch_time_t v36;
  NSObject *v37;
  os_unfair_lock_t lock;
  id v39;
  id v40;
  void *v41;
  _QWORD handler[4];
  id v43;
  uint64_t *v44;
  _QWORD v45[4];
  PKPass *v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  id location;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD aBlock[5];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;

  v10 = a3;
  v11 = (PKPass *)a4;
  v12 = a5;
  v13 = a6;
  v14 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v14 & 1) == 0 && self->_frontmostPass == v11 && (PKViewVisibilityStateIsVisible() & 1) != 0)
  {
    objc_msgSend(v12, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D671D0];
    objc_msgSend(v15, "actions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "effectiveActionForActions:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && objc_msgSend(v18, "type") == 4)
    {
      v41 = v15;
      v76 = 0;
      v77 = &v76;
      v78 = 0x2020000000;
      v19 = MEMORY[0x1E0C809B0];
      v79 = *MEMORY[0x1E0DC4878];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke;
      aBlock[3] = &unk_1E3E62060;
      aBlock[4] = &v76;
      v20 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v19;
      v73[1] = 3221225472;
      v73[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_2;
      v73[3] = &unk_1E3E61590;
      v22 = v20;
      v74 = v22;
      v23 = objc_msgSend(v21, "beginBackgroundTaskWithExpirationHandler:", v73);
      v77[3] = v23;

      v70[0] = v19;
      v70[1] = 3221225472;
      v70[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_4;
      v70[3] = &unk_1E3E649A8;
      v40 = v22;
      v71 = v40;
      v72 = v13;
      v24 = _Block_copy(v70);
      objc_initWeak(&location, self);
      v65 = 0;
      v66 = &v65;
      v67 = 0x2020000000;
      v68 = 1;
      v59 = 0;
      v60 = (id *)&v59;
      v61 = 0x3032000000;
      v62 = __Block_byref_object_copy__3;
      v63 = __Block_byref_object_dispose__3;
      v64 = 0;
      v53 = 0;
      v54 = &v53;
      v55 = 0x3032000000;
      v56 = __Block_byref_object_copy__3;
      v57 = __Block_byref_object_dispose__3;
      v58 = 0;
      v25 = (void *)MEMORY[0x1E0D672B8];
      v45[0] = v19;
      v45[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_178;
      v45[3] = &unk_1E3E649F8;
      v45[1] = 3221225472;
      objc_copyWeak(&v52, &location);
      v39 = v24;
      v48 = v39;
      v49 = &v65;
      v50 = &v59;
      v51 = &v53;
      v46 = v11;
      v47 = v12;
      objc_msgSend(v25, "startDigitalCarKeySessionWithCompletion:", v45);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v41;
      if (v26)
      {
        p_lock = &self->_lock;
        os_unfair_lock_lock(&self->_lock);
        v28 = (unsigned __int8 *)(v66 + 3);
        do
        {
          v29 = __ldaxr(v28);
          if (v29 != 1)
          {
            __clrex();
            goto LABEL_17;
          }
        }
        while (__stlxr(0, v28));
        sessionHandles = self->_sessionHandles;
        if (!sessionHandles)
        {
          v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v32 = self->_sessionHandles;
          self->_sessionHandles = v31;

          sessionHandles = self->_sessionHandles;
        }
        -[NSMutableArray addObject:](sessionHandles, "addObject:", v26, &self->_lock, v39);
        objc_storeStrong(v60 + 5, v26);
        v33 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
        v34 = (void *)v54[5];
        v54[5] = (uint64_t)v33;

        v35 = v54[5];
        v36 = dispatch_time(0, 10000000000);
        dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        v37 = v54[5];
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_4_185;
        handler[3] = &unk_1E3E64A20;
        v44 = &v59;
        v43 = v40;
        dispatch_source_set_event_handler(v37, handler);
        dispatch_resume((dispatch_object_t)v54[5]);

        p_lock = lock;
LABEL_17:
        os_unfair_lock_unlock(p_lock);
      }

      objc_destroyWeak(&v52);
      _Block_object_dispose(&v53, 8);

      _Block_object_dispose(&v59, 8);
      _Block_object_dispose(&v65, 8);
      objc_destroyWeak(&location);

      _Block_object_dispose(&v76, 8);
    }
    else
    {
      (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_3;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  char v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_5;
    v13[3] = &unk_1E3E61590;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v5, "invalidateSessionWithCompletion:", v13);

  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_6;
  block[3] = &unk_1E3E64980;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a2;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_5(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

uint64_t __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_6(_QWORD *a1)
{
  if (!a1[4])
    (*(void (**)(void))(a1[5] + 16))();
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 80));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[148];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_2_179;
    block[3] = &unk_1E3E649D0;
    block[4] = WeakRetained;
    v16 = *(_OWORD *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 72);
    v11 = v5;
    v12 = v6;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    dispatch_async(v9, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_2_179(uint64_t a1)
{
  unsigned __int8 *v2;
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  while (1)
  {
    v3 = __ldaxr(v2);
    if (v3 != 1)
      break;
    if (!__stlxr(0, v2))
      goto LABEL_6;
  }
  __clrex();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 1176));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "removeObjectIdenticalTo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 1176));
LABEL_6:
  v4 = *(_QWORD *)(a1 + 40);
  if (!v4
    || *(_QWORD *)(a1 + 48)
    || (v4 = *(_QWORD *)(a1 + 40), v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1192)), (v5 & 1) != 0))
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 0, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D66C70], "attachDefaultBehaviorToSession:", v4);
    objc_msgSend(*(id *)(a1 + 56), "deviceContactlessPaymentApplications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "pk_arrayCopy");

    v8 = objc_msgSend(*(id *)(a1 + 40), "activatePaymentApplications:forPaymentPass:", v7, *(_QWORD *)(a1 + 56));
    v40 = 0;
    v41 = 0;
    if (!v8)
      goto LABEL_32;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v24 = v7;
    obj = v7;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v37;
LABEL_12:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(obj);
        v28 = v9;
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        objc_msgSend(v10, "applicationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v10, "subcredentials");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v33;
LABEL_17:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v33 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(a1 + 64);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v16), "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKPassTileGroupView extractSupportedVehicleFunction:action:forTile:applicationIdentifier:keyIdentifier:](PKPassTileGroupView, "extractSupportedVehicleFunction:action:forTile:applicationIdentifier:keyIdentifier:", &v41, &v40, v17, v11, v18);

            if (v41)
            {
              if (v40)
                break;
            }
            if (v14 == ++v16)
            {
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
              if (v14)
                goto LABEL_17;
              break;
            }
          }
        }

        v19 = v40;
        v20 = v41;

        if (v20)
        {
          if (v19)
            break;
        }
        v9 = v28 + 1;
        if (v28 + 1 == v27)
        {
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
          if (v27)
            goto LABEL_12;
          break;
        }
      }
    }

    v21 = v41;
    v7 = v24;
    if (v41 && (v22 = v40) != 0)
    {
      v23 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_3_182;
      v29[3] = &unk_1E3E61338;
      v31 = *(id *)(a1 + 72);
      v30 = *(id *)(a1 + 40);
      objc_msgSend(v23, "sendRKEFunction:action:withAuthorization:completion:", v21, v22, 0, v29);

    }
    else
    {
LABEL_32:
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

  }
}

uint64_t __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_3_182(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_4_185(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_5_186;
  v3[3] = &unk_1E3E61590;
  v4 = v1;
  objc_msgSend(v2, "invalidateSessionWithCompletion:", v3);

}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_5_186(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (BOOL)handleDeletePassWithUniqueID:(id)a3
{
  PKPass *frontmostPass;
  id v5;
  void *v6;
  int v7;
  PKPassType v8;
  PKPass *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;

  frontmostPass = self->_frontmostPass;
  v5 = a3;
  -[PKPass uniqueID](frontmostPass, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PKEqualObjects();

  if (!v7)
    return 0;
  v8 = -[PKPass passType](self->_frontmostPass, "passType");
  if (v8 == PKPassTypeSecureElement)
  {
    -[PKPass paymentPass](self->_frontmostPass, "paymentPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasMerchantTokens"))
    {
      objc_msgSend(v12, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardPassViewController navigationDashboardPassVC](self, "navigationDashboardPassVC");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      -[PKDashboardPassViewController navigationDashboardPassVC](self, "navigationDashboardPassVC");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v19) = 0;
      +[PKPassDeleteHelper presentMerchantTokenDeletePaymentPassAlertForPass:withAccount:merchantTokensResponse:deleteHander:passLibraryDataProvider:navigationController:presentingViewController:isBridge:](PKPassDeleteHelper, "presentMerchantTokenDeletePaymentPassAlertForPass:withAccount:merchantTokensResponse:deleteHander:passLibraryDataProvider:navigationController:presentingViewController:isBridge:", v10, v13, 0, v14, v15, v16, self, v19);
    }
    else
    {
      if (objc_msgSend(v10, "isStoredValuePass"))
      {
        objc_msgSend(MEMORY[0x1E0D67748], "passPropertiesForPass:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", v10);
        objc_msgSend(v14, "setTransitProperties:andApplyStoredValueBalances:", v13, 1);
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
      objc_msgSend(v12, "account");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc_init(MEMORY[0x1E0D67100]);
      -[PKDashboardPassViewController navigationDashboardPassVC](self, "navigationDashboardPassVC");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      +[PKPassDeleteHelper presentDeletePaymentPassAlertForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:fkInstitution:detailViewStyle:deleteHander:passLibraryDataProvider:presentingViewController:](PKPassDeleteHelper, "presentDeletePaymentPassAlertForPass:withAccount:paymentServiceDataProvider:transitBalanceModel:transitPassProperties:fkInstitution:detailViewStyle:deleteHander:passLibraryDataProvider:presentingViewController:", v10, v15, v16, v14, v13, 0, 0, v17, v18, self);

    }
    goto LABEL_13;
  }
  if (v8)
    return 0;
  v9 = self->_frontmostPass;
  -[PKDashboardPassViewController navigationDashboardPassVC](self, "navigationDashboardPassVC");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPassDeleteHelper presentDeleteBarcodePassAlertForPass:withHandler:presentingViewController:](PKPassDeleteHelper, "presentDeleteBarcodePassAlertForPass:withHandler:presentingViewController:", v9, v10, self);
LABEL_13:

  return 1;
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
  {
    self->_didBeginPassManagementSubject = 0;
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69910]);
  }
}

- (PKPass)frontmostPass
{
  return self->_frontmostPass;
}

- (PKDashboardPassFlowLayout)passFlowLayout
{
  return self->_passFlowLayout;
}

- (PKDashboardPaymentTransactionItemPresenter)transactionPresenter
{
  return self->_transactionPresenter;
}

- (PKDashboardAccountModulePresenter)accountModulePresenter
{
  return self->_accountModulePresenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionPresenter, 0);
  objc_storeStrong((id *)&self->_passFlowLayout, 0);
  objc_storeStrong((id *)&self->_frontmostPass, 0);
  objc_storeStrong((id *)&self->_shareablePassProvider, 0);
  objc_storeStrong((id *)&self->_accountModulePresenter, 0);
  objc_storeStrong((id *)&self->_dckAssertion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_navBarButtonTypes, 0);
  objc_storeStrong((id *)&self->_moreMenuFactory, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_passcodeButton, 0);
  objc_storeStrong((id *)&self->_footerBackground, 0);
  objc_storeStrong((id *)&self->_frontmostPaymentPass, 0);
  objc_storeStrong((id *)&self->_sessionHandles, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeInterstitialController, 0);
  objc_storeStrong((id *)&self->_fingerTimer, 0);
  objc_storeStrong((id *)&self->_fingerDetectionOperation, 0);
}

@end
