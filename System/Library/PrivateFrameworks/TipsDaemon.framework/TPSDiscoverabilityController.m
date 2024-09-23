@implementation TPSDiscoverabilityController

- (void)setTipStatusController:(id)a3
{
  objc_storeStrong((id *)&self->_tipStatusController, a3);
}

+ (void)removeContextualInfoCache
{
  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", 0, CFSTR("DiscoverabilityDeliveryInfoMap"));
  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", 0, CFSTR("RegisteredDeliveryEventIdentifiers"));
  +[TPSEventsHistoryController removeEventHistoryCache](TPSEventsHistoryController, "removeEventHistoryCache");
}

+ (id)contextualInfoMap
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF400], "unarchivedObjectOfClasses:forKey:", v5, CFSTR("DiscoverabilityDeliveryInfoMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (TPSDiscoverabilityController)initWithTipStatusController:(id)a3
{
  id v5;
  TPSDiscoverabilityController *v6;
  TPSDiscoverabilityController *v7;
  uint64_t v8;
  TPSEventsProviderManager *eventsProviderManager;
  TPSEventsHistoryController *v10;
  TPSEventsHistoryController *eventsHistoryController;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *contextualInfoQueue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *eventRegistrationQueue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *eventResultsProcessingQueue;
  uint64_t v21;
  NSMutableDictionary *contextualInfoMap;
  TPSDiscoverabilityController *v23;
  uint64_t v24;
  NSMutableDictionary *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSMutableSet *registeredEventIdentifiers;
  uint64_t v31;
  NSMutableSet *v32;
  objc_super v34;

  v5 = a3;
  if (v5)
  {
    v34.receiver = self;
    v34.super_class = (Class)TPSDiscoverabilityController;
    v6 = -[TPSDiscoverabilityController init](&v34, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_tipStatusController, a3);
      objc_msgSend(MEMORY[0x1E0DBF3B8], "defaultManager");
      v8 = objc_claimAutoreleasedReturnValue();
      eventsProviderManager = v7->_eventsProviderManager;
      v7->_eventsProviderManager = (TPSEventsProviderManager *)v8;

      -[TPSEventsProviderManager setDelegate:](v7->_eventsProviderManager, "setDelegate:", v7);
      v10 = -[TPSEventsHistoryController initWithTipStatusController:]([TPSEventsHistoryController alloc], "initWithTipStatusController:", v5);
      eventsHistoryController = v7->_eventsHistoryController;
      v7->_eventsHistoryController = v10;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create("com.apple.tipsd.contextualInfoQueue", v12);
      contextualInfoQueue = v7->_contextualInfoQueue;
      v7->_contextualInfoQueue = (OS_dispatch_queue *)v13;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = dispatch_queue_create("com.apple.tipsd.eventRegistrationQueue", v15);
      eventRegistrationQueue = v7->_eventRegistrationQueue;
      v7->_eventRegistrationQueue = (OS_dispatch_queue *)v16;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = dispatch_queue_create("com.apple.tipsd.eventHistoryProcessingQueue", v18);
      eventResultsProcessingQueue = v7->_eventResultsProcessingQueue;
      v7->_eventResultsProcessingQueue = (OS_dispatch_queue *)v19;

      +[TPSDiscoverabilityController contextualInfoMap](TPSDiscoverabilityController, "contextualInfoMap");
      v21 = objc_claimAutoreleasedReturnValue();
      contextualInfoMap = v7->_contextualInfoMap;
      v7->_contextualInfoMap = (NSMutableDictionary *)v21;

      if (v7->_contextualInfoMap)
      {
        -[TPSDiscoverabilityController _cleanupContextualInfoMap](v7, "_cleanupContextualInfoMap");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v7->_contextualInfoMap;
        v7->_contextualInfoMap = (NSMutableDictionary *)v24;

      }
      v26 = (void *)MEMORY[0x1E0C99E60];
      v27 = objc_opt_class();
      objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DBF400], "unarchivedObjectOfClasses:forKey:", v28, CFSTR("RegisteredDeliveryEventIdentifiers"));
      v29 = objc_claimAutoreleasedReturnValue();
      registeredEventIdentifiers = v7->_registeredEventIdentifiers;
      v7->_registeredEventIdentifiers = (NSMutableSet *)v29;

      if (v7->_registeredEventIdentifiers)
      {
        -[TPSDiscoverabilityController _reconcileRegisteredEvents](v7, "_reconcileRegisteredEvents");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v7->_registeredEventIdentifiers;
        v7->_registeredEventIdentifiers = (NSMutableSet *)v31;

      }
      v7->_overrideHintMaxDisplayedCount = objc_msgSend(MEMORY[0x1E0DBF3A0], "discoverabilityOverrideMaxDisplayCount");

    }
    self = v7;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (TPSDiscoverabilityController)init
{

  return 0;
}

- (TPSEventsHistoryController)eventsHistoryController
{
  return self->_eventsHistoryController;
}

- (NSDictionary)contextualInfoMap
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  v12 = 0;
  -[TPSDiscoverabilityController contextualInfoQueue](self, "contextualInfoQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__TPSDiscoverabilityController_contextualInfoMap__block_invoke;
  v6[3] = &unk_1EA1DF8B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __49__TPSDiscoverabilityController_contextualInfoMap__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)contextualInfoIdentifiers
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  v12 = 0;
  -[TPSDiscoverabilityController contextualInfoQueue](self, "contextualInfoQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__TPSDiscoverabilityController_contextualInfoIdentifiers__block_invoke;
  v6[3] = &unk_1EA1DFEF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__TPSDiscoverabilityController_contextualInfoIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)updateIdentifier:(id)a3 withContextualInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[TPSDiscoverabilityController contextualInfoQueue](self, "contextualInfoQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__TPSDiscoverabilityController_updateIdentifier_withContextualInfo___block_invoke;
  v11[3] = &unk_1EA1E1140;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __68__TPSDiscoverabilityController_updateIdentifier_withContextualInfo___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained[5], "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)removeContextualInfoForIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[TPSDiscoverabilityController contextualInfoQueue](self, "contextualInfoQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__TPSDiscoverabilityController_removeContextualInfoForIdentifiers___block_invoke;
  block[3] = &unk_1EA1DFA48;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__TPSDiscoverabilityController_removeContextualInfoForIdentifiers___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[5], "removeObjectsForKeys:", *(_QWORD *)(a1 + 32));

}

