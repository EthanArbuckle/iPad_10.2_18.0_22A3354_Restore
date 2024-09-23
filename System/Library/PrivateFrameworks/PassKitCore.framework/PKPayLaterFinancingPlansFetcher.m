@implementation PKPayLaterFinancingPlansFetcher

- (PKPayLaterFinancingPlansFetcher)initWithPayLaterAccount:(id)a3
{
  id v5;
  PKPayLaterFinancingPlansFetcher *v6;
  PKPayLaterFinancingPlansFetcher *v7;
  void *v8;
  NSString *v9;
  NSDecimalNumber *v10;
  uint64_t v11;
  PKCurrencyAmount *fallbackAmount;
  uint64_t v13;
  PKAccountService *accountService;
  NSCache *v15;
  NSCache *financingPlanCache;
  NSCache *v17;
  NSCache *installmentMonthCache;
  uint64_t v19;
  NSHashTable *observers;
  NSMutableArray *v21;
  NSMutableArray *pendingRequests;
  NSMutableArray *v23;
  NSMutableArray *dateRangeCompletions;
  dispatch_queue_t v25;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v27;
  OS_dispatch_queue *replyQueue;
  void *v29;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKPayLaterFinancingPlansFetcher;
  v6 = -[PKPayLaterFinancingPlansFetcher init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payLaterAccount, a3);
    -[PKAccount payLaterDetails](v7->_payLaterAccount, "payLaterDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currencyCode");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v10 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v10, v9, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      fallbackAmount = v7->_fallbackAmount;
      v7->_fallbackAmount = (PKCurrencyAmount *)v11;

    }
    else
    {
      v10 = (NSDecimalNumber *)v7->_fallbackAmount;
      v7->_fallbackAmount = 0;
    }

    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    accountService = v7->_accountService;
    v7->_accountService = (PKAccountService *)v13;

    -[PKAccountService registerObserver:](v7->_accountService, "registerObserver:", v7);
    v15 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    financingPlanCache = v7->_financingPlanCache;
    v7->_financingPlanCache = v15;

    v17 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    installmentMonthCache = v7->_installmentMonthCache;
    v7->_installmentMonthCache = v17;

    *(_QWORD *)&v7->_requestsLock._os_unfair_lock_opaque = 0;
    v7->_observersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v19 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dateRangeCompletions = v7->_dateRangeCompletions;
    v7->_dateRangeCompletions = v23;

    v25 = dispatch_queue_create("com.apple.passkitui.plansfetcher.work", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_create("com.apple.passkitui.plansfetcher.reply", 0);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v27;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v7, sel__timeZoneChanged, *MEMORY[0x1E0C998A0], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFinancingPlansFetcher;
  -[PKPayLaterFinancingPlansFetcher dealloc](&v4, sel_dealloc);
}

- (id)cachedInstallmentsMonthWithStartDate:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_cacheLock;
  void *v6;

  PKStartOfMonth(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[NSCache objectForKey:](self->_installmentMonthCache, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_cacheLock);

  return v6;
}

- (void)installmentsMonthWithDate:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  PKPayLaterFinancingPlansFetcherRequest *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a4;
  PKStartOfMonth(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlansFetcher cachedInstallmentsMonthWithStartDate:](self, "cachedInstallmentsMonthWithStartDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v9)
      v9[2](v9, v7);
  }
  else
  {
    v8 = -[PKPayLaterFinancingPlansFetcherRequest initWithStartDate:completion:]([PKPayLaterFinancingPlansFetcherRequest alloc], "initWithStartDate:completion:", v6, v9);
    -[PKPayLaterFinancingPlansFetcher _addRequest:](self, "_addRequest:", v8);

  }
}

- (id)monthDates
{
  return self->_months;
}

- (void)preflightDataIfNecessaryWithCompletion:(id)a3
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
  v7[2] = __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 88))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
  else
  {
    v4 = *(void **)(v2 + 96);
    v5 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v4, "safelyAddObject:", v5);

    v6 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v6 + 89))
    {
      *(_BYTE *)(v6 + 89) = 1;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 8);
      objc_msgSend(*(id *)(v7 + 136), "accountIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_financingPlanStates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_2;
      v11[3] = &unk_1E2AD3BB0;
      v11[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "financingPlanInstallmentsDueDateRangeForAccountIdentifier:financingPlanStates:completion:", v9, v10, v11);

    }
  }
}

