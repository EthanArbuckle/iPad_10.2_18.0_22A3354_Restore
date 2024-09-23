@implementation PKSpendingSummaryFetcher

- (PKSpendingSummaryFetcher)initWithTransactionSourceCollection:(id)a3 account:(id)a4 accountUser:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKSpendingSummaryFetcher *v11;
  PKTransactionSourceCollection *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  PKTransactionSourceCollection *v24;
  PKTransactionSourceCollection *v25;
  void *v26;
  uint64_t v27;
  PKTransactionSourceCollection *transactionSourceCollection;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v32;
  OS_dispatch_queue *replyQueue;
  PKPaymentDefaultDataProvider *v34;
  PKPaymentDefaultDataProvider *paymentDataProvider;
  NSCache *v36;
  NSCache *weeklySummaryItemsPerStartDate;
  NSCache *v38;
  NSCache *monthlySummaryItemsPerStartDate;
  NSCache *v40;
  NSCache *yearlySummaryItemsPerStartDate;
  NSMutableOrderedSet *v42;
  NSMutableOrderedSet *pendingRequests;
  NSMutableDictionary *v44;
  NSMutableDictionary *blockPendingRequests;
  uint64_t v46;
  NSHashTable *observers;
  void *v48;
  void *v49;
  PKSpendingInsightsFetcher *v50;
  PKSpendingInsightsFetcher *insightsFetcher;
  id obj;
  id obja;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v62.receiver = self;
  v62.super_class = (Class)PKSpendingSummaryFetcher;
  v11 = -[PKSpendingSummaryFetcher init](&v62, sel_init);
  if (v11)
  {
    if (v10)
    {
      obj = a5;
      v56 = v9;
      v12 = (PKTransactionSourceCollection *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v10, "isCurrentUser"))
      {
        objc_msgSend(v8, "transactionSourcesForType:", 0, a5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "anyObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransactionSourceCollection addObject:](v12, "addObject:", v14);

      }
      v55 = a4;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v57 = v8;
      objc_msgSend(v8, "transactionSourcesForType:", 2, obj);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v59;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v59 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend(v20, "accountUser");
            v21 = objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              v22 = (void *)v21;
              v23 = objc_msgSend(v10, "isEqual:", v21);

              if ((v23 & 1) != 0)
              {
                -[PKTransactionSourceCollection addObject:](v12, "addObject:", v20);
                goto LABEL_17;
              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
          if (v17)
            continue;
          break;
        }
      }
LABEL_17:

      v25 = [PKTransactionSourceCollection alloc];
      v26 = (void *)-[PKTransactionSourceCollection copy](v12, "copy");
      v27 = -[PKTransactionSourceCollection initWithTransactionSources:](v25, "initWithTransactionSources:", v26);
      transactionSourceCollection = v11->_transactionSourceCollection;
      v11->_transactionSourceCollection = (PKTransactionSourceCollection *)v27;

      objc_storeStrong((id *)&v11->_accountUser, obja);
      v9 = v56;
      v8 = v57;
      a4 = v55;
    }
    else
    {
      v24 = (PKTransactionSourceCollection *)v8;
      v12 = v11->_transactionSourceCollection;
      v11->_transactionSourceCollection = v24;
    }

    objc_storeStrong((id *)&v11->_account, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("com.apple.passkitui.spending.work", v29);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v30;

    v32 = dispatch_queue_create("com.apple.passkitui.spending.reply", v29);
    replyQueue = v11->_replyQueue;
    v11->_replyQueue = (OS_dispatch_queue *)v32;

    v34 = objc_alloc_init(PKPaymentDefaultDataProvider);
    paymentDataProvider = v11->_paymentDataProvider;
    v11->_paymentDataProvider = v34;

    -[PKPaymentDefaultDataProvider addDelegate:](v11->_paymentDataProvider, "addDelegate:", v11);
    v36 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    weeklySummaryItemsPerStartDate = v11->_weeklySummaryItemsPerStartDate;
    v11->_weeklySummaryItemsPerStartDate = v36;

    v38 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    monthlySummaryItemsPerStartDate = v11->_monthlySummaryItemsPerStartDate;
    v11->_monthlySummaryItemsPerStartDate = v38;

    v40 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    yearlySummaryItemsPerStartDate = v11->_yearlySummaryItemsPerStartDate;
    v11->_yearlySummaryItemsPerStartDate = v40;

    -[PKSpendingSummaryFetcher _resetCurrentCalendar](v11, "_resetCurrentCalendar");
    v42 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    pendingRequests = v11->_pendingRequests;
    v11->_pendingRequests = v42;

    v44 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    blockPendingRequests = v11->_blockPendingRequests;
    v11->_blockPendingRequests = v44;

    v11->_requestsLock._os_unfair_lock_opaque = 0;
    v11->_observersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v46 = objc_claimAutoreleasedReturnValue();
    observers = v11->_observers;
    v11->_observers = (NSHashTable *)v46;

    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "registerObserver:", v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObserver:selector:name:object:", v11, sel__timeZoneChanged_, *MEMORY[0x1E0C998A0], 0);

    v50 = objc_alloc_init(PKSpendingInsightsFetcher);
    insightsFetcher = v11->_insightsFetcher;
    v11->_insightsFetcher = v50;

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKSpendingSummaryFetcher;
  -[PKSpendingSummaryFetcher dealloc](&v4, sel_dealloc);
}

- (void)_resetCurrentCalendar
{
  NSCalendar *v3;
  NSCalendar *currentCalendar;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  currentCalendar = self->_currentCalendar;
  self->_currentCalendar = v3;

  -[NSCalendar setFirstWeekday:](self->_currentCalendar, "setFirstWeekday:", 2);
}

- (void)availableSummaries:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v2 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__35;
  v24[4] = __Block_byref_object_dispose__35;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__35;
  v22[4] = __Block_byref_object_dispose__35;
  v23 = 0;
  dispatch_group_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "transactionSourceIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_55;
  v19[3] = &unk_1E2AC46F8;
  v21 = v24;
  v6 = v2;
  v20 = v6;
  objc_msgSend(v5, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:", v3, 0, 1, 0, 0, -1, 1, v19);
  dispatch_group_enter(v6);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_2;
  v16[3] = &unk_1E2AC46F8;
  v18 = v22;
  v8 = v6;
  v17 = v8;
  objc_msgSend(v7, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:", v3, 0, 1, 0, 0, 1, 1, v16);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(v9 + 64);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_3;
  block[3] = &unk_1E2ACF6B8;
  block[4] = v9;
  v14 = v22;
  v15 = v24;
  v13 = v10;
  dispatch_group_notify(v8, v11, block);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

}

void __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_55(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transactionDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transactionDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void **v10;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  if (v4)
  {
    if (objc_msgSend(v4, "compare:", v2) != -1)
      goto LABEL_5;
    v3 = *(_QWORD *)(a1[6] + 8);
  }
  objc_storeStrong((id *)(v3 + 40), v2);
LABEL_5:
  objc_msgSend(*(id *)(a1[4] + 16), "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createdDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = a1[7];
  v8 = *(_QWORD *)(v7 + 8);
  v10 = (void **)(v8 + 40);
  v9 = *(void **)(v8 + 40);
  if (v9)
    v11 = 1;
  else
    v11 = v6 == 0;
  if (!v11)
    goto LABEL_15;
  if (v9)
    v12 = v6 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    v13 = objc_msgSend(v9, "compare:", v6);
    v7 = a1[7];
    v8 = *(_QWORD *)(v7 + 8);
    v10 = (void **)(v8 + 40);
    if (v13 == 1)
    {
LABEL_15:
      v14 = v6;
LABEL_16:
      v15 = v14;
      v16 = *v10;
      *v10 = v15;

      v7 = a1[7];
      goto LABEL_19;
    }
    v9 = *v10;
  }
  if (!v9)
  {
    v10 = (void **)(v8 + 40);
    v14 = v2;
    goto LABEL_16;
  }
LABEL_19:
  objc_storeStrong((id *)(a1[4] + 48), *(id *)(*(_QWORD *)(v7 + 8) + 40));
  objc_storeStrong((id *)(a1[4] + 56), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
  PKLogFacilityTypeGetObject(0xEuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = a1[4];
    v20 = *(_QWORD *)(v18 + 48);
    v19 = *(_QWORD *)(v18 + 56);
    *(_DWORD *)buf = 138412546;
    v38 = v20;
    v39 = 2112;
    v40 = v19;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Summaries oldest %@, newest %@", buf, 0x16u);
  }

  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)objc_opt_class(), "previousStartOfWeekFromDate:", *(_QWORD *)(a1[4] + 48));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "compare:", *(_QWORD *)(a1[4] + 56)) == -1)
  {
    do
    {
      objc_msgSend(v21, "addObject:", v24);
      objc_msgSend((id)objc_opt_class(), "nextStartOfWeekFromDate:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v25;
    }
    while (objc_msgSend(v25, "compare:", *(_QWORD *)(a1[4] + 56)) == -1);
  }
  else
  {
    v25 = v24;
  }
  PKStartOfMonth(*(void **)(a1[4] + 48));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "compare:", *(_QWORD *)(a1[4] + 56)) == -1)
  {
    do
    {
      objc_msgSend(v22, "addObject:", v26);
      PKStartOfNextMonth(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v27;
    }
    while (objc_msgSend(v27, "compare:", *(_QWORD *)(a1[4] + 56)) == -1);
  }
  else
  {
    v27 = v26;
  }
  PKStartOfYear(*(void **)(a1[4] + 48));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "compare:", *(_QWORD *)(a1[4] + 56)) == -1)
  {
    do
    {
      objc_msgSend(v23, "addObject:", v28);
      PKStartOfNextYear(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v29;
    }
    while (objc_msgSend(v29, "compare:", *(_QWORD *)(a1[4] + 56)) == -1);
  }
  else
  {
    v29 = v28;
  }
  v30 = (void *)a1[5];
  if (v30)
  {
    v31 = *(NSObject **)(a1[4] + 72);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_58;
    v32[3] = &unk_1E2ABDB58;
    v36 = v30;
    v33 = v21;
    v34 = v22;
    v35 = v23;
    dispatch_async(v31, v32);

  }
}