- (void)removeAllContextualInfos
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[TPSDiscoverabilityController contextualInfoQueue](self, "contextualInfoQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__TPSDiscoverabilityController_removeAllContextualInfos__block_invoke;
  v4[3] = &unk_1EA1E1230;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__TPSDiscoverabilityController_removeAllContextualInfos__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[5], "removeAllObjects");

}

- (id)contextualInfoForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  v17 = 0;
  -[TPSDiscoverabilityController contextualInfoQueue](self, "contextualInfoQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TPSDiscoverabilityController_contextualInfoForIdentifier___block_invoke;
  block[3] = &unk_1EA1E0DE0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __60__TPSDiscoverabilityController_contextualInfoForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_cleanupContextualInfoMap
{
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  -[TPSDiscoverabilityController contextualInfoMap](self, "contextualInfoMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__17;
  v9 = __Block_byref_object_dispose__17;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke;
  v4[3] = &unk_1EA1E1428;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
  if (v6[5])
  {
    -[TPSDiscoverabilityController removeContextualInfoForIdentifiers:](self, "removeContextualInfoForIdentifiers:");
    -[TPSEventsHistoryController removeObserverIdentifiers:](self->_eventsHistoryController, "removeObserverIdentifiers:", v6[5]);
    -[TPSDiscoverabilityController _updateCacheData](self, "_updateCacheData");
  }
  _Block_object_dispose(&v5, 8);

}

void __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  if ((objc_msgSend(v4, "isPreconditionMatchedForIdentifier:", v3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_4();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 32), "restartTriggerTrackingIfNotDisplayedForIdentifier:", v3);
    v6 = 15;
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isContextualInfoLifetimeExpiredForIdentifier:", v3))
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);
    v6 = 18;
LABEL_17:
    objc_msgSend(v4, "lastDisplayContextForIdentifier:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 32);
    v13[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "markHintIneligibleForIdentifiers:context:reason:", v12, v10, v6);

    goto LABEL_18;
  }
  if (objc_msgSend(v4, "isHintMaxDurationExcceededForIdentifier:", v3))
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "updateHintDismissedForIdentifier:dismissType:context:", v3, *MEMORY[0x1E0DBF428], 0);
    v6 = 19;
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEligibilityTrackingNeedsRestartForIdentifier:", v3))
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_3();

    objc_msgSend(*(id *)(a1 + 32), "restartTriggerTrackingIfNotDisplayedForIdentifier:", v3);
    v6 = 17;
    goto LABEL_17;
  }
LABEL_18:

}

- (void)restartTriggerTrackingIfNotDisplayedForIdentifiers:(id)a3
{
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
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
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
        -[TPSDiscoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:updateCache:](self, "restartTriggerTrackingIfNotDisplayedForIdentifier:updateCache:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  -[TPSDiscoverabilityController _updateCacheData](self, "_updateCacheData");

}

- (void)restartTriggerTrackingIfNotDisplayedForIdentifier:(id)a3
{
  -[TPSDiscoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:updateCache:](self, "restartTriggerTrackingIfNotDisplayedForIdentifier:updateCache:", a3, 1);
}

- (void)restartTriggerTrackingIfNotDisplayedForIdentifier:(id)a3 updateCache:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((-[TPSTipStatusController isHintDisplayedForIdentifier:](self->_tipStatusController, "isHintDisplayedForIdentifier:", v6) & 1) == 0)
  {
    -[TPSTipStatusController hintWouldHaveBeenDisplayedDateForIdentifier:](self->_tipStatusController, "hintWouldHaveBeenDisplayedDateForIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      -[TPSTipStatusController dateForTriggerRestartTrackingForIdentifier:](self->_tipStatusController, "dateForTriggerRestartTrackingForIdentifier:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[TPSTipStatusController updateHintEligibleDateForIdentifier:value:](self->_tipStatusController, "updateHintEligibleDateForIdentifier:value:", v6, 0);
        -[TPSTipStatusController removeUserInfoForIdentifier:](self->_tipStatusController, "removeUserInfoForIdentifier:", v6);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dateByAddingTimeInterval:", fabs(-180.0));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[TPSTipStatusController updateDateForTriggerRestartTrackingForIdentifier:date:](self->_tipStatusController, "updateDateForTriggerRestartTrackingForIdentifier:date:", v6, v10);
        -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "restartTriggerTracking");
        objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138412546;
          v14 = v6;
          v15 = 2112;
          v16 = v10;
          _os_log_impl(&dword_1DAC2F000, v12, OS_LOG_TYPE_DEFAULT, "Restart trigger tracking for %@ on %@", (uint8_t *)&v13, 0x16u);
        }

        if (v4)
          -[TPSDiscoverabilityController _updateCacheData](self, "_updateCacheData");

      }
    }
  }

}