void __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  v5 = a3;
  PKStartOfMonth(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKEndOfMonth(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v6, "compare:", v7) == -1)
  {
    do
    {
      objc_msgSend(v8, "addObject:", v6);
      PKStartOfNextMonth(v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v9;
    }
    while (objc_msgSend(v9, "compare:", v7) == -1);
  }
  else
  {
    v9 = v6;
  }
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(NSObject **)(v12 + 72);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_3;
  v17[3] = &unk_1E2AC0F90;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = v8;
  v14 = v8;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

}

void __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xEuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Financing plans date range %@ to %@", buf, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 88) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 89) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 112), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 120), *(id *)(a1 + 40));
  v5 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v5;

  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "removeAllObjects");
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_19;
  block[3] = &unk_1E2ABE120;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, block);

}

void __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_19(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)setPayLaterAccount:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPayLaterFinancingPlansFetcher *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PKPayLaterFinancingPlansFetcher_setPayLaterAccount___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

uint64_t __54__PKPayLaterFinancingPlansFetcher_setPayLaterAccount___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;

  v1 = result;
  v2 = *(void **)(result + 32);
  v3 = *(_QWORD *)(result + 40);
  v4 = *(void **)(v3 + 136);
  if (v2)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (v2 != v4)
    {
LABEL_10:
      objc_storeStrong((id *)(v3 + 136), v2);
      return objc_msgSend(*(id *)(v1 + 40), "_queue_clearAllCache");
    }
  }
  else
  {
    result = objc_msgSend(*(id *)(result + 32), "isEqual:");
    if ((result & 1) == 0)
    {
      v2 = *(void **)(v1 + 32);
      v3 = *(_QWORD *)(v1 + 40);
      goto LABEL_10;
    }
  }
  return result;
}

- (void)financingPlansWithQueries:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke;
    block[3] = &unk_1E2ABE030;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(workQueue, block);

  }
}

void __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke_2;
  v4[3] = &unk_1E2AC44A8;
  v4[4] = v1;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "financingPlansWithQueries:completion:", v2, v4);

}

void __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke_3;
  v7[3] = &unk_1E2ABDA18;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)financingPlansWithQueryItems:(unint64_t)a3 completion:(id)a4
{
  id v6;
  PKAccountServicePayLaterFinancingPlanQuery *v7;
  void *v8;
  PKAccountServicePayLaterFinancingPlanQuery *v9;
  void *v10;
  PKAccountServicePayLaterFinancingPlanQuery *v11;
  _QWORD v12[5];
  PKAccountServicePayLaterFinancingPlanQuery *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = [PKAccountServicePayLaterFinancingPlanQuery alloc];
    -[PKAccount accountIdentifier](self->_payLaterAccount, "accountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKAccountServicePayLaterFinancingPlanQuery initWithAccountIdentifier:queryItems:](v7, "initWithAccountIdentifier:queryItems:", v8, a3);

    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__PKPayLaterFinancingPlansFetcher_financingPlansWithQueryItems_completion___block_invoke;
    v12[3] = &unk_1E2AD3A48;
    v12[4] = self;
    v13 = v9;
    v14 = v6;
    v11 = v9;
    -[PKPayLaterFinancingPlansFetcher financingPlansWithQueries:completion:](self, "financingPlansWithQueries:completion:", v10, v12);

  }
}

void __75__PKPayLaterFinancingPlansFetcher_financingPlansWithQueryItems_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v3, "queryIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

- (void)_addRequest:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock(&self->_requestsLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_pendingRequests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "coalesceRequest:", v4, (_QWORD)v10))
        {

          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (v4)
  {
    -[NSMutableArray addObject:](self->_pendingRequests, "addObject:", v4);
    v5 = v4;
LABEL_12:

  }
  os_unfair_lock_unlock(&self->_requestsLock);
  -[PKPayLaterFinancingPlansFetcher _executeNextRequestIfPossible](self, "_executeNextRequestIfPossible");

}

