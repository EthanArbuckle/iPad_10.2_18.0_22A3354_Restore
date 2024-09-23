@implementation PKSpendingSummaryViewController

- (PKSpendingSummaryViewController)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 avatarManager:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 fetcher:(id)a9 weeks:(id)a10 months:(id)a11 years:(id)a12 type:(unint64_t)a13 unit:(unint64_t)a14 currentMonthTransactions:(id)a15 pendingPayments:(id)a16 upcomingScheduledPayments:(id)a17 dispayType:(unint64_t)a18
{
  id v23;
  PKSpendingSummaryViewController *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *pendingUpdates;
  uint64_t v27;
  PKPaymentPass *pass;
  NSMutableDictionary *v29;
  NSMutableDictionary *v30;
  id *p_years;
  unint64_t currentSummaryType;
  uint64_t v33;
  NSArray *v34;
  NSArray *currentDataSet;
  void *v36;
  uint64_t v37;
  void *v39;
  uint64_t v40;
  id v41;
  PKTransactionGroupItemPresenter *v42;
  PKSpendingSummaryPresenter *v43;
  unint64_t v44;
  PKSpendingSingleSummaryViewController *v45;
  uint64_t v48;
  NSArray *emptyViewControllers;
  PKDashboardViewControllerFooterContainer *v50;
  uint64_t v51;
  PKHorizontalScrollingFooterViewProtocol *footerView;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  id location;
  objc_super v89;
  _QWORD v90[5];

  v90[3] = *MEMORY[0x1E0C80C00];
  v74 = a3;
  v76 = a4;
  v75 = a5;
  v81 = a6;
  v77 = a7;
  v78 = a8;
  v67 = a9;
  v68 = a10;
  v69 = a11;
  v70 = a12;
  v79 = a15;
  v80 = a16;
  v23 = a17;
  v89.receiver = self;
  v89.super_class = (Class)PKSpendingSummaryViewController;
  v24 = -[PKHorizontalScrollingViewController init](&v89, sel_init);
  if (!v24)
    goto LABEL_30;
  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  pendingUpdates = v24->_pendingUpdates;
  v24->_pendingUpdates = v25;

  objc_storeStrong((id *)&v24->_account, a6);
  objc_storeStrong((id *)&v24->_accountUserCollection, a7);
  objc_storeStrong((id *)&v24->_transactionSourceCollection, a3);
  -[PKTransactionSourceCollection paymentPass](v24->_transactionSourceCollection, "paymentPass");
  v27 = objc_claimAutoreleasedReturnValue();
  pass = v24->_pass;
  v24->_pass = (PKPaymentPass *)v27;

  v24->_currentSummaryType = a13;
  objc_storeStrong((id *)&v24->_summaryFetcher, a9);
  -[PKSpendingSummaryFetcher registerObserver:](v24->_summaryFetcher, "registerObserver:", v24);
  objc_storeStrong((id *)&v24->_currentMonthTransactions, a15);
  objc_storeStrong((id *)&v24->_familyCollection, a4);
  objc_storeStrong((id *)&v24->_avatarManager, a5);
  v24->_displayType = a18;
  v24->_lockUpdate._os_unfair_lock_opaque = 0;
  v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v30 = v24->_pendingUpdates;
  v24->_pendingUpdates = v29;

  objc_storeStrong((id *)&v24->_weeks, a10);
  objc_storeStrong((id *)&v24->_months, a11);
  p_years = (id *)&v24->_years;
  objc_storeStrong((id *)&v24->_years, a12);
  currentSummaryType = v24->_currentSummaryType;
  if (currentSummaryType)
  {
    if (currentSummaryType == 2)
    {
      v33 = 4;
    }
    else
    {
      if (currentSummaryType != 1)
      {
        v33 = 0;
        goto LABEL_10;
      }
      v33 = 8;
      p_years = (id *)&v24->_months;
    }
  }
  else
  {
    v33 = 0x2000;
    p_years = (id *)&v24->_weeks;
  }
  v34 = (NSArray *)*p_years;
  currentDataSet = v24->_currentDataSet;
  v24->_currentDataSet = v34;

LABEL_10:
  if (-[PKSpendingSummaryViewController numberOfItems](v24, "numberOfItems") < 1)
  {
    v24->_startingIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v24->_startingIndex = -[PKSpendingSummaryViewController numberOfItems](v24, "numberOfItems") - 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[PKSpendingSummaryViewController numberOfItems](v24, "numberOfItems");
    while (v37-- >= 1)
    {
      -[NSArray objectAtIndex:](v24->_currentDataSet, "objectAtIndex:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v36, "component:fromDate:", v33, v39);

      if (v40 == a14)
        goto LABEL_19;
    }
    v37 = -[PKSpendingSummaryViewController numberOfItems](v24, "numberOfItems") - 1;
LABEL_19:
    v24->_startingIndex = v37;

  }
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = objc_alloc_init(PKTransactionGroupItemPresenter);
  v43 = objc_alloc_init(PKSpendingSummaryPresenter);
  v44 = 0;
  do
  {
    v45 = -[PKSpendingSingleSummaryViewController initWithTransationSourceCollection:familyCollection:avatarManager:account:accountUserCollection:physicalCards:transactionGroupPresenter:summaryPresenter:currentMonthTransactions:pendingPayments:upcomingScheduledPayments:displayType:]([PKSpendingSingleSummaryViewController alloc], "initWithTransationSourceCollection:familyCollection:avatarManager:account:accountUserCollection:physicalCards:transactionGroupPresenter:summaryPresenter:currentMonthTransactions:pendingPayments:upcomingScheduledPayments:displayType:", v74, v76, v75, v81, v77, v78, v42, v43, v79, v80, v23, a18);
    -[PKSpendingSingleSummaryViewController setSummaryDelegate:](v45, "setSummaryDelegate:", v24);
    objc_msgSend(v41, "addObject:", v45);

  }
  while (v44++ < 5 && a18 != 1);
  v48 = objc_msgSend(v41, "copy");
  emptyViewControllers = v24->_emptyViewControllers;
  v24->_emptyViewControllers = (NSArray *)v48;

  if ((objc_msgSend(v81, "supportsSchedulePayment") & 1) != 0)
  {
    v50 = [PKDashboardViewControllerFooterContainer alloc];
    v51 = -[PKDashboardViewControllerFooterContainer initWithFrame:](v50, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    footerView = v24->_footerView;
    v24->_footerView = (PKHorizontalScrollingFooterViewProtocol *)v51;

  }
  -[PKSpendingSummaryViewController navigationItem](v24, "navigationItem");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a18)
  {
    -[PKAccount feature](v24->_account, "feature");
    objc_initWeak(&location, v24);
    v61 = objc_alloc(MEMORY[0x1E0DC3C58]);
    v54 = (void *)MEMORY[0x1E0DC3428];
    PKLocalizedFeatureString();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = MEMORY[0x1E0C809B0];
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke;
    v86[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v87, &location);
    objc_msgSend(v54, "actionWithTitle:image:identifier:handler:", v71, 0, CFSTR("week"), v86);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v56;
    v57 = (void *)MEMORY[0x1E0DC3428];
    PKLocalizedFeatureString();
    v65 = (id)objc_claimAutoreleasedReturnValue();
    v84[0] = v55;
    v84[1] = 3221225472;
    v84[2] = __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke_2;
    v84[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v85, &location);
    objc_msgSend(v57, "actionWithTitle:image:identifier:handler:", v65, 0, CFSTR("month"), v84);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v58;
    v62 = (id)MEMORY[0x1E0DC3428];
    PKLocalizedFeatureString();
    v64 = (id)objc_claimAutoreleasedReturnValue();
    v82[0] = v55;
    v82[1] = 3221225472;
    v82[2] = __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke_3;
    v82[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v83, &location);
    objc_msgSend(v62, "actionWithTitle:image:identifier:handler:", v64, 0, CFSTR("year"), v82);
    v63 = (id)objc_claimAutoreleasedReturnValue();
    v90[2] = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(v61, "initWithFrame:actions:", v59, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

    objc_msgSend(v73, "setSelectedSegmentIndex:", v24->_currentSummaryType);
    objc_msgSend(v53, "setTitleView:", v73);
    objc_msgSend(v53, "setBackButtonDisplayMode:", 2);
    -[PKSpendingSummaryViewController _updateBackTitle](v24, "_updateBackTitle");

    objc_destroyWeak(&v83);
    objc_destroyWeak(&v85);
    objc_destroyWeak(&v87);
    objc_destroyWeak(&location);
  }

LABEL_30:
  return v24;
}

void __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_changeModeTo:", 0);
    WeakRetained = v2;
  }

}

