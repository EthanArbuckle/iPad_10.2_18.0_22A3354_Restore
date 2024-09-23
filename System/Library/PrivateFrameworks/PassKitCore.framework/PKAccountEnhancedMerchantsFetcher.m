@implementation PKAccountEnhancedMerchantsFetcher

- (PKAccountEnhancedMerchantsFetcher)initWithAccountIdentifier:(id)a3 accountService:(id)a4
{
  id v7;
  id v8;
  PKAccountEnhancedMerchantsFetcher *v9;
  PKAccountEnhancedMerchantsFetcher *v10;
  uint64_t v11;
  NSArray *items;
  NSArray *orderings;
  PKAccountEnhancedMerchantBehavior *v14;
  PKAccountEnhancedMerchantBehavior *behavior;
  NSDate *lastUpdate;
  uint64_t v17;
  NSMutableDictionary *tokenToUpdateHandlerMap;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKAccountEnhancedMerchantsFetcher;
  v9 = -[PKAccountEnhancedMerchantsFetcher init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountIdentifier, a3);
    objc_storeStrong((id *)&v10->_accountService, a4);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    items = v10->_items;
    v10->_items = (NSArray *)v11;

    orderings = v10->_orderings;
    v10->_orderings = 0;

    v14 = objc_alloc_init(PKAccountEnhancedMerchantBehavior);
    behavior = v10->_behavior;
    v10->_behavior = v14;

    lastUpdate = v10->_lastUpdate;
    v10->_lastUpdate = 0;

    v10->_itemsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    tokenToUpdateHandlerMap = v10->_tokenToUpdateHandlerMap;
    v10->_tokenToUpdateHandlerMap = (NSMutableDictionary *)v17;

    v10->_updateHandlersLock._os_unfair_lock_opaque = 0;
    -[PKAccountService registerObserver:](v10->_accountService, "registerObserver:", v10);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKAccountEnhancedMerchantsFetcher;
  -[PKAccountEnhancedMerchantsFetcher dealloc](&v3, sel_dealloc);
}

- (void)reloadDataWithCompletion:(id)a3
{
  -[PKAccountEnhancedMerchantsFetcher _reloadDataIncludeOrderings:includeBehavior:includeMerchants:completion:](self, "_reloadDataIncludeOrderings:includeBehavior:includeMerchants:completion:", 1, 1, 1, a3);
}

- (void)_reloadDataIncludeOrderings:(BOOL)a3 includeBehavior:(BOOL)a4 includeMerchants:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  PKAsyncUnaryOperationComposer *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  v11 = v10;
  if (v10 && !v6 && !v7 && !v8)
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  v12 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke;
    v23[3] = &unk_1E2ACC218;
    objc_copyWeak(&v24, &location);
    -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v23);
    objc_destroyWeak(&v24);
  }
  if (v7)
  {
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_4;
    v21[3] = &unk_1E2ACC218;
    objc_copyWeak(&v22, &location);
    -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v21);
    objc_destroyWeak(&v22);
  }
  if (v6)
  {
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_7;
    v19[3] = &unk_1E2ACC218;
    objc_copyWeak(&v20, &location);
    -[PKAsyncUnaryOperationComposer addOperation:](v12, "addOperation:", v19);
    objc_destroyWeak(&v20);
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_9;
  v17[3] = &unk_1E2AC9F08;
  v15 = v11;
  v18 = v15;
  v16 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v12, "evaluateWithInput:completion:", v14, v17);

  objc_destroyWeak(&location);
}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  uint64_t *WeakRetained;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v14 = WeakRetained[1];
    v13 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_2;
    v15[3] = &unk_1E2AD7530;
    objc_copyWeak(&v18, v10);
    v17 = v9;
    v16 = v8;
    objc_msgSend(v13, "accountEntityOrderingsForAccountWithIdentifier:entityType:completion:", v14, 1, v15);

    objc_destroyWeak(&v18);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }

}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_3;
    v8[3] = &unk_1E2ABE0D0;
    v8[4] = WeakRetained;
    v9 = v3;
    objc_msgSend(v5, "_executeWithLock:", v8);
    (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  uint64_t *WeakRetained;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v14 = WeakRetained[1];
    v13 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_5;
    v15[3] = &unk_1E2AD7558;
    objc_copyWeak(&v18, v10);
    v17 = v9;
    v16 = v8;
    objc_msgSend(v13, "accountEnhancedMerchantBehaviorForAccountWithIdentifier:completion:", v14, v15);

    objc_destroyWeak(&v18);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }

}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_6;
    v8[3] = &unk_1E2ABE0D0;
    v8[4] = WeakRetained;
    v9 = v3;
    objc_msgSend(v5, "_executeWithLock:", v8);
    (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_6(uint64_t a1)
{
  PKAccountEnhancedMerchantBehavior *v2;
  PKAccountEnhancedMerchantBehavior *v3;
  PKAccountEnhancedMerchantBehavior *v4;

  v2 = *(PKAccountEnhancedMerchantBehavior **)(a1 + 40);
  v3 = v2;
  if (!v2)
    v3 = objc_alloc_init(PKAccountEnhancedMerchantBehavior);
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), v3);
  if (!v2)

}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  uint64_t *WeakRetained;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v14 = WeakRetained[1];
    v13 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_8;
    v15[3] = &unk_1E2AD7530;
    objc_copyWeak(&v18, v10);
    v17 = v9;
    v16 = v8;
    objc_msgSend(v13, "accountEnhancedMerchantsForAccountWithIdentifier:completion:", v14, v15);

    objc_destroyWeak(&v18);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }

}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setItems:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v5;
  uint64_t result;

  v5 = objc_msgSend(a4, "isCanceled");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, v5 ^ 1u);
  return result;
}

