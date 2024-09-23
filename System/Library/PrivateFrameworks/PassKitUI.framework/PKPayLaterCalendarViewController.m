@implementation PKPayLaterCalendarViewController

- (PKPayLaterCalendarViewController)initWithPlansFetcher:(id)a3 installmentPresenter:(id)a4 paymentIntentController:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPayLaterCalendarViewController *v12;
  PKPayLaterCalendarViewController *v13;
  id *p_fetcher;
  uint64_t v15;
  PKAccount *payLaterAccount;
  NSMutableArray *v17;
  NSMutableArray *pendingDateUpdates;
  id v19;
  PKPayLaterInstallmentsMonthPresenter *v20;
  uint64_t v21;
  PKPayLaterCalendarMonthViewController *v22;
  uint64_t v23;
  NSArray *emptyViewControllers;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PKPayLaterCalendarViewController;
  v12 = -[PKHorizontalScrollingViewController init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    p_fetcher = (id *)&v12->_fetcher;
    objc_storeStrong((id *)&v12->_fetcher, a3);
    objc_storeStrong((id *)&v13->_installmentPresenter, a4);
    objc_msgSend(*p_fetcher, "registerObserver:", v13);
    objc_msgSend(*p_fetcher, "payLaterAccount");
    v15 = objc_claimAutoreleasedReturnValue();
    payLaterAccount = v13->_payLaterAccount;
    v13->_payLaterAccount = (PKAccount *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingDateUpdates = v13->_pendingDateUpdates;
    v13->_pendingDateUpdates = v17;

    v13->_lockUpdate._os_unfair_lock_opaque = 0;
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = objc_alloc_init(PKPayLaterInstallmentsMonthPresenter);
    v21 = 6;
    do
    {
      v22 = -[PKPayLaterCalendarMonthViewController initWithInstallmentsMonthPresenter:installmentPresenter:paymentIntentController:]([PKPayLaterCalendarMonthViewController alloc], "initWithInstallmentsMonthPresenter:installmentPresenter:paymentIntentController:", v20, v13->_installmentPresenter, v11);
      objc_msgSend(v19, "addObject:", v22);

      --v21;
    }
    while (v21);
    v23 = objc_msgSend(v19, "copy");
    emptyViewControllers = v13->_emptyViewControllers;
    v13->_emptyViewControllers = (NSArray *)v23;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPayLaterFinancingPlansFetcher unregisterObserver:](self->_fetcher, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterCalendarViewController;
  -[PKPayLaterCalendarViewController dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)PKPayLaterCalendarViewController;
  -[PKPayLaterCalendarViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  v3 = (void *)MEMORY[0x1E0D66A58];
  v4 = *MEMORY[0x1E0D69918];
  v5 = *MEMORY[0x1E0D68F50];
  v9[0] = *MEMORY[0x1E0D68AA0];
  v9[1] = v5;
  v6 = *MEMORY[0x1E0D68F68];
  v10[0] = *MEMORY[0x1E0D68C50];
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subject:sendEvent:", v4, v7);

}

- (void)viewDidDisappear:(BOOL)a3
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
  v8.super_class = (Class)PKPayLaterCalendarViewController;
  -[PKPayLaterCalendarViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  v3 = (void *)MEMORY[0x1E0D66A58];
  v4 = *MEMORY[0x1E0D69918];
  v5 = *MEMORY[0x1E0D68F50];
  v9[0] = *MEMORY[0x1E0D68AA0];
  v9[1] = v5;
  v6 = *MEMORY[0x1E0D68F68];
  v10[0] = *MEMORY[0x1E0D68C58];
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subject:sendEvent:", v4, v7);

}

- (void)preflightWithFirstShownDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPayLaterFinancingPlansFetcher *fetcher;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  fetcher = self->_fetcher;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PKPayLaterCalendarViewController_preflightWithFirstShownDate_completion___block_invoke;
  v11[3] = &unk_1E3E61450;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[PKPayLaterFinancingPlansFetcher preflightDataIfNecessaryWithCompletion:](fetcher, "preflightDataIfNecessaryWithCompletion:", v11);

}

void __75__PKPayLaterCalendarViewController_preflightWithFirstShownDate_completion___block_invoke(uint64_t a1)
{
  _QWORD block[5];
  id v3;
  id v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKPayLaterCalendarViewController_preflightWithFirstShownDate_completion___block_invoke_2;
  block[3] = &unk_1E3E61450;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __75__PKPayLaterCalendarViewController_preflightWithFirstShownDate_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 1120), "monthDates");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(void **)(v3 + 1144);
  *(_QWORD *)(v3 + 1144) = v2;

  *(_QWORD *)(a1[4] + 1152) = 0x7FFFFFFFFFFFFFFFLL;
  v5 = objc_msgSend(*(id *)(a1[4] + 1144), "count");
  if (v5 > 0)
  {
    v6 = v5;
    if (a1[5] && objc_msgSend(*(id *)(a1[4] + 1144), "count"))
    {
      v7 = 0;
      while (1)
      {
        objc_msgSend(*(id *)(a1[4] + 1144), "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PKStartOfMonth();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKEndOfMonth();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (PKDateIsBetweenDates())
          break;

        if (++v7 >= (unint64_t)objc_msgSend(*(id *)(a1[4] + 1144), "count"))
          goto LABEL_9;
      }
      *(_QWORD *)(a1[4] + 1152) = v7;

    }
LABEL_9:
    v11 = a1[4];
    if (*(_QWORD *)(v11 + 1152) == 0x7FFFFFFFFFFFFFFFLL)
      *(_QWORD *)(v11 + 1152) = v6 - 1;
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)emptyViewControllers
{
  return self->_emptyViewControllers;
}

- (int64_t)numberOfItems
{
  return -[NSArray count](self->_months, "count");
}

- (int64_t)startingIndex
{
  return self->_startingIndex;
}

- (id)footerView
{
  return 0;
}

- (double)footerViewContentHeight
{
  return 0.0;
}

- (id)cachedDataAtIndex:(int64_t)a3
{
  PKPayLaterFinancingPlansFetcher *fetcher;
  void *v6;
  void *v7;

  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || -[NSArray count](self->_months, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    fetcher = self->_fetcher;
    -[NSArray objectAtIndexedSubscript:](self->_months, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFinancingPlansFetcher cachedInstallmentsMonthWithStartDate:](fetcher, "cachedInstallmentsMonthWithStartDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)fetchDataAtIndex:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  PKPayLaterFinancingPlansFetcher *fetcher;
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, _QWORD);
  id v11;
  id location;

  v6 = (void (**)(id, _QWORD))a4;
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || -[NSArray count](self->_months, "count") <= a3)
  {
    v6[2](v6, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    fetcher = self->_fetcher;
    -[NSArray objectAtIndexedSubscript:](self->_months, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__PKPayLaterCalendarViewController_fetchDataAtIndex_completion___block_invoke;
    v9[3] = &unk_1E3E614A0;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    -[PKPayLaterFinancingPlansFetcher installmentsMonthWithDate:completion:](fetcher, "installmentsMonthWithDate:completion:", v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __64__PKPayLaterCalendarViewController_fetchDataAtIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKPayLaterCalendarViewController_fetchDataAtIndex_completion___block_invoke_2;
  block[3] = &unk_1E3E61478;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __64__PKPayLaterCalendarViewController_fetchDataAtIndex_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

- (id)loadingDataObjectWithCurrentData:(id)a3 index:(int64_t)a4 swap:(BOOL)a5
{
  return 0;
}

- (void)didMoveToPrimaryIndex:(int64_t)a3
{
  int64_t v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 <= 0x7FFFFFFFFFFFFFFELL && -[NSArray count](self->_months, "count") > a3)
  {
    v5 = -[PKPayLaterCalendarViewController startingIndex](self, "startingIndex");
    if (v5 >= a3)
    {
      if (v5 <= a3)
        return;
      v6 = (id *)MEMORY[0x1E0D69068];
    }
    else
    {
      v6 = (id *)MEMORY[0x1E0D69060];
    }
    v7 = *v6;
    if (v7)
    {
      v8 = v7;
      v9 = (void *)MEMORY[0x1E0D66A58];
      v10 = *MEMORY[0x1E0D68F50];
      v14[0] = *MEMORY[0x1E0D68AA0];
      v14[1] = v10;
      v11 = *MEMORY[0x1E0D69918];
      v12 = *MEMORY[0x1E0D68F68];
      v15[0] = v7;
      v15[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subject:sendEvent:", v11, v13);

    }
  }
}

- (BOOL)shouldResetContentOffsetAfterScrolling
{
  return 1;
}

- (void)invalidatedInstallmentsMonthsWithDates:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  dispatch_time_t v12;
  _QWORD block[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    os_unfair_lock_lock(&self->_lockUpdate);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((-[NSMutableArray containsObject:](self->_pendingDateUpdates, "containsObject:", v11) & 1) == 0)
          {
            objc_msgSend(v5, "addObject:", v11);
            -[NSMutableArray addObject:](self->_pendingDateUpdates, "addObject:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    os_unfair_lock_unlock(&self->_lockUpdate);
    if (objc_msgSend(v5, "count"))
    {
      v12 = dispatch_time(0, 3000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__PKPayLaterCalendarViewController_invalidatedInstallmentsMonthsWithDates___block_invoke;
      block[3] = &unk_1E3E61388;
      block[4] = self;
      v14 = v5;
      dispatch_after(v12, MEMORY[0x1E0C80D38], block);

    }
  }

}

void __75__PKPayLaterCalendarViewController_invalidatedInstallmentsMonthsWithDates___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 1160));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "removeObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 1160));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11), (_QWORD)v16);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = v12;
          objc_msgSend(*(id *)(a1 + 32), "visibleIndices");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsIndex:", v13);

          if (v15)
            objc_msgSend(*(id *)(a1 + 32), "reloadDataForViewControllerAtIndex:swap:", v13, 0);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v9);
  }

}

- (void)invalidatedInstallmentsMonth
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1120);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke_2;
  v4[3] = &unk_1E3E612E8;
  v4[4] = v1;
  return objc_msgSend(v2, "preflightDataIfNecessaryWithCompletion:", v4);
}

void __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke_3;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "primaryIndex") == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(*(id *)(a1 + 32), "primaryIndex") < 0
    || (v2 = objc_msgSend(*(id *)(a1 + 32), "primaryIndex"),
        v2 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "count")))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "primaryIndex"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "monthDates");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1144);
  *(_QWORD *)(v4 + 1144) = v3;

  if (!v7
    || (v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "indexOfObject:", v7), v6 == 0x7FFFFFFFFFFFFFFFLL))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "numberOfItems") < 1)
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v6 = objc_msgSend(*(id *)(a1 + 32), "numberOfItems") - 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "updateScrollViewContentOffsetWithNewPrimaryIndex:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyViewControllers, 0);
  objc_storeStrong((id *)&self->_pendingDateUpdates, 0);
  objc_storeStrong((id *)&self->_months, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_installmentPresenter, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
}

@end
