@implementation PKSearchService

- (PKSearchService)init
{
  PKSearchService *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *replyQueue;
  PKXPCService *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PKXPCService *remoteService;
  uint64_t v12;
  NSHashTable *observers;
  NSMutableDictionary *v14;
  NSMutableDictionary *results;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKSearchService;
  v2 = -[PKSearchService init](&v17, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.passkit.search.reply", v4);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v5;

    v7 = [PKXPCService alloc];
    PKSearchServiceDaemonInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKSearchServiceClientInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v7, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.search"), v8, v9, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v10;

    v2->_lockObservers._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v12;

    v2->_lockResults._os_unfair_lock_opaque = 0;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    results = v2->_results;
    v2->_results = v14;

  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
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
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__PKSearchService__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __47__PKSearchService__accessObserversWithHandler___block_invoke(uint64_t a1)
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

- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];
  id v12;
  SEL v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKSearchService_errorHandlerForMethod_completion___block_invoke;
  aBlock[3] = &unk_1E2AC2788;
  v12 = v6;
  v13 = a3;
  aBlock[4] = self;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v9 = _Block_copy(v8);

  return v9;
}

void __52__PKSearchService_errorHandlerForMethod_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 buf;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0x12uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKSearchService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PKSearchService_errorHandlerForMethod_completion___block_invoke_13;
  v13[3] = &unk_1E2ABDA68;
  v9 = v6;
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v15 = v10;
  v16 = v9;
  v11 = v13;
  *(_QWORD *)&buf = v8;
  *((_QWORD *)&buf + 1) = 3221225472;
  v18 = __dispatch_async_ar_block_invoke_15;
  v19 = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v3;
  dispatch_async(v7, &buf);

}

uint64_t __52__PKSearchService_errorHandlerForMethod_completion___block_invoke_13(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

- (BOOL)canProvideFullResults
{
  uint64_t v2;
  PKXPCService *remoteService;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v2 = MEMORY[0x1E0C809B0];
  remoteService = self->_remoteService;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PKSearchService_canProvideFullResults__block_invoke;
  v8[3] = &unk_1E2AC4070;
  v8[4] = &v9;
  -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __40__PKSearchService_canProvideFullResults__block_invoke_2;
  v7[3] = &unk_1E2ABDD10;
  v7[4] = &v9;
  objc_msgSend(v5, "canProvideFullResultsWithCompletion:", v7);
  LOBYTE(v4) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v4;
}

uint64_t __40__PKSearchService_canProvideFullResults__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __40__PKSearchService_canProvideFullResults__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)hasSearchableContentForQuery:(id)a3
{
  id v5;
  uint64_t v6;
  PKXPCService *remoteService;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v6 = MEMORY[0x1E0C809B0];
  remoteService = self->_remoteService;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__PKSearchService_hasSearchableContentForQuery___block_invoke;
  v12[3] = &unk_1E2AC4070;
  v12[4] = &v13;
  -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __48__PKSearchService_hasSearchableContentForQuery___block_invoke_2;
  v11[3] = &unk_1E2ABDD10;
  v11[4] = &v13;
  objc_msgSend(v9, "hasSearchableContentForQuery:withCompletion:", v5, v11);
  LOBYTE(v8) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v8;
}

uint64_t __48__PKSearchService_hasSearchableContentForQuery___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __48__PKSearchService_hasSearchableContentForQuery___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)searchWithQuery:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "identifier"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__PKSearchService_searchWithQuery___block_invoke;
    v13[3] = &unk_1E2AC77F8;
    objc_copyWeak(&v15, &location);
    v8 = v6;
    v14 = v8;
    -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSearchService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "searchWithQuery:", v8);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSearchErrorDomain"), 3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSearchService searchDidCompleteWithError:forIdentifier:](self, "searchDidCompleteWithError:forIdentifier:", v11, v12);

  }
}

void __35__PKSearchService_searchWithQuery___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "searchDidCompleteWithError:forIdentifier:", v5, v4);

  }
}