- (void)updateDataWithCooldownLevel:(unint64_t)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, uint64_t);
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  PKAccountService *accountService;
  NSString *accountIdentifier;
  id v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, uint64_t);
  id v19[2];
  uint8_t buf[4];
  unint64_t v21;
  uint64_t v22;

  v5 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t))a5;
  v9 = -[PKAccountEnhancedMerchantsFetcher dataIsWithinThresholdForCooldownLevel:](self, "dataIsWithinThresholdForCooldownLevel:", a3);
  PKLogFacilityTypeGetObject(0xEuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      v21 = a3;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Account enhanced merchants were updated within the specified time interval (level %ld), returning existing data", buf, 0xCu);
    }

    if (v8)
      v8[2](v8, 1);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      v21 = a3;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Updating account enhanced merchants to within cooldown level %ld", buf, 0xCu);
    }

    -[PKAccountEnhancedMerchantsFetcher _enhancedMerchantBehaviorCopy](self, "_enhancedMerchantBehaviorCopy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    accountIdentifier = self->_accountIdentifier;
    accountService = self->_accountService;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __95__PKAccountEnhancedMerchantsFetcher_updateDataWithCooldownLevel_ignoreErrorBackoff_completion___block_invoke;
    v16[3] = &unk_1E2AD75A8;
    v18 = v8;
    objc_copyWeak(v19, (id *)buf);
    v19[1] = (id)a3;
    v15 = v12;
    v17 = v15;
    -[PKAccountService updateAccountEnhancedMerchantsForAccountWithIdentifier:ignoreErrorBackoff:cooldownLevel:completion:](accountService, "updateAccountEnhancedMerchantsForAccountWithIdentifier:ignoreErrorBackoff:cooldownLevel:completion:", accountIdentifier, v5, a3, v16);

    objc_destroyWeak(v19);
    objc_destroyWeak((id *)buf);

  }
}

void __95__PKAccountEnhancedMerchantsFetcher_updateDataWithCooldownLevel_ignoreErrorBackoff_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id WeakRetained;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Account enhanced merchant update failed: %@", buf, 0xCu);
    }

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (!WeakRetained)
    {
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
    }
    objc_msgSend(WeakRetained, "setItems:", v7);
    objc_msgSend(WeakRetained, "_setLastUpdate:", v9);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __95__PKAccountEnhancedMerchantsFetcher_updateDataWithCooldownLevel_ignoreErrorBackoff_completion___block_invoke_18;
    v16[3] = &unk_1E2AD7580;
    v14 = v9;
    v15 = *(_QWORD *)(a1 + 56);
    v17 = v14;
    v20 = v15;
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "_reloadDataIncludeOrderings:includeBehavior:includeMerchants:completion:", 1, 1, 0, v16);

  }
}

