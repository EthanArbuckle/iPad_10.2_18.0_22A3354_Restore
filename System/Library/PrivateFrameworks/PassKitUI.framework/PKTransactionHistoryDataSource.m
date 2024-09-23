@implementation PKTransactionHistoryDataSource

- (PKTransactionHistoryDataSource)initWithFetcher:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 featuredTransaction:(id)a9 selectedTransactions:(id)a10 transactionHistory:(id)a11 type:(unint64_t)a12
{
  id v19;
  id v20;
  PKTransactionHistoryDataSource *v21;
  PKTransactionHistoryDataSource *v22;
  uint64_t v23;
  NSCalendar *currentCalendar;
  uint64_t v25;
  PKCoarseLocationMonitor *coarseLocationMonitor;
  void *v27;
  uint64_t v28;
  NSSet *physicalCards;
  PKPaymentDataProvider *v30;
  PKPaymentDataProvider *dataProvider;
  uint64_t v32;
  NSIndexPath *headerIndexPath;
  uint64_t v34;
  PKAccountService *accountService;
  unint64_t type;
  void *v37;
  uint64_t v38;
  NSString *peerPaymentCounterpartHandle;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  PKContactResolver *contactResolver;
  PKPeerPaymentCounterpartImageResolver *v45;
  PKPeerPaymentCounterpartImageResolver *peerPaymentImageResolver;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  uint64_t v69;
  void *v70;
  PKMerchant *merchant;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  objc_super v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v76 = a4;
  v75 = a5;
  v74 = a6;
  v73 = a7;
  v19 = a8;
  v78 = a9;
  v79 = a10;
  v20 = a11;
  v88.receiver = self;
  v88.super_class = (Class)PKTransactionHistoryDataSource;
  v21 = -[PKTransactionHistoryDataSource init](&v88, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_type = a12;
    objc_storeStrong((id *)&v21->_featuredTransaction, a9);
    objc_storeStrong((id *)&v22->_selectedTransactions, a10);
    objc_storeStrong((id *)&v22->_transactionFetcher, a3);
    objc_storeStrong((id *)&v22->_familyCollection, a5);
    -[PKDashboardTransactionFetcher setDelegate:](v22->_transactionFetcher, "setDelegate:", v22);
    objc_storeStrong((id *)&v22->_transactionSourceCollection, a4);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v23 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v22->_currentCalendar;
    v22->_currentCalendar = (NSCalendar *)v23;

    objc_msgSend(MEMORY[0x1E0D66C30], "sharedInstance");
    v25 = objc_claimAutoreleasedReturnValue();
    coarseLocationMonitor = v22->_coarseLocationMonitor;
    v22->_coarseLocationMonitor = (PKCoarseLocationMonitor *)v25;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v22, sel__handleCoarseLocationChangedNotification_, *MEMORY[0x1E0D69B78], v22->_coarseLocationMonitor);

    objc_storeStrong((id *)&v22->_account, a6);
    objc_storeStrong((id *)&v22->_accountUserCollection, a7);
    v28 = objc_msgSend(v19, "copy");
    physicalCards = v22->_physicalCards;
    v22->_physicalCards = (NSSet *)v28;

    v30 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    dataProvider = v22->_dataProvider;
    v22->_dataProvider = v30;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v22->_headerIndexPath;
    v22->_headerIndexPath = (NSIndexPath *)v32;

    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v34 = objc_claimAutoreleasedReturnValue();
    accountService = v22->_accountService;
    v22->_accountService = (PKAccountService *)v34;

    -[PKAccountService registerObserver:](v22->_accountService, "registerObserver:", v22);
    type = v22->_type;
    if (type == 1)
    {
      objc_msgSend(v78, "merchant");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v47)
      {
        v49 = v47;
      }
      else
      {
        objc_msgSend(v79, "transactions");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "firstObject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "merchant");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v52;
        if (v52)
        {
          v49 = v52;
        }
        else
        {
          objc_msgSend(v20, "firstObject");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "merchant");
          v49 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

      if (!objc_msgSend(v49, "hasMapsMatch") || objc_msgSend(v49, "useRawMerchantData"))
      {
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        objc_msgSend(v79, "transactions");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v85;
          while (2)
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v85 != v58)
                objc_enumerationMutation(v55);
              objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "merchant");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v60, "useRawMerchantData") & 1) == 0)
              {
                objc_msgSend(v60, "mapsBrand");
                v61 = objc_claimAutoreleasedReturnValue();
                if (v61)
                {
                  v62 = (void *)v61;

                  goto LABEL_24;
                }
              }

            }
            v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
            if (v57)
              continue;
            break;
          }
        }
        v60 = v49;
LABEL_24:

        v49 = v60;
      }
      if (!objc_msgSend(v49, "hasMapsMatch") || objc_msgSend(v49, "useRawMerchantData"))
      {
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v63 = v20;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v81;
          while (2)
          {
            for (j = 0; j != v65; ++j)
            {
              if (*(_QWORD *)v81 != v66)
                objc_enumerationMutation(v63);
              objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * j), "merchant");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v68, "useRawMerchantData") & 1) == 0)
              {
                objc_msgSend(v68, "mapsBrand");
                v69 = objc_claimAutoreleasedReturnValue();
                if (v69)
                {
                  v70 = (void *)v69;

                  goto LABEL_38;
                }
              }

            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
            if (v65)
              continue;
            break;
          }
        }
        v68 = v49;
LABEL_38:

        v49 = v68;
      }
      merchant = v22->_merchant;
      v22->_merchant = (PKMerchant *)v49;

      -[PKTransactionHistoryDataSource _loadTransactionReceipt](v22, "_loadTransactionReceipt");
    }
    else if (!type)
    {
      -[PKDashboardTransactionFetcher counterpartHandles](v22->_transactionFetcher, "counterpartHandles");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "anyObject");
      v38 = objc_claimAutoreleasedReturnValue();
      peerPaymentCounterpartHandle = v22->_peerPaymentCounterpartHandle;
      v22->_peerPaymentCounterpartHandle = (NSString *)v38;

      v40 = objc_alloc_init(MEMORY[0x1E0C97298]);
      v41 = objc_alloc(MEMORY[0x1E0D66C60]);
      -[PKTransactionHistoryDataSource _contactKeysToFetch](v22, "_contactKeysToFetch");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "initWithContactStore:keysToFetch:", v40, v42);
      contactResolver = v22->_contactResolver;
      v22->_contactResolver = (PKContactResolver *)v43;

      v45 = objc_alloc_init(PKPeerPaymentCounterpartImageResolver);
      peerPaymentImageResolver = v22->_peerPaymentImageResolver;
      v22->_peerPaymentImageResolver = v45;

      -[PKTransactionHistoryDataSource _loadContact](v22, "_loadContact");
    }
    v22->_transactionHistoryLoaded = 1;
    if (v20)
      -[PKTransactionHistoryDataSource _handleTransactionHistoryUpdated:](v22, "_handleTransactionHistoryUpdated:", v20);
    else
      -[PKTransactionHistoryDataSource _reloadTransactions](v22, "_reloadTransactions");
  }

  return v22;
}

- (PKTransactionHistoryDataSource)initWithTransactionGroup:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 fetcher:(id)a9 transactionHistory:(id)a10
{
  id v17;
  id v18;
  PKTransactionHistoryDataSource *v19;
  PKTransactionHistoryDataSource *v20;
  uint64_t v21;
  NSArray *transactionHistory;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  FKBankConnectAccountsProvider *bankConnectAccountsProvider;
  FKBankConnectAccountsProvider *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  PKMerchant *merchant;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSString *peerPaymentCounterpartHandle;
  NSString **p_peerPaymentCounterpartHandle;
  PKMerchant *v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  PKContactResolver *contactResolver;
  PKPeerPaymentCounterpartImageResolver *v52;
  PKPeerPaymentCounterpartImageResolver *peerPaymentImageResolver;
  uint64_t v54;
  NSCalendar *currentCalendar;
  uint64_t v56;
  PKCoarseLocationMonitor *coarseLocationMonitor;
  void *v58;
  uint64_t v59;
  NSSet *physicalCards;
  PKPaymentDataProvider *v61;
  PKPaymentDataProvider *dataProvider;
  uint64_t v63;
  NSIndexPath *headerIndexPath;
  uint64_t v65;
  PKAccountService *accountService;
  uint64_t v67;
  PKDashboardTransactionFetcher *transactionFetcher;
  PKDashboardTransactionFetcher *v69;
  void *v70;
  void *v71;
  PKDashboardTransactionFetcher *v72;
  void *v73;
  NSDateFormatter *v74;
  NSDateFormatter *formatterTitle;
  NSDateFormatter *v76;
  const __CFString *v77;
  NSDateFormatter *v78;
  NSDateFormatter *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  PKDashboardTransactionFetcher *v85;
  PKDashboardTransactionFetcher *v86;
  void *v87;
  void *v88;
  NSDateFormatter *v89;
  NSDateFormatter *v90;
  NSDateFormatter *v91;
  id v92;
  void *v93;
  id v94;
  PKTransactionSourceCollection *transactionSourceCollection;
  uint64_t v96;
  uint64_t v97;
  PKDashboardTransactionFetcher *v98;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  PKDashboardTransactionFetcher *v103;
  PKDashboardTransactionFetcher *v104;
  void *v105;
  void *v106;
  void *v107;
  NSDateFormatter *v108;
  NSDateFormatter *v109;
  NSDateFormatter *v110;
  NSDateFormatter *formatterMonth;
  void *v112;
  PKPaymentTransactionGroup **p_group;
  id *v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  _QWORD v122[4];
  PKTransactionHistoryDataSource *v123;
  id v124;
  objc_super v125;

  v17 = a3;
  v120 = a4;
  v118 = a5;
  v119 = a6;
  v117 = a7;
  v121 = a8;
  v116 = a9;
  v18 = a10;
  v125.receiver = self;
  v125.super_class = (Class)PKTransactionHistoryDataSource;
  v19 = -[PKTransactionHistoryDataSource init](&v125, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_type = 2;
    p_group = &v19->_group;
    objc_storeStrong((id *)&v19->_group, a3);
    objc_storeStrong((id *)&v20->_transactionSourceCollection, a4);
    objc_storeStrong((id *)&v20->_familyCollection, a5);
    objc_storeStrong((id *)&v20->_selectedTransactions, a3);
    v21 = objc_msgSend(v18, "copy");
    transactionHistory = v20->_transactionHistory;
    v20->_transactionHistory = (NSArray *)v21;

    objc_storeStrong((id *)&v20->_transactionFetcher, a9);
    if (PKBankConnectEnabled())
    {
      objc_msgSend(v120, "paymentPass");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x1E0CADCE8]);
      objc_msgSend(v23, "primaryAccountIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "initWithPrimaryAccountIdentifier:", v25);
      bankConnectAccountsProvider = v20->_bankConnectAccountsProvider;
      v20->_bankConnectAccountsProvider = (FKBankConnectAccountsProvider *)v26;

      v28 = v20->_bankConnectAccountsProvider;
      v122[0] = MEMORY[0x1E0C809B0];
      v122[1] = 3221225472;
      v122[2] = __175__PKTransactionHistoryDataSource_initWithTransactionGroup_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_fetcher_transactionHistory___block_invoke;
      v122[3] = &unk_1E3E784A0;
      v123 = v20;
      v124 = v23;
      v29 = v23;
      -[FKBankConnectAccountsProvider accountAndReconsentStatusWithCompletion:](v28, "accountAndReconsentStatusWithCompletion:", v122);

    }
    -[PKTransactionHistoryDataSource _updateFooterTotalFromGroup:](v20, "_updateFooterTotalFromGroup:", v17, p_group);
    v30 = objc_msgSend(v17, "type");
    objc_msgSend(v17, "searchQuery");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "tokens");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v30 == 14 && v33 == 1)
    {
      objc_msgSend(v17, "searchQuery");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "merchantToken");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "group");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "merchant");
      v37 = objc_claimAutoreleasedReturnValue();
      merchant = v20->_merchant;
      v20->_merchant = (PKMerchant *)v37;

      objc_msgSend(v17, "searchQuery");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "peerPaymentToken");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "group");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handles");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "anyObject");
      v43 = objc_claimAutoreleasedReturnValue();
      p_peerPaymentCounterpartHandle = &v20->_peerPaymentCounterpartHandle;
      peerPaymentCounterpartHandle = v20->_peerPaymentCounterpartHandle;
      v20->_peerPaymentCounterpartHandle = (NSString *)v43;

    }
    else
    {
      v46 = v20->_merchant;
      v20->_merchant = 0;

      p_peerPaymentCounterpartHandle = &v20->_peerPaymentCounterpartHandle;
      v39 = v20->_peerPaymentCounterpartHandle;
      v20->_peerPaymentCounterpartHandle = 0;
    }

    if (*p_peerPaymentCounterpartHandle)
    {
      v47 = objc_alloc_init(MEMORY[0x1E0C97298]);
      v48 = objc_alloc(MEMORY[0x1E0D66C60]);
      -[PKTransactionHistoryDataSource _contactKeysToFetch](v20, "_contactKeysToFetch");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "initWithContactStore:keysToFetch:", v47, v49);
      contactResolver = v20->_contactResolver;
      v20->_contactResolver = (PKContactResolver *)v50;

      v52 = objc_alloc_init(PKPeerPaymentCounterpartImageResolver);
      peerPaymentImageResolver = v20->_peerPaymentImageResolver;
      v20->_peerPaymentImageResolver = v52;

      -[PKTransactionHistoryDataSource _loadContact](v20, "_loadContact");
    }
    else
    {
      v20->_contactLoaded = 1;
    }
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v54 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v20->_currentCalendar;
    v20->_currentCalendar = (NSCalendar *)v54;

    objc_msgSend(MEMORY[0x1E0D66C30], "sharedInstance");
    v56 = objc_claimAutoreleasedReturnValue();
    coarseLocationMonitor = v20->_coarseLocationMonitor;
    v20->_coarseLocationMonitor = (PKCoarseLocationMonitor *)v56;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addObserver:selector:name:object:", v20, sel__handleCoarseLocationChangedNotification_, *MEMORY[0x1E0D69B78], v20->_coarseLocationMonitor);

    objc_storeStrong((id *)&v20->_account, a6);
    objc_storeStrong((id *)&v20->_accountUserCollection, a7);
    v59 = objc_msgSend(v121, "copy");
    physicalCards = v20->_physicalCards;
    v20->_physicalCards = (NSSet *)v59;

    v61 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    dataProvider = v20->_dataProvider;
    v20->_dataProvider = v61;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v63 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v20->_headerIndexPath;
    v20->_headerIndexPath = (NSIndexPath *)v63;

    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v65 = objc_claimAutoreleasedReturnValue();
    accountService = v20->_accountService;
    v20->_accountService = (PKAccountService *)v65;

    -[PKAccountService registerObserver:](v20->_accountService, "registerObserver:", v20);
    switch(objc_msgSend(v17, "type"))
    {
      case 2:
        v67 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithTransactionSourceCollection:paymentDataProvider:", v20->_transactionSourceCollection, 0);
        transactionFetcher = v20->_transactionFetcher;
        v20->_transactionFetcher = (PKDashboardTransactionFetcher *)v67;

        v69 = v20->_transactionFetcher;
        objc_msgSend(v17, "startDate");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "endDate");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardTransactionFetcher setLimit:startDate:endDate:](v69, "setLimit:startDate:endDate:", 0, v70, v71);

        v72 = v20->_transactionFetcher;
        objc_msgSend(v17, "transactionTypes");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardTransactionFetcher filterTypes:](v72, "filterTypes:", v73);

        -[PKDashboardTransactionFetcher setDelegate:](v20->_transactionFetcher, "setDelegate:", v20);
        v74 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        formatterTitle = v20->_formatterTitle;
        v20->_formatterTitle = v74;

        v76 = v20->_formatterTitle;
        v77 = CFSTR("MMMM yyyy");
        goto LABEL_18;
      case 3:
        v84 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithTransactionSourceCollection:paymentDataProvider:", v20->_transactionSourceCollection, 0);
        v85 = v20->_transactionFetcher;
        v20->_transactionFetcher = (PKDashboardTransactionFetcher *)v84;

        v86 = v20->_transactionFetcher;
        objc_msgSend(v17, "startDate");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "endDate");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardTransactionFetcher setLimit:startDate:endDate:](v86, "setLimit:startDate:endDate:", 0, v87, v88);

        -[PKDashboardTransactionFetcher setDelegate:](v20->_transactionFetcher, "setDelegate:", v20);
        v89 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        v90 = v20->_formatterTitle;
        v20->_formatterTitle = v89;

        v91 = v20->_formatterTitle;
        v92 = objc_alloc(MEMORY[0x1E0C99D48]);
        v93 = (void *)objc_msgSend(v92, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
        -[NSDateFormatter setCalendar:](v91, "setCalendar:", v93);

        v76 = v20->_formatterTitle;
        v77 = CFSTR("y");
        goto LABEL_18;
      case 5:
        objc_msgSend(v17, "startDate");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        PKStartOfMonth();
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        v82 = objc_msgSend(v119, "type");
        if (v82 == 1)
        {
          objc_msgSend(v119, "creditDetails");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        if (v82 == 4)
        {
          objc_msgSend(v119, "savingsDetails");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
          v99 = v83;
          objc_msgSend(v83, "createdDate");
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }
        v100 = 0;
LABEL_25:
        if (objc_msgSend(v100, "compare:", v81) == 1)
        {
          v101 = v100;

          v81 = v101;
        }
        v102 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithTransactionSourceCollection:paymentDataProvider:", v20->_transactionSourceCollection, 0);
        v103 = v20->_transactionFetcher;
        v20->_transactionFetcher = (PKDashboardTransactionFetcher *)v102;

        v104 = v20->_transactionFetcher;
        objc_msgSend(v17, "endDate");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        PKStartOfNextMonth();
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "dateByAddingTimeInterval:", -1.0);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardTransactionFetcher setLimit:startDate:endDate:](v104, "setLimit:startDate:endDate:", 0, v81, v107);

        -[PKDashboardTransactionFetcher setDelegate:](v20->_transactionFetcher, "setDelegate:", v20);
        v108 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        v109 = v20->_formatterTitle;
        v20->_formatterTitle = v108;

        -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v20->_formatterTitle, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d"));
        v110 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        formatterMonth = v20->_formatterMonth;
        v20->_formatterMonth = v110;

        -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v20->_formatterMonth, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
