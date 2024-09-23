@implementation REDonatedActionStore

- (id)_init
{
  _QWORD *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  objc_super v23;
  id location[2];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)REDonatedActionStore;
  v2 = -[REObservableSingleton _init](&v23, sel__init);
  if (v2)
  {
    if (!CoreDuetLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)location = xmmword_24CF8D2E0;
      v25 = 0;
      CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (!CoreDuetLibraryCore_frameworkLibrary)
    {
      v14 = 0;
      goto LABEL_11;
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.RelevanceEngine.REDonationActionStore", v3);
    v5 = (void *)v2[3];
    v2[3] = v4;

    objc_initWeak(location, v2);
    v6 = v2[3];
    v7 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __29__REDonatedActionStore__init__block_invoke;
    v21[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v22, location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v6, v21, 0.1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v2[4];
    v2[4] = v8;

    v10 = v2[3];
    v16 = v7;
    v17 = 3221225472;
    v18 = __29__REDonatedActionStore__init__block_invoke_2;
    v19 = &unk_24CF8AAC8;
    objc_copyWeak(&v20, location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v10, &v16, 0.1);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v2[5];
    v2[5] = v11;

    v13 = (void *)CFPreferencesCopyAppValue(CFSTR("REQueryVersionKey"), CFSTR("com.apple.RelevanceEngine"));
    if (!v13 || (objc_msgSend(&unk_24CFC11C8, "isEqual:", v13, v16, v17, v18, v19) & 1) == 0)
    {
      CFPreferencesSetAppValue(CFSTR("LastDonateQueryEndDate"), 0, CFSTR("com.apple.RelevanceEngine"));
      CFPreferencesSetAppValue(CFSTR("LastDeleteQueryEndDate"), 0, CFSTR("com.apple.RelevanceEngine"));
      CFPreferencesSetAppValue(CFSTR("REQueryVersionKey"), &unk_24CFC11C8, CFSTR("com.apple.RelevanceEngine"));
    }
    *((_BYTE *)v2 + 17) = 0;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }
  v14 = v2;
LABEL_11:

  return v14;
}

void __29__REDonatedActionStore__init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_distributeRecentDonatedActions");

}

void __29__REDonatedActionStore__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_distributeRecentDeletedActions");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)REDonatedActionStore;
  -[REDonatedActionStore dealloc](&v5, sel_dealloc);
}

- (id)callbackQueue
{
  return self->_queue;
}

- (void)start
{
  NSObject *v3;
  id v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  RELogForDomain(14);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_DEFAULT, "Starting %{public}@.", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__REDonatedActionStore_start__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
  -[REDonatedActionStore _subscribeToNotifications](self, "_subscribeToNotifications");
}

uint64_t __29__REDonatedActionStore_start__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;
  NSObject *v4;
  uint8_t v5[16];

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[17] || (result = objc_msgSend(v2, "_shouldLimitQueries"), (result & 1) == 0))
  {
    RELogForDomain(14);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2132F7000, v4, OS_LOG_TYPE_DEFAULT, "Synchronize all donated actions.", v5, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_queue_distributeAllDonatedActions");
  }
  return result;
}

- (void)fetchDonationWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  if (v5)
  {
    v6 = a3;
    +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queryForDuetEventWithIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__REDonatedActionStore_fetchDonationWithIdentifier_completion___block_invoke;
    v10[3] = &unk_24CF8D138;
    v11 = v5;
    objc_msgSend(v9, "executeQuery:responseQueue:completion:", v8, MEMORY[0x24BDAC9B8], v10);

  }
}

void __63__REDonatedActionStore_fetchDonationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  REDonatedAction *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)get_DKEventClass_softClass;
  v12 = get_DKEventClass_softClass;
  if (!get_DKEventClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __get_DKEventClass_block_invoke;
    v8[3] = &unk_24CF8AC38;
    v8[4] = &v9;
    __get_DKEventClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v3;
    v7 = -[REDonatedAction initWithEvent:filtered:]([REDonatedAction alloc], "initWithEvent:filtered:", v6, 1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_26);

}

- (void)synchronizeDonationsIfNecessary
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__REDonatedActionStore_synchronizeDonationsIfNecessary__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__REDonatedActionStore_synchronizeDonationsIfNecessary__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 17))
  {
    v1 = result;
    RELogForDomain(14);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_DEFAULT, "Asked by model to synchronize all donated actions.", v3, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 32), "_queue_distributeAllDonatedActions");
  }
  return result;
}

