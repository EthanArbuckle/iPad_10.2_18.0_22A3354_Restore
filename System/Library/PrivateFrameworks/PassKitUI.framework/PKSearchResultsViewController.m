@implementation PKSearchResultsViewController

- (PKSearchResultsViewController)initWithPaymentDataProvider:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PKSearchResultsViewController *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queuePrepareResults;
  NSMutableDictionary *v18;
  NSMutableDictionary *passesForResults;
  uint64_t v20;
  NSMutableOrderedSet *lastQueries;
  uint64_t v22;
  NSMutableDictionary *lastResultsPerQueryIdentifier;
  PKDashboardPaymentTransactionItemPresenter *v24;
  PKDashboardPaymentTransactionItemPresenter *transactionPresenter;
  PKMapsSnapshotManager *v26;
  PKTransactionGroupItemPresenter *v27;
  PKTransactionGroupItemPresenter *transactionGroupPresenter;
  PKContactAvatarManager *v29;
  void *v30;
  PKContactAvatarManager *v31;
  PKTransactionGroupThumbnailPresenter *v32;
  PKTransactionGroupThumbnailPresenter *thumbnailPresenter;
  uint64_t v34;
  PKAccountService *accountService;
  PKSearchService *v36;
  PKSearchService *searchService;
  uint64_t v38;
  PKPassLibrary *passLibrary;
  PKWorldRegionUpdater *v40;
  PKWorldRegionUpdater *regionUpdater;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  PKSearchResultsViewController *v46;
  void *v47;
  id v48;
  void *v49;
  FHSearchSuggestionController *v50;
  FHSearchSuggestionController *searchSuggestionController;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  PKSearchResultsViewController *v59;
  id location;
  objc_super v61;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[PKSearchResultsViewController _thumbnailLayout](self, "_thumbnailLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61.receiver = self;
  v61.super_class = (Class)PKSearchResultsViewController;
  v13 = -[PKSearchResultsViewController initWithCollectionViewLayout:](&v61, sel_initWithCollectionViewLayout_, v12);

  if (v13)
  {
    v53 = v11;
    v54 = v10;
    v55 = v9;
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a4);
    v13->_usingThumbnailLayout = 1;
    v13->_atNaturalRestingBounds = 1;
    objc_storeStrong((id *)&v13->_paymentDataProvider, a3);
    objc_storeStrong((id *)&v13->_familyCollection, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = dispatch_queue_create("com.apple.passbok.search.results", v15);
    queuePrepareResults = v13->_queuePrepareResults;
    v13->_queuePrepareResults = (OS_dispatch_queue *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    passesForResults = v13->_passesForResults;
    v13->_passesForResults = v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 10);
    lastQueries = v13->_lastQueries;
    v13->_lastQueries = (NSMutableOrderedSet *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
    lastResultsPerQueryIdentifier = v13->_lastResultsPerQueryIdentifier;
    v13->_lastResultsPerQueryIdentifier = (NSMutableDictionary *)v22;

    v24 = -[PKDashboardPaymentTransactionItemPresenter initWithContext:detailViewStyle:avatarViewDelegate:]([PKDashboardPaymentTransactionItemPresenter alloc], "initWithContext:detailViewStyle:avatarViewDelegate:", 0, 0, v13);
    transactionPresenter = v13->_transactionPresenter;
    v13->_transactionPresenter = v24;

    v26 = objc_alloc_init(PKMapsSnapshotManager);
    v27 = objc_alloc_init(PKTransactionGroupItemPresenter);
    transactionGroupPresenter = v13->_transactionGroupPresenter;
    v13->_transactionGroupPresenter = v27;

    -[PKTransactionGroupItemPresenter setSnapshotManager:](v13->_transactionGroupPresenter, "setSnapshotManager:", v26);
    -[PKTransactionGroupItemPresenter setPaymentDataProvider:](v13->_transactionGroupPresenter, "setPaymentDataProvider:", v13->_paymentDataProvider);
    v29 = [PKContactAvatarManager alloc];
    -[PKTransactionGroupItemPresenter contactResolver](v13->_transactionGroupPresenter, "contactResolver");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PKContactAvatarManager initWithContactResolver:paymentDataProvider:](v29, "initWithContactResolver:paymentDataProvider:", v30, v13->_paymentDataProvider);

    -[PKTransactionGroupItemPresenter setAvatarManager:](v13->_transactionGroupPresenter, "setAvatarManager:", v31);
    v32 = objc_alloc_init(PKTransactionGroupThumbnailPresenter);
    thumbnailPresenter = v13->_thumbnailPresenter;
    v13->_thumbnailPresenter = v32;

    -[PKTransactionGroupThumbnailPresenter setSnapshotManager:](v13->_thumbnailPresenter, "setSnapshotManager:", v26);
    -[PKTransactionGroupThumbnailPresenter setPaymentDataProvider:](v13->_thumbnailPresenter, "setPaymentDataProvider:", v13->_paymentDataProvider);
    -[PKTransactionGroupThumbnailPresenter setAvatarManager:](v13->_thumbnailPresenter, "setAvatarManager:", v31);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v34 = objc_claimAutoreleasedReturnValue();
    accountService = v13->_accountService;
    v13->_accountService = (PKAccountService *)v34;

    -[PKAccountService registerObserver:](v13->_accountService, "registerObserver:", v13);
    v36 = (PKSearchService *)objc_alloc_init(MEMORY[0x1E0D67610]);
    searchService = v13->_searchService;
    v13->_searchService = v36;

    -[PKSearchService registerObserver:](v13->_searchService, "registerObserver:", v13);
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v38 = objc_claimAutoreleasedReturnValue();
    passLibrary = v13->_passLibrary;
    v13->_passLibrary = (PKPassLibrary *)v38;

    v40 = -[PKWorldRegionUpdater initWithSearchService:]([PKWorldRegionUpdater alloc], "initWithSearchService:", v13->_searchService);
    regionUpdater = v13->_regionUpdater;
    v13->_regionUpdater = v40;

    -[PKWorldRegionUpdater addObserver:](v13->_regionUpdater, "addObserver:", v13);
    -[PKSearchResultsViewController navigationItem](v13, "navigationItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setBackButtonDisplayMode:", 2);
    PKLocalizedPaymentString(CFSTR("DASHBOARD_SEARCH_ACCESSIBILITY_LABEL"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setBackButtonTitle:", v43);

    objc_initWeak(&location, v13);
    v44 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v45 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke;
    v58[3] = &unk_1E3E67120;
    v46 = v13;
    v59 = v46;
    objc_msgSend(v44, "addOperation:", v58);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v45;
    v56[1] = 3221225472;
    v56[2] = __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke_3;
    v56[3] = &unk_1E3E6BDD0;
    objc_copyWeak(&v57, &location);
    v48 = (id)objc_msgSend(v44, "evaluateWithInput:completion:", v47, v56);

    -[PKPaymentDataProvider addDelegate:](v13->_paymentDataProvider, "addDelegate:", v46);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObserver:selector:name:object:", v46, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v49, "addObserver:selector:name:object:", v46, sel_keyboardWillChange_, *MEMORY[0x1E0DC4FD8], 0);
    objc_msgSend(v49, "addObserver:selector:name:object:", v46, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
    v50 = (FHSearchSuggestionController *)objc_alloc_init(getFHSearchSuggestionControllerClass());
    searchSuggestionController = v46->_searchSuggestionController;
    v46->_searchSuggestionController = v50;

    objc_destroyWeak(&v57);
    objc_destroyWeak(&location);

    v10 = v54;
    v9 = v55;
    v11 = v53;
  }

  return v13;
}

void __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke_2;
  v11[3] = &unk_1E3E618A0;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "_updateAccountsWithCompletion:", v11);

}

uint64_t __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __106__PKSearchResultsViewController_initWithPaymentDataProvider_transactionSourceCollection_familyCollection___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1257] = 1;
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_queryWithIdentifier:", *((_QWORD *)WeakRetained + 142));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)v4 + 282);
    v3 = *((id *)v4 + 145);
    os_unfair_lock_unlock((os_unfair_lock_t)v4 + 282);
    objc_msgSend(v4, "_updateUIIfPossibleWithResults:query:completion:", v3, v2, 0);

    WeakRetained = v4;
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  PKDashboardTitleHeaderView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PKDashboardTitleHeaderView *v11;
  PKDashboardTitleHeaderView *sampleHeaderView;
  PKSearchSuggestionCollectionViewCell *v13;
  PKSearchSuggestionCollectionViewCell *sampleSuggestionCell;
  void *v15;
  void *v16;
  $77BFE790A1370D46B4241309C9753022 *p_foregroundActiveState;
  void *v18;
  PKSearchResults *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKSearchResultsViewController;
  -[PKSearchResultsViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[PKSearchResultsViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v3, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  -[PKSearchResultsViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("transactionItemPresenter"));
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("transactionGroupPresenter"));
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("emptyCellIdentifier"));
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PKTransactionGroupThumbnailPresenterIdentifier"));
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("suggestionIdentifier"));
  objc_msgSend(v4, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("titleIdentifier"));
  objc_msgSend(v4, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A0], CFSTR("separatorIdentifier"));
  objc_msgSend(v4, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("ElementKindHeaderSpacing"), CFSTR("ElementKindHeaderSpacing"));
  objc_msgSend(v4, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("ElementKindFooterSpacing"), CFSTR("ElementKindFooterSpacing"));
  +[PKDashboardViewController backgroundColor](PKDashboardViewController, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 1);
  objc_msgSend(v4, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v4, "setKeyboardDismissMode:", 1);
  objc_msgSend(v4, "setContentInsetAdjustmentBehavior:", 2);
  v6 = [PKDashboardTitleHeaderView alloc];
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[PKDashboardTitleHeaderView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
  sampleHeaderView = self->_sampleHeaderView;
  self->_sampleHeaderView = v11;

  v13 = -[PKSearchSuggestionCollectionViewCell initWithFrame:]([PKSearchSuggestionCollectionViewCell alloc], "initWithFrame:", v7, v8, v9, v10);
  sampleSuggestionCell = self->_sampleSuggestionCell;
  self->_sampleSuggestionCell = v13;

  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  p_foregroundActiveState = &self->_foregroundActiveState;
  if (v15)
    *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)objc_msgSend(v15, "registerObserver:", self);
  else
    *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)257;
  -[PKSearchResultsViewController _queryWithIdentifier:](self, "_queryWithIdentifier:", self->_currentQueryIdentifier);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lockQuery);
  v19 = self->_currentResults;
  os_unfair_lock_unlock(&self->_lockQuery);
  -[PKSearchResultsViewController _updateUIIfPossibleWithResults:query:completion:](self, "_updateUIIfPossibleWithResults:query:completion:", v19, v18, 0);

}

- (void)viewWillLayoutSubviews
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PKSearchResultsViewController;
  -[PKSearchResultsViewController viewWillLayoutSubviews](&v31, sel_viewWillLayoutSubviews);
  -[PKSearchResultsViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PKSearchResultsViewController _searchController](self, "_searchController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "searchBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "superview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      objc_msgSend(v16, "convertPoint:fromView:", v14, 0.0, v17);
      v19 = v18;

      v20 = v9 + self->_keyboardFrame.size.height;
      objc_msgSend(v3, "contentInset");
      if (v7 != v24 || v19 != v21 || v11 != v23 || v20 != v22)
      {
        objc_msgSend(v3, "setContentInset:", v19, v7, v20, v11);
        objc_msgSend(v3, "verticalScrollIndicatorInsets");
        objc_msgSend(v3, "setVerticalScrollIndicatorInsets:", v19 - v5);
      }
      if (self->_atNaturalRestingBounds)
      {
        objc_msgSend(v3, "contentOffset");
        v26 = v25;
        v28 = v27;
        objc_msgSend(v3, "pkui_naturalRestingBounds");
        if (v26 != v30 || v28 != v29)
          objc_msgSend(v3, "setContentOffset:animated:", 0);
      }
    }

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_isScrolling = 1;
  self->_atNaturalRestingBounds = 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4 && self->_isScrolling)
  {
    self->_isScrolling = 0;
    -[PKSearchResultsViewController _scrollViewStoppedScrolling](self, "_scrollViewStoppedScrolling", a3);
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_isScrolling)
  {
    self->_isScrolling = 0;
    -[PKSearchResultsViewController _scrollViewStoppedScrolling](self, "_scrollViewStoppedScrolling", a3);
  }
}

- (void)_scrollViewStoppedScrolling
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  id v10;

  -[PKSearchResultsViewController collectionView](self, "collectionView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pkui_naturalRestingBounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v10, "contentOffset");
  v8 = v7 == v4;
  if (v9 != v6)
    v8 = 0;
  self->_atNaturalRestingBounds = v8;

}

- (id)_searchController
{
  void *v2;
  void *v3;

  -[PKSearchResultsViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v3 = 0;
    }
  }
  return v3;
}

- (double)_thumbnailInset
{
  uint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 20.0;
  if (!v2)
    return 16.0;
  return result;
}

- (double)_thumbnailSpacing
{
  unint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 16.0;
  if (v2 < 4)
    result = 12.0;
  if (!v2)
    return 8.0;
  return result;
}