LABEL_28:
        if (v20->_transactionFetcher
          && (objc_msgSend(*v115, "bankConnectSectionIdentifier"),
              v112 = (void *)objc_claimAutoreleasedReturnValue(),
              v112,
              !v112))
        {
          -[PKTransactionHistoryDataSource _notifyContentLoadedIfNecessary](v20, "_notifyContentLoadedIfNecessary");
          -[PKTransactionHistoryDataSource _reloadTransactions](v20, "_reloadTransactions");
        }
        else
        {
          v20->_transactionHistoryLoaded = 1;
          -[PKTransactionHistoryDataSource _notifyContentLoadedIfNecessary](v20, "_notifyContentLoadedIfNecessary");
        }
        break;
      case 7:
        v94 = objc_alloc(MEMORY[0x1E0D66C98]);
        transactionSourceCollection = v20->_transactionSourceCollection;
        v96 = 11;
        goto LABEL_21;
      case 9:
        v94 = objc_alloc(MEMORY[0x1E0D66C98]);
        transactionSourceCollection = v20->_transactionSourceCollection;
        v96 = 10;
LABEL_21:
        v97 = objc_msgSend(v94, "initWithTransactionType:transactionSourceCollection:paymentDataProvider:", v96, transactionSourceCollection, 0);
        v98 = v20->_transactionFetcher;
        v20->_transactionFetcher = (PKDashboardTransactionFetcher *)v97;

        -[PKDashboardTransactionFetcher setLimit:startDate:endDate:](v20->_transactionFetcher, "setLimit:startDate:endDate:", 0, 0, 0);
        -[PKDashboardTransactionFetcher setDelegate:](v20->_transactionFetcher, "setDelegate:", v20);
        goto LABEL_28;
      default:
        v78 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        v79 = v20->_formatterTitle;
        v20->_formatterTitle = v78;

        v76 = v20->_formatterTitle;
        v77 = CFSTR("MMMM d");
LABEL_18:
        -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v76, "setLocalizedDateFormatFromTemplate:", v77);
        goto LABEL_28;
    }
  }

  return v20;
}

void __175__PKTransactionHistoryDataSource_initWithTransactionGroup_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_fetcher_transactionHistory___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v9[2] = __175__PKTransactionHistoryDataSource_initWithTransactionGroup_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_fetcher_transactionHistory___block_invoke_2;
  v9[3] = &unk_1E3E62460;
  v10 = v5;
  v11 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __175__PKTransactionHistoryDataSource_initWithTransactionGroup_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_fetcher_transactionHistory___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "consentStatus");
  objc_msgSend(*(id *)(a1 + 32), "institution");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 264);
  *(_QWORD *)(v4 + 264) = v3;

  if (*(_QWORD *)(a1 + 48))
    v6 = 1;
  else
    v6 = v14 == 0;
  if (!v6 && v2 == 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0CADD20]);
    objc_msgSend(*(id *)(a1 + 56), "primaryAccountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithPrimaryAccountIdentifier:dateFromYear:groupType:", v9, v10, 0);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 256);
    *(_QWORD *)(v12 + 256) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "performFetchAndStartObservingNotifications");
  }

}

- (void)updateGroup:(id)a3
{
  PKPaymentTransactionGroup *v5;
  PKPaymentTransactionGroup *selectedTransactions;
  PKPaymentTransactionGroup *v7;
  id WeakRetained;

  v5 = (PKPaymentTransactionGroup *)a3;
  objc_storeStrong((id *)&self->_group, a3);
  selectedTransactions = self->_selectedTransactions;
  self->_selectedTransactions = v5;
  v7 = v5;

  -[PKTransactionHistoryDataSource _updateFooterTotalFromGroup:](self, "_updateFooterTotalFromGroup:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "updateContent");

}

- (void)_updateFooterTotalFromGroup:(id)a3
{
  id v4;
  PKCurrencyAmount *v5;
  PKCurrencyAmount *footerTotal;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PKCurrencyAmount **p_footerTotal;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 hasSent;
  id v17;
  void *v18;
  void *v19;
  PKCurrencyAmount *v20;
  PKCurrencyAmount *v21;
  PKCurrencyAmount *v22;
  PKCurrencyAmount *v23;
  id v24;
  id obj;

  v4 = a3;
  objc_msgSend(v4, "totalAmount");
  v5 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
  footerTotal = self->_footerTotal;
  self->_footerTotal = v5;

  if (!self->_footerTotal)
  {
    objc_msgSend(v4, "transactions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      if (-[PKPaymentTransactionGroup type](self->_group, "type") != 14)
        goto LABEL_8;
      -[PKPaymentTransactionGroup searchQuery](self->_group, "searchQuery");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "peerPaymentToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "group");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_8:
        objc_msgSend(v4, "transactions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransactionHistoryDataSource _totalSpendingFromTransactions:startDate:endDate:](self, "_totalSpendingFromTransactions:startDate:endDate:", v11, v18, v19);
        v20 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
        v21 = self->_footerTotal;
        self->_footerTotal = v20;

LABEL_13:
        goto LABEL_14;
      }
      p_footerTotal = &self->_footerTotal;
      v24 = 0;
      obj = 0;
      objc_msgSend(v4, "transactions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransactionHistoryDataSource _p2pTotalsFromTransactions:received:sent:](self, "_p2pTotalsFromTransactions:received:sent:", v13, &obj, &v24);

      objc_msgSend(obj, "amount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_hasReceived = objc_msgSend(v14, "pk_isPositiveNumber");

      objc_msgSend(v24, "amount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_hasSent = objc_msgSend(v15, "pk_isPositiveNumber");

      hasSent = self->_hasSent;
      if (self->_hasReceived)
      {
        objc_storeStrong((id *)&self->_footerTotal, obj);
        if (hasSent)
        {
          v17 = v24;
          p_footerTotal = &self->_footerSecondaryTotal;
LABEL_11:
          v22 = (PKCurrencyAmount *)v17;
          v23 = *p_footerTotal;
          *p_footerTotal = v22;

        }
      }
      else if (self->_hasSent)
      {
        v17 = v24;
        goto LABEL_11;
      }

      goto LABEL_13;
    }
  }
LABEL_14:

}

- (PKTransactionHistoryDataSource)initWithInstallmentPlan:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKTransactionHistoryDataSource *v18;
  PKTransactionHistoryDataSource *v19;
  PKDashboardTransactionFetcher *transactionFetcher;
  uint64_t v21;
  NSCalendar *currentCalendar;
  uint64_t v23;
  PKCoarseLocationMonitor *coarseLocationMonitor;
  void *v25;
  uint64_t v26;
  NSSet *physicalCards;
  uint64_t v28;
  PKDashboardTransactionFetcher *v29;
  uint64_t v30;
  NSIndexPath *headerIndexPath;
  uint64_t v32;
  PKAccountService *accountService;
  void *v34;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v15 = a3;
  v38 = a4;
  v37 = a5;
  v36 = a6;
  v16 = a7;
  v17 = a8;
  v39.receiver = self;
  v39.super_class = (Class)PKTransactionHistoryDataSource;
  v18 = -[PKTransactionHistoryDataSource init](&v39, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_type = 3;
    transactionFetcher = v18->_transactionFetcher;
    v18->_transactionFetcher = 0;

    -[PKDashboardTransactionFetcher setDelegate:](v19->_transactionFetcher, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_transactionSourceCollection, a4);
    objc_storeStrong((id *)&v19->_familyCollection, a5);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v21 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v19->_currentCalendar;
    v19->_currentCalendar = (NSCalendar *)v21;

    objc_msgSend(MEMORY[0x1E0D66C30], "sharedInstance");
    v23 = objc_claimAutoreleasedReturnValue();
    coarseLocationMonitor = v19->_coarseLocationMonitor;
    v19->_coarseLocationMonitor = (PKCoarseLocationMonitor *)v23;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v19, sel__handleCoarseLocationChangedNotification_, *MEMORY[0x1E0D69B78], v19->_coarseLocationMonitor);

    objc_storeStrong((id *)&v19->_account, a6);
    objc_storeStrong((id *)&v19->_accountUserCollection, a7);
    v26 = objc_msgSend(v17, "copy");
    physicalCards = v19->_physicalCards;
    v19->_physicalCards = (NSSet *)v26;

    objc_storeStrong((id *)&v19->_associatedInstallmentPlan, a3);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithInstallmentPlan:transactionSourceCollection:paymentDataProvider:", v15, v19->_transactionSourceCollection, 0);
    v29 = v19->_transactionFetcher;
    v19->_transactionFetcher = (PKDashboardTransactionFetcher *)v28;

    -[PKDashboardTransactionFetcher setLimit:startDate:endDate:](v19->_transactionFetcher, "setLimit:startDate:endDate:", 0, 0, 0);
    -[PKDashboardTransactionFetcher setDelegate:](v19->_transactionFetcher, "setDelegate:", v19);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v19->_headerIndexPath;
    v19->_headerIndexPath = (NSIndexPath *)v30;

    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v32 = objc_claimAutoreleasedReturnValue();
    accountService = v19->_accountService;
    v19->_accountService = (PKAccountService *)v32;

    -[PKAccountService registerObserver:](v19->_accountService, "registerObserver:", v19);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v19, sel__handleAccountsChangedNotification_, *MEMORY[0x1E0D68290], 0);

    -[PKTransactionHistoryDataSource _updateInstallmentPlan](v19, "_updateInstallmentPlan");
  }

  return v19;
}

- (PKTransactionHistoryDataSource)initWithTransactionGroups:(id)a3 headerGroup:(id)a4 regionUpdater:(id)a5 tokens:(id)a6 transactionSourceCollection:(id)a7 familyCollection:(id)a8 account:(id)a9 accountUserCollection:(id)a10 physicalCards:(id)a11
{
  id v17;
  id v18;
  id v19;
  PKTransactionHistoryDataSource *v20;
  PKTransactionHistoryDataSource *v21;
  uint64_t v22;
  PKCurrencyAmount *footerTotal;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  PKMerchant *merchant;
  uint64_t v33;
  NSCalendar *currentCalendar;
  uint64_t v35;
  PKCoarseLocationMonitor *coarseLocationMonitor;
  void *v37;
  uint64_t v38;
  NSSet *physicalCards;
  PKPaymentDataProvider *v40;
  PKPaymentDataProvider *dataProvider;
  uint64_t v42;
  PKAccountService *accountService;
  uint64_t v44;
  NSIndexPath *headerIndexPath;
  NSDateFormatter *v46;
  NSDateFormatter *formatterTitle;
  id v48;
  NSDateFormatter *v49;
  id v50;
  void *v51;
  NSDateFormatter *v52;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  objc_super v62;

  v61 = a3;
  v17 = a4;
  v18 = a7;
  v60 = a5;
  v59 = a6;
  v58 = a7;
  v57 = a8;
  v56 = a9;
  v55 = a10;
  v19 = a11;
  v62.receiver = self;
  v62.super_class = (Class)PKTransactionHistoryDataSource;
  v20 = -[PKTransactionHistoryDataSource init](&v62, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_type = 4;
    objc_storeStrong((id *)&v20->_group, a4);
    objc_storeStrong((id *)&v21->_groups, a3);
    objc_storeStrong((id *)&v21->_tokens, a6);
    objc_storeStrong((id *)&v21->_familyCollection, a8);
    -[PKTransactionHistoryDataSource _totalFromGroups:](v21, "_totalFromGroups:", v21->_groups);
    v22 = objc_claimAutoreleasedReturnValue();
    footerTotal = v21->_footerTotal;
    v21->_footerTotal = (PKCurrencyAmount *)v22;

    v24 = objc_msgSend(v17, "type");
    objc_msgSend(v17, "searchQuery");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "tokens");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v24 == 14 && v27 == 1)
    {
      objc_msgSend(v17, "searchQuery");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "merchantToken");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "group");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "merchant");
      v31 = objc_claimAutoreleasedReturnValue();
      merchant = v21->_merchant;
      v21->_merchant = (PKMerchant *)v31;

    }
    else
    {
      v28 = v21->_merchant;
      v21->_merchant = 0;
    }

    objc_storeStrong((id *)&v21->_transactionSourceCollection, v18);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v33 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v21->_currentCalendar;
    v21->_currentCalendar = (NSCalendar *)v33;

    objc_msgSend(MEMORY[0x1E0D66C30], "sharedInstance");
    v35 = objc_claimAutoreleasedReturnValue();
    coarseLocationMonitor = v21->_coarseLocationMonitor;
    v21->_coarseLocationMonitor = (PKCoarseLocationMonitor *)v35;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v21, sel__handleCoarseLocationChangedNotification_, *MEMORY[0x1E0D69B78], v21->_coarseLocationMonitor);

    objc_storeStrong((id *)&v21->_account, a9);
    objc_storeStrong((id *)&v21->_accountUserCollection, a10);
    v38 = objc_msgSend(v19, "copy");
    physicalCards = v21->_physicalCards;
    v21->_physicalCards = (NSSet *)v38;

    v40 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    dataProvider = v21->_dataProvider;
    v21->_dataProvider = v40;

    objc_storeStrong((id *)&v21->_regionUpdater, a5);
    -[PKWorldRegionUpdater addObserver:](v21->_regionUpdater, "addObserver:", v21);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v42 = objc_claimAutoreleasedReturnValue();
    accountService = v21->_accountService;
    v21->_accountService = (PKAccountService *)v42;

    -[PKAccountService registerObserver:](v21->_accountService, "registerObserver:", v21);
    v21->_transactionHistoryLoaded = 1;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v44 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v21->_headerIndexPath;
    v21->_headerIndexPath = (NSIndexPath *)v44;

    if (-[PKPaymentTransactionGroup type](v21->_group, "type") == 3)
    {
      v46 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
      formatterTitle = v21->_formatterTitle;
      v21->_formatterTitle = v46;

      v48 = v19;
      v49 = v21->_formatterTitle;
      v50 = objc_alloc(MEMORY[0x1E0C99D48]);
      v51 = (void *)objc_msgSend(v50, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
      v52 = v49;
      v19 = v48;
      -[NSDateFormatter setCalendar:](v52, "setCalendar:", v51);

      -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v21->_formatterTitle, "setLocalizedDateFormatFromTemplate:", CFSTR("y"));
    }
    v21->_contactLoaded = 1;
    -[PKTransactionHistoryDataSource _notifyContentLoadedIfNecessary](v21, "_notifyContentLoadedIfNecessary");
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionHistoryDataSource;
  -[PKTransactionHistoryDataSource dealloc](&v4, sel_dealloc);
}