void __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_58(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 56);
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);

}

- (id)cachedSpendingSummaryStartingWithDate:(id)a3 type:(unint64_t)a4
{
  return -[PKSpendingSummaryFetcher _cachedSpendingSummaryStartingWithDate:type:withLastPeriodChange:](self, "_cachedSpendingSummaryStartingWithDate:type:withLastPeriodChange:", a3, a4, 1);
}

- (id)_cachedSpendingSummaryStartingWithDate:(id)a3 type:(unint64_t)a4 withLastPeriodChange:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a3;
  -[PKSpendingSummaryFetcher _cacheForType:](self, "_cacheForType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v5)
  {
    objc_msgSend(v10, "previousTotalSpending");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_8;
  }
  else if (!v10)
  {
    v11 = 0;
    goto LABEL_8;
  }
  v11 = v10;
LABEL_8:

  return v11;
}

- (void)spendingSummaryStartingWithDate:(id)a3 type:(unint64_t)a4 includingLastPeriodChange:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  PKSpendingSummaryFetcherRequest *v11;
  id v12;
  void *v13;
  id v14;

  v6 = a5;
  v14 = a6;
  v10 = a3;
  v11 = objc_alloc_init(PKSpendingSummaryFetcherRequest);
  -[PKSpendingSummaryFetcherRequest setStartDate:](v11, "setStartDate:", v10);

  -[PKSpendingSummaryFetcherRequest setWithLastChange:](v11, "setWithLastChange:", v6);
  -[PKSpendingSummaryFetcherRequest setType:](v11, "setType:", a4);
  os_unfair_lock_lock(&self->_requestsLock);
  -[NSMutableOrderedSet addObject:](self->_pendingRequests, "addObject:", v11);
  -[NSMutableDictionary objectForKey:](self->_blockPendingRequests, "objectForKey:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKey:](self->_blockPendingRequests, "setObject:forKey:", v12, v11);
  }
  if (v14)
  {
    v13 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v12, "addObject:", v13);

  }
  os_unfair_lock_unlock(&self->_requestsLock);
  -[PKSpendingSummaryFetcher _processNextRequest](self, "_processNextRequest");

}

- (void)_processNextRequest
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PKSpendingSummaryFetcher__processNextRequest__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __47__PKSpendingSummaryFetcher__processNextRequest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[5];
  id v19;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 136)
    || (objc_msgSend(*(id *)(v2 + 120), "lastObject"),
        v3 = objc_claimAutoreleasedReturnValue(),
        v2 = *(_QWORD *)(a1 + 32),
        !v3))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 112));
    return;
  }
  v4 = (void *)v3;
  *(_BYTE *)(v2 + 136) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObject:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObjectForKey:", v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  v7 = objc_msgSend(v4, "type");
  if (v7 == 2)
  {
    objc_msgSend(v4, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKEndOfYear(v9);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = (void *)v12;
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    objc_msgSend(v4, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKEndOfMonth(v9);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v7)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v8 = (void *)objc_opt_class();
  objc_msgSend(v4, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextStartOfWeekFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", -1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
LABEL_13:
  v13 = *(void **)(a1 + 32);
  objc_msgSend(v4, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "type");
  v16 = objc_msgSend(v4, "withLastChange");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__PKSpendingSummaryFetcher__processNextRequest__block_invoke_2;
  v18[3] = &unk_1E2ACF6E0;
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = v6;
  v17 = v6;
  objc_msgSend(v13, "_spendingSummaryStartingWithDate:endDate:type:withLastPeriodChange:completion:", v14, v11, v15, v16, v18);

}

void __47__PKSpendingSummaryFetcher__processNextRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "_processNextRequest", (_QWORD)v9);
}

- (void)_spendingSummaryStartingWithDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 withLastPeriodChange:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  NSObject *replyQueue;
  id v16;
  void *v17;
  PKAsyncUnaryOperationComposer *v18;
  PKAsyncUnaryOperationComposer *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  PKSpendingSummaryFetcher *v34;
  id v35;
  uint64_t *v36;
  _QWORD v37[6];
  BOOL v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  uint64_t *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  uint64_t *v48;
  _QWORD *v49;
  unint64_t v50;
  BOOL v51;
  _QWORD v52[5];
  id v53;
  uint64_t *v54;
  _QWORD *v55;
  unint64_t v56;
  BOOL v57;
  _QWORD v58[4];
  id v59;
  PKSpendingSummaryFetcher *v60;
  _QWORD *v61;
  unint64_t v62;
  BOOL v63;
  _QWORD v64[5];
  _QWORD v65[5];
  id v66;
  _QWORD block[4];
  id v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__35;
  v74 = __Block_byref_object_dispose__35;
  -[PKSpendingSummaryFetcher _cachedSpendingSummaryStartingWithDate:type:withLastPeriodChange:](self, "_cachedSpendingSummaryStartingWithDate:type:withLastPeriodChange:", v12, a5, v8);
  v75 = (id)objc_claimAutoreleasedReturnValue();
  if (!v71[5])
  {
    -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_transactionSourceCollection, "transactionSourceIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSummaryFetcher _cacheForType:](self, "_cacheForType:", a5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v13;
    v18 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v19 = v18;
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x3032000000;
    v65[3] = __Block_byref_object_copy__35;
    v65[4] = __Block_byref_object_dispose__35;
    v66 = 0;
    if (!self->_earliestSpendingByAnotherUser)
    {
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_2;
      v64[3] = &unk_1E2ACF778;
      v64[4] = self;
      -[PKAsyncUnaryOperationComposer addOperation:](v18, "addOperation:", v64);
    }
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_6;
    v58[3] = &unk_1E2ACF7C8;
    v63 = v8;
    v20 = v12;
    v59 = v20;
    v60 = self;
    v61 = v65;
    v62 = a5;
    -[PKAsyncUnaryOperationComposer addOperation:](v19, "addOperation:", v58);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_8;
    v52[3] = &unk_1E2ACF818;
    v54 = &v70;
    v52[4] = self;
    v21 = v20;
    v57 = v8;
    v53 = v21;
    v55 = v65;
    v56 = a5;
    -[PKAsyncUnaryOperationComposer addOperation:](v19, "addOperation:", v52);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_11;
    v44[3] = &unk_1E2ACF8B8;
    v44[4] = self;
    v22 = v17;
    v45 = v22;
    v23 = v21;
    v46 = v23;
    v24 = v30;
    v47 = v24;
    v48 = &v70;
    v49 = v65;
    v50 = a5;
    v51 = v8;
    -[PKAsyncUnaryOperationComposer addOperation:](v19, "addOperation:", v44);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_15;
    v39[3] = &unk_1E2ACF908;
    v39[4] = self;
    v16 = v22;
    v40 = v16;
    v25 = v23;
    v41 = v25;
    v42 = v24;
    v43 = &v70;
    -[PKAsyncUnaryOperationComposer addOperation:](v19, "addOperation:", v39);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_17;
    v37[3] = &unk_1E2ACF930;
    v38 = v8;
    v37[4] = self;
    v37[5] = &v70;
    -[PKAsyncUnaryOperationComposer addOperation:](v19, "addOperation:", v37);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_19;
    v31[3] = &unk_1E2ACF958;
    v27 = v29;
    v32 = v27;
    v36 = &v70;
    v33 = v25;
    v34 = self;
    v35 = v14;
    v28 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v19, "evaluateWithInput:completion:", v26, v31);

    _Block_object_dispose(v65, 8);
    v13 = v30;
    goto LABEL_7;
  }
  if (v14)
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke;
    block[3] = &unk_1E2ACF708;
    v68 = v14;
    v69 = &v70;
    dispatch_async(replyQueue, block);
    v16 = v68;