void __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_changeModeTo:", 1);
    WeakRetained = v2;
  }

}

void __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_changeModeTo:", 2);
    WeakRetained = v2;
  }

}

- (id)pkNavigationController
{
  void *v2;
  id v3;

  -[PKSpendingSummaryViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)emptyViewControllers
{
  return self->_emptyViewControllers;
}

- (int64_t)numberOfItems
{
  return -[NSArray count](self->_currentDataSet, "count");
}

- (int64_t)startingIndex
{
  return self->_startingIndex;
}

- (id)footerView
{
  return self->_footerView;
}

- (double)footerViewContentHeight
{
  PKHorizontalScrollingFooterViewProtocol *footerView;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  footerView = self->_footerView;
  if (!footerView)
    return 0.0;
  -[PKSpendingSummaryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKHorizontalScrollingFooterViewProtocol sizeThatFits:](footerView, "sizeThatFits:", v4, v5);
  v7 = v6;

  return v7;
}

- (id)cachedDataAtIndex:(int64_t)a3
{
  PKSpendingSummaryFetcher *summaryFetcher;
  void *v6;
  void *v7;

  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || -[NSArray count](self->_currentDataSet, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    summaryFetcher = self->_summaryFetcher;
    -[NSArray objectAtIndex:](self->_currentDataSet, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSummaryFetcher cachedSpendingSummaryStartingWithDate:type:](summaryFetcher, "cachedSpendingSummaryStartingWithDate:type:", v6, self->_currentSummaryType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)prefetchDataIfNecessary
{
  unint64_t currentSummaryType;
  unint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  PKSpendingSummaryFetcher *summaryFetcher;
  void *v10;
  unint64_t v11;
  PKSpendingSummaryFetcher *v12;
  void *v13;
  unint64_t v14;
  PKSpendingSummaryFetcher *v15;
  id v16;

  currentSummaryType = self->_currentSummaryType;
  if (currentSummaryType == 2)
  {
    v5 = 1;
    goto LABEL_10;
  }
  if (currentSummaryType != 1)
  {
    if (currentSummaryType)
      return;
    v4 = -[PKSpendingSummaryViewController _newDataSetIndexAfterTransitionFromMode:toMode:](self, "_newDataSetIndexAfterTransitionFromMode:toMode:", 0, 2);
    v5 = 0;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
    v6 = v4;
    v7 = 1;
LABEL_9:
    summaryFetcher = self->_summaryFetcher;
    -[NSArray objectAtIndex:](self->_years, "objectAtIndex:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSummaryFetcher spendingSummaryStartingWithDate:type:includingLastPeriodChange:completion:](summaryFetcher, "spendingSummaryStartingWithDate:type:includingLastPeriodChange:completion:", v10, 2, 1, 0);

    if (!v7)
    {
LABEL_11:
      if (!v5)
        return;
      goto LABEL_14;
    }
LABEL_10:
    v11 = -[PKSpendingSummaryViewController _newDataSetIndexAfterTransitionFromMode:toMode:](self, "_newDataSetIndexAfterTransitionFromMode:toMode:", self->_currentSummaryType, 1);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = self->_summaryFetcher;
      -[NSArray objectAtIndex:](self->_months, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSpendingSummaryFetcher spendingSummaryStartingWithDate:type:includingLastPeriodChange:completion:](v12, "spendingSummaryStartingWithDate:type:includingLastPeriodChange:completion:", v13, 1, 1, 0);

      if ((v5 & 1) == 0)
        return;
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  v5 = 1;
  v8 = -[PKSpendingSummaryViewController _newDataSetIndexAfterTransitionFromMode:toMode:](self, "_newDataSetIndexAfterTransitionFromMode:toMode:", 1, 2);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v8;
    v7 = 0;
    goto LABEL_9;
  }
LABEL_14:
  v14 = -[PKSpendingSummaryViewController _newDataSetIndexAfterTransitionFromMode:toMode:](self, "_newDataSetIndexAfterTransitionFromMode:toMode:", self->_currentSummaryType, 0);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = self->_summaryFetcher;
    -[NSArray objectAtIndex:](self->_weeks, "objectAtIndex:", v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSummaryFetcher spendingSummaryStartingWithDate:type:includingLastPeriodChange:completion:](v15, "spendingSummaryStartingWithDate:type:includingLastPeriodChange:completion:", v16, 0, 1, 0);

  }
}

- (void)fetchDataAtIndex:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  PKSpendingSummaryFetcher *summaryFetcher;
  void *v8;
  unint64_t currentSummaryType;
  _QWORD v10[4];
  void (**v11)(id, _QWORD);
  id v12;
  id location;

  v6 = (void (**)(id, _QWORD))a4;
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || -[NSArray count](self->_currentDataSet, "count") <= a3)
  {
    v6[2](v6, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    summaryFetcher = self->_summaryFetcher;
    -[NSArray objectAtIndex:](self->_currentDataSet, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    currentSummaryType = self->_currentSummaryType;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__PKSpendingSummaryViewController_fetchDataAtIndex_completion___block_invoke;
    v10[3] = &unk_1E3E66488;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    -[PKSpendingSummaryFetcher spendingSummaryStartingWithDate:type:includingLastPeriodChange:completion:](summaryFetcher, "spendingSummaryStartingWithDate:type:includingLastPeriodChange:completion:", v8, currentSummaryType, 1, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __63__PKSpendingSummaryViewController_fetchDataAtIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKSpendingSummaryViewController_fetchDataAtIndex_completion___block_invoke_2;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __63__PKSpendingSummaryViewController_fetchDataAtIndex_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (objc_msgSend(*(id *)(a1 + 32), "summaryType") == WeakRetained[154])
      v3 = *(_QWORD *)(a1 + 32);
    else
      v3 = 0;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);
    WeakRetained = v4;
  }

}

- (id)loadingDataObjectWithCurrentData:(id)a3 index:(int64_t)a4 swap:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t currentSummaryType;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;

  v8 = a3;
  -[NSArray objectAtIndex:](self->_currentDataSet, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryFetcher cachedSpendingSummaryStartingWithDate:type:](self->_summaryFetcher, "cachedSpendingSummaryStartingWithDate:type:", v9, self->_currentSummaryType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v8;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;
  v13 = v12;
  if (!a5)
  {
    if (objc_msgSend(v12, "summaryType") != self->_currentSummaryType
      || (objc_msgSend(v13, "startDate"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = PKEqualObjects(),
          v14,
          (v15 & 1) == 0))
    {
      v17 = objc_alloc_init(MEMORY[0x1E0D676C0]);
      v16 = v17;
      if (v10)
      {
        objc_msgSend(v17, "setSummaryType:", objc_msgSend(v10, "summaryType"));
        objc_msgSend(v10, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setStartDate:", v18);

        objc_msgSend(v10, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEndDate:", v19);

        objc_msgSend(v16, "setSummaryUnit:", objc_msgSend(v10, "summaryUnit"));
        objc_msgSend(v10, "totalSpending");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTotalSpending:", v20);

        objc_msgSend(v10, "previousMaxAmount");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPreviousMaxAmount:", v21);

        objc_msgSend(v10, "previousTotalSpending");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPreviousTotalSpending:", v22);

        objc_msgSend(v10, "spendingsPerCalendarUnit");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSpendingsPerCalendarUnit:", v23);

        objc_msgSend(v10, "spendingsPerAltDSID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSpendingsPerAltDSID:", v24);

        objc_msgSend(v10, "altDSID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAltDSID:", v25);
LABEL_21:

        objc_msgSend(v16, "setIsLoading:", 1);
        goto LABEL_22;
      }
      objc_msgSend(v17, "setSummaryType:", self->_currentSummaryType);
      objc_msgSend(v16, "setStartDate:", v9);
      currentSummaryType = self->_currentSummaryType;
      if (currentSummaryType == 2)
      {
        PKStartOfNextYear();
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else if (currentSummaryType == 1)
      {
        PKStartOfNextMonth();
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (currentSummaryType)
        {
          v25 = 0;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0D676C8], "nextStartOfWeekFromDate:", v9);
        v27 = objc_claimAutoreleasedReturnValue();
      }
      v25 = (void *)v27;
LABEL_20:
      objc_msgSend(v25, "dateByAddingTimeInterval:", -1.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setEndDate:", v28);

      -[PKSpendingSummaryFetcher accountUser](self->_summaryFetcher, "accountUser");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "altDSID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAltDSID:", v30);

      goto LABEL_21;
    }
  }
  v16 = 0;
LABEL_22:

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[PKSpendingSummaryFetcher unregisterObserver:](self->_summaryFetcher, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSummaryViewController;
  -[PKSpendingSummaryViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSpendingSummaryViewController;
  -[PKHorizontalScrollingViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKSpendingSummaryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68098]);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKSpendingSummaryViewController;
  -[PKSpendingSummaryViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D68F50];
  v9[0] = *MEMORY[0x1E0D68AA0];
  v9[1] = v5;
  v6 = *MEMORY[0x1E0D689F8];
  v10[0] = *MEMORY[0x1E0D68C50];
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportDashboardEventIfNecessary:forPass:", v7, self->_pass);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKSpendingSummaryViewController;
  -[PKSpendingSummaryViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[PKSpendingSummaryViewController pkNavigationController](self, "pkNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "promptAppStoreReviewForTrigger:", 1);

  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D68F50];
  v10[0] = *MEMORY[0x1E0D68AA0];
  v10[1] = v6;
  v7 = *MEMORY[0x1E0D689F8];
  v11[0] = *MEMORY[0x1E0D68C58];
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportDashboardEventIfNecessary:forPass:", v8, self->_pass);

}

- (void)_updateBackTitle
{
  void *v3;
  id v4;

  if (self->_currentSummaryType > 2)
  {
    v4 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PKSpendingSummaryViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackButtonTitle:", v4);

}

- (void)_changeModeTo:(unint64_t)a3
{
  unint64_t currentSummaryType;
  int *v6;
  _QWORD *v7;
  NSArray *v8;
  NSArray *currentDataSet;
  int64_t v10;
  id WeakRetained;
  id v12;

  if (!self->_transitioningMode)
  {
    self->_transitioningMode = 1;
    -[PKHorizontalScrollingViewController clearPendingDataCollectionViewUpdates](self, "clearPendingDataCollectionViewUpdates");
    -[PKHorizontalScrollingViewController enableScrollView:](self, "enableScrollView:", 0);
    currentSummaryType = self->_currentSummaryType;
    if (a3 <= 2)
    {
      v6 = off_1E3E66510[a3];
      v7 = (_QWORD *)qword_1E3E66528[a3];
      PKSetBroadwaySummaryType();
      self->_currentSummaryType = a3;
      v8 = (NSArray *)*(id *)((char *)&self->super.super.super.super.isa + *v6);
      currentDataSet = self->_currentDataSet;
      self->_currentDataSet = v8;

      -[PKSpendingSummaryViewController _reportTappedButtonWithTag:](self, "_reportTappedButtonWithTag:", *v7);
    }
    -[PKSpendingSummaryViewController _updateBackTitle](self, "_updateBackTitle");
    v10 = -[PKSpendingSummaryViewController _newDataSetIndexAfterTransitionFromMode:toMode:](self, "_newDataSetIndexAfterTransitionFromMode:toMode:", currentSummaryType, a3);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = -[PKSpendingSummaryViewController numberOfItems](self, "numberOfItems") - 1;
    -[PKHorizontalScrollingViewController resetVisibleViewControllersWithNewPrimaryIndex:](self, "resetVisibleViewControllersWithNewPrimaryIndex:", v10);
    -[PKHorizontalScrollingViewController enableScrollView:](self, "enableScrollView:", 1);
    self->_transitioningMode = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v12 = WeakRetained;
      objc_msgSend(WeakRetained, "summaryTypeDidChange");
      WeakRetained = v12;
    }

  }
}

- (unint64_t)_newDataSetIndexAfterTransitionFromMode:(unint64_t)a3 toMode:(unint64_t)a4
{
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSUInteger v13;
  NSUInteger v14;
  unint64_t v15;
  NSUInteger v16;
  void *v17;
  char v18;
  NSUInteger v19;
  NSUInteger v20;
  void *v21;
  char v22;
  NSUInteger v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  NSUInteger v29;
  void *v30;
  char v31;
  uint64_t v32;
  NSUInteger v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v40;
  void *v41;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKHorizontalScrollingViewController primaryIndex](self, "primaryIndex");
  switch(a3)
  {
    case 0uLL:
      -[NSArray objectAtIndex:](self->_weeks, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 == 1)
      {
        v16 = -[NSArray count](self->_months, "count");
        objc_msgSend(v7, "components:fromDate:", 14, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v15 = 0;
          while (1)
          {
            -[NSArray objectAtIndex:](self->_months, "objectAtIndex:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v7, "date:matchesComponents:", v17, v11);

            if ((v18 & 1) != 0)
              goto LABEL_48;
            if (v16 == ++v15)
              goto LABEL_38;
          }
        }
      }
      else
      {
        v29 = -[NSArray count](self->_years, "count");
        objc_msgSend(v7, "components:fromDate:", 6, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v15 = 0;
          while (1)
          {
            -[NSArray objectAtIndex:](self->_years, "objectAtIndex:", v15);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v7, "date:matchesComponents:", v30, v11);

            if ((v31 & 1) != 0)
              goto LABEL_48;
            if (v29 == ++v15)
              goto LABEL_38;
          }
        }
      }
      goto LABEL_38;
    case 1uLL:
      -[NSArray objectAtIndex:](self->_months, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        objc_msgSend(v7, "components:fromDate:", 6, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[NSArray count](self->_years, "count");
        if (v19)
        {
          v20 = v19;
          v15 = 0;
          while (1)
          {
            -[NSArray objectAtIndex:](self->_years, "objectAtIndex:", v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v7, "date:matchesComponents:", v21, v11);

            if ((v22 & 1) != 0)
              goto LABEL_48;
            if (v20 == ++v15)
              goto LABEL_38;
          }
        }
        goto LABEL_38;
      }
      objc_msgSend(v7, "components:fromDate:", 14, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v8;
      v32 = objc_msgSend(v7, "date:matchesComponents:", v8, v11);
      v33 = -[NSArray count](self->_weeks, "count");
      v24 = v33;
      if ((v32 & 1) == 0)
      {
        if (v33)
        {
          v40 = v10;
          v15 = 0;
          v36 = 0;
          v26 = 0x7FFFFFFFFFFFFFFFLL;
          while (1)
          {
            -[NSArray objectAtIndex:](self->_weeks, "objectAtIndex:", v15, v40);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v7, "date:matchesComponents:", v37, v11);

            if (v38)
            {
              ++v36;
              v26 = v15;
              if (v36 == 3)
                goto LABEL_45;
            }
            if (v24 == ++v15)
            {
LABEL_44:
              v15 = v26;
              goto LABEL_45;
            }
          }
        }
        goto LABEL_46;
      }
LABEL_33:
      v15 = v24 - 1;
LABEL_47:
      v8 = v41;
      goto LABEL_48;
    case 2uLL:
      -[NSArray objectAtIndex:](self->_years, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "components:fromDate:", 6, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v7, "date:matchesComponents:", v8, v11);
      if (a4 == 1)
      {
        v13 = -[NSArray count](self->_months, "count");
        v14 = v13;
        if ((v12 & 1) != 0)
        {
          v15 = v13 - 1;
LABEL_48:

          goto LABEL_49;
        }
        if (v13)
        {
          v15 = 0;
          do
          {
            -[NSArray objectAtIndex:](self->_months, "objectAtIndex:", v15);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v7, "date:matchesComponents:", v34, v11);

            if ((v35 & 1) != 0)
              goto LABEL_48;
          }
          while (v14 != ++v15);
        }
LABEL_38:
        v15 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_48;
      }
      v41 = v8;
      v23 = -[NSArray count](self->_weeks, "count");
      v24 = v23;
      if ((v12 & 1) == 0)
      {
        if (v23)
        {
          v40 = v10;
          v15 = 0;
          v25 = 0;
          v26 = 0x7FFFFFFFFFFFFFFFLL;
          while (1)
          {
            -[NSArray objectAtIndex:](self->_weeks, "objectAtIndex:", v15, v40);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v7, "date:matchesComponents:", v27, v11);

            if (v28)
            {
              ++v25;
              v26 = v15;
              if (v25 == 3)
                break;
            }
            if (v24 == ++v15)
              goto LABEL_44;
          }
LABEL_45:
          v10 = v40;
          v8 = v41;
          goto LABEL_48;
        }
LABEL_46:
        v15 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_47;
      }
      goto LABEL_33;
  }
  v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_49:

  return v15;
}

- (BOOL)shouldResetContentOffsetAfterScrolling
{
  return 0;
}

- (void)invalidatedSpendingSummaryOfType:(unint64_t)a3 startingWithDate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  dispatch_time_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  unint64_t v13;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lockUpdate);
  -[NSMutableDictionary objectForKey:](self->_pendingUpdates, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKey:](self->_pendingUpdates, "setObject:forKey:", v8, v7);
  }
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lockUpdate);
  }
  else
  {
    objc_msgSend(v8, "addObject:", v6);
    os_unfair_lock_unlock(&self->_lockUpdate);
    v9 = dispatch_time(0, 3000000000);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__PKSpendingSummaryViewController_invalidatedSpendingSummaryOfType_startingWithDate___block_invoke;
    v10[3] = &unk_1E3E664B0;
    v10[4] = self;
    v11 = v7;
    v12 = v6;
    v13 = a3;
    dispatch_after(v9, MEMORY[0x1E0C80D38], v10);

  }
}

void __85__PKSpendingSummaryViewController_invalidatedSpendingSummaryOfType_startingWithDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 1264));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "objectForKey:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 48));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 1264));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 56) == *(_QWORD *)(v2 + 1232))
  {
    v3 = objc_msgSend(*(id *)(v2 + 1224), "indexOfObject:", *(_QWORD *)(a1 + 48));
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = v3;
      objc_msgSend(*(id *)(a1 + 32), "visibleIndices");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsIndex:", v4);

      if (v6)
        objc_msgSend(*(id *)(a1 + 32), "reloadDataForViewControllerAtIndex:swap:", v4, 0);
    }
  }

}