- (void)updateGroups:(id)a3 headerGroup:(id)a4
{
  NSArray *v6;
  id v7;
  NSArray *groups;
  NSArray *v9;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *footerTotal;
  id WeakRetained;

  v6 = (NSArray *)a3;
  objc_storeStrong((id *)&self->_group, a4);
  v7 = a4;
  groups = self->_groups;
  self->_groups = v6;
  v9 = v6;

  -[PKTransactionHistoryDataSource _totalFromGroups:](self, "_totalFromGroups:", self->_groups);
  v10 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
  footerTotal = self->_footerTotal;
  self->_footerTotal = v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "updateContent");

}

- (unint64_t)transactionHistoryItemsCount
{
  return -[PKTransactionHistoryDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", 5);
}

- (BOOL)areTransactionsEditable
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_transactionHistory;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDeletable", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)footerTitle
{
  unint64_t type;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PKPaymentTransactionGroup *group;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  PKPaymentTransaction *featuredTransaction;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  NSArray *transactionHistory;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v43;
  void *v44;

  type = self->_type;
  if (type != 1)
  {
    if (type != 4 && type != 2)
    {
LABEL_52:
      v5 = 0;
      return (NSString *)v5;
    }
    v5 = 0;
    switch(-[PKPaymentTransactionGroup type](self->_group, "type"))
    {
      case 0:
      case 1:
      case 10:
      case 11:
      case 13:
      case 15:
      case 16:
        -[PKPaymentTransactionGroup startDate](self->_group, "startDate");
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = (void *)v6;
          -[PKPaymentTransactionGroup endDate](self->_group, "endDate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            -[PKPaymentTransactionGroup startDate](self->_group, "startDate");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentTransactionGroup endDate](self->_group, "endDate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
        }
        if (!-[NSArray count](self->_transactionHistory, "count"))
          goto LABEL_52;
        -[NSArray lastObject](self->_transactionHistory, "lastObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "transactionDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray firstObject](self->_transactionHistory, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "transactionDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PKDateRangeStringFromDateToDate();
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      case 5:
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransactionGroup startDate](self->_group, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isDateInToday:", v15))
        {
          PKLocalizedString(CFSTR("RELATIVE_DATE_TODAY"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v9, "isDateInYesterday:", v15))
            PKRelativeDateStringWithFullDateForUnits();
          else
            -[NSDateFormatter stringFromDate:](self->_formatterTitle, "stringFromDate:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pk_uppercaseFirstStringForPreferredLocale");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

        }
        goto LABEL_21;
      case 7:
        v23 = -[PKAccount feature](self->_account, "feature");
        if (v23 == 5)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          PKYearStringFromDate();
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          PKLocalizedFeatureString();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_50;
        }
        if (v23 != 2)
          goto LABEL_52;
        goto LABEL_55;
      case 9:
        -[PKPaymentTransactionGroup transactions](self->_selectedTransactions, "transactions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "transactionDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "components:fromDate:", 14, v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "date:matchesComponents:", v19, v22))
          goto LABEL_31;
        v38 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v38, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
        objc_msgSend(v38, "stringFromDate:", v19);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      case 14:
        -[PKPaymentTransactionGroup searchQuery](self->_group, "searchQuery");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "peerPaymentToken");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          if (-[PKPaymentTransactionGroup type](self->_group, "type") == 14)
          {
            -[PKPaymentTransactionGroup searchQuery](self->_group, "searchQuery");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "peerPaymentToken");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "group");
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {
              if (self->_hasReceived)
              {
                v31 = CFSTR("TRANSACTIONS_TOTAL_RECEIVED");
LABEL_63:
                PKLocalizedPeerPaymentString(&v31->isa);
                v5 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_21;
              }
              if (self->_hasSent)
              {
                v31 = CFSTR("TRANSACTIONS_TOTAL_SENT");
                goto LABEL_63;
              }
            }
          }
          else
          {
            v9 = 0;
          }
          v5 = 0;
          goto LABEL_21;
        }
        -[PKCurrencyAmount amount](self->_footerTotal, "amount");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "pk_isZeroNumber");

        if ((v41 & 1) != 0)
          goto LABEL_52;
        -[PKPaymentTransactionGroup startDate](self->_group, "startDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        group = self->_group;
        break;
      default:
        return (NSString *)v5;
    }
    goto LABEL_13;
  }
  -[PKPaymentTransactionGroup transactions](self->_selectedTransactions, "transactions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[PKPaymentTransactionGroup startDate](self->_selectedTransactions, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    group = self->_selectedTransactions;
LABEL_13:
    -[PKPaymentTransactionGroup endDate](group, "endDate");
    v14 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v14;
    v5 = 0;
    if (v9 && v14)
    {
LABEL_15:
      PKDateRangeStringFromDateToDate();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_16:

LABEL_21:
    return (NSString *)v5;
  }
  featuredTransaction = self->_featuredTransaction;
  if (!featuredTransaction)
  {
    transactionHistory = self->_transactionHistory;
    if (!transactionHistory)
    {
LABEL_55:
      PKLocalizedFeatureString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v5;
    }
    -[NSArray lastObject](transactionHistory, "lastObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "transactionDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray firstObject](self->_transactionHistory, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "transactionDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0;
    if (v9 && v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "compare:", v35) == -1)
        v36 = v35;
      else
        v36 = v10;
      v37 = v36;

      PKDateRangeStringFromDateToDate();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v37;
    }
    goto LABEL_16;
  }
  -[PKPaymentTransaction transactionDate](featuredTransaction, "transactionDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "components:fromDate:", 14, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "date:matchesComponents:", v19, v22))
  {
LABEL_31:
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKLocalizedFeatureString();
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v39, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
    objc_msgSend(v39, "stringFromDate:", v19);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    PKStringWithValidatedFormat();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_48:
  }

LABEL_50:
  return (NSString *)v5;
}

- (NSString)footerSecondaryTitle
{
  unint64_t type;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKCurrencyAmount *footerSecondaryTotal;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;

  type = self->_type;
  if (type == 1)
  {
    footerSecondaryTotal = self->_footerSecondaryTotal;
    if (!footerSecondaryTotal)
      goto LABEL_19;
    -[PKCurrencyAmount amount](footerSecondaryTotal, "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if ((v13 & 1) != 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (type != 2)
  {
LABEL_19:
    v9 = 0;
    return (NSString *)v9;
  }
  v4 = -[PKPaymentTransactionGroup type](self->_group, "type");
  if (v4 == 14)
  {
    -[PKPaymentTransactionGroup searchQuery](self->_group, "searchQuery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "peerPaymentToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_19;
    if (-[PKPaymentTransactionGroup type](self->_group, "type") == 14)
    {
      -[PKPaymentTransactionGroup searchQuery](self->_group, "searchQuery");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "peerPaymentToken");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "group");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 && self->_hasReceived && self->_hasSent)
      {
        PKLocalizedPeerPaymentString(CFSTR("TRANSACTIONS_TOTAL_SENT"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

        return (NSString *)v9;
      }
    }
    else
    {
      v18 = 0;
    }
    v9 = 0;
    goto LABEL_25;
  }
  if (v4 == 7)
  {
    if (-[PKAccount feature](self->_account, "feature") != 5)
      goto LABEL_19;
LABEL_18:
    PKLocalizedFeatureString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v9;
  }
  if (v4 != 5)
    goto LABEL_19;
  -[PKPaymentTransactionGroup startDate](self->_group, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 14, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "date:matchesComponents:", v5, v8))
  {
    PKLocalizedFeatureString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v20, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
    objc_msgSend(v20, "stringFromDate:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v9;
}

- (BOOL)useLargeTitle
{
  return -[PKTransactionHistoryDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", 0) == 0;
}

- (id)navigationBarTitle
{
  NSString *v3;
  NSDateFormatter *formatterTitle;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;

  switch(self->_type)
  {
    case 0uLL:
      v3 = self->_peerPaymentCounterpartHandle;
      if (-[PKPaymentTransaction peerPaymentPaymentMode](self->_featuredTransaction, "peerPaymentPaymentMode") != 2)
      {
        objc_msgSend(MEMORY[0x1E0D67400], "displayNameForCounterpartHandle:contact:", v3, self->_contact);
        v7 = objc_claimAutoreleasedReturnValue();

        v3 = (NSString *)v7;
      }
      break;
    case 1uLL:
      -[PKMerchant displayName](self->_merchant, "displayName");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v3 = (NSString *)v8;
      break;
    case 2uLL:
    case 4uLL:
      v3 = 0;
      switch(-[PKPaymentTransactionGroup type](self->_group, "type"))
      {
        case 0:
          -[PKPaymentTransactionGroup merchantCategory](self->_group, "merchantCategory");
          PKLocalizedStringFromMerchantCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 1:
          -[PKPaymentTransactionGroup merchant](self->_group, "merchant");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "displayName");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 2:
        case 3:
          formatterTitle = self->_formatterTitle;
          -[PKPaymentTransactionGroup startDate](self->_group, "startDate");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateFormatter stringFromDate:](formatterTitle, "stringFromDate:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "pk_uppercaseFirstStringForPreferredLocale");
          v3 = (NSString *)objc_claimAutoreleasedReturnValue();

          return v3;
        case 4:
        case 5:
        case 6:
        case 8:
        case 9:
        case 10:
        case 11:
          goto LABEL_14;
        case 7:
          -[PKAccount feature](self->_account, "feature");
LABEL_14:
          PKLocalizedFeatureString();
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 13:
          -[PKPaymentTransactionGroup regions](self->_group, "regions");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedName");
          v3 = (NSString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_10;
        case 14:
          -[PKPaymentTransactionGroup searchQuery](self->_group, "searchQuery");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "tokens");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14 != 1)
            goto LABEL_28;
          objc_msgSend(v9, "locationTokens");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (v16)
          {
            objc_msgSend(v9, "locationTokens");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "lastObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "group");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "regions");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "firstObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "localizedName");
            v3 = (NSString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_10;
          }
          objc_msgSend(v9, "categoryToken");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v9, "categoryToken");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "group");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "merchantCategory");

            PKLocalizedStringFromMerchantCategory();
            v10 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v9, "transactionTypes");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count");

            if (v26)
            {
              objc_msgSend(v9, "transactionTypes");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "firstObject");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "integerValue");

              switch(v29)
              {
                case 1:
                case 7:
                case 10:
                  goto LABEL_33;
                case 5:
                  v35 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_GENERIC");
                  break;
                case 6:
                  v35 = CFSTR("TRANSACTION_TYPE_TOP_UP");
                  break;
                case 11:
                  -[PKAccount feature](self->_account, "feature");
                  goto LABEL_33;
                default:
                  goto LABEL_28;
              }
              PKLocalizedPaymentString(&v35->isa);
              v10 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v9, "transactionSources");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "count");

              if (v31
                && ((objc_msgSend(v9, "transactionSources"),
                     v32 = (void *)objc_claimAutoreleasedReturnValue(),
                     objc_msgSend(v32, "firstObject"),
                     v33 = (void *)objc_claimAutoreleasedReturnValue(),
                     v34 = objc_msgSend(v33, "integerValue"),
                     v33,
                     v32,
                     v34 == 6)
                 || v34 == 5))
              {
LABEL_33:
                PKLocalizedFeatureString();
                v10 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
LABEL_28:
                PKLocalizedString(CFSTR("SEARCH_RESULTS"));
                v10 = objc_claimAutoreleasedReturnValue();
              }
            }
          }
          break;
        default:
          return v3;
      }
      goto LABEL_9;
    case 3uLL:
      -[PKCreditInstallmentPlan product](self->_associatedInstallmentPlan, "product");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "model");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v3 = (NSString *)v10;
