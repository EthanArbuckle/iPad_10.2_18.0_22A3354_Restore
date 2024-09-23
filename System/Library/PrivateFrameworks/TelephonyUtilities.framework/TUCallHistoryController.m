@implementation TUCallHistoryController

- (TUCallHistoryController)initWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4 dataSource:(id)a5 shouldUpdateMetadataCache:(BOOL)a6
{
  id v11;
  TUCallHistoryController *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  TUFeatureFlags *v19;
  TUFeatureFlags *featureFlags;
  uint64_t v21;
  TUDispatcher *dispatcher;
  void *v23;
  uint64_t v24;
  TUDispatcher *simpleIvarDispatcher;
  uint64_t v26;
  NSMutableSet *metadataPreCachedOptions;
  TUCallProviderManager *v28;
  TUCallProviderManager *callProviderManager;
  TUCallProviderManager *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)TUCallHistoryController;
  v12 = -[TUCallHistoryController init](&v34, sel_init);
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%@"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc_init(TUFeatureFlags);
    featureFlags = v12->_featureFlags;
    v12->_featureFlags = v19;

    v12->_coalescingStrategy = a3;
    +[TUDispatcher dispatcherWithIdentifier:](TUDispatcher, "dispatcherWithIdentifier:", v18);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatcher = v12->_dispatcher;
    v12->_dispatcher = (TUDispatcher *)v21;

    objc_msgSend(v18, "stringByAppendingString:", CFSTR("_simpleIvarAccess"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUDispatcher dispatcherWithIdentifier:](TUDispatcher, "dispatcherWithIdentifier:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    simpleIvarDispatcher = v12->_simpleIvarDispatcher;
    v12->_simpleIvarDispatcher = (TUDispatcher *)v24;

    v12->_options = a4;
    v26 = objc_opt_new();
    metadataPreCachedOptions = v12->_metadataPreCachedOptions;
    v12->_metadataPreCachedOptions = (NSMutableSet *)v26;

    v12->_shouldUpdateMetadataCache = a6;
    v28 = objc_alloc_init(TUCallProviderManager);
    callProviderManager = v12->_callProviderManager;
    v12->_callProviderManager = v28;

    v30 = v12->_callProviderManager;
    -[TUDispatcher dispatchQueue](v12->_dispatcher, "dispatchQueue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallProviderManager addDelegate:queue:](v30, "addDelegate:queue:", v12, v31);

    objc_storeStrong((id *)&v12->_dataSource, a5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v12, sel_dispatcherDidFinishBoost_, CFSTR("TUDispatcherDidFinishBoostQualityOfServiceNotification"), v12->_dispatcher);
    -[TUCallHistoryController loadDispatchQueue](v12, "loadDispatchQueue");

  }
  return v12;
}

void __42__TUCallHistoryController_setRecentCalls___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("TUCallHistoryControllerRecentCallsDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);

}

void __38__TUCallHistoryController_recentCalls__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)loadOlderRecentCalls
{
  void *v3;
  id v4;

  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TUCallHistoryController callHistoryManagerLoadOlderRecentCallsDispatchBlock](self, "callHistoryManagerLoadOlderRecentCallsDispatchBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchAsynchronousBlock:", v3);

}

- (id)callHistoryManagerLoadOlderRecentCallsDispatchBlock
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__TUCallHistoryController_callHistoryManagerLoadOlderRecentCallsDispatchBlock__block_invoke;
  aBlock[3] = &unk_1E38A1360;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = _Block_copy(v2);

  return v3;
}

- (BOOL)canLoadOlderRecentCalls
{
  void *v3;
  void *v4;
  char v5;

  -[TUCallHistoryController featureFlags](self, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "increaseCallHistoryEnabled"))
  {
    -[TUCallHistoryController callHistoryManager](self, "callHistoryManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canLoadOlderRecentCalls");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)markRecentCallsAsRead
{
  id v3;

  objc_msgSend(getCHRecentCallClass(), "predicateForCallsWithStatusRead:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TUCallHistoryController markRecentCallsAsReadWithPredicate:](self, "markRecentCallsAsReadWithPredicate:", v3);

}

- (void)markRecentCallsAsReadWithPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  TUCallHistoryController *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __62__TUCallHistoryController_markRecentCallsAsReadWithPredicate___block_invoke;
  v11 = &unk_1E38A1388;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = _Block_copy(&v8);
  -[TUCallHistoryController dispatcher](self, "dispatcher", v8, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dispatchAsynchronousBlock:", v6);

}

void __62__TUCallHistoryController_markRecentCallsAsReadWithPredicate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRead:forCallsWithPredicate:completion:", 1, *(_QWORD *)(a1 + 40), 0);

}