- (void)_executeNextRequestIfPossible
{
  os_unfair_lock_s *p_requestsLock;
  PKPayLaterFinancingPlansFetcherRequest *v4;
  PKPayLaterFinancingPlansFetcherRequest *currentRequest;
  PKPayLaterFinancingPlansFetcherRequest *v6;
  PKPayLaterFinancingPlansFetcherRequest *v7;

  p_requestsLock = &self->_requestsLock;
  os_unfair_lock_lock(&self->_requestsLock);
  if (self->_currentRequest)
  {
    os_unfair_lock_unlock(p_requestsLock);
  }
  else
  {
    -[NSMutableArray firstObject](self->_pendingRequests, "firstObject");
    v4 = (PKPayLaterFinancingPlansFetcherRequest *)objc_claimAutoreleasedReturnValue();
    currentRequest = self->_currentRequest;
    self->_currentRequest = v4;

    v6 = self->_currentRequest;
    if (v6)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_pendingRequests, "removeObjectAtIndex:", 0);
      v6 = self->_currentRequest;
    }
    v7 = v6;
    os_unfair_lock_unlock(p_requestsLock);
    if (v7)
    {
      -[PKPayLaterFinancingPlansFetcher _executeRequest:](self, "_executeRequest:", v7);

    }
  }
}

- (void)_executeRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke;
    v7[3] = &unk_1E2ABE0D0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(workQueue, v7);

  }
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke(uint64_t a1)
{
  PKAsyncUnaryOperationComposer *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2;
  v25[3] = &unk_1E2ACF778;
  v25[4] = *(_QWORD *)(a1 + 32);
  -[PKAsyncUnaryOperationComposer addOperation:](v2, "addOperation:", v25);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKEndOfMonth(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__50;
  v23[4] = __Block_byref_object_dispose__50;
  v24 = 0;
  PKLogFacilityTypeGetObject(0xEuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v5;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Fetching financing plan installments for start date %@ and end date %@", buf, 0x16u);
  }

  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_27;
  v18[3] = &unk_1E2ACF908;
  v18[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v19 = v8;
  v9 = v5;
  v20 = v9;
  v10 = v6;
  v21 = v10;
  v22 = v23;
  -[PKAsyncUnaryOperationComposer addOperation:](v2, "addOperation:", v18);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_33;
  v14[3] = &unk_1E2AD3C28;
  v14[4] = *(_QWORD *)(a1 + 32);
  v17 = v23;
  v12 = v9;
  v15 = v12;
  v16 = *(id *)(a1 + 40);
  v13 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v2, "evaluateWithInput:completion:", v11, v14);

  _Block_object_dispose(v23, 8);
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  v11[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3;
  v11[3] = &unk_1E2ABDA18;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "preflightDataIfNecessaryWithCompletion:", v11);

}

uint64_t __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_27(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2_28;
  block[3] = &unk_1E2AD3C00;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 32);
  v17 = v10;
  v18 = v11;
  v19 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v22 = v7;
  v23 = v13;
  v20 = v12;
  v21 = v6;
  v14 = v6;
  v15 = v7;
  dispatch_async(v9, block);

}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2_28(uint64_t a1)
{
  PKAccountServicePayLaterFinancingPlanQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  __int128 v15;

  v2 = -[PKAccountServicePayLaterFinancingPlanQuery initWithAccountIdentifier:queryItems:]([PKAccountServicePayLaterFinancingPlanQuery alloc], "initWithAccountIdentifier:queryItems:", *(_QWORD *)(a1 + 32), 32);
  objc_msgSend((id)objc_opt_class(), "_financingPlanStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountServicePayLaterFinancingPlanQuery setRelevantFinancingPlanStates:](v2, "setRelevantFinancingPlanStates:", v3);

  -[PKAccountServicePayLaterFinancingPlanQuery setInstallmentDueOrPaidDateStart:](v2, "setInstallmentDueOrPaidDateStart:", *(_QWORD *)(a1 + 48));
  -[PKAccountServicePayLaterFinancingPlanQuery setInstallmentDueOrPaidDateEnd:](v2, "setInstallmentDueOrPaidDateEnd:", *(_QWORD *)(a1 + 56));
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3_29;
  v10[3] = &unk_1E2AD3BD8;
  v11 = v4;
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v9 = *(_OWORD *)(a1 + 72);
  v8 = (id)v9;
  v15 = v9;
  v14 = *(id *)(a1 + 64);
  objc_msgSend(v5, "financingPlansWithQuery:completion:", v2, v10);

}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3_29(_QWORD *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  PKPayLaterInstallmentsMonth *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "relevantFinancingPlans");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0xEuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v3, "count");
    v6 = a1[4];
    v7 = a1[5];
    v11 = 134218498;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Received %ld financing plan for start date %@ and end date %@", (uint8_t *)&v11, 0x20u);
  }

  v8 = -[PKPayLaterInstallmentsMonth initWithFinancingPlans:fallbackAmount:startDate:endDate:]([PKPayLaterInstallmentsMonth alloc], "initWithFinancingPlans:fallbackAmount:startDate:endDate:", v3, *(_QWORD *)(a1[6] + 16), a1[4], a1[5]);
  v9 = *(_QWORD *)(a1[9] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  (*(void (**)(void))(a1[8] + 16))();
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_33(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 60));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2_34;
  block[3] = &unk_1E2ACB410;
  block[4] = v2;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  dispatch_async(v3, block);

}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2_34(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_executeNextRequestIfPossible");
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3_35;
  v8[3] = &unk_1E2AC1FC0;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  dispatch_async(v5, v8);

}