LABEL_10:

      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (void)setDataSourceDelegate:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  if (self->_contentIsLoaded)
    objc_msgSend(v4, "contentIsLoaded");

}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  PKWorldRegionUpdater *regionUpdater;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  PKDashboardTransactionMapItem *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *actionItems;
  uint64_t v16;
  NSArray *featuredTransactionActions;
  unint64_t v18;
  PKDashboardTransactionFetcher *transactionFetcher;
  void *v20;
  unint64_t v21;
  void *v22;
  PKWorldRegionUpdater *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSDecimalNumber *v30;
  NSString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v36[5];

  v4 = a3;
  switch(objc_msgSend(v4, "section"))
  {
    case 0:
      if (self->_type == 4 && self->_regionUpdater && -[PKPaymentTransactionGroup type](self->_group, "type") == 13)
      {
        regionUpdater = self->_regionUpdater;
        -[PKPaymentTransactionGroup regions](self->_group, "regions");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKWorldRegionUpdater updateCoordinatesForWorldRegionIfNeeded:](regionUpdater, "updateCoordinatesForWorldRegionIfNeeded:", v7);

      }
      -[PKTransactionHistoryDataSource _headerItem](self, "_headerItem");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    case 1:
      v9 = objc_msgSend(v4, "row");
      if (v9 == 1)
      {
        -[PKPaymentTransaction preferredLocation](self->_featuredTransaction, "preferredLocation");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v10 = objc_alloc_init(PKDashboardTransactionMapItem);
          -[PKDashboardTransactionMapItem setTransaction:](v10, "setTransaction:", self->_featuredTransaction);
          goto LABEL_49;
        }
        if (self->_associatedInstallmentPlan)
        {
          v10 = objc_alloc_init(PKDashboardTransactionInstallmentItem);
          -[PKDashboardTransactionMapItem setInstallmentPlan:](v10, "setInstallmentPlan:", self->_associatedInstallmentPlan);
          -[PKDashboardTransactionMapItem setAccount:](v10, "setAccount:", self->_account);
          -[PKDashboardTransactionMapItem setTransactionSourceCollection:](v10, "setTransactionSourceCollection:", self->_transactionSourceCollection);
          goto LABEL_49;
        }
        if (self->_associatedReceipt)
        {
          v10 = objc_alloc_init(PKDashboardTransactionReceiptItem);
          -[PKDashboardTransactionMapItem setReceipt:](v10, "setReceipt:", self->_associatedReceipt);
          -[PKDashboardTransactionMapItem setTransaction:](v10, "setTransaction:", self->_featuredTransaction);
          -[PKDashboardTransactionMapItem setTransactionSourceCollection:](v10, "setTransactionSourceCollection:", self->_transactionSourceCollection);
          -[PKDashboardTransactionMapItem setFamilyCollection:](v10, "setFamilyCollection:", self->_familyCollection);
          -[PKDashboardTransactionMapItem setAccount:](v10, "setAccount:", self->_account);
          -[PKDashboardTransactionMapItem setAccountUserCollection:](v10, "setAccountUserCollection:", self->_accountUserCollection);
          -[PKDashboardTransactionMapItem setPhysicalCards:](v10, "setPhysicalCards:", self->_physicalCards);
          goto LABEL_49;
        }
      }
      else if (!v9)
      {
        -[PKTransactionHistoryDataSource _transactionItemForTransaction:](self, "_transactionItemForTransaction:", self->_featuredTransaction);
        v10 = (PKDashboardTransactionMapItem *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardTransactionMapItem setIsFeaturedTransaction:](v10, "setIsFeaturedTransaction:", 1);
        goto LABEL_49;
      }
      v33 = objc_msgSend(v4, "row");
      if (self->_associatedInstallmentPlan)
        goto LABEL_45;
      -[PKPaymentTransaction preferredLocation](self->_featuredTransaction, "preferredLocation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {

LABEL_45:
        v16 = v33 - 2;
        goto LABEL_46;
      }
      if (self->_associatedReceipt)
        goto LABEL_45;
      v16 = v33 - 1;
LABEL_46:
      featuredTransactionActions = self->_featuredTransactionActions;
LABEL_47:
      -[NSArray objectAtIndex:](featuredTransactionActions, "objectAtIndex:", v16);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_48:
      v10 = (PKDashboardTransactionMapItem *)v8;
LABEL_49:

      return v10;
    case 2:
      v11 = objc_msgSend(v4, "row");
      -[PKPaymentTransactionGroup transactions](self->_selectedTransactions, "transactions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 < objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "objectAtIndex:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransactionHistoryDataSource _transactionItemForTransaction:](self, "_transactionItemForTransaction:", v13);
        v10 = (PKDashboardTransactionMapItem *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }

      goto LABEL_26;
    case 3:
      v14 = objc_msgSend(v4, "item");
      if (v14 == 1)
      {
        v10 = objc_alloc_init(PKDashboardTextActionItem);
        -[PKDashboardTransactionMapItem setLayoutStyle:](v10, "setLayoutStyle:", 0);
        PKLocalizedBeekmanString(CFSTR("TOTAL_FINANCED"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardTransactionMapItem setTitle:](v10, "setTitle:", v28);

        -[PKCreditInstallmentPlan totalAmount](self->_associatedInstallmentPlan, "totalAmount");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[PKCreditInstallmentPlan currencyCode](self->_associatedInstallmentPlan, "currencyCode");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            -[PKCreditInstallmentPlan totalAmount](self->_associatedInstallmentPlan, "totalAmount");
            v30 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            -[PKCreditInstallmentPlan currencyCode](self->_associatedInstallmentPlan, "currencyCode");
            v31 = (NSString *)objc_claimAutoreleasedReturnValue();
            PKCurrencyAmountCreate(v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v32, "formattedStringValue");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v12 = 0;
          }
        }
        -[PKDashboardTransactionMapItem setSubtitle:](v10, "setSubtitle:", v12);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __50__PKTransactionHistoryDataSource_itemAtIndexPath___block_invoke;
        v36[3] = &unk_1E3E728B8;
        v36[4] = self;
        -[PKDashboardTransactionMapItem setAction:](v10, "setAction:", v36);