- (void)contextualEligibilityWithTipIdentifiers:(id)a3 tipsDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 experimentCampChangesToAll:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _UNKNOWN **v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  _BOOL4 v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  TPSEventsHistoryController *eventsHistoryController;
  void *v35;
  TPSEventsHistoryController *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id *v44;
  id *v45;
  id v46;
  TPSDiscoverabilityController *v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  char v61;
  void *v62;
  id obj;
  TPSTipStatusController **p_tipStatusController;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  _BYTE v78[10];
  uint64_t v79;
  _BYTE v80[128];
  uint64_t v81;

  v6 = a6;
  v81 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v66 = a5;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAC2F000, v12, OS_LOG_TYPE_DEFAULT, "process tip delivery json", buf, 2u);
  }

  -[TPSDiscoverabilityController _cleanupContextualInfoMap](self, "_cleanupContextualInfoMap");
  if (v10)
  {
    v13 = (void *)MEMORY[0x1E0C99E20];
    p_tipStatusController = &self->_tipStatusController;
    -[TPSTipStatusController reenrollPreconditionChangeContent](self->_tipStatusController, "reenrollPreconditionChangeContent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithSet:", v14);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[TPSTipStatusController reenrollHoldoutContent](*p_tipStatusController, "reenrollHoldoutContent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "unionSet:", v15);

    }
    objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[TPSDiscoverabilityController contextualEligibilityWithTipIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:experimentCampChangesToAll:].cold.1((id *)p_tipStatusController, v16);

    -[TPSTipStatusController tipStatusMap](*p_tipStatusController, "tipStatusMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_9);

    v18 = objc_msgSend(v10, "count");
    if (v18)
    {
      v19 = v18;
      v20 = (void *)MEMORY[0x1E0C99E20];
      -[TPSDiscoverabilityController contextualInfoIdentifiers](self, "contextualInfoIdentifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v21);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v19);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v19);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v57 = v10;
      obj = v10;
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      if (!v67)
      {
        v61 = 0;
        goto LABEL_78;
      }
      v61 = 0;
      v65 = *(_QWORD *)v72;
      v22 = &off_1EA1DE000;
      v60 = v11;
      while (1)
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v72 != v65)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v23);
          v25 = v22[332];
          objc_msgSend(v11, "objectForKeyedSubscript:", v24, v56);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "contentDictionaryWithTipDeliveryInfoId:deliveryInfoMap:", v26, v66);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            v28 = -[TPSTipStatusController isTriggerTrackingEligibleForIdentifier:](*p_tipStatusController, "isTriggerTrackingEligibleForIdentifier:", v24);
            v29 = -[TPSTipStatusController isDesiredOutcomeTrackingEligibleForIdentifier:](*p_tipStatusController, "isDesiredOutcomeTrackingEligibleForIdentifier:", v24);
            if ((v28 & 1) != 0)
              goto LABEL_20;
          }
          else
          {
            v28 = 0;
            v29 = 0;
          }
          if (!v29)
          {
            v30 = 0;
            v31 = 0;
            goto LABEL_68;
          }
LABEL_20:
          -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", v24);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[TPSTipStatusController dateForTriggerRestartTrackingForIdentifier:](self->_tipStatusController, "dateForTriggerRestartTrackingForIdentifier:", v24);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v33;
          if (v32)
          {
            if (!objc_msgSend(v32, "hasChangesFromDictionary:", v27))
            {
              if (v33 || objc_msgSend(v59, "containsObject:", v24))
                goto LABEL_34;
              goto LABEL_32;
            }
            eventsHistoryController = self->_eventsHistoryController;
            v79 = v24;
            v61 = 1;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = eventsHistoryController;
            v33 = v68;
            -[TPSEventsHistoryController removeObserverIdentifiers:](v36, "removeObserverIdentifiers:", v35);

            v22 = &off_1EA1DE000;
            -[TPSDiscoverabilityController updateIdentifier:withContextualInfo:](self, "updateIdentifier:withContextualInfo:", v24, 0);
          }
          v37 = (void *)objc_msgSend(objc_alloc((Class)v22[332]), "initWithDictionary:", v27);

          if (v37)
          {
            objc_msgSend(v37, "displayBundleIDs");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v38, "count"))
            {

LABEL_33:
              v32 = v37;
              v22 = &off_1EA1DE000;
              v33 = v68;
LABEL_34:
              if (v28)
              {
                objc_msgSend(v32, "triggerCondition");
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                if (v40)
                {
                  v28 = 1;
                }
                else
                {
                  -[TPSTipStatusController hintEligibleDateForIdentifier:](*p_tipStatusController, "hintEligibleDateForIdentifier:", v24);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v41)
                    objc_msgSend(v58, "addObject:", v24);
                  v28 = 0;
                }
                v33 = v68;
              }
              if (v29)
              {
                objc_msgSend(v32, "desiredOutcomeCondition");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v42 != 0;

              }
              v43 = v22[332];
              if (v28)
                v44 = &v70;
              else
                v44 = 0;
              if (v28)
                v70 = 0;
              if (v29)
                v45 = &v69;
              else
                v45 = 0;
              if (v29)
                v69 = 0;
              objc_msgSend(v43, "eventsInfoArrayForContextualInfoDictionary:triggerEvents:desiredOutcomeEvents:", v27, v44, v45);
              if (v28)
                v46 = v70;
              else
                v46 = 0;
              v47 = self;
              if (v29)
                v48 = v69;
              else
                v48 = 0;
              if (objc_msgSend(v46, "count") || objc_msgSend(v48, "count"))
              {
                if (v33)
                {
                  -[TPSTipStatusController updateHintInelgibileForIdentifier:value:](*p_tipStatusController, "updateHintInelgibileForIdentifier:value:", v24, 0);
                  -[TPSTipStatusController updateDateForTriggerRestartTrackingForIdentifier:date:](*p_tipStatusController, "updateDateForTriggerRestartTrackingForIdentifier:date:", v24, 0);
                  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
                  v49 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v76 = v24;
                    v77 = 2112;
                    *(_QWORD *)v78 = v68;
                    _os_log_debug_impl(&dword_1DAC2F000, v49, OS_LOG_TYPE_DEBUG, "Restarted trigger tracking for %@ on %@", buf, 0x16u);
                  }

                }
                -[TPSDiscoverabilityController updateIdentifier:withContextualInfo:](v47, "updateIdentifier:withContextualInfo:", v24, v32);
                v33 = v68;
                -[TPSEventsHistoryController addEventsFromTriggerEvents:desiredOutcomeEvents:contentIdentifier:eventSinceDate:](v47->_eventsHistoryController, "addEventsFromTriggerEvents:desiredOutcomeEvents:contentIdentifier:eventSinceDate:", v46, v48, v24, v68);
                objc_msgSend(v62, "addObject:", v24);
                v61 = 1;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
                v51 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v76 = v24;
                  _os_log_impl(&dword_1DAC2F000, v51, OS_LOG_TYPE_DEFAULT, "Tips %@ eligible for tracking but not events found in delivery info", buf, 0xCu);
                }

                v33 = v68;
              }

              self = v47;
              v11 = v60;
              v22 = &off_1EA1DE000;
              goto LABEL_67;
            }
            v39 = -[TPSTipStatusController displayTypeForIdentifier:](*p_tipStatusController, "displayTypeForIdentifier:", v24);

            if (v39 != 2)
              goto LABEL_33;

            v32 = 0;
            v22 = &off_1EA1DE000;
            v33 = v68;
          }
          else
          {
            v32 = 0;
            v22 = &off_1EA1DE000;
          }