LABEL_7:

  }
  _Block_object_dispose(&v70, 8);

}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKTransactionSourceCollection *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isSharedAccount") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "transactionSources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectsPassingTest:", &__block_literal_global_116);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[PKTransactionSourceCollection initWithTransactionSources:]([PKTransactionSourceCollection alloc], "initWithTransactionSources:", v9);
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    -[PKTransactionSourceCollection transactionSourceIdentifiers](v10, "transactionSourceIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_4;
    v16[3] = &unk_1E2ACF750;
    v16[4] = *(_QWORD *)(a1 + 32);
    v18 = v7;
    v17 = v6;
    objc_msgSend(v11, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:", v12, 0, 1, 0, 0, -1, 1, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 160);
    *(_QWORD *)(v14 + 160) = v13;

    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "type"))
  {
    objc_msgSend(v2, "accountUser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isCurrentUser") ^ 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_5;
  v7[3] = &unk_1E2AC4A20;
  v8 = v3;
  v9 = v4;
  v11 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "anyObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "transactionDate");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 160);
    *(_QWORD *)(v4 + 160) = v3;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v2 = *(void **)(v7 + 160);
    *(_QWORD *)(v7 + 160) = v6;
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", -1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
    {
      if (v11 == 2)
      {
        PKStartOfYear(v9);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v11 != 1)
        {
          v13 = 0;
          goto LABEL_11;
        }
        PKStartOfMonth(v9);
        v12 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "previousStartOfWeekFromDate:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v12;
    v11 = *(_QWORD *)(a1 + 56);
LABEL_11:
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_7;
    v15[3] = &unk_1E2ACF7A0;
    v14 = *(void **)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    v17 = v8;
    v16 = v6;
    objc_msgSend(v14, "_spendingSummaryStartingWithDate:endDate:type:withLastPeriodChange:completion:", v13, v10, v11, 0, v15);

    goto LABEL_12;
  }
  (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
LABEL_12:

}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  int8x16_t v19;
  id v20;
  id location;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_cachedSpendingSummaryStartingWithDate:type:withLastPeriodChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v15 = *(unsigned __int8 *)(a1 + 72);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_9;
    v16[3] = &unk_1E2ACF7F0;
    objc_copyWeak(&v20, &location);
    v19 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    v18 = v9;
    v17 = v8;
    objc_msgSend(v13, "_addInterestToSummaryIfNecessary:withLastPeriodChange:completion:", v14, v15, v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v8, 0);
  }

}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_9(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSDecimalNumber *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSDecimalNumber *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v3)
    v4 = WeakRetained == 0;
  else
    v4 = 1;
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_25;
  }
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(v3, "totalSpending");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviousTotalSpending:", v6);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "spendingsPerCalendarUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "totalSpending");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "amount");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10 || objc_msgSend(v14, "compare:", v10) == 1)
        {
          v15 = v14;

          v10 = v15;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);

    if (!v10)
      goto LABEL_21;
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(WeakRetained[2], "creditDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currencyCode");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v10, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreviousMaxAmount:", v18);

  }
  else
  {
    v10 = 0;
  }

LABEL_21:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "insights");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_10;
    v21[3] = &unk_1E2ABDA18;
    v23 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_addInsightsToSummary:completion:", v20, v21);

  }
LABEL_25:

}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_11(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v8 + 80);
  v11 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_12;
  v18[3] = &unk_1E2ACF890;
  v13 = *(_QWORD *)(a1 + 64);
  v18[4] = v8;
  v23 = v13;
  v25 = *(_QWORD *)(a1 + 80);
  v19 = v11;
  v14 = *(id *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 72);
  v26 = *(_BYTE *)(a1 + 88);
  v24 = v15;
  v21 = v6;
  v22 = v7;
  v20 = v14;
  v16 = v6;
  v17 = v7;
  objc_msgSend(v10, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:", v9, 0, 1, v19, v12, 1, 0, v18);

}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 64);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_13;
  v12[3] = &unk_1E2ACF868;
  v7 = *(_QWORD *)(a1 + 72);
  v12[4] = v4;
  v13 = v3;
  v8 = *(_QWORD *)(a1 + 88);
  v18 = v7;
  v20 = v8;
  v14 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 80);
  v15 = v9;
  v19 = v10;
  v21 = *(_BYTE *)(a1 + 96);
  v17 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 56);
  v11 = v3;
  dispatch_async(v6, v12);

}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_13(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  id v20;
  id location;

  v2 = (void *)objc_opt_class();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v3 + 184);
  v6 = *(_QWORD *)(v3 + 8);
  objc_msgSend(*(id *)(v3 + 16), "creditDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currencyCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summaryWithTransactions:transactionSourceCollection:accountUser:currency:type:startDate:endDate:lastSummary:", v4, v6, v5, v8, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v14 = *(unsigned __int8 *)(a1 + 104);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_14;
  v17[3] = &unk_1E2ACF840;
  objc_copyWeak(&v20, &location);
  v16 = *(_OWORD *)(a1 + 72);
  v15 = (id)v16;
  v19 = v16;
  v18 = *(id *)(a1 + 64);
  objc_msgSend(v12, "_addInterestToSummaryIfNecessary:withLastPeriodChange:completion:", v13, v14, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v2, "endDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setIsFamilySummary:", objc_msgSend(v3, "compare:", WeakRetained[20]) == 1);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_15(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = a1[4];
  v9 = a1[5];
  v10 = *(void **)(v8 + 80);
  objc_msgSend(*(id *)(v8 + 16), "accountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[6];
  v13 = a1[7];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_16;
  v17[3] = &unk_1E2ACF8E0;
  v14 = a1[8];
  v19 = v7;
  v20 = v14;
  v18 = v6;
  v15 = v6;
  v16 = v7;
  objc_msgSend(v10, "installmentPlanTransactionsForTransactionSourceIdentifiers:accountIdentifier:redeemed:withRedemptionType:startDate:endDate:completion:", v9, v11, 1, 0, v12, v13, v17);

}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDecimalNumber *v9;
  NSDecimalNumber *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "rewards");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "totalAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currency");
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "totalAmount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v3;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v16, "rewardsTotalAmount");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "rewardsTotalAmount");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDecimalNumber decimalNumberByAdding:](v10, "decimalNumberByAdding:", v18);
            v19 = objc_claimAutoreleasedReturnValue();

            v10 = (NSDecimalNumber *)v19;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    PKCurrencyAmountCreate(v10, v24, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTotalAmount:", v20);

    objc_msgSend(v4, "setTransactionCount:", objc_msgSend(v11, "count") + objc_msgSend(v4, "transactionCount"));
    objc_msgSend(v11, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTransactions:", v23);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRewards:", v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_17(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_BYTE *)(a1 + 48))
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_18;
    v11[3] = &unk_1E2ABDA18;
    v13 = v7;
    v12 = v6;
    objc_msgSend(v9, "_addInsightsToSummary:completion:", v10, v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_19(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 72);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_20;
    v6[3] = &unk_1E2ACF708;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 64);
    v7 = v4;
    v8 = v5;
    dispatch_async(v3, v6);

  }
}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)_addInterestToSummaryIfNecessary:(id)a3 withLastPeriodChange:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  void (**v15)(_QWORD);

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (v6 && objc_msgSend(v8, "summaryType") == 1)
  {
    -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_transactionSourceCollection, "transactionSourceIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke;
    v12[3] = &unk_1E2ABE1E8;
    v12[4] = self;
    v13 = v8;
    v14 = v10;
    v15 = v9;
    v11 = v10;
    -[PKSpendingSummaryFetcher _fetchStatementsIfNecessaryWithCompletion:](self, "_fetchStatementsIfNecessaryWithCompletion:", v12);

  }
  else
  {
    v9[2](v9);
  }

}

