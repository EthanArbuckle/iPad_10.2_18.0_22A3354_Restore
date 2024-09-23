@implementation SBActivityManager

- (SBActivityManager)init
{
  SBActivityManager *v2;
  uint64_t v3;
  ACActivityCenter *activityCenter;
  ACUISActivityAlertClient *v5;
  ACUISActivityAlertClient *activityAlertClient;
  uint64_t v7;
  NSMapTable *bannerPresentableByActivityIdentifier;
  uint64_t v9;
  NSMutableDictionary *itemByActivityIdentifier;
  uint64_t v11;
  SBSoundController *soundController;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  SBActivityManager *v17;
  uint64_t v18;
  DMFApplicationPolicyMonitor *applicationPolicyMonitor;
  uint64_t v20;
  SBLiveActivitySettings *activitySettings;
  uint64_t Serial;
  OS_dispatch_queue *activityProminenceQueue;
  uint64_t v24;
  ACActivityProminenceListener *queue_prominenceListener;
  uint64_t v26;
  NSMutableDictionary *queue_prominenceAssertionByActivityIdentifier;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  SBActivityManager *v33;
  objc_super v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v34.receiver = self;
  v34.super_class = (Class)SBActivityManager;
  v2 = -[SBActivityManager init](&v34, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    activityCenter = v2->_activityCenter;
    v2->_activityCenter = (ACActivityCenter *)v3;

    v5 = (ACUISActivityAlertClient *)objc_alloc_init(MEMORY[0x1E0CF5460]);
    activityAlertClient = v2->_activityAlertClient;
    v2->_activityAlertClient = v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    bannerPresentableByActivityIdentifier = v2->_bannerPresentableByActivityIdentifier;
    v2->_bannerPresentableByActivityIdentifier = (NSMapTable *)v7;

    v9 = objc_opt_new();
    itemByActivityIdentifier = v2->_itemByActivityIdentifier;
    v2->_itemByActivityIdentifier = (NSMutableDictionary *)v9;

    +[SBSoundController sharedInstance](SBSoundController, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    soundController = v2->_soundController;
    v2->_soundController = (SBSoundController *)v11;

    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v13 = (void *)getDMFApplicationPolicyMonitorClass_softClass;
    v39 = getDMFApplicationPolicyMonitorClass_softClass;
    v14 = MEMORY[0x1E0C809B0];
    if (!getDMFApplicationPolicyMonitorClass_softClass)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __getDMFApplicationPolicyMonitorClass_block_invoke;
      v35[3] = &unk_1E8E9ED40;
      v35[4] = &v36;
      __getDMFApplicationPolicyMonitorClass_block_invoke((uint64_t)v35);
      v13 = (void *)v37[3];
    }
    v15 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v36, 8);
    v16 = [v15 alloc];
    v29 = v14;
    v30 = 3221225472;
    v31 = __25__SBActivityManager_init__block_invoke;
    v32 = &unk_1E8E9DED8;
    v17 = v2;
    v33 = v17;
    v18 = objc_msgSend(v16, "initWithPolicyChangeHandler:", &v29);
    applicationPolicyMonitor = v17->_applicationPolicyMonitor;
    v17->_applicationPolicyMonitor = (DMFApplicationPolicyMonitor *)v18;

    v17->_environment = 0;
    +[SBLiveActivityDomain rootSettings](SBLiveActivityDomain, "rootSettings", v29, v30, v31, v32);
    v20 = objc_claimAutoreleasedReturnValue();
    activitySettings = v17->_activitySettings;
    v17->_activitySettings = (SBLiveActivitySettings *)v20;

    -[PTSettings addKeyPathObserver:](v17->_activitySettings, "addKeyPathObserver:", v17);
    Serial = BSDispatchQueueCreateSerial();
    activityProminenceQueue = v17->_activityProminenceQueue;
    v17->_activityProminenceQueue = (OS_dispatch_queue *)Serial;

    v24 = objc_opt_new();
    queue_prominenceListener = v17->_queue_prominenceListener;
    v17->_queue_prominenceListener = (ACActivityProminenceListener *)v24;

    v26 = objc_opt_new();
    queue_prominenceAssertionByActivityIdentifier = v17->_queue_prominenceAssertionByActivityIdentifier;
    v17->_queue_prominenceAssertionByActivityIdentifier = (NSMutableDictionary *)v26;

  }
  return v2;
}