- (void)invalidatedSummariesAvailable
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1160);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke_2;
  v4[3] = &unk_1E3E664D8;
  v4[4] = v1;
  return objc_msgSend(v2, "availableSummaries:", v4);
}

void __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke_3;
  v13[3] = &unk_1E3E62460;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke_3(id *a1)
{
  id *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*((id *)a1[4] + 153), "objectAtIndex:", objc_msgSend(a1[4], "primaryIndex"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)a1[4] + 148, a1[5]);
  v2 = a1 + 6;
  objc_storeStrong((id *)a1[4] + 149, a1[6]);
  objc_storeStrong((id *)a1[4] + 150, a1[7]);
  v3 = a1[4];
  v4 = *((_QWORD *)v3 + 154);
  switch(v4)
  {
    case 0:
      v2 = a1 + 5;
      goto LABEL_7;
    case 2:
      v2 = a1 + 7;
      goto LABEL_7;
    case 1:
LABEL_7:
      v5 = *v2;
      v6 = (void *)*((_QWORD *)v3 + 153);
      *((_QWORD *)v3 + 153) = v5;

      v3 = a1[4];
      break;
  }
  v7 = objc_msgSend(*((id *)v3 + 153), "indexOfObject:", v8);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(a1[4], "numberOfItems") < 1)
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v7 = objc_msgSend(a1[4], "numberOfItems") - 1;
  }
  objc_msgSend(a1[4], "updateScrollViewContentOffsetWithNewPrimaryIndex:", v7);

}

- (void)_reportTappedButtonWithTag:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D68AA0];
  v10[0] = *MEMORY[0x1E0D68F50];
  v10[1] = v4;
  v5 = *MEMORY[0x1E0D68B18];
  v11[0] = *MEMORY[0x1E0D689F8];
  v11[1] = v5;
  v6 = (void *)MEMORY[0x1E0D66A58];
  v10[2] = *MEMORY[0x1E0D68858];
  v11[2] = a3;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportDashboardEventIfNecessary:forPass:", v9, self->_pass);

}

- (PKSpendingSummaryViewControllerDelegate)delegate
{
  return (PKSpendingSummaryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)categorization
{
  return self->_categorization;
}

- (void)setCategorization:(unint64_t)a3
{
  self->_categorization = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_emptyViewControllers, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_currentMonthTransactions, 0);
  objc_storeStrong((id *)&self->_currentDataSet, 0);
  objc_storeStrong((id *)&self->_navTitle, 0);
  objc_storeStrong((id *)&self->_years, 0);
  objc_storeStrong((id *)&self->_months, 0);
  objc_storeStrong((id *)&self->_weeks, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_summaryFetcher, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end