- (void)triggerDistributeAllDonatedActions:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__REDonatedActionStore_triggerDistributeAllDonatedActions___block_invoke;
  v4[3] = &unk_24CF8B678;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

uint64_t __59__REDonatedActionStore_triggerDistributeAllDonatedActions___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  if (*(_BYTE *)(a1 + 40) || (result = objc_msgSend(*(id *)(a1 + 32), "_shouldLimitQueries"), (result & 1) == 0))
  {
    RELogForDomain(14);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_DEFAULT, "Trigger distribution all donated actions.", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_queue_distributeAllDonatedActions");
  }
  return result;
}

- (void)_subscribeToNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  _Unwind_Exception *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__notified_addDonatedActionsForInstalledApps_, CFSTR("REApplicationStateDidInstall"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__notified_removeDonatedActionsForUninstalledApps_, CFSTR("REApplicationStateDidUninstall"), 0);

  if (!REDeviceUnlockedSinceBoot())
  {
    self->_isMonitoringLockState = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__notified_removeThenDistributeAllActions_, CFSTR("REDeviceLockStateChangedNotification"), 0);

  }
  objc_msgSend(get_DKSystemEventStreamsClass(), "appIntentsStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  get_DKKnowledgeStorageDidInsertEventsNotification();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__notified_distributeRecentDonatedActions_, v9, v7);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  get_DKKnowledgeStorageDidTombstoneEventsNotification();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__notified_distributeRecentDeletedActions_, v11, v7);

  objc_msgSend(get_DKSystemEventStreamsClass(), "appActivityStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  get_DKKnowledgeStorageDidInsertEventsNotification();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__notified_distributeRecentDonatedActions_, v15, v13);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  get_DKKnowledgeStorageDidTombstoneEventsNotification();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v18 = (_QWORD *)get_DKTombstoneEligibleForPredictionIdentifierSymbolLoc_ptr;
  v33 = get_DKTombstoneEligibleForPredictionIdentifierSymbolLoc_ptr;
  if (!get_DKTombstoneEligibleForPredictionIdentifierSymbolLoc_ptr)
  {
    v19 = (void *)CoreDuetLibrary();
    v18 = dlsym(v19, "_DKTombstoneEligibleForPredictionIdentifier");
    v31[3] = (uint64_t)v18;
    get_DKTombstoneEligibleForPredictionIdentifierSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v30, 8);
  if (!v18)
  {
    -[RELemmaEnumerator init].cold.1();
    goto LABEL_11;
  }
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__notified_distributeRecentDeletedActions_, v17, *v18, v30);

  objc_msgSend(get_DKSystemEventStreamsClass(), "appRelevantShortcutsStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  get_DKKnowledgeStorageDidInsertEventsNotification();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:selector:name:object:", self, sel__notified_distributeRecentDonatedActions_, v23, v21);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  get_DKKnowledgeStorageDidTombstoneEventsNotification();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", self, sel__notified_distributeRecentDeletedActions_, v25, v21);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v27 = (_QWORD *)get_DKKnowledgeStorageDidAgeOutEventsNotificationSymbolLoc_ptr;
  v33 = get_DKKnowledgeStorageDidAgeOutEventsNotificationSymbolLoc_ptr;
  if (!get_DKKnowledgeStorageDidAgeOutEventsNotificationSymbolLoc_ptr)
  {
    v28 = (void *)CoreDuetLibrary();
    v27 = dlsym(v28, "_DKKnowledgeStorageDidAgeOutEventsNotification");
    v31[3] = (uint64_t)v27;
    get_DKKnowledgeStorageDidAgeOutEventsNotificationSymbolLoc_ptr = (uint64_t)v27;
  }
  _Block_object_dispose(&v30, 8);
  if (!v27)
  {
LABEL_11:
    v29 = (_Unwind_Exception *)-[RELemmaEnumerator init].cold.1();
    _Block_object_dispose(&v30, 8);
    _Unwind_Resume(v29);
  }
  objc_msgSend(v26, "addObserver:selector:name:object:", self, sel__notified_removeThenDistributeAllActions_, *v27, 0, v30);

  xpc_set_event_stream_handler("com.apple.distnoted.matching", 0, &__block_literal_global_23);
}