LABEL_32:
          objc_msgSend(v62, "addObject:", v24);
LABEL_67:

          v30 = v29 != 0;
          v31 = v28 != 0;
LABEL_68:
          objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v76 = v24;
            v77 = 1024;
            *(_DWORD *)v78 = v31;
            *(_WORD *)&v78[4] = 1024;
            *(_DWORD *)&v78[6] = v30;
            _os_log_impl(&dword_1DAC2F000, v50, OS_LOG_TYPE_DEFAULT, "Tips %@ is eligible for trigger tracking: %d, desired outcome tracking: %d", buf, 0x18u);
          }

          ++v23;
        }
        while (v67 != v23);
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
        v67 = v52;
        if (!v52)
        {
LABEL_78:

          v53 = v56;
          objc_msgSend(v56, "minusSet:", v62);
          v54 = v61;
          if (objc_msgSend(v56, "count"))
          {
            objc_msgSend(v56, "allObjects");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPSEventsHistoryController removeObserverIdentifiers:](self->_eventsHistoryController, "removeObserverIdentifiers:", v55);
            -[TPSDiscoverabilityController removeContextualInfoForIdentifiers:](self, "removeContextualInfoForIdentifiers:", v55);

            v54 = 1;
          }
          v10 = v57;
          if (objc_msgSend(v58, "count", v56))
            -[TPSDiscoverabilityController _updateTriggerConditionForObserverIdentifiers:](self, "_updateTriggerConditionForObserverIdentifiers:", v58);
          if ((v54 & 1) != 0)
            -[TPSDiscoverabilityController _updateCacheData](self, "_updateCacheData");

          break;
        }
      }
    }

  }
  -[TPSDiscoverabilityController queryCurrentEvents](self, "queryCurrentEvents");

}

void __135__TPSDiscoverabilityController_contextualEligibilityWithTipIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_experimentCampChangesToAll___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __135__TPSDiscoverabilityController_contextualEligibilityWithTipIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_experimentCampChangesToAll___block_invoke_cold_1((uint64_t)v4, v5);

}

- (void)queryCurrentEvents
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  TPSDiscoverabilityController *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[TPSEventsHistoryController contextualEventsBySourceMap](self->_eventsHistoryController, "contextualEventsBySourceMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1DAC2F000, v4, OS_LOG_TYPE_DEFAULT, "Query events: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(eventSinceDate = nil) || (eventSinceDate <= %@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__TPSDiscoverabilityController_queryCurrentEvents__block_invoke;
  v10[3] = &unk_1EA1E1490;
  v11 = v8;
  v12 = self;
  v9 = v8;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __50__TPSDiscoverabilityController_queryCurrentEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a2;
  objc_msgSend(a3, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __50__TPSDiscoverabilityController_queryCurrentEvents__block_invoke_cold_1((uint64_t)v5, v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "queryEvents:type:", v6, (int)objc_msgSend(v5, "intValue"));
}

- (void)processEventProviderQueryResults:(id)a3 type:(int64_t)a4
{
  TPSEventsHistoryController *eventsHistoryController;
  _QWORD v5[5];

  eventsHistoryController = self->_eventsHistoryController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke;
  v5[3] = &unk_1EA1E14E0;
  v5[4] = self;
  -[TPSEventsHistoryController processEventProviderQueryResults:completionHandler:](eventsHistoryController, "processEventProviderQueryResults:completionHandler:", a3, v5);
}

void __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "markHintIneligibleForIdentifiers:context:reason:", v6, 0, 16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObserverIdentifiers:", v6);
    objc_msgSend(*(id *)(a1 + 32), "removeContextualInfoForIdentifiers:", v6);
  }
  if (objc_msgSend(v5, "count"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke_2;
    v15[3] = &unk_1EA1E14B8;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke_3;
    v14[3] = &unk_1EA1E14B8;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "updateDesiredOutcomeConditionForObserverIdentifers:", v10);
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(*(id *)(a1 + 32), "_updateTriggerConditionForObserverIdentifiers:", v12);

    if ((v11 & 1) != 0 || (v13 & 1) != 0)
      goto LABEL_7;
  }
  if (objc_msgSend(v6, "count"))
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "_updateCacheData");

}

uint64_t __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isDesiredOutcomeTrackingEligibleForIdentifier:", a2);
}

uint64_t __70__TPSDiscoverabilityController_processEventProviderQueryResults_type___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isTriggerTrackingEligibleForIdentifier:", a2);
}

- (void)_updateCacheData
{
  -[TPSDiscoverabilityController _updateContextualInfoMapCache](self, "_updateContextualInfoMapCache");
  -[TPSTipStatusController updateCacheData](self->_tipStatusController, "updateCacheData");
  -[TPSEventsHistoryController updateCacheData](self->_eventsHistoryController, "updateCacheData");
}