- (void)cancelQueryWithIdentifier:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PKSearchService_cancelQueryWithIdentifier___block_invoke;
  v9[3] = &unk_1E2AC77F8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v10 = v6;
  -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSearchService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cancelQueryWithIdentifier:", v6);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __45__PKSearchService_cancelQueryWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "searchDidCompleteWithError:forIdentifier:", v5, *(_QWORD *)(a1 + 32));

}

- (void)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7 completion:(id)a8
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v14;
  double v15;
  double v16;
  double v17;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v14 = v11;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v22 = *(id *)&a7;
  v23 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __120__PKSearchService_updateRegionWithIdentifier_localizedName_boundingRegion_mapsIdentifier_providerIdentifier_completion___block_invoke;
  v32[3] = &unk_1E2ABD9C8;
  v24 = v22;
  v33 = v24;
  v25 = a4;
  v26 = a3;
  -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSearchService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v23;
  v30[1] = 3221225472;
  v30[2] = __120__PKSearchService_updateRegionWithIdentifier_localizedName_boundingRegion_mapsIdentifier_providerIdentifier_completion___block_invoke_2;
  v30[3] = &unk_1E2AD70A8;
  v31 = v24;
  v29 = v24;
  objc_msgSend(v28, "updateRegionWithIdentifier:localizedName:boundingRegion:mapsIdentifier:providerIdentifier:completion:", v26, v25, a5, a6, v30, v17, v16, v15, v14);

}

uint64_t __120__PKSearchService_updateRegionWithIdentifier_localizedName_boundingRegion_mapsIdentifier_providerIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __120__PKSearchService_updateRegionWithIdentifier_localizedName_boundingRegion_mapsIdentifier_providerIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)searchDidReceivePartialResults:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  os_unfair_lock_s *p_lockResults;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v33;
  void *v34;
  _BYTE v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = PKSearchDetailedLoggingEnabledInWallet();
  PKLogFacilityTypeGetObject(0x12uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v10)
      goto LABEL_7;
    *(_DWORD *)v35 = 138412546;
    *(_QWORD *)&v35[4] = v7;
    *(_WORD *)&v35[12] = 2112;
    *(_QWORD *)&v35[14] = v6;
    v11 = "searchDidReceivePartialResults identifier: %@, results: %@";
    v12 = v9;
    v13 = 22;
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    *(_DWORD *)v35 = 138412290;
    *(_QWORD *)&v35[4] = v7;
    v11 = "searchDidReceivePartialResults identifier: %@";
    v12 = v9;
    v13 = 12;
  }
  _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, v11, v35, v13);
LABEL_7:

  p_lockResults = &self->_lockResults;
  os_unfair_lock_lock(&self->_lockResults);
  -[NSMutableDictionary objectForKey:](self->_results, "objectForKey:", v7);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (id)v15;
    objc_msgSend(v6, "categoryResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v6, "categoryResults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCategoryResults:", v18);

    }
    objc_msgSend(v6, "merchantResults", *(_OWORD *)v35, *(_QWORD *)&v35[16], v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v6, "merchantResults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMerchantResults:", v20);

    }
    objc_msgSend(v6, "transactionResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v6, "transactionResults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTransactionResults:", v22);

    }
    objc_msgSend(v6, "locationResults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v6, "locationResults");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLocationResults:", v24);

    }
    objc_msgSend(v6, "personResults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v6, "personResults");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPersonResults:", v26);

    }
    objc_msgSend(v6, "barcodePassResults");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v6, "barcodePassResults");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBarcodePassResults:", v28);

    }
    objc_msgSend(v6, "paymentPassResults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v6, "paymentPassResults");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPaymentPassResults:", v30);

    }
    objc_msgSend(v6, "suggestedAutocompleteTokens");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v6, "suggestedAutocompleteTokens");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSuggestedAutocompleteTokens:", v32);

    }
    objc_msgSend(v6, "transactionTagResults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v6, "transactionTagResults");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTransactionTagResults:", v34);

    }
  }
  else
  {
    v16 = v6;
    -[NSMutableDictionary setObject:forKey:](self->_results, "setObject:forKey:", v16, v7);
  }
  os_unfair_lock_unlock(p_lockResults);

}

