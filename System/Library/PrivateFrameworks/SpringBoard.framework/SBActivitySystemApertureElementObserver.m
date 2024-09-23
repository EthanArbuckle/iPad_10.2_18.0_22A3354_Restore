@implementation SBActivitySystemApertureElementObserver

- (SBActivitySystemApertureElementObserver)init
{
  SBActivitySystemApertureElementObserver *v2;
  uint64_t v3;
  NSMutableDictionary *sceneHandleByActivityIdentifier;
  uint64_t v5;
  NSMutableDictionary *elementAssertionByActivityIdentifier;
  uint64_t v7;
  NSMutableDictionary *elementByActivityIdentifier;
  uint64_t v9;
  NSMutableDictionary *activeItemByActivityIdentifier;
  uint64_t v11;
  NSMutableDictionary *contentPayloadIDsByActivityIdentifier;
  uint64_t v13;
  NSMutableDictionary *prominenceStateByActivityIdentifier;
  uint64_t v15;
  NSMutableArray *pendingItems;
  uint64_t v17;
  NSMutableSet *activeWidgetActivitiesWithSceneHandles;
  uint64_t v19;
  NSMutableOrderedSet *pendingAlerts;
  uint64_t v21;
  NSMutableSet *ongoingActivities;
  uint64_t v23;
  NSMutableDictionary *alertingAssertionsByActivityIdentifier;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SBActivitySystemApertureElementObserver;
  v2 = -[SBActivitySystemApertureElementObserver init](&v26, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sceneHandleByActivityIdentifier = v2->_sceneHandleByActivityIdentifier;
    v2->_sceneHandleByActivityIdentifier = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    elementAssertionByActivityIdentifier = v2->_elementAssertionByActivityIdentifier;
    v2->_elementAssertionByActivityIdentifier = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    elementByActivityIdentifier = v2->_elementByActivityIdentifier;
    v2->_elementByActivityIdentifier = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    activeItemByActivityIdentifier = v2->_activeItemByActivityIdentifier;
    v2->_activeItemByActivityIdentifier = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    contentPayloadIDsByActivityIdentifier = v2->_contentPayloadIDsByActivityIdentifier;
    v2->_contentPayloadIDsByActivityIdentifier = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    prominenceStateByActivityIdentifier = v2->_prominenceStateByActivityIdentifier;
    v2->_prominenceStateByActivityIdentifier = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    pendingItems = v2->_pendingItems;
    v2->_pendingItems = (NSMutableArray *)v15;

    v17 = objc_opt_new();
    activeWidgetActivitiesWithSceneHandles = v2->_activeWidgetActivitiesWithSceneHandles;
    v2->_activeWidgetActivitiesWithSceneHandles = (NSMutableSet *)v17;

    v19 = objc_opt_new();
    pendingAlerts = v2->_pendingAlerts;
    v2->_pendingAlerts = (NSMutableOrderedSet *)v19;

    v21 = objc_opt_new();
    ongoingActivities = v2->_ongoingActivities;
    v2->_ongoingActivities = (NSMutableSet *)v21;

    v23 = objc_opt_new();
    alertingAssertionsByActivityIdentifier = v2->_alertingAssertionsByActivityIdentifier;
    v2->_alertingAssertionsByActivityIdentifier = (NSMutableDictionary *)v23;

    v2->_activityEnvironment = 0;
  }
  return v2;
}

- (void)activityDidStart:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __60__SBActivitySystemApertureElementObserver_activityDidStart___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_cleanUpInvalidRegisteredElements");
  if (objc_msgSend(*(id *)(a1 + 32), "_canRegisterElementForActivityItem:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createAndActivateElementForActivityItem:completion:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "descriptor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "platterTargetBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_activatedElementItemForBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "_shouldSwapActivityItem:withOtherItem:itemAlerting:", *(_QWORD *)(a1 + 40), v5, 0);
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    if (v6)
      objc_msgSend(v7, "_swapActivityItem:withItem:", v8, v5);
    else
      objc_msgSend(v7, "_addPendingItemIfNecessary:", v8);

  }
}

- (void)activityDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
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
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBActivitySystemApertureElementObserver _cleanUpInvalidRegisteredElements](self, "_cleanUpInvalidRegisteredElements");
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "platterTargetBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogActivity();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "relevanceScore");
    *(_DWORD *)buf = 138543874;
    v27 = v5;
    v28 = 2114;
    v29 = v7;
    v30 = 2048;
    v31 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@, BundleID: %{public}@] updated with relevance score %f", buf, 0x20u);
  }

  -[SBActivitySystemApertureElementObserver _activatedElementItemForBundleIdentifier:](self, "_activatedElementItemForBundleIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v5);

  SBLogActivity();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543618;
      v27 = v5;
      v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@, BundleID: %{public}@] Update is on the registered element", buf, 0x16u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeItemByActivityIdentifier, "setObject:forKeyedSubscript:", v4, v5);
    v15 = (void *)-[NSMutableArray copy](self->_pendingItems, "copy");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          -[SBActivitySystemApertureElementObserver _swapItemWithRegisteredItemIfNecessary:itemAlerting:](self, "_swapItemWithRegisteredItemIfNecessary:itemAlerting:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), 0, (_QWORD)v21);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v18);
    }

  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543618;
      v27 = v5;
      v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@, BundleID: %{public}@] Update is on a pending element", buf, 0x16u);
    }

    -[SBActivitySystemApertureElementObserver _updatePendingItemWithItem:](self, "_updatePendingItemWithItem:", v4);
    -[SBActivitySystemApertureElementObserver _swapItemWithRegisteredItemIfNecessary:itemAlerting:](self, "_swapItemWithRegisteredItemIfNecessary:itemAlerting:", v4, 0);
  }

}

- (void)activityDidEnd:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __58__SBActivitySystemApertureElementObserver_activityDidEnd___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v4);

  objc_msgSend(*v2, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    SBLogActivity();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] ended", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__SBActivitySystemApertureElementObserver_activityDidEnd___block_invoke_7;
    v10[3] = &unk_1E8EAB668;
    objc_copyWeak(&v12, (id *)buf);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v8, "_invalidateSystemApertureElementForItem:completion:", v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

void __58__SBActivitySystemApertureElementObserver_activityDidEnd___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __58__SBActivitySystemApertureElementObserver_activityDidEnd___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_removeSystemApertureSceneHandleWithItem:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_registerSystemApertureElementForPendingActivityIfNecessary");
    WeakRetained = v3;
  }

}