void __49__REDonatedActionStore__subscribeToNotifications__block_invoke(int a1, xpc_object_t xdict)
{
  const char *string;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF50]);
  RELogForDomain(14);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = string;
    _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_INFO, "coreduet notification received: %s", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)_shouldLimitQueries
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v9[16];

  if ((REIsSupergreenUsedInLastSevenDays() & 1) != 0)
  {
    v2 = (void *)CFPreferencesCopyAppValue(CFSTR("LastAttemptedQueryDate"), CFSTR("com.apple.RelevanceEngine"));
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", v2);
      v5 = v4;

      v6 = v5 < 3600.0;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    RELogForDomain(14);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2132F7000, v7, OS_LOG_TYPE_DEFAULT, "Siri Face has not been used in past seven days; restrict queries.",
        v9,
        2u);
    }

    return 1;
  }
  return v6;
}

- (void)_beginLoadingData
{
  -[REObservableSingleton enumerateObservers:](self, "enumerateObservers:", &__block_literal_global_26);
}

void __41__REDonatedActionStore__beginLoadingData__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "donationActionStoreWillBeginLoadingData");

}

- (void)_finishLoadingData:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  RELogForDomain(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "Finished loading data: %lu items.", (uint8_t *)&v6, 0xCu);
  }

  -[REObservableSingleton enumerateObservers:](self, "enumerateObservers:", &__block_literal_global_29);
}

void __43__REDonatedActionStore__finishLoadingData___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "donationActionStoreDidFinishLoadingData");

}

- (void)_queue_distributeAllDonatedActions
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "LastDonateQueryEndDate is in the future (%@). isNewDonation may be inaccurate.", a5, a6, a7, a8, 2u);
}

void __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[16];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBD1A8];
  v19 = v3;
  if (v3)
    v4 = v3;
  v5 = v4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", v19) == 2)
        {
          RELogForDomain(14);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke_cold_1((uint64_t)v27, (uint64_t)v11);

        }
        v21[0] = v9;
        v21[1] = 3221225472;
        v21[2] = __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke_32;
        v21[3] = &unk_24CF8D200;
        v21[4] = v11;
        v13 = *(void **)(a1 + 32);
        v22 = *(id *)(a1 + 40);
        objc_msgSend(v13, "enumerateObservers:", v21);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v5, "count", v19);
  objc_msgSend(v5, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localSaveDate");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v18 && (objc_msgSend(v18, "compare:", *(_QWORD *)(a1 + 40)) == 1 || !*(_QWORD *)(a1 + 40)))
    CFPreferencesSetAppValue(CFSTR("LastDonateQueryEndDate"), *(CFPropertyListRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("com.apple.RelevanceEngine"));
  dispatch_sync(MEMORY[0x24BDAC9B8], &__block_literal_global_26);

}

void __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke_32(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _BOOL8 v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "localSaveDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "compare:", *(_QWORD *)(a1 + 40)) == 1 || *(_QWORD *)(a1 + 40) == 0;
  objc_msgSend(v4, "donationActionStoreReceivedDonation:isNewDonation:", *(_QWORD *)(a1 + 32), v5);

}

- (void)_queue_distributeAllDonatedActionsWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, void *);
  void *v14;
  REDonatedActionStore *v15;
  id v16;
  uint64_t *v17;
  __int128 *p_buf;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RELogForDomain(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "Distributing all donated actions with identifier %{public}@.", (uint8_t *)&buf, 0xCu);
  }

  v6 = (void *)CFPreferencesCopyAppValue(CFSTR("LastDonateQueryEndDate"), CFSTR("com.apple.RelevanceEngine"));
  -[REDonatedActionStore _beginLoadingData](self, "_beginLoadingData");
  +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryForAllDonatedActionsWithIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__11;
  v26 = __Block_byref_object_dispose__11;
  v27 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __73__REDonatedActionStore__queue_distributeAllDonatedActionsWithIdentifier___block_invoke;
  v14 = &unk_24CF8D278;
  v15 = self;
  v17 = &v19;
  p_buf = &buf;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v9, "executeQuerySynchronouslyWithBatching:completion:", v8, &v11);

  -[REDonatedActionStore _finishLoadingData:](self, "_finishLoadingData:", v20[3], v11, v12, v13, v14, v15);
  CFPreferencesSetAppValue(CFSTR("LastAttemptedQueryDate"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDBCE60], "date"), CFSTR("com.apple.RelevanceEngine"));
  self->_synchronized = 1;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&buf, 8);

}