void __25__SBActivityManager_init__block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

uint64_t __25__SBActivityManager_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAllApplicationMonitoringPolicies");
}

- (void)dealloc
{
  NSMutableDictionary *itemByActivityIdentifier;
  NSMutableDictionary *itemsByBundleIdentifier;
  NSMapTable *bannerPresentableByActivityIdentifier;
  objc_super v6;

  -[SBActivityManager cancelObservingActivityUpdates](self, "cancelObservingActivityUpdates");
  -[NSMutableDictionary removeAllObjects](self->_itemByActivityIdentifier, "removeAllObjects");
  itemByActivityIdentifier = self->_itemByActivityIdentifier;
  self->_itemByActivityIdentifier = 0;

  -[NSMutableDictionary removeAllObjects](self->_itemsByBundleIdentifier, "removeAllObjects");
  itemsByBundleIdentifier = self->_itemsByBundleIdentifier;
  self->_itemsByBundleIdentifier = 0;

  -[NSMapTable removeAllObjects](self->_bannerPresentableByActivityIdentifier, "removeAllObjects");
  bannerPresentableByActivityIdentifier = self->_bannerPresentableByActivityIdentifier;
  self->_bannerPresentableByActivityIdentifier = 0;

  v6.receiver = self;
  v6.super_class = (Class)SBActivityManager;
  -[SBActivityManager dealloc](&v6, sel_dealloc);
}

+ (SBActivityManager)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_87);
  return (SBActivityManager *)(id)sharedInstance___instance_1;
}

void __35__SBActivityManager_sharedInstance__block_invoke()
{
  SBActivityManager *v0;
  void *v1;

  v0 = objc_alloc_init(SBActivityManager);
  v1 = (void *)sharedInstance___instance_1;
  sharedInstance___instance_1 = (uint64_t)v0;

}

- (void)startObservingActivityUpdates
{
  NSObject *v3;
  ACActivityCenter *activityCenter;
  BSInvalidatable *v5;
  BSInvalidatable *activitySubscription;
  ACActivityCenter *v7;
  BSInvalidatable *v8;
  BSInvalidatable *activityExceedingReducedPushBudgetSubscription;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id buf[2];

  SBLogActivity();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Start observing activity updates", (uint8_t *)buf, 2u);
  }

  if (!self->_activitySubscription)
  {
    objc_initWeak(buf, self);
    activityCenter = self->_activityCenter;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__SBActivityManager_startObservingActivityUpdates__block_invoke;
    v12[3] = &unk_1E8EA7C20;
    objc_copyWeak(&v13, buf);
    -[ACActivityCenter observeContentUpdatesWithHandler:](activityCenter, "observeContentUpdatesWithHandler:", v12);
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    activitySubscription = self->_activitySubscription;
    self->_activitySubscription = v5;

    -[ACUISActivityAlertClient setDelegate:](self->_activityAlertClient, "setDelegate:", self);
    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  if (!self->_activityExceedingReducedPushBudgetSubscription)
  {
    objc_initWeak(buf, self);
    v7 = self->_activityCenter;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__SBActivityManager_startObservingActivityUpdates__block_invoke_3;
    v10[3] = &unk_1E8EA7C48;
    objc_copyWeak(&v11, buf);
    -[ACActivityCenter observeActivitiesExceedingReducedPushBudgetWithHandler:](v7, "observeActivitiesExceedingReducedPushBudgetWithHandler:", v10);
    v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    activityExceedingReducedPushBudgetSubscription = self->_activityExceedingReducedPushBudgetSubscription;
    self->_activityExceedingReducedPushBudgetSubscription = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

void __50__SBActivityManager_startObservingActivityUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __50__SBActivityManager_startObservingActivityUpdates__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleActivityWithContentUpdate:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __50__SBActivityManager_startObservingActivityUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleActivityExceedingReducedPushBudgetWithIdentifier:", v5);

}

- (void)cancelObservingActivityUpdates
{
  NSObject *v3;
  BSInvalidatable *activitySubscription;
  BSInvalidatable *activityExceedingReducedPushBudgetSubscription;
  BSInvalidatable *v6;
  BSInvalidatable *activityAlertSubscription;
  void *v8;
  uint8_t v9[16];

  SBLogActivity();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Cancel observing activity updates", v9, 2u);
  }

  activitySubscription = self->_activitySubscription;
  if (activitySubscription)
  {
    -[BSInvalidatable invalidate](activitySubscription, "invalidate");
    -[BSInvalidatable invalidate](self->_activityAlertSubscription, "invalidate");
    -[BSInvalidatable invalidate](self->_activityExceedingReducedPushBudgetSubscription, "invalidate");
    activityExceedingReducedPushBudgetSubscription = self->_activityExceedingReducedPushBudgetSubscription;
    self->_activityExceedingReducedPushBudgetSubscription = 0;

    v6 = self->_activitySubscription;
    self->_activitySubscription = 0;

    activityAlertSubscription = self->_activityAlertSubscription;
    self->_activityAlertSubscription = 0;

    -[SBActivityManager _invalidateAllProminenceAssertion](self, "_invalidateAllProminenceAssertion");
    -[SBActivityManager prominenceAssertionByActivityIdentifier](self, "prominenceAssertionByActivityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

    -[SBActivityManager _removeAllObservers](self, "_removeAllObservers");
  }
}

- (BOOL)isActivitySupported
{
  return -[ACActivityCenter areActivitiesEnabled](self->_activityCenter, "areActivitiesEnabled");
}

- (id)activities
{
  return (id)-[NSMutableDictionary allValues](self->_itemByActivityIdentifier, "allValues");
}

- (id)firstPartyActivityGroupingIdentifiers
{
  return &unk_1E91CE5D8;
}

- (void)setEnvironment:(int64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_environment != a3)
  {
    SBLogActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("ambient");
      if (!a3)
        v6 = CFSTR("none");
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Activity environment changed: %@", buf, 0xCu);
    }

    self->_environment = a3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SBActivityManager_setEnvironment___block_invoke;
    v7[3] = &unk_1E8E9DE88;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  }
}