- (BOOL)shouldHandleActivityItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  char v9;

  if (!a3)
    return 0;
  objc_msgSend(a3, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_118);

  +[SBLiveActivityDomain rootSettings](SBLiveActivityDomain, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hideActivitiesInDynamicIsland");

  v9 = v6 & ~v8;
  return v9;
}

BOOL __68__SBActivitySystemApertureElementObserver_shouldHandleActivityItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "destination") == 2;
}

- (void)activityWasBlockedForItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogActivity();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] was blocked", (uint8_t *)&v7, 0xCu);

  }
  -[SBActivitySystemApertureElementObserver activityDidEnd:](self, "activityDidEnd:", v4);

}

- (void)activityWasUnblockedForItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogActivity();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] was unblocked", (uint8_t *)&v7, 0xCu);

  }
  -[SBActivitySystemApertureElementObserver activityDidStart:](self, "activityDidStart:", v4);

}

- (void)presentAlert:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBActivitySystemApertureElementObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SBActivitySystemApertureElementObserver_presentAlert___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__SBActivitySystemApertureElementObserver_presentAlert___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(*(id *)(a1 + 32), "canPresentInEnvironment:alertType:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), 2);
  SBLogActivity();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] presents alert", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_presentOrPendActivityAlert:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v6)
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] System aperture can't present alert in this environment", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)dismissAlert:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBActivitySystemApertureElementObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SBActivitySystemApertureElementObserver_dismissAlert___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__SBActivitySystemApertureElementObserver_dismissAlert___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogActivity();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dismisses alert", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "invalidateWithReason:", CFSTR("SBActivitySystemApertureElementObserver's dismissAlertForActivityAlertProvider"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "removeObjectForKey:", v3);
  }

}

- (void)activityProminenceChanged:(BOOL)a3 item:(id)a4
{
  _BOOL8 v4;
  void *v6;
  _BOOL4 v7;
  id v8;

  v4 = a3;
  v8 = a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(v8, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBActivitySystemApertureElementObserver _isActivityOngoing:](self, "_isActivityOngoing:", v6);

  if (v7)
    -[SBActivitySystemApertureElementObserver _updateSystemApertureElementProminence:item:](self, "_updateSystemApertureElementProminence:item:", v4, v8);

}

- (void)activityEnvironmentChanged:(int64_t)a3
{
  void *v4;
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
  if (self->_activityEnvironment != a3)
  {
    self->_activityEnvironment = a3;
    if (a3 == 1)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      -[NSMutableDictionary allValues](self->_alertingAssertionsByActivityIdentifier, "allValues", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
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
            objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidateWithReason:", CFSTR("SBActivitySystemApertureElementObserver's activityEnvironmentChanged"));
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v6);
      }

      -[NSMutableDictionary removeAllObjects](self->_alertingAssertionsByActivityIdentifier, "removeAllObjects");
    }
  }
}

- (BOOL)_isActivityOngoing:(id)a3
{
  id v4;

  v4 = a3;
  BSDispatchQueueAssertMain();
  LOBYTE(self) = -[NSMutableSet containsObject:](self->_ongoingActivities, "containsObject:", v4);

  return (char)self;
}

- (void)_cleanUpInvalidRegisteredElements
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  _QWORD v19[4];
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_sceneHandleByActivityIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 138543362;
    v18 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "scene", v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isValid");

        if ((v13 & 1) == 0)
        {
          objc_msgSend(v11, "descriptor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "activityIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKeyedSubscript:](self->_activeItemByActivityIdentifier, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __76__SBActivitySystemApertureElementObserver__cleanUpInvalidRegisteredElements__block_invoke;
            v19[3] = &unk_1E8EA60B8;
            v20 = v15;
            -[SBActivitySystemApertureElementObserver _invalidateSystemApertureElementForItem:completion:](self, "_invalidateSystemApertureElementForItem:completion:", v16, v19);
            v17 = v20;
          }
          else
          {
            objc_msgSend(v11, "invalidate");
            -[NSMutableDictionary removeObjectForKey:](self->_sceneHandleByActivityIdentifier, "removeObjectForKey:", v15);
            SBLogActivity();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v18;
              v26 = v15;
              _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] scene handle removed.", buf, 0xCu);
            }
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

}

void __76__SBActivitySystemApertureElementObserver__cleanUpInvalidRegisteredElements__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogActivity();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] invalid scene removed.", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)_canRegisterElementForActivityItem:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;

  objc_msgSend(a3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentType");
  objc_msgSend(v4, "platterTargetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBActivitySystemApertureElementObserver _registeredElementExistsForBundleIdentifier:](self, "_registeredElementExistsForBundleIdentifier:", v6);
  v8 = -[SBActivitySystemApertureElementObserver _systemApertureElementAssertionExistsForBundleIdentifier:](self, "_systemApertureElementAssertionExistsForBundleIdentifier:", v6);
  v9 = v8;
  if (v5)
    v10 = !v7 && !v8;
  else
    v10 = (unint64_t)-[NSMutableSet count](self->_activeWidgetActivitiesWithSceneHandles, "count") <= 1
       && !v7
       && !v9;

  return v10;
}

- (void)_createAndActivateElementForActivityItem:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(id, uint64_t);
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(v7, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBActivitySystemApertureElementObserver shouldHandleActivityItem:](self, "shouldHandleActivityItem:", v7)
    && v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sceneHandleByActivityIdentifier, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogActivity();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SBActivitySystemApertureElementObserver _createAndActivateElementForActivityItem:completion:].cold.2();

      if (v8)
        v8[2](v8, 1);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v10;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] started, creating system aperture element", buf, 0xCu);
      }

      -[SBActivitySystemApertureElementObserver _createSystemApertureSceneHandleWithItem:](self, "_createSystemApertureSceneHandleWithItem:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __95__SBActivitySystemApertureElementObserver__createAndActivateElementForActivityItem_completion___block_invoke;
        v18[3] = &unk_1E8E9F230;
        v19 = v10;
        v20 = v8;
        -[SBActivitySystemApertureElementObserver _createAndActivateSystemApertureElementWithScene:item:completion:](self, "_createAndActivateSystemApertureElementWithScene:item:completion:", v15, v7, v18);

      }
      else
      {
        SBLogActivity();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[SBActivitySystemApertureElementObserver _createAndActivateElementForActivityItem:completion:].cold.1();

        if (v8)
          v8[2](v8, 0);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBActivitySystemApertureElementObserver.m"), 282, CFSTR("Activity cannot be started in system aperture if it doesn't have a system aperture destination or an identifier"));

    if (v8)
      v8[2](v8, 0);
  }

}