- (id)_thumbnailLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11[3];
  id location;

  objc_initWeak(&location, self);
  -[PKSearchResultsViewController _thumbnailInset](self, "_thumbnailInset");
  v4 = v3;
  -[PKSearchResultsViewController _thumbnailSpacing](self, "_thumbnailSpacing");
  v6 = v5;
  v7 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PKSearchResultsViewController__thumbnailLayout__block_invoke;
  v10[3] = &unk_1E3E6BDF8;
  objc_copyWeak(v11, &location);
  v11[1] = v4;
  v11[2] = v6;
  v8 = (void *)objc_msgSend(v7, "initWithSectionProvider:", v10);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
  return v8;
}

char *__49__PKSearchResultsViewController__thumbnailLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  _QWORD *v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PKDashboardPaymentTransactionGroupItem *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
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
  void *v76;
  void *v77;
  void *v78;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  _QWORD v86[2];

  v86[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (char *)objc_msgSend(WeakRetained, "_numberOfItemsInSection:", a2);
    v9 = a2 + 1;
    do
    {
      v10 = v9;
      if (v9 > 8)
        break;
      v11 = objc_msgSend(v7, "_numberOfItemsInSection:", v9);
      v9 = v10 + 1;
    }
    while (!v11);
    if (v8)
    {
      v83 = v5;
      v84 = a2;
      v80 = a1;
      if (a2 == 1)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
        v13 = 0;
        v14 = 0.0;
        do
        {
          objc_msgSend(v7, "collectionView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v13, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "collectionViewLayout");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "collectionView:layout:sizeForItemAtIndexPath:", v15, v17, v16);
          v19 = v18;
          v21 = v20;

          v22 = (void *)MEMORY[0x1E0DC3370];
          objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "sizeWithWidthDimension:heightDimension:", v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v26);
          v14 = v14 + v21;

          ++v13;
        }
        while (v8 != v13);
        objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v14);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:subitems:", v29, v12);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 0.0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setInterItemSpacing:", v31);

        objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v30);
        v8 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setContentInsets:", 0.0, 4.0, 0.0, *(double *)(v80 + 40));
        objc_msgSend(v8, "setSupplementariesFollowContentInsets:", 0);
        objc_msgSend(v8, "setInterGroupSpacing:", 0.0);

      }
      else
      {
        v32 = (void *)v7[130];
        v33 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
        objc_msgSend(v7, "collectionView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "sizeForItem:inCollectionView:atIndexPath:", v33, v34, v35);
        v37 = v36;
        v39 = v38;

        v40 = (void *)MEMORY[0x1E0DC3370];
        objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v37);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v39);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "sizeWithWidthDimension:heightDimension:", v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0DC3370];
        objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", *(double *)(a1 + 48) * (double)(unint64_t)(v8 - 1) + (double)(unint64_t)v8 * v37);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v39);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "sizeWithWidthDimension:heightDimension:", v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = (void *)MEMORY[0x1E0DC3350];
        v86[0] = v44;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "horizontalGroupWithLayoutSize:subitems:", v48, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", *(double *)(a1 + 48));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setInterItemSpacing:", v52);

        objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v51);
        v8 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setContentInsets:", 0.0, *(double *)(a1 + 40), 0.0, *(double *)(a1 + 40));
        objc_msgSend(v8, "setSupplementariesFollowContentInsets:", 0);
        objc_msgSend(v8, "setInterGroupSpacing:", 0.0);
        objc_msgSend(v8, "setOrthogonalScrollingBehavior:", 1);

      }
      v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "_configureHeaderView:inSection:", v7[126], v84);
      v54 = (void *)v7[126];
      v5 = v83;
      objc_msgSend(v83, "container");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "contentSize");
      objc_msgSend(v54, "sizeThatFits:");
      v57 = v56;
      v59 = v58;

      v60 = (void *)MEMORY[0x1E0DC3370];
      objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v59 + 17.0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "sizeWithWidthDimension:heightDimension:", v61, v62);
      v63 = objc_claimAutoreleasedReturnValue();

      v82 = (void *)v63;
      objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v63, CFSTR("ElementKindHeaderSpacing"), 1);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:");
      v64 = (void *)MEMORY[0x1E0DC3370];
      objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v57);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v59);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "sizeWithWidthDimension:heightDimension:", v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v67, *MEMORY[0x1E0DC48A8], 1, 0.0, -4.0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:", v68);
      if (v84 != 1 && v10 <= 8)
      {
        v69 = (void *)MEMORY[0x1E0DC3370];
        objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 18.0);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "sizeWithWidthDimension:heightDimension:", v70, v71);
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v85, CFSTR("ElementKindFooterSpacing"), 5);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v72);
        v73 = (void *)MEMORY[0x1E0DC3370];
        objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", PKUIPixelLength());
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "sizeWithWidthDimension:heightDimension:", v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v83;
        objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v76, *MEMORY[0x1E0DC48A0], 5, 0.0, 18.0);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setContentInsets:", 0.0, *(double *)(v80 + 40), 0.0, 0.0);
        objc_msgSend(v53, "addObject:", v77);

      }
      v78 = (void *)objc_msgSend(v53, "copy");
      objc_msgSend(v8, "setBoundarySupplementaryItems:", v78);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_resultsLayout
{
  return objc_alloc_init(MEMORY[0x1E0DC3610]);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  char v25;
  __CFString *v26;
  __CFString *v27;
  int v28;
  void *v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "section");
  v12 = (void *)*MEMORY[0x1E0DC48A8];
  v13 = v9;
  v14 = v12;
  if (v14 == v13)
  {

    goto LABEL_7;
  }
  v15 = v14;
  if (!v13 || !v14)
  {

    goto LABEL_9;
  }
  v16 = objc_msgSend(v13, "isEqualToString:", v14);

  if (v16)
  {
LABEL_7:
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v13, CFSTR("titleIdentifier"), v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSearchResultsViewController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", v17, v11);
    goto LABEL_27;
  }
LABEL_9:
  v18 = (void *)*MEMORY[0x1E0DC48A0];
  v19 = v13;
  v20 = v18;
  if (v20 == v19)
  {

  }
  else
  {
    v21 = v20;
    if (!v13 || !v20)
    {

LABEL_18:
      v23 = (__CFString *)v19;
      v24 = v23;
      if (v23 == CFSTR("ElementKindHeaderSpacing")
        || v23
        && ((v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("ElementKindHeaderSpacing")),
             v24,
             (v25 & 1) != 0)
         || (v26 = v24, v26 == CFSTR("ElementKindFooterSpacing"))
         || (v27 = v26,
             v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("ElementKindFooterSpacing")),
             v27,
             v28)))
      {
        objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v24, v24, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      goto LABEL_27;
    }
    v22 = objc_msgSend(v19, "isEqualToString:", v20);

    if (!v22)
      goto LABEL_18;
  }
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v19, CFSTR("separatorIdentifier"), v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_usingThumbnailLayout)
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v29);

LABEL_27:
  return v17;
}