void __36__SBActivityManager_setEnvironment___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v2)
  {
    v3 = v2;
    v14 = *(_QWORD *)v20;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v4);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "activityEnvironmentChanged:", *(_QWORD *)(a1 + 40));
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "prominenceAssertionByActivityIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "allKeys");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v16;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v16 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v5, "shouldHandleActivityItem:", v12))
                objc_msgSend(*(id *)(a1 + 32), "_publishProminenceUpdate:item:", 0, v12);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v9);
        }

        ++v4;
      }
      while (v4 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v3);
  }

}

- (void)_handleActivityWithContentUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  -[SBActivityManager _sendAnalyticsLifecycleEventIfNecessaryWithContentUpdate:](self, "_sendAnalyticsLifecycleEventIfNecessaryWithContentUpdate:", v4);
  v5 = objc_msgSend(v4, "state");
  if (v5 == 2)
  {
    -[SBActivityManager _activityDismissedWithContentUpdate:](self, "_activityDismissedWithContentUpdate:", v4);
  }
  else if (v5 == 1)
  {
    -[SBActivityManager _activityFinishedWithContentUpdate:](self, "_activityFinishedWithContentUpdate:", v4);
  }
  else if (v5)
  {
    SBLogActivity();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = objc_msgSend(v4, "state");
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Unhandled activity state: %ld", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    -[SBActivityManager _activityStartedOrUpdatedWithContentUpdate:](self, "_activityStartedOrUpdatedWithContentUpdate:", v4);
  }

}