uint64_t __95__SBActivitySystemApertureElementObserver__createAndActivateElementForActivityItem_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  SBLogActivity();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v15 = 138543362;
      v16 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] System aperture element is created and activate successfully", (uint8_t *)&v15, 0xCu);
    }

    result = *(_QWORD *)(a1 + 40);
    if (result)
    {
      v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __95__SBActivitySystemApertureElementObserver__createAndActivateElementForActivityItem_completion___block_invoke_cold_1(a1, v5, v9, v10, v11, v12, v13, v14);

    result = *(_QWORD *)(a1 + 40);
    if (result)
    {
      v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (void)_registerSystemApertureElementForPendingActivityIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  -[NSMutableArray firstObject](self->_pendingItems, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[NSMutableSet count](self->_activeWidgetActivitiesWithSceneHandles, "count") <= 1)
  {
    objc_msgSend(v3, "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "platterTargetBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBActivitySystemApertureElementObserver _registeredElementExistsForBundleIdentifier:](self, "_registeredElementExistsForBundleIdentifier:", v5);

    if (!v6)
    {
      if (v3)
      {
        -[SBActivitySystemApertureElementObserver _removePendingItem:withPendingAlerts:](self, "_removePendingItem:withPendingAlerts:", v3, 0);
        SBLogActivity();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543362;
          v14 = v8;
          _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] starting new activity from pending activities", (uint8_t *)&v13, 0xCu);

        }
        objc_msgSend(v3, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[SBActivitySystemApertureElementObserver _isActivityOngoing:](self, "_isActivityOngoing:", v9);

        if (v10)
        {
          -[SBActivitySystemApertureElementObserver _createAndActivateElementForActivityItem:completion:](self, "_createAndActivateElementForActivityItem:completion:", v3, 0);
        }
        else
        {
          SBLogActivity();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v3, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = 138543362;
            v14 = v12;
            _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] this activity has already ended, abort starting pending activity", (uint8_t *)&v13, 0xCu);

          }
        }
      }
    }
  }

}

- (void)_prepareForAlertingActivityIfNecessary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(v6, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBActivitySystemApertureElementObserver _activityIsPendingForIdentifier:](self, "_activityIsPendingForIdentifier:", v9))
  {
    SBLogActivity();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] preparing element for alerting pending activity", (uint8_t *)&v13, 0xCu);
    }

    if (-[SBActivitySystemApertureElementObserver _isActivityOngoing:](self, "_isActivityOngoing:", v9))
    {
      -[SBActivitySystemApertureElementObserver _pendingItemForAlert:](self, "_pendingItemForAlert:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBActivitySystemApertureElementObserver _createAndActivateElementForActivityItem:completion:](self, "_createAndActivateElementForActivityItem:completion:", v11, v7);

    }
    else
    {
      SBLogActivity();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = v9;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] this activity has already ended, no alert necessary", (uint8_t *)&v13, 0xCu);
      }

      if (v7)
        v7[2](v7, 0);
    }
  }
  else if (v7)
  {
    ((void (**)(id, BOOL))v7)[2](v7, -[SBActivitySystemApertureElementObserver _isActivityOngoing:](self, "_isActivityOngoing:", v9));
  }

}

- (void)_presentPendingAlertIfNecessary
{
  void *v3;
  void *v4;

  -[NSMutableOrderedSet firstObject](self->_pendingAlerts, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[SBActivitySystemApertureElementObserver _presentOrPendActivityAlert:](self, "_presentOrPendActivityAlert:", v3);
    v3 = v4;
  }

}

- (void)_presentPendingAlertIfNecessaryForActivityIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableOrderedSet copy](self->_pendingAlerts, "copy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v23;
    *(_QWORD *)&v8 = 138543874;
    v20 = v8;
    v21 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "item", v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if (v15
          && -[SBActivitySystemApertureElementObserver _canPresentAlert:](self, "_canPresentAlert:", v12)
          && -[SBActivitySystemApertureElementObserver _isContentReadyForAlert:](self, "_isContentReadyForAlert:", v12))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_contentPayloadIDsByActivityIdentifier, "objectForKeyedSubscript:", v4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          SBLogActivity();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "payloadIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "description");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v27 = v4;
            v28 = 2114;
            v29 = v18;
            v30 = 2114;
            v31 = v19;
            _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Showing alert with payload ID: %{public}@, payload IDs received for the activity: %{public}@", buf, 0x20u);

            v6 = v21;
          }

          -[SBActivitySystemApertureElementObserver _prepareAndPresentActivityAlert:](self, "_prepareAndPresentActivityAlert:", v12);
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v9);
  }

}

- (void)_presentOrPendActivityAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (-[SBActivitySystemApertureElementObserver _canPresentAlert:](self, "_canPresentAlert:", v4))
  {
    if (-[SBActivitySystemApertureElementObserver _isContentReadyForAlert:](self, "_isContentReadyForAlert:", v4))
    {
      -[SBActivitySystemApertureElementObserver _prepareAndPresentActivityAlert:](self, "_prepareAndPresentActivityAlert:", v4);
    }
    else
    {
      v10 = MEMORY[0x1E0C809B0];
      self->_preparingElementForPendingAlert = 1;
      v11[0] = v10;
      v11[1] = 3221225472;
      v11[2] = __71__SBActivitySystemApertureElementObserver__presentOrPendActivityAlert___block_invoke;
      v11[3] = &unk_1E8E9DEB0;
      v11[4] = self;
      v12 = v4;
      -[SBActivitySystemApertureElementObserver _prepareForAlertingActivityIfNecessary:completion:](self, "_prepareForAlertingActivityIfNecessary:completion:", v12, v11);

    }
  }
  else
  {
    -[SBActivitySystemApertureElementObserver _addPendingAlert:](self, "_addPendingAlert:", v4);
    objc_msgSend(v4, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_elementByActivityIdentifier, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBActivitySystemApertureElementObserver _pendingItemForAlert:](self, "_pendingItemForAlert:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!v7 && v8)
      -[SBActivitySystemApertureElementObserver _swapItemWithRegisteredItemIfNecessary:itemAlerting:](self, "_swapItemWithRegisteredItemIfNecessary:itemAlerting:", v8, 1);

  }
}

uint64_t __71__SBActivitySystemApertureElementObserver__presentOrPendActivityAlert___block_invoke(uint64_t result, int a2)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 96) = 0;
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_addPendingAlert:", *(_QWORD *)(result + 40));
  return result;
}