- (void)searchDidCompleteWithError:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0x12uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "searchDidCompleteWithError %@ identifier: %@", buf, 0x16u);
  }

  if (v7)
  {
    os_unfair_lock_lock(&self->_lockResults);
    -[NSMutableDictionary objectForKey:](self->_results, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_results, "removeObjectForKey:", v7);
    os_unfair_lock_unlock(&self->_lockResults);
  }
  else
  {
    v9 = 0;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__PKSearchService_searchDidCompleteWithError_forIdentifier___block_invoke;
  v13[3] = &unk_1E2AD70D0;
  v14 = v6;
  v15 = v9;
  v16 = v7;
  v10 = v7;
  v11 = v9;
  v12 = v6;
  -[PKSearchService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v13);

}

void __60__PKSearchService_searchDidCompleteWithError_forIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "searchDidCompleteWithError:results:forIdentifier:", a1[4], a1[5], a1[6]);

}

- (void)invalidateSearchResults
{
  -[PKSearchService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", &__block_literal_global_175);
}

void __42__PKSearchService_invalidateSearchResults__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "invalidateSearchResults");

}

- (void)regionsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__PKSearchService_regionsWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSearchService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __41__PKSearchService_regionsWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ACAB80;
    v12 = v8;
    objc_msgSend(v10, "regionsWithCompletion:", v11);

  }
}

uint64_t __41__PKSearchService_regionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__PKSearchService_regionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetRegionsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__PKSearchService_resetRegionsWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSearchService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __46__PKSearchService_resetRegionsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABD9A0;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "resetRegionsWithCompletion:", v11);

}

uint64_t __46__PKSearchService_resetRegionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __46__PKSearchService_resetRegionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)resetRegionsCoordinatesWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__PKSearchService_resetRegionsCoordinatesWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSearchService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __57__PKSearchService_resetRegionsCoordinatesWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABD9A0;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "resetRegionsCoordinatesWithCompletion:", v11);

}

uint64_t __57__PKSearchService_resetRegionsCoordinatesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __57__PKSearchService_resetRegionsCoordinatesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transactionsMissingRegionsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__PKSearchService_transactionsMissingRegionsWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSearchService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __60__PKSearchService_transactionsMissingRegionsWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2AD7118;
    v12 = v8;
    objc_msgSend(v10, "transactionsMissingRegionsWithCompletion:", v11);

  }
}

uint64_t __60__PKSearchService_transactionsMissingRegionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__PKSearchService_transactionsMissingRegionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)indexedTransactionsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__PKSearchService_indexedTransactionsWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSearchService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __53__PKSearchService_indexedTransactionsWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ABE738;
    v12 = v8;
    objc_msgSend(v10, "indexedTransactionsWithCompletion:", v11);

  }
}

uint64_t __53__PKSearchService_indexedTransactionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__PKSearchService_indexedTransactionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)indexedTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__PKSearchService_indexedTransactionWithIdentifier_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSearchService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __63__PKSearchService_indexedTransactionWithIdentifier_completion___block_invoke_2;
    v14[3] = &unk_1E2AD7140;
    v15 = v10;
    objc_msgSend(v13, "indexedTransactionWithIdentifier:completion:", v11, v14);

  }
}

uint64_t __63__PKSearchService_indexedTransactionWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__PKSearchService_indexedTransactionWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)indexedPassesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__PKSearchService_indexedPassesWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKSearchService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSearchService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __47__PKSearchService_indexedPassesWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ABE738;
    v12 = v8;
    objc_msgSend(v10, "indexedPassesWithCompletion:", v11);

  }
}

uint64_t __47__PKSearchService_indexedPassesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__PKSearchService_indexedPassesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