- (void)_handleActivityExceedingReducedPushBudgetWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[NSMutableDictionary objectForKey:](self->_itemByActivityIdentifier, "objectForKey:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "shouldHandleActivityItem:", v11)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "activityDidExceedReducedPushBudget:", v11);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_activityStartedOrUpdatedWithContentUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  SBActivityItem *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  SBActivityItem *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  NSObject *activityProminenceQueue;
  void *v27;
  void *v28;
  _QWORD block[5];
  id v30;
  SBActivityItem *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v4, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_itemByActivityIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v6;
  if (v6)
  {
    v7 = v6;
    SBLogActivity();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v5;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Activity did update", buf, 0xCu);
    }
    v9 = (void *)v5;

    -[SBActivityItem setContentUpdate:](v7, "setContentUpdate:", v4);
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    v36 = 0u;
    v10 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v15, "shouldHandleActivityItem:", v7)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v15, "activityDidUpdate:", v7);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v12);
    }

  }
  else
  {
    v16 = -[SBActivityItem initWithContentUpdate:]([SBActivityItem alloc], "initWithContentUpdate:", v4);
    SBLogActivity();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v5;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Activity started", buf, 0xCu);
    }

    v27 = (void *)v5;
    -[NSMutableDictionary setObject:forKey:](self->_itemByActivityIdentifier, "setObject:forKey:", v16, v5);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
          if (objc_msgSend(v23, "shouldHandleActivityItem:", v16)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v4, "descriptor");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "activityDidStart:", v16);
            objc_msgSend(v24, "platterTargetBundleIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBActivityManager _addAppActivitiesRecordForBundleId:item:](self, "_addAppActivitiesRecordForBundleId:item:", v25, v16);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v20);
    }

    activityProminenceQueue = self->_activityProminenceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke;
    block[3] = &unk_1E8E9E270;
    block[4] = self;
    v9 = v27;
    v30 = v27;
    v7 = v16;
    v31 = v7;
    dispatch_async(activityProminenceQueue, block);

  }
}

void __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, char);
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogActivity();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v15 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] listening for activity prominence changes", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke_34;
    v11 = &unk_1E8EA1598;
    objc_copyWeak(&v13, (id *)buf);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v5, "listenForActivityProminence:withHandler:", v6, &v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateProminenceAssertionForActivityIdenfier:", *(_QWORD *)(a1 + 40), v8, v9, v10, v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

}

void __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke_34(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke_2;
  block[3] = &unk_1E8EA7C70;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7 = a2;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

void __64__SBActivityManager__activityStartedOrUpdatedWithContentUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_publishProminenceUpdate:item:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_activityFinishedWithContentUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v14 = v4;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogActivity();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] ended", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        -[NSMutableDictionary objectForKey:](self->_itemByActivityIdentifier, "objectForKey:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "shouldHandleActivityItem:", v13)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "activityDidEnd:", v13);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[SBActivityManager _invalidateProminenceAssertionForActivityIdenfier:](self, "_invalidateProminenceAssertionForActivityIdenfier:", v5);
}

- (void)_activityDismissedWithContentUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v16 = v4;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogActivity();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dismissed", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        -[NSMutableDictionary objectForKey:](self->_itemByActivityIdentifier, "objectForKey:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "shouldHandleActivityItem:", v13)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "descriptor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "activityDidDismiss:", v13);
          objc_msgSend(v14, "platterTargetBundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBActivityManager _removeAppActivitiesRecordForBundleId:item:](self, "_removeAppActivitiesRecordForBundleId:item:", v15, v13);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  -[SBActivityManager _invalidateProminenceAssertionForActivityIdenfier:](self, "_invalidateProminenceAssertionForActivityIdenfier:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_itemByActivityIdentifier, "removeObjectForKey:", v5);

}

- (void)_publishProminenceUpdate:(BOOL)a3 item:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  BSDispatchQueueAssertMain();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "shouldHandleActivityItem:", v6)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "activityProminenceChanged:item:", v4, v6);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_invalidateProminenceAssertionForActivityIdenfier:(id)a3
{
  id v4;
  NSObject *activityProminenceQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  activityProminenceQueue = self->_activityProminenceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SBActivityManager__invalidateProminenceAssertionForActivityIdenfier___block_invoke;
  block[3] = &unk_1E8E9F280;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(activityProminenceQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__SBActivityManager__invalidateProminenceAssertionForActivityIdenfier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_invalidateProminenceAssertionForActivityIdenfier:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_queue_invalidateProminenceAssertionForActivityIdenfier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_prominenceAssertionByActivityIdentifier, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_queue_prominenceAssertionByActivityIdentifier, "removeObjectForKey:", v6);
  }

}

- (void)setProminenceListener:(id)a3
{
  id v4;
  NSObject *activityProminenceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  BSDispatchQueueAssertMain();
  activityProminenceQueue = self->_activityProminenceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SBActivityManager_setProminenceListener___block_invoke;
  block[3] = &unk_1E8E9E820;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(activityProminenceQueue, block);

}