- (void)_addPendingAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogActivity();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding to pending alerts", (uint8_t *)&v9, 0xCu);
  }

  -[NSMutableOrderedSet addObject:](self->_pendingAlerts, "addObject:", v4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prominenceStateByActivityIdentifier, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)_prepareAndPresentActivityAlert:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__SBActivitySystemApertureElementObserver__prepareAndPresentActivityAlert___block_invoke;
  v6[3] = &unk_1E8E9DEB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBActivitySystemApertureElementObserver _prepareForAlertingActivityIfNecessary:completion:](self, "_prepareForAlertingActivityIfNecessary:completion:", v5, v6);

}

uint64_t __75__SBActivitySystemApertureElementObserver__prepareAndPresentActivityAlert___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_presentAlert:", *(_QWORD *)(result + 40));
  return result;
}

- (void)_cleanUpAlertPresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBActivitySystemApertureElementObserver _activityIsPendingForIdentifier:](self, "_activityIsPendingForIdentifier:", v6))
  {
    objc_initWeak(&location, self);
    objc_msgSend(v4, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__SBActivitySystemApertureElementObserver__cleanUpAlertPresentation___block_invoke;
    v8[3] = &unk_1E8EAB668;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    -[SBActivitySystemApertureElementObserver _invalidateSystemApertureElementForItem:completion:](self, "_invalidateSystemApertureElementForItem:completion:", v7, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __69__SBActivitySystemApertureElementObserver__cleanUpAlertPresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __69__SBActivitySystemApertureElementObserver__cleanUpAlertPresentation___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "item");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_removeSystemApertureSceneHandleWithItem:", v2);

    objc_msgSend(WeakRetained, "_registerSystemApertureElementForPendingActivityIfNecessary");
  }

}

- (void)_presentAlert:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  char v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[SBActivitySystemApertureElementObserver _canPresentAlert:](self, "_canPresentAlert:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBActivitySystemApertureElementObserver.m"), 440, CFSTR("Cannot present an alert when an alert is active or content is not ready"));

  }
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_sceneHandleByActivityIdentifier, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBActivitySystemApertureElementObserver _isActivityOngoing:](self, "_isActivityOngoing:", v7))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_elementByActivityIdentifier, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      SBLogActivity();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v7;
        v32 = 2112;
        v33 = v12;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] enables alerting for element %@", buf, 0x16u);

      }
      v13 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __57__SBActivitySystemApertureElementObserver__presentAlert___block_invoke;
      v27[3] = &unk_1E8EAB6B0;
      v14 = v7;
      v28 = v14;
      v15 = v9;
      v29 = v15;
      -[SBActivitySystemApertureElementObserver _sendAnalyticsEventWithPayloadBuilder:](self, "_sendAnalyticsEventWithPayloadBuilder:", v27);
      -[NSMutableOrderedSet removeObject:](self->_pendingAlerts, "removeObject:", v5);
      objc_msgSend(v5, "alertWithScreenOn:playSound:", 1, 1);
      v16 = objc_msgSend(v5, "isProminent");
      v17 = objc_msgSend(v15, "isMomentary");
      objc_msgSend(v10, "requestAlertingAssertionImplicitlyDismissable:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[NSMutableDictionary setObject:forKey:](self->_alertingAssertionsByActivityIdentifier, "setObject:forKey:", v18, v14);
        objc_msgSend(v18, "setAutomaticallyInvalidatable:lockingWithKey:reason:", 0, CFSTR("SBActivitySystemApertureElementObserver"), CFSTR("SBActivitySystemApertureElementObserver"));
        objc_initWeak((id *)buf, self);
        v22[0] = v13;
        v22[1] = 3221225472;
        v22[2] = __57__SBActivitySystemApertureElementObserver__presentAlert___block_invoke_2;
        v22[3] = &unk_1E8EAB6D8;
        v23 = v14;
        objc_copyWeak(&v25, (id *)buf);
        v24 = v5;
        v26 = v17;
        objc_msgSend(v18, "addInvalidationBlock:", v22);

        objc_destroyWeak(&v25);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        SBLogActivity();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[SBActivitySystemApertureElementObserver _presentAlert:].cold.1((uint64_t)v14, v10, v20);

      }
    }

  }
  else
  {
    SBLogActivity();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v7;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] activity has ended, not presenting an alert for it", buf, 0xCu);
    }

    -[NSMutableOrderedSet removeObject:](self->_pendingAlerts, "removeObject:", v5);
    -[SBActivitySystemApertureElementObserver _presentPendingAlertIfNecessary](self, "_presentPendingAlertIfNecessary");
    -[SBActivitySystemApertureElementObserver _cleanUpAlertPresentation:](self, "_cleanUpAlertPresentation:", v5);
  }

}

id __57__SBActivitySystemApertureElementObserver__presentAlert___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v7[0] = v2;
  v6[0] = CFSTR("activityId");
  v6[1] = CFSTR("bundleId");
  objc_msgSend(v1, "platterTargetBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = CFSTR("eventType");
  v7[1] = v3;
  v7[2] = CFSTR("alert-jindo");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __57__SBActivitySystemApertureElementObserver__presentAlert___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogActivity();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] invalidating alerting assertion", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_presentPendingAlertIfNecessary");
    objc_msgSend(v5, "_cleanUpAlertPresentation:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "item");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(MEMORY[0x1E0C90230]);
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endActivity:", v8);

    }
  }

}

- (BOOL)_canPresentAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_elementByActivityIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogActivity();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v5;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Element for alerting: %@", (uint8_t *)&v12, 0x16u);

    }
    v10 = objc_msgSend(v6, "isReadyForPresentation");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBActivitySystemApertureElementObserver _canPresentAlert:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (BOOL)_isContentReadyForAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "payloadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contentPayloadIDsByActivityIdentifier, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "containsObject:", v7);
    else
      v10 = 0;

  }
  else
  {
    SBLogActivity();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] No payload ID passed with the alert", (uint8_t *)&v13, 0xCu);
    }

    v10 = 1;
  }

  return v10;
}