uint64_t __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3_35(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callCompletionsWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)accountChanged:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPayLaterFinancingPlansFetcher *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PKPayLaterFinancingPlansFetcher_accountChanged___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __50__PKPayLaterFinancingPlansFetcher_accountChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v2;
  v4 = v3;
  if (v12 == v4)
  {

LABEL_10:
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = v8;
    v11 = *(void **)(v9 + 136);
    *(_QWORD *)(v9 + 136) = v10;

    return;
  }
  v5 = v4;
  if (v12)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v12, "isEqualToString:", v4);

  if ((v7 & 1) != 0)
    goto LABEL_10;
}

- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PKPayLaterFinancingPlansFetcher *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPayLaterFinancingPlansFetcher_accountFinancingPlanAdded_accountIdentifier___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, block);

}

void __79__PKPayLaterFinancingPlansFetcher_accountFinancingPlanAdded_accountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  int v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "_queue_financingPlanUpdated:", *(_QWORD *)(a1 + 48));
    return;
  }
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v8 = v5;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
    goto LABEL_10;
}

- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PKPayLaterFinancingPlansFetcher *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPayLaterFinancingPlansFetcher_accountFinancingPlanRemoved_accountIdentifier___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, block);

}

void __81__PKPayLaterFinancingPlansFetcher_accountFinancingPlanRemoved_accountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  int v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "_queue_financingPlanUpdated:", *(_QWORD *)(a1 + 48));
    return;
  }
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v8 = v5;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
    goto LABEL_10;
}

- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  id v7;
  id v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  PKPayLaterFinancingPlansFetcher *v14;
  id v15;

  v7 = a3;
  v8 = a5;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PKPayLaterFinancingPlansFetcher_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  v13 = v8;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(workQueue, block);

}

void __98__PKPayLaterFinancingPlansFetcher_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  int v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "_queue_financingPlanUpdated:", *(_QWORD *)(a1 + 48));
    return;
  }
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v8 = v5;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
    goto LABEL_10;
}

- (void)_queue_financingPlanUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  __CFString *v18;
  id v19;
  void (**v20)(void *, void *);
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  id v26;
  int v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  id v32;
  PKPayLaterFinancingPlansFetcher *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD aBlock[4];
  id v42;
  PKPayLaterFinancingPlansFetcher *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint8_t buf[4];
  const __CFString *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "planSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transactionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    PKStartOfMonth(v6);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  objc_msgSend(v38, "scheduleSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "installments");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dueDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v6;
  v12 = v11;

  if (v12)
  {
    PKEndOfMonth(v12);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  PKStartOfMonth(v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKEndOfMonth(v35);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (objc_msgSend(v13, "compare:", v14) == -1)
  {
    objc_msgSend(v15, "addObject:", v13);
    PKStartOfNextMonth(v13);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
  }
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v38, "planIdentifier");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v55 = v18;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Error: No transactionDate defined for fiancing plan %@", buf, 0xCu);

    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPayLaterFinancingPlansFetcher__queue_financingPlanUpdated___block_invoke;
  aBlock[3] = &unk_1E2AD3C50;
  v19 = v4;
  v42 = v19;
  v43 = self;
  v44 = &v50;
  v45 = &v46;
  v20 = (void (**)(void *, void *))_Block_copy(aBlock);
  v34 = v12;
  objc_msgSend(v15, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v21);

  objc_msgSend(v15, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v22);

  v23 = *((unsigned __int8 *)v51 + 24);
  if (*((_BYTE *)v51 + 24) || *((_BYTE *)v47 + 24))
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v33 = self;
      v25 = v6;
      v26 = v19;
      v27 = *((unsigned __int8 *)v47 + 24);
      objc_msgSend(v38, "planIdentifier");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v30 = CFSTR("YES");
      if (v27)
        v31 = CFSTR("YES");
      else
        v31 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      if (!v23)
        v30 = CFSTR("NO");
      v55 = v30;
      v56 = 2114;
      v57 = v31;
      v58 = 2114;
      v59 = v28;
      _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Invalidating financing plan months older: %{public}@, newer: %{public}@, financingPlan: %{public}@", buf, 0x20u);

      v19 = v26;
      v6 = v25;
      self = v33;
    }

    -[PKPayLaterFinancingPlansFetcher _queue_clearAllCache](self, "_queue_clearAllCache");
    -[PKPayLaterFinancingPlansFetcher _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &__block_literal_global_148);
  }
  -[PKPayLaterFinancingPlansFetcher _queue_clearCacheWithMonths:](self, "_queue_clearCacheWithMonths:", v15);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __63__PKPayLaterFinancingPlansFetcher__queue_financingPlanUpdated___block_invoke_2;
  v39[3] = &unk_1E2AD3C98;
  v32 = v15;
  v40 = v32;
  -[PKPayLaterFinancingPlansFetcher _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v39);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

}