- (void)_configureHeaderView:(id)a3 inSection:(unint64_t)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSUInteger v11;
  BOOL v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  double v18;
  void *v19;
  _QWORD v20[4];
  id v21[2];
  id location;

  v6 = a3;
  switch(a4)
  {
    case 1uLL:
      if (!PKFinHealthTagsSectionEnabled() || !-[NSArray count](self->_transactionTags, "count"))
        goto LABEL_5;
      v7 = CFSTR("SEARCH_TITLE_SUGGESTIONS");
      goto LABEL_8;
    case 2uLL:
      v7 = CFSTR("SEARCH_TITLE_PAYMENT_PASSES");
      goto LABEL_8;
    case 3uLL:
      v7 = CFSTR("SEARCH_TITLE_BARCODE_PASSES");
LABEL_8:
      PKLocalizedString(&v7->isa);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_9;
    case 4uLL:
      PKLocalizedString(CFSTR("SEARCH_TITLE_CATEGORIES"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSArray count](self->_categories, "count");
      v12 = v11 >= 3;
      v10 = v11 < 3;
      v13 = 3;
      goto LABEL_15;
    case 5uLL:
      PKLocalizedString(CFSTR("SEARCH_TITLE_MERCHANTS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[NSArray count](self->_merchants, "count");
      v10 = v14 < 3;
      v8 = (void *)(4 * (v14 > 2));
      break;
    case 6uLL:
      PKLocalizedString(CFSTR("SEARCH_TITLE_TRANSACTIONS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[NSArray count](self->_transactions, "count");
      v12 = v15 >= 3;
      v10 = v15 < 3;
      v13 = 5;
      goto LABEL_15;
    case 7uLL:
      PKLocalizedString(CFSTR("SEARCH_TITLE_PEOPLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[NSArray count](self->_people, "count");
      v12 = v16 >= 3;
      v10 = v16 < 3;
      v13 = 6;
      goto LABEL_15;
    case 8uLL:
      PKLocalizedString(CFSTR("SEARCH_TITLE_LOCATION"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSArray count](self->_locations, "count");
      v12 = v17 >= 3;
      v10 = v17 < 3;
      v13 = 7;
LABEL_15:
      if (v12)
        v8 = (void *)v13;
      else
        v8 = 0;
      break;
    default:
LABEL_5:
      v8 = 0;
      v9 = 0;
LABEL_9:
      v10 = 1;
      break;
  }
  if (self->_usingThumbnailLayout)
    -[PKSearchResultsViewController _thumbnailInset](self, "_thumbnailInset");
  else
    v18 = 18.0;
  objc_msgSend(v6, "setHorizontalInset:", v18);
  objc_msgSend(v6, "setTitle:", v9);
  if (v10 || self->_usingThumbnailLayout)
  {
    objc_msgSend(v6, "setActionTitle:", 0);
  }
  else
  {
    PKLocalizedString(CFSTR("SEARCH_SEE_ALL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActionTitle:", v19);

    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__PKSearchResultsViewController__configureHeaderView_inSection___block_invoke;
    v20[3] = &unk_1E3E66D38;
    objc_copyWeak(v21, &location);
    v21[1] = v8;
    objc_msgSend(v6, "setAction:", v20);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }

}

void __64__PKSearchResultsViewController__configureHeaderView_inSection___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  os_unfair_lock_s *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char *v27;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v27 = WeakRetained;
    objc_msgSend(WeakRetained, "_queryWithIdentifier:", *((_QWORD *)WeakRetained + 142));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_alloc(MEMORY[0x1E0D67728]);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "keyboardLanguage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "passUniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v4, "initWithIdentifier:keyboardLanguage:passUniqueIdentifier:", v6, v7, v8);

    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0D67600]);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "keyboardLanguage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "initWithIdentifier:keyboardLanguage:", v6, v7);
    }

    objc_msgSend(v9, "setType:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v11);

    objc_msgSend(v3, "tokens");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTokens:", v12);

    v13 = (os_unfair_lock_s *)(v27 + 1128);
    os_unfair_lock_lock((os_unfair_lock_t)v27 + 282);
    v14 = objc_msgSend(*((id *)v27 + 143), "indexOfObject:", v9);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_16;
    v15 = v14;
    objc_msgSend(*((id *)v27 + 143), "objectAtIndex:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id *)v27;
    if (v27[1168])
    {
      objc_msgSend(v16, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)*((_QWORD *)v27 + 142);
      v20 = v18;
      v21 = v19;
      if (v20 == v21)
      {

        goto LABEL_13;
      }
      v22 = v21;
      if (v20 && v21)
      {
        v23 = objc_msgSend(v20, "isEqualToString:", v21);

        v17 = (id *)v27;
        if ((v23 & 1) == 0)
          goto LABEL_15;
LABEL_13:

        os_unfair_lock_unlock(v13);
        v9 = v16;
LABEL_17:

        WeakRetained = v27;
        goto LABEL_18;
      }

      v17 = (id *)v27;
    }
LABEL_15:
    objc_msgSend(v17[143], "removeObjectAtIndex:", v15);

LABEL_16:
    objc_msgSend(v9, "identifier");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v27 + 142);
    *((_QWORD *)v27 + 142) = v24;

    v27[1168] = 1;
    objc_msgSend(*((id *)v27 + 143), "addObject:", v9);
    os_unfair_lock_unlock(v13);
    v26 = *((_QWORD *)v27 + 158) + 1;
    *((_QWORD *)v27 + 158) = v26;
    *((_QWORD *)v27 + 159) = v26;
    v27[1320] = 0;
    objc_msgSend(*((id *)v27 + 133), "searchWithQuery:", v9);
    objc_msgSend(v27, "_initiateSeeAllPresentationForQuery:", v9);
    goto LABEL_17;
  }
LABEL_18:

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (self->_hasLoadedRequiredData)
    return 9;
  else
    return 0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[PKSearchResultsViewController _numberOfItemsInSection:](self, "_numberOfItemsInSection:", a4);
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3
{
  int *v3;
  int64_t result;

  v3 = &OBJC_IVAR___PKSearchResultsViewController__categories;
  switch(a3)
  {
    case 0:
      v3 = &OBJC_IVAR___PKSearchResultsViewController__suggestions;
      if (!self->_usingThumbnailLayout)
        goto LABEL_9;
      goto LABEL_3;
    case 1:
      v3 = &OBJC_IVAR___PKSearchResultsViewController__transactionTags;
      goto LABEL_9;
    case 4:
      goto LABEL_9;
    case 5:
      v3 = &OBJC_IVAR___PKSearchResultsViewController__merchants;
      goto LABEL_9;
    case 6:
      v3 = &OBJC_IVAR___PKSearchResultsViewController__transactions;
      goto LABEL_9;
    case 7:
      v3 = &OBJC_IVAR___PKSearchResultsViewController__people;
      goto LABEL_9;
    case 8:
      v3 = &OBJC_IVAR___PKSearchResultsViewController__locations;
LABEL_9:
      result = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v3), "count");
      break;
    default:
LABEL_3:
      result = 0;
      break;
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSArray *suggestions;
  void *v11;
  void *v12;
  NSArray *transactionTags;
  void *v14;
  id v15;
  void *v16;
  _BOOL4 usingThumbnailLayout;
  uint64_t v18;
  void *v19;
  PKTransactionGroupThumbnailPresenter *thumbnailPresenter;
  PKTransactionGroupItemPresenter *transactionGroupPresenter;
  void *v22;
  void *v23;
  PKDashboardPaymentTransactionItemPresenter *transactionPresenter;

  v6 = a3;
  v7 = a4;
  v8 = 0;
  switch(objc_msgSend(v7, "section"))
  {
    case 0:
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("suggestionIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      suggestions = self->_suggestions;
      v8 = v9;
      -[NSArray objectAtIndex:](suggestions, "objectAtIndex:", objc_msgSend(v7, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSearchResultsViewController _configureSuggestionCell:withSuggestion:](self, "_configureSuggestionCell:withSuggestion:", v8, v11);

      goto LABEL_10;
    case 1:
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("suggestionIdentifier"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      transactionTags = self->_transactionTags;
      v8 = v12;
      -[NSArray objectAtIndex:](transactionTags, "objectAtIndex:", objc_msgSend(v7, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "group");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc_init(MEMORY[0x1E0D67618]);
      objc_msgSend(v14, "tag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTag:", v16);
      -[PKSearchResultsViewController _configureSuggestionCell:withSuggestion:](self, "_configureSuggestionCell:withSuggestion:", v8, v15);

      goto LABEL_10;
    case 4:
      usingThumbnailLayout = self->_usingThumbnailLayout;
      v18 = 1200;
      goto LABEL_8;
    case 5:
      usingThumbnailLayout = self->_usingThumbnailLayout;
      v18 = 1208;
      goto LABEL_8;
    case 6:
      transactionPresenter = self->_transactionPresenter;
      -[NSArray objectAtIndex:](self->_transactions, "objectAtIndex:", objc_msgSend(v7, "row"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = transactionPresenter;
      goto LABEL_13;
    case 7:
      usingThumbnailLayout = self->_usingThumbnailLayout;
      v18 = 1224;
      goto LABEL_8;
    case 8:
      usingThumbnailLayout = self->_usingThumbnailLayout;
      v18 = 1216;
LABEL_8:
      v19 = *(Class *)((char *)&self->super.super.super.super.isa + v18);
      if (usingThumbnailLayout)
      {
        thumbnailPresenter = self->_thumbnailPresenter;
        objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v7, "row"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransactionGroupThumbnailPresenter cellForItem:inCollectionView:atIndexPath:](thumbnailPresenter, "cellForItem:inCollectionView:atIndexPath:", v11, v6, v7);
        v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

        objc_msgSend(v8, "setWantsCustomAppearance:", 1);
      }
      else
      {
        transactionGroupPresenter = self->_transactionGroupPresenter;
        objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v7, "row"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = transactionGroupPresenter;
LABEL_13:
        objc_msgSend(v23, "cellForItem:inCollectionView:atIndexPath:", v22, v6, v7);
        v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
        objc_msgSend(v8, "setWantsCustomAppearance:", 0);
        -[PKSearchResultsViewController _applyMaskToCell:firstInSection:lastInSection:](self, "_applyMaskToCell:firstInSection:lastInSection:", v8, objc_msgSend(v7, "row") == 0, objc_msgSend(v6, "numberOfItemsInSection:", objc_msgSend(v7, "section")) == objc_msgSend(v7, "row") + 1);
      }

      return v8;
    default:
      goto LABEL_14;
  }
}

- (void)_configureSuggestionCell:(id)a3 withSuggestion:(id)a4
{
  PKTransactionGroupItemPresenter *transactionGroupPresenter;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v12 = 0;
  v13 = 0;
  transactionGroupPresenter = self->_transactionGroupPresenter;
  v6 = a4;
  v7 = a3;
  -[PKTransactionGroupItemPresenter contactResolver](transactionGroupPresenter, "contactResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchAutoCompletionTextAndImageFromSuggestion(&v13, &v12, 0, v6, v8);

  v9 = v13;
  v10 = v12;

  objc_msgSend(v7, "setIcon:", v10);
  objc_msgSend(v7, "setSuggestion:", v9);

  objc_msgSend(v7, "setShowsBottomSeparator:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v11);

}

- (void)_applyMaskToCell:(id)a3 firstInSection:(BOOL)a4 lastInSection:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v11 = v7;
  v8 = 3;
  if (!v6 || !v5)
    v8 = 1;
  v9 = 2;
  if (!v5)
    v9 = 0;
  if (v6)
    v10 = v8;
  else
    v10 = v9;
  objc_msgSend(v7, "setMaskType:", v10);
  objc_msgSend(v11, "setShowsBottomSeparator:", !v5);

}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  id v14;

  if (self->_queryHasNoResults)
  {
    v4 = (void *)MEMORY[0x1E0DC3698];
    v5 = a3;
    objc_msgSend(v4, "searchConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatedConfigurationForState:", v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[PKSearchQuery text](self->_queryForCurrentResults, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[PKSearchQuery isEmpty](self->_queryForCurrentResults, "isEmpty") & 1) != 0)
    {
      PKLocalizedString(CFSTR("SEARCH_NO_SUGGESTIONS"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_fullResultsNotAvailable)
      {
        -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedString(CFSTR("SEARCH_NO_SUGGESTIONS_SUBTITLE_INDEXING"), CFSTR("%@"), v10);
LABEL_8:
        v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
        objc_msgSend(v14, "setText:", v8);
        objc_msgSend(v14, "setSecondaryText:", v11);

        -[PKSearchResultsViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v14);
        goto LABEL_15;
      }
      v12 = CFSTR("SEARCH_NO_SUGGESTIONS_SUBTITLE_NO_CONTENT");
    }
    else
    {
      PKLocalizedString(CFSTR("SEARCH_NO_RESULTS"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_fullResultsNotAvailable)
      {
        -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedString(CFSTR("SEARCH_NO_RESULTS_SUBTITLE_INDEXING"), CFSTR("%@"), v10);
        goto LABEL_8;
      }
      if (!self->_hasSearchableContent)
      {
        -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedString(CFSTR("SEARCH_NO_RESULTS_SUBTITLE_NO_CONTENT"), CFSTR("%@"), v10);
        goto LABEL_8;
      }
      if (objc_msgSend(v7, "length"))
      {
        PKLocalizedString(CFSTR("SEARCH_NO_RESULTS_TEXT"), CFSTR("%@"), v7);
        v13 = objc_claimAutoreleasedReturnValue();

        PKLocalizedString(CFSTR("SEARCH_NO_RESULTS_SUBTITLE"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)v13;
        goto LABEL_14;
      }
      v12 = CFSTR("SEARCH_NO_RESULTS_SUBTITLE_NO_TEXT");
    }
    PKLocalizedString(&v12->isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v14 = 0;
  -[PKSearchResultsViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
LABEL_15:

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  PKSearchSuggestionCollectionViewCell *sampleSuggestionCell;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  PKSearchSuggestionCollectionViewCell *v19;
  double v20;
  double v21;
  double v22;
  PKTransactionGroupItemPresenter *transactionGroupPresenter;
  uint64_t v24;
  int *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  v7 = a3;
  v8 = a5;
  switch(objc_msgSend(v8, "section"))
  {
    case 0:
      -[NSArray objectAtIndex:](self->_suggestions, "objectAtIndex:", objc_msgSend(v8, "row"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSearchResultsViewController _configureSuggestionCell:withSuggestion:](self, "_configureSuggestionCell:withSuggestion:", self->_sampleSuggestionCell, v9);
      sampleSuggestionCell = self->_sampleSuggestionCell;
      objc_msgSend(v7, "bounds");
      -[PKSearchSuggestionCollectionViewCell sizeThatFits:](sampleSuggestionCell, "sizeThatFits:", v11, 3.40282347e38);
      v13 = v12;
      v15 = v14;
      goto LABEL_4;
    case 1:
      -[NSArray objectAtIndex:](self->_transactionTags, "objectAtIndex:", objc_msgSend(v8, "row"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "group");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(MEMORY[0x1E0D67618]);
      objc_msgSend(v16, "tag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTag:", v18);

      -[PKSearchResultsViewController _configureSuggestionCell:withSuggestion:](self, "_configureSuggestionCell:withSuggestion:", self->_sampleSuggestionCell, v17);
      v19 = self->_sampleSuggestionCell;
      objc_msgSend(v7, "bounds");
      -[PKSearchSuggestionCollectionViewCell sizeThatFits:](v19, "sizeThatFits:", v20, 3.40282347e38);
      v13 = v21;
      v15 = v22;

LABEL_4:
      break;
    case 4:
      transactionGroupPresenter = self->_transactionGroupPresenter;
      v24 = 1200;
      goto LABEL_12;
    case 5:
      transactionGroupPresenter = self->_transactionGroupPresenter;
      v24 = 1208;
      goto LABEL_12;
    case 6:
      v25 = &OBJC_IVAR___PKSearchResultsViewController__transactionPresenter;
      goto LABEL_11;
    case 7:
      v25 = &OBJC_IVAR___PKSearchResultsViewController__transactionGroupPresenter;
LABEL_11:
      transactionGroupPresenter = *(PKTransactionGroupItemPresenter **)((char *)&self->super.super.super.super.isa + *v25);
      v24 = v25[20];
      goto LABEL_12;
    case 8:
      transactionGroupPresenter = self->_transactionGroupPresenter;
      v24 = 1216;
LABEL_12:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v24), "objectAtIndex:", objc_msgSend(v8, "row"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransactionGroupItemPresenter sizeForItem:inCollectionView:atIndexPath:](transactionGroupPresenter, "sizeForItem:inCollectionView:atIndexPath:", v26, v7, v8);
      v13 = v27;
      v15 = v28;

      break;
    default:
      v13 = *MEMORY[0x1E0C9D820];
      v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
  }

  v29 = v13;
  v30 = v15;
  result.height = v30;
  result.width = v29;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  uint64_t v8;
  PKDashboardTitleHeaderView *sampleHeaderView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v7 = a3;
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", a5);
  if (a5 && v8)
  {
    -[PKSearchResultsViewController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", self->_sampleHeaderView, a5);
    sampleHeaderView = self->_sampleHeaderView;
    objc_msgSend(v7, "bounds");
    -[PKDashboardTitleHeaderView sizeThatFits:](sampleHeaderView, "sizeThatFits:", v10, 3.40282347e38);
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v6 = a3;
  v7 = v6;
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (!a5 && !objc_msgSend(v6, "numberOfItemsInSection:", 0))
  {
    objc_msgSend(v7, "bounds");
    v8 = v10;
    v9 = 20.0;
  }

  v11 = v8;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v6 = a3;
  v8 = *MEMORY[0x1E0DC49E8];
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (objc_msgSend(v6, "numberOfItemsInSection:", a5) >= 1)
  {
    v11 = a5 + 1;
    while (v11 <= 8)
    {
      if (objc_msgSend(v6, "numberOfItemsInSection:", v11++))
      {
        v9 = 20.0;
        v10 = 0.0;
        v7 = 0.0;
        v8 = 0.0;
        break;
      }
    }
  }

  v13 = v8;
  v14 = v7;
  v15 = v9;
  v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  PKTransactionGroupItemPresenter *transactionGroupPresenter;
  uint64_t v11;
  int *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_usingThumbnailLayout)
  {
    v9 = 1;
  }
  else
  {
    v9 = 1;
    switch(objc_msgSend(v7, "section"))
    {
      case 0:
        break;
      case 4:
        transactionGroupPresenter = self->_transactionGroupPresenter;
        v11 = 1200;
        goto LABEL_11;
      case 5:
        transactionGroupPresenter = self->_transactionGroupPresenter;
        v11 = 1208;
        goto LABEL_11;
      case 6:
        v12 = &OBJC_IVAR___PKSearchResultsViewController__transactionPresenter;
        goto LABEL_9;
      case 7:
        v12 = &OBJC_IVAR___PKSearchResultsViewController__transactionGroupPresenter;
LABEL_9:
        transactionGroupPresenter = *(PKTransactionGroupItemPresenter **)((char *)&self->super.super.super.super.isa
                                                                        + *v12);
        v11 = v12[20];
        goto LABEL_11;
      case 8:
        transactionGroupPresenter = self->_transactionGroupPresenter;
        v11 = 1216;
LABEL_11:
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v11), "objectAtIndex:", objc_msgSend(v8, "row"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[PKTransactionGroupItemPresenter canSelectItem:inCollectionView:atIndexPath:](transactionGroupPresenter, "canSelectItem:inCollectionView:atIndexPath:", v13, v6, v8);

        break;
      default:
        v9 = 0;
        break;
    }
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  FHSearchSuggestionController *searchSuggestionController;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  PKDashboardPaymentTransactionItemPresenter *transactionPresenter;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  FHSearchSuggestionController *v66;
  void *v67;
  PKTransactionGroupItemPresenter *transactionGroupPresenter;
  void *v69;
  void *v70;
  _QWORD *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  char v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[6];
  void *v96;
  id v97;
  _QWORD v98[6];
  void *v99;
  id v100;
  _QWORD v101[6];
  _QWORD v102[6];
  void *v103;
  id v104;
  id v105;
  id v106;
  _QWORD v107[6];
  void *v108;
  id v109;
  id v110;
  id v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = self->_presentationCounter + 1;
  self->_presentationCounter = v9;
  if (self->_usingThumbnailLayout || !objc_msgSend(v7, "section"))
  {
    -[PKSearchResultsViewController _searchController](self, "_searchController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "associatedAccountServiceAccountIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v14;
  if ((objc_msgSend(v13, "hasAssociatedPeerPaymentAccount") & 1) != 0)
  {
    v15 = 1;
  }
  else if (objc_msgSend(v14, "length"))
  {
    -[NSDictionary objectForKey:](self->_accountsPerIdentifier, "objectForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "feature");
    if (v17 == 2)
      v15 = 2;
    else
      v15 = v17 == 1;

  }
  else
  {
    v15 = 0;
  }
  v90 = v8;
  v18 = objc_msgSend(v8, "section");
  v19 = 0;
  v20 = 0;
  v21 = 0;
  switch(v18)
  {
    case 0:
      -[NSArray objectAtIndex:](self->_suggestions, "objectAtIndex:", objc_msgSend(v90, "row"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = 0;
      v111 = 0;
      -[PKTransactionGroupItemPresenter contactResolver](self->_transactionGroupPresenter, "contactResolver");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PKSearchAutoCompletionTextAndImageFromSuggestion(&v111, &v110, 1, v22, v23);
      v19 = v111;
      v20 = v110;

      v24 = v22;
      if (objc_msgSend(v24, "tokenType") == 9)
      {
        v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v24, "tag");
        v86 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v13;
        v28 = v6;
        v29 = objc_msgSend(v26, "type");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        _MergedGlobals_1[0]();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v30, v31);

        v6 = v28;
        v13 = v27;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        off_1EE492C38[0]();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v32, v33);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        off_1EE492C40[0]();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v34, v35);

        searchSuggestionController = self->_searchSuggestionController;
        v37 = (void *)objc_msgSend(v25, "copy");
        -[FHSearchSuggestionController recordUserInteraction:](searchSuggestionController, "recordUserInteraction:", v37);

        v24 = v86;
        v21 = v86;
        goto LABEL_38;
      }
      v21 = v24;
      goto LABEL_39;
    case 1:
      v82 = v12;
      v84 = v6;
      -[NSArray objectAtIndex:](self->_transactionTags, "objectAtIndex:", objc_msgSend(v90, "row"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "group");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_alloc_init(MEMORY[0x1E0D67618]);
      objc_msgSend(v39, "tag");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setTag:", v41);

      v105 = 0;
      v106 = 0;
      v42 = v40;
      -[PKTransactionGroupItemPresenter contactResolver](self->_transactionGroupPresenter, "contactResolver");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      PKSearchAutoCompletionTextAndImageFromSuggestion(&v106, &v105, 1, v42, v43);
      v19 = v106;
      v20 = v105;

      objc_msgSend(v39, "tag");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "type");

      v87 = v38;
      v83 = v39;
      if (v45 == 19)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0D67628]);
        objc_msgSend(v21, "setTransactionType:", 10);
      }
      else
      {
        v21 = v42;
      }
      v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v42, "tag");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "type");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      _MergedGlobals_1[0]();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setObject:forKey:", v60, v61);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      off_1EE492C38[0]();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setObject:forKey:", v62, v63);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      off_1EE492C40[0]();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setObject:forKey:", v64, v65);

      v66 = self->_searchSuggestionController;
      v67 = (void *)objc_msgSend(v57, "copy");
      -[FHSearchSuggestionController recordUserInteraction:](v66, "recordUserInteraction:", v67);

      v6 = v84;
      v12 = v82;
      goto LABEL_37;
    case 2:
    case 3:
      goto LABEL_52;
    case 4:
      v46 = v90;
      -[NSArray objectAtIndex:](self->_categories, "objectAtIndex:", objc_msgSend(v90, "row"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "group");
      v51 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v51;
      if (self->_usingThumbnailLayout)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0D67620]);
        objc_msgSend(v21, "setGroup:", v48);
        v108 = 0;
        v109 = 0;
        -[PKTransactionGroupItemPresenter contactResolver](self->_transactionGroupPresenter, "contactResolver");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        PKSearchAutoCompletionTextAndImageFromSuggestion(&v109, &v108, 1, v21, v49);
        v19 = v109;
        v50 = v108;
        goto LABEL_27;
      }
      v83 = (void *)v51;
      transactionGroupPresenter = self->_transactionGroupPresenter;
      -[NSArray objectAtIndex:](self->_categories, "objectAtIndex:", objc_msgSend(v90, "row"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSearchResultsViewController navigationController](self, "navigationController");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v107[0] = MEMORY[0x1E0C809B0];
      v107[1] = 3221225472;
      v107[2] = __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
      v107[3] = &unk_1E3E6BE20;
      v107[4] = self;
      v107[5] = v9;
      v71 = v107;
      goto LABEL_36;
    case 5:
      v46 = v90;
      -[NSArray objectAtIndex:](self->_merchants, "objectAtIndex:", objc_msgSend(v90, "row"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "group");
      v52 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v52;
      if (self->_usingThumbnailLayout)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0D67620]);
        objc_msgSend(v21, "setGroup:", v48);
        v103 = 0;
        v104 = 0;
        -[PKTransactionGroupItemPresenter contactResolver](self->_transactionGroupPresenter, "contactResolver");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        PKSearchAutoCompletionTextAndImageFromSuggestion(&v104, &v103, 1, v21, v49);
        v19 = v104;
        v50 = v103;
        goto LABEL_27;
      }
      v83 = (void *)v52;
      transactionGroupPresenter = self->_transactionGroupPresenter;
      -[NSArray objectAtIndex:](self->_merchants, "objectAtIndex:", objc_msgSend(v90, "row"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSearchResultsViewController navigationController](self, "navigationController");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = MEMORY[0x1E0C809B0];
      v102[1] = 3221225472;
      v102[2] = __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
      v102[3] = &unk_1E3E6BE20;
      v102[4] = self;
      v102[5] = v9;
      v71 = v102;
      goto LABEL_36;
    case 6:
      transactionPresenter = self->_transactionPresenter;
      -[NSArray objectAtIndex:](self->_transactions, "objectAtIndex:", objc_msgSend(v90, "row"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSearchResultsViewController navigationController](self, "navigationController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = MEMORY[0x1E0C809B0];
      v101[1] = 3221225472;
      v101[2] = __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
      v101[3] = &unk_1E3E6BE20;
      v101[4] = self;
      v101[5] = v9;
      -[PKDashboardPaymentTransactionItemPresenter didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:](transactionPresenter, "didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:", v54, v6, v90, v55, v101);

      v19 = 0;
      v20 = 0;
      v21 = 0;
      goto LABEL_52;
    case 7:
      v46 = v90;
      -[NSArray objectAtIndex:](self->_people, "objectAtIndex:", objc_msgSend(v90, "row"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "group");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v47;
      if (self->_usingThumbnailLayout)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0D67620]);
        objc_msgSend(v21, "setGroup:", v48);
        v99 = 0;
        v100 = 0;
        -[PKTransactionGroupItemPresenter contactResolver](self->_transactionGroupPresenter, "contactResolver");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        PKSearchAutoCompletionTextAndImageFromSuggestion(&v100, &v99, 1, v21, v49);
        v19 = v100;
        v50 = v99;
        goto LABEL_27;
      }
      v83 = (void *)v47;
      transactionGroupPresenter = self->_transactionGroupPresenter;
      -[NSArray objectAtIndex:](self->_people, "objectAtIndex:", objc_msgSend(v90, "row"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSearchResultsViewController navigationController](self, "navigationController");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v98[0] = MEMORY[0x1E0C809B0];
      v98[1] = 3221225472;
      v98[2] = __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4;
      v98[3] = &unk_1E3E6BE20;
      v98[4] = self;
      v98[5] = v9;
      v71 = v98;
      goto LABEL_36;
    case 8:
      v46 = v90;
      -[NSArray objectAtIndex:](self->_locations, "objectAtIndex:", objc_msgSend(v90, "row"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "group");
      v56 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v56;
      if (self->_usingThumbnailLayout)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0D67620]);
        objc_msgSend(v21, "setGroup:", v48);
        v96 = 0;
        v97 = 0;
        -[PKTransactionGroupItemPresenter contactResolver](self->_transactionGroupPresenter, "contactResolver");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        PKSearchAutoCompletionTextAndImageFromSuggestion(&v97, &v96, 1, v21, v49);
        v19 = v97;
        v50 = v96;
LABEL_27:
        v25 = v48;
        v20 = v50;

        v24 = v87;
      }
      else
      {
        v83 = (void *)v56;
        transactionGroupPresenter = self->_transactionGroupPresenter;
        -[NSArray objectAtIndex:](self->_locations, "objectAtIndex:", objc_msgSend(v90, "row"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSearchResultsViewController navigationController](self, "navigationController");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v95[0] = MEMORY[0x1E0C809B0];
        v95[1] = 3221225472;
        v95[2] = __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_5;
        v95[3] = &unk_1E3E6BE20;
        v95[4] = self;
        v95[5] = v9;
        v71 = v95;
LABEL_36:
        -[PKTransactionGroupItemPresenter didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:](transactionGroupPresenter, "didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:", v69, v6, v46, v70, v71);

        v21 = 0;
        v20 = 0;
        v19 = 0;
LABEL_37:
        v24 = v87;
        v25 = v83;
      }
LABEL_38:

LABEL_39:
      if (!v19 || !v21)
        goto LABEL_52;
      v85 = v6;
      v88 = v13;
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v72 = v12;
      objc_msgSend(v12, "tokens");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
      if (!v74)
        goto LABEL_49;
      v75 = v74;
      v76 = *(_QWORD *)v92;
      break;
    default:
      v20 = 0;
      v21 = 0;
      goto LABEL_52;
  }
  while (2)
  {
    for (i = 0; i != v75; ++i)
    {
      if (*(_QWORD *)v92 != v76)
        objc_enumerationMutation(v73);
      objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "representedObject");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = PKEqualObjects();

      if ((v79 & 1) != 0)
      {

        v6 = v85;
        v12 = v72;
        goto LABEL_51;
      }
    }
    v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
    if (v75)
      continue;
    break;
  }
LABEL_49:

  objc_msgSend(MEMORY[0x1E0DC3C50], "tokenWithIcon:text:", v20, v19);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setRepresentedObject:", v21);
  v12 = v72;
  objc_msgSend(v72, "setText:", &stru_1E3E7D690);
  objc_msgSend(v72, "tokens");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "insertToken:atIndex:", v80, objc_msgSend(v81, "count"));

  v6 = v85;
LABEL_51:
  v13 = v88;
LABEL_52:

}

BOOL __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1264);
}

BOOL __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1264);
}

BOOL __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1264);
}

BOOL __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1264);
}