- (BOOL)_hasValidAlertingAssertion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
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
  -[NSMutableDictionary allValues](self->_alertingAssertionsByActivityIdentifier, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isValid") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_pendingItemForAlert:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_pendingItems;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_registeredElementExistsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_sceneHandleByActivityIdentifier, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "descriptor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "platterTargetBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_systemApertureElementAssertionExistsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  NSMutableDictionary *elementAssertionByActivityIdentifier;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allValues](self->_activeItemByActivityIdentifier, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "descriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "platterTargetBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          elementAssertionByActivityIdentifier = self->_elementAssertionByActivityIdentifier;
          objc_msgSend(v10, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](elementAssertionByActivityIdentifier, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v17 != 0;

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)_activatedElementItemForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allValues](self->_sceneHandleByActivityIdentifier, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "descriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "platterTargetBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
        {
          objc_msgSend(v10, "descriptor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "activityIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKeyedSubscript:](self->_elementByActivityIdentifier, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && (objc_msgSend(v16, "isActivated") & 1) != 0)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_activeItemByActivityIdentifier, "objectForKeyedSubscript:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (BOOL)_shouldSwapActivityItem:(id)a3 withOtherItem:(id)a4 itemAlerting:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v5 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 || !v9)
  {
    SBLogActivity();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543618;
      v39 = v21;
      v40 = 2114;
      v41 = v22;
      v23 = "[Swapping Activity: %{public}@, Swapped Activity: %{public}@] Not swapping because items can't be found";
LABEL_13:
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v38, 0x16u);

    }
LABEL_14:
    v20 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v8, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "platterTargetBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "platterTargetBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    SBLogActivity();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543618;
      v39 = v21;
      v40 = 2114;
      v41 = v22;
      v23 = "[Swapping Activity: %{public}@, Swapped Activity: %{public}@] Not swapping items because bundle identifiers doesn't match";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(v8, "identifier");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v5
    && -[SBActivitySystemApertureElementObserver _activityAlertIsPendingForIdentifier:](self, "_activityAlertIsPendingForIdentifier:", v16))
  {
    SBLogActivity();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543618;
      v39 = v18;
      v40 = 2114;
      v41 = v19;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[Swapping Activity: %{public}@, Swapped Activity: %{public}@] Swapping items because alert is pending", (uint8_t *)&v38, 0x16u);

    }
    v20 = 1;
  }
  else
  {
    objc_msgSend(v10, "identifier");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sceneHandleByActivityIdentifier, "objectForKeyedSubscript:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogActivity();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v26)
      {
        objc_msgSend(v8, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "relevanceScore");
        v30 = v29;
        objc_msgSend(v10, "relevanceScore");
        v38 = 138544130;
        v39 = v27;
        v40 = 2114;
        v41 = v28;
        v42 = 2048;
        v43 = v30;
        v44 = 2048;
        v45 = v31;
        _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "[Swapping Activity: %{public}@, Swapped Activity: %{public}@] Checking relevance scores for swapping decision: Swapping Activity Relevance Score: %f, Swapped Activity Relevance Score: %f", (uint8_t *)&v38, 0x2Au);

      }
      objc_msgSend(v8, "relevanceScore");
      v33 = v32;
      objc_msgSend(v10, "relevanceScore");
      v20 = v33 > v34;
    }
    else
    {
      if (v26)
      {
        objc_msgSend(v8, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = v35;
        v40 = 2114;
        v41 = v36;
        _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "[Swapping Activity: %{public}@, Swapped Activity: %{public}@] Not swapping items because no element found for registered item", (uint8_t *)&v38, 0x16u);

      }
      v20 = 0;
    }

  }
LABEL_24:

  return v20;
}

- (void)_swapItemWithRegisteredItemIfNecessary:(id)a3 itemAlerting:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  objc_msgSend(v9, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "platterTargetBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBActivitySystemApertureElementObserver _activatedElementItemForBundleIdentifier:](self, "_activatedElementItemForBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBActivitySystemApertureElementObserver _shouldSwapActivityItem:withOtherItem:itemAlerting:](self, "_shouldSwapActivityItem:withOtherItem:itemAlerting:", v9, v8, v4))
  {
    -[SBActivitySystemApertureElementObserver _swapActivityItem:withItem:](self, "_swapActivityItem:withItem:", v9, v8);
    -[SBActivitySystemApertureElementObserver _removePendingItem:withPendingAlerts:](self, "_removePendingItem:withPendingAlerts:", v9, 0);
  }

}

- (void)_swapActivityItem:(id)a3 withItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    SBLogActivity();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "platterTargetBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "descriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "platterTargetBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v10;
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      v27 = v15;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Swapping item [ActivityID: %{public}@, BundleID: %{public}@] with other item [ActivityID: %{public}@, BundleID: %{public}@]", buf, 0x2Au);

    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__SBActivitySystemApertureElementObserver__swapActivityItem_withItem___block_invoke;
    v16[3] = &unk_1E8EAB700;
    objc_copyWeak(&v19, (id *)buf);
    v17 = v8;
    v18 = v6;
    -[SBActivitySystemApertureElementObserver _invalidateSystemApertureElementForItem:completion:](self, "_invalidateSystemApertureElementForItem:completion:", v17, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

void __70__SBActivitySystemApertureElementObserver__swapActivityItem_withItem___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  objc_copyWeak(&v6, a1 + 6);
  v4 = a1[4];
  v5 = a1[5];
  BSDispatchMain();

  objc_destroyWeak(&v6);
}

void __70__SBActivitySystemApertureElementObserver__swapActivityItem_withItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_removeSystemApertureSceneHandleWithItem:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_createAndActivateElementForActivityItem:completion:", *(_QWORD *)(a1 + 40), 0);
    WeakRetained = v3;
  }

}

- (BOOL)_activityAlertIsPendingForIdentifier:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_pendingAlerts;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "item", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_activityIsPendingForIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
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
  v5 = self->_pendingItems;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "identifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_addPendingItemIfNecessary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_pendingItems, "containsObject:", v4) & 1) == 0)
  {
    SBLogActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] added to pending activities", (uint8_t *)&v7, 0xCu);

    }
    -[NSMutableArray addObject:](self->_pendingItems, "addObject:", v4);
  }

}

- (void)_updatePendingItemWithItem:(id)a3
{
  id v4;
  NSMutableArray *pendingItems;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -1;
  pendingItems = self->_pendingItems;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __70__SBActivitySystemApertureElementObserver__updatePendingItemWithItem___block_invoke;
  v11 = &unk_1E8EAB728;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  -[NSMutableArray enumerateObjectsUsingBlock:](pendingItems, "enumerateObjectsUsingBlock:", &v8);
  v7 = v15[3];
  if (v7 == -1)
    -[SBActivitySystemApertureElementObserver _addPendingItemIfNecessary:](self, "_addPendingItemIfNecessary:", v6, v8, v9, v10, v11);
  else
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_pendingItems, "replaceObjectAtIndex:withObject:", v7, v6, v8, v9, v10, v11);

  _Block_object_dispose(&v14, 8);
}