void __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  v4 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_2;
  v33[3] = &unk_1E2ACF980;
  v34 = v2;
  objc_msgSend(v3, "pk_objectsPassingTest:", v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_3;
  v31[3] = &unk_1E2ACF9A8;
  v32 = *(id *)(a1 + 40);
  v6 = (id)objc_msgSend(v5, "sortedArrayUsingComparator:", v31);
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "openingDate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "closingDate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(*(id *)(a1 + 40), "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "components:fromDate:", 14, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v11, "date:matchesComponents:", v12, v15);

    if (!(_DWORD)v11)
    {
      v10 = 0;
      v9 = 0;
LABEL_11:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_12;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "creditDetails");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountSummary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "balanceSummary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "openingDate");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "creditDetails");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accountSummary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "balanceSummary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "closingDate");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
    v22 = v10 == 0;
  else
    v22 = 1;
  if (v22)
    goto LABEL_11;
  v23 = *(void **)(a1 + 40);
  v24 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v25 = *(_QWORD *)(a1 + 48);
  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_4;
  v26[3] = &unk_1E2ACF9D0;
  v27 = v23;
  v9 = v9;
  v28 = v9;
  v10 = v10;
  v29 = v10;
  v30 = *(id *)(a1 + 56);
  objc_msgSend(v24, "transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v25, 11, 0, 1, v9, v10, 0, v26);

LABEL_12:
}

BOOL __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(a2, "closingDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "compare:", v4) == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "endDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PKStartOfNextMonth(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v3, "compare:", v6) == -1;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;

  v5 = a3;
  objc_msgSend(a2, "closingDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  objc_msgSend(v5, "closingDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;

  if (v9 >= v13)
    v14 = 0;
  else
    v14 = -1;
  if (v9 > v13)
    return 1;
  else
    return v14;
}

void __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  PKPaymentTransactionGroup *v5;
  NSDecimalNumber *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v19 = v4;
    v5 = objc_alloc_init(PKPaymentTransactionGroup);
    -[PKPaymentTransactionGroup setType:](v5, "setType:", 7);
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v6 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "amount");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12 && (objc_msgSend(v12, "pk_isNotANumber") & 1) == 0)
          {
            -[NSDecimalNumber decimalNumberByAdding:](v6, "decimalNumberByAdding:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            v6 = (NSDecimalNumber *)v14;
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "totalSpending");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currency");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v6, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionGroup setTotalAmount:](v5, "setTotalAmount:", v17);

    -[PKPaymentTransactionGroup setStartDate:](v5, "setStartDate:", *(_QWORD *)(a1 + 40));
    -[PKPaymentTransactionGroup setEndDate:](v5, "setEndDate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v7, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionGroup setTransactions:](v5, "setTransactions:", v18);

    -[PKPaymentTransactionGroup setTransactionCount:](v5, "setTransactionCount:", v19);
    objc_msgSend(*(id *)(a1 + 32), "setInterest:", v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_fetchStatementsIfNecessaryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (self->_statements)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__PKSpendingSummaryFetcher__fetchStatementsIfNecessaryWithCompletion___block_invoke;
    v8[3] = &unk_1E2ACF9F8;
    v8[4] = self;
    v9 = v5;
    objc_msgSend(v6, "creditStatementsForAccountIdentifier:completion:", v7, v8);

  }
}

uint64_t __70__PKSpendingSummaryFetcher__fetchStatementsIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = v3;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_addInsightsToSummary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  PKSpendingInsightsFetcher *insightsFetcher;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (PKFinHealthInsightsEnabled())
  {
    objc_msgSend(v6, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {

    }
    else
    {
      v9 = -[PKAccount hideSpendingInsights](self->_account, "hideSpendingInsights");

      if (!v9)
      {
        insightsFetcher = self->_insightsFetcher;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __61__PKSpendingSummaryFetcher__addInsightsToSummary_completion___block_invoke;
        v12[3] = &unk_1E2ACFA20;
        v13 = v6;
        v14 = v7;
        -[PKSpendingInsightsFetcher fetchInsightTrendsForSummary:completion:](insightsFetcher, "fetchInsightTrendsForSummary:completion:", v13, v12);

        goto LABEL_11;
      }
    }
  }
  if (-[PKAccount hideSpendingInsights](self->_account, "hideSpendingInsights"))
  {
    PKLogFacilityTypeGetObject(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Skipping adding insights to summary because hideSpendingInsights supportedFeature is present", buf, 2u);
    }

  }
  if (v7)
    v7[2](v7);
LABEL_11:

}

void __61__PKSpendingSummaryFetcher__addInsightsToSummary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Received trends: %@ error: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setInsights:", v5);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "orderedSpendingCategories", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "spendingTrendForMerchantCategory:", objc_msgSend(v13, "merchantCategory"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v13, "setTrend:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(void))(v15 + 16))();

}

- (id)_cacheForType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return (&self->_weeklySummaryItemsPerStartDate)[a3];
}

+ (id)summaryWithTransactions:(id)a3 transactionSourceCollection:(id)a4 accountUser:(id)a5 currency:(id)a6 type:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 lastSummary:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  id v47;
  id v48;
  id v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  objc_msgSend(a5, "altDSID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = a1;
  v50 = a7;
  v54 = v18;
  v55 = v16;
  v52 = v20;
  v53 = v19;
  v51 = v21;
  objc_msgSend(a1, "_summaryWithTransactions:currency:type:startDate:endDate:lastSummary:altDSID:", v16, v18, a7, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "transactionSourcesForType:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 || !v24)
    goto LABEL_28;
  v46 = v23;
  v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKCurrentUserAltDSID();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v47 = v17;
  objc_msgSend(v17, "transactionSources");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (!v27)
    goto LABEL_25;
  v28 = v27;
  v29 = *(_QWORD *)v59;
  do
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(_QWORD *)v59 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      objc_msgSend(v31, "transactionSourceIdentifiers");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v32, "count"))
      {
LABEL_12:
        v34 = 0;
        goto LABEL_23;
      }
      v33 = objc_msgSend(v31, "type");
      if (v33 != 2)
      {
        if (v33)
          goto LABEL_12;
        v34 = v25;
LABEL_20:
        if (!v34)
          goto LABEL_23;
LABEL_21:
        objc_msgSend(v55, "allObjects");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __136__PKSpendingSummaryFetcher_summaryWithTransactions_transactionSourceCollection_accountUser_currency_type_startDate_endDate_lastSummary___block_invoke;
        v56[3] = &unk_1E2ACFA48;
        v57 = v32;
        objc_msgSend(v40, "pk_objectsPassingTest:", v56);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "_summaryWithTransactions:currency:type:startDate:endDate:lastSummary:altDSID:", v42, v54, v50, v53, v52, v51, v34);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "setObject:forKey:", v43, v34);
        v37 = v57;
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(v31, "accountUser");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "altDSID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = v25;
      v38 = v36;
      if (v37 == v38)
      {

        v34 = v37;
        goto LABEL_22;
      }
      v34 = v38;
      if (!v25 || !v38)
      {

        goto LABEL_20;
      }
      v39 = objc_msgSend(v37, "isEqualToString:", v38);

      if ((v39 & 1) == 0)
        goto LABEL_21;
LABEL_23:

    }
    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  }
  while (v28);
LABEL_25:

  v23 = v46;
  if (objc_msgSend(v48, "count"))
  {
    v44 = (void *)objc_msgSend(v48, "copy");
    objc_msgSend(v46, "setSpendingsPerAltDSID:", v44);

  }
  v17 = v47;
LABEL_28:

  return v23;
}