- (void)_removeCacheData
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DAC2F000, log, OS_LOG_TYPE_DEBUG, "Remove TPSDiscoverabilityController cache.", v1, 2u);
}

- (void)_updateRegisteredEventIdentifiers
{
  TPSDiscoverabilityController *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", obj->_registeredEventIdentifiers, CFSTR("RegisteredDeliveryEventIdentifiers"));
  objc_sync_exit(obj);

}

- (void)_updateContextualInfoMapCache
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[TPSDiscoverabilityController contextualInfoQueue](self, "contextualInfoQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__TPSDiscoverabilityController__updateContextualInfoMapCache__block_invoke;
  v4[3] = &unk_1EA1E1230;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__TPSDiscoverabilityController__updateContextualInfoMapCache__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", WeakRetained[5], CFSTR("DiscoverabilityDeliveryInfoMap"));

}

- (BOOL)isContextualInfoExistForIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isContentHintDisplayMaxDisplayedCountExceededForIdentifier:(id)a3
{
  id v4;
  int v5;
  int64_t overrideHintMaxDisplayedCount;
  void *v7;
  BOOL v9;

  v4 = a3;
  v5 = -[TPSTipStatusController hintDisplayedCountForIdentifier:](self->_tipStatusController, "hintDisplayedCountForIdentifier:", v4);
  overrideHintMaxDisplayedCount = self->_overrideHintMaxDisplayedCount;
  if ((unint64_t)(overrideHintMaxDisplayedCount - 1) >= 0x7FFFFFFFFFFFFFFELL)
  {
    -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    overrideHintMaxDisplayedCount = objc_msgSend(v7, "displayMaxCount");

  }
  v9 = overrideHintMaxDisplayedCount != 0x7FFFFFFFFFFFFFFFLL && overrideHintMaxDisplayedCount <= v5;

  return v9;
}

- (void)markHintIneligibleForIdentifiers:(id)a3 context:(id)a4 reason:(int64_t)a5
{
  -[TPSDiscoverabilityController markHintIneligibleForIdentifiers:bundleID:context:reason:](self, "markHintIneligibleForIdentifiers:bundleID:context:reason:", a3, 0, a4, a5);
}

- (void)markHintIneligibleForIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id obj;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0DBF2B8], "ineligibleReasonStringForReason:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v10;
    v34 = 2112;
    v35 = v14;
    _os_log_impl(&dword_1DAC2F000, v13, OS_LOG_TYPE_DEFAULT, "Marking content as ineligible for content identifiers: %@. Ineligible reason: %@", buf, 0x16u);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v10;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[TPSTipStatusController displayTypeForIdentifier:](self->_tipStatusController, "displayTypeForIdentifier:", v16);
        if (!v12)
        {
          -[TPSTipStatusController lastDisplayContextForIdentifier:](self->_tipStatusController, "lastDisplayContextForIdentifier:", v16);
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = (void *)MEMORY[0x1E0DBF2C8];
        -[TPSTipStatusController correlationIdentifierForIdentifier:](self->_tipStatusController, "correlationIdentifierForIdentifier:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v11;
        if (!v11)
        {
          objc_msgSend(v17, "displayBundleID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v24;
        }
        objc_msgSend(v19, "eventWithTipID:correlationID:bundleID:context:displayType:reason:date:", v16, v20, v21, v12, v18, a6, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "log");

        if (!v11)
        -[TPSTipStatusController updateHintInelgibileForIdentifier:value:](self->_tipStatusController, "updateHintInelgibileForIdentifier:value:", v16, a6);

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v26);
  }

  -[TPSTipStatusController updateCacheData](self->_tipStatusController, "updateCacheData");
}

- (id)discoverabilityTipWithMetadata:(id)a3 contentDictionary:(id)a4 preconditions:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x1E0DBF3A8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithDictionary:metadata:", v9, v10);

  objc_msgSend(v11, "setPreconditions:", v8);
  return v11;
}

- (BOOL)updateDesiredOutcomeConditionForObserverIdentifers:(id)a3
{
  TPSDiscoverabilityController *v3;
  void *v4;
  _QWORD v6[5];
  char v7;

  v3 = self;
  v7 = 0;
  -[TPSDiscoverabilityController _matchingIdentifiersForConditionWithType:forObserverIdentifiers:hasUpdates:](self, "_matchingIdentifiersForConditionWithType:forObserverIdentifiers:hasUpdates:", 1, a3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__TPSDiscoverabilityController_updateDesiredOutcomeConditionForObserverIdentifers___block_invoke;
  v6[3] = &unk_1EA1E1508;
  v6[4] = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  LOBYTE(v3) = v7;

  return (char)v3;
}

void __83__TPSDiscoverabilityController_updateDesiredOutcomeConditionForObserverIdentifers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
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
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v5;
    _os_log_impl(&dword_1DAC2F000, v7, OS_LOG_TYPE_DEFAULT, "Desired outcome condition met for %@", buf, 0xCu);
  }

  objc_msgSend(v6, "desiredOutcomeCondition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(v8, "matchedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addDesiredOutcomePerformedDateForIdentifier:date:", v5, v10);

  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isHintDisplayedForIdentifier:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "hintWouldHaveBeenDisplayedDateForIdentifier:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "contentViewedDateForIdentifier:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v11 & 1) != 0 || v12 || v13)
  {
    objc_msgSend(v8, "eventIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dateByAddingTimeInterval:", --180.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "restartTrackingForEventIdentifiers:date:", v19, v21);
    objc_msgSend(v6, "restartDesiredOutcomeTracking");

  }
  else
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isHintInelgibileForIdentifier:", v5) & 1) == 0)
    {
      v14 = *(void **)(a1 + 32);
      v24 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "markHintIneligibleForIdentifiers:context:reason:", v15, 0, 12);

    }
    v16 = *(void **)(a1 + 32);
    v23 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeContextualInfoForIdentifiers:", v17);

    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v22 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObserverIdentifiers:", v19);
  }

}