void __70__SBActivitySystemApertureElementObserver__updatePendingItemWithItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_removePendingItem:(id)a3 withPendingAlerts:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableOrderedSet *pendingAlerts;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSMutableArray containsObject:](self->_pendingItems, "containsObject:", v6))
  {
    -[NSMutableArray removeObject:](self->_pendingItems, "removeObject:", v6);
    if (v4)
    {
      pendingAlerts = self->_pendingAlerts;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __80__SBActivitySystemApertureElementObserver__removePendingItem_withPendingAlerts___block_invoke;
      v14[3] = &unk_1E8EAB750;
      v8 = v6;
      v15 = v8;
      -[NSMutableOrderedSet bs_firstObjectPassingTest:](pendingAlerts, "bs_firstObjectPassingTest:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        SBLogActivity();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v17 = v11;
          _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] removed from pending alert for this item", buf, 0xCu);

        }
        -[NSMutableOrderedSet removeObject:](self->_pendingAlerts, "removeObject:", v9);
      }

    }
    SBLogActivity();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] removed from pending activities", buf, 0xCu);

    }
  }

}

BOOL __80__SBActivitySystemApertureElementObserver__removePendingItem_withPendingAlerts___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 == v5;

  return v6;
}

- (id)_createSystemApertureSceneHandleWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_sceneHandleByActivityIdentifier, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("[ActivityID: %@] Active system aperture scene handle found while creating a new system aperture scene handle"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBActivitySystemApertureElementObserver _createSceneHandle:](self, "_createSceneHandle:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBActivitySystemApertureElementObserver _storeSceneHandle:item:](self, "_storeSceneHandle:item:", v8, v4);
  }

  return v8;
}

- (id)_createSceneHandle:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  SBLogActivity();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Creating a system aperture scene handle", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v3, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAC5E8], "defaultMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF5480]), "initWithDescriptor:metricsRequest:", v6, v7);

  return v8;
}

- (void)_storeSceneHandle:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableSet *activeWidgetActivitiesWithSceneHandles;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogActivity();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Storing scene handle", (uint8_t *)&v16, 0xCu);

  }
  if (v6)
  {
    objc_msgSend(v7, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKey:](self->_sceneHandleByActivityIdentifier, "setObject:forKey:", v6, v11);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeItemByActivityIdentifier, "setObject:forKeyedSubscript:", v7, v11);
    if (!objc_msgSend(v10, "contentType"))
    {
      activeWidgetActivitiesWithSceneHandles = self->_activeWidgetActivitiesWithSceneHandles;
      objc_msgSend(v10, "activityIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](activeWidgetActivitiesWithSceneHandles, "addObject:", v13);

    }
    SBLogActivity();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Scene handle stored successfully", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (void)_removeSystemApertureSceneHandleWithItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSMutableOrderedSet *pendingAlerts;
  id v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  NSMutableSet *activeWidgetActivitiesWithSceneHandles;
  void *v15;
  NSMutableSet *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v18 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v18, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_sceneHandleByActivityIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_activeItemByActivityIdentifier, "removeObjectForKey:", v5);
  if (v6)
  {
    objc_msgSend(v6, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_sceneHandleByActivityIdentifier, "removeObjectForKey:", v5);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_contentPayloadIDsByActivityIdentifier, "removeObjectForKey:", v5, v18);
  objc_msgSend(v19, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBActivitySystemApertureElementObserver _isActivityOngoing:](self, "_isActivityOngoing:", v7);

  if (v8)
    -[SBActivitySystemApertureElementObserver _addPendingItemIfNecessary:](self, "_addPendingItemIfNecessary:", v19);
  else
    -[SBActivitySystemApertureElementObserver _removePendingItem:withPendingAlerts:](self, "_removePendingItem:withPendingAlerts:", v19, 1);
  pendingAlerts = self->_pendingAlerts;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__SBActivitySystemApertureElementObserver__removeSystemApertureSceneHandleWithItem___block_invoke;
  v20[3] = &unk_1E8EAB778;
  v10 = v5;
  v21 = v10;
  v11 = -[NSMutableOrderedSet indexOfObjectPassingTest:](pendingAlerts, "indexOfObjectPassingTest:", v20);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v11;
    v13 = -[NSMutableOrderedSet count](self->_pendingAlerts, "count") <= v11 || v8;
    if ((v13 & 1) == 0)
      -[NSMutableOrderedSet removeObjectAtIndex:](self->_pendingAlerts, "removeObjectAtIndex:", v12);
  }
  activeWidgetActivitiesWithSceneHandles = self->_activeWidgetActivitiesWithSceneHandles;
  objc_msgSend(v4, "activityIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(activeWidgetActivitiesWithSceneHandles) = -[NSMutableSet containsObject:](activeWidgetActivitiesWithSceneHandles, "containsObject:", v15);

  if ((_DWORD)activeWidgetActivitiesWithSceneHandles)
  {
    v16 = self->_activeWidgetActivitiesWithSceneHandles;
    objc_msgSend(v4, "activityIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](v16, "removeObject:", v17);

  }
}

uint64_t __84__SBActivitySystemApertureElementObserver__removeSystemApertureSceneHandleWithItem___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  unsigned int v7;

  objc_msgSend(a2, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (a3)
    return v7;
  else
    return 0;
}

- (void)_updateSystemApertureElementProminence:(BOOL)a3 item:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  SBActivityAlert *v14;
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && self->_activityEnvironment == 1)
  {
    SBLogActivity();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Environment is ambient, system aperture element can't become prominent", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_prominenceStateByActivityIdentifier, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject BOOLValue](v8, "BOOLValue");
    SBLogActivity();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v7;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Prominence state update: %@, current prominence state: %@", (uint8_t *)&v17, 0x20u);

    }
    if (v9 != v4)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v4);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prominenceStateByActivityIdentifier, "setObject:forKeyedSubscript:", v13, v7);

      v14 = -[SBActivityAlert initWithItem:payloadIdentifier:options:title:body:]([SBActivityAlert alloc], "initWithItem:payloadIdentifier:options:title:body:", v6, 0, 0, 0, 0);
      -[SBActivityAlert setProminent:](v14, "setProminent:", 1);
      SBLogActivity();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v16)
        {
          v17 = 138543362;
          v18 = v7;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Presenting a prominent alert", (uint8_t *)&v17, 0xCu);
        }

        -[SBActivitySystemApertureElementObserver presentAlert:](self, "presentAlert:", v14);
      }
      else
      {
        if (v16)
        {
          v17 = 138543362;
          v18 = v7;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Dismissing a prominent alert", (uint8_t *)&v17, 0xCu);
        }

        -[SBActivitySystemApertureElementObserver dismissAlert:](self, "dismissAlert:", v14);
      }

    }
  }

}