uint64_t __136__PKSpendingSummaryFetcher_summaryWithTransactions_transactionSourceCollection_accountUser_currency_type_startDate_endDate_lastSummary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "transactionSourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (id)_summaryWithTransactions:(id)a3 currency:(id)a4 type:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 lastSummary:(id)a8 altDSID:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  PKSpendingSummary *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  PKSpendingSummary *v25;
  id v26;
  id v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  double v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t j;
  void *v91;
  void *v92;
  unint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  NSDecimalNumber *v98;
  void *v99;
  PKPaymentTransactionGroup *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSDecimalNumber *v106;
  uint64_t v107;
  uint64_t v108;
  NSDecimalNumber *v109;
  uint64_t v110;
  uint64_t k;
  void *v112;
  void *v113;
  NSDecimalNumber *v114;
  void *v115;
  PKPaymentTransactionGroup *v116;
  void *v117;
  void *v118;
  void *v119;
  PKPaymentTransactionGroup *v120;
  void *v121;
  void *v122;
  PKPaymentTransactionGroup *v123;
  void *v124;
  void *v125;
  void *context;
  void *v128;
  void *v129;
  id v130;
  id v131;
  id v132;
  NSString *v134;
  PKSpendingSummary *v135;
  void *v136;
  id v137;
  NSDecimalNumber *v138;
  id v139;
  NSDecimalNumber *v140;
  id v141;
  uint64_t v142;
  id v143;
  NSDecimalNumber *v144;
  id v145;
  id v146;
  void *v147;
  id v148;
  void *v149;
  unint64_t v150;
  NSDecimalNumber *v151;
  uint64_t v152;
  NSDecimalNumber *v153;
  id obj;
  id obja;
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
  __int128 v171;
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v134 = (NSString *)a4;
  v15 = a6;
  v16 = a7;
  v131 = a8;
  v17 = a9;
  v18 = objc_alloc_init(PKSpendingSummary);
  -[PKSpendingSummary setStartDate:](v18, "setStartDate:", v15);
  -[PKSpendingSummary setEndDate:](v18, "setEndDate:", v16);
  -[PKSpendingSummary setSummaryType:](v18, "setSummaryType:", a5);
  v135 = v18;
  v128 = v17;
  context = (void *)MEMORY[0x19400CFE8](-[PKSpendingSummary setAltDSID:](v18, "setAltDSID:", v17));
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v150 = a5;
  if (a5 > 2)
    v21 = 0;
  else
    v21 = qword_190455260[a5];
  -[PKSpendingSummary setSummaryUnit:](v18, "setSummaryUnit:", objc_msgSend(v19, "component:fromDate:", v21, v15));
  v139 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v143 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v146 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v148 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v141 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v151 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v145 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v138 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v137 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v149 = v20;
  v22 = objc_claimAutoreleasedReturnValue();
  v129 = v14;
  objc_msgSend(a1, "_sortedTransactions:ascending:", v14, 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = v15;
  v132 = v23;
  v24 = v22;
  do
  {
    v25 = objc_alloc_init(PKSpendingSummary);
    -[PKSpendingSummary setStartDate:](v25, "setStartDate:", v23);
    if (v150)
    {
      if (v150 == 2)
      {
        PKEndOfMonth(v23);
        v29 = objc_claimAutoreleasedReturnValue();

        PKStartOfNextMonth(v23);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v149, "component:fromDate:", 4, v29);
        v31 = objc_msgSend(v149, "component:fromDate:", 2, v29);
        v32 = objc_msgSend(v149, "component:fromDate:", 4, v27);
        v33 = objc_msgSend(v149, "component:fromDate:", 2, v27);
        v34 = v30 == v32 && v31 == v33;
        v28 = !v34;
        if (v34)
          v35 = v27;
        else
          v35 = (void *)v29;
        v36 = v35;

        v147 = v36;
        v16 = (id)v29;
      }
      else
      {
        if (v150 != 1)
        {
          v147 = v23;
          v28 = 0;
          goto LABEL_32;
        }
        objc_msgSend(v149, "nextDateAfterDate:matchingUnit:value:options:", v23, 512, 2, 512);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (!v26)
          v26 = v16;
        v27 = v26;

        if (objc_msgSend(v16, "compare:", v27) == 1)
        {
          v28 = 0;
          v147 = v27;
        }
        else
        {
          v16 = v16;

          v28 = 1;
          v147 = v16;
        }
      }
    }
    else
    {
      v37 = objc_msgSend(v149, "component:fromDate:", 512, v23);
      if (v37 == 1)
      {
        v38 = v16;
        v16 = v38;
        v28 = 1;
      }
      else
      {
        if (v37 == 7)
          v39 = 1;
        else
          v39 = v37 + 1;
        objc_msgSend(v149, "nextDateAfterDate:matchingUnit:value:options:", v23, 512, v39, 512);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 0;
      }
      v27 = v23;
      v147 = v38;
    }

    v22 = v24;
LABEL_32:
    v23 = v147;
    objc_msgSend(v147, "dateByAddingTimeInterval:", -1.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSummary setEndDate:](v25, "setEndDate:", v40);

    objc_msgSend(v143, "addObject:", v25);
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v146, "addObject:", v41);

    v42 = objc_alloc(MEMORY[0x1E0CB3598]);
    LODWORD(v43) = 0;
    v44 = (void *)objc_msgSend(v42, "initWithFloat:", v43);
    objc_msgSend(v148, "addObject:", v44);

  }
  while (!v28);
  v130 = v16;
  v45 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v144 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v140 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "setFirstWeekday:", 2);
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  obja = obj;
  v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v168, v175, 16);
  if (!v46)
    goto LABEL_75;
  v47 = v46;
  v48 = *(_QWORD *)v169;
  v49 = v146;
  v50 = v141;
  v152 = *(_QWORD *)v169;
  while (2)
  {
    v51 = 0;
    while (2)
    {
      if (*(_QWORD *)v169 != v48)
        objc_enumerationMutation(obja);
      v52 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v51);
      if (!TransactionIsValidForSummary(v52))
        goto LABEL_73;
      v53 = objc_msgSend(v52, "transactionType");
      if (objc_msgSend(v52, "transactionType") != 1)
      {
        if (v53 == 7)
        {
          objc_msgSend(v52, "amount");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v54)
            goto LABEL_72;
          v55 = (void *)v22;
          objc_msgSend(*(id *)(v45 + 1432), "notANumber");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v54, "compare:", v61);

          if (!v62)
            goto LABEL_71;
          objc_msgSend(v137, "addObject:", v52);
          v58 = v55;
          objc_msgSend(v55, "decimalNumberByAdding:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_70;
        }
        if (v53 == 10)
        {
          objc_msgSend(v145, "addObject:", v52);
          if ((unint64_t)objc_msgSend(v52, "transactionStatus") > 1)
            goto LABEL_73;
          objc_msgSend(v52, "amount");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v54)
            goto LABEL_72;
          v55 = (void *)v22;
          objc_msgSend(*(id *)(v45 + 1432), "notANumber");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v54, "compare:", v59);

          if (!v60)
            goto LABEL_71;
          v58 = v138;
          -[NSDecimalNumber decimalNumberByAdding:](v138, "decimalNumberByAdding:", v54);
          v138 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
LABEL_70:

          goto LABEL_71;
        }
        objc_msgSend(v52, "transactionDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        switch(v150)
        {
          case 0uLL:
            v66 = (objc_msgSend(v149, "component:fromDate:", 512, v54) + 5) % 7;
            goto LABEL_60;
          case 1uLL:
            v63 = objc_msgSend(v149, "rangeOfUnit:inUnit:forDate:", 4096, 8, v54);
            v64 = v149;
            v48 = v152;
            v65 = 4096;
            break;
          case 2uLL:
            v63 = objc_msgSend(v149, "rangeOfUnit:inUnit:forDate:", 8, 4, v54);
            v64 = v149;
            v48 = v152;
            v65 = 8;
            break;
          default:
            v66 = 0;
LABEL_60:
            v67 = objc_msgSend(v49, "count");
            if ((v66 & 0x8000000000000000) != 0 || v67 <= v66)
              goto LABEL_72;
            v55 = (void *)v22;
            objc_msgSend(v49, "objectAtIndex:", v66);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "addObject:", v52);

            objc_msgSend(v52, "amount");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (v58)
            {
              objc_msgSend(v148, "objectAtIndex:", v66);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "decimalNumberByAdding:", v58);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = 0x1E0CB3000;
              objc_msgSend(v148, "replaceObjectAtIndex:withObject:", v66, v70);

            }
            objc_msgSend(v52, "rewardsTotalAmount");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v71;
            if (v71 && objc_msgSend(v71, "compare:", v136))
            {
              objc_msgSend(v139, "addObject:", v52);
              -[NSDecimalNumber decimalNumberByAdding:](v140, "decimalNumberByAdding:", v72);
              v73 = objc_claimAutoreleasedReturnValue();

              v140 = (NSDecimalNumber *)v73;
            }
            else
            {
              objc_msgSend(v52, "rewards");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "rewardsItems");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v142 = objc_msgSend(v75, "count");

              if (v142)
                objc_msgSend(v139, "addObject:", v52);
            }
            v50 = v141;
            -[NSDecimalNumber decimalNumberByAdding:](v144, "decimalNumberByAdding:", v58);
            v76 = objc_claimAutoreleasedReturnValue();

            v144 = (NSDecimalNumber *)v76;
            v49 = v146;
            goto LABEL_70;
        }
        v66 = objc_msgSend(v64, "component:fromDate:", v65, v54) - v63;
        goto LABEL_60;
      }
      objc_msgSend(v52, "amount");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        v55 = (void *)v22;
        objc_msgSend(*(id *)(v45 + 1432), "notANumber");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v54, "compare:", v56);

        if (v57)
        {
          objc_msgSend(v50, "addObject:", v52);
          v58 = v151;
          -[NSDecimalNumber decimalNumberByAdding:](v151, "decimalNumberByAdding:", v54);
          v151 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
          goto LABEL_70;
        }