void __43__SBActivityManager_setProminenceListener___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 32);
  v4 = (id *)(v2 + 32);
  if (v5 != v3)
    objc_storeStrong(v4, v3);
}

- (ACActivityProminenceListener)prominenceListener
{
  NSObject *activityProminenceQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  BSDispatchQueueAssertMain();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__25;
  v11 = __Block_byref_object_dispose__25;
  v12 = 0;
  activityProminenceQueue = self->_activityProminenceQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SBActivityManager_prominenceListener__block_invoke;
  v6[3] = &unk_1E8E9DFA0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(activityProminenceQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ACActivityProminenceListener *)v4;
}

void __39__SBActivityManager_prominenceListener__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)setProminenceAssertionByActivityIdentifier:(id)a3
{
  id v4;
  NSObject *activityProminenceQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  BSDispatchQueueAssertMain();
  activityProminenceQueue = self->_activityProminenceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBActivityManager_setProminenceAssertionByActivityIdentifier___block_invoke;
  block[3] = &unk_1E8E9E820;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(activityProminenceQueue, block);

}

void __64__SBActivityManager_setProminenceAssertionByActivityIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((BSEqualDictionaries() & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (NSMutableDictionary)prominenceAssertionByActivityIdentifier
{
  NSObject *activityProminenceQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  BSDispatchQueueAssertMain();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__25;
  v11 = __Block_byref_object_dispose__25;
  v12 = 0;
  activityProminenceQueue = self->_activityProminenceQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SBActivityManager_prominenceAssertionByActivityIdentifier__block_invoke;
  v6[3] = &unk_1E8E9DFA0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(activityProminenceQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __60__SBActivityManager_prominenceAssertionByActivityIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_invalidateAllProminenceAssertion
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SBActivityManager prominenceAssertionByActivityIdentifier](self, "prominenceAssertionByActivityIdentifier", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_presentActivityAlert:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (v4)
  {
    objc_msgSend(v4, "item");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v5, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payloadIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogActivity();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = v6;
      v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] presents an alert with payload: %{public}@", buf, 0x16u);
    }
    v22 = (void *)v6;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v14, "shouldHandleActivityItem:", v5)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v14, "presentAlert:", v4);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }

  }
  else
  {
    SBLogActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBActivityManager _presentActivityAlert:].cold.1(v5, v15, v16, v17, v18, v19, v20, v21);
  }

}

- (void)_dismissActivityAlert:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (v4)
  {
    objc_msgSend(v4, "item");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogActivity();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dismisses the alert", buf, 0xCu);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v13, "shouldHandleActivityItem:", v5)
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v13, "dismissAlert:", v4);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

  }
  else
  {
    SBLogActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBActivityManager _dismissActivityAlert:].cold.1(v5, v14, v15, v16, v17, v18, v19, v20);
  }

}

- (void)_removeAllObservers
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogActivity();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Removing all activity observers", v4, 2u);
  }

  -[NSHashTable removeAllObjects](self->_observers, "removeAllObjects");
}

- (void)_addAppActivitiesRecordForBundleId:(id)a3 item:(id)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary allKeys](self->_itemsByBundleIdentifier, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v11);

  if ((v8 & 1) != 0)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsByBundleIdentifier, "objectForKey:", v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  v10 = v9;
  objc_msgSend(v9, "addObject:", v6);

  -[NSMutableDictionary setObject:forKey:](self->_itemsByBundleIdentifier, "setObject:forKey:", v10, v11);
}

- (void)_removeAppActivitiesRecordForBundleId:(id)a3 item:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_itemsByBundleIdentifier, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsByBundleIdentifier, "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", v6))
    {
      objc_msgSend(v8, "removeObject:", v6);
      -[NSMutableDictionary setObject:forKey:](self->_itemsByBundleIdentifier, "setObject:forKey:", v8, v9);
    }

  }
}