- (void)_updateCallHistoryManagerUsingCurrentOptions
{
  void **v3;
  void *v4;
  void **v5;
  void *v6;
  void **v7;
  void *v8;
  void **v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  unint64_t options;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  int v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _BYTE v46[128];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[5];

  v58[3] = *MEMORY[0x1E0C80C00];
  if (!_updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey)
  {
    v3 = (void **)CUTWeakLinkSymbol();
    if (v3)
      v4 = *v3;
    else
      v4 = 0;
    objc_storeStrong((id *)&_updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey, v4);
  }
  if (!_updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey)
  {
    v5 = (void **)CUTWeakLinkSymbol();
    if (v5)
      v6 = *v5;
    else
      v6 = 0;
    objc_storeStrong((id *)&_updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey, v6);
  }
  if (!_updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey)
  {
    v7 = (void **)CUTWeakLinkSymbol();
    if (v7)
      v8 = *v7;
    else
      v8 = 0;
    objc_storeStrong((id *)&_updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey, v8);
  }
  if (!_updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony)
  {
    v9 = (void **)CUTWeakLinkSymbol();
    if (v9)
      v10 = *v9;
    else
      v10 = 0;
    objc_storeStrong((id *)&_updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony, v10);
  }
  if (!_updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime)
  {
    v11 = (void **)CUTWeakLinkSymbol();
    if (v11)
      v12 = *v11;
    else
      v12 = 0;
    objc_storeStrong((id *)&_updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime, v12);
  }
  if (_updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey
    && _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((self->_options & 4) != 0 && _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony)
    {
      if (_updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey)
      {
        v57[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
        v57[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey;
        v58[0] = &unk_1E38E8F38;
        v58[1] = &unk_1E38E8F50;
        v57[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
        v58[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

        v55[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
        v55[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey;
        v56[0] = &unk_1E38E8F38;
        v56[1] = &unk_1E38E8F38;
        v55[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
        v56[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v15);

        v53[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
        v53[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey;
        v54[0] = &unk_1E38E8F38;
        v54[1] = &unk_1E38E8F68;
        v53[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
        v54[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = v54;
        v18 = v53;
        v19 = 3;
      }
      else
      {
        v51[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
        v51[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
        v52[0] = &unk_1E38E8F38;
        v52[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = v52;
        v18 = v51;
        v19 = 2;
      }
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v20);

    }
    options = self->_options;
    v22 = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime;
    if ((options & 1) != 0 && _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime)
    {
      v49[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
      v49[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
      v50[0] = &unk_1E38E8F38;
      v50[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v23);

      options = self->_options;
      v22 = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime;
    }
    if ((options & 2) != 0 && v22)
    {
      v47[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
      v47[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
      v48[0] = &unk_1E38E8F68;
      v48[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v24);

      options = self->_options;
    }
    if ((options & 8) != 0)
    {
      -[TUCallHistoryController thirdPartyCallProviders](self, "thirdPartyCallProviders");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v39 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v31 = objc_msgSend(v30, "supportsAudioOnly");
            v32 = objc_msgSend(v30, "supportsAudioAndVideo");
            objc_msgSend(v30, "identifier");
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = (void *)v33;
            if (v31)
            {
              v44[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
              v44[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
              v45[0] = v33;
              v45[1] = &unk_1E38E8F38;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v35);

            }
            if (v32)
            {
              v42[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
              v42[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
              v43[0] = v34;
              v43[1] = &unk_1E38E8F68;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v36);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        }
        while (v27);
      }

    }
    -[TUCallHistoryController callHistoryManager](self, "callHistoryManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setLimitingCallKinds:", v13);

  }
}

uint64_t __72__TUCallHistoryController_callHistoryManagerInitializationDispatchBlock__block_invoke(uint64_t a1)
{
  uint64_t result;
  objc_class *v3;
  void **v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  result = CUTWeakLinkClass();
  if (result)
  {
    v3 = (objc_class *)result;
    if (!gSharedCallHistoryInstance_block_invoke__kCHCoalescingStrategyRecents)
    {
      v4 = (void **)CUTWeakLinkSymbol();
      if (v4)
        v5 = *v4;
      else
        v5 = 0;
      objc_storeStrong((id *)&gSharedCallHistoryInstance_block_invoke__kCHCoalescingStrategyRecents, v5);
    }
    v6 = objc_alloc_init(v3);
    objc_msgSend(*(id *)(a1 + 32), "setCallHistoryManager:", v6);

    objc_msgSend(*(id *)(a1 + 32), "_callHistoryCoalescingStrategyForCoalescingStrategy:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = v7;
    else
      v9 = gSharedCallHistoryInstance_block_invoke__kCHCoalescingStrategyRecents;
    objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCoalescingStrategy:", v9);

    return objc_msgSend(*(id *)(a1 + 32), "_updateCallHistoryManagerUsingCurrentOptions");
  }
  return result;
}

- (void)setCallHistoryManager:(id)a3
{
  CHManager *v5;
  void **v6;
  void *v7;
  CHManager *callHistoryManager;
  void *v9;
  void *v10;
  CHManager *v11;

  v5 = (CHManager *)a3;
  if (self->_callHistoryManager != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_callHistoryManager, a3);
    if (!setCallHistoryManager___kCallHistoryDatabaseChangedNotification)
    {
      v6 = (void **)CUTWeakLinkSymbol();
      if (v6)
        v7 = *v6;
      else
        v7 = 0;
      objc_storeStrong((id *)&setCallHistoryManager___kCallHistoryDatabaseChangedNotification, v7);
    }
    callHistoryManager = self->_callHistoryManager;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (callHistoryManager)
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_callHistoryDatabaseChanged_, setCallHistoryManager___kCallHistoryDatabaseChangedNotification, 0);
    else
      objc_msgSend(v9, "removeObserver:name:object:", self, setCallHistoryManager___kCallHistoryDatabaseChangedNotification, 0);

    v5 = v11;
  }

}

- (id)_callHistoryCoalescingStrategyForCoalescingStrategy:(unint64_t)a3
{
  void **v4;
  void *v5;
  void **v6;
  void *v7;
  uint64_t *v8;
  id v9;

  if (!_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyRecents)
  {
    v4 = (void **)CUTWeakLinkSymbol();
    if (v4)
      v5 = *v4;
    else
      v5 = 0;
    objc_storeStrong((id *)&_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyRecents, v5);
  }
  if (!_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyCollapseIfEqual)
  {
    v6 = (void **)CUTWeakLinkSymbol();
    if (v6)
      v7 = *v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyCollapseIfEqual, v7);
  }
  if (a3 == 1)
  {
    v8 = &_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyRecents;
  }
  else
  {
    if (a3 != 2)
    {
      v9 = 0;
      return v9;
    }
    v8 = &_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyCollapseIfEqual;
  }
  v9 = (id)*v8;
  return v9;
}

void __78__TUCallHistoryController_callHistoryManagerLoadOlderRecentCallsDispatchBlock__block_invoke(uint64_t a1)
{
  BOOL v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void **v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  uint8_t buf[16];

  v2 = +[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls](TUCallCapabilities, "supportsDisplayingFaceTimeAudioCalls");
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Call History supports displaying FaceTime Audio calls", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadOlderRecentCalls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Call History does not support displaying FaceTime Audio calls", buf, 2u);
    }

    v7 = gSharedCallHistoryInstance_block_invoke_3__kCHServiceProviderFaceTime;
    if (!gSharedCallHistoryInstance_block_invoke_3__kCHServiceProviderFaceTime)
    {
      v8 = (void **)CUTWeakLinkSymbol();
      if (v8)
        v9 = *v8;
      else
        v9 = 0;
      objc_storeStrong((id *)&gSharedCallHistoryInstance_block_invoke_3__kCHServiceProviderFaceTime, v9);
      v7 = gSharedCallHistoryInstance_block_invoke_3__kCHServiceProviderFaceTime;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("!(mediaType == %@ && serviceProvider == %@)"), &unk_1E38E8F38, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadOlderRecentCallsWithPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "callHistoryControllerCallHistoryFetchLimit");
  v12 = objc_msgSend(v6, "count");
  if (v11 >= v12)
    v13 = v12;
  else
    v13 = v11;
  objc_msgSend(v6, "subarrayWithRange:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRecentCalls:", v14);
  objc_msgSend(*(id *)(a1 + 32), "metadataPreCachedOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "containsObject:", v16);

  if ((v17 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "metadataPreCachedOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

    if (objc_msgSend(*(id *)(a1 + 32), "shouldUpdateMetadataCache"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__TUCallHistoryController_callHistoryManagerLoadOlderRecentCallsDispatchBlock__block_invoke_57;
      block[3] = &unk_1E38A1360;
      v23 = v14;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  objc_msgSend(getCHRecentCallClass(), "predicateForCallsWithStatusRead:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUnreadCallCount:", objc_msgSend(v21, "callCountWithPredicate:", v20));

}

void __69__TUCallHistoryController_callHistoryManagerRecentCallsDispatchBlock__block_invoke(uint64_t a1)
{
  BOOL v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void **v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  uint8_t buf[16];

  v2 = +[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls](TUCallCapabilities, "supportsDisplayingFaceTimeAudioCalls");
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Call History supports displaying FaceTime Audio calls", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recentCalls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Call History does not support displaying FaceTime Audio calls", buf, 2u);
    }

    v7 = gSharedCallHistoryInstance_block_invoke_2__kCHServiceProviderFaceTime;
    if (!gSharedCallHistoryInstance_block_invoke_2__kCHServiceProviderFaceTime)
    {
      v8 = (void **)CUTWeakLinkSymbol();
      if (v8)
        v9 = *v8;
      else
        v9 = 0;
      objc_storeStrong((id *)&gSharedCallHistoryInstance_block_invoke_2__kCHServiceProviderFaceTime, v9);
      v7 = gSharedCallHistoryInstance_block_invoke_2__kCHServiceProviderFaceTime;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("!(mediaType == %@ && serviceProvider == %@)"), &unk_1E38E8F38, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recentCallsWithPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "callHistoryControllerCallHistoryFetchLimit");
  v12 = objc_msgSend(v6, "count");
  if (v11 >= v12)
    v13 = v12;
  else
    v13 = v11;
  objc_msgSend(v6, "subarrayWithRange:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRecentCalls:", v14);
  objc_msgSend(*(id *)(a1 + 32), "metadataPreCachedOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "containsObject:", v16);

  if ((v17 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "metadataPreCachedOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

    if (objc_msgSend(*(id *)(a1 + 32), "shouldUpdateMetadataCache"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__TUCallHistoryController_callHistoryManagerRecentCallsDispatchBlock__block_invoke_55;
      block[3] = &unk_1E38A1360;
      v23 = v14;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  objc_msgSend(getCHRecentCallClass(), "predicateForCallsWithStatusRead:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUnreadCallCount:", objc_msgSend(v21, "callCountWithPredicate:", v20));

}

- (int64_t)callHistoryControllerCallHistoryFetchLimit
{
  void *v2;
  int64_t v3;

  -[TUCallHistoryController featureFlags](self, "featureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "increaseCallHistoryEnabled"))
    v3 = 2000;
  else
    v3 = 100;

  return v3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CHManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (NSMutableSet)metadataPreCachedOptions
{
  return self->_metadataPreCachedOptions;
}

- (void)setRecentCalls:(id)a3
{
  NSArray *v5;
  _QWORD block[5];

  v5 = (NSArray *)a3;
  if (self->_recentCalls != v5)
  {
    objc_storeStrong((id *)&self->_recentCalls, a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__TUCallHistoryController_setRecentCalls___block_invoke;
    block[3] = &unk_1E38A1360;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (BOOL)shouldUpdateMetadataCache
{
  return self->_shouldUpdateMetadataCache;
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__TUCallHistoryController_providersChangedForProviderManager___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "dispatchAsynchronousBlock:", v8);

}

- (unint64_t)unreadCallCount
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[TUCallHistoryController simpleIvarDispatcher](self, "simpleIvarDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__TUCallHistoryController_unreadCallCount__block_invoke;
  v6[3] = &unk_1E38A1CE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "dispatchSynchronousBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setUnreadCallCount:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[TUCallHistoryController simpleIvarDispatcher](self, "simpleIvarDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__TUCallHistoryController_setUnreadCallCount___block_invoke;
  v6[3] = &unk_1E38A1D10;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "dispatchAsynchronousBlock:", v6);

}

- (TUDispatcher)simpleIvarDispatcher
{
  return self->_simpleIvarDispatcher;
}

- (void)loadDispatchQueue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__TUCallHistoryController_loadDispatchQueue__block_invoke;
  v8[3] = &unk_1E38A1360;
  v8[4] = self;
  objc_msgSend(v3, "dispatchAsynchronousBlock:", v8);

  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallHistoryController callHistoryManagerInitializationDispatchBlock](self, "callHistoryManagerInitializationDispatchBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchAsynchronousBlock:", v5);

  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallHistoryController callHistoryManagerRecentCallsDispatchBlock](self, "callHistoryManagerRecentCallsDispatchBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dispatchAsynchronousBlock:", v7);

}

- (NSArray)recentCalls
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__TUCallHistoryController_recentCalls__block_invoke;
  v7[3] = &unk_1E38A1CE8;
  v7[4] = self;
  v7[5] = &v8;
  v3 = _Block_copy(v7);
  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchSynchronousBlock:", v3);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (TUDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (id)callHistoryManagerRecentCallsDispatchBlock
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__TUCallHistoryController_callHistoryManagerRecentCallsDispatchBlock__block_invoke;
  aBlock[3] = &unk_1E38A1360;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = _Block_copy(v2);

  return v3;
}

- (id)callHistoryManagerInitializationDispatchBlock
{
  unint64_t coalescingStrategy;
  void *v3;
  void *v4;
  _QWORD v6[6];

  coalescingStrategy = self->_coalescingStrategy;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__TUCallHistoryController_callHistoryManagerInitializationDispatchBlock__block_invoke;
  v6[3] = &unk_1E38A1D10;
  v6[4] = self;
  v6[5] = coalescingStrategy;
  v3 = _Block_copy(v6);
  v4 = _Block_copy(v3);

  return v4;
}

void __62__TUCallHistoryController_providersChangedForProviderManager___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void (**v4)(void);
  id v5;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "providersPassingTest:", &__block_literal_global_67);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "thirdPartyCallProviders");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToArray:", v5);

    if ((v3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setThirdPartyCallProviders:", v5);
      objc_msgSend(*(id *)(a1 + 32), "_updateCallHistoryManagerUsingCurrentOptions");
      objc_msgSend(*(id *)(a1 + 32), "callHistoryManagerRecentCallsDispatchBlock");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

    }
  }
}

void __44__TUCallHistoryController_loadDispatchQueue__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "callProviderManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providersPassingTest:", &__block_literal_global_9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setThirdPartyCallProviders:", v2);

}

- (void)setThirdPartyCallProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (NSArray)thirdPartyCallProviders
{
  return self->_thirdPartyCallProviders;
}

uint64_t __44__TUCallHistoryController_loadDispatchQueue__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSystemProvider") ^ 1;
}

uint64_t __62__TUCallHistoryController_providersChangedForProviderManager___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSystemProvider") ^ 1;
}

uint64_t __42__TUCallHistoryController_unreadCallCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

+ (id)sharedControllerWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)gSharedCallHistoryInstance;
  if (!gSharedCallHistoryInstance)
  {
    objc_msgSend(a1, "callHistoryControllerWithCoalescingStrategy:options:", a3, a4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)gSharedCallHistoryInstance;
    gSharedCallHistoryInstance = v6;

    v5 = (void *)gSharedCallHistoryInstance;
  }
  return v5;
}

+ (TUCallHistoryController)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4 shouldUpdateMetadataCache:(BOOL)a5
{
  _BOOL8 v5;
  TUCallHistoryControllerXPCClient *v9;
  void *v10;

  v5 = a5;
  v9 = objc_alloc_init(TUCallHistoryControllerXPCClient);
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCoalescingStrategy:options:dataSource:shouldUpdateMetadataCache:", a3, a4, v9, v5);

  return (TUCallHistoryController *)v10;
}

+ (TUCallHistoryController)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4
{
  return +[TUCallHistoryController callHistoryControllerWithCoalescingStrategy:options:shouldUpdateMetadataCache:](TUCallHistoryController, "callHistoryControllerWithCoalescingStrategy:options:shouldUpdateMetadataCache:", a3, a4, 1);
}

void __46__TUCallHistoryController_setUnreadCallCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v1 + 48) != v2)
  {
    *(_QWORD *)(v1 + 48) = v2;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__TUCallHistoryController_setUnreadCallCount___block_invoke_2;
    block[3] = &unk_1E38A1360;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

+ (TUCallHistoryController)sharedController
{
  void *v3;
  void *v6;

  v3 = (void *)gSharedCallHistoryInstance;
  if (!gSharedCallHistoryInstance)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TUCallHistoryController.m"), 109, CFSTR("The controller should have been initialized with sharedControllerWithCoalescingStrategy: before attempting to access the instance with the sharedController convenience method"));

    v3 = (void *)gSharedCallHistoryInstance;
  }
  return (TUCallHistoryController *)v3;
}

- (TUCallHistoryController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is not available for use. To create an object instance use the designated initializer."), "-[TUCallHistoryController init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("** TUAssertion failure: %@"), v4);

  if (_TUAssertShouldCrashApplication())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUCallHistoryController.m"), 139, CFSTR("%s is not available for use. To create an object instance use the designated initializer."), "-[TUCallHistoryController init]");

  }
  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUCallHistoryController;
  -[TUCallHistoryController dealloc](&v4, sel_dealloc);
}

- (unint64_t)coalescingStrategy
{
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__TUCallHistoryController_coalescingStrategy__block_invoke;
  v7[3] = &unk_1E38A1CE8;
  v7[4] = self;
  v7[5] = &v8;
  v3 = _Block_copy(v7);
  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchSynchronousBlock:", v3);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __45__TUCallHistoryController_coalescingStrategy__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void)setCoalescingStrategy:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__TUCallHistoryController_setCoalescingStrategy___block_invoke;
  v6[3] = &unk_1E38A1D10;
  v6[4] = self;
  v6[5] = a3;
  v4 = _Block_copy(v6);
  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchAsynchronousBlock:", v4);

}

void __49__TUCallHistoryController_setCoalescingStrategy___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  void (**v6)(void);

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v1 + 16) != v2)
  {
    *(_QWORD *)(v1 + 16) = v2;
    objc_msgSend(*(id *)(a1 + 32), "_callHistoryCoalescingStrategyForCoalescingStrategy:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCoalescingStrategy:", v4);

    objc_msgSend(*(id *)(a1 + 32), "callHistoryManagerRecentCallsDispatchBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (unint64_t)options
{
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__TUCallHistoryController_options__block_invoke;
  v7[3] = &unk_1E38A1CE8;
  v7[4] = self;
  v7[5] = &v8;
  v3 = _Block_copy(v7);
  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchSynchronousBlock:", v3);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __34__TUCallHistoryController_options__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (void)setOptions:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__TUCallHistoryController_setOptions___block_invoke;
  v6[3] = &unk_1E38A1D10;
  v6[4] = self;
  v6[5] = a3;
  v4 = _Block_copy(v6);
  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchAsynchronousBlock:", v4);

}

void __38__TUCallHistoryController_setOptions___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (**v4)(void);

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v1 + 24) != v2)
  {
    *(_QWORD *)(v1 + 24) = v2;
    objc_msgSend(*(id *)(a1 + 32), "_updateCallHistoryManagerUsingCurrentOptions");
    objc_msgSend(*(id *)(a1 + 32), "callHistoryManagerRecentCallsDispatchBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (NSOperationQueue)searchQueue
{
  NSOperationQueue *searchQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  searchQueue = self->_searchQueue;
  if (!searchQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = self->_searchQueue;
    self->_searchQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_searchQueue, "setMaxConcurrentOperationCount:", 1);
    searchQueue = self->_searchQueue;
  }
  return searchQueue;
}

- (void)cancelSearchFetchOperations
{
  id v2;

  -[TUCallHistoryController searchQueue](self, "searchQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllOperations");

}

- (void)setPreFetchingPredicate:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  TUCallHistoryController *v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB34C8]);
  objc_initWeak(&location, v5);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __51__TUCallHistoryController_setPreFetchingPredicate___block_invoke;
  v11 = &unk_1E38A1D38;
  objc_copyWeak(&v14, &location);
  v12 = self;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "addExecutionBlock:", &v8);
  -[TUCallHistoryController searchQueue](self, "searchQueue", v8, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v5);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __51__TUCallHistoryController_setPreFetchingPredicate___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  int v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  NSObject *v17;
  uint8_t v18[16];
  __int16 v19;
  uint8_t buf[2];

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained
    || (v4 = WeakRetained,
        v5 = objc_loadWeakRetained(v2),
        v6 = objc_msgSend(v5, "isCancelled"),
        v5,
        v4,
        v6))
  {
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Ignoring fetching of recent calls as this operation is cancelled";
      v9 = buf;
LABEL_5:
      _os_log_impl(&dword_19A50D000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v10 + 32) != v11)
  {
    *(_QWORD *)(v10 + 32) = v11;
    objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPreFetchingPredicate:", *(_QWORD *)(a1 + 40));

    v13 = objc_loadWeakRetained(v2);
    if (v13)
    {
      v14 = v13;
      v15 = objc_loadWeakRetained(v2);
      v16 = objc_msgSend(v15, "isCancelled");

      if (!v16)
      {
        TUDefaultLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_19A50D000, v17, OS_LOG_TYPE_DEFAULT, "Setting the recent calls as operation is running", v18, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "callHistoryManagerRecentCallsDispatchBlock");
        v7 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(v7 + 16))();
        goto LABEL_6;
      }
    }
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      v8 = "No need to set the recent calls as this operation is already cancelled because of new fetchPredicate";
      v9 = (uint8_t *)&v19;
      goto LABEL_5;
    }
LABEL_6:

  }
}

void __46__TUCallHistoryController_setUnreadCallCount___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("TUCallHistoryControllerUnreadCallCountDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (void)boostQualityOfService
{
  id v2;

  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boostQualityOfService");

}

- (void)deleteAllRecentCalls
{
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__TUCallHistoryController_deleteAllRecentCalls__block_invoke;
  aBlock[3] = &unk_1E38A1360;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchAsynchronousBlock:", v3);

}

void __47__TUCallHistoryController_deleteAllRecentCalls__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearDatabase");

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allCallHistoryDeleted");

}

- (void)deleteRecentCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  TUCallHistoryController *v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __44__TUCallHistoryController_deleteRecentCall___block_invoke;
    v11 = &unk_1E38A1388;
    v12 = self;
    v13 = v4;
    v6 = _Block_copy(&v8);
    -[TUCallHistoryController dispatcher](self, "dispatcher", v8, v9, v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchAsynchronousBlock:", v6);

  }
}