- (BOOL)_updateTriggerConditionForObserverIdentifiers:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  BOOL v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  -[TPSDiscoverabilityController _matchingIdentifiersForConditionWithType:forObserverIdentifiers:hasUpdates:](self, "_matchingIdentifiersForConditionWithType:forObserverIdentifiers:hasUpdates:", 0, a3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "allValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1DAC2F000, v5, OS_LOG_TYPE_DEFAULT, "Trigger condition met for tips %@", buf, 0xCu);

    }
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__TPSDiscoverabilityController__updateTriggerConditionForObserverIdentifiers___block_invoke;
    v13[3] = &unk_1EA1E1530;
    v13[4] = self;
    v9 = v4;
    v14 = v9;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __78__TPSDiscoverabilityController__updateTriggerConditionForObserverIdentifiers___block_invoke_2;
    v12[3] = &unk_1EA1E1508;
    v12[4] = self;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
  v10 = v15;

  return v10;
}

void __78__TPSDiscoverabilityController__updateTriggerConditionForObserverIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "triggerEventIdentifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserverIdentifiers:fromEventIdentifiers:", v6, v7);

  }
}

void __78__TPSDiscoverabilityController__updateTriggerConditionForObserverIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v7 = objc_msgSend(v6, "displayTypeForIdentifier:", v16);
  v8 = objc_msgSend(v6, "usageFlagsForIdentifier:", v16);
  if (v7 == 2)
  {
    v9 = v8;
    v10 = (void *)MEMORY[0x1E0DBF2C0];
    objc_msgSend(v5, "displayBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eligibleContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerCondition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "matchedDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventWithContentID:bundleID:eligibleContext:displayType:usageFlags:date:", v16, v11, v12, 2, v9, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "log");

    objc_msgSend(*(id *)(a1 + 32), "_registerWakingCallbackForContextualInfo:", v5);
  }
  objc_msgSend(v6, "updateHintEligibleDateForIdentifier:value:", v16, 1);

}

- (id)_matchingIdentifiersForConditionWithType:(unint64_t)a3 forObserverIdentifiers:(id)a4 hasUpdates:(BOOL *)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v10)
    goto LABEL_19;
  v11 = v10;
  v12 = *(_QWORD *)v24;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13);
      -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "conditionForType:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v16)
      {
        if (a3)
          goto LABEL_14;
LABEL_13:
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);
        goto LABEL_14;
      }
      objc_msgSend(v16, "matchedDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {

        goto LABEL_14;
      }
      if (-[TPSDiscoverabilityController _isConditionMet:hasUpdates:forIdentifier:](self, "_isConditionMet:hasUpdates:forIdentifier:", v17, a5, v14))
      {
        goto LABEL_13;
      }
LABEL_14:

      ++v13;
    }
    while (v11 != v13);
    v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v11 = v19;
  }
  while (v19);
LABEL_19:

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)_isConditionMet:(id)a3 hasUpdates:(BOOL *)a4 forIdentifier:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  BOOL v37;
  BOOL v38;
  void *v39;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v48;
  id obj;
  void *v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v42 = a5;
  objc_msgSend(v7, "rules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v7;
  v9 = objc_msgSend(v7, "joinType");
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v58;
    v43 = *(_QWORD *)v58;
    v44 = v9;
    while (2)
    {
      v15 = 0;
      v45 = v11;
      do
      {
        if (*(_QWORD *)v58 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v15);
        objc_msgSend(v16, "matchedDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = v17;

          ++v13;
          v12 = v18;
          if (v9 == 1)
            goto LABEL_37;
        }
        else
        {
          v51 = v12;
          v52 = v13;
          v46 = v16;
          objc_msgSend(v16, "eventIdentifiers");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[TPSEventsHistoryController contextualEventsForIdentifiers:](self->_eventsHistoryController, "contextualEventsForIdentifiers:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          if (v21)
          {
            v22 = v21;
            v23 = 0;
            v24 = 0;
            v25 = *(_QWORD *)v54;
            while (2)
            {
              v26 = 0;
              v48 = v23 + v22;
              do
              {
                if (*(_QWORD *)v54 != v25)
                  objc_enumerationMutation(v20);
                objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v26), "matchedDate");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v27)
                {
                  v30 = v23 + v26;
                  goto LABEL_23;
                }
                v28 = v27;
                if (!v24 || objc_msgSend(v27, "compare:", v24) == 1)
                {
                  v29 = v28;

                  v24 = v29;
                }
                *a4 = 1;

                ++v26;
              }
              while (v22 != v26);
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
              v30 = v48;
              v23 = v48;
              if (v22)
                continue;
              break;
            }
          }
          else
          {
            v30 = 0;
            v24 = 0;
          }
LABEL_23:

          if (v30 == objc_msgSend(v20, "count") && objc_msgSend(v50, "count") == v30)
          {
            objc_msgSend(v46, "setMatchedDate:", v24);
            v31 = (void *)MEMORY[0x1E0DBF2E8];
            -[TPSTipStatusController correlationIdentifierForIdentifier:](self->_tipStatusController, "correlationIdentifierForIdentifier:", v42);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "eventWithTipID:correlationID:ruleID:", v42, v32, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "log");

            v12 = v51;
            if (!v51 || objc_msgSend(v24, "compare:", v51) == 1)
            {
              v35 = v24;

              v12 = v35;
            }
            v9 = v44;
            v13 = v52 + 1;
            if (v44 == 1)
            {
LABEL_36:

              v18 = v12;
              goto LABEL_37;
            }
          }
          else
          {
            v9 = v44;
            v12 = v51;
            v13 = v52;
            if (!v44)
              goto LABEL_36;
          }

          v14 = v43;
          v11 = v45;
        }
        ++v15;
      }
      while (v15 != v11);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      v18 = v12;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v18 = 0;
    v13 = 0;
  }