LABEL_38:

      }
      else if (v14)
      {
LABEL_26:
        v10 = 0;
      }
      else
      {
        v10 = objc_alloc_init(PKDashboardInstallmentPlanStatusItem);
        -[PKDashboardTransactionMapItem setInstallmentPlan:](v10, "setInstallmentPlan:", self->_associatedInstallmentPlan);
        -[PKDashboardTransactionMapItem setAccount:](v10, "setAccount:", self->_account);
        -[PKDashboardTransactionMapItem setTransactionSourceCollection:](v10, "setTransactionSourceCollection:", self->_transactionSourceCollection);
        -[PKDashboardTransactionMapItem setAccountUserCollection:](v10, "setAccountUserCollection:", self->_accountUserCollection);
        -[PKDashboardTransactionMapItem setFamilyMemberCollection:](v10, "setFamilyMemberCollection:", self->_familyCollection);
      }
      goto LABEL_49;
    case 4:
      actionItems = self->_actionItems;
      v16 = objc_msgSend(v4, "item");
      featuredTransactionActions = actionItems;
      goto LABEL_47;
    case 5:
      v18 = objc_msgSend(v4, "row");
      if (v18 >= -[NSArray count](self->_transactionHistory, "count"))
        goto LABEL_26;
      -[NSArray objectAtIndex:](self->_transactionHistory, "objectAtIndex:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "transactionType") == 9)
      {
        v10 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
        transactionFetcher = self->_transactionFetcher;
        objc_msgSend(v12, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardTransactionFetcher cashbackGroupForTransactionWithIdentifier:cashbackTransactionSourceCollection:](transactionFetcher, "cashbackGroupForTransactionWithIdentifier:cashbackTransactionSourceCollection:", v20, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKDashboardTransactionMapItem setTransactionSourceCollection:](v10, "setTransactionSourceCollection:", self->_transactionSourceCollection);
        -[PKDashboardTransactionMapItem setFamilyCollection:](v10, "setFamilyCollection:", self->_familyCollection);
        -[PKDashboardTransactionMapItem setAccount:](v10, "setAccount:", self->_account);
        -[PKDashboardTransactionMapItem setAccountUserCollection:](v10, "setAccountUserCollection:", self->_accountUserCollection);
        -[PKDashboardTransactionMapItem setPhysicalCards:](v10, "setPhysicalCards:", self->_physicalCards);
        -[PKDashboardTransactionMapItem setGroup:](v10, "setGroup:", v13);
LABEL_19:

      }
      else
      {
        -[PKTransactionHistoryDataSource _transactionItemForTransaction:](self, "_transactionItemForTransaction:", v12);
        v26 = objc_claimAutoreleasedReturnValue();
LABEL_33:
        v10 = (PKDashboardTransactionMapItem *)v26;
      }
      goto LABEL_38;
    case 6:
      v21 = objc_msgSend(v4, "row");
      if (v21 >= -[NSArray count](self->_groups, "count"))
        goto LABEL_26;
      -[NSArray objectAtIndex:](self->_groups, "objectAtIndex:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v22;
      if (self->_regionUpdater && objc_msgSend(v22, "type") == 13)
      {
        v23 = self->_regionUpdater;
        objc_msgSend(v12, "regions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKWorldRegionUpdater updateCoordinatesForWorldRegionIfNeeded:](v23, "updateCoordinatesForWorldRegionIfNeeded:", v25);

      }
      -[PKTransactionHistoryDataSource _groupItemForTransaction:](self, "_groupItemForTransaction:", v12);
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    default:
      goto LABEL_26;
  }
}

void __50__PKTransactionHistoryDataSource_itemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKInstallmentPlanDetailsViewController *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  PKInstallmentPlanDetailsViewController *v8;

  v3 = a2;
  v4 = [PKInstallmentPlanDetailsViewController alloc];
  v5 = *(_QWORD **)(a1 + 32);
  v8 = -[PKInstallmentPlanDetailsViewController initWithAccount:installmentPlan:accountService:accountUserCollection:familyMemberCollection:transactionSourceCollection:](v4, "initWithAccount:installmentPlan:accountService:accountUserCollection:familyMemberCollection:transactionSourceCollection:", v5[28], v5[9], v5[19], v5[29], v5[17], v5[1]);
  objc_msgSend(v3, "pkui_viewControllerFromResponderChain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  unint64_t type;
  BOOL v5;
  unint64_t result;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  NSArray *actionItems;

  switch(a3)
  {
    case 0uLL:
      type = self->_type;
      v5 = type == 4 || type == 2;
      return !v5 || (-[PKPaymentTransactionGroup type](self->_group, "type") & 0xFFFFFFFFFFFFFFFELL) != 2;
    case 1uLL:
      if (self->_type == 2)
        return 0;
      result = (unint64_t)self->_featuredTransaction;
      if (!result)
        return result;
      objc_msgSend((id)result, "preferredLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 || self->_associatedInstallmentPlan)
      {

LABEL_14:
        v8 = 2;
        return -[NSArray count](self->_featuredTransactionActions, "count") + v8;
      }
      if (self->_associatedReceipt)
        goto LABEL_14;
      v8 = 1;
      return -[NSArray count](self->_featuredTransactionActions, "count") + v8;
    case 2uLL:
      -[PKPaymentTransactionGroup transactions](self->_selectedTransactions, "transactions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      return v10;
    case 3uLL:
      if (self->_type != 3)
        return 0;
      if (-[PKAccount accessLevel](self->_account, "accessLevel") == 1)
        return 2;
      else
        return 1;
    case 4uLL:
      actionItems = self->_actionItems;
      return -[NSArray count](actionItems, "count");
    case 5uLL:
      actionItems = self->_transactionHistory;
      return -[NSArray count](actionItems, "count");
    case 6uLL:
      actionItems = self->_groups;
      return -[NSArray count](actionItems, "count");
    default:
      return 0;
  }
}

- (unint64_t)numberOfSections
{
  return 7;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  -[PKPaymentTransactionGroup endDate](self->_selectedTransactions, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  switch(a3)
  {
    case 1uLL:
      if (-[PKPaymentTransaction transactionType](self->_featuredTransaction, "transactionType") != 3
        || -[PKPaymentTransaction peerPaymentType](self->_featuredTransaction, "peerPaymentType") != 3
        || -[PKPaymentTransaction transactionStatus](self->_featuredTransaction, "transactionStatus"))
      {
        goto LABEL_41;
      }
      v7 = CFSTR("PEER_PAYMENT_PENDING_REQUESTS");
LABEL_31:
      PKLocalizedPaymentString(&v7->isa);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    case 2uLL:
      -[PKPaymentTransactionGroup transactions](self->_selectedTransactions, "transactions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (!v9)
        goto LABEL_41;
      v6 = 0;
      switch(-[PKPaymentTransactionGroup type](self->_selectedTransactions, "type"))
      {
        case 0:
        case 1:
        case 4:
        case 6:
        case 8:
        case 15:
        case 16:
          if (!-[NSArray count](self->_transactionHistory, "count"))
            goto LABEL_30;
          -[PKPaymentTransactionGroup startDate](self->_selectedTransactions, "startDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentTransactionGroup endDate](self->_selectedTransactions, "endDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          PKDateRangeStringFromDateToDate();
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_10;
        case 5:
          if (-[NSCalendar isDateInToday:](self->_currentCalendar, "isDateInToday:", v5))
          {
            v15 = CFSTR("RELATIVE_DATE_RECEIVED_TODAY");
            goto LABEL_38;
          }
          if (-[NSCalendar isDateInYesterday:](self->_currentCalendar, "isDateInYesterday:", v5))
          {
            v15 = CFSTR("RELATIVE_DATE_RECEIVED_YESTERDAY");
            goto LABEL_38;
          }
          -[NSDateFormatter stringFromDate:](self->_formatterTitle, "stringFromDate:", v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedString(CFSTR("RELATIVE_DATE_RECEIVED_DATE"), CFSTR("%@"), v10);
          v18 = objc_claimAutoreleasedReturnValue();
          break;
        case 12:
          PKLocalizedPeerPaymentRecurringString(CFSTR("TRANSACTION_HISTORY_RECURRING_PAYMENTS"));
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_39;
        case 14:
          goto LABEL_30;
        default:
          goto LABEL_42;
      }
LABEL_44:
      v12 = (void *)v18;
LABEL_10:

      if (!v12)
        goto LABEL_41;
      goto LABEL_40;
    case 5uLL:
      if (!self->_contentIsLoaded || !-[NSArray count](self->_transactionHistory, "count"))
        goto LABEL_41;
      switch(self->_type)
      {
        case 0uLL:
LABEL_15:
          v7 = CFSTR("PEER_PAYMENT_HISTORY");
          goto LABEL_31;
        case 1uLL:
          v7 = CFSTR("PAYMENT_TRANSACTION_HISTORY");
          goto LABEL_31;
        case 2uLL:
          v6 = 0;
          switch(-[PKPaymentTransactionGroup type](self->_group, "type"))
          {
            case 2:
            case 3:
              goto LABEL_42;
            case 5:
              objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "components:fromDate:", 8, v5);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "month");

              PKGregorianMonthSpecificLocalizedStringKeyForKey();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              PKLocalizedString((NSString *)v10);
              v18 = objc_claimAutoreleasedReturnValue();
              goto LABEL_44;
            case 7:
              goto LABEL_15;
            case 9:
              PKLocalizedFeatureString();
              v19 = objc_claimAutoreleasedReturnValue();
              goto LABEL_39;
            default:
LABEL_30:
              v7 = CFSTR("PAYMENT_TRANSACTIONS");
              goto LABEL_31;
          }
        case 3uLL:
          PKLocalizedBeekmanString(CFSTR("INSTALLMENT_HISTORY_TITLE"));
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_39;
        default:
          goto LABEL_41;
      }
      goto LABEL_42;
    case 6uLL:
      if (!-[NSArray count](self->_groups, "count"))
        goto LABEL_41;
      -[NSArray firstObject](self->_groups, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "type");

      v6 = 0;
      if (v14 <= 11)
      {
        if (v14)
        {
          if (v14 != 1)
            goto LABEL_42;
          v15 = CFSTR("SEARCH_TITLE_MERCHANTS");
        }
        else
        {
          v15 = CFSTR("SEARCH_TITLE_CATEGORIES");
        }
      }
      else
      {
        if (v14 == 12)
        {
LABEL_21:
          v15 = CFSTR("SEARCH_TITLE_PEOPLE");
          goto LABEL_38;
        }
        if (v14 != 13)
        {
          if (v14 != 16)
            goto LABEL_42;
          goto LABEL_21;
        }
        v15 = CFSTR("SEARCH_TITLE_LOCATION");
      }
LABEL_38:
      PKLocalizedString(&v15->isa);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_39:
      v12 = (void *)v19;
      if (v19)
      {
LABEL_40:
        +[PKDashboardHeaderTextItem itemWithHeaderText:](PKDashboardHeaderTextItem, "itemWithHeaderText:", v12);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
LABEL_41:
        v6 = 0;
      }
LABEL_42:

      return v6;
    default:
      goto LABEL_42;
  }
}

- (id)footerTextItemForSection:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  if (a3 == 1
    && (-[PKPaymentTransaction preferredLocation](self->_featuredTransaction, "preferredLocation"),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v5 = (void *)v4,
        v6 = -[PKCoarseLocationMonitor coarseLocationEnabled](self->_coarseLocationMonitor, "coarseLocationEnabled"),
        v5,
        v6))
  {
    PKLocalizedPaymentString(CFSTR("COARSE_LOCATION_ENABLED_FOOTER_LINK_TEXT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("COARSE_LOCATION_ENABLED_FOOTER_FORMAT"), CFSTR("%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rangeOfString:", v7);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
    }
    else
    {
      v13 = v9;
      v14 = v10;
      +[PKDashboardFooterTextItem itemWithFooterText:](PKDashboardFooterTextItem, "itemWithFooterText:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLinkRange:", v13, v14);
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLinkTextColor:", v15);

      objc_msgSend(v11, "setAction:", &__block_literal_global_209);
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

void __59__PKTransactionHistoryDataSource_footerTextItemForSection___block_invoke()
{
  void *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=LOCATION"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v0, "absoluteString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19D178000, v1, OS_LOG_TYPE_DEFAULT, "Opening URL: %@", (uint8_t *)&v4, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v0, 0);

}

- (id)_totalSpendingFromTransactions:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  NSDecimalNumber *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  NSString *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v31 = a4;
  v30 = a5;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      if (v31)
        v12 = v30 == 0;
      else
        v12 = 1;
      v13 = *(_QWORD *)v33;
      v14 = !v12;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
          v17 = objc_msgSend(v16, "transactionType");
          if (v17 <= 0xD)
          {
            if (((1 << v17) & 0x2882) != 0
              || !v17
              && ((v22 = objc_msgSend(v16, "transactionStatus"), v22 <= 8)
                ? (v23 = ((1 << v22) & 0x103) == 0)
                : (v23 = 1),
                  !v23))
            {
              if (!v14)
                goto LABEL_17;
              objc_msgSend(v16, "transactionDate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v18, "compare:", v31) != -1)
              {
                v19 = v9;
                v20 = objc_msgSend(v18, "compare:", v30);

                v12 = v20 == 1;
                v9 = v19;
                if (v12)
                  goto LABEL_20;
LABEL_17:
                objc_msgSend(v16, "amount");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  -[NSDecimalNumber decimalNumberByAdding:](v8, "decimalNumberByAdding:", v18);
                  v21 = objc_claimAutoreleasedReturnValue();

                  v8 = (NSDecimalNumber *)v21;
                }
              }

            }
          }
LABEL_20:
          ++v15;
        }
        while (v11 != v15);
        v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v11 = v24;
      }
      while (v24);
    }

    objc_msgSend(v9, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currencyCode");
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      PKCurrencyAmountCreate(v8, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    v7 = v29;

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)_totalPaymentsFromTransactions:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  NSDecimalNumber *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  char v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  unint64_t v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSString *v28;
  void *v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32 = a5;
  if (!objc_msgSend(v7, "count"))
  {
    v29 = 0;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v31 = v7;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v11)
    goto LABEL_31;
  v12 = v11;
  v13 = *(_QWORD *)v34;
  if (v8)
    v14 = v32 == 0;
  else
    v14 = 1;
  v15 = !v14;
  v16 = v15 ^ 1;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v34 != v13)
        objc_enumerationMutation(v10);
      v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      v19 = objc_msgSend(v18, "transactionType", v31);
      if (v19 == 10 || v19 == 0)
      {
        v21 = objc_msgSend(v18, "transactionStatus");
        if (v21 > 1)
          v22 = 1;
        else
          v22 = v16;
        if ((v22 & 1) != 0)
        {
          if (v21 > 1)
            continue;
LABEL_26:
          objc_msgSend(v18, "amount");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "pk_absoluteValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            -[NSDecimalNumber decimalNumberByAdding:](v9, "decimalNumberByAdding:", v23);
            v26 = objc_claimAutoreleasedReturnValue();

            v9 = (NSDecimalNumber *)v26;
          }
LABEL_28:

          continue;
        }
        objc_msgSend(v18, "transactionDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "compare:", v8) == -1)
          goto LABEL_28;
        v24 = objc_msgSend(v23, "compare:", v32);

        if (v24 != 1)
          goto LABEL_26;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v12);
LABEL_31:

  objc_msgSend(v10, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "currencyCode");
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v9, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v31;
LABEL_33:

  return v29;
}

- (id)_totalRewardsFromTransactions:(id)a3
{
  id v3;
  NSDecimalNumber *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    v17 = 0;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v6)
    goto LABEL_18;
  v7 = v6;
  v8 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      if (objc_msgSend(v10, "transactionType", (_QWORD)v19) == 8)
      {
        objc_msgSend(v10, "amount");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (!objc_msgSend(v10, "transactionType"))
      {
        objc_msgSend(v10, "rewardsTotalAmount");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
        v13 = v11;
        objc_msgSend(v11, "pk_absoluteValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          continue;
LABEL_15:
        -[NSDecimalNumber decimalNumberByAdding:](v4, "decimalNumberByAdding:", v12);
        v14 = objc_claimAutoreleasedReturnValue();

        v4 = (NSDecimalNumber *)v14;
        continue;
      }
      if (objc_msgSend(v10, "transactionType") == 14)
      {
        objc_msgSend(v10, "rewardsTotalAmount");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_15;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v7);
LABEL_18:

  objc_msgSend(v5, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currencyCode");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v17;
}

- (id)_totalDailyCashRewardsFromTransactions:(id)a3
{
  id v3;
  NSDecimalNumber *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "rewardsTotalAmount", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            -[NSDecimalNumber decimalNumberByAdding:](v4, "decimalNumberByAdding:", v10);
            v11 = objc_claimAutoreleasedReturnValue();

            v4 = (NSDecimalNumber *)v11;
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v5, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currencyCode");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_totalFromGroups:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v28 = 0;
    goto LABEL_38;
  }
  v31 = v6;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v30 = v3;
  v7 = v3;
  v38 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (!v38)
    goto LABEL_36;
  v37 = *(_QWORD *)v48;
  v34 = v7;
  do
  {
    for (i = 0; i != v38; ++i)
    {
      if (*(_QWORD *)v48 != v37)
        objc_enumerationMutation(v7);
      v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      if (objc_msgSend(v9, "type") == 13)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend(v9, "regions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v35)
        {
          v11 = *(_QWORD *)v44;
          v33 = *(_QWORD *)v44;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v44 != v11)
                objc_enumerationMutation(v10);
              v36 = v12;
              v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
              v39 = 0u;
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v14 = v7;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v40;
                while (2)
                {
                  for (j = 0; j != v16; ++j)
                  {
                    if (*(_QWORD *)v40 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                    if (v19 != v9)
                    {
                      objc_msgSend(v19, "regions");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      v21 = objc_msgSend(v13, "isIncludedInRegions:", v20);

                      if ((v21 & 1) != 0)
                      {
                        v7 = v34;
                        goto LABEL_33;
                      }
                    }
                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
                  if (v16)
                    continue;
                  break;
                }
              }

              v12 = v36 + 1;
              v11 = v33;
              v7 = v34;
            }
            while (v36 + 1 != v35);
            v35 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          }
          while (v35);
        }

      }
      objc_msgSend(v9, "totalAmount");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v22;
      if (v22)
      {
        objc_msgSend(v22, "currency");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v31;
        v24 = v23;
        if (v14 == v24)
        {

LABEL_32:
          objc_msgSend(v10, "amount");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "decimalNumberByAdding:", v14);
          v27 = objc_claimAutoreleasedReturnValue();

          v32 = (void *)v27;
LABEL_33:

          goto LABEL_34;
        }
        v25 = v24;
        if (!v24)
          goto LABEL_33;
        v26 = objc_msgSend(v14, "isEqualToString:", v24);

        if (v26)
          goto LABEL_32;
      }
LABEL_34:

    }
    v38 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  }
  while (v38);
LABEL_36:

  v6 = v31;
  PKCurrencyAmountMake();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v30;
LABEL_38:

  return v28;
}

- (void)_p2pTotalsFromTransactions:(id)a3 received:(id *)a4 sent:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  id *v34;
  id *v35;
  void *context;
  void *v37;
  void *v38;
  uint8_t buf[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  if (a5 || a4 || v8)
  {
    v34 = a4;
    v35 = a5;
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currencyCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    context = (void *)MEMORY[0x1A1AE621C]();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
LABEL_6:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v15);
        if (objc_msgSend(v16, "transactionType") != 3)
          goto LABEL_27;
        objc_msgSend(v16, "currencyCode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v10;
        v19 = v17;
        if (v18 == v19)
        {

        }
        else
        {
          v20 = v19;
          if (!v10 || !v19)
          {

LABEL_34:
            PKLogFacilityTypeGetObject();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D178000, v33, OS_LOG_TYPE_DEFAULT, "Found different currency codes in p2p transactions.", buf, 2u);
            }

            objc_autoreleasePoolPop(context);
            v30 = v37;
            v27 = v38;
            goto LABEL_37;
          }
          v21 = objc_msgSend(v18, "isEqualToString:", v19);

          if ((v21 & 1) == 0)
            goto LABEL_34;
        }
        objc_msgSend(v16, "subtotalAmount");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = v22;
          if ((objc_msgSend(v22, "pk_isNotANumber") & 1) != 0 || objc_msgSend(v16, "transactionStatus") != 1)
          {
            v24 = v23;
          }
          else
          {
            objc_msgSend(v23, "pk_absoluteValue");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = objc_msgSend(v16, "peerPaymentType");
            if (v25 == 2)
            {
              v26 = v38;
              objc_msgSend(v38, "decimalNumberByAdding:", v24);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_25;
            }
            if (v25 == 1)
            {
              v26 = v37;
              objc_msgSend(v37, "decimalNumberByAdding:", v24);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

            }
          }
        }
        else
        {
          v24 = 0;
        }

LABEL_27:
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          if (v13)
            goto LABEL_6;
          break;
        }
      }
    }

    objc_autoreleasePoolPop(context);
    v27 = v38;
    if (v34)
    {
      PKCurrencyAmountMake();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *v34;
      *v34 = (id)v28;

    }
    v30 = v37;
    if (v35)
    {
      PKCurrencyAmountMake();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *v35;
      *v35 = (id)v31;

    }
LABEL_37:

  }
}