void __44__TUCallHistoryController_deleteRecentCall___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__TUCallHistoryController_deleteRecentCall___block_invoke_2;
    v7[3] = &unk_1E38A1388;
    v6 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    objc_msgSend(v4, "deleteCalls:withCompletion:", v5, v7);

  }
}

void __44__TUCallHistoryController_deleteRecentCall___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recentCallsDeleted:", v2);

}

- (void)deleteRecentCalls:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  TUCallHistoryController *v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __45__TUCallHistoryController_deleteRecentCalls___block_invoke;
    v10 = &unk_1E38A1388;
    v11 = self;
    v12 = v4;
    v5 = _Block_copy(&v7);
    -[TUCallHistoryController dispatcher](self, "dispatcher", v7, v8, v9, v10, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dispatchAsynchronousBlock:", v5);

  }
}

void __45__TUCallHistoryController_deleteRecentCalls___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__TUCallHistoryController_deleteRecentCalls___block_invoke_2;
    v6[3] = &unk_1E38A1388;
    v5 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    objc_msgSend(v4, "deleteCalls:withCompletion:", v7, v6);

  }
}

void __45__TUCallHistoryController_deleteRecentCalls___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recentCallsDeleted:", *(_QWORD *)(a1 + 40));

}

- (void)markRecentVideoCallsAsRead
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(getCHRecentCallClass(), "predicateForCallsWithStatusRead:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(getCHRecentCallClass(), "predicateForCallsWithMediaType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallHistoryController markRecentCallsAsReadWithPredicate:](self, "markRecentCallsAsReadWithPredicate:", v6);

}