uint64_t __95__PKAccountEnhancedMerchantsFetcher_updateDataWithCooldownLevel_ignoreErrorBackoff_completion___block_invoke_18(uint64_t a1)
{
  unsigned __int8 v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t result;
  uint64_t (*v7)(void);
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = DateIsWithinThresholdForCooldownLevel(*(void **)(a1 + 32), *(_QWORD *)(a1 + 56), *(void **)(a1 + 40));
  PKLogFacilityTypeGetObject(0xEuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 56);
      v9 = 134217984;
      v10 = v5;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Successfully updated account enhanced merchants to within cooldown level %ld", (uint8_t *)&v9, 0xCu);
    }

    result = *(_QWORD *)(a1 + 48);
    if (result)
    {
      v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  else
  {
    if (v4)
    {
      v8 = *(_QWORD *)(a1 + 56);
      v9 = 134217984;
      v10 = v8;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Account enhanced merchants not updated to within provided cooldown level of %ld", (uint8_t *)&v9, 0xCu);
    }

    result = *(_QWORD *)(a1 + 48);
    if (result)
    {
      v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

- (BOOL)dataIsWithinThresholdForCooldownLevel:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[PKAccountEnhancedMerchantsFetcher _lastUpdateCopy](self, "_lastUpdateCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountEnhancedMerchantsFetcher _enhancedMerchantBehaviorCopy](self, "_enhancedMerchantBehaviorCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = DateIsWithinThresholdForCooldownLevel(v5, a3, v6);

  return a3;
}

- (id)enhancedMerchants
{
  os_unfair_lock_s *p_itemsLock;
  void *v4;

  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  v4 = (void *)-[NSArray copy](self->_items, "copy");
  os_unfair_lock_unlock(p_itemsLock);
  return v4;
}

- (id)enhancedMerchantsWithOrderingContext:(unint64_t)a3
{
  void *v5;
  void *v6;
  os_unfair_lock_s *p_itemsLock;
  uint64_t v8;
  NSArray *orderings;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[PKAccountEnhancedMerchantsFetcher enhancedMerchants](self, "enhancedMerchants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_itemsLock = &self->_itemsLock;
    os_unfair_lock_lock(&self->_itemsLock);
    v8 = MEMORY[0x1E0C809B0];
    orderings = self->_orderings;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __74__PKAccountEnhancedMerchantsFetcher_enhancedMerchantsWithOrderingContext___block_invoke;
    v27[3] = &__block_descriptor_40_e33_B16__0__PKAccountEntityOrdering_8l;
    v27[4] = a3;
    -[NSArray pk_firstObjectPassingTest:](orderings, "pk_firstObjectPassingTest:", v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    os_unfair_lock_unlock(p_itemsLock);
    if (v11)
    {
      v21 = v11;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v11, "ordering");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            v22[0] = v8;
            v22[1] = 3221225472;
            v22[2] = __74__PKAccountEnhancedMerchantsFetcher_enhancedMerchantsWithOrderingContext___block_invoke_2;
            v22[3] = &unk_1E2AD75F0;
            v22[4] = v17;
            objc_msgSend(v5, "pk_firstObjectPassingTest:", v22);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "safelyAddObject:", v18);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v14);
      }

      v19 = (void *)objc_msgSend(v6, "copy");
      v11 = v21;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

BOOL __74__PKAccountEnhancedMerchantsFetcher_enhancedMerchantsWithOrderingContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return v2 == objc_msgSend(a2, "context");
}

uint64_t __74__PKAccountEnhancedMerchantsFetcher_enhancedMerchantsWithOrderingContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "privateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v8 = 1;
  }
  else
  {
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
      v8 = 0;
    else
      v8 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v8;
}

- (id)enhancedMerchantMatchingPaymentIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[PKAccountEnhancedMerchantsFetcher enhancedMerchants](self, "enhancedMerchants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__PKAccountEnhancedMerchantsFetcher_enhancedMerchantMatchingPaymentIdentifier___block_invoke;
    v9[3] = &unk_1E2AD75F0;
    v4 = v6;
    v10 = v4;
    objc_msgSend(v5, "pk_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __79__PKAccountEnhancedMerchantsFetcher_enhancedMerchantMatchingPaymentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "hashedPaymentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "paymentIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

- (id)_enhancedMerchantBehaviorCopy
{
  os_unfair_lock_s *p_itemsLock;
  void *v4;

  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  v4 = (void *)-[PKAccountEnhancedMerchantBehavior copy](self->_behavior, "copy");
  os_unfair_lock_unlock(p_itemsLock);
  return v4;
}

- (id)_lastUpdateCopy
{
  os_unfair_lock_s *p_itemsLock;
  void *v4;

  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  v4 = (void *)-[NSDate copy](self->_lastUpdate, "copy");
  os_unfair_lock_unlock(p_itemsLock);
  return v4;
}

- (void)setItems:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PKAccountEnhancedMerchantsFetcher_setItems___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKAccountEnhancedMerchantsFetcher _executeWithLock:](self, "_executeWithLock:", v6);

}

void __46__PKAccountEnhancedMerchantsFetcher_setItems___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (void)_setLastUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PKAccountEnhancedMerchantsFetcher__setLastUpdate___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKAccountEnhancedMerchantsFetcher _executeWithLock:](self, "_executeWithLock:", v6);

}

