@implementation PKMessagesAppSharedContext

+ (id)sharedContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PKMessagesAppSharedContext_sharedContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_670 != -1)
    dispatch_once(&_MergedGlobals_670, block);
  return (id)qword_1ED06C6A0;
}

void __43__PKMessagesAppSharedContext_sharedContext__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ED06C6A0;
  qword_1ED06C6A0 = (uint64_t)v1;

}

- (PKMessagesAppSharedContext)init
{
  PKMessagesAppSharedContext *v2;
  uint64_t v3;
  NSPointerArray *weakBubbleAppControllers;
  uint64_t v5;
  NSMutableArray *pendingPrimaryHandlers;
  uint64_t v7;
  NSMutableDictionary *externalizedControllerStateStore;
  PKPaymentDefaultDataProvider *v9;
  PKPaymentDefaultDataProvider *paymentServiceDataProvider;
  dispatch_time_t v11;
  _QWORD block[4];
  PKMessagesAppSharedContext *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKMessagesAppSharedContext;
  v2 = -[PKMessagesAppSharedContext init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    weakBubbleAppControllers = v2->_weakBubbleAppControllers;
    v2->_weakBubbleAppControllers = (NSPointerArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    pendingPrimaryHandlers = v2->_pendingPrimaryHandlers;
    v2->_pendingPrimaryHandlers = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    externalizedControllerStateStore = v2->_externalizedControllerStateStore;
    v2->_externalizedControllerStateStore = (NSMutableDictionary *)v7;

    v9 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    paymentServiceDataProvider = v2->_paymentServiceDataProvider;
    v2->_paymentServiceDataProvider = v9;

    -[PKPaymentDefaultDataProvider addDelegate:](v2->_paymentServiceDataProvider, "addDelegate:", v2);
    v11 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__PKMessagesAppSharedContext_init__block_invoke;
    block[3] = &unk_1E3E612E8;
    v14 = v2;
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);

  }
  return v2;
}

uint64_t __34__PKMessagesAppSharedContext_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeOldCacheEntries");
}

- (NSArray)bubbleAppControllers
{
  return -[NSPointerArray allObjects](self->_weakBubbleAppControllers, "allObjects");
}

- (void)_registerAppViewController:(id)a3
{
  id v4;
  PKTransactionSource *v5;
  PKTransactionSource *transactionSource;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "transactionSource");
  v5 = (PKTransactionSource *)objc_claimAutoreleasedReturnValue();
  transactionSource = self->_transactionSource;
  self->_transactionSource = v5;

  v7 = objc_msgSend(v4, "presentationStyle");
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == 2)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      v16 = v4;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Registering Bubble App Controller : %{public}@", buf, 0xCu);
    }

    -[NSPointerArray addPointer:](self->_weakBubbleAppControllers, "addPointer:", v4);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      v16 = v4;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Registering Primary App Controller : %{public}@", buf, 0xCu);
    }

    objc_storeWeak((id *)&self->_primaryAppController, v4);
    v10 = (void *)-[NSMutableArray copy](self->_pendingPrimaryHandlers, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingPrimaryHandlers, "removeAllObjects");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__PKMessagesAppSharedContext__registerAppViewController___block_invoke;
    v12[3] = &unk_1E3E61388;
    v13 = v4;
    v14 = v10;
    v11 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
}

void __57__PKMessagesAppSharedContext__registerAppViewController___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 134217984;
    v16 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Processing %lu Primary App Controller Handlers.", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_revealPrimaryAppController:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v3 = a3;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Attempting to reveal primary app controller.", buf, 2u);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Requesting presentation on sending controller.", v5, 2u);
  }

  objc_msgSend(v3, "requestPresentationStyle:", 0);
}

- (void)handlePaymentRequestMessage:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  -[PKMessagesAppSharedContext _revealPrimaryAppController:](self, "_revealPrimaryAppController:", a4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PKMessagesAppSharedContext_handlePaymentRequestMessage_sender_completion___block_invoke;
  v12[3] = &unk_1E3E67380;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[PKMessagesAppSharedContext _withPrimaryAppController:](self, "_withPrimaryAppController:", v12);

}