- (void)markRecentAudioCallsAsRead
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(getCHRecentCallClass(), "predicateForCallsWithStatusRead:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(getCHRecentCallClass(), "predicateForCallsWithMediaType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallHistoryController markRecentCallsAsReadWithPredicate:](self, "markRecentCallsAsReadWithPredicate:", v6);

}

- (id)recentCallsWithPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD aBlock[5];
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
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__TUCallHistoryController_recentCallsWithPredicate___block_invoke;
  aBlock[3] = &unk_1E38A1D60;
  v12 = &v13;
  aBlock[4] = self;
  v5 = v4;
  v11 = v5;
  v6 = _Block_copy(aBlock);
  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dispatchSynchronousBlock:", v6);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __52__TUCallHistoryController_recentCallsWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "callHistoryManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentCallsWithPredicate:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __69__TUCallHistoryController_callHistoryManagerRecentCallsDispatchBlock__block_invoke_55(uint64_t a1)
{
  id v2;

  +[TUMetadataClientController sharedInstance](TUMetadataClientController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateMetadataForRecentCalls:", *(_QWORD *)(a1 + 32));

}

void __78__TUCallHistoryController_callHistoryManagerLoadOlderRecentCallsDispatchBlock__block_invoke_57(uint64_t a1)
{
  id v2;

  +[TUMetadataClientController sharedInstance](TUMetadataClientController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateMetadataForRecentCalls:", *(_QWORD *)(a1 + 32));

}

- (void)callHistoryDatabaseChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }

  -[TUCallHistoryController dispatcher](self, "dispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallHistoryController callHistoryManagerRecentCallsDispatchBlock](self, "callHistoryManagerRecentCallsDispatchBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dispatchAsynchronousBlock:", v7);

}

- (void)dispatcherDidFinishBoost:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__TUCallHistoryController_dispatcherDidFinishBoost___block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __52__TUCallHistoryController_dispatcherDidFinishBoost___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("TUCallHistoryControllerDidFinishBoostNotification"), *(_QWORD *)(a1 + 32));

}

- (NSPredicate)preFetchingPredicate
{
  return self->_preFetchingPredicate;
}

- (void)setSearchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_searchQueue, a3);
}

- (void)setCallProviderManager:(id)a3
{
  objc_storeStrong((id *)&self->_callProviderManager, a3);
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (void)setSimpleIvarDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_simpleIvarDispatcher, a3);
}

- (void)setMetadataPreCachedOptions:(id)a3
{
  objc_storeStrong((id *)&self->_metadataPreCachedOptions, a3);
}

- (TUCallHistoryControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_metadataPreCachedOptions, 0);
  objc_storeStrong((id *)&self->_thirdPartyCallProviders, 0);
  objc_storeStrong((id *)&self->_simpleIvarDispatcher, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_recentCalls, 0);
}

@end