BOOL __73__PKSearchResultsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_5(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1264);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  PKDashboardPaymentTransactionItemPresenter *transactionPresenter;
  void *v7;
  PKTransactionGroupItemPresenter *transactionGroupPresenter;
  void *v9;
  PKTransactionGroupThumbnailPresenter *thumbnailPresenter;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  PKDashboardTitleHeaderView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  PKDashboardTitleHeaderView *v21;
  PKDashboardTitleHeaderView *sampleHeaderView;
  PKSearchSuggestionCollectionViewCell *v23;
  PKSearchSuggestionCollectionViewCell *sampleSuggestionCell;
  void *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKSearchResultsViewController;
  -[PKSearchResultsViewController traitCollectionDidChange:](&v26, sel_traitCollectionDidChange_, v4);
  if (self->_hasLoadedRequiredData)
  {
    -[PKSearchResultsViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    transactionPresenter = self->_transactionPresenter;
    -[PKSearchResultsViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPaymentTransactionItemPresenter traitCollectionDidChangeFromTrait:toTrait:inCollectionView:](transactionPresenter, "traitCollectionDidChangeFromTrait:toTrait:inCollectionView:", v4, v5, v7);

    transactionGroupPresenter = self->_transactionGroupPresenter;
    -[PKSearchResultsViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionGroupItemPresenter traitCollectionDidChangeFromTrait:toTrait:inCollectionView:](transactionGroupPresenter, "traitCollectionDidChangeFromTrait:toTrait:inCollectionView:", v4, v5, v9);

    thumbnailPresenter = self->_thumbnailPresenter;
    -[PKSearchResultsViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionGroupThumbnailPresenter traitCollectionDidChangeFromTrait:toTrait:inCollectionView:](thumbnailPresenter, "traitCollectionDidChangeFromTrait:toTrait:inCollectionView:", v4, v5, v11);

    if (!v4 || !v5)
      goto LABEL_8;
    objc_msgSend(v4, "preferredContentSizeCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v12, (UIContentSizeCategory)v13))
    {

    }
    else
    {
      v14 = objc_msgSend(v4, "userInterfaceStyle");
      v15 = objc_msgSend(v5, "userInterfaceStyle");

      if (v14 == v15)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    v16 = [PKDashboardTitleHeaderView alloc];
    v17 = *MEMORY[0x1E0C9D648];
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v21 = -[PKDashboardTitleHeaderView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], v18, v19, v20);
    sampleHeaderView = self->_sampleHeaderView;
    self->_sampleHeaderView = v21;

    v23 = -[PKSearchSuggestionCollectionViewCell initWithFrame:]([PKSearchSuggestionCollectionViewCell alloc], "initWithFrame:", v17, v18, v19, v20);
    sampleSuggestionCell = self->_sampleSuggestionCell;
    self->_sampleSuggestionCell = v23;

    -[PKSearchResultsViewController collectionView](self, "collectionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "reloadData");

    goto LABEL_8;
  }
LABEL_9:

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  _BOOL4 queryInProgress;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSMutableOrderedSet *lastQueries;
  NSString *v34;
  void *v35;
  void *v36;
  NSMutableDictionary *lastResultsPerQueryIdentifier;
  void *v38;
  NSString *v39;
  NSString *currentQueryIdentifier;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ++self->_presentationCounter;
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();

  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v10 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v9;
  v42 = (void *)v10;
  if (v10)
  {
    v11 = (void *)v10;
    v12 = objc_alloc(MEMORY[0x1E0D67728]);
    objc_msgSend(v11, "uniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithIdentifier:keyboardLanguage:passUniqueIdentifier:", v9, v7, v13);

  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67600]), "initWithIdentifier:keyboardLanguage:", v9, v7);
  }
  v43 = v4;
  objc_msgSend(v4, "searchBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);

  objc_msgSend(v5, "searchTextField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tokens");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v46 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "representedObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v19, "count"))
  {
    v26 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v14, "setTokens:", v26);

  }
  else
  {
    objc_msgSend(v14, "setTokens:", 0);
  }
  os_unfair_lock_lock(&self->_lockQuery);
  queryInProgress = self->_queryInProgress;
  os_unfair_lock_unlock(&self->_lockQuery);
  -[PKSearchResultsViewController _queryWithIdentifier:](self, "_queryWithIdentifier:", self->_currentQueryIdentifier);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = PKEqualObjects();

  if (queryInProgress && (v29 & 1) != 0)
  {
    v31 = v5;
    v30 = v43;
  }
  else
  {
    os_unfair_lock_lock(&self->_lockQuery);
    v32 = -[NSMutableOrderedSet indexOfObject:](self->_lastQueries, "indexOfObject:", v14);
    lastQueries = self->_lastQueries;
    if (v32 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableOrderedSet addObject:](lastQueries, "addObject:", v14);
      v34 = self->_currentQueryIdentifier;
      v35 = 0;
    }
    else
    {
      -[NSMutableOrderedSet objectAtIndex:](lastQueries, "objectAtIndex:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      lastResultsPerQueryIdentifier = self->_lastResultsPerQueryIdentifier;
      objc_msgSend(v36, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](lastResultsPerQueryIdentifier, "objectForKey:", v38);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0;
      v14 = v36;
    }
    objc_msgSend(v14, "identifier", 1168);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    currentQueryIdentifier = self->_currentQueryIdentifier;
    self->_currentQueryIdentifier = v39;

    os_unfair_lock_unlock(&self->_lockQuery);
    v30 = v43;
    if (v35)
    {
      -[PKSearchResultsViewController _updateUIWithResults:forQuery:completion:](self, "_updateUIWithResults:forQuery:completion:", v35, v14, 0);
      v31 = v5;
    }
    else
    {
      v31 = v5;
      if (v34)
        -[PKSearchService cancelQueryWithIdentifier:](self->_searchService, "cancelQueryWithIdentifier:", v34);
      os_unfair_lock_lock(&self->_lockQuery);
      *((_BYTE *)&self->super.super.super.super.isa + v41) = 1;
      os_unfair_lock_unlock(&self->_lockQuery);
      self->_queryIsReplay = 0;
      -[PKSearchService searchWithQuery:](self->_searchService, "searchWithQuery:", v14);
    }

  }
}