- (void)_updateAllApplicationMonitoringPolicies
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  BSDispatchQueueAssertMain();
  -[SBActivityManager applicationPolicyMonitor](self, "applicationPolicyMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_itemsByBundleIdentifier, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__SBActivityManager__updateAllApplicationMonitoringPolicies__block_invoke;
  v5[3] = &unk_1E8EA5218;
  v5[4] = self;
  objc_msgSend(v3, "requestPoliciesForBundleIdentifiers:completionHandler:", v4, v5);

}

void __60__SBActivityManager__updateAllApplicationMonitoringPolicies__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id location;

  v5 = a2;
  v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v8, &location);
  v7 = v5;
  BSDispatchMain();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __60__SBActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v5[1] = 3221225472;
    v5[2] = __60__SBActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_3;
    v5[3] = &unk_1E8EA7C98;
    v5[4] = WeakRetained;
    v4 = WeakRetained;
    v5[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
    WeakRetained = v4;
  }

}

uint64_t __60__SBActivityManager__updateAllApplicationMonitoringPolicies__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForScreenTimeLimitForBundleId:policy:", a2, a3);
}

- (void)_updateForScreenTimeLimitForBundleId:(id)a3 policy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  BOOL v12;

  v6 = a4;
  v7 = a3;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_itemsByBundleIdentifier, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v8, "copy");
  v9 = objc_msgSend(v6, "integerValue");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__SBActivityManager__updateForScreenTimeLimitForBundleId_policy___block_invoke;
  v11[3] = &unk_1E8EA7CC0;
  v11[4] = self;
  v12 = v9 != 0;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __65__SBActivityManager__updateForScreenTimeLimitForBundleId_policy___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contentType");

  if (v4 != 1)
    objc_msgSend(*(id *)(a1 + 32), "_activityBlocked:item:", *(unsigned __int8 *)(a1 + 40), v5);

}

- (void)_activityBlocked:(BOOL)a3 item:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  BSDispatchQueueAssertMain();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v17 = v7;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v4)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            SBLogActivity();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v6, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v23 = v14;
              _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] hides activity content", buf, 0xCu);

              v7 = v17;
            }

            objc_msgSend(v12, "activityWasBlocked:", v6);
          }
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          SBLogActivity();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v23 = v16;
            _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] unhides activity content", buf, 0xCu);

            v7 = v17;
          }

          objc_msgSend(v12, "activityWasUnblocked:", v6);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v9);
  }

}