- (id)_transactionItemForTransaction:(id)a3
{
  PKPaymentTransactionGroup *group;
  id v5;
  PKTransactionSourceCollection *v6;
  PKTransactionSourceCollection *v7;
  PKDashboardPaymentTransactionItem *v8;
  void *v9;
  NSMutableDictionary *sourcesPerFundingSourceIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  group = self->_group;
  v5 = a3;
  if (-[PKPaymentTransactionGroup type](group, "type") == 5)
  {
    -[PKDashboardTransactionFetcher cashbackTransactionSourceCollection](self->_transactionFetcher, "cashbackTransactionSourceCollection");
    v6 = (PKTransactionSourceCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_transactionSourceCollection;
  }
  v7 = v6;
  v8 = -[PKDashboardPaymentTransactionItem initWithTransactionSourceCollection:familyCollection:transaction:account:accountUserCollection:bankConnectInstitution:]([PKDashboardPaymentTransactionItem alloc], "initWithTransactionSourceCollection:familyCollection:transaction:account:accountUserCollection:bankConnectInstitution:", v6, self->_familyCollection, v5, self->_account, self->_accountUserCollection, self->_bankConnectInstitution);
  -[PKDashboardPaymentTransactionItem setPhysicalCards:](v8, "setPhysicalCards:", self->_physicalCards);
  objc_msgSend(v5, "secondaryFundingSourceFPANIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    sourcesPerFundingSourceIdentifier = self->_sourcesPerFundingSourceIdentifier;
    if (!sourcesPerFundingSourceIdentifier)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = self->_sourcesPerFundingSourceIdentifier;
      self->_sourcesPerFundingSourceIdentifier = v11;

      sourcesPerFundingSourceIdentifier = self->_sourcesPerFundingSourceIdentifier;
    }
    -[NSMutableDictionary objectForKey:](sourcesPerFundingSourceIdentifier, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "passWithFPANIdentifier:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", v15);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v13 = (void *)v16;
      -[NSMutableDictionary setObject:forKey:](self->_sourcesPerFundingSourceIdentifier, "setObject:forKey:", v16, v9);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PKDashboardPaymentTransactionItem setSecondaryTransactionSource:](v8, "setSecondaryTransactionSource:", v13);

  }
  return v8;
}

- (id)_groupItemForTransaction:(id)a3
{
  id v4;
  PKDashboardPaymentTransactionGroupItem *v5;

  v4 = a3;
  v5 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
  -[PKDashboardPaymentTransactionGroupItem setTransactionSourceCollection:](v5, "setTransactionSourceCollection:", self->_transactionSourceCollection);
  -[PKDashboardPaymentTransactionGroupItem setFamilyCollection:](v5, "setFamilyCollection:", self->_familyCollection);
  -[PKDashboardPaymentTransactionGroupItem setAccount:](v5, "setAccount:", self->_account);
  -[PKDashboardPaymentTransactionGroupItem setAccountUserCollection:](v5, "setAccountUserCollection:", self->_accountUserCollection);
  -[PKDashboardPaymentTransactionGroupItem setPhysicalCards:](v5, "setPhysicalCards:", self->_physicalCards);
  -[PKDashboardPaymentTransactionGroupItem setGroup:](v5, "setGroup:", v4);

  -[PKDashboardPaymentTransactionGroupItem setTokens:](v5, "setTokens:", self->_tokens);
  return v5;
}

- (id)_headerItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKTransactionHistoryHeaderItem *v13;
  void *v14;
  void *v15;
  void *v16;
  PKAccount *account;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;

  switch(self->_type)
  {
    case 0uLL:
      v13 = -[PKTransactionHistoryHeaderItem initWithType:]([PKTransactionHistoryHeaderItem alloc], "initWithType:", 1);
      -[PKDashboardTransactionFetcher counterpartHandles](self->_transactionFetcher, "counterpartHandles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "anyObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransactionHistoryHeaderItem setPeerPaymentCounterpartHandle:](v13, "setPeerPaymentCounterpartHandle:", v15);

      -[PKTransactionHistoryHeaderItem setContact:](v13, "setContact:", self->_contact);
      return v13;
    case 1uLL:
      v13 = -[PKTransactionHistoryHeaderItem initWithType:]([PKTransactionHistoryHeaderItem alloc], "initWithType:", 0);
      -[PKTransactionHistoryHeaderItem setMerchant:](v13, "setMerchant:", self->_merchant);
      if (!self->_featuredTransaction)
      {
        -[PKPaymentTransactionGroup transactions](self->_selectedTransactions, "transactions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransactionHistoryHeaderItem setTransaction:](v13, "setTransaction:", v23);

        goto LABEL_23;
      }
      -[PKTransactionHistoryHeaderItem setTransaction:](v13, "setTransaction:");
      return v13;
    case 2uLL:
    case 4uLL:
      if (-[PKPaymentTransactionGroup type](self->_group, "type") == 14)
      {
        -[PKPaymentTransactionGroup searchQuery](self->_group, "searchQuery");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "tokens");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "count");

        -[PKPaymentTransactionGroup searchQuery](self->_group, "searchQuery");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "merchantToken");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "group");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "merchant");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaymentTransactionGroup searchQuery](self->_group, "searchQuery");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "peerPaymentToken");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "group");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5 == 1 && v9)
        {
          v13 = -[PKTransactionHistoryHeaderItem initWithType:]([PKTransactionHistoryHeaderItem alloc], "initWithType:", 0);
          -[PKTransactionHistoryHeaderItem setMerchant:](v13, "setMerchant:", v9);
LABEL_21:

          return v13;
        }
        if (v5 == 1 && v12)
        {
          v13 = -[PKTransactionHistoryHeaderItem initWithType:]([PKTransactionHistoryHeaderItem alloc], "initWithType:", 1);
          objc_msgSend(v12, "handles");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "anyObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTransactionHistoryHeaderItem setPeerPaymentCounterpartHandle:](v13, "setPeerPaymentCounterpartHandle:", v20);

          -[PKTransactionHistoryHeaderItem setContact:](v13, "setContact:", self->_contact);
          goto LABEL_21;
        }
      }
      else
      {
        v12 = 0;
        v9 = 0;
      }
      v13 = -[PKTransactionHistoryHeaderItem initWithType:]([PKTransactionHistoryHeaderItem alloc], "initWithType:", 2);
      -[PKTransactionHistoryHeaderItem setTransactionGroup:](v13, "setTransactionGroup:", self->_group);
      account = self->_account;
      if (account)
      {
        v18 = -[PKAccount feature](account, "feature");
      }
      else
      {
        -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "hasAssociatedPeerPaymentAccount");

        if (!v22)
        {
LABEL_20:
          -[PKTransactionHistoryHeaderItem setHistoryCount:](v13, "setHistoryCount:", -[PKPaymentTransactionGroup transactionCount](self->_group, "transactionCount")+ -[NSArray count](self->_transactionHistory, "count"));
          goto LABEL_21;
        }
        v18 = 1;
      }
      -[PKTransactionHistoryHeaderItem setFeatureIdentifier:](v13, "setFeatureIdentifier:", v18);
      goto LABEL_20;
    case 3uLL:
      v13 = -[PKTransactionHistoryHeaderItem initWithType:]([PKTransactionHistoryHeaderItem alloc], "initWithType:", 4);
      -[PKCreditInstallmentPlan product](self->_associatedInstallmentPlan, "product");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransactionHistoryHeaderItem setInstallmentProduct:](v13, "setInstallmentProduct:", v16);
LABEL_23:

      return v13;
    default:
      v13 = 0;
      return v13;
  }
}

- (void)_loadContact
{
  void *v3;
  CNContact *v5;
  CNContact *v6;
  void *v7;
  CNContact *v8;
  CNContact *contact;
  PKPeerPaymentCounterpartImageResolver *peerPaymentImageResolver;
  id *v11;
  PKContactResolver *contactResolver;
  NSString *peerPaymentCounterpartHandle;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  -[PKPaymentTransaction peerPaymentCounterpartImageRecordIdentifier](self->_featuredTransaction, "peerPaymentCounterpartImageRecordIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentTransaction peerPaymentPaymentMode](self->_featuredTransaction, "peerPaymentPaymentMode") == 2
    && v3 != 0)
  {
    if (-[PKPeerPaymentCounterpartImageResolver hasCachedImageDataForIdentifier:](self->_peerPaymentImageResolver, "hasCachedImageDataForIdentifier:", v3))
    {
      -[PKPeerPaymentCounterpartImageResolver counterpartImageDataForIdentifier:](self->_peerPaymentImageResolver, "counterpartImageDataForIdentifier:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (CNContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
      -[CNContact setImageData:](v8, "setImageData:", v7);
      contact = self->_contact;
      self->_contact = v8;

      self->_contactLoaded = 1;
      -[PKTransactionHistoryDataSource _notifyContentLoadedIfNecessary](self, "_notifyContentLoadedIfNecessary");

      goto LABEL_14;
    }
    objc_initWeak(&location, self);
    peerPaymentImageResolver = self->_peerPaymentImageResolver;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46__PKTransactionHistoryDataSource__loadContact__block_invoke;
    v16[3] = &unk_1E3E784E8;
    v11 = &v17;
    objc_copyWeak(&v17, &location);
    -[PKPeerPaymentCounterpartImageResolver counterpartImageDataForIdentifier:completion:](peerPaymentImageResolver, "counterpartImageDataForIdentifier:completion:", v3, v16);
LABEL_13:
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  if (self->_peerPaymentCounterpartHandle)
  {
    if (!-[PKContactResolver hasCachedResultForHandle:](self->_contactResolver, "hasCachedResultForHandle:"))
    {
      objc_initWeak(&location, self);
      contactResolver = self->_contactResolver;
      peerPaymentCounterpartHandle = self->_peerPaymentCounterpartHandle;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __46__PKTransactionHistoryDataSource__loadContact__block_invoke_3;
      v14[3] = &unk_1E3E78510;
      v11 = &v15;
      objc_copyWeak(&v15, &location);
      -[PKContactResolver contactForHandle:withCompletion:](contactResolver, "contactForHandle:withCompletion:", peerPaymentCounterpartHandle, v14);
      goto LABEL_13;
    }
    -[PKContactResolver contactForHandle:](self->_contactResolver, "contactForHandle:", self->_peerPaymentCounterpartHandle);
    v5 = (CNContact *)objc_claimAutoreleasedReturnValue();
    v6 = self->_contact;
    self->_contact = v5;

    self->_contactLoaded = 1;
    -[PKTransactionHistoryDataSource _notifyContentLoadedIfNecessary](self, "_notifyContentLoadedIfNecessary");
  }
LABEL_14:

}

void __46__PKTransactionHistoryDataSource__loadContact__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PKTransactionHistoryDataSource__loadContact__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __46__PKTransactionHistoryDataSource__loadContact__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  id v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C97360]);
      objc_msgSend(v3, "setImageData:", *(_QWORD *)(a1 + 32));
      v4 = (void *)v5[36];
      v5[36] = v3;

      WeakRetained = v5;
    }
    WeakRetained[177] = 1;
    objc_msgSend(v5, "_notifyContentLoadedIfNecessary");
    WeakRetained = v5;
  }

}

void __46__PKTransactionHistoryDataSource__loadContact__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PKTransactionHistoryDataSource__loadContact__block_invoke_4;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __46__PKTransactionHistoryDataSource__loadContact__block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 36, *(id *)(a1 + 32));
    *((_BYTE *)v3 + 177) = 1;
    objc_msgSend(v3, "_notifyContentLoadedIfNecessary");
    WeakRetained = v3;
  }

}

- (void)_loadTransactionReceipt
{
  void *v3;
  PKPaymentDataProvider *dataProvider;
  _QWORD v5[5];

  -[PKPaymentTransaction associatedReceiptUniqueID](self->_featuredTransaction, "associatedReceiptUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    dataProvider = self->_dataProvider;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__PKTransactionHistoryDataSource__loadTransactionReceipt__block_invoke;
    v5[3] = &unk_1E3E702E8;
    v5[4] = self;
    -[PKPaymentDataProvider transactionReceiptWithUniqueID:completion:](dataProvider, "transactionReceiptWithUniqueID:completion:", v3, v5);
  }
  else
  {
    self->_associatedReceiptLoaded = 1;
    -[PKTransactionHistoryDataSource _notifyContentLoadedIfNecessary](self, "_notifyContentLoadedIfNecessary");
  }

}

void __57__PKTransactionHistoryDataSource__loadTransactionReceipt__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PKTransactionHistoryDataSource__loadTransactionReceipt__block_invoke_2;
  v6[3] = &unk_1E3E61388;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __57__PKTransactionHistoryDataSource__loadTransactionReceipt__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "lineItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 80), *(id *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 179) = 1;
  return objc_msgSend(*(id *)(a1 + 40), "_notifyContentLoadedIfNecessary");
}

- (void)_reloadTransactions
{
  PKDashboardTransactionFetcher *transactionFetcher;
  _QWORD v3[5];

  transactionFetcher = self->_transactionFetcher;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__PKTransactionHistoryDataSource__reloadTransactions__block_invoke;
  v3[3] = &unk_1E3E61E98;
  v3[4] = self;
  -[PKDashboardTransactionFetcher reloadTransactionsWithCompletion:](transactionFetcher, "reloadTransactionsWithCompletion:", v3);
}

void __53__PKTransactionHistoryDataSource__reloadTransactions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PKTransactionHistoryDataSource__reloadTransactions__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __53__PKTransactionHistoryDataSource__reloadTransactions__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 178) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_handleTransactionHistoryUpdated:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyContentLoadedIfNecessary
{
  id WeakRetained;

  if (!self->_contentIsLoaded)
  {
    switch(self->_type)
    {
      case 0uLL:
      case 2uLL:
      case 4uLL:
        if (self->_contactLoaded)
          goto LABEL_5;
        break;
      case 1uLL:
        if (self->_transactionHistoryLoaded && self->_associatedReceiptLoaded)
          goto LABEL_6;
        break;
      case 3uLL:
LABEL_5:
        if (self->_transactionHistoryLoaded)
        {
LABEL_6:
          self->_contentIsLoaded = 1;
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "contentIsLoaded");

        }
        break;
      default:
        return;
    }
  }
}

- (BOOL)isListLayoutForSection:(unint64_t)a3
{
  return a3 == 5;
}

- (BOOL)canDeleteItem:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "transaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDeletable");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)deleteItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_customDelegate);
  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "transaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained && v9 && v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__PKTransactionHistoryDataSource_deleteItem_completionHandler___block_invoke;
    v11[3] = &unk_1E3E6CB88;
    v14 = v6;
    v11[4] = self;
    v12 = v10;
    v13 = v9;
    objc_msgSend(WeakRetained, "presentActivityDeletionConfirmationWithCompletion:", v11);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __63__PKTransactionHistoryDataSource_deleteItem_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  if ((a2 & 1) != 0
    && (v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "indexOfObject:", *(_QWORD *)(a1 + 40)),
        v3 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v5 = v3;
    v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "mutableCopy");
    objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 40));
    v7 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__PKTransactionHistoryDataSource_deleteItem_completionHandler___block_invoke_2;
    v13[3] = &unk_1E3E664B0;
    v13[4] = *(_QWORD *)(a1 + 32);
    v12 = v6;
    v14 = v12;
    v16 = v5;
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v7, "performBatchUpdates:completion:", v13, 0);
    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deletePaymentTransactionWithIdentifier:", v11);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
}