- (void)searchDidCompleteWithError:(id)a3 results:(id)a4 forIdentifier:(id)a5
{
  NSString *v8;
  id v9;
  id v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  _BOOL4 v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  NSString *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  id v50;
  void *v51;
  uint8_t v52[128];
  uint8_t buf[4];
  NSString *v54;
  __int16 v55;
  NSString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_lockQuery);
  v11 = self->_currentQueryIdentifier;
  v12 = (NSString *)v10;
  v13 = v12;
  if (v11 == v12)
  {

    goto LABEL_7;
  }
  if (!v12 || !v11)
  {

    goto LABEL_9;
  }
  v14 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

  if (v14)
LABEL_7:
    self->_queryInProgress = 0;
LABEL_9:
  os_unfair_lock_unlock(&self->_lockQuery);
  if (v8)
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v54 = v8;
      v55 = 2112;
      v56 = v13;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Error %@ for query %@", buf, 0x16u);
    }

    -[NSString domain](v8, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)*MEMORY[0x1E0D6B518];
    v18 = v16;
    v19 = v17;
    if (v18 == v19)
    {

    }
    else
    {
      v20 = v19;
      if (!v18 || !v19)
      {

        goto LABEL_21;
      }
      v21 = objc_msgSend(v18, "isEqualToString:", v19);

      if (!v21)
        goto LABEL_21;
    }
    v22 = -[NSString code](v8, "code") == 5;

    if (v22)
    {
      v18 = v9;
      v9 = objc_alloc_init(MEMORY[0x1E0D67608]);
LABEL_21:

    }
  }
  if (v9 && -[NSString code](v8, "code") != 4)
  {
    -[PKSearchResultsViewController _queryWithIdentifier:](self, "_queryWithIdentifier:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_initWeak((id *)buf, self);
      v24 = 0;
      v25 = 0;
      v26 = 0;
      switch(objc_msgSend(v23, "type"))
      {
        case 0:
          -[PKSearchResultsViewController _saveResults:forQuery:](self, "_saveResults:forQuery:", v9, v23);
          self->_hasReceivedResults = 1;
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __82__PKSearchResultsViewController_searchDidCompleteWithError_results_forIdentifier___block_invoke;
          v49[3] = &unk_1E3E619E0;
          v49[4] = self;
          v50 = v23;
          -[PKSearchResultsViewController _updateUIIfPossibleWithResults:query:completion:](self, "_updateUIIfPossibleWithResults:query:completion:", v9, v50, v49);

          v25 = 0;
          goto LABEL_42;
        case 1:
        case 2:
          break;
        case 3:
          objc_msgSend(v9, "categoryResults");
          v28 = objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        case 4:
          objc_msgSend(v9, "merchantResults");
          v28 = objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        case 5:
          v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v9, "transactionResults");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
          if (v31)
          {
            v32 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v46 != v32)
                  objc_enumerationMutation(v30);
                objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "transaction");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "addObject:", v34);

              }
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
            }
            while (v31);
          }

          v35 = (void *)objc_msgSend(v29, "copy");
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("transactionDate"), 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "sortedArrayUsingDescriptors:", v37);
          v26 = objc_claimAutoreleasedReturnValue();

          v25 = 0;
          goto LABEL_43;
        case 6:
          objc_msgSend(v9, "personResults");
          v28 = objc_claimAutoreleasedReturnValue();
LABEL_41:
          v25 = v28;
LABEL_42:
          v26 = 0;
LABEL_43:
          v24 = 0;
          break;
        case 7:
          objc_msgSend(v9, "locationResults");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 0;
          v24 = 1;
          break;
        default:
          v26 = 0;
          break;
      }
      if (v25 | v26)
      {
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __82__PKSearchResultsViewController_searchDidCompleteWithError_results_forIdentifier___block_invoke_2;
        v38[3] = &unk_1E3E65C20;
        objc_copyWeak(&v43, (id *)buf);
        v39 = v13;
        v40 = (id)v25;
        v44 = v24;
        v41 = v23;
        v42 = (id)v26;
        dispatch_async(MEMORY[0x1E0C80D38], v38);

        objc_destroyWeak(&v43);
      }

      objc_destroyWeak((id *)buf);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v13;
        _os_log_impl(&dword_19D178000, v27, OS_LOG_TYPE_DEFAULT, "Received results for unknown query identifier: %@", buf, 0xCu);
      }

    }
  }

}

void __82__PKSearchResultsViewController_searchDidCompleteWithError_results_forIdentifier___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2 && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1320) && !objc_msgSend(*(id *)(a1 + 40), "type"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1361) = 1;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

void __82__PKSearchResultsViewController_searchDidCompleteWithError_results_forIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD *WeakRetained;
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];
  uint64_t v28;

  v1 = a1;
  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "_isQueryIdentifierMatchingCurrentQuery:", *(_QWORD *)(v1 + 32))
      && v3[158] == v3[159])
    {
      v3[159] = 0;
      if (*(_QWORD *)(v1 + 40))
      {
        v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        obj = *(id *)(v1 + 40);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v23;
          do
          {
            v8 = 0;
            v20 = v6;
            do
            {
              if (*(_QWORD *)v23 != v7)
                objc_enumerationMutation(obj);
              v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
              objc_msgSend(v9, "group", v20);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v10);
              if (*(_BYTE *)(v1 + 72) && objc_msgSend(v10, "type") == 13)
              {
                v11 = v7;
                v12 = v4;
                v13 = v1;
                v14 = (void *)v3[131];
                objc_msgSend(v9, "group");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "regions");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "firstObject");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v14;
                v1 = v13;
                v4 = v12;
                v7 = v11;
                v6 = v20;
                objc_msgSend(v18, "updateCoordinatesForWorldRegionIfNeeded:", v17);

              }
              ++v8;
            }
            while (v6 != v8);
            v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          }
          while (v6);
        }

        objc_msgSend(v3, "_udpateOrPresentSeeAllViewControllerForQuery:groups:transactions:", *(_QWORD *)(v1 + 48), v4, 0);
      }
      else if (*(_QWORD *)(v1 + 56))
      {
        objc_msgSend(v3, "_udpateOrPresentSeeAllViewControllerForQuery:groups:transactions:", *(_QWORD *)(v1 + 48), 0);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "See all query results arrived too late, user searched for something else, not presenting", buf, 2u);
      }

    }
  }

}

- (void)invalidateSearchResults
{
  os_unfair_lock_s *p_lockQuery;
  _QWORD block[5];

  p_lockQuery = &self->_lockQuery;
  os_unfair_lock_lock(&self->_lockQuery);
  -[NSMutableDictionary removeAllObjects](self->_lastResultsPerQueryIdentifier, "removeAllObjects");
  os_unfair_lock_unlock(p_lockQuery);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKSearchResultsViewController_invalidateSearchResults__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __56__PKSearchResultsViewController_invalidateSearchResults__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_searchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "updateSearchResultsForSearchController:", v2);
    v2 = v3;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1320) = 1;
  }

}

- (id)_queryWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lockQuery;
  NSMutableOrderedSet *lastQueries;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  p_lockQuery = &self->_lockQuery;
  os_unfair_lock_lock(&self->_lockQuery);
  lastQueries = self->_lastQueries;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__PKSearchResultsViewController__queryWithIdentifier___block_invoke;
  v10[3] = &unk_1E3E6BE48;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](lastQueries, "enumerateObjectsUsingBlock:", v10);
  os_unfair_lock_unlock(p_lockQuery);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __54__PKSearchResultsViewController__queryWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = v7;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_9;
    }
    v12 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_9;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *a4 = 1;
LABEL_9:

}

- (BOOL)_isQueryIdentifierMatchingCurrentQuery:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lockQuery;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;

  v4 = a3;
  p_lockQuery = &self->_lockQuery;
  os_unfair_lock_lock(&self->_lockQuery);
  v6 = self->_currentQueryIdentifier;
  os_unfair_lock_unlock(p_lockQuery);
  v7 = v6;
  v8 = (NSString *)v4;
  v9 = v8;
  if (v7 == v8)
  {
    v10 = 1;
  }
  else
  {
    v10 = 0;
    if (v8 && v7)
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);
  }

  return v10;
}

- (void)_saveResults:(id)a3 forQuery:(id)a4
{
  id v6;
  void *v7;
  NSString *currentQueryIdentifier;
  PKSearchResults *currentResults;
  NSString *v10;
  NSString *v11;
  int v12;
  PKSearchResults *v13;
  NSMutableDictionary *lastResultsPerQueryIdentifier;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lockQuery);
  if (!v6)
    goto LABEL_13;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  currentQueryIdentifier = self->_currentQueryIdentifier;
  currentResults = v7;
  v10 = currentQueryIdentifier;
  if (currentResults == (PKSearchResults *)v10)
  {

    goto LABEL_8;
  }
  v11 = v10;
  if (!currentResults || !v10)
  {

    goto LABEL_10;
  }
  v12 = -[PKSearchResults isEqualToString:](currentResults, "isEqualToString:", v10);

  if (v12)
  {
LABEL_8:
    v13 = (PKSearchResults *)v19;
    currentResults = self->_currentResults;
    self->_currentResults = v13;
LABEL_10:

  }
  lastResultsPerQueryIdentifier = self->_lastResultsPerQueryIdentifier;
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](lastResultsPerQueryIdentifier, "setObject:forKey:", v19, v15);

  if (-[NSMutableDictionary count](self->_lastResultsPerQueryIdentifier, "count") == 10)
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_lastQueries, "objectAtIndex:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_lastResultsPerQueryIdentifier;
    objc_msgSend(v16, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v18);

    -[NSMutableOrderedSet removeObjectAtIndex:](self->_lastQueries, "removeObjectAtIndex:", 0);
  }
LABEL_13:
  os_unfair_lock_unlock(&self->_lockQuery);

}