- (void)_createAndActivateSystemApertureElementWithScene:(id)a3 item:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  SBSystemApertureSceneElement *v14;
  void (**v15)(id, _QWORD);
  SBActivitySystemApertureElementObserver *v16;
  SBSystemApertureSceneElement *v17;
  SBSystemApertureSceneElementConfiguration *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  SBSystemApertureSceneElementConfiguration *v42;
  id v43;
  id v44;
  id v45;
  id location;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  void (**v51)(id, _QWORD);
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  uint8_t buf[4];
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v35 = v8;
  objc_msgSend(v8, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_elementByActivityIdentifier, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    SBLogActivity();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SBActivitySystemApertureElementObserver _createAndActivateSystemApertureElementWithScene:item:completion:].cold.1();

    if (v9)
      v9[2](v9, 0);
  }
  else
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke;
    v55[3] = &unk_1E8EA3510;
    v31 = v36;
    v56 = v31;
    v34 = (void *)MEMORY[0x1D17E5550](v55);
    +[SBSystemApertureSceneElement activePlaceholderElementPassingTest:](SBSystemApertureSceneElement, "activePlaceholderElementPassingTest:", v34);
    v14 = (SBSystemApertureSceneElement *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_2;
    v52[3] = &unk_1E8EAB7A0;
    v33 = v11;
    v53 = v33;
    v15 = v9;
    v54 = v15;
    v32 = (void *)MEMORY[0x1D17E5550](v52);
    if (!v14)
    {
      v16 = self;
      v17 = [SBSystemApertureSceneElement alloc];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_3;
      v47[3] = &unk_1E8EAB7F0;
      v47[4] = v16;
      v48 = v33;
      v49 = v29;
      v50 = v32;
      v51 = v15;
      v14 = -[SBSystemApertureSceneElement initWithScene:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:](v17, "initWithScene:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:", v31, v49, v47);

    }
    v18 = objc_alloc_init(SBSystemApertureSceneElementConfiguration);
    -[SBSystemApertureSceneElementConfiguration setAllowsSceneReactivation:](v18, "setAllowsSceneReactivation:", 1);
    if (!objc_msgSend(v10, "contentType"))
    {
      objc_msgSend(MEMORY[0x1E0DAC5E8], "defaultMetrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "systemApertureMetrics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "expandedMetricsRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "heightRequest");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "maximum");
      -[SBSystemApertureSceneElementConfiguration setMaximumHeight:](v18, "setMaximumHeight:");

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elementByActivityIdentifier, "setObject:forKeyedSubscript:", v14, v33, v29);
    v23 = -[SBSystemApertureSceneElement isActivated](v14, "isActivated");
    SBLogActivity();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138543362;
        v58 = v33;
        _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Update System Aperture element with connected scene", buf, 0xCu);
      }

      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_55;
      v37[3] = &unk_1E8EAB818;
      v37[4] = self;
      v38 = v32;
      -[SBSystemApertureSceneElement updateWithConnectedScene:configuration:elementAssertionAcquisitionHandler:](v14, "updateWithConnectedScene:configuration:elementAssertionAcquisitionHandler:", v31, v18, v37);

    }
    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 138543362;
        v58 = v33;
        _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] System Aperture element is not activated. Activating...", buf, 0xCu);
      }

      -[SBSystemApertureSceneElement setConfiguration:](v14, "setConfiguration:", v18);
      objc_msgSend(v31, "clientHandle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (v27)
      {
        SBLogActivity();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v58 = v33;
          _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Activating System Aperture element with deferred check for existing placeholder", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v14);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_52;
        v39[3] = &unk_1E8EAB840;
        objc_copyWeak(&v44, (id *)buf);
        v40 = v33;
        v41 = v31;
        v42 = v18;
        v43 = v32;
        objc_copyWeak(&v45, &location);
        -[SBSystemApertureSceneElement activateWithPostActivationPlaceholderTest:foundPlaceholderHandler:](v14, "activateWithPostActivationPlaceholderTest:foundPlaceholderHandler:", v34, v39);
        objc_destroyWeak(&v45);

        objc_destroyWeak(&v44);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        -[SBSystemApertureSceneElement activate](v14, "activate");
      }
    }

  }
}

uint64_t __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "SBUISA_elementIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)*MEMORY[0x1E0DAC958];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  objc_msgSend(v3, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v11))
  {
    objc_msgSend(v3, "elementIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_2(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;

  v5 = (void *)a2[2];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a3, v6);
  objc_msgSend(v7, "_presentPendingAlertIfNecessaryForActivityIdentifier:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v8 = a1[8];
  v4 = v3;
  BSDispatchMain();

}

void __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2 && *(_BYTE *)(a1 + 80))
  {
    SBLogActivity();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] System aperture element is ready for presentation", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "registerElement:", *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    SBLogActivity();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] System aperture element is NOT yet ready for presentation", (uint8_t *)&v9, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 72);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }

}

void __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    SBLogActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v17 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Placeholder System Aperture element found, updating it with connected scene", buf, 0xCu);
    }

    objc_msgSend(WeakRetained[3], "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_53;
    v13 = &unk_1E8EAB818;
    v15 = *(id *)(a1 + 56);
    v14 = WeakRetained;
    objc_msgSend(v3, "updateWithConnectedScene:configuration:elementAssertionAcquisitionHandler:", v7, v8, &v10);
    v9 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v9, "deactivateWhenRemovedWithHandler:", 0, v10, v11, v12, v13);

  }
}

uint64_t __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_53(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

uint64_t __108__SBActivitySystemApertureElementObserver__createAndActivateSystemApertureElementWithScene_item_completion___block_invoke_55(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)_invalidateSystemApertureElementForItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  id v17;
  void (**v18)(_QWORD, _QWORD);
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(_QWORD, _QWORD);
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  SBActivitySystemApertureElementObserver *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogActivity();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v9;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Invalidating system aperture element", buf, 0xCu);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_elementAssertionByActivityIdentifier, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_elementByActivityIdentifier, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke;
  v25[3] = &unk_1E8E9E270;
  v14 = v11;
  v26 = v14;
  v15 = v9;
  v27 = v15;
  v28 = self;
  v16 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v25);
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_2;
  v23[3] = &unk_1E8EAB868;
  v17 = v7;
  v24 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v23);
  if (objc_msgSend(v12, "isDeactivating"))
  {
    SBLogActivity();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v15;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Invalidating system aperture element - already deactivated", buf, 0xCu);
    }

  }
  else
  {
    if (objc_msgSend(v12, "isActivated") && (objc_msgSend(v12, "isDeactivating") & 1) == 0)
    {
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_58;
      v20[3] = &unk_1E8EAB890;
      v21 = v15;
      v22 = v18;
      objc_msgSend(v12, "deactivateWhenRemovedWithHandler:", v20);
      v16[2](v16);

      goto LABEL_11;
    }
    -[SBActivitySystemApertureElementObserver _removeSystemApertureSceneHandleWithItem:](self, "_removeSystemApertureSceneHandleWithItem:", v6);
    -[SBActivitySystemApertureElementObserver _registerSystemApertureElementForPendingActivityIfNecessary](self, "_registerSystemApertureElementForPendingActivityIfNecessary");
  }
  v16[2](v16);
  ((void (**)(_QWORD, void *))v18)[2](v18, v12);