LABEL_71:
        v22 = (uint64_t)v55;
        v48 = v152;
      }
LABEL_72:

LABEL_73:
      if (v47 != ++v51)
        continue;
      break;
    }
    v47 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v168, v175, 16);
    if (v47)
      continue;
    break;
  }
LABEL_75:
  v153 = (NSDecimalNumber *)v22;

  PKCurrencyAmountCreate(v144, v134, 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummary setTotalSpending:](v135, "setTotalSpending:", v77);

  v78 = (void *)objc_msgSend(v143, "copy");
  -[PKSpendingSummary setSpendingsPerCalendarUnit:](v135, "setSpendingsPerCalendarUnit:", v78);

  objc_msgSend(a1, "_spendingCategoriesFromTransactions:currencyCode:", obja, v134);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v164, v174, 16);
  v81 = v130;
  if (v80)
  {
    v82 = v80;
    v83 = *(_QWORD *)v165;
    do
    {
      for (i = 0; i != v82; ++i)
      {
        if (*(_QWORD *)v165 != v83)
          objc_enumerationMutation(v79);
        v85 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * i);
        objc_msgSend(v85, "setStartDate:", v132);
        objc_msgSend(v85, "setEndDate:", v130);
      }
      v82 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v164, v174, 16);
    }
    while (v82);
  }
  -[PKSpendingSummary setOrderedSpendingCategories:](v135, "setOrderedSpendingCategories:", v79);
  objc_msgSend(a1, "_spendingMerchantsFromTransaction:currencyCode:", obja, v134);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v160, v173, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v161;
    do
    {
      for (j = 0; j != v88; ++j)
      {
        if (*(_QWORD *)v161 != v89)
          objc_enumerationMutation(v86);
        v91 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * j);
        objc_msgSend(v91, "setStartDate:", v132);
        objc_msgSend(v91, "setEndDate:", v130);
      }
      v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v160, v173, 16);
    }
    while (v88);
  }
  -[PKSpendingSummary setOrderedSpendingPerMerchants:](v135, "setOrderedSpendingPerMerchants:", v86);
  v92 = v143;
  if (objc_msgSend(v143, "count"))
  {
    v93 = 0;
    do
    {
      objc_msgSend(v92, "objectAtIndex:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "objectAtIndex:", v93);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_spendingCategoriesFromTransactions:currencyCode:", v95, v134);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setOrderedSpendingCategories:", v96);

      objc_msgSend(a1, "_spendingMerchantsFromTransaction:currencyCode:", v95, v134);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setOrderedSpendingPerMerchants:", v97);

      objc_msgSend(v148, "objectAtIndex:", v93);
      v98 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v98, v134, 0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setTotalSpending:", v99);

      v92 = v143;
      ++v93;
    }
    while (v93 < objc_msgSend(v143, "count"));
  }
  v100 = objc_alloc_init(PKPaymentTransactionGroup);
  -[PKPaymentTransactionGroup setType:](v100, "setType:", 4);
  PKCurrencyAmountCreate(v140, v134, 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionGroup setTotalAmount:](v100, "setTotalAmount:", v101);

  v102 = v132;
  -[PKPaymentTransactionGroup setStartDate:](v100, "setStartDate:", v132);
  -[PKPaymentTransactionGroup setEndDate:](v100, "setEndDate:", v130);
  v103 = (void *)objc_msgSend(v139, "copy");
  -[PKPaymentTransactionGroup setTransactions:](v100, "setTransactions:", v103);

  -[PKPaymentTransactionGroup setTransactionCount:](v100, "setTransactionCount:", objc_msgSend(v139, "count"));
  -[PKSpendingSummary setRewards:](v135, "setRewards:", v100);
  v104 = v131;
  if (v131)
  {
    objc_msgSend(v131, "totalSpending");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSummary setPreviousTotalSpending:](v135, "setPreviousTotalSpending:", v105);

    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    objc_msgSend(v131, "spendingsPerCalendarUnit");
    v106 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    v107 = -[NSDecimalNumber countByEnumeratingWithState:objects:count:](v106, "countByEnumeratingWithState:objects:count:", &v156, v172, 16);
    if (v107)
    {
      v108 = v107;
      v109 = 0;
      v110 = *(_QWORD *)v157;
      do
      {
        for (k = 0; k != v108; ++k)
        {
          if (*(_QWORD *)v157 != v110)
            objc_enumerationMutation(v106);
          objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * k), "totalSpending");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "amount");
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v109 || objc_msgSend(v113, "compare:", v109) == 1)
          {
            v114 = v113;

            v109 = v114;
          }

        }
        v108 = -[NSDecimalNumber countByEnumeratingWithState:objects:count:](v106, "countByEnumeratingWithState:objects:count:", &v156, v172, 16);
      }
      while (v108);

      v81 = v130;
      v104 = v131;
      v102 = v132;
      if (v109)
      {
        PKCurrencyAmountCreate(v109, v134, 0);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSpendingSummary setPreviousMaxAmount:](v135, "setPreviousMaxAmount:", v115);

        goto LABEL_106;
      }
    }
    else
    {
      v109 = v106;
      v104 = v131;
      v102 = v132;
LABEL_106:

    }
  }
  if (objc_msgSend(v141, "count"))
  {
    v116 = objc_alloc_init(PKPaymentTransactionGroup);
    -[PKPaymentTransactionGroup setType:](v116, "setType:", 10);
    PKCurrencyAmountCreate(v151, v134, 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionGroup setTotalAmount:](v116, "setTotalAmount:", v117);

    -[PKPaymentTransactionGroup setStartDate:](v116, "setStartDate:", v102);
    -[PKPaymentTransactionGroup setEndDate:](v116, "setEndDate:", v81);
    v118 = (void *)objc_msgSend(v141, "copy");
    -[PKPaymentTransactionGroup setTransactions:](v116, "setTransactions:", v118);

    -[PKPaymentTransactionGroup setTransactionCount:](v116, "setTransactionCount:", objc_msgSend(v141, "count"));
    -[PKSpendingSummary setRefunds:](v135, "setRefunds:", v116);

  }
  v119 = v145;
  if (objc_msgSend(v145, "count"))
  {
    v120 = objc_alloc_init(PKPaymentTransactionGroup);
    -[PKPaymentTransactionGroup setType:](v120, "setType:", 9);
    PKCurrencyAmountCreate(v138, v134, 0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionGroup setTotalAmount:](v120, "setTotalAmount:", v121);

    -[PKPaymentTransactionGroup setStartDate:](v120, "setStartDate:", v102);
    -[PKPaymentTransactionGroup setEndDate:](v120, "setEndDate:", v81);
    v122 = (void *)objc_msgSend(v145, "copy");
    -[PKPaymentTransactionGroup setTransactions:](v120, "setTransactions:", v122);

    v119 = v145;
    -[PKPaymentTransactionGroup setTransactionCount:](v120, "setTransactionCount:", objc_msgSend(v145, "count"));
    -[PKSpendingSummary setPayments:](v135, "setPayments:", v120);

  }
  if (objc_msgSend(v137, "count"))
  {
    v123 = objc_alloc_init(PKPaymentTransactionGroup);
    -[PKPaymentTransactionGroup setType:](v123, "setType:", 11);
    PKCurrencyAmountCreate(v153, v134, 0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionGroup setTotalAmount:](v123, "setTotalAmount:", v124);

    -[PKPaymentTransactionGroup setStartDate:](v123, "setStartDate:", v102);
    -[PKPaymentTransactionGroup setEndDate:](v123, "setEndDate:", v81);
    v125 = (void *)objc_msgSend(v137, "copy");
    -[PKPaymentTransactionGroup setTransactions:](v123, "setTransactions:", v125);

    v119 = v145;
    -[PKPaymentTransactionGroup setTransactionCount:](v123, "setTransactionCount:", objc_msgSend(v137, "count"));
    -[PKSpendingSummary setAdjustments:](v135, "setAdjustments:", v123);

  }
  objc_autoreleasePoolPop(context);

  return v135;
}