- (id)_groupItemForTransactionGroup:(id)a3 tokens:(id)a4
{
  id v6;
  id v7;
  PKDashboardPaymentTransactionGroupItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
  -[PKDashboardPaymentTransactionGroupItem setGroup:](v8, "setGroup:", v7);

  -[PKDashboardPaymentTransactionGroupItem setTokens:](v8, "setTokens:", v6);
  -[PKDashboardPaymentTransactionGroupItem setFamilyCollection:](v8, "setFamilyCollection:", self->_familyCollection);
  -[PKDashboardPaymentTransactionGroupItem setTransactionSourceCollection:](v8, "setTransactionSourceCollection:", self->_transactionSourceCollection);
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "associatedAccountServiceAccountIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_accountsPerIdentifier, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPaymentTransactionGroupItem setAccount:](v8, "setAccount:", v12);

    -[NSDictionary objectForKey:](self->_accountUserCollectionsPerIdentifier, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPaymentTransactionGroupItem setAccountUserCollection:](v8, "setAccountUserCollection:", v13);

    -[NSDictionary objectForKey:](self->_physicalCardsPerIdentifier, "objectForKey:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPaymentTransactionGroupItem setPhysicalCards:](v8, "setPhysicalCards:", v14);

  }
  return v8;
}

- (void)_updateUIWithResults:(id)a3 forQuery:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queuePrepareResults;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    queuePrepareResults = self->_queuePrepareResults;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke;
    v12[3] = &unk_1E3E622D8;
    v12[4] = self;
    v13 = v9;
    v14 = v8;
    v15 = v10;
    dispatch_async(queuePrepareResults, v12);

  }
}

void __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke(id *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PKDashboardPaymentTransactionItem *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  char v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  char v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t n;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t ii;
  void *v95;
  PKDashboardPaymentTransactionGroupItem *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  void *v109;
  BOOL v110;
  char v111;
  id v112;
  id v113;
  id obj;
  id obja;
  id objb;
  id v117;
  uint64_t v118;
  id v119;
  void *v120;
  uint64_t v121;
  id v122;
  void *v123;
  id v124;
  _QWORD block[4];
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  char v139;
  id location;
  _QWORD v141[4];
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "_isQueryIdentifierMatchingCurrentQuery:", v3);

  if ((_DWORD)v2)
  {
    v112 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(a1[5], "tokens");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "categoryResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1[6], "categoryResults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = objc_msgSend(v6, "count") != 0;

      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      v170 = 0u;
      objc_msgSend(a1[6], "categoryResults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v167, v177, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v168;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v168 != v11)
              objc_enumerationMutation(v8);
            v13 = a1[4];
            objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * i), "group");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_groupItemForTransactionGroup:tokens:", v14, v4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "addObject:", v15);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v167, v177, 16);
        }
        while (v10);
      }

    }
    else
    {
      v7 = 0;
      v110 = 0;
    }
    objc_msgSend(a1[6], "transactionResults", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v120 = (void *)v4;
    if (v18)
    {
      objc_msgSend(a1[6], "transactionResults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      v21 = v110;
      if (v20)
        v21 = 1;
      v111 = v21;
      v117 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v163 = 0u;
      v164 = 0u;
      v165 = 0u;
      v166 = 0u;
      objc_msgSend(a1[6], "transactionResults");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v176, 16);
      if (v121)
      {
        v118 = *(_QWORD *)v164;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v164 != v118)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * v22);
            objc_msgSend(v23, "transaction");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "passUniqueIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)a1[4] + 140), "paymentPass");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v26)
            {
              v28 = v26;
LABEL_24:
              objc_msgSend(v24, "accountIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*((id *)a1[4] + 137), "objectForKey:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*((id *)a1[4] + 138), "objectForKey:", v29);
              v123 = v27;
              v31 = v28;
              v32 = v25;
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = -[PKDashboardPaymentTransactionItem initWithTransactionSourceCollection:familyCollection:transaction:account:accountUserCollection:bankConnectInstitution:]([PKDashboardPaymentTransactionItem alloc], "initWithTransactionSourceCollection:familyCollection:transaction:account:accountUserCollection:bankConnectInstitution:", *((_QWORD *)a1[4] + 140), *((_QWORD *)a1[4] + 132), v24, v30, v33, 0);
              objc_msgSend(v117, "addObject:", v34);

              v25 = v32;
              v27 = v123;
              goto LABEL_25;
            }
            objc_msgSend(*((id *)a1[4] + 156), "objectForKey:", v25);
            v35 = objc_claimAutoreleasedReturnValue();
            v28 = (id)v35;
            if (v25)
            {
              objc_msgSend(v112, "addObject:", v25);
              if (v28)
                goto LABEL_24;
              objc_msgSend(*((id *)a1[4] + 135), "passWithUniqueID:", v25);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "paymentPass");
              v28 = (id)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(*((id *)a1[4] + 156), "setObject:forKey:", v28, v25);
                goto LABEL_24;
              }
            }
            else if (v35)
            {
              goto LABEL_24;
            }
LABEL_25:

            ++v22;
          }
          while (v121 != v22);
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v176, 16);
          v121 = v37;
        }
        while (v37);
      }

      v4 = (uint64_t)v120;
      v38 = v111;
    }
    else
    {
      v117 = 0;
      v38 = v110;
    }
    objc_msgSend(a1[6], "merchantResults");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(a1[6], "merchantResults");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      if (v41)
        v38 = 1;
      v124 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v159 = 0u;
      v160 = 0u;
      v161 = 0u;
      v162 = 0u;
      objc_msgSend(a1[6], "merchantResults");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v159, v175, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v160;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v160 != v45)
              objc_enumerationMutation(v42);
            v47 = a1[4];
            objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 8 * j), "group");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "_groupItemForTransactionGroup:tokens:", v48, v4);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v124, "addObject:", v49);
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v159, v175, 16);
        }
        while (v44);
      }

    }
    else
    {
      v124 = 0;
    }
    objc_msgSend(a1[6], "personResults");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend(a1[6], "personResults");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "count");

      if (v52)
        v53 = 1;
      else
        v53 = v38;
      v122 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v155 = 0u;
      v156 = 0u;
      v157 = 0u;
      v158 = 0u;
      objc_msgSend(a1[6], "personResults");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v155, v174, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v156;
        do
        {
          for (k = 0; k != v56; ++k)
          {
            if (*(_QWORD *)v156 != v57)
              objc_enumerationMutation(v54);
            v59 = a1[4];
            objc_msgSend(*(id *)(*((_QWORD *)&v155 + 1) + 8 * k), "group");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "_groupItemForTransactionGroup:tokens:", v60, v4);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v122, "addObject:", v61);
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v155, v174, 16);
        }
        while (v56);
      }

      v38 = v53;
    }
    else
    {
      v122 = 0;
    }
    objc_msgSend(a1[6], "locationResults");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend(a1[6], "locationResults");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "count");

      if (v64)
        v38 = 1;
      v119 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v151 = 0u;
      v152 = 0u;
      v153 = 0u;
      v154 = 0u;
      objc_msgSend(a1[6], "locationResults");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v151, v173, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v152;
        do
        {
          for (m = 0; m != v66; ++m)
          {
            if (*(_QWORD *)v152 != v67)
              objc_enumerationMutation(obja);
            v69 = a1[4];
            objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * m), "group");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "_groupItemForTransactionGroup:tokens:", v70, v120);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v119, "addObject:", v71);
            v72 = (void *)*((_QWORD *)a1[4] + 131);
            objc_msgSend(v71, "group");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "regions");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "firstObject");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "updateCoordinatesForWorldRegionIfNeeded:", v75);

          }
          v66 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v151, v173, 16);
        }
        while (v66);
      }

    }
    else
    {
      v119 = 0;
    }
    objc_msgSend(a1[6], "suggestedAutocompleteTokens");
    objb = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(objb, "count"))
    {
      v149 = 0u;
      v150 = 0u;
      v147 = 0u;
      v148 = 0u;
      v76 = objb;
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v147, v172, 16);
      if (v77)
      {
        v78 = v77;
        v79 = *(_QWORD *)v148;
        do
        {
          for (n = 0; n != v78; ++n)
          {
            if (*(_QWORD *)v148 != v79)
              objc_enumerationMutation(v76);
            v81 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * n);
            if (!objc_msgSend(v81, "tokenType"))
            {
              objc_msgSend(v81, "group");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v82, "type") == 13)
              {
                v83 = (void *)*((_QWORD *)a1[4] + 131);
                objc_msgSend(v82, "regions");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "firstObject");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "updateCoordinatesForWorldRegionIfNeeded:", v85);

              }
            }
          }
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v147, v172, 16);
        }
        while (v78);
      }

      v38 = 1;
    }
    v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1[6], "transactionTagResults");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (v87)
    {
      objc_msgSend(a1[6], "transactionTagResults");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v88, "count");

      if (v89)
        v38 = 1;
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      objc_msgSend(a1[6], "transactionTagResults");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v143, v171, 16);
      if (v91)
      {
        v92 = v91;
        v93 = *(_QWORD *)v144;
        do
        {
          for (ii = 0; ii != v92; ++ii)
          {
            if (*(_QWORD *)v144 != v93)
              objc_enumerationMutation(v90);
            v95 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * ii);
            v96 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
            objc_msgSend(v95, "group");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPaymentTransactionGroupItem setGroup:](v96, "setGroup:", v97);

            objc_msgSend(v86, "addObject:", v96);
          }
          v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v143, v171, 16);
        }
        while (v92);
      }

    }
    v98 = (void *)*((_QWORD *)a1[4] + 156);
    v99 = MEMORY[0x1E0C809B0];
    v141[0] = MEMORY[0x1E0C809B0];
    v141[1] = 3221225472;
    v141[2] = __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_2;
    v141[3] = &unk_1E3E6BE70;
    v142 = v112;
    v113 = v112;
    objc_msgSend(v98, "keysOfEntriesPassingTest:", v141);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = (void *)*((_QWORD *)a1[4] + 156);
    objc_msgSend(v100, "allObjects");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "removeObjectsForKeys:", v102);

    objc_initWeak(&location, a1[4]);
    v127[0] = v99;
    v127[1] = 3221225472;
    v127[2] = __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_3;
    v127[3] = &unk_1E3E6BE98;
    objc_copyWeak(&v138, &location);
    v137 = a1[7];
    v128 = a1[5];
    v129 = v109;
    v130 = a1[4];
    v131 = v117;
    v132 = v124;
    v133 = v122;
    v134 = v119;
    v135 = v86;
    v136 = a1[6];
    v139 = v38;
    v103 = v86;
    v104 = v119;
    v105 = v122;
    v106 = v124;
    v107 = v117;
    v108 = v109;
    dispatch_async(MEMORY[0x1E0C80D38], v127);

    objc_destroyWeak(&v138);
    objc_destroyWeak(&location);

    v17 = v120;
  }
  else
  {
    v16 = a1[7];
    if (!v16)
      return;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_187;
    block[3] = &unk_1E3E61590;
    v126 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v17 = v126;
  }

}