LABEL_37:

  v36 = objc_msgSend(obj, "count");
  if (v9 == 1 && v13 || (v13 == v36 ? (v37 = v9 == 0) : (v37 = 0), v37 || !v36))
  {
    v39 = v41;
    objc_msgSend(v41, "setMatchedDate:", v18);
    v38 = 1;
  }
  else
  {
    v38 = 0;
    v39 = v41;
  }

  return v38;
}

- (id)monitoringEventsForContentID:(id)a3
{
  void *v3;
  void *v4;

  -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "monitoringEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_registerWakingCallbackForContextualInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *eventRegistrationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;

  objc_msgSend(a3, "monitoringEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "desiredOutcomeEventMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "na_filter:", &__block_literal_global_35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[TPSEventsProviderManager registerWakingCallbackForEvents:type:clientIdentifier:](self->_eventsProviderManager, "registerWakingCallbackForEvents:type:clientIdentifier:", v6, 0, CFSTR("com.apple.tipsd"));
    objc_msgSend(v6, "valueForKeyPath:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    eventRegistrationQueue = self->_eventRegistrationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__TPSDiscoverabilityController__registerWakingCallbackForContextualInfo___block_invoke_2;
    block[3] = &unk_1EA1E0728;
    block[4] = self;
    v12 = v7;
    v9 = v7;
    dispatch_sync(eventRegistrationQueue, block);

  }
}

BOOL __73__TPSDiscoverabilityController__registerWakingCallbackForContextualInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "type"))
    v3 = objc_msgSend(v2, "type") == 3;
  else
    v3 = 1;

  return v3;
}

uint64_t __73__TPSDiscoverabilityController__registerWakingCallbackForContextualInfo___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateRegisteredEventIdentifiers");
}

- (void)_reconcileRegisteredEvents
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DAC2F000, v0, v1, "Re-registering notification for duet events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (int64_t)customizationIDForContentID:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "customizationID");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (void)updateContentViewedForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DAC2F000, v5, OS_LOG_TYPE_DEFAULT, "update content viewed for %@", (uint8_t *)&v6, 0xCu);
  }

  -[TPSTipStatusController updateContentViewedForIdentifier:value:](self->_tipStatusController, "updateContentViewedForIdentifier:value:", v4, 1);
  -[TPSTipStatusController updateCacheData](self->_tipStatusController, "updateCacheData");

}

- (void)addHintDisplayedForIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1DAC2F000, v8, OS_LOG_TYPE_DEFAULT, "update hint displayed for %@, context %@", buf, 0x16u);
  }

  -[TPSTipStatusController addHintDisplayedForIdentifier:context:](self->_tipStatusController, "addHintDisplayedForIdentifier:context:", v6, v7);
  -[TPSTipStatusController updateCacheData](self->_tipStatusController, "updateCacheData");
  -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "currentExperimentWithDiscoverabilityController:", self);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[TPSTipStatusController displayTypeForIdentifier:](self->_tipStatusController, "displayTypeForIdentifier:", v6);
    v12 = -[TPSTipStatusController usageFlagsForIdentifier:](self->_tipStatusController, "usageFlagsForIdentifier:", v6);
    v13 = -[TPSTipStatusController isOverrideHoldoutForIdentifier:](self->_tipStatusController, "isOverrideHoldoutForIdentifier:", v6);
    if (v11 == 2)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBF348], "clientBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)MEMORY[0x1E0DBF2F8];
    -[TPSTipStatusController correlationIdentifierForIdentifier:](self->_tipStatusController, "correlationIdentifierForIdentifier:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayBundleID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = v14;
    LOBYTE(v21) = v13;
    objc_msgSend(v15, "eventWithTipID:correlationID:bundleID:context:displayType:usageFlags:experiment:overrideHoldout:date:", v6, v16, v19, v7, v11, v12, v22, v21, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "log");

  }
}

- (void)updateHintWouldHaveBeenDisplayedForIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_1DAC2F000, v8, OS_LOG_TYPE_DEFAULT, "update hint would have been displayed for %@, context %@", buf, 0x16u);
  }

  -[TPSTipStatusController updateHintWouldHaveBeenDisplayedDateForIdentifier:value:](self->_tipStatusController, "updateHintWouldHaveBeenDisplayedDateForIdentifier:value:", v6, 1);
  -[TPSTipStatusController updateCacheData](self->_tipStatusController, "updateCacheData");
  -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v23 = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "currentExperimentWithDiscoverabilityController:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[TPSTipStatusController displayTypeForIdentifier:](self->_tipStatusController, "displayTypeForIdentifier:", v6);
    v13 = -[TPSTipStatusController usageFlagsForIdentifier:](self->_tipStatusController, "usageFlagsForIdentifier:", v6);
    v14 = -[TPSTipStatusController isOverrideHoldoutForIdentifier:](self->_tipStatusController, "isOverrideHoldoutForIdentifier:", v6);
    if (v12 == 2)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBF348], "clientBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)MEMORY[0x1E0DBF2F8];
    -[TPSTipStatusController correlationIdentifierForIdentifier:](self->_tipStatusController, "correlationIdentifierForIdentifier:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayBundleID");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (void *)v18;
    else
      v20 = v15;
    LOBYTE(v22) = v14;
    v7 = v23;
    objc_msgSend(v16, "eventWithTipID:correlationID:bundleID:context:displayType:usageFlags:experiment:overrideHoldout:date:", v6, v17, v20, v23, v12, v13, v11, v22, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "log");

  }
}