uint64_t __76__PKMessagesAppSharedContext_handlePaymentRequestMessage_sender_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = objc_msgSend(a2, "_handlePaymentRequestMessage:", *(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

- (void)_withPrimaryAppController:(id)a3
{
  void (**v4)(void *, id);
  id WeakRetained;
  NSMutableArray *pendingPrimaryHandlers;
  void *v7;
  void (**aBlock)(void *, id);

  v4 = (void (**)(void *, id))a3;
  if (v4)
  {
    aBlock = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_primaryAppController);
    if (WeakRetained)
    {
      aBlock[2](aBlock, WeakRetained);
    }
    else
    {
      pendingPrimaryHandlers = self->_pendingPrimaryHandlers;
      v7 = _Block_copy(aBlock);
      -[NSMutableArray addObject:](pendingPrimaryHandlers, "addObject:", v7);

    }
    v4 = aBlock;
  }

}

- (void)persistExternalizedControllerState:(id)a3 forMessageIdentifier:(id)a4
{
  NSMutableDictionary *externalizedControllerStateStore;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    externalizedControllerStateStore = self->_externalizedControllerStateStore;
    v7 = a4;
    v8 = a3;
    -[NSMutableDictionary setObject:forKeyedSubscript:](externalizedControllerStateStore, "setObject:forKeyedSubscript:", v8, v7);
    -[PKMessagesAppSharedContext _urlForMessageIdentifier:](self, "_urlForMessageIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(externalizedControllerStateStore) = objc_msgSend(v8, "writeToURL:atomically:", v9, 1);
    if ((externalizedControllerStateStore & 1) == 0)
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Failed to write externalized controller state archive to url: %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
}

- (id)externalizedControllerStateForMessageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_externalizedControllerStateStore, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[PKMessagesAppSharedContext _urlForMessageIdentifier:](self, "_urlForMessageIdentifier:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        PKLogFacilityTypeGetObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 138412290;
          v10 = v6;
          _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Failed to read externalized controller state archive with url: %@", (uint8_t *)&v9, 0xCu);
        }

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)removeExternalizedControllerStateDataForMessageIdentifier:(id)a3
{
  NSMutableDictionary *externalizedControllerStateStore;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    externalizedControllerStateStore = self->_externalizedControllerStateStore;
    v5 = a3;
    -[NSMutableDictionary setObject:forKeyedSubscript:](externalizedControllerStateStore, "setObject:forKeyedSubscript:", 0, v5);
    -[PKMessagesAppSharedContext _urlForMessageIdentifier:](self, "_urlForMessageIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);

    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if ((v5 & 1) != 0)
    {
      if (v9)
      {
        v11 = 138412290;
        v12 = v6;
        v10 = "PKMessagesAppSharedContext: Removed externalized controller state archive at url: %@";
LABEL_7:
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
      }
    }
    else if (v9)
    {
      v11 = 138412290;
      v12 = v6;
      v10 = "PKMessagesAppSharedContext: Failed to remove externalized controller state archive with url: %@";
      goto LABEL_7;
    }

  }
}

- (id)_directoryPath
{
  void *v2;
  void *v3;

  PKCacheDirectoryPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PeerPaymentControllerState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sharedDirectoryPath
{
  void *v2;
  void *v3;

  PKSharedCacheDirectoryPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PeerPaymentControllerState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_urlForMessageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKMessagesAppSharedContext _sharedDirectoryPath](self, "_sharedDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v15);
  v8 = v15;

  if ((v7 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Failed to create externalized controller state directory with error: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("archive"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_purgeOldCacheEntries
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(-2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PKMessagesAppSharedContext__purgeOldCacheEntries__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __51__PKMessagesAppSharedContext__purgeOldCacheEntries__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  char v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  unsigned __int8 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _QWORD v54[5];

  v54[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_directoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v3, &v47);
  v5 = v47;

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 32), "_directoryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = *MEMORY[0x1E0C999D0];
    v11 = *MEMORY[0x1E0C998E8];
    v54[0] = *MEMORY[0x1E0C999D0];
    v54[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v2;
    v33 = (void *)v9;
    objc_msgSend(v2, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, v12, 0, &__block_literal_global_51);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v42 = 0;
          objc_msgSend(v20, "getResourceValue:forKey:error:", &v42, v10, 0);
          v21 = v42;
          v41 = 0;
          objc_msgSend(v20, "getResourceValue:forKey:error:", &v41, v11, 0);
          v22 = v41;
          if ((objc_msgSend(v21, "BOOLValue") & 1) == 0 && objc_msgSend(v22, "compare:", v35) == -1)
            objc_msgSend(v34, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v17);
    }

    if (objc_msgSend(v34, "count"))
    {
      PKLogFacilityTypeGetObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(v34, "count");
        *(_DWORD *)buf = 134217984;
        v49 = v24;
        _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Purging %lu entries from the externalized controller state cache.", buf, 0xCu);
      }

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v25 = v34;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v38 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
            v36 = 0;
            v31 = objc_msgSend(v13, "removeItemAtURL:error:", v30, &v36);
            v32 = v36;
            if ((v31 & 1) == 0)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v49 = v30;
                v50 = 2112;
                v51 = v32;
                _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Failed to remove externalized controller state archive at url: %@ with error: %@", buf, 0x16u);
              }

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
        }
        while (v27);
      }

    }
    v2 = v13;
  }

}

uint64_t __51__PKMessagesAppSharedContext__purgeOldCacheEntries__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Error: Failed to read directory contents: %@ at url: %@", (uint8_t *)&v10, 0x16u);

    }
  }

  return 1;
}

- (NSString)description
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryAppController);
  objc_msgSend(v3, "appendFormat:", CFSTR("primaryAppController: %@ "), WeakRetained);

  -[PKMessagesAppSharedContext bubbleAppControllers](self, "bubbleAppControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("bubbleAppControllers: %@ "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("pendingPrimaryHandlers: %@"), self->_pendingPrimaryHandlers);
  objc_msgSend(v3, "appendFormat:", CFSTR("externalizedControllerStateStore: %@"), self->_externalizedControllerStateStore);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v6;
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6;
  id v7;
  PKTransactionSource *transactionSource;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  transactionSource = self->_transactionSource;
  if (transactionSource
    && (-[PKTransactionSource transactionSourceIdentifiers](transactionSource, "transactionSourceIdentifiers"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "containsObject:", v6),
        v9,
        (v10 & 1) != 0))
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Received updated transaction %@.", buf, 0xCu);
    }

    -[PKMessagesAppSharedContext bubbleAppControllers](self, "bubbleAppControllers");
    v12 = objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "_handleUpdatedTransaction:forTransactionSourceIdentifier:", v7, v6);
        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Received updated transaction for non peer payment pass. Ignoring.", buf, 2u);
    }
  }

}

- (PKMessagesAppControllerInterface)primaryAppController
{
  return (PKMessagesAppControllerInterface *)objc_loadWeakRetained((id *)&self->_primaryAppController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryAppController);
  objc_storeStrong((id *)&self->_externalizedControllerStateStore, 0);
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_pendingPrimaryHandlers, 0);
  objc_storeStrong((id *)&self->_weakBubbleAppControllers, 0);
}

@end