uint64_t __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  if (WeakRetained
    && (objc_msgSend(*(id *)(a1 + 32), "identifier"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(WeakRetained, "_isQueryIdentifierMatchingCurrentQuery:", v3),
        v3,
        v4))
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6 = objc_msgSend(v5, "copy");
      v7 = (void *)*((_QWORD *)WeakRetained + 150);
      *((_QWORD *)WeakRetained + 150) = v6;

    }
    TransactionIdentifierFromItems(*(void **)(*(_QWORD *)(a1 + 48) + 1192));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    TransactionIdentifierFromItems(*(void **)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 56) && (PKEqualObjects() & 1) == 0)
    {
      v10 = objc_msgSend(*(id *)(a1 + 56), "copy");
      v11 = (void *)*((_QWORD *)WeakRetained + 149);
      *((_QWORD *)WeakRetained + 149) = v10;

    }
    v12 = *(void **)(a1 + 64);
    if (v12)
    {
      v13 = objc_msgSend(v12, "copy");
      v14 = (void *)*((_QWORD *)WeakRetained + 151);
      *((_QWORD *)WeakRetained + 151) = v13;

    }
    v15 = *(void **)(a1 + 72);
    if (v15)
    {
      v16 = objc_msgSend(v15, "copy");
      v17 = (void *)*((_QWORD *)WeakRetained + 153);
      *((_QWORD *)WeakRetained + 153) = v16;

    }
    v18 = *(void **)(a1 + 80);
    if (v18)
    {
      v19 = objc_msgSend(v18, "copy");
      v20 = (void *)*((_QWORD *)WeakRetained + 152);
      *((_QWORD *)WeakRetained + 152) = v19;

    }
    v21 = *(void **)(a1 + 88);
    if (v21)
    {
      v22 = objc_msgSend(v21, "copy");
      v23 = (void *)*((_QWORD *)WeakRetained + 154);
      *((_QWORD *)WeakRetained + 154) = v22;

    }
    objc_msgSend(*(id *)(a1 + 96), "suggestedAutocompleteTokens");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)WeakRetained + 155);
    *((_QWORD *)WeakRetained + 155) = v24;

    objc_storeStrong((id *)WeakRetained + 144, *(id *)(a1 + 32));
    if (*(_BYTE *)(a1 + 120))
      v26 = *((_BYTE *)WeakRetained + 1296) != 0;
    else
      v26 = 1;
    *((_BYTE *)WeakRetained + 1296) = *(_BYTE *)(a1 + 120) ^ 1;
    if (*(_BYTE *)(a1 + 120))
    {
      *((_BYTE *)WeakRetained + 1297) = 1;
      *((_BYTE *)WeakRetained + 1298) = 1;
    }
    else
    {
      *((_BYTE *)WeakRetained + 1297) = objc_msgSend(*((id *)WeakRetained + 133), "canProvideFullResults") ^ 1;
      v28 = objc_msgSend(*((id *)WeakRetained + 133), "hasSearchableContentForQuery:", *(_QWORD *)(a1 + 32));
      *((_BYTE *)WeakRetained + 1298) = v28;
      PKLogFacilityTypeGetObject();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = CFSTR("YES");
        if (*((_BYTE *)WeakRetained + 1297))
          v31 = CFSTR("YES");
        else
          v31 = CFSTR("NO");
        if (!v28)
          v30 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v49 = v31;
        v50 = 2112;
        v51 = v30;
        _os_log_impl(&dword_19D178000, v29, OS_LOG_TYPE_DEFAULT, "Empty results set, full results not available: %@, has content: %@", buf, 0x16u);
      }

    }
    if (objc_msgSend(WeakRetained, "isViewLoaded"))
    {
      if (v26)
        objc_msgSend(WeakRetained, "_setNeedsUpdateContentUnavailableConfiguration");
      objc_msgSend(WeakRetained, "collectionView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(*(id *)(a1 + 32), "isEmpty");
      objc_msgSend(v32, "reloadData");
      if (*((_BYTE *)WeakRetained + 1360))
      {
        if (!v33 || !*(_BYTE *)(a1 + 120))
        {
          *((_BYTE *)WeakRetained + 1360) = 0;
          objc_msgSend(WeakRetained, "_resultsLayout");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setCollectionViewLayout:animated:", v34, 0);

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v32, "subviews", 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v37; ++i)
              {
                if (*(_QWORD *)v44 != v38)
                  objc_enumerationMutation(v35);
                objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "removeFromSuperview");
              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
            }
            while (v37);
          }

          objc_msgSend(WeakRetained, "_resultsLayout");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setCollectionViewLayout:animated:", v40, 0);

          objc_msgSend(v32, "reloadData");
        }
      }
      else if (v33 && *(_BYTE *)(a1 + 120))
      {
        *((_BYTE *)WeakRetained + 1360) = 1;
        objc_msgSend(WeakRetained, "_thumbnailLayout");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setCollectionViewLayout:animated:", v41, 0);

      }
    }
    v42 = *(_QWORD *)(a1 + 104);
    if (v42)
      (*(void (**)(void))(v42 + 16))();

  }
  else
  {
    v27 = *(_QWORD *)(a1 + 104);
    if (v27)
      (*(void (**)(void))(v27 + 16))();
  }

}

uint64_t __74__PKSearchResultsViewController__updateUIWithResults_forQuery_completion___block_invoke_187(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateUIIfPossibleWithResults:(id)a3 query:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && self->_hasReceivedResults && self->_hasLoadedRequiredData)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__PKSearchResultsViewController__updateUIIfPossibleWithResults_query_completion___block_invoke;
    v12[3] = &unk_1E3E61850;
    v12[4] = self;
    v13 = v10;
    -[PKSearchResultsViewController _updateUIWithResults:forQuery:completion:](self, "_updateUIWithResults:forQuery:completion:", v8, v9, v12);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

uint64_t __81__PKSearchResultsViewController__updateUIIfPossibleWithResults_query_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  uint8_t v8[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "First set of results presented", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1368);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1368);
    *(_QWORD *)(v5 + 1368) = 0;

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)setQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKSearchResultsViewController _searchController](self, "_searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v19 = v7;
    v20 = v5;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v21 = v4;
    objc_msgSend(v4, "tokens");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
          v23 = 0;
          v24 = 0;
          -[PKTransactionGroupItemPresenter contactResolver](self->_transactionGroupPresenter, "contactResolver", v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v24, &v23, 1, v13, v14);
          v15 = v24;
          v16 = v23;

          objc_msgSend(MEMORY[0x1E0DC3C50], "tokenWithIcon:text:", v16, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setRepresentedObject:", v13);

          objc_msgSend(v8, "addObject:", v17);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    v7 = v19;
    objc_msgSend(v19, "setTokens:", v8);
    v4 = v21;
    objc_msgSend(v21, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    v5 = v20;
  }
  else
  {
    objc_msgSend(v7, "setTokens:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v7, "setText:", &stru_1E3E7D690);
  }

}

- (void)preflightWithCompletion:(id)a3
{
  void *v4;
  id pendingPreflightCompletion;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSString *v13;
  NSString *currentQueryIdentifier;
  id v15;

  v4 = _Block_copy(a3);
  pendingPreflightCompletion = self->_pendingPreflightCompletion;
  self->_pendingPreflightCompletion = v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D67728]);
    objc_msgSend(v10, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v11, "initWithIdentifier:keyboardLanguage:passUniqueIdentifier:", v7, v9, v12);

  }
  else
  {
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D67600]), "initWithIdentifier:keyboardLanguage:", v7, v9);
  }
  objc_msgSend(v15, "setText:", &stru_1E3E7D690);
  os_unfair_lock_lock(&self->_lockQuery);
  -[NSMutableOrderedSet addObject:](self->_lastQueries, "addObject:", v15);
  objc_msgSend(v15, "identifier");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentQueryIdentifier = self->_currentQueryIdentifier;
  self->_currentQueryIdentifier = v13;

  self->_queryInProgress = 1;
  os_unfair_lock_unlock(&self->_lockQuery);
  self->_queryIsReplay = 0;
  -[PKSearchService searchWithQuery:](self->_searchService, "searchWithQuery:", v15);

}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  BOOL foregroundActive;

  foregroundActive = self->_foregroundActiveState.foregroundActive;
  self->_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)a4;
  if (!foregroundActive && (*(_WORD *)&a4 & 0x100) != 0 && self->_fullResultsNotAvailable)
    -[PKSearchResultsViewController invalidateSearchResults](self, "invalidateSearchResults", a3);
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PKSearchResultsViewController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E3E618F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKSearchResultsViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

}

BOOL __50__PKSearchResultsViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  CGRect v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 1328);
  v4 = *(double *)(v2 + 1336);
  v5 = *(double *)(v2 + 1344);
  v6 = *(double *)(v2 + 1352);
  *(_BYTE *)(v2 + 1321) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = (_QWORD *)(v8 + 1328);
  if (v7)
  {
    objc_msgSend(v7, "CGRectValue");
    *v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)v9 = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v8 + 1344) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1328), v16);
}

- (void)keyboardWillChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (self->_keyboardVisible)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __52__PKSearchResultsViewController_keyboardWillChange___block_invoke;
      v7[3] = &unk_1E3E618F0;
      v7[4] = self;
      v8 = v6;
      -[PKSearchResultsViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

      v5 = v6;
    }

  }
}

BOOL __52__PKSearchResultsViewController_keyboardWillChange___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v13;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2 + 166;
  v4 = *((double *)v2 + 166);
  v5 = *((double *)v2 + 167);
  v6 = *((double *)v2 + 168);
  v7 = *((double *)v2 + 169);
  objc_msgSend(*(id *)(a1 + 40), "CGRectValue");
  *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1328), v13);
}

- (void)keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PKSearchResultsViewController_keyboardWillHide___block_invoke;
  v3[3] = &unk_1E3E61918;
  v3[4] = self;
  -[PKSearchResultsViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v3);
}

BOOL __50__PKSearchResultsViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect v8;

  v1 = *(_QWORD *)(a1 + 32);
  v8 = *(CGRect *)(v1 + 1328);
  *(_BYTE *)(v1 + 1321) = 0;
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1328);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v2 = *MEMORY[0x1E0C9D628];
  v2[1] = v3;
  *(_QWORD *)&v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1328);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1344);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1352);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  unsigned int (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = (unsigned int (**)(_QWORD))a3;
  if (v4)
  {
    -[PKSearchResultsViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "layoutIfNeeded");
      if (v4[2](v4))
      {
        objc_msgSend(v6, "setNeedsLayout");
        v7 = (void *)MEMORY[0x1E0DC3F10];
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __64__PKSearchResultsViewController__updateLayoutForKeyboardAction___block_invoke;
        v8[3] = &unk_1E3E612E8;
        v9 = v6;
        objc_msgSend(v7, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v8, 0);

      }
    }
    else
    {
      v4[2](v4);
    }

  }
}

uint64_t __64__PKSearchResultsViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
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
  v7[2] = __66__PKSearchResultsViewController_worldRegionUpdated_updatedRegion___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __66__PKSearchResultsViewController_worldRegionUpdated_updatedRegion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1216);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (!v3)
    goto LABEL_17;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v43;
  while (2)
  {
    v7 = 0;
    v8 = v4 + v5;
    do
    {
      if (*(_QWORD *)v43 != v6)
        objc_enumerationMutation(v2);
      v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v7);
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v9, "group");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v10, "_updateGroup:withRegion:", v11, *(_QWORD *)(a1 + 40));

      if ((_DWORD)v10)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v5 + v7, 8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "collectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cellForItemAtIndexPath:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = *(char **)(a1 + 32);
            v16 = 1040;
LABEL_15:
            v17 = *(void **)&v15[v16];
            objc_msgSend(v15, "collectionView");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "updateCell:forItem:inCollectionView:atIndexPath:", v14, v9, v18, v12);

            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = *(char **)(a1 + 32);
            v16 = 1032;
            goto LABEL_15;
          }
        }
LABEL_16:

        goto LABEL_17;
      }
      ++v7;
    }
    while (v4 != v7);
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    v5 = v8;
    if (v4)
      continue;
    break;
  }
LABEL_17:

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "locationTokens");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v39;
LABEL_19:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v23), "group");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v24) = objc_msgSend(v24, "_updateGroup:withRegion:", v25, *(_QWORD *)(a1 + 40));

      if ((v24 & 1) != 0)
        break;
      if (v21 == ++v23)
      {
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v21)
          goto LABEL_19;
        break;
      }
    }
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v26 = *(id *)(*(_QWORD *)(a1 + 32) + 1240);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v35;
LABEL_27:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v30);
      if (!objc_msgSend(v31, "tokenType", (_QWORD)v34))
      {
        objc_msgSend(v31, "group");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(*(id *)(a1 + 32), "_updateGroup:withRegion:", v32, *(_QWORD *)(a1 + 40));

        if ((v33 & 1) != 0)
          break;
      }
      if (v28 == ++v30)
      {
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        if (v28)
          goto LABEL_27;
        break;
      }
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

- (void)_initiateSeeAllPresentationForQuery:(id)a3
{
  id v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *seeAllPresentationTimer;
  void *seeAllPresentationCounter;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v4 = a3;
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  seeAllPresentationTimer = self->_seeAllPresentationTimer;
  self->_seeAllPresentationTimer = v5;

  seeAllPresentationCounter = (void *)self->_seeAllPresentationCounter;
  v8 = self->_seeAllPresentationTimer;
  v9 = dispatch_time(0, 300000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
  objc_initWeak(&location, self);
  v10 = self->_seeAllPresentationTimer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PKSearchResultsViewController__initiateSeeAllPresentationForQuery___block_invoke;
  v12[3] = &unk_1E3E671C0;
  objc_copyWeak(v14, &location);
  v14[1] = seeAllPresentationCounter;
  v13 = v4;
  v11 = v4;
  dispatch_source_set_event_handler(v10, v12);
  dispatch_resume((dispatch_object_t)self->_seeAllPresentationTimer);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __69__PKSearchResultsViewController__initiateSeeAllPresentationForQuery___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *((_QWORD *)WeakRetained + 161);
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = (void *)v3[161];
      v3[161] = 0;

    }
    if (*(_QWORD *)(a1 + 48) == v3[159])
    {
      v6 = *(void **)(a1 + 32);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __69__PKSearchResultsViewController__initiateSeeAllPresentationForQuery___block_invoke_2;
      v7[3] = &unk_1E3E6BEC0;
      v7[4] = v3;
      v8 = v6;
      objc_msgSend(v3, "_seeAllHeaderGroupForQuery:groups:transactions:completion:", v8, 0, 0, v7);

    }
  }

}

void __69__PKSearchResultsViewController__initiateSeeAllPresentationForQuery___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_historyViewControllerForQuery:groups:headerGroup:", *(_QWORD *)(a1 + 40), 0, a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1280);
  *(_QWORD *)(v4 + 1280) = v3;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1280), 1);

}