void __73__REDonatedActionStore__queue_distributeAllDonatedActionsWithIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBD1A8];
  v19 = v3;
  if (v3)
    v4 = v3;
  v5 = v4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v11, "type") == 2)
        {
          RELogForDomain(14);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke_cold_1((uint64_t)v25, (uint64_t)v11);

        }
        v13 = (void *)a1[4];
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __73__REDonatedActionStore__queue_distributeAllDonatedActionsWithIdentifier___block_invoke_33;
        v20[3] = &unk_24CF8D250;
        v20[4] = v11;
        objc_msgSend(v13, "enumerateObservers:", v20);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += objc_msgSend(v5, "count");
  objc_msgSend(v5, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localSaveDate");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1[7] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v18 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v18 && (objc_msgSend(v18, "compare:", a1[5]) == 1 || !a1[5]))
    CFPreferencesSetAppValue(CFSTR("LastDonateQueryEndDate"), *(CFPropertyListRef *)(*(_QWORD *)(a1[7] + 8) + 40), CFSTR("com.apple.RelevanceEngine"));
  dispatch_sync(MEMORY[0x24BDAC9B8], &__block_literal_global_26);

}

uint64_t __73__REDonatedActionStore__queue_distributeAllDonatedActionsWithIdentifier___block_invoke_33(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "donationActionStoreReceivedDonation:isNewDonation:", *(_QWORD *)(a1 + 32), 1);
}

- (void)_queue_distributeRecentDonatedActions
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (self->_synchronized)
  {
    RELogForDomain(14);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_DEFAULT, "Distributing recently donated actions.", buf, 2u);
    }

    v4 = (void *)CFPreferencesCopyAppValue(CFSTR("LastDonateQueryEndDate"), CFSTR("com.apple.RelevanceEngine"));
    if (isFutureDate(v4))
    {
      -[REDonatedActionStore _queue_distributeAllDonatedActions](self, "_queue_distributeAllDonatedActions");
    }
    else
    {
      -[REDonatedActionStore _beginLoadingData](self, "_beginLoadingData");
      +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "queryForDonatedActionsAfterDate:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      v15 = buf;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__11;
      v18 = __Block_byref_object_dispose__11;
      v19 = 0;
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 0;
      +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __61__REDonatedActionStore__queue_distributeRecentDonatedActions__block_invoke;
      v9[3] = &unk_24CF8D2A0;
      v9[4] = self;
      v9[5] = &v10;
      v9[6] = buf;
      objc_msgSend(v7, "executeQuerySynchronouslyWithBatching:completion:", v6, v9);

      v8 = (void *)*((_QWORD *)v15 + 5);
      if (v8)
      {
        if ((objc_msgSend(v8, "isEqualToDate:", v4) & 1) == 0)
          CFPreferencesSetAppValue(CFSTR("LastDonateQueryEndDate"), *((CFPropertyListRef *)v15 + 5), CFSTR("com.apple.RelevanceEngine"));
      }
      -[REDonatedActionStore _finishLoadingData:](self, "_finishLoadingData:", v11[3]);
      _Block_object_dispose(&v10, 8);
      _Block_object_dispose(buf, 8);

    }
  }
}

void __61__REDonatedActionStore__queue_distributeRecentDonatedActions__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = (void *)MEMORY[0x24BDBD1A8];
  if (v3)
    v5 = v3;
  v6 = v5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        v13 = (void *)a1[4];
        v18[0] = v10;
        v18[1] = 3221225472;
        v18[2] = __61__REDonatedActionStore__queue_distributeRecentDonatedActions__block_invoke_2;
        v18[3] = &unk_24CF8D250;
        v18[4] = v12;
        objc_msgSend(v13, "enumerateObservers:", v18);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v6, "count");
  objc_msgSend(v6, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localSaveDate");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1[6] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  dispatch_sync(MEMORY[0x24BDAC9B8], &__block_literal_global_26);
}

uint64_t __61__REDonatedActionStore__queue_distributeRecentDonatedActions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "donationActionStoreReceivedDonation:isNewDonation:", *(_QWORD *)(a1 + 32), 1);
}

- (void)_queue_distributeRecentDeletedActions
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "LastDeleteQueryEndDate is in the future (%@). Ignoring date.", a5, a6, a7, a8, 2u);
}