LABEL_11:

}

uint64_t __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[4];
  if (v2 && objc_msgSend(v2, "isValid"))
  {
    v3 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ActivityID: %@] ended"), a1[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateWithReason:", v4);

  }
  objc_msgSend(*(id *)(a1[6] + 16), "removeObjectForKey:", a1[5]);
  objc_msgSend(*(id *)(a1[6] + 24), "removeObjectForKey:", a1[5]);
  return objc_msgSend(*(id *)(a1[6] + 48), "removeObjectForKey:", a1[5]);
}

uint64_t __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_58(uint64_t a1, void *a2)
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
  block[2] = __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_2_59;
  block[3] = &unk_1E8EA7D10;
  v7 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __94__SBActivitySystemApertureElementObserver__invalidateSystemApertureElementForItem_completion___block_invoke_2_59(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogActivity();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Element deactivated", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_sendAnalyticsEventWithPayloadBuilder:(id)a3
{
  AnalyticsSendEventLazy();
}

- (void)_unlockAndLaunchAppIfPossible:(id)a3 withAction:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  id v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "platterTargetBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_elementByActivityIdentifier, "objectForKeyedSubscript:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && (-[NSObject isActivated](v10, "isActivated") & 1) != 0)
    {
      if (-[NSObject layoutMode](v11, "layoutMode") <= 0)
      {
        SBLogActivity();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          -[SBActivitySystemApertureElementObserver _unlockAndLaunchAppIfPossible:withAction:].cold.3();
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0D23158];
        v26[0] = *MEMORY[0x1E0D22CE0];
        if (v6)
        {
          v25 = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = (void *)MEMORY[0x1E0C9AA60];
        }
        v15 = *MEMORY[0x1E0D22D58];
        v26[1] = *MEMORY[0x1E0D22D88];
        v26[2] = v15;
        v26[3] = *MEMORY[0x1E0D22DA8];
        v27[0] = v13;
        v27[1] = MEMORY[0x1E0C9AAB0];
        v27[2] = *MEMORY[0x1E0DAB820];
        v27[3] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "optionsWithDictionary:", v16);
        v14 = objc_claimAutoreleasedReturnValue();

        if (v6)
        SBLogActivity();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543619;
          v22 = v8;
          v23 = 2113;
          v24 = v6;
          _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Sending open application request for %{private}@", buf, 0x16u);
        }

        SBSCreateOpenApplicationService();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __84__SBActivitySystemApertureElementObserver__unlockAndLaunchAppIfPossible_withAction___block_invoke;
        v19[3] = &unk_1E8EAB8B8;
        v20 = v8;
        objc_msgSend(v18, "openApplication:withOptions:completion:", v9, v14, v19);

      }
    }
    else
    {
      SBLogActivity();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[SBActivitySystemApertureElementObserver _unlockAndLaunchAppIfPossible:withAction:].cold.2();
    }

  }
  else
  {
    SBLogActivity();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[SBActivitySystemApertureElementObserver _unlockAndLaunchAppIfPossible:withAction:].cold.1();
  }

}

void __84__SBActivitySystemApertureElementObserver__unlockAndLaunchAppIfPossible_withAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogActivity();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __84__SBActivitySystemApertureElementObserver__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(a1, (uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Open application succeeded.", (uint8_t *)&v8, 0xCu);
  }

}

- (void)activitySystemApertureSceneHandle:(id)a3 updatedContentPayloadID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  SBActivitySystemApertureElementObserver *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__SBActivitySystemApertureElementObserver_activitySystemApertureSceneHandle_updatedContentPayloadID___block_invoke;
  block[3] = &unk_1E8E9E270;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __101__SBActivitySystemApertureElementObserver_activitySystemApertureSceneHandle_updatedContentPayloadID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 40);
  SBLogActivity();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v11 = v3;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Updated payload ID received: %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "objectForKeyedSubscript:", v3);
    v8 = objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v8)
    {
      -[NSObject addObject:](v8, "addObject:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", *(_QWORD *)(a1 + 40), 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "setObject:forKeyedSubscript:", v9, v3);

    }
    objc_msgSend(*(id *)(a1 + 48), "_presentPendingAlertIfNecessaryForActivityIdentifier:", v3);
  }
  else if (v6)
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] No payload ID received.", buf, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertingAssertionsByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_ongoingActivities, 0);
  objc_storeStrong((id *)&self->_pendingAlerts, 0);
  objc_storeStrong((id *)&self->_activeWidgetActivitiesWithSceneHandles, 0);
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_prominenceStateByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_contentPayloadIDsByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_activeItemByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_elementByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_elementAssertionByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneHandleByActivityIdentifier, 0);
}

- (void)_createAndActivateElementForActivityItem:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[ActivityID: %{public}@] Activity system aperture scene cannot be created.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_createAndActivateElementForActivityItem:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[ActivityID: %{public}@] System aperture scene handle is already present, not creating new one", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __95__SBActivitySystemApertureElementObserver__createAndActivateElementForActivityItem_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "[ActivityID: %{public}@] Error creating system aperture element", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_presentAlert:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, v6, "[ActivityID: %{public}@] alerting assertion cannot be requested for element %@", (uint8_t *)&v7);

}

- (void)_canPresentAlert:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[ActivityID: %{public}@] No element found for alerting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_createAndActivateSystemApertureElementWithScene:item:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[ActivityID: %{public}@] System aperture element already present, not creating new one", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_unlockAndLaunchAppIfPossible:withAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_9(&dword_1D0540000, v0, v1, "[ActivityID: %{public}@] Unable to resolve container bundle identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_unlockAndLaunchAppIfPossible:withAction:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_9(&dword_1D0540000, v0, v1, "[ActivityID: %{public}@] No active element found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_unlockAndLaunchAppIfPossible:withAction:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_9(&dword_1D0540000, v0, v1, "[ActivityID: %{public}@] Active element is not visible", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __84__SBActivitySystemApertureElementObserver__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, (uint64_t)a3, "[ActivityID: %{public}@] Open application failed: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

@end