void __52__PKAccountEnhancedMerchantsFetcher__setLastUpdate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (void)_executeWithLock:(id)a3
{
  os_unfair_lock_s *p_itemsLock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_itemsLock = &self->_itemsLock;
    v4 = (void (**)(_QWORD))a3;
    os_unfair_lock_lock(p_itemsLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_itemsLock);
  }
}

- (id)addUpdateHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  os_unfair_lock_s *p_updateHandlersLock;
  NSMutableDictionary *tokenToUpdateHandlerMap;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_updateHandlersLock = &self->_updateHandlersLock;
  os_unfair_lock_lock(&self->_updateHandlersLock);
  tokenToUpdateHandlerMap = self->_tokenToUpdateHandlerMap;
  v9 = _Block_copy(v5);

  -[NSMutableDictionary setObject:forKey:](tokenToUpdateHandlerMap, "setObject:forKey:", v9, v6);
  os_unfair_lock_unlock(p_updateHandlersLock);
  return v6;
}

- (void)removeUpdateHandler:(id)a3
{
  os_unfair_lock_s *p_updateHandlersLock;
  id v5;

  p_updateHandlersLock = &self->_updateHandlersLock;
  v5 = a3;
  os_unfair_lock_lock(p_updateHandlersLock);
  -[NSMutableDictionary removeObjectForKey:](self->_tokenToUpdateHandlerMap, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_updateHandlersLock);
}

- (void)_triggerUpdateHandlers
{
  os_unfair_lock_s *p_updateHandlersLock;

  p_updateHandlersLock = &self->_updateHandlersLock;
  os_unfair_lock_lock(&self->_updateHandlersLock);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_tokenToUpdateHandlerMap, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_180);
  os_unfair_lock_unlock(p_updateHandlersLock);
}

void __59__PKAccountEnhancedMerchantsFetcher__triggerUpdateHandlers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PKAccountEnhancedMerchantsFetcher__triggerUpdateHandlers__block_invoke_2;
  block[3] = &unk_1E2ABD9A0;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __59__PKAccountEnhancedMerchantsFetcher__triggerUpdateHandlers__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 lastUpdate:(id)a5
{
  id v8;
  id v9;
  NSString *accountIdentifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  _BOOL4 v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  accountIdentifier = self->_accountIdentifier;
  v11 = (NSString *)v8;
  v12 = accountIdentifier;
  if (v12 == v11)
  {

  }
  else
  {
    v13 = v12;
    if (!v11 || !v12)
    {

      goto LABEL_9;
    }
    v14 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

    if (!v14)
      goto LABEL_9;
  }
  -[PKAccountEnhancedMerchantsFetcher setItems:](self, "setItems:", v15);
  -[PKAccountEnhancedMerchantsFetcher _setLastUpdate:](self, "_setLastUpdate:", v9);
  -[PKAccountEnhancedMerchantsFetcher _triggerUpdateHandlers](self, "_triggerUpdateHandlers");
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenToUpdateHandlerMap, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_orderings, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