void __63__PKTransactionHistoryDataSource_deleteItem_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 184);
  *(_QWORD *)(v3 + 184) = v2;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 56), 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteItemsAtIndexPaths:", v7);

}

- (void)deleteItems:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSArray *transactionHistory;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = (void *)-[NSArray mutableCopy](self->_transactionHistory, "mutableCopy");
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "transaction");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "addObject:", v13);
          transactionHistory = self->_transactionHistory;
          objc_msgSend(v11, "transaction");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[NSArray indexOfObject:](transactionHistory, "indexOfObject:", v15);

          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, 5);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v17);

          }
          objc_msgSend(v11, "transaction", v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObject:", v18);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }
  v19 = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __46__PKTransactionHistoryDataSource_deleteItems___block_invoke;
  v26[3] = &unk_1E3E61400;
  v26[4] = self;
  v27 = v24;
  v28 = v23;
  v21 = v23;
  v22 = v24;
  objc_msgSend(WeakRetained, "performBatchUpdates:completion:", v26, 0);

  -[PKPaymentDataProvider deletePaymentTransactionsWithIdentifiers:](self->_dataProvider, "deletePaymentTransactionsWithIdentifiers:", v25);
}

void __46__PKTransactionHistoryDataSource_deleteItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 184);
  *(_QWORD *)(v3 + 184) = v2;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "deleteItemsAtIndexPaths:", *(_QWORD *)(a1 + 48));

}

- (void)_handleTransactionHistoryUpdated:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  PKPaymentTransaction *v9;
  PKPaymentTransaction *featuredTransaction;
  PKPaymentTransaction *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  PKCreditInstallmentPlan *v17;
  PKCreditInstallmentPlan *associatedInstallmentPlan;
  PKDashboardTextActionItem *v19;
  void *v20;
  NSArray *v21;
  NSArray *featuredTransactionActions;
  PKPaymentTransactionGroup *selectedTransactions;
  void *v24;
  void *v25;
  char v26;
  unint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  PKPaymentTransactionGroup *v32;
  void *v33;
  unint64_t type;
  uint64_t v35;
  PKPaymentTransaction *v36;
  PKPaymentTransaction *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  char v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  PKDashboardTransactionFetcher *transactionFetcher;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  PKPaymentTransactionGroup *group;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  PKPaymentTransactionGroup *v90;
  void *v91;
  uint64_t v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  _QWORD block[4];
  id v102;
  PKTransactionHistoryDataSource *v103;
  id v104;
  id v105;
  char v106;
  char v107;
  char v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  _QWORD v114[4];
  id v115;
  _QWORD v116[4];
  id v117;
  id location;
  _QWORD v119[4];
  id v120;
  _QWORD v121[5];
  _BYTE v122[128];
  _QWORD v123[3];

  v123[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = MEMORY[0x1E0C809B0];
  v7 = &unk_19DF14000;
  if (self->_featuredTransaction)
  {
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke;
    v121[3] = &unk_1E3E65038;
    v121[4] = self;
    v8 = objc_msgSend(v4, "indexOfObjectPassingTest:", v121);
    HIDWORD(v100) = v8 != 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v5, "objectAtIndex:", v8);
      v9 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
      featuredTransaction = self->_featuredTransaction;
      self->_featuredTransaction = v9;

    }
    v11 = self->_featuredTransaction;
  }
  else
  {
    v11 = 0;
    HIDWORD(v100) = 0;
  }
  if (-[PKPaymentTransaction transactionType](v11, "transactionType") == 13
    || !-[PKPaymentTransaction transactionType](self->_featuredTransaction, "transactionType"))
  {
    -[PKPaymentTransaction referenceIdentifier](self->_featuredTransaction, "referenceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "installmentPlans");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_2;
    v119[3] = &unk_1E3E78538;
    v15 = v12;
    v120 = v15;
    objc_msgSend(v14, "objectsPassingTest:", v119);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count") == 1)
    {
      objc_msgSend(v16, "anyObject");
      v17 = (PKCreditInstallmentPlan *)objc_claimAutoreleasedReturnValue();
      associatedInstallmentPlan = self->_associatedInstallmentPlan;
      self->_associatedInstallmentPlan = v17;

    }
    if (self->_associatedInstallmentPlan)
    {
      v19 = objc_alloc_init(PKDashboardTextActionItem);
      -[PKDashboardTextActionItem setLayoutStyle:](v19, "setLayoutStyle:", 0);
      PKLocalizedBeekmanString(CFSTR("VIEW_INSTALLMENT_DETAILS_BUTTON"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardTextActionItem setTitle:](v19, "setTitle:", v20);

      objc_initWeak(&location, self);
      v116[0] = MEMORY[0x1E0C809B0];
      v116[1] = 3221225472;
      v116[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_3;
      v116[3] = &unk_1E3E78560;
      objc_copyWeak(&v117, &location);
      -[PKDashboardTextActionItem setAction:](v19, "setAction:", v116);
      v123[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 1);
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
      featuredTransactionActions = self->_featuredTransactionActions;
      self->_featuredTransactionActions = v21;

      objc_destroyWeak(&v117);
      objc_destroyWeak(&location);

    }
    v6 = MEMORY[0x1E0C809B0];
    v7 = (_QWORD *)&unk_19DF14000;
  }
  selectedTransactions = self->_selectedTransactions;
  if (selectedTransactions)
  {
    -[PKPaymentTransactionGroup transactions](selectedTransactions, "transactions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    if (!objc_msgSend(v25, "count"))
      goto LABEL_20;
    v26 = 0;
    v27 = 0;
    do
    {
      objc_msgSend(v25, "objectAtIndex:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_4;
      v114[3] = &unk_1E3E65038;
      v29 = v28;
      v115 = v29;
      v30 = objc_msgSend(v5, "indexOfObjectPassingTest:", v114);
      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "objectAtIndex:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "replaceObjectAtIndex:withObject:", v27, v31);

        v26 = 1;
      }

      ++v27;
    }
    while (v27 < objc_msgSend(v25, "count"));
    if ((v26 & 1) != 0)
    {
      v32 = self->_selectedTransactions;
      v33 = (void *)objc_msgSend(v25, "copy");
      -[PKPaymentTransactionGroup setTransactions:](v32, "setTransactions:", v33);

      LODWORD(v100) = 1;
    }
    else
    {
LABEL_20:
      LODWORD(v100) = 0;
    }

    v6 = MEMORY[0x1E0C809B0];
    v7 = &unk_19DF14000;
  }
  else
  {
    LODWORD(v100) = 0;
  }
  type = self->_type;
  if (type == 2)
  {
    switch(-[PKPaymentTransactionGroup type](self->_selectedTransactions, "type"))
    {
      case 2:
      case 3:
        -[PKTransactionHistoryDataSource _totalSpendingFromTransactions:startDate:endDate:](self, "_totalSpendingFromTransactions:startDate:endDate:", v5, 0, 0);
        v42 = objc_claimAutoreleasedReturnValue();
        goto LABEL_40;
      case 5:
        v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        v52 = v5;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        if (v53)
        {
          v54 = *(_QWORD *)v110;
          do
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v110 != v54)
                objc_enumerationMutation(v52);
              v56 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
              if (objc_msgSend(v56, "transactionType", v100) == 9)
              {
                transactionFetcher = self->_transactionFetcher;
                objc_msgSend(v56, "identifier");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKDashboardTransactionFetcher cashbackGroupForTransactionWithIdentifier:cashbackTransactionSourceCollection:](transactionFetcher, "cashbackGroupForTransactionWithIdentifier:cashbackTransactionSourceCollection:", v58, 0);
                v59 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v59, "transactions");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "addObjectsFromArray:", v60);

              }
            }
            v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
          }
          while (v53);
        }

        -[PKPaymentTransactionGroup totalAmount](self->_group, "totalAmount");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)objc_msgSend(v51, "copy");

        -[PKTransactionHistoryDataSource _totalRewardsFromTransactions:](self, "_totalRewardsFromTransactions:", v5);
        v44 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_37;
      case 7:
        v61 = -[PKAccount feature](self->_account, "feature");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61 == 5)
        {
          -[PKAccount savingsDetails](self->_account, "savingsDetails");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          PKStartOfYear();
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTransactionHistoryDataSource _totalSpendingFromTransactions:startDate:endDate:](self, "_totalSpendingFromTransactions:startDate:endDate:", v5, v84, v62);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "createdDate");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTransactionHistoryDataSource _totalSpendingFromTransactions:startDate:endDate:](self, "_totalSpendingFromTransactions:startDate:endDate:", v5, v85, v62);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          if ((PKEqualObjects() & 1) != 0
            || (objc_msgSend(v86, "amount"),
                v87 = (void *)objc_claimAutoreleasedReturnValue(),
                v88 = objc_msgSend(v87, "pk_isPositiveNumber"),
                v87,
                !v88))
          {
            v44 = 0;
          }
          else
          {
            v44 = v86;
          }

          v43 = 1;
        }
        else
        {
          if (v61 != 2)
          {
            v43 = 0;
            v44 = 0;
            v49 = 0;
            goto LABEL_75;
          }
          PKStartOfYear();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTransactionHistoryDataSource _totalSpendingFromTransactions:startDate:endDate:](self, "_totalSpendingFromTransactions:startDate:endDate:", v5, v63, v62);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v44 = 0;
        }

LABEL_75:
        goto LABEL_76;
      case 9:
        -[PKPaymentTransactionGroup transactions](self->_selectedTransactions, "transactions");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "firstObject");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "transactionDate");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "components:fromDate:", 14, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "date:matchesComponents:", v66, v69);
        PKStartOfMonth();
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        PKStartOfNextMonth();
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "dateByAddingTimeInterval:", -1.0);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransactionHistoryDataSource _totalPaymentsFromTransactions:startDate:endDate:](self, "_totalPaymentsFromTransactions:startDate:endDate:", v5, v77, v79);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_62;
      default:
        -[PKPaymentTransactionGroup totalAmount](self->_selectedTransactions, "totalAmount");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          -[PKPaymentTransactionGroup totalAmount](self->_selectedTransactions, "totalAmount");
          v42 = objc_claimAutoreleasedReturnValue();
LABEL_40:
          v49 = (void *)v42;
        }
        else
        {
          v80 = objc_msgSend(v5, "count");
          group = self->_group;
          if (v80)
          {
            -[PKPaymentTransactionGroup startDate](group, "startDate");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentTransactionGroup endDate](self->_group, "endDate");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKTransactionHistoryDataSource _totalSpendingFromTransactions:startDate:endDate:](self, "_totalSpendingFromTransactions:startDate:endDate:", v5, v82, v83);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            -[PKPaymentTransactionGroup transactions](group, "transactions");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = (id)objc_msgSend(v96, "count");

            if (!v44)
            {
              v43 = 0;
              goto LABEL_33;
            }
            -[PKPaymentTransactionGroup transactions](self->_group, "transactions");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentTransactionGroup startDate](self->_group, "startDate");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentTransactionGroup endDate](self->_group, "endDate");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKTransactionHistoryDataSource _totalSpendingFromTransactions:startDate:endDate:](self, "_totalSpendingFromTransactions:startDate:endDate:", v97, v98, v99);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
LABEL_62:
        v43 = 0;
        v44 = 0;
        goto LABEL_76;
    }
  }
  if (type != 1)
  {
    v43 = 0;
    v44 = 0;
LABEL_33:
    v49 = 0;
    goto LABEL_76;
  }
  if (self->_featuredTransaction)
  {
    v113[0] = v6;
    v113[1] = v7[249];
    v113[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_5;
    v113[3] = &unk_1E3E65038;
    v113[4] = self;
    v35 = objc_msgSend(v5, "indexOfObjectPassingTest:", v113);
    if (v35 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v5, "objectAtIndex:", v35);
      v36 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
      v37 = self->_featuredTransaction;
      self->_featuredTransaction = v36;

    }
    -[PKPaymentTransaction transactionDate](self->_featuredTransaction, "transactionDate", v35, v100);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "components:fromDate:", 14, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "date:matchesComponents:", v38, v41);
    PKStartOfMonth();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    PKStartOfNextMonth();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "dateByAddingTimeInterval:", -1.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryDataSource _totalSpendingFromTransactions:startDate:endDate:](self, "_totalSpendingFromTransactions:startDate:endDate:", v5, v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKPaymentTransactionGroup totalAmount](self->_selectedTransactions, "totalAmount");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      -[PKPaymentTransactionGroup totalAmount](self->_selectedTransactions, "totalAmount");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (v5)
    {
      objc_msgSend(v5, "lastObject");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "transactionDate");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "firstObject");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "transactionDate");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = 0;
      if (v71 && v73)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v73, "compare:", v74) == -1)
          v75 = v74;
        else
          v75 = v73;
        v76 = v75;

        -[PKTransactionHistoryDataSource _totalSpendingFromTransactions:startDate:endDate:](self, "_totalSpendingFromTransactions:startDate:endDate:", v5, v71, v76);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v76 = v73;
      }

    }
    else
    {
      v49 = 0;
    }
  }
  -[PKTransactionHistoryDataSource _totalDailyCashRewardsFromTransactions:](self, "_totalDailyCashRewardsFromTransactions:", v5, v100);
  v44 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:
  v43 = 0;
LABEL_76:
  if (self->_featuredTransaction)
  {
    objc_msgSend(v5, "pk_arrayByRemovingObject:");
    v89 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v89;
  }
  v90 = self->_selectedTransactions;
  if (v90)
  {
    -[PKPaymentTransactionGroup transactions](v90, "transactions");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pk_arrayByRemovingObjectsInArray:", v91);
    v92 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v92;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_6;
  block[3] = &unk_1E3E78588;
  v102 = v5;
  v103 = self;
  v104 = v49;
  v105 = v44;
  v106 = BYTE4(v100);
  v107 = v100;
  v108 = v43;
  v93 = v44;
  v94 = v49;
  v95 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {
    v11 = 1;
  }
  else
  {
    v11 = 0;
    if (v8 && v9)
      v11 = objc_msgSend(v8, "isEqualToString:", v9);
  }

  if ((_DWORD)v11)
    *a4 = 1;
  return v11;
}

uint64_t __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transactionReferenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v6;
}