- (void)_sendAnalyticsLifecycleEventIfNecessaryWithContentUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemByActivityIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "state") || !v6)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__SBActivityManager__sendAnalyticsLifecycleEventIfNecessaryWithContentUpdate___block_invoke;
    v7[3] = &unk_1E8EA7CE8;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    -[SBActivityManager _sendAnalyticsEventWithPayloadBuilder:](self, "_sendAnalyticsEventWithPayloadBuilder:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

id __78__SBActivityManager__sendAnalyticsLifecycleEventIfNecessaryWithContentUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_activityLifecyclePayloadWithContentUpdate:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_sendAnalyticsEventWithPayloadBuilder:(id)a3
{
  AnalyticsSendEventLazy();
}

- (id)_activityLifecyclePayloadWithContentUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platterTargetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v3, "state"))
  {
    case 0:
      v8 = CFSTR("Start");
      break;
    case 1:
      v8 = CFSTR("End");
      break;
    case 2:
      objc_msgSend(v3, "descriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createdDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v10);
      v13 = v12;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 / 60.0);
      v14 = objc_claimAutoreleasedReturnValue();

      v8 = CFSTR("Dismissed");
      v7 = (void *)v14;
      break;
    case 3:
      v8 = CFSTR("Stale");
      break;
    default:
      v8 = 0;
      break;
  }
  v17[0] = CFSTR("activityId");
  v17[1] = CFSTR("bundleId");
  v18[0] = v4;
  v18[1] = v6;
  v17[2] = CFSTR("eventType");
  v17[3] = CFSTR("duration");
  v18[2] = v8;
  v18[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_hideAllActivities:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  _BOOL4 v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  SBLogActivity();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v19 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "All activities hidden: %{public}d", buf, 8u);
  }

  -[NSMutableDictionary allValues](self->_itemByActivityIdentifier, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBActivityManager _activityBlocked:item:](self, "_activityBlocked:item:", v3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void)activityAlertClient:(id)a3 presentAlertProvider:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SBActivityManager *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SBActivityManager_activityAlertClient_presentAlertProvider_completion___block_invoke;
  block[3] = &unk_1E8EA7D10;
  v13 = self;
  v14 = v8;
  v12 = v7;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __73__SBActivityManager_activityAlertClient_presentAlertProvider_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SBActivityAlert *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBActivityAlert *v21;
  _BOOL4 v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  char v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  _BOOL4 v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "activityIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "activityIdentifier");
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKeyedSubscript:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "descriptor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "contentType");

      if (v6)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "payloadIdentifier");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v16 = [SBActivityAlert alloc];
      objc_msgSend(*(id *)(a1 + 32), "options");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "body");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)v7;
      v21 = -[SBActivityAlert initWithItem:payloadIdentifier:options:title:body:](v16, "initWithItem:payloadIdentifier:options:title:body:", v4, v7, v17, v18, v19);

      v22 = -[SBActivityAlert shouldAlertInEnvironment:](v21, "shouldAlertInEnvironment:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
      v23 = -[SBActivityAlert canPresentInEnvironment:alertType:](v21, "canPresentInEnvironment:alertType:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), 0);
      objc_msgSend(*(id *)(a1 + 32), "options");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "presentationOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "interrupting");

      objc_msgSend(*(id *)(a1 + 32), "options");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "presentationOptions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "optional");

      SBLogActivity();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v43;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544386;
        v45 = v43;
        v46 = 1026;
        v47 = v22;
        v48 = 1026;
        v49 = v23;
        v50 = 1026;
        v51 = v29;
        v52 = 1026;
        v53 = v26;
        _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] shouldPresentActivityAlert: %{public}d, canPresentActivityAlert: %{public}d, isAlertPresentationOptional: %{public}d, interrupting: %{public}d", buf, 0x24u);
      }

      if (v22)
      {
        if ((v26 & 1) == 0)
        {
          SBLogActivity();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v43;
            _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] alert is not interrupting, don't alert, send an error back", buf, 0xCu);
          }

          SBActivityAlertError(2uLL);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
        if (v23)
        {
          objc_msgSend(*(id *)(a1 + 40), "_presentActivityAlert:", v21);
        }
        else
        {
          SBLogActivity();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v43;
            _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] is already visible to the user and interrupting", buf, 0xCu);
          }

          if (v29)
          {
            +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v37, "isUILocked")
              && (+[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance"),
                  v38 = (void *)objc_claimAutoreleasedReturnValue(),
                  v39 = objc_msgSend(v38, "screenIsOn"),
                  v38,
                  v31 = (void *)v43,
                  (v39 & 1) == 0))
            {
              SBLogActivity();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v45 = v43;
                _os_log_impl(&dword_1D0540000, v42, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] alert is optional and screen is locked and off, don't alert", buf, 0xCu);
              }

              SBActivityAlertError(1uLL);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              SBLogActivity();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v45 = (uint64_t)v31;
                _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] alert is optional, interrupting and screen is on, alert user", buf, 0xCu);
              }

              -[SBActivityAlert alertWithScreenOn:playSound:](v21, "alertWithScreenOn:playSound:", 1, 1);
              v33 = 0;
            }

            goto LABEL_22;
          }
          SBLogActivity();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v43;
            _os_log_impl(&dword_1D0540000, v41, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] alert is mandatory and interrupting, turn screen on and play sound", buf, 0xCu);
          }

          -[SBActivityAlert alertWithScreenOn:playSound:](v21, "alertWithScreenOn:playSound:", 1, 1);
        }
      }
      else
      {
        SBLogActivity();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v45 = v43;
          _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] this activity can't be alerted either on this device or on watch", buf, 0xCu);
        }

      }
      v33 = 0;