- (void)updateHintDismissedForIdentifier:(id)a3 dismissType:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412546;
    v27 = v8;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1DAC2F000, v11, OS_LOG_TYPE_DEFAULT, "update hint dismissed for %@, context %@", (uint8_t *)&v26, 0x16u);
  }

  -[TPSTipStatusController updateHintDismissedForIdentifier:value:](self->_tipStatusController, "updateHintDismissedForIdentifier:value:", v8, 1);
  -[TPSTipStatusController updateCacheData](self->_tipStatusController, "updateCacheData");
  -[TPSDiscoverabilityController contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSTipStatusController firstHintDisplayDateForIdentifier:](self->_tipStatusController, "firstHintDisplayDateForIdentifier:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "compare:", v13) == 1)
      {
        objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "timeIntervalSince1970");
          v18 = v17;
          objc_msgSend(v13, "timeIntervalSince1970");
          v26 = 134218498;
          v27 = v18;
          v28 = 2048;
          v29 = v19;
          v30 = 2112;
          v31 = v8;
          _os_log_impl(&dword_1DAC2F000, v16, OS_LOG_TYPE_DEFAULT, "First hint display date (%f) is later than dismissal date (%f) for identifier %@. Clock went back in time?", (uint8_t *)&v26, 0x20u);
        }

      }
      objc_msgSend(v13, "timeIntervalSinceDate:", v15);
      v21 = v20;
      v22 = (void *)MEMORY[0x1E0DBF2F0];
      -[TPSTipStatusController correlationIdentifierForIdentifier:](self->_tipStatusController, "correlationIdentifierForIdentifier:", v8);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayBundleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "eventWithTipID:correlationID:bundleID:context:dismissType:timeToDismissal:date:", v8, v23, v24, v10, v9, 0, v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "log");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[TPSDiscoverabilityController updateHintDismissedForIdentifier:dismissType:context:].cold.1();
    }

  }
}

- (void)dataProviderManager:(id)a3 didFinishQueryWithResults:(id)a4 type:(int64_t)a5
{
  id v7;
  NSObject *eventResultsProcessingQueue;
  id v9;
  _QWORD block[5];
  id v11;
  int64_t v12;

  v7 = a4;
  eventResultsProcessingQueue = self->_eventResultsProcessingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__TPSDiscoverabilityController_dataProviderManager_didFinishQueryWithResults_type___block_invoke;
  block[3] = &unk_1EA1E0E58;
  block[4] = self;
  v11 = v7;
  v12 = a5;
  v9 = v7;
  dispatch_async(eventResultsProcessingQueue, block);

}

uint64_t __83__TPSDiscoverabilityController_dataProviderManager_didFinishQueryWithResults_type___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processEventProviderQueryResults:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)dataProviderManager:(id)a3 didReceiveCallbackWithResult:(id)a4 type:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *eventRegistrationQueue;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD block[5];
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  eventRegistrationQueue = self->_eventRegistrationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__TPSDiscoverabilityController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke;
  block[3] = &unk_1EA1E0728;
  block[4] = self;
  v11 = v8;
  v19 = v11;
  dispatch_sync(eventRegistrationQueue, block);
  objc_initWeak(&location, self);
  -[TPSDiscoverabilityController contextualInfoMap](self, "contextualInfoMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __86__TPSDiscoverabilityController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke_2;
  v14[3] = &unk_1EA1E1598;
  objc_copyWeak(&v16, &location);
  v13 = v11;
  v15 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __86__TPSDiscoverabilityController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_updateRegisteredEventIdentifiers");
}

void __86__TPSDiscoverabilityController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "desiredOutcomeEventIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "containsObject:", v9);

  if ((_DWORD)v6)
  {
    objc_msgSend(WeakRetained, "tipStatusController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isHintInelgibileForIdentifier:", v5);

    if ((v11 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "discoverability");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_1DAC2F000, v12, OS_LOG_TYPE_DEFAULT, "Hint already marked as ineligible for %@", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "tipStatusController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastDisplayContextForIdentifier:", v5);
      v12 = objc_claimAutoreleasedReturnValue();

      v17[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "markHintIneligibleForIdentifiers:context:reason:", v14, v12, 6);

    }
  }

}

- (TPSDiscoverabilityControllerDelegate)delegate
{
  return (TPSDiscoverabilityControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (OS_dispatch_queue)contextualInfoQueue
{
  return self->_contextualInfoQueue;
}

- (void)setContextualInfoQueue:(id)a3
{
  objc_storeStrong((id *)&self->_contextualInfoQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualInfoQueue, 0);
  objc_storeStrong((id *)&self->_tipStatusController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventResultsProcessingQueue, 0);
  objc_storeStrong((id *)&self->_eventRegistrationQueue, 0);
  objc_storeStrong((id *)&self->_contextualInfoMap, 0);
  objc_storeStrong((id *)&self->_eventsHistoryController, 0);
  objc_storeStrong((id *)&self->_eventsProviderManager, 0);
  objc_storeStrong((id *)&self->_registeredEventIdentifiers, 0);
}

void __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DAC2F000, v0, v1, "Content %@ became invalid due to delivery info lifetime expiration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DAC2F000, v0, v1, "Content %@ became invalid due to max duration exceeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DAC2F000, v0, v1, "Content %@ became invalid due eligibility expired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __57__TPSDiscoverabilityController__cleanupContextualInfoMap__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DAC2F000, v0, v1, "Content %@ became invalid due to precondition changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)contextualEligibilityWithTipIdentifiers:(id *)a1 tipsDeliveryInfoMap:(NSObject *)a2 deliveryInfoMap:experimentCampChangesToAll:.cold.1(id *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "tipStatusMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "Current tip status count: %lu", v4, 0xCu);

}

void __135__TPSDiscoverabilityController_contextualEligibilityWithTipIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_experimentCampChangesToAll___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_1DAC2F000, v3, v4, "Tip Status (%@): %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

void __50__TPSDiscoverabilityController_queryCurrentEvents__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_1DAC2F000, v3, v4, "Active events for type %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)updateHintDismissedForIdentifier:dismissType:context:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1DAC2F000, v0, OS_LOG_TYPE_ERROR, "First display date not found on hint dismissal for identifier %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