void __63__PKPayLaterFinancingPlansFetcher__queue_financingPlanUpdated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "components:fromDate:", 4110);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
  {
    if (objc_msgSend(v6, "compare:") == -1)
      v4 = objc_msgSend(*(id *)(a1 + 32), "date:matchesComponents:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), v3) ^ 1;
    else
      v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 120))
  {
    if (objc_msgSend(v6, "compare:") == 1)
      v5 = objc_msgSend(*(id *)(a1 + 32), "date:matchesComponents:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), v3) ^ 1;
    else
      v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;

}

void __63__PKPayLaterFinancingPlansFetcher__queue_financingPlanUpdated___block_invoke_43(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "invalidatedInstallmentsMonth");

}

void __63__PKPayLaterFinancingPlansFetcher__queue_financingPlanUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "invalidatedInstallmentsMonthsWithDates:", *(_QWORD *)(a1 + 32));

}

- (void)_queue_clearAllCache
{
  NSDate *oldestDate;
  NSDate *newestDate;
  NSArray *months;

  oldestDate = self->_oldestDate;
  self->_oldestDate = 0;

  newestDate = self->_newestDate;
  self->_newestDate = 0;

  months = self->_months;
  self->_months = 0;

  self->_hasDateRange = 0;
  -[NSCache removeAllObjects](self->_installmentMonthCache, "removeAllObjects");
}

- (void)_queue_clearCacheWithMonths:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSDate *oldestDate;
  NSDate *newestDate;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (self->_oldestDate && objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "compare:") == -1)
        {
          oldestDate = self->_oldestDate;
          self->_oldestDate = 0;

          self->_hasDateRange = 0;
        }
        if (self->_newestDate && objc_msgSend(v9, "compare:") == 1)
        {
          newestDate = self->_newestDate;
          self->_newestDate = 0;

          self->_hasDateRange = 0;
        }
        os_unfair_lock_lock(&self->_cacheLock);
        -[NSCache removeObjectForKey:](self->_installmentMonthCache, "removeObjectForKey:", v9);
        os_unfair_lock_unlock(&self->_cacheLock);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_timeZoneChanged
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PKPayLaterFinancingPlansFetcher__timeZoneChanged__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __51__PKPayLaterFinancingPlansFetcher__timeZoneChanged__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(0xEuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Invalidate financing plan months due to time zone change", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_clearAllCache");
  return objc_msgSend(*(id *)(a1 + 32), "_accessObserversWithHandler:", &__block_literal_global_50_0);
}

void __51__PKPayLaterFinancingPlansFetcher__timeZoneChanged__block_invoke_49(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "invalidatedInstallmentsMonth");

}

+ (id)_financingPlanStates
{
  if (_MergedGlobals_250 != -1)
    dispatch_once(&_MergedGlobals_250, &__block_literal_global_51_1);
  return (id)qword_1ECF228D8;
}

void __55__PKPayLaterFinancingPlansFetcher__financingPlanStates__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECF228D8;
  qword_1ECF228D8 = (uint64_t)&unk_1E2C3E218;

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
    v8[2] = __63__PKPayLaterFinancingPlansFetcher__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __63__PKPayLaterFinancingPlansFetcher__accessObserversWithHandler___block_invoke(uint64_t a1)
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

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_months, 0);
  objc_storeStrong((id *)&self->_newestDate, 0);
  objc_storeStrong((id *)&self->_oldestDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dateRangeCompletions, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_installmentMonthCache, 0);
  objc_storeStrong((id *)&self->_financingPlanCache, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_fallbackAmount, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
}

@end