void __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  PKTransactionHistoryViewController *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = -[PKTransactionHistoryViewController initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:]([PKTransactionHistoryViewController alloc], "initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", WeakRetained[9], WeakRetained[1], WeakRetained[17], WeakRetained[28], WeakRetained[29], WeakRetained[30]);
    objc_msgSend(v7, "pkui_viewControllerFromResponderChain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v4, 1);

  }
}

uint64_t __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {
    v11 = 1;
  }
  else
  {
    v11 = 0;
    if (v8 && v9)
      v11 = objc_msgSend(v8, "isEqualToString:", v9);
  }

  if ((_DWORD)v11)
    *a4 = 1;
  return v11;
}

uint64_t __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {
    v11 = 1;
  }
  else
  {
    v11 = 0;
    if (v8 && v9)
      v11 = objc_msgSend(v8, "isEqualToString:", v9);
  }

  if ((_DWORD)v11)
    *a4 = 1;
  return v11;
}

void __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_6(uint64_t a1)
{
  id *v2;
  char v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "isEqualToArray:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184));
  objc_storeStrong((id *)*v2 + 39, v2[1]);
  objc_storeStrong((id *)*v2 + 40, *(id *)(a1 + 56));
  if (*((_BYTE *)*v2 + 176))
  {
    if (PKBankConnectEnabled()
      && objc_msgSend(*(id *)(a1 + 32), "count")
      && (objc_msgSend(*(id *)(a1 + 32), "firstObject"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isBankConnectTransaction"),
          v4,
          v5))
    {
      +[PKCollectionViewItemsDiffCalculator calculateDiffBetweenOldItems:andNewItems:inSection:](PKCollectionViewItemsDiffCalculator, "calculateDiffBetweenOldItems:andNewItems:inSection:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184), *(_QWORD *)(a1 + 32), 5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "deletedIndexPaths");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");
        objc_msgSend(v6, "insertedIndexPaths");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        objc_msgSend(v6, "movedFromIndexPaths");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");
        objc_msgSend(v6, "changedIndexPaths");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218752;
        v35 = v9;
        v36 = 2048;
        v37 = v11;
        v38 = 2048;
        v39 = v13;
        v40 = 2048;
        v41 = objc_msgSend(v14, "count");
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Bank Connect history transactions batch updates: %ld deletions, %ld insertions, %ld moves, %ld updates", buf, 0x2Au);

      }
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_188;
      v29[3] = &unk_1E3E65CC0;
      objc_copyWeak(&v33, (id *)buf);
      v16 = *(id *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v30 = v16;
      v31 = v17;
      v18 = v6;
      v32 = v18;
      objc_msgSend(WeakRetained, "performBatchUpdates:completion:", v29, 0);

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v19 = objc_msgSend(*(id *)(a1 + 32), "copy");
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(void **)(v20 + 184);
      *(_QWORD *)(v20 + 184) = v19;

      v28 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      if ((v3 & 1) == 0)
        objc_msgSend(v28, "addIndex:", 5);
      v22 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v22 + 56) && *(_BYTE *)(a1 + 64))
      {
        objc_msgSend(v28, "addIndex:", 1);
        v22 = *(_QWORD *)(a1 + 40);
      }
      if (*(_QWORD *)(v22 + 64) && *(_BYTE *)(a1 + 65))
        objc_msgSend(v28, "addIndex:", 2);
      if (*(_BYTE *)(a1 + 66))
        objc_msgSend(v28, "addIndex:", 0);
      v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
      objc_msgSend(v23, "reloadSections:", v28);

      v24 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
      objc_msgSend(v24, "transactionHistoryUpdated");

    }
  }
  else
  {
    v25 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v26 = *(_QWORD *)(a1 + 40);
    v27 = *(void **)(v26 + 184);
    *(_QWORD *)(v26 + 184) = v25;

    objc_msgSend(*(id *)(a1 + 40), "_notifyContentLoadedIfNecessary");
  }
}

void __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_188(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setTransactionHistory:", *(_QWORD *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(*(id *)(a1 + 48), "deletedIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteItemsAtIndexPaths:", v4);

  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(*(id *)(a1 + 48), "insertedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertItemsAtIndexPaths:", v6);

  objc_msgSend(*(id *)(a1 + 48), "movedFromIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "movedToIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    do
    {
      v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "moveItemAtIndexPath:toIndexPath:", v11, v12);

      ++v9;
    }
    while (objc_msgSend(v7, "count") > v9);
  }
  v21 = v8;
  objc_msgSend(*(id *)(a1 + 48), "changedIndexPaths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
        v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
        objc_msgSend(WeakRetained, "itemAtIndexPath:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "itemChanged:atIndexPath:", v20, v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

}

- (void)setTransactionHistory:(id)a3
{
  objc_storeStrong((id *)&self->_transactionHistory, a3);
}

- (id)_contactKeysToFetch
{
  void *v2;
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v3 = _MergedGlobals_665();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", objc_msgSend(v4, "_supportsForceTouch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend((Class)off_1ED06C540(), "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend((Class)off_1ED06C548(), "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C966A8];
  v11[3] = v7;
  v11[4] = v8;
  v11[5] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_handleAccountsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  PKAccountService *accountService;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  accountService = self->_accountService;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PKTransactionHistoryDataSource__handleAccountsChangedNotification___block_invoke;
  v7[3] = &unk_1E3E67670;
  objc_copyWeak(&v8, &location);
  -[PKAccountService accountWithIdentifier:completion:](accountService, "accountWithIdentifier:completion:", v5, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __69__PKTransactionHistoryDataSource__handleAccountsChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PKTransactionHistoryDataSource__handleAccountsChangedNotification___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __69__PKTransactionHistoryDataSource__handleAccountsChangedNotification___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 28, *(id *)(a1 + 32));
    if (v3[35] == (id)3)
    {
      objc_msgSend(v3[9], "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "creditDetails", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "installmentPlans");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_msgSend(v11, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v4, "isEqualToString:", v12);

            if (v13)
            {
              objc_storeStrong(v3 + 9, v11);
              goto LABEL_13;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_13:

      objc_msgSend(v3, "_updateInstallmentPlan");
    }
  }

}

- (void)_handleCoarseLocationChangedNotification:(id)a3
{
  PKCoarseLocationMonitor *v4;
  PKCoarseLocationMonitor *coarseLocationMonitor;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (PKCoarseLocationMonitor *)objc_claimAutoreleasedReturnValue();
  coarseLocationMonitor = self->_coarseLocationMonitor;

  if (v4 == coarseLocationMonitor)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PKTransactionHistoryDataSource__handleCoarseLocationChangedNotification___block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __75__PKTransactionHistoryDataSource__handleCoarseLocationChangedNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "reloadSections:", v3);

}

- (void)_updateInstallmentPlan
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  BOOL v7;
  BOOL v8;
  PKDashboardTextActionItem *v9;
  void *v10;
  NSArray *v11;
  NSArray *actionItems;
  NSArray *v13;
  id v14;
  id WeakRetained;
  _QWORD v16[5];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[PKCreditInstallmentPlan remainingAmount](self->_associatedInstallmentPlan, "remainingAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4);

  v6 = +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", self->_transactionSourceCollection, self->_account);
  if (-[PKAccount supportsSchedulePayment](self->_account, "supportsSchedulePayment"))
    v7 = !v6;
  else
    v7 = 1;
  v8 = !v7 && v5 == 1;
  if (v8 && -[PKCreditInstallmentPlan state](self->_associatedInstallmentPlan, "state") == 2)
  {
    v9 = objc_alloc_init(PKDashboardTextActionItem);
    PKLocalizedBeekmanString(CFSTR("EARLY_PAYMENT_BUTTON"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardTextActionItem setTitle:](v9, "setTitle:", v10);

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__PKTransactionHistoryDataSource__updateInstallmentPlan__block_invoke;
    v16[3] = &unk_1E3E728B8;
    v16[4] = self;
    -[PKDashboardTextActionItem setAction:](v9, "setAction:", v16);
    -[PKDashboardTextActionItem setLayoutStyle:](v9, "setLayoutStyle:", 0);
    -[PKDashboardTextActionItem setActionStyle:](v9, "setActionStyle:", 1);
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    actionItems = self->_actionItems;
    self->_actionItems = v11;

  }
  else
  {
    v13 = self->_actionItems;
    self->_actionItems = 0;

  }
  -[PKTransactionHistoryDataSource _reloadTransactions](self, "_reloadTransactions");
  v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v14, "addIndex:", 3);
  objc_msgSend(v14, "addIndex:", 4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadSections:", v14);

}

void __56__PKTransactionHistoryDataSource__updateInstallmentPlan__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKAccountServiceAccountResolutionController *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    v4 = -[PKAccountServiceAccountResolutionController initWithAccount:accountUserCollection:transactionSourceCollection:]([PKAccountServiceAccountResolutionController alloc], "initWithAccount:accountUserCollection:transactionSourceCollection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v4;

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    objc_msgSend(v3, "pkui_viewControllerFromResponderChain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPresentingViewController:", v8);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0D668F0]);
  objc_msgSend(v9, "setEarlyInstallmentPlan:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Presenting bill payment for early installment payment with identifier %@", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "presentFlowForAccountResolution:configuration:completion:", 1, v9, 0);

}

- (void)worldRegionUpdated:(id)a3 updatedRegion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PKTransactionHistoryDataSource_worldRegionUpdated_updatedRegion___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __67__PKTransactionHistoryDataSource_worldRegionUpdated_updatedRegion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_updateGroup:withRegion:", v8, *(_QWORD *)(a1 + 40), (_QWORD)v16))
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
          objc_msgSend(*(id *)(a1 + 32), "_groupItemForTransaction:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v5 + i, 6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "itemChanged:atIndexPath:", v10, v11);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v5 += i;
    }
    while (v4);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v12 + 280) == 4 && objc_msgSend(*(id *)(v12 + 304), "type") == 13)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_updateGroup:withRegion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304), *(_QWORD *)(a1 + 40)))
    {
      v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
      objc_msgSend(*(id *)(a1 + 32), "_headerItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemChanged:atIndexPath:", v14, v15);

    }
  }
}

- (BOOL)_updateGroup:(id)a3 withRegion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  BOOL v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "type") == 13)
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "regions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    if (objc_msgSend(v9, "count"))
    {
      v10 = 0;
      while (1)
      {
        objc_msgSend(v9, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v7;
        v14 = v13;
        if (v12 == v13)
          break;
        if (v7 && v12)
        {
          v15 = objc_msgSend(v12, "isEqualToString:", v13);

          if ((v15 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
        if (++v10 >= (unint64_t)objc_msgSend(v9, "count"))
          goto LABEL_11;
      }

LABEL_14:
      objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v10, v6);
      v17 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v5, "setRegions:", v17);

      v16 = 1;
    }
    else
    {
LABEL_11:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)didUpdateTransactions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  if (PKBankConnectEnabled())
  {
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
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          v12 = objc_alloc(MEMORY[0x1E0D67370]);
          v13 = (void *)objc_msgSend(v12, "initFromFKTransaction:institution:", v11, self->_bankConnectInstitution, (_QWORD)v14);
          objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0D67370], "augmentTransactionsIfNeeded:usingDataProvider:", v5, 0);
    -[PKTransactionHistoryDataSource _handleTransactionHistoryUpdated:](self, "_handleTransactionHistoryUpdated:", v5);

  }
}

- (void)bankConnectConsentStatusDidChange:(unint64_t)a3
{
  int v5;

  v5 = PKBankConnectEnabled();
  if (a3)
  {
    if (v5)
      -[PKTransactionHistoryDataSource _handleTransactionHistoryUpdated:](self, "_handleTransactionHistoryUpdated:", MEMORY[0x1E0C9AA60]);
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
  v10[2] = __76__PKTransactionHistoryDataSource_physicalCardsChanged_forAccountIdentifier___block_invoke;
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

void __76__PKTransactionHistoryDataSource_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  int v9;
  id *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)*((_QWORD *)WeakRetained + 28);
  if (v3)
  {
    v10 = (id *)WeakRetained;
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "accountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v7 = v5;
    if (v6 == v7)
    {

      WeakRetained = v10;
    }
    else
    {
      v8 = v7;
      if (!v6 || !v7)
      {

        goto LABEL_10;
      }
      v9 = objc_msgSend(v6, "isEqualToString:", v7);

      WeakRetained = v10;
      if (!v9)
        goto LABEL_11;
    }
    objc_storeStrong((id *)WeakRetained + 30, *(id *)(a1 + 40));
    v8 = objc_loadWeakRetained(v10 + 5);
    objc_msgSend(v8, "transactionHistoryUpdated");
LABEL_10:

    WeakRetained = v10;
  }
LABEL_11:

}

- (unint64_t)type
{
  return self->_type;
}

- (CNContact)contact
{
  return self->_contact;
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (PKPaymentTransactionGroup)group
{
  return self->_group;
}

- (NSArray)groups
{
  return self->_groups;
}

- (PKCurrencyAmount)footerTotal
{
  return self->_footerTotal;
}

- (PKCurrencyAmount)footerSecondaryTotal
{
  return self->_footerSecondaryTotal;
}

- (NSIndexPath)headerIndexPath
{
  return self->_headerIndexPath;
}

- (PKTransactionHistoryDataSourceDelegate)customDelegate
{
  return (PKTransactionHistoryDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_customDelegate);
}

- (void)setCustomDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_customDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerIndexPath, 0);
  objc_storeStrong((id *)&self->_footerSecondaryTotal, 0);
  objc_storeStrong((id *)&self->_footerTotal, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_peerPaymentImageResolver, 0);
  objc_storeStrong((id *)&self->_bankConnectInstitution, 0);
  objc_storeStrong((id *)&self->_bankConnectTransactionsProvider, 0);
  objc_storeStrong((id *)&self->_bankConnectAccountsProvider, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_formatterMonth, 0);
  objc_storeStrong((id *)&self->_formatterTitle, 0);
  objc_storeStrong((id *)&self->_transactionHistory, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_sourcesPerFundingSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_coarseLocationMonitor, 0);
  objc_storeStrong((id *)&self->_regionUpdater, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_resolutionController, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong((id *)&self->_featuredTransactionActions, 0);
  objc_storeStrong((id *)&self->_associatedReceipt, 0);
  objc_storeStrong((id *)&self->_associatedInstallmentPlan, 0);
  objc_storeStrong((id *)&self->_selectedTransactions, 0);
  objc_storeStrong((id *)&self->_featuredTransaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_customDelegate);
  objc_storeStrong((id *)&self->_peerPaymentCounterpartHandle, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end