- (void)_seeAllHeaderGroupForQuery:(id)a3 groups:(id)a4 transactions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (*v19)(void);
  unint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  PKSearchResultsViewController *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD *v59;
  uint64_t *v60;
  uint64_t *v61;
  _QWORD v62[5];
  id v63;
  uint64_t *v64;
  _QWORD v65[5];
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v49 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0D67388]);
  objc_msgSend(v13, "setType:", 14);
  v47 = v10;
  objc_msgSend(v13, "setSearchQuery:", v10);
  v46 = v11;
  v48 = v12;
  if (v12)
  {
    objc_msgSend(v13, "setTransactionCount:", objc_msgSend(v12, "count"));
    v14 = v13;
    objc_msgSend(v13, "setTransactions:", v12);
    objc_msgSend(v12, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transactionDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEndDate:", v16);

    objc_msgSend(v48, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transactionDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStartDate:", v18);

    v13 = v14;
    v19 = (void (*)(void))v49[2];
LABEL_3:
    v19();
    goto LABEL_42;
  }
  v44 = self;
  if (!v11)
  {
    v19 = (void (*)(void))v49[2];
    goto LABEL_3;
  }
  v20 = objc_msgSend(v10, "type") - 3;
  if (v20 > 4)
    v21 = 1;
  else
    v21 = qword_19DF163E0[v20];
  v45 = v13;
  objc_msgSend(v13, "setSecondaryType:", v21);
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v11;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  if (v53)
  {
    v55 = 0;
    v51 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v89 != v51)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        if (objc_msgSend(v23, "type") == 13)
        {
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          objc_msgSend(v23, "regions");
          v56 = (id)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
          if (v54)
          {
            v24 = *(_QWORD *)v85;
            v50 = *(_QWORD *)v85;
            do
            {
              for (j = 0; j != v54; ++j)
              {
                if (*(_QWORD *)v85 != v24)
                  objc_enumerationMutation(v56);
                v26 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
                v80 = 0u;
                v81 = 0u;
                v82 = 0u;
                v83 = 0u;
                v27 = obj;
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
                if (v28)
                {
                  v29 = *(_QWORD *)v81;
                  while (2)
                  {
                    for (k = 0; k != v28; ++k)
                    {
                      if (*(_QWORD *)v81 != v29)
                        objc_enumerationMutation(v27);
                      v31 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * k);
                      if (v31 != v23)
                      {
                        objc_msgSend(v31, "regions");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        v33 = objc_msgSend(v26, "isIncludedInRegions:", v32);

                        if (v33)
                        {

                          goto LABEL_34;
                        }
                      }
                    }
                    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
                    if (v28)
                      continue;
                    break;
                  }
                }

                v24 = v50;
              }
              v54 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
              v24 = v50;
            }
            while (v54);
          }

        }
        v55 += objc_msgSend(v23, "transactionCount");
LABEL_34:
        ;
      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
    }
    while (v53);
  }
  else
  {
    v55 = 0;
  }

  objc_msgSend(v45, "setTransactionCount:", v55);
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__23;
  v78 = __Block_byref_object_dispose__23;
  v79 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__23;
  v72 = __Block_byref_object_dispose__23;
  v73 = 0;
  objc_msgSend(v47, "dateToken");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v36 = MEMORY[0x1E0C809B0];
  if (v34)
  {
    objc_msgSend(v34, "startDate");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v75[5];
    v75[5] = v37;

    objc_msgSend(v34, "endDate");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (id)v69[5];
    v69[5] = v39;
  }
  else
  {
    -[PKTransactionSourceCollection transactionSourceIdentifiers](v44->_transactionSourceCollection, "transactionSourceIdentifiers");
    v65[0] = v36;
    v65[1] = 3221225472;
    v65[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke;
    v65[3] = &unk_1E3E63610;
    v65[4] = v44;
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v66 = v41;
    v67 = &v74;
    objc_msgSend(v35, "addOperation:", v65);
    v62[0] = v36;
    v62[1] = 3221225472;
    v62[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_3;
    v62[3] = &unk_1E3E63610;
    v62[4] = v44;
    v40 = v41;
    v63 = v40;
    v64 = &v68;
    objc_msgSend(v35, "addOperation:", v62);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v36;
  v57[1] = 3221225472;
  v57[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_5;
  v57[3] = &unk_1E3E6BF10;
  v58 = v45;
  v60 = &v74;
  v61 = &v68;
  v59 = v49;
  v43 = (id)objc_msgSend(v35, "evaluateWithInput:completion:", v42, v57);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

  v13 = v45;
LABEL_42:

}

void __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = a1[5];
  v9 = *(void **)(a1[4] + 1088);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_2;
  v13[3] = &unk_1E3E63660;
  v10 = a1[6];
  v15 = v7;
  v16 = v10;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:", v8, 0, 1, 0, 0, -1, 1, v13);

}

uint64_t __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transactionDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = a1[5];
  v9 = *(void **)(a1[4] + 1088);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_4;
  v13[3] = &unk_1E3E63660;
  v10 = a1[6];
  v15 = v7;
  v16 = v10;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:", v8, 0, 1, 0, 0, 1, 1, v13);

}

uint64_t __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transactionDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD block[4];
  id v7;
  __int128 v8;
  uint64_t v9;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_6;
  block[3] = &unk_1E3E6BEE8;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  v7 = v2;
  v9 = v3;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __91__PKSearchResultsViewController__seeAllHeaderGroupForQuery_groups_transactions_completion___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setStartDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setEndDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_historyViewControllerForQuery:(id)a3 groups:(id)a4 headerGroup:(id)a5
{
  id v8;
  id v9;
  PKTransactionSourceCollection *transactionSourceCollection;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PKTransactionHistoryViewController *v15;
  PKTransactionHistoryViewController *v16;
  void *v17;
  void *v18;
  PKTransactionHistoryViewController *v19;
  void *v20;
  void *v21;
  PKWorldRegionUpdater *regionUpdater;
  PKTransactionGroupItemPresenter *transactionGroupPresenter;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  transactionSourceCollection = self->_transactionSourceCollection;
  v11 = a5;
  -[PKTransactionSourceCollection paymentPass](transactionSourceCollection, "paymentPass");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "associatedAccountServiceAccountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_accountsPerIdentifier, "objectForKey:", v12);
  v26 = objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_accountUserCollectionsPerIdentifier, "objectForKey:", v12);
  v25 = objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_physicalCardsPerIdentifier, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "type");
  v15 = [PKTransactionHistoryViewController alloc];
  v16 = v15;
  if (v14 == 5)
  {
    v18 = (void *)v25;
    v17 = (void *)v26;
    v19 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:](v15, "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v11, self->_transactionSourceCollection, self->_familyCollection, v26, v25, v13, 0, 0, 0);

  }
  else
  {
    regionUpdater = self->_regionUpdater;
    transactionGroupPresenter = self->_transactionGroupPresenter;
    objc_msgSend(v8, "tokens");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)v25;
    v17 = (void *)v26;
    v19 = -[PKTransactionHistoryViewController initWithTransactionGroups:headerGroup:groupPresenter:regionUpdater:tokens:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:](v16, "initWithTransactionGroups:headerGroup:groupPresenter:regionUpdater:tokens:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v9, v11, transactionGroupPresenter, regionUpdater, v20, self->_transactionSourceCollection, self->_familyCollection, v26, v25, v13);

  }
  -[PKTransactionGroupItemPresenter avatarManager](self->_transactionGroupPresenter, "avatarManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionHistoryViewController setContactAvatarManager:](v19, "setContactAvatarManager:", v21);

  return v19;
}

- (void)_udpateOrPresentSeeAllViewControllerForQuery:(id)a3 groups:(id)a4 transactions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__PKSearchResultsViewController__udpateOrPresentSeeAllViewControllerForQuery_groups_transactions___block_invoke;
  v12[3] = &unk_1E3E6BF38;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[PKSearchResultsViewController _seeAllHeaderGroupForQuery:groups:transactions:completion:](self, "_seeAllHeaderGroupForQuery:groups:transactions:completion:", v11, v10, a5, v12);

}

void __98__PKSearchResultsViewController__udpateOrPresentSeeAllViewControllerForQuery_groups_transactions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  if (*(_QWORD *)(v4 + 1280))
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "type");
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1280);
    if (v5 == 5)
      objc_msgSend(v6, "updateGroup:", v12);
    else
      objc_msgSend(v6, "updateGroups:headerGroup:", *(_QWORD *)(a1 + 48), v12);
    v11 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v11 + 1280);
    *(_QWORD *)(v11 + 1280) = 0;
  }
  else
  {
    if (*(_QWORD *)(v4 + 1288))
    {
      dispatch_source_cancel(*(dispatch_source_t *)(v4 + 1288));
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 1288);
      *(_QWORD *)(v7 + 1288) = 0;

      v3 = v12;
      v4 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v4, "_historyViewControllerForQuery:groups:headerGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v9, 1);

  }
}

- (void)accountAdded:(id)a3
{
  -[PKSearchResultsViewController _updateAccountsWithCompletion:](self, "_updateAccountsWithCompletion:", 0);
}

- (void)accountRemoved:(id)a3
{
  -[PKSearchResultsViewController _updateAccountsWithCompletion:](self, "_updateAccountsWithCompletion:", 0);
}

- (void)accountChanged:(id)a3
{
  -[PKSearchResultsViewController _updateAccountsWithCompletion:](self, "_updateAccountsWithCompletion:", 0);
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  -[PKSearchResultsViewController _updateAccountsWithCompletion:](self, "_updateAccountsWithCompletion:", 0, a4);
}

- (void)_updateAccountsWithCompletion:(id)a3
{
  id v4;
  PKAccountService *accountService;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accountService = self->_accountService;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke;
  v7[3] = &unk_1E3E67700;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKAccountService accountsWithCompletion:](accountService, "accountsWithCompletion:", v7);

}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id obj;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  _QWORD *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1096);
  *(_QWORD *)(v2 + 1096) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1104);
  *(_QWORD *)(v4 + 1104) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1112);
  *(_QWORD *)(v6 + 1112) = 0;

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__23;
  v43 = __Block_byref_object_dispose__23;
  v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__23;
  v37[4] = __Block_byref_object_dispose__23;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__23;
  v35[4] = __Block_byref_object_dispose__23;
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(id *)(a1 + 40);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v13, "accountIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v40[5], "setObject:forKey:", v13, v14);
        v28[0] = v10;
        v28[1] = 3221225472;
        v28[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_3;
        v28[3] = &unk_1E3E63610;
        v28[4] = *(_QWORD *)(a1 + 32);
        v15 = v14;
        v29 = v15;
        v30 = v37;
        objc_msgSend(v8, "addOperation:", v28);
        v25[0] = v10;
        v25[1] = 3221225472;
        v25[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_6;
        v25[3] = &unk_1E3E63610;
        v25[4] = *(_QWORD *)(a1 + 32);
        v16 = v15;
        v26 = v16;
        v27 = v35;
        objc_msgSend(v8, "addOperation:", v25);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_9;
  v20[3] = &unk_1E3E6BFB0;
  v20[4] = *(_QWORD *)(a1 + 32);
  v22 = &v39;
  v23 = v37;
  v24 = v35;
  v21 = *(id *)(a1 + 48);
  v18 = (id)objc_msgSend(v8, "evaluateWithInput:completion:", v17, v20);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(&v39, 8);
}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)a1[5];
  v9 = *(void **)(a1[4] + 1072);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_4;
  v12[3] = &unk_1E3E6BF88;
  v16 = a1[6];
  v14 = v6;
  v15 = v7;
  v13 = v8;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "accountUsersForAccountWithIdentifier:completion:", v13, v12);

}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_5;
  block[3] = &unk_1E3E6BF60;
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v11 = v4;
  v8 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_5(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66940]), "initWithAccountUsers:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_6(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)a1[5];
  v9 = *(void **)(a1[4] + 1072);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_7;
  v12[3] = &unk_1E3E6BF88;
  v16 = a1[6];
  v14 = v6;
  v15 = v7;
  v13 = v8;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "physicalCardsForAccountWithIdentifier:completion:", v13, v12);

}

void __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_8;
  block[3] = &unk_1E3E6BF60;
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v11 = v4;
  v8 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_8(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __63__PKSearchResultsViewController__updateAccountsWithCompletion___block_invoke_9(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "copy");
  v3 = a1[4];
  v4 = *(void **)(v3 + 1096);
  *(_QWORD *)(v3 + 1096) = v2;

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "copy");
  v6 = a1[4];
  v7 = *(void **)(v6 + 1104);
  *(_QWORD *)(v6 + 1104) = v5;

  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "copy");
  v9 = a1[4];
  v10 = *(void **)(v9 + 1112);
  *(_QWORD *)(v9 + 1112) = v8;

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKSearchResultsViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PKSearchResultsViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__PKSearchResultsViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  void *v2;
  id obj;

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 32));
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1056), obj);
    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSuggestionController, 0);
  objc_storeStrong(&self->_pendingPreflightCompletion, 0);
  objc_storeStrong((id *)&self->_noResultsBodyLabel, 0);
  objc_storeStrong((id *)&self->_noResultsTitleLabel, 0);
  objc_storeStrong((id *)&self->_seeAllPresentationTimer, 0);
  objc_storeStrong((id *)&self->_seeAllHistoryVC, 0);
  objc_storeStrong((id *)&self->_passesForResults, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_transactionTags, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_merchants, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_queuePrepareResults, 0);
  objc_storeStrong((id *)&self->_lastResultsPerQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_currentResults, 0);
  objc_storeStrong((id *)&self->_queryForCurrentResults, 0);
  objc_storeStrong((id *)&self->_lastQueries, 0);
  objc_storeStrong((id *)&self->_currentQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_physicalCardsPerIdentifier, 0);
  objc_storeStrong((id *)&self->_accountUserCollectionsPerIdentifier, 0);
  objc_storeStrong((id *)&self->_accountsPerIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_searchService, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_regionUpdater, 0);
  objc_storeStrong((id *)&self->_thumbnailPresenter, 0);
  objc_storeStrong((id *)&self->_transactionGroupPresenter, 0);
  objc_storeStrong((id *)&self->_transactionPresenter, 0);
  objc_storeStrong((id *)&self->_sampleSuggestionCell, 0);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
}

@end