+ (id)_spendingMerchantsFromTransaction:(id)a3 currencyCode:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  PKPaymentTransactionGroup *v36;
  NSDecimalNumber *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  void *v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  void *v46;
  id v47;
  NSString *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD aBlock[4];
  id v60;
  id v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v48 = (NSString *)a4;
  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke;
  aBlock[3] = &unk_1E2ACFA70;
  v43 = v9;
  v60 = v43;
  v47 = v8;
  v61 = v47;
  v10 = _Block_copy(aBlock);
  objc_msgSend(v6, "pk_objectsPassingTest:", &__block_literal_global_76);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v10;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  v44 = v13;
  v45 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v56;
    v46 = v7;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v56 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v18, "merchant", v43);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "uniqueIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          (*((void (**)(void *, void *, void *))v12 + 2))(v12, v20, v18);
        }
        else
        {
          v22 = v7;
          v23 = v15;
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke_3;
          v53[3] = &unk_1E2ACFAB8;
          v24 = v19;
          v54 = v24;
          objc_msgSend(v22, "keysOfEntriesPassingTest:", v53);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "count"))
          {
            objc_msgSend(v25, "anyObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKey:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v27, "uniqueIdentifier");
            v28 = objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v24, "hasBetterVisualPropertiesThanMerchant:", v27))
              objc_msgSend(v46, "setObject:forKey:", v24, v28);
            v12 = v45;
            ((void (**)(_QWORD, uint64_t, void *))v45)[2](v45, v28, v18);

            v20 = (void *)v28;
            v13 = v44;
          }
          else
          {
            objc_msgSend(v22, "setObject:forKey:", v24, v20);
            v12 = v45;
            ((void (**)(_QWORD, void *, void *))v45)[2](v45, v20, v18);
          }

          v15 = v23;
          v7 = v46;
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v15);
  }

  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v30 = v43;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v50 != v33)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
        v36 = objc_alloc_init(PKPaymentTransactionGroup);
        objc_msgSend(v47, "objectForKey:", v35);
        v37 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountCreate(v37, v48, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransactionGroup setTotalAmount:](v36, "setTotalAmount:", v38);

        objc_msgSend(v30, "objectForKey:", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransactionGroup setTransactions:](v36, "setTransactions:", v39);
        -[PKPaymentTransactionGroup setTransactionCount:](v36, "setTransactionCount:", objc_msgSend(v39, "count"));
        objc_msgSend(v7, "objectForKey:", v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransactionGroup setMerchant:](v36, "setMerchant:", v40);
        -[PKPaymentTransactionGroup setType:](v36, "setType:", 1);
        objc_msgSend(v29, "addObject:", v36);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v32);
  }

  objc_msgSend(v29, "sortUsingComparator:", &__block_literal_global_79);
  v41 = (void *)objc_msgSend(v29, "copy");

  return v41;
}

void __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v13);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v13);
    if (v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v7)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  objc_msgSend(v5, "amount");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    if (objc_msgSend(v5, "transactionType") != 1
      || (objc_msgSend(v10, "pk_isNegativeNumber") & 1) != 0
      || (objc_msgSend(v10, "pk_negativeValue"),
          v11 = objc_claimAutoreleasedReturnValue(),
          v10,
          (v10 = (void *)v11) != 0))
    {
      objc_msgSend(v8, "decimalNumberByAdding:", v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, v13);
  objc_msgSend(v6, "addObject:", v5);

}

BOOL __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (TransactionIsValidForSummary(v2))
  {
    objc_msgSend(v2, "merchant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "shouldBeCombinedWithMerchant:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

uint64_t __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  objc_msgSend(a3, "totalAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

+ (id)_spendingCategoriesFromTransactions:(id)a3 currencyCode:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  PKPaymentTransactionGroup *v34;
  NSDecimalNumber *v35;
  void *v36;
  void *v37;
  void *v38;
  void *context;
  uint64_t v41;
  void *v42;
  id v43;
  NSString *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v44 = (NSString *)a4;
  context = (void *)MEMORY[0x19400CFE8]();
  v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  v42 = v6;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v51;
    v41 = *(_QWORD *)v51;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v10);
        if (TransactionIsValidForSummary(v11))
        {
          objc_msgSend(v11, "merchant", context);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            v14 = objc_msgSend(v11, "transactionType");

            if (v14 != 1)
            {
              objc_msgSend(v11, "merchant");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "category"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "objectForKey:", v16);
              v17 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectForKey:", v16);
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = (void *)v18;
              if (v17)
              {
                if (v18)
                {
LABEL_11:
                  v20 = objc_alloc(MEMORY[0x1E0CB3598]);
                  objc_msgSend(v11, "amount");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "floatValue");
                  v22 = (void *)objc_msgSend(v20, "initWithFloat:");
                  objc_msgSend(v19, "decimalNumberByAdding:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v45, "setObject:forKey:", v23, v16);
                  objc_msgSend(v17, "addObject:", v11);

                  v9 = v41;
                  v6 = v42;
                  goto LABEL_12;
                }
              }
              else
              {
                v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v43, "setObject:forKey:", v17, v16);
                if (v19)
                  goto LABEL_11;
              }
              v24 = objc_alloc(MEMORY[0x1E0CB3598]);
              LODWORD(v25) = 0;
              v19 = (void *)objc_msgSend(v24, "initWithFloat:", v25);
              goto LABEL_11;
            }
          }
        }
LABEL_12:
        ++v10;
      }
      while (v8 != v10);
      v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      v8 = v26;
    }
    while (v26);
  }

  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v28 = v43;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v47 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v34 = objc_alloc_init(PKPaymentTransactionGroup);
        objc_msgSend(v45, "objectForKey:", v33);
        v35 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountCreate(v35, v44, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransactionGroup setTotalAmount:](v34, "setTotalAmount:", v36);

        objc_msgSend(v28, "objectForKey:", v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentTransactionGroup setTransactions:](v34, "setTransactions:", v37);
        -[PKPaymentTransactionGroup setTransactionCount:](v34, "setTransactionCount:", objc_msgSend(v37, "count"));
        -[PKPaymentTransactionGroup setMerchantCategory:](v34, "setMerchantCategory:", objc_msgSend(v33, "integerValue"));
        -[PKPaymentTransactionGroup setType:](v34, "setType:", 0);
        objc_msgSend(v27, "addObject:", v34);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v30);
  }

  objc_msgSend(v27, "sortUsingComparator:", &__block_literal_global_81_1);
  v38 = (void *)objc_msgSend(v27, "copy");

  objc_autoreleasePoolPop(context);
  return v38;
}

uint64_t __77__PKSpendingSummaryFetcher__spendingCategoriesFromTransactions_currencyCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  objc_msgSend(a3, "totalAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

+ (id)_sortedTransactions:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3928];
  v6 = a3;
  objc_msgSend(v5, "sortDescriptorWithKey:ascending:", CFSTR("transactionDate"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *workQueue;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_transactionSourceCollection, "transactionSourceIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);

    if (v9)
    {
      workQueue = self->_workQueue;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __78__PKSpendingSummaryFetcher_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
      v11[3] = &unk_1E2ABE0D0;
      v11[4] = self;
      v12 = v7;
      dispatch_async(workQueue, v11);

    }
  }

}

uint64_t __78__PKSpendingSummaryFetcher_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 176);
    *(_QWORD *)(v4 + 176) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  }
  objc_msgSend(*(id *)(a1 + 40), "transactionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  return objc_msgSend(*(id *)(a1 + 32), "_startTimerIfNecessary");
}