void __61__REDonatedActionStore__queue_distributeRecentDeletedActions__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = (void *)MEMORY[0x24BDBD1A8];
  if (v3)
    v5 = v3;
  v6 = v5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        v13 = (void *)a1[4];
        v18[0] = v10;
        v18[1] = 3221225472;
        v18[2] = __61__REDonatedActionStore__queue_distributeRecentDeletedActions__block_invoke_2;
        v18[3] = &unk_24CF8D250;
        v18[4] = v12;
        objc_msgSend(v13, "enumerateObservers:", v18);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v6, "count");
  objc_msgSend(v6, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("localSaveDate"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1[6] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  dispatch_sync(MEMORY[0x24BDAC9B8], &__block_literal_global_26);
}

void __61__REDonatedActionStore__queue_distributeRecentDeletedActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "donationActionStoreRemovedDonation:", *(_QWORD *)(a1 + 32));

}

- (void)_notified_distributeRecentDeletedActions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RELogForDomain(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received; distribute recently deleted actions.",
      (uint8_t *)&v7,
      0xCu);

  }
  -[REUpNextScheduler schedule](self->_deletionsScheduler, "schedule");

}

- (void)_notified_distributeRecentDonatedActions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RELogForDomain(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received; distribute recently donated actions.",
      (uint8_t *)&v7,
      0xCu);

  }
  -[REUpNextScheduler schedule](self->_donationsScheduler, "schedule");

}

- (void)_notified_addDonatedActionsForInstalledApps:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  REDonatedActionStore *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("REApplicationStateBundleIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  RELogForDomain(14);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_DEFAULT, "Add actions for installed bundle identifiers: %{public}@", buf, 0xCu);

  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__REDonatedActionStore__notified_addDonatedActionsForInstalledApps___block_invoke;
  v10[3] = &unk_24CF8AB18;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_async(queue, v10);

}

void __68__REDonatedActionStore__notified_addDonatedActionsForInstalledApps___block_invoke(uint64_t a1)
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

  v12 = *MEMORY[0x24BDAC8D0];
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
        objc_msgSend(*(id *)(a1 + 40), "_queue_distributeAllDonatedActionsWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_notified_removeDonatedActionsForUninstalledApps:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  REDonatedActionStore *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("REApplicationStateBundleIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  RELogForDomain(14);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_DEFAULT, "Remove actions for uninstalled bundle identifiers: %{public}@", buf, 0xCu);

  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__REDonatedActionStore__notified_removeDonatedActionsForUninstalledApps___block_invoke;
  v10[3] = &unk_24CF8AB18;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_async(queue, v10);

}

void __73__REDonatedActionStore__notified_removeDonatedActionsForUninstalledApps___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = *(void **)(a1 + 40);
        v10[0] = v6;
        v10[1] = 3221225472;
        v10[2] = __73__REDonatedActionStore__notified_removeDonatedActionsForUninstalledApps___block_invoke_2;
        v10[3] = &unk_24CF8D250;
        v10[4] = v8;
        objc_msgSend(v9, "enumerateObservers:", v10);
        objc_msgSend(*(id *)(a1 + 40), "_queue_distributeAllDonatedActionsWithIdentifier:", v8);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __73__REDonatedActionStore__notified_removeDonatedActionsForUninstalledApps___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "donationActionStoreRemovedDonationsFor:", *(_QWORD *)(a1 + 32));

}

- (void)_notified_removeThenDistributeAllActions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("REDeviceLockStateChangedNotification"), "isEqualToString:", v5);

  if (v6 && self->_isMonitoringLockState)
  {
    self->_isMonitoringLockState = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("REDeviceLockStateChangedNotification"), 0);

  }
  RELogForDomain(14);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    _os_log_impl(&dword_2132F7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ received; remove then distribute all actions.",
      buf,
      0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__REDonatedActionStore__notified_removeThenDistributeAllActions___block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);

}

uint64_t __65__REDonatedActionStore__notified_removeThenDistributeAllActions___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = REDeviceUnlockedSinceBoot();
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "enumerateObservers:", &__block_literal_global_40);
    return objc_msgSend(*(id *)(a1 + 32), "_queue_distributeAllDonatedActions");
  }
  return result;
}

void __65__REDonatedActionStore__notified_removeThenDistributeAllActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "donationActionStoreRemoveAllDonations");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletionsScheduler, 0);
  objc_storeStrong((id *)&self->_donationsScheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__REDonatedActionStore__queue_distributeAllDonatedActions__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(a1, a2), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_0_1(&dword_2132F7000, v5, v6, "Received relevant shortcut for %{public}@.");

  OUTLINED_FUNCTION_2_3();
}

@end