LABEL_22:
      v35 = *(_QWORD *)(a1 + 48);
      if (v35)
        (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v33);

      return;
    }
  }
  SBLogActivity();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __73__SBActivityManager_activityAlertClient_presentAlertProvider_completion___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)activityAlertClient:(id)a3 dismissAlertProvider:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBActivityManager *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SBActivityManager_activityAlertClient_dismissAlertProvider___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __62__SBActivityManager_activityAlertClient_dismissAlertProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  SBActivityAlert *v4;
  void *v5;
  void *v6;
  void *v7;
  SBActivityAlert *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "activityIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKeyedSubscript:", v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "payloadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SBActivityAlert alloc];
  objc_msgSend(*(id *)(a1 + 32), "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBActivityAlert initWithItem:payloadIdentifier:options:title:body:](v4, "initWithItem:payloadIdentifier:options:title:body:", v2, v3, v5, v6, v7);

  objc_msgSend(*(id *)(a1 + 40), "_dismissActivityAlert:", v8);
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBActivityManager *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SBActivityManager_settings_changedValueForKeyPath___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __53__SBActivityManager_settings_changedValueForKeyPath___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("hideActivitiesInLockScreen")) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("hideActivitiesInDynamicIsland")) & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("hideActivitiesInAmbient")), (_DWORD)result))
  {
    SBLogActivity();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Live Activity Visibility settings have changed.", v5, 2u);
    }

    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "hideActivitiesInLockScreen") & 1) != 0
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "hideActivitiesInAmbient") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "hideActivitiesInDynamicIsland");
    }
    return objc_msgSend(*(id *)(a1 + 40), "_hideAllActivities:", v4);
  }
  return result;
}

- (int64_t)environment
{
  return self->_environment;
}

- (ACActivityCenter)activityCenter
{
  return self->_activityCenter;
}

- (void)setActivityCenter:(id)a3
{
  objc_storeStrong((id *)&self->_activityCenter, a3);
}

- (ACUISActivityAlertClient)activityAlertClient
{
  return self->_activityAlertClient;
}

- (void)setActivityAlertClient:(id)a3
{
  objc_storeStrong((id *)&self->_activityAlertClient, a3);
}

- (BSInvalidatable)activitySubscription
{
  return self->_activitySubscription;
}

- (void)setActivitySubscription:(id)a3
{
  objc_storeStrong((id *)&self->_activitySubscription, a3);
}

- (BSInvalidatable)activityExceedingReducedPushBudgetSubscription
{
  return self->_activityExceedingReducedPushBudgetSubscription;
}

- (void)setActivityExceedingReducedPushBudgetSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_activityExceedingReducedPushBudgetSubscription, a3);
}

- (BSInvalidatable)activityAlertSubscription
{
  return self->_activityAlertSubscription;
}

- (void)setActivityAlertSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_activityAlertSubscription, a3);
}

- (SBSoundController)soundController
{
  return self->_soundController;
}

- (void)setSoundController:(id)a3
{
  objc_storeStrong((id *)&self->_soundController, a3);
}

- (DMFApplicationPolicyMonitor)applicationPolicyMonitor
{
  return self->_applicationPolicyMonitor;
}

- (NSMutableDictionary)itemByActivityIdentifier
{
  return self->_itemByActivityIdentifier;
}

- (void)setItemByActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemByActivityIdentifier, a3);
}

- (NSMutableDictionary)itemsByBundleIdentifier
{
  return self->_itemsByBundleIdentifier;
}

- (void)setItemsByBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemsByBundleIdentifier, a3);
}

- (SBLiveActivitySettings)activitySettings
{
  return self->_activitySettings;
}

- (void)setActivitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_activitySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySettings, 0);
  objc_storeStrong((id *)&self->_itemsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_itemByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_soundController, 0);
  objc_storeStrong((id *)&self->_activityAlertSubscription, 0);
  objc_storeStrong((id *)&self->_activityExceedingReducedPushBudgetSubscription, 0);
  objc_storeStrong((id *)&self->_activitySubscription, 0);
  objc_storeStrong((id *)&self->_activityAlertClient, 0);
  objc_storeStrong((id *)&self->_activityCenter, 0);
  objc_storeStrong((id *)&self->_queue_prominenceAssertionByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_queue_prominenceListener, 0);
  objc_storeStrong((id *)&self->_activityProminenceQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bannerPresentableByActivityIdentifier, 0);
}

- (void)_presentActivityAlert:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "No alert found to be presented", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_dismissActivityAlert:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "No alert found to be dismissed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __73__SBActivityManager_activityAlertClient_presentAlertProvider_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "No provider or activity identifier recieved for the alert", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