- (void)_invalidateSummariesForPendingTransactionUpdates
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  NSObject *oslog;
  NSMutableArray *obj;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  const __CFString *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xEuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSMutableArray count](self->_pendingTransactionDates, "count");
    *(_DWORD *)buf = 134349056;
    v70 = v4;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Summary fetcher timer fired, updating for %{public}lu new transactions", buf, 0xCu);
  }
  oslog = v3;

  v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v43 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = self->_pendingTransactionDates;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  if (v5)
  {
    v6 = v5;
    LOBYTE(v7) = 0;
    LOBYTE(v8) = 0;
    v44 = *(_QWORD *)v63;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v63 != v44)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v46, "components:fromDate:", 4110, v10, oslog);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 & 1) != 0 || !self->_oldestTransactionDate)
        {
          v8 = 1;
          if ((v7 & 1) != 0)
            goto LABEL_19;
        }
        else if (objc_msgSend(v10, "compare:") == -1)
        {
          v8 = objc_msgSend(v46, "date:matchesComponents:", self->_oldestTransactionDate, v11) ^ 1;
          if ((v7 & 1) != 0)
          {
LABEL_19:
            v7 = 1;
            goto LABEL_20;
          }
        }
        else
        {
          v8 = 0;
          if ((v7 & 1) != 0)
            goto LABEL_19;
        }
        if (!self->_newestTransactionDate)
          goto LABEL_19;
        if (objc_msgSend(v10, "compare:") == 1)
          v7 = objc_msgSend(v46, "date:matchesComponents:", self->_newestTransactionDate, v11) ^ 1;
        else
          v7 = 0;
LABEL_20:
        objc_msgSend((id)objc_opt_class(), "previousStartOfWeekFromDate:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache objectForKey:](self->_weeklySummaryItemsPerStartDate, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v41, "addObject:", v12);
        PKStartOfMonth(v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache objectForKey:](self->_monthlySummaryItemsPerStartDate, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v42, "addObject:", v14);
        PKStartOfYear(v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache objectForKey:](self->_yearlySummaryItemsPerStartDate, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v43, "addObject:", v16);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      if (!v6)
        goto LABEL_30;
    }
  }
  v7 = 0;
  v8 = 0;
LABEL_30:

  if ((v8 & 1) != 0 || v7)
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("NO");
      if (v8)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      if (v7)
        v18 = CFSTR("YES");
      *(_DWORD *)buf = 138543618;
      v70 = (uint64_t)v19;
      v71 = 2114;
      v72 = v18;
      _os_log_impl(&dword_18FC92000, oslog, OS_LOG_TYPE_DEFAULT, "Summary fetcher invalidating available summaries due to hasTransactionOlderThanOldestDate: %{public}@, hasTransactionNewerThanNewestDate: %{public}@", buf, 0x16u);
    }

    -[PKSpendingSummaryFetcher _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &__block_literal_global_92_0);
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v20 = v41;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  v22 = MEMORY[0x1E0C809B0];
  if (v21)
  {
    v23 = v21;
    v24 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v59 != v24)
          objc_enumerationMutation(v20);
        v26 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
        -[NSCache removeObjectForKey:](self->_weeklySummaryItemsPerStartDate, "removeObjectForKey:", v26, oslog);
        v57[0] = v22;
        v57[1] = 3221225472;
        v57[2] = __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_2;
        v57[3] = &unk_1E2ACFB40;
        v57[4] = v26;
        -[PKSpendingSummaryFetcher _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v57);
      }
      v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v23);
  }
  v45 = v20;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v27 = v42;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v54 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k);
        -[NSCache removeObjectForKey:](self->_monthlySummaryItemsPerStartDate, "removeObjectForKey:", v32, oslog);
        v52[0] = v22;
        v52[1] = 3221225472;
        v52[2] = __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_3;
        v52[3] = &unk_1E2ACFB40;
        v52[4] = v32;
        -[PKSpendingSummaryFetcher _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v52);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    }
    while (v29);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v33 = v43;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v49;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v49 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * m);
        -[NSCache removeObjectForKey:](self->_yearlySummaryItemsPerStartDate, "removeObjectForKey:", v38, oslog);
        v47[0] = v22;
        v47[1] = 3221225472;
        v47[2] = __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_4;
        v47[3] = &unk_1E2ACFB40;
        v47[4] = v38;
        -[PKSpendingSummaryFetcher _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v47);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
    }
    while (v35);
  }

  -[NSMutableArray removeAllObjects](self->_pendingTransactionDates, "removeAllObjects");
}

void __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "invalidatedSummariesAvailable");

}

void __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "invalidatedSpendingSummaryOfType:startingWithDate:", 0, *(_QWORD *)(a1 + 32));

}

void __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "invalidatedSpendingSummaryOfType:startingWithDate:", 1, *(_QWORD *)(a1 + 32));

}

void __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "invalidatedSpendingSummaryOfType:startingWithDate:", 2, *(_QWORD *)(a1 + 32));

}

- (void)_startTimerIfNecessary
{
  OS_dispatch_source *pendingTransactionTimer;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  dispatch_time_t v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD handler[4];
  id v18;
  id buf[2];

  pendingTransactionTimer = self->_pendingTransactionTimer;
  PKLogFacilityTypeGetObject(0xEuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (pendingTransactionTimer)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Summary fetcher postponing pending update timer", (uint8_t *)buf, 2u);
    }

    v6 = self->_pendingTransactionTimer;
    v7 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Summary fetcher starting pending update timer", (uint8_t *)buf, 2u);
    }

    v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_workQueue);
    v9 = self->_pendingTransactionTimer;
    self->_pendingTransactionTimer = v8;

    v10 = self->_pendingTransactionTimer;
    v11 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    objc_initWeak(buf, self);
    v12 = self->_pendingTransactionTimer;
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __50__PKSpendingSummaryFetcher__startTimerIfNecessary__block_invoke;
    handler[3] = &unk_1E2AC3648;
    objc_copyWeak(&v18, buf);
    dispatch_source_set_event_handler(v12, handler);
    v14 = self->_pendingTransactionTimer;
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __50__PKSpendingSummaryFetcher__startTimerIfNecessary__block_invoke_2;
    v15[3] = &unk_1E2AC3648;
    objc_copyWeak(&v16, buf);
    dispatch_source_set_cancel_handler(v14, v15);
    dispatch_resume((dispatch_object_t)self->_pendingTransactionTimer);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
}

void __50__PKSpendingSummaryFetcher__startTimerIfNecessary__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[21];
    v3 = WeakRetained;
    if (v2)
    {
      WeakRetained[21] = 0;

    }
    objc_msgSend(v3, "_invalidateSummariesForPendingTransactionUpdates");
    WeakRetained = v3;
  }

}

void __50__PKSpendingSummaryFetcher__startTimerIfNecessary__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[21];
    WeakRetained[21] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)registerObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_observersLock);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_observersLock);
  }

}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *replyQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_observersLock);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__PKSpendingSummaryFetcher__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __56__PKSpendingSummaryFetcher__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)previousStartOfWeekFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "component:fromDate:", 512, v4) != 2)
  {
    objc_msgSend(v5, "nextDateAfterDate:matchingUnit:value:options:", v4, 512, 2, 260);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  objc_msgSend(v5, "components:fromDate:", 28702, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)nextStartOfWeekFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextDateAfterDate:matchingUnit:value:options:", v4, 512, 2, 256);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)statementsChangedForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

      goto LABEL_11;
    }
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_11;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Invalidating summaries due to statement change", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKSpendingSummaryFetcher_statementsChangedForAccountIdentifier___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(workQueue, block);
LABEL_11:

}

uint64_t __66__PKSpendingSummaryFetcher_statementsChangedForAccountIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "_accessObserversWithHandler:", &__block_literal_global_97);
}

void __66__PKSpendingSummaryFetcher_statementsChangedForAccountIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "invalidatedSpendingSummariesOfType:", 1);

}

- (void)_timeZoneChanged:(id)a3
{
  NSObject *v4;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(0xEuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Invalidate summaries due to time zone change", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PKSpendingSummaryFetcher__timeZoneChanged___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __45__PKSpendingSummaryFetcher__timeZoneChanged___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_resetCurrentCalendar");
  return objc_msgSend(*(id *)(a1 + 32), "_accessObserversWithHandler:", &__block_literal_global_100_0);
}

void __45__PKSpendingSummaryFetcher__timeZoneChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "invalidatedSummariesAvailable");

}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_pendingTransactionDates, 0);
  objc_storeStrong((id *)&self->_pendingTransactionTimer, 0);
  objc_storeStrong((id *)&self->_earliestSpendingByAnotherUser, 0);
  objc_storeStrong((id *)&self->_insightsFetcher, 0);
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_blockPendingRequests, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_newestTransactionDate, 0);
  objc_storeStrong((id *)&self->_oldestTransactionDate, 0);
  objc_storeStrong((id *)&self->_yearlySummaryItemsPerStartDate, 0);
  objc_storeStrong((id *)&self->_monthlySummaryItemsPerStartDate, 0);
  objc_storeStrong((id *)&self->_weeklySummaryItemsPerStartDate, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end
