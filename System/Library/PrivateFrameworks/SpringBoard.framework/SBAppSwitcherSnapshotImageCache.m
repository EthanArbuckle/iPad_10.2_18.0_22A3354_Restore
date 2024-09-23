@implementation SBAppSwitcherSnapshotImageCache

- (void)setCachableAppLayouts:(id)a3
{
  id v4;
  NSObject *controlQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  BSDispatchQueueAssertMain();
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SBAppSwitcherSnapshotImageCache_setCachableAppLayouts___block_invoke;
  block[3] = &unk_1E8E9E820;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(controlQueue, block);

}

- (void)setFullSizeCachableAppLayouts:(id)a3
{
  id v4;
  NSObject *controlQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  BSDispatchQueueAssertMain();
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SBAppSwitcherSnapshotImageCache_setFullSizeCachableAppLayouts___block_invoke;
  block[3] = &unk_1E8E9E820;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(controlQueue, block);

}

uint64_t __57__SBAppSwitcherSnapshotImageCache_setCachableAppLayouts___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  v2 = (id *)(a1 + 32);
  result = BSEqualArrays();
  if ((result & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v4;

    SBLogSwitcherSnapshotCache();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __57__SBAppSwitcherSnapshotImageCache_setCachableAppLayouts___block_invoke_cold_1();

    return objc_msgSend(*v2, "_updateCache");
  }
  return result;
}

uint64_t __65__SBAppSwitcherSnapshotImageCache_setFullSizeCachableAppLayouts___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  v2 = (id *)(a1 + 32);
  result = BSEqualArrays();
  if ((result & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = v4;

    SBLogSwitcherSnapshotCache();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __65__SBAppSwitcherSnapshotImageCache_setFullSizeCachableAppLayouts___block_invoke_cold_1();

    return objc_msgSend(*v2, "_updateCache");
  }
  return result;
}

uint64_t __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "containsObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_addObserver:forDisplayItem:inAppLayout:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)_addObserver:(id)a3 forDisplayItem:(id)a4 inAppLayout:(id)a5
{
  id v8;
  id v9;
  _SBAppSwitcherSnapshotCacheKey *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  v9 = a4;
  BSDispatchQueueAssert();
  v10 = -[_SBAppSwitcherSnapshotCacheKey initWithDisplayItem:inAppLayout:]([_SBAppSwitcherSnapshotCacheKey alloc], "initWithDisplayItem:inAppLayout:", v9, v8);

  -[NSMutableDictionary objectForKey:](self->_cacheEntryUpdateObservers, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_cacheEntryUpdateObservers, "setObject:forKey:", v11, v10);
  }
  objc_msgSend(v11, "addObject:", v12);

}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  NSObject *controlQueue;
  _QWORD v9[8];
  _QWORD v10[3];
  char v11;

  BSDispatchQueueAssertMain();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 1;
  controlQueue = self->_controlQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke;
  v9[3] = &unk_1E8EA2580;
  v9[5] = v10;
  v9[6] = a3;
  v9[4] = self;
  *(double *)&v9[7] = a4;
  dispatch_sync(controlQueue, v9);
  _Block_object_dispose(v10, 8);
}

- (void)_enqueueNextSnapshotRequestIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] enqueue snapshot request load if necessary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_enqueueSnapshotRequestsForCachableAppLayouts:(id)a3 forFullSizeSnapshots:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _SBAppSwitcherSnapshotCacheKey *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  _QWORD block[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  BOOL v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke_2;
  v32[3] = &unk_1E8EB6838;
  v32[4] = self;
  v33 = &__block_literal_global_253;
  v34 = v4;
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsAtIndexes:", v7);
  if (objc_msgSend(v6, "count"))
  {
    v18 = v7;
    v19 = v6;
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v8, "allItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v9)
    {
      v10 = v9;
      v21 = *(_QWORD *)v29;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11);
          v13 = -[_SBAppSwitcherSnapshotCacheKey initWithDisplayItem:inAppLayout:]([_SBAppSwitcherSnapshotCacheKey alloc], "initWithDisplayItem:inAppLayout:", v12, v8);
          -[NSMutableDictionary objectForKey:](self->_cachedSnapshots, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke((uint64_t)v14, v14, v4);

          if ((v15 & 1) == 0)
          {
            -[SBAppSwitcherSnapshotImageCache _createSnapshotRequestWithDisplayItem:inAppLayout:forFullSizeSnapshot:](self, "_createSnapshotRequestWithDisplayItem:inAppLayout:forFullSizeSnapshot:", v12, v8, v4);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak(&location, self);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke_3;
            block[3] = &unk_1E8EB51F0;
            objc_copyWeak(&v26, &location);
            v23 = v16;
            v24 = v12;
            v25 = v8;
            v17 = v16;
            dispatch_async(MEMORY[0x1E0C80D38], block);

            objc_destroyWeak(&v26);
            objc_destroyWeak(&location);
          }

          ++v11;
        }
        while (v10 != v11);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v10);
    }

    v7 = v18;
    v6 = v19;
  }

}

- (id)_cachableAppLayoutsRequiringFullSizeSnapshots
{
  NSArray *queue_fullSizeCachableAppLayouts;
  _QWORD v5[5];

  BSDispatchQueueAssert();
  queue_fullSizeCachableAppLayouts = self->_queue_fullSizeCachableAppLayouts;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__SBAppSwitcherSnapshotImageCache__cachableAppLayoutsRequiringFullSizeSnapshots__block_invoke;
  v5[3] = &unk_1E8E9DF78;
  v5[4] = self;
  -[NSArray bs_filter:](queue_fullSizeCachableAppLayouts, "bs_filter:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if ((unint64_t)(v3 - 1) >= 2)
    {
      if (((v3 - 3) | (v2 - 3)) >= 2)
        goto LABEL_7;
    }
    else if (v2 > 2)
    {
      goto LABEL_7;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
LABEL_7:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    SBLogSwitcherSnapshotCache();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_cold_1();

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_purgeAllSnapshots");
    objc_msgSend(*(id *)(a1 + 32), "_purgeAllSnapshotRequests");
    objc_initWeak(&location, *(id *)(a1 + 32));
    v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_227;
    v7[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v8, &location);
    dispatch_after(v5, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_purgeAllSnapshots
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] purge all cached snapshots", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_purgeAllSnapshotRequests
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] purge all snapshot requests", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)addSnapshotUpdateObserver:(id)a3 forDisplayItem:(id)a4 inAppLayout:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *controlQueue;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _SBAppSwitcherSnapshotCacheKey *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  NSObject *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD block[5];
  id v40;
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  BSDispatchQueueAssertMain();
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherSnapshotImageCache.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item != nil"));

    if (v11)
      goto LABEL_4;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherSnapshotImageCache.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout != nil"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherSnapshotImageCache.m"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

  if (!v10)
    goto LABEL_13;
LABEL_3:
  if (!v11)
    goto LABEL_14;
LABEL_4:
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  controlQueue = self->_controlQueue;
  v13 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke;
  block[3] = &unk_1E8EB66B8;
  v43 = &v44;
  block[4] = self;
  v14 = v11;
  v40 = v14;
  v15 = v9;
  v41 = v15;
  v16 = v10;
  v42 = v16;
  dispatch_sync(controlQueue, block);
  if (-[SBAppSwitcherSettings shouldSimplifyForOptions:](self->_settings, "shouldSimplifyForOptions:", 1)
    || !*((_BYTE *)v45 + 24))
  {
    SBLogSwitcherSnapshotCache();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[SBAppSwitcherSnapshotImageCache addSnapshotUpdateObserver:forDisplayItem:inAppLayout:].cold.1();
  }
  else
  {
    v17 = -[_SBAppSwitcherSnapshotCacheKey initWithDisplayItem:inAppLayout:]([_SBAppSwitcherSnapshotCacheKey alloc], "initWithDisplayItem:inAppLayout:", v16, v14);
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__85;
    v37 = __Block_byref_object_dispose__85;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v18 = self->_controlQueue;
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2;
    v23[3] = &unk_1E8EB66E0;
    v27 = &v33;
    v23[4] = self;
    v19 = v17;
    v24 = v19;
    v25 = v14;
    v26 = v16;
    v28 = &v29;
    dispatch_sync(v18, v23);
    if (*((_BYTE *)v30 + 24))
      objc_msgSend(v15, "didUpdateCacheEntry:", v34[5]);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);

  }
  _Block_object_dispose(&v44, 8);

}

- (id)_initWithDelegate:(id)a3 iconController:(id)a4 applicationController:(id)a5 orientationLockManager:(id)a6 settings:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBAppSwitcherSnapshotImageCache *v17;
  SBAppSwitcherSnapshotImageCache *v18;
  uint64_t v19;
  NSMutableDictionary *cachedSnapshots;
  uint64_t v21;
  NSMutableDictionary *cacheEntryUpdateObservers;
  uint64_t v23;
  NSMutableDictionary *snapshotRequestsCurrentlyBeingLoaded;
  uint64_t v25;
  OS_dispatch_queue *snapshotQueue;
  uint64_t Serial;
  OS_dispatch_queue *controlQueue;
  void *v30;
  id v31;
  objc_super v32;

  v13 = a3;
  v31 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  BSDispatchQueueAssertMain();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherSnapshotImageCache.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate != nil"));

  }
  v32.receiver = self;
  v32.super_class = (Class)SBAppSwitcherSnapshotImageCache;
  v17 = -[SBAppSwitcherSnapshotImageCache init](&v32, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_iconController, a4);
    objc_storeStrong((id *)&v18->_applicationController, a5);
    objc_storeStrong((id *)&v18->_orientationLockManager, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    cachedSnapshots = v18->_cachedSnapshots;
    v18->_cachedSnapshots = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    cacheEntryUpdateObservers = v18->_cacheEntryUpdateObservers;
    v18->_cacheEntryUpdateObservers = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    snapshotRequestsCurrentlyBeingLoaded = v18->_snapshotRequestsCurrentlyBeingLoaded;
    v18->_snapshotRequestsCurrentlyBeingLoaded = (NSMutableDictionary *)v23;

    v18->_lastKnownInterfaceOrientation = 0;
    v25 = BSDispatchQueueCreateWithQualityOfService();
    snapshotQueue = v18->_snapshotQueue;
    v18->_snapshotQueue = (OS_dispatch_queue *)v25;

    Serial = BSDispatchQueueCreateSerial();
    controlQueue = v18->_controlQueue;
    v18->_controlQueue = (OS_dispatch_queue *)Serial;

    objc_storeStrong((id *)&v18->_settings, a7);
    v18->_shouldPurgeNilEntries = 1;
    v18->_reloadsSnapshotsForActiveInterfaceOrientationChange = 1;
    -[SBAppSwitcherSnapshotImageCache setDelegate:](v18, "setDelegate:", v13);
  }

  return v18;
}

- (SBAppSwitcherSnapshotImageCache)initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBAppSwitcherSnapshotImageCache *v9;

  v4 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBAppSwitcherSnapshotImageCache _initWithDelegate:iconController:applicationController:orientationLockManager:settings:](self, "_initWithDelegate:iconController:applicationController:orientationLockManager:settings:", v4, v5, v6, v7, v8);

  return v9;
}

- (SBAppSwitcherSnapshotImageCache)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBAppSwitcherSnapshotImageCache;
  -[SBAppSwitcherSnapshotImageCache dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_storeWeak((id *)&self->_delegate, v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__snapshotChanged_, CFSTR("SBApplicationSnapshotChangedNotification"), 0);
    objc_msgSend((id)SBApp, "addActiveOrientationObserver:", self);
  }
  else
  {
    objc_msgSend(v5, "removeObserver:", self);
    objc_msgSend((id)SBApp, "removeActiveOrientationObserver:", self);
  }

}

- (void)setDebugName:(id)a3
{
  id v5;
  void *v6;
  BSInvalidatable *v7;
  BSInvalidatable *stateCaptureInvalidatable;
  id v9;
  id location;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_debugName, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_debugName, a3);
    -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
    if (v5)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpringBoard - FluidSwitcher Snapshot Cache - %@"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_copyWeak(&v9, &location);
      BSLogAddStateCaptureBlockWithTitle();
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
      self->_stateCaptureInvalidatable = v7;

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }

}

id __48__SBAppSwitcherSnapshotImageCache_setDebugName___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id *v23;
  id obj;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _BYTE v37[128];
  uint64_t v38;
  NSSize v39;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = WeakRetained;
    v2 = WeakRetained[3];
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v2;
    objc_msgSend(v2, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v28)
    {
      v25 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v26, "objectForKey:", v23);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "snapshot");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "userInterfaceStyle");

          v7 = CFSTR("Light");
          if (v6 == 2)
            v7 = CFSTR("Dark");
          if (!v6)
            v7 = CFSTR("Unspecified");
          v35[0] = CFSTR("size");
          v29 = v7;
          objc_msgSend(v4, "snapshot");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "naturalSize");
          NSStringFromSize(v39);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = v9;
          v35[1] = CFSTR("orientation");
          objc_msgSend(v4, "snapshot");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "interfaceOrientation");
          SBFStringForBSInterfaceOrientation();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v36[1] = v11;
          v36[2] = v29;
          v35[2] = CFSTR("userInterfaceStyle");
          v35[3] = CFSTR("fromFullSizeRequest");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "fromFullSizeSnapshotRequest"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v36[3] = v12;
          v35[4] = CFSTR("path");
          objc_msgSend(v4, "snapshot");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "path");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          v16 = CFSTR("n/a");
          if (v14)
            v16 = (const __CFString *)v14;
          v36[4] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "displayItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "type") && objc_msgSend(v18, "type") != 5)
          {
            objc_msgSend(v18, "bundleIdentifier");
            v19 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v18, "uniqueIdentifier");
            v19 = objc_claimAutoreleasedReturnValue();
          }
          v20 = (void *)v19;
          objc_msgSend(v27, "setObject:forKey:", v17, v19);

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v28);
    }

    objc_msgSend(v27, "description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v23;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)setReloadsSnapshotsForActiveInterfaceOrientationChange:(BOOL)a3
{
  if (self->_reloadsSnapshotsForActiveInterfaceOrientationChange != a3)
  {
    self->_reloadsSnapshotsForActiveInterfaceOrientationChange = a3;
    -[SBAppSwitcherSnapshotImageCache _updateActiveOrientationObservingIfNeeded](self, "_updateActiveOrientationObservingIfNeeded");
  }
}

- (NSArray)cachableAppLayouts
{
  NSObject *controlQueue;
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
  v10 = __Block_byref_object_copy__85;
  v11 = __Block_byref_object_dispose__85;
  v12 = 0;
  controlQueue = self->_controlQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SBAppSwitcherSnapshotImageCache_cachableAppLayouts__block_invoke;
  v6[3] = &unk_1E8E9DFA0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(controlQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __53__SBAppSwitcherSnapshotImageCache_cachableAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)fullSizeCachableAppLayouts
{
  NSObject *controlQueue;
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
  v10 = __Block_byref_object_copy__85;
  v11 = __Block_byref_object_dispose__85;
  v12 = 0;
  controlQueue = self->_controlQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBAppSwitcherSnapshotImageCache_fullSizeCachableAppLayouts__block_invoke;
  v6[3] = &unk_1E8E9DFA0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(controlQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __61__SBAppSwitcherSnapshotImageCache_fullSizeCachableAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_updateCacheForDisplayItem:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *controlQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SBAppSwitcherSnapshotImageCache *v10;

  v4 = a3;
  BSDispatchQueueAssertMain();
  SBLogSwitcherSnapshotCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _updateCacheForDisplayItem:].cold.1();

  controlQueue = self->_controlQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SBAppSwitcherSnapshotImageCache__updateCacheForDisplayItem___block_invoke;
  v8[3] = &unk_1E8E9E820;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(controlQueue, v8);

}

uint64_t __62__SBAppSwitcherSnapshotImageCache__updateCacheForDisplayItem___block_invoke(uint64_t a1)
{
  NSObject *v2;

  SBLogSwitcherSnapshotCache();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__SBAppSwitcherSnapshotImageCache__updateCacheForDisplayItem___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "_purgeSnapshotRequestsForDisplayItem:withReason:", *(_QWORD *)(a1 + 32), CFSTR("Was requested to update cache for display item"));
  objc_msgSend(*(id *)(a1 + 40), "_setSnapshotNeedsUpdateForDisplayItem:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_enqueueNextSnapshotRequestIfNecessary");
}

void __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 40);
  if (v6)
  {
    objc_msgSend(v6, "appLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "displayItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 56));

      if (v9)
      {
        SBLogSwitcherSnapshotCache();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_2();

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        return;
      }
    }
    else
    {

    }
    SBLogSwitcherSnapshotCache();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_3();

    objc_msgSend(*(id *)(a1 + 32), "_purgeSnapshotsForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_enqueueNextSnapshotRequestIfNecessary");
  }
  else
  {
    SBLogSwitcherSnapshotCache();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_1();

  }
}

- (void)removeSnapshotObserver:(id)a3
{
  id v5;
  NSObject *controlQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSwitcherSnapshotImageCache.m"), 382, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

  }
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SBAppSwitcherSnapshotImageCache_removeSnapshotObserver___block_invoke;
  block[3] = &unk_1E8E9E820;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(controlQueue, block);

}

void __58__SBAppSwitcherSnapshotImageCache_removeSnapshotObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__SBAppSwitcherSnapshotImageCache_removeSnapshotObserver___block_invoke_2;
  v15[3] = &unk_1E8EB6708;
  v16 = v3;
  v5 = v2;
  v17 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
    }
    while (v8);
  }

}

void __58__SBAppSwitcherSnapshotImageCache_removeSnapshotObserver___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "removeObject:", v5);
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherSnapshotImageCache cachableAppLayouts](self, "cachableAppLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("cachableAppLayouts"));

  -[SBAppSwitcherSnapshotImageCache fullSizeCachableAppLayouts](self, "fullSizeCachableAppLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("fullSizeCachableAppLayouts"));

  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_cachedSnapshots, CFSTR("cachedSnapshots"), 0);
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_snapshotRequestsCurrentlyBeingLoaded, CFSTR("displayItemsCurrentlyBeingLoaded"), 0);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)_representedApplicationSceneEntityForDisplayItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  SBApplicationController *applicationController;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  SBDeviceApplicationSceneEntity *v14;
  void *v15;
  objc_class *v17;
  void *v18;
  NSString *debugName;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  SBAppSwitcherSnapshotImageCache *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == 5)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "webApplication");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      v10 = 0;
      goto LABEL_7;
    }
    applicationController = self->_applicationController;
    objc_msgSend(v4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationController applicationWithBundleIdentifier:](applicationController, "applicationWithBundleIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

LABEL_7:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sceneHandleProviderForImageCache:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || !v10)
  {
    objc_msgSend(WeakRetained, "displayIdentityForImageCache:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:]([SBDeviceApplicationSceneEntity alloc], "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v10, v6, v12, v15);

  }
  else
  {
    SBLogSwitcherSnapshotCache();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      debugName = self->_debugName;
      objc_msgSend(v10, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413314;
      v22 = v18;
      v23 = 2048;
      v24 = self;
      v25 = 2114;
      v26 = debugName;
      v27 = 2114;
      v28 = v20;
      v29 = 2114;
      v30 = v4;
      _os_log_fault_impl(&dword_1D0540000, v13, OS_LOG_TYPE_FAULT, "[rdar://100644371 defensive fix] <%@ %p %{public}@> got nil sceneHandleProvider and non-nil application %{public}@ for displayItem %{public}@; returning nil to avoid a crash",
        (uint8_t *)&v21,
        0x34u);

    }
    v14 = 0;
  }

  return v14;
}

- (void)_setShouldPurgeNilEntry:(BOOL)a3
{
  NSObject *controlQueue;
  _QWORD v4[5];
  BOOL v5;

  controlQueue = self->_controlQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SBAppSwitcherSnapshotImageCache__setShouldPurgeNilEntry___block_invoke;
  v4[3] = &unk_1E8E9F508;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(controlQueue, v4);
}

uint64_t __59__SBAppSwitcherSnapshotImageCache__setShouldPurgeNilEntry___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 88) = *(_BYTE *)(result + 40);
  return result;
}

- (void)reloadSnapshotsForInterfaceStyleChange:(int64_t)a3
{
  NSObject *v5;
  NSObject *controlQueue;
  _QWORD v7[6];

  BSDispatchQueueAssertMain();
  SBLogSwitcherSnapshotCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache reloadSnapshotsForInterfaceStyleChange:].cold.1();

  controlQueue = self->_controlQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__SBAppSwitcherSnapshotImageCache_reloadSnapshotsForInterfaceStyleChange___block_invoke;
  v7[3] = &unk_1E8E9DE88;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(controlQueue, v7);
}

uint64_t __74__SBAppSwitcherSnapshotImageCache_reloadSnapshotsForInterfaceStyleChange___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_purgeAllSnapshots");
  objc_msgSend(*(id *)(a1 + 32), "_purgeAllSnapshotRequests");
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueNextSnapshotRequestIfNecessary");
}

- (void)_snapshotChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("SBApplicationSnapshotChangedSceneIdentifierUserInfoKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isWebApplication"))
    {
      +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:](SBDisplayItem, "webAppDisplayItemWithWebAppIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 0, v9, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    SBLogSwitcherSnapshotCache();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SBAppSwitcherSnapshotImageCache _snapshotChanged:].cold.1();

    -[SBAppSwitcherSnapshotImageCache _updateCacheForDisplayItem:](self, "_updateCacheForDisplayItem:", v8);
  }

}

- (void)_updateObserversForDisplayItem:(id)a3 inAppLayout:(id)a4 withCacheEntry:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _SBAppSwitcherSnapshotCacheKey *v12;
  NSObject *controlQueue;
  _SBAppSwitcherSnapshotCacheKey *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  _SBAppSwitcherSnapshotCacheKey *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  BSDispatchQueueAssertMain();
  SBLogSwitcherSnapshotCache();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _updateObserversForDisplayItem:inAppLayout:withCacheEntry:].cold.1();

  v12 = -[_SBAppSwitcherSnapshotCacheKey initWithDisplayItem:inAppLayout:]([_SBAppSwitcherSnapshotCacheKey alloc], "initWithDisplayItem:inAppLayout:", v8, v9);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__85;
  v30 = __Block_byref_object_dispose__85;
  v31 = 0;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__SBAppSwitcherSnapshotImageCache__updateObserversForDisplayItem_inAppLayout_withCacheEntry___block_invoke;
  block[3] = &unk_1E8E9FD30;
  v25 = &v26;
  block[4] = self;
  v14 = v12;
  v24 = v14;
  dispatch_sync(controlQueue, block);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15 = (id)v27[5];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "didUpdateCacheEntry:", v10, (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
    }
    while (v16);
  }

  _Block_object_dispose(&v26, 8);
}

void __93__SBAppSwitcherSnapshotImageCache__updateObserversForDisplayItem_inAppLayout_withCacheEntry___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_cacheSnapshotForRequest:(id)a3 withDisplayItem:(id)a4 inAppLayout:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *controlQueue;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *snapshotQueue;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;
  _QWORD block[5];
  id v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  BSDispatchQueueAssertMain();
  SBLogSwitcherSnapshotCache();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _cacheSnapshotForRequest:withDisplayItem:inAppLayout:].cold.4();

  objc_msgSend(v8, "appLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "cachedImageForInterfaceOrientation:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        controlQueue = self->_controlQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke;
        block[3] = &unk_1E8E9E270;
        block[4] = self;
        v30 = v15;
        v31 = v8;
        dispatch_sync(controlQueue, block);
        SBLogSwitcherSnapshotCache();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[SBAppSwitcherSnapshotImageCache _cacheSnapshotForRequest:withDisplayItem:inAppLayout:].cold.3();

      }
      else
      {
        objc_initWeak(&location, self);
        snapshotQueue = self->_snapshotQueue;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_216;
        v25[3] = &unk_1E8E9F280;
        objc_copyWeak(&v27, &location);
        v26 = v8;
        dispatch_async(snapshotQueue, v25);
        SBLogSwitcherSnapshotCache();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[SBAppSwitcherSnapshotImageCache _cacheSnapshotForRequest:withDisplayItem:inAppLayout:].cold.2();

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }

    }
    else
    {
      v19 = self->_controlQueue;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_217;
      v23[3] = &unk_1E8E9E820;
      v23[4] = self;
      v24 = v8;
      dispatch_sync(v19, v23);
      SBLogSwitcherSnapshotCache();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[SBAppSwitcherSnapshotImageCache _cacheSnapshotForRequest:withDisplayItem:inAppLayout:].cold.1();

    }
  }

}

uint64_t __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_snapshotImage:finishedLoadingForRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_216(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_asynchronouslyLoadSnapshotFromRequest:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

uint64_t __88__SBAppSwitcherSnapshotImageCache__cacheSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_217(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_snapshotImage:finishedLoadingForRequest:", 0, *(_QWORD *)(a1 + 40));
}

- (void)_loadSnapshotForRequest:(id)a3 withDisplayItem:(id)a4 inAppLayout:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *controlQueue;
  id v13;
  NSObject *WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  char v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  double v28;
  double v29;
  NSObject *v30;
  NSString *debugName;
  int v32;
  __CFString *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  _SBAppSwitcherSnapshotCacheKey *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  char v48;
  NSObject *v49;
  NSObject *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int64_t lastKnownUserInterfaceStyle;
  const __CFString *v59;
  __CFString *v60;
  NSObject *v61;
  char v62;
  char v63;
  void *v64;
  char v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSString *v69;
  int v70;
  void *v71;
  uint64_t v72;
  __CFString *v73;
  __CFString *v74;
  void *v75;
  char v76;
  _SBAppSwitcherSnapshotCacheKey *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __CFString *v83;
  void *v84;
  void *v85;
  _QWORD v86[5];
  id v87;
  id v88;
  _QWORD v89[5];
  id v90;
  _SBAppSwitcherSnapshotCacheKey *v91;
  _QWORD v92[5];
  id v93;
  id v94;
  _QWORD block[5];
  id v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  char v101;
  uint8_t buf[4];
  NSString *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  int v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  _BOOL4 v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  __CFString *v117;
  __int16 v118;
  __CFString *v119;
  __int16 v120;
  _BOOL4 v121;
  uint64_t v122;
  NSSize v123;

  v122 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  BSDispatchQueueAssertMain();
  SBLogSwitcherSnapshotCache();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _loadSnapshotForRequest:withDisplayItem:inAppLayout:].cold.4();

  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 1;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke;
  block[3] = &unk_1E8E9FD30;
  v97 = &v98;
  block[4] = self;
  v13 = v8;
  v96 = v13;
  dispatch_sync(controlQueue, block);
  if (*((_BYTE *)v99 + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[SBAppSwitcherSnapshotImageCache _representedApplicationSceneEntityForDisplayItem:](self, "_representedApplicationSceneEntityForDisplayItem:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v81 = v15;
    if (!v15)
    {
      v27 = self->_controlQueue;
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_218;
      v92[3] = &unk_1E8E9E270;
      v92[4] = self;
      v93 = v9;
      v94 = v13;
      dispatch_sync(v27, v92);

LABEL_51:
      goto LABEL_52;
    }
    objc_msgSend(v15, "sceneHandle");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "application");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject displayIdentityForImageCache:](WeakRetained, "displayIdentityForImageCache:", self);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configurationForIdentity:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[SBAppSwitcherSnapshotImageCache _orientationForAppLayout:](self, "_orientationForAppLayout:", v10);
    v19 = objc_msgSend(v85, "_mainSceneSupportsInterfaceOrientation:", v18);
    if (v18)
      v20 = v19;
    else
      v20 = 0;
    if ((v20 & 1) == 0 || objc_msgSend(v84, "classicAppPhoneAppRunningOnPad"))
      v18 = objc_msgSend(v85, "activationInterfaceOrientationForOrientation:", v18);
    if (objc_msgSend(v84, "isClassic"))
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "displayConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "defaultLaunchingSizeForDisplayConfiguration:", v22);
      v24 = v23;
      v26 = v25;

    }
    else if (WeakRetained)
    {
      -[NSObject snapshotSizeForItemWithRole:inAppLayout:interfaceOrientation:inImageCache:](WeakRetained, "snapshotSizeForItemWithRole:inAppLayout:interfaceOrientation:inImageCache:", objc_msgSend(v10, "layoutRoleForItem:", v9), v10, v18, self);
      v24 = v28;
      v26 = v29;
    }
    else
    {
      SBLogSwitcherSnapshotCache();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        debugName = self->_debugName;
        *(_DWORD *)buf = 138543362;
        v103 = debugName;
        _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] failing to retrieve a snapshot due to nil delegate", buf, 0xCu);
      }

      v24 = *MEMORY[0x1E0C9D820];
      v26 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    v32 = objc_msgSend(v13, "loadFullSizeSnapshot");
    v33 = CFSTR("downscaled");
    if (v32)
      v33 = 0;
    v83 = v33;
    objc_msgSend(v85, "displayEdgeInfoForLayoutEnvironment:", objc_msgSend(v10, "environment"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v32;
    objc_msgSend(v79, "pointScale");
    v35 = v34;
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "appSwitcherDefaults");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "bestSnapshotWithImageName:sceneHandle:variantID:scale:referenceSize:requireExactSize:contentTypeMask:statusBarStateMask:launchingOrientation:contentOverridesContext:userInterfaceStyle:displayEdgeInfo:", CFSTR("SBSuspendSnapshot"), v85, v83, objc_msgSend(v37, "chamoisWindowingEnabled") ^ 1, -1, -5, v35, v24, v26, v18, 0, self->_lastKnownUserInterfaceStyle, v78);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = -[_SBAppSwitcherSnapshotCacheKey initWithDisplayItem:inAppLayout:]([_SBAppSwitcherSnapshotCacheKey alloc], "initWithDisplayItem:inAppLayout:", v9, v10);
    v77 = v39;
    if (!v38)
    {
      v66 = self->_controlQueue;
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_225;
      v86[3] = &unk_1E8E9E270;
      v86[4] = self;
      v87 = v9;
      v88 = v13;
      dispatch_sync(v66, v86);

LABEL_50:
      goto LABEL_51;
    }
    -[NSMutableDictionary objectForKey:](self->_cachedSnapshots, "objectForKey:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "snapshot");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v82, "variantID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "variantID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "isEqualToString:", v42) & 1) == 0)
    {
      objc_msgSend(v38, "variantID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "variantWithIdentifier:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44 == 0;

      if (v45)
        goto LABEL_28;
      objc_msgSend(v38, "variantID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "variantWithIdentifier:", v41);
      v42 = v82;
      v82 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_28:
    if (v82
      && (objc_msgSend(v82, "identifier"),
          v46 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v38, "identifier"),
          v47 = (void *)objc_claimAutoreleasedReturnValue(),
          v48 = objc_msgSend(v46, "isEqual:", v47),
          v47,
          v46,
          (v48 & 1) != 0))
    {
      v49 = self->_controlQueue;
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_224;
      v89[3] = &unk_1E8E9E270;
      v89[4] = self;
      v90 = v13;
      v91 = v77;
      dispatch_sync(v49, v89);

    }
    else
    {
      SBLogSwitcherSnapshotCache();
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG);

      if (v51)
      {
        v72 = objc_msgSend(v13, "sequenceID");
        objc_msgSend(v85, "application");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "bundleIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsSeparatedByString:", CFSTR("."));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "lastObject");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "uniqueIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "sceneIfExists");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v123.width = v24;
        v123.height = v26;
        NSStringFromSize(v123);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        lastKnownUserInterfaceStyle = self->_lastKnownUserInterfaceStyle;
        v59 = CFSTR("Light");
        if (lastKnownUserInterfaceStyle == 2)
          v59 = CFSTR("Dark");
        if (lastKnownUserInterfaceStyle)
          v60 = (__CFString *)v59;
        else
          v60 = CFSTR("Unspecified");
        v73 = v60;
        v74 = v83;
        SBLogSwitcherSnapshotCache();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v71 = v57;
          v69 = self->_debugName;
          v70 = objc_msgSend(v13, "loadFullSizeSnapshot");
          *(_DWORD *)buf = 138545666;
          v103 = v69;
          v104 = 2114;
          v105 = v75;
          v106 = 2048;
          v57 = v71;
          v107 = v72;
          v108 = 1024;
          v109 = v70;
          v110 = 2114;
          v111 = v55;
          v112 = 1024;
          v113 = v56 != 0;
          v114 = 2114;
          v115 = v71;
          v116 = 2114;
          v117 = v73;
          v118 = 2114;
          v119 = v74;
          v120 = 1024;
          v121 = v82 != 0;
          _os_log_debug_impl(&dword_1D0540000, v61, OS_LOG_TYPE_DEBUG, "\n|\n|— [%{public}@] [Loading] request for %{public}@:\n|\n|     sequence : %lu \n|   fullscreen : %{BOOL}u \n| itemUniqueID : %{public}@ \n|     hasScene : %{BOOL}u \n|         size : %{public}@ \n|        style : %{public}@ \n|      variant : %{public}@ \n|     hadEntry : %{BOOL}u \n|", buf, 0x5Au);
        }

      }
      objc_msgSend(v38, "contentType");
      v62 = XBApplicationSnapshotContentTypeMaskForContentType();
      if (v83
        && (v63 = v62,
            objc_msgSend(v38, "variantID"),
            v64 = (void *)objc_claimAutoreleasedReturnValue(),
            v65 = objc_msgSend(v64, "isEqualToString:", v83),
            v64,
            !(v76 & 1 | ((v63 & 6) == 0) | v65 & 1)))
      {
        SBLogSwitcherSnapshotCache();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          -[SBAppSwitcherSnapshotImageCache _loadSnapshotForRequest:withDisplayItem:inAppLayout:].cold.3();

        -[SBAppSwitcherSnapshotImageCache _createDownscaledVariantForRequest:snapshot:displayItem:sceneHandle:application:](self, "_createDownscaledVariantForRequest:snapshot:displayItem:sceneHandle:application:", v13, v38, v9, v85, v84);
        SBLogSwitcherSnapshotCache();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          -[SBAppSwitcherSnapshotImageCache _loadSnapshotForRequest:withDisplayItem:inAppLayout:].cold.2();

      }
      else
      {
        objc_msgSend(v13, "setSnapshot:", v38);
        -[SBAppSwitcherSnapshotImageCache _cacheSnapshotForRequest:withDisplayItem:inAppLayout:](self, "_cacheSnapshotForRequest:withDisplayItem:inAppLayout:", v13, v9, v10);
      }
    }

    goto LABEL_50;
  }
  SBLogSwitcherSnapshotCache();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _loadSnapshotForRequest:withDisplayItem:inAppLayout:].cold.1((uint64_t)self->_debugName, (uint64_t)buf, objc_msgSend(v13, "sequenceID"), WeakRetained);
LABEL_52:

  _Block_object_dispose(&v98, 8);
}

uint64_t __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isValidSnapshotRequest:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "_enqueueNextSnapshotRequestIfNecessary");
  return result;
}

uint64_t __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_218(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogSwitcherSnapshotCache();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got nil applicationSceneEntity for displayItem [%{public}@]; failing early",
      (uint8_t *)&v6,
      0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_snapshotImage:finishedLoadingForRequest:", 0, *(_QWORD *)(a1 + 48));
}

uint64_t __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_224(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;

  SBLogSwitcherSnapshotCache();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_224_cold_1(a1, v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fromFullSizeSnapshotRequest");

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "setLoadFullSizeSnapshot:", 1);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSnapshot:", v7);

  v8 = *(id **)(a1 + 32);
  objc_msgSend(v8[3], "objectForKey:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_snapshotImage:finishedLoadingForRequest:", v10, *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_enqueueNextSnapshotRequestIfNecessary");
}

uint64_t __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_225(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogSwitcherSnapshotCache();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] failed to retrieve a snapshot for display item [%{public}@]", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_snapshotImage:finishedLoadingForRequest:", 0, *(_QWORD *)(a1 + 48));
}

- (void)_createDownscaledVariantForRequest:(id)a3 snapshot:(id)a4 displayItem:(id)a5 sceneHandle:(id)a6 application:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  objc_msgSend(v12, "appLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "layoutRoleForItem:", v14);
  -[SBAppSwitcherSnapshotImageCache delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scaleForDownscaledSnapshotsForLayoutRole:inAppLayout:inImageCache:", v18, v17, self);
  v21 = v20;

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke;
  v25[3] = &unk_1E8EB6758;
  objc_copyWeak(&v29, &location);
  v22 = v12;
  v26 = v22;
  v23 = v13;
  v27 = v23;
  v24 = v14;
  v28 = v24;
  objc_msgSend(v16, "createDownscaledVariantForSnapshot:sceneHandle:scaleFactor:didSaveImage:", v23, v15, v25, v21);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke(id *a1, char a2)
{
  id *v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v4 = a1 + 7;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 7);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[2];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_2;
    v8[3] = &unk_1E8EB6730;
    v8[4] = WeakRetained;
    v9 = a1[4];
    v10 = a1[5];
    v13 = a2;
    objc_copyWeak(&v12, v4);
    v11 = a1[6];
    dispatch_sync(v7, v8);

    objc_destroyWeak(&v12);
  }

}

void __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_isValidSnapshotRequest:", *(_QWORD *)(a1 + 40)))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "isValid") && *(_BYTE *)(a1 + 72))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_3;
      v3[3] = &unk_1E8E9F280;
      objc_copyWeak(&v5, (id *)(a1 + 64));
      v4 = *(id *)(a1 + 56);
      dispatch_async(MEMORY[0x1E0C80D38], v3);

      objc_destroyWeak(&v5);
    }
    else
    {
      SBLogSwitcherSnapshotCache();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_2_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "_snapshotImage:finishedLoadingForRequest:", 0, *(_QWORD *)(a1 + 40));
    }
  }
}

void __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateCacheForDisplayItem:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_updateActiveOrientationObservingIfNeeded
{
  if (-[SBAppSwitcherSnapshotImageCache reloadsSnapshotsForActiveInterfaceOrientationChange](self, "reloadsSnapshotsForActiveInterfaceOrientationChange"))
  {
    objc_msgSend((id)SBApp, "addActiveOrientationObserver:", self);
  }
  else
  {
    objc_msgSend((id)SBApp, "removeActiveOrientationObserver:", self);
  }
}

void __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_227(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_enqueueNextSnapshotRequestIfNecessary");
    WeakRetained = v2;
  }

}

- (int64_t)_orientationForAppLayout:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[SBAppSwitcherSnapshotImageCache delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "orientationForSnapshotOfAppLayout:inImageCache:", v4, self);

  return v6;
}

- (void)_updateCache
{
  BSDispatchQueueAssert();
  -[SBAppSwitcherSnapshotImageCache _purgeLowPriorityFullSizeSnapshots](self, "_purgeLowPriorityFullSizeSnapshots");
  -[SBAppSwitcherSnapshotImageCache _purgeLowPriorityFullSizeSnapshotRequests](self, "_purgeLowPriorityFullSizeSnapshotRequests");
  -[SBAppSwitcherSnapshotImageCache _purgeLowPrioritySnapshots](self, "_purgeLowPrioritySnapshots");
  -[SBAppSwitcherSnapshotImageCache _purgeLowPrioritySnapshotRequests](self, "_purgeLowPrioritySnapshotRequests");
  -[SBAppSwitcherSnapshotImageCache _enqueueNextSnapshotRequestIfNecessary](self, "_enqueueNextSnapshotRequestIfNecessary");
}

- (void)_purgeSnapshotRequest:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *snapshotRequestsCurrentlyBeingLoaded;
  void *v10;
  NSString *debugName;
  int v12;
  NSString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  SBLogSwitcherSnapshotCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    debugName = self->_debugName;
    v12 = 138543874;
    v13 = debugName;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = objc_msgSend(v6, "sequenceID");
    _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "\n|\n|— [%{public}@] [Purging] [%{public}@] sequenceID: %lu\n|", (uint8_t *)&v12, 0x20u);
  }

  snapshotRequestsCurrentlyBeingLoaded = self->_snapshotRequestsCurrentlyBeingLoaded;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "sequenceID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](snapshotRequestsCurrentlyBeingLoaded, "removeObjectForKey:", v10);

}

- (void)_purgeSnapshotRequestsForDisplayItem:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *snapshotRequestsCurrentlyBeingLoaded;
  id v10;
  void *v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSString *debugName;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  SBLogSwitcherSnapshotCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _purgeSnapshotRequestsForDisplayItem:withReason:].cold.1();

  snapshotRequestsCurrentlyBeingLoaded = self->_snapshotRequestsCurrentlyBeingLoaded;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__SBAppSwitcherSnapshotImageCache__purgeSnapshotRequestsForDisplayItem_withReason___block_invoke;
  v17[3] = &unk_1E8EB6780;
  v10 = v6;
  v18 = v10;
  -[NSMutableDictionary keysOfEntriesPassingTest:](snapshotRequestsCurrentlyBeingLoaded, "keysOfEntriesPassingTest:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    SBLogSwitcherSnapshotCache();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      debugName = self->_debugName;
      objc_msgSend(v11, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = debugName;
      v21 = 2114;
      v22 = v7;
      v23 = 2114;
      v24 = v16;
      _os_log_debug_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEBUG, "\n|\n|— [%{public}@] [Purging] [%{public}@] sequenceID-s: %{public}@\n|", buf, 0x20u);

    }
    v13 = self->_snapshotRequestsCurrentlyBeingLoaded;
    objc_msgSend(v11, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](v13, "removeObjectsForKeys:", v14);

  }
}

uint64_t __83__SBAppSwitcherSnapshotImageCache__purgeSnapshotRequestsForDisplayItem_withReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "displayItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v7 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "displayItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "isEqual:", v10);

  }
LABEL_6:

  return v7;
}

- (void)_purgeSnapshotsForKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *cachedSnapshots;
  void *v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  BSDispatchQueueAssert();
  SBLogSwitcherSnapshotCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _purgeSnapshotsForKey:].cold.3();

  objc_msgSend(v4, "displayItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    SBLogSwitcherSnapshotCache();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SBAppSwitcherSnapshotImageCache _purgeSnapshotsForKey:].cold.2((uint64_t)self, (uint64_t)v6, v8);

    -[NSMutableDictionary removeObjectForKey:](self->_cachedSnapshots, "removeObjectForKey:", v4);
  }
  else
  {
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      cachedSnapshots = self->_cachedSnapshots;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __57__SBAppSwitcherSnapshotImageCache__purgeSnapshotsForKey___block_invoke;
      v15[3] = &unk_1E8EB67A8;
      v16 = v6;
      -[NSMutableDictionary keysOfEntriesPassingTest:](cachedSnapshots, "keysOfEntriesPassingTest:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        SBLogSwitcherSnapshotCache();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[SBAppSwitcherSnapshotImageCache _purgeSnapshotsForKey:].cold.1();

        v13 = self->_cachedSnapshots;
        objc_msgSend(v11, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectsForKeys:](v13, "removeObjectsForKeys:", v14);

      }
    }
  }

}

uint64_t __57__SBAppSwitcherSnapshotImageCache__purgeSnapshotsForKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "displayItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (void)_purgeLowPrioritySnapshotRequests
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] purge low priority snapshot requests", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __68__SBAppSwitcherSnapshotImageCache__purgeLowPrioritySnapshotRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v5, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "_isValidAppLayout:withSnapshot:givenCachableAppLayouts:", v6, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128)) ^ 1;
  return v8;
}

- (void)_purgeLowPrioritySnapshots
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] purge low priority snapshots", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __61__SBAppSwitcherSnapshotImageCache__purgeLowPrioritySnapshots__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL4 v10;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "_isValidAppLayout:withSnapshot:givenCachableAppLayouts:", v6, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 88))
  {
    objc_msgSend(v4, "snapshotImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

  }
  else
  {
    v10 = 0;
  }

  return v8 ^ 1 | v10;
}

- (void)_purgeLowPriorityFullSizeSnapshotRequests
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] purge full size snapshot requests", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __76__SBAppSwitcherSnapshotImageCache__purgeLowPriorityFullSizeSnapshotRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (objc_msgSend(v4, "loadFullSizeSnapshot"))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6) ^ 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_purgeLowPriorityFullSizeSnapshots
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] purge full size snapshots", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __69__SBAppSwitcherSnapshotImageCache__purgeLowPriorityFullSizeSnapshots__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;

  v4 = a3;
  if (objc_msgSend(v4, "fromFullSizeSnapshotRequest"))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 88))
    {
      objc_msgSend(v4, "snapshotImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 == 0;

    }
    else
    {
      v9 = 0;
    }
    v10 = v7 ^ 1 | v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setSnapshotNeedsUpdateForDisplayItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *cachedSnapshots;
  id *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  SBLogSwitcherSnapshotCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _setSnapshotNeedsUpdateForDisplayItem:].cold.1();

  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    cachedSnapshots = self->_cachedSnapshots;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __73__SBAppSwitcherSnapshotImageCache__setSnapshotNeedsUpdateForDisplayItem___block_invoke;
    v23[3] = &unk_1E8EB67A8;
    v8 = &v24;
    v24 = v4;
    v9 = v23;
  }
  else
  {
    objc_msgSend(v4, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_8;
    cachedSnapshots = self->_cachedSnapshots;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __73__SBAppSwitcherSnapshotImageCache__setSnapshotNeedsUpdateForDisplayItem___block_invoke_2;
    v21[3] = &unk_1E8EB67A8;
    v8 = &v22;
    v22 = v4;
    v9 = v21;
  }
  -[NSMutableDictionary keysOfEntriesPassingTest:](cachedSnapshots, "keysOfEntriesPassingTest:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[NSMutableDictionary objectForKey:](self->_cachedSnapshots, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setNeedsUpdate:", 1);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

uint64_t __73__SBAppSwitcherSnapshotImageCache__setSnapshotNeedsUpdateForDisplayItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "displayItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __73__SBAppSwitcherSnapshotImageCache__setSnapshotNeedsUpdateForDisplayItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "displayItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)_isValidAppLayout:(id)a3 withSnapshot:(id)a4 givenCachableAppLayouts:(id)a5
{
  id v6;
  id v7;
  char v8;

  v6 = a5;
  v7 = a3;
  BSDispatchQueueAssert();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  return v8;
}

uint64_t __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a2;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "needsUpdate") & 1) == 0)
    v6 = objc_msgSend(v5, "fromFullSizeSnapshotRequest") | a3 ^ 1;
  else
    v6 = 0;

  return v6;
}

uint64_t __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _SBAppSwitcherSnapshotCacheKey *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "allItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    LODWORD(v8) = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = -[_SBAppSwitcherSnapshotCacheKey initWithDisplayItem:inAppLayout:]([_SBAppSwitcherSnapshotCacheKey alloc], "initWithDisplayItem:inAppLayout:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v8 & (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

void __102__SBAppSwitcherSnapshotImageCache__enqueueSnapshotRequestsForCachableAppLayouts_forFullSizeSnapshots___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_loadSnapshotForRequest:withDisplayItem:inAppLayout:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (id)_createSnapshotRequestWithDisplayItem:(id)a3 inAppLayout:(id)a4 forFullSizeSnapshot:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _SBAppSwitcherSnapshotImageCacheRequest *v10;
  NSMutableDictionary *snapshotRequestsCurrentlyBeingLoaded;
  void *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  BSDispatchQueueAssert();
  ++self->_snapshotRequestSequenceID;
  v10 = -[_SBAppSwitcherSnapshotImageCacheRequest initWithSequenceID:]([_SBAppSwitcherSnapshotImageCacheRequest alloc], "initWithSequenceID:", self->_snapshotRequestSequenceID);
  -[_SBAppSwitcherSnapshotImageCacheRequest setDisplayItem:](v10, "setDisplayItem:", v9);

  -[_SBAppSwitcherSnapshotImageCacheRequest setAppLayout:](v10, "setAppLayout:", v8);
  -[_SBAppSwitcherSnapshotImageCacheRequest setLoadFullSizeSnapshot:](v10, "setLoadFullSizeSnapshot:", v5);
  snapshotRequestsCurrentlyBeingLoaded = self->_snapshotRequestsCurrentlyBeingLoaded;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_snapshotRequestSequenceID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](snapshotRequestsCurrentlyBeingLoaded, "setObject:forKey:", v10, v12);

  return v10;
}

- (BOOL)_isValidSnapshotRequest:(id)a3
{
  id v4;
  NSMutableDictionary *snapshotRequestsCurrentlyBeingLoaded;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  BSDispatchQueueAssert();
  snapshotRequestsCurrentlyBeingLoaded = self->_snapshotRequestsCurrentlyBeingLoaded;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "sequenceID");

  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](snapshotRequestsCurrentlyBeingLoaded, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(snapshotRequestsCurrentlyBeingLoaded) = v9 != 0;

  return (char)snapshotRequestsCurrentlyBeingLoaded;
}

uint64_t __80__SBAppSwitcherSnapshotImageCache__cachableAppLayoutsRequiringFullSizeSnapshots__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "containsObject:", a2);
}

- (void)_snapshotImage:(id)a3 finishedLoadingForRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;
  _SBAppSwitcherSnapshotCacheKey *v13;
  void *v14;
  _SBAppSwitcherSnapshotCacheKey *v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  SBLogSwitcherSnapshotCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _snapshotImage:finishedLoadingForRequest:].cold.1((uint64_t)self, (uint64_t)v7, v8);

  objc_msgSend(v7, "displayItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBAppSwitcherSnapshotImageCache _isValidSnapshotRequest:](self, "_isValidSnapshotRequest:", v7);
  v11 = CFSTR("invalid");
  if (v10)
    v11 = CFSTR("valid");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished loading %@ request"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherSnapshotImageCache _purgeSnapshotRequest:withReason:](self, "_purgeSnapshotRequest:withReason:", v7, v12);

  if (v10)
  {
    -[SBAppSwitcherSnapshotImageCache _addCacheEntryForImage:fromRequest:](self, "_addCacheEntryForImage:fromRequest:", v6, v7);
    v13 = [_SBAppSwitcherSnapshotCacheKey alloc];
    objc_msgSend(v7, "appLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[_SBAppSwitcherSnapshotCacheKey initWithDisplayItem:inAppLayout:](v13, "initWithDisplayItem:inAppLayout:", v9, v14);

    -[NSMutableDictionary objectForKey:](self->_cachedSnapshots, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsUpdate:", 0);
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__SBAppSwitcherSnapshotImageCache__snapshotImage_finishedLoadingForRequest___block_invoke;
    block[3] = &unk_1E8EB51F0;
    objc_copyWeak(&v22, &location);
    v19 = v9;
    v20 = v7;
    v21 = v16;
    v17 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  -[SBAppSwitcherSnapshotImageCache _enqueueNextSnapshotRequestIfNecessary](self, "_enqueueNextSnapshotRequestIfNecessary");

}

void __76__SBAppSwitcherSnapshotImageCache__snapshotImage_finishedLoadingForRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "appLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_updateObserversForDisplayItem:inAppLayout:withCacheEntry:", v2, v3, *(_QWORD *)(a1 + 48));

  }
}

- (void)_addCacheEntryForImage:(id)a3 fromRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  SBAppSwitcherSnapshotCacheEntry *v11;
  void *v12;
  _SBAppSwitcherSnapshotCacheKey *v13;
  NSObject *v14;
  NSString *debugName;
  void *v16;
  int v17;
  NSString *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  SBLogSwitcherSnapshotCache();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _addCacheEntryForImage:fromRequest:].cold.1();

  objc_msgSend(v7, "appLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(SBAppSwitcherSnapshotCacheEntry);
  -[SBAppSwitcherSnapshotCacheEntry setAppLayout:](v11, "setAppLayout:", v9);
  -[SBAppSwitcherSnapshotCacheEntry setDisplayItem:](v11, "setDisplayItem:", v10);
  objc_msgSend(v7, "snapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherSnapshotCacheEntry setSnapshot:](v11, "setSnapshot:", v12);

  -[SBAppSwitcherSnapshotCacheEntry setSnapshotImage:](v11, "setSnapshotImage:", v6);
  -[SBAppSwitcherSnapshotCacheEntry setFromFullSizeSnapshotRequest:](v11, "setFromFullSizeSnapshotRequest:", objc_msgSend(v7, "loadFullSizeSnapshot"));
  v13 = -[_SBAppSwitcherSnapshotCacheKey initWithDisplayItem:inAppLayout:]([_SBAppSwitcherSnapshotCacheKey alloc], "initWithDisplayItem:inAppLayout:", v10, v9);
  -[NSMutableDictionary setObject:forKey:](self->_cachedSnapshots, "setObject:forKey:", v11, v13);
  SBLogSwitcherSnapshotCache();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    debugName = self->_debugName;
    objc_msgSend(v7, "displayItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = debugName;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v16;
    _os_log_debug_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEBUG, "[%{public}@] cached image %{public}@ for display item [%{public}@]", (uint8_t *)&v17, 0x20u);

  }
}

- (BOOL)_keepGoingForRequest:(id)a3
{
  id v4;
  NSObject *controlQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_snapshotQueue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SBAppSwitcherSnapshotImageCache__keepGoingForRequest___block_invoke;
  block[3] = &unk_1E8E9FD30;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(controlQueue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __56__SBAppSwitcherSnapshotImageCache__keepGoingForRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isValidSnapshotRequest:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_asynchronouslyLoadSnapshotFromRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *controlQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_snapshotQueue);
  SBLogSwitcherSnapshotCache();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBAppSwitcherSnapshotImageCache _asynchronouslyLoadSnapshotFromRequest:].cold.4();

  if (!-[SBAppSwitcherSnapshotImageCache _keepGoingForRequest:](self, "_keepGoingForRequest:", v4))
  {
    SBLogSwitcherSnapshotCache();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SBAppSwitcherSnapshotImageCache _asynchronouslyLoadSnapshotFromRequest:].cold.3();
    goto LABEL_11;
  }
  objc_msgSend(v4, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForInterfaceOrientation:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogSwitcherSnapshotCache();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (!v7)
  {
    if (v9)
      -[SBAppSwitcherSnapshotImageCache _asynchronouslyLoadSnapshotFromRequest:].cold.1();
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  if (v9)
    -[SBAppSwitcherSnapshotImageCache _asynchronouslyLoadSnapshotFromRequest:].cold.2();
LABEL_12:

  objc_initWeak(&location, self);
  controlQueue = self->_controlQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SBAppSwitcherSnapshotImageCache__asynchronouslyLoadSnapshotFromRequest___block_invoke;
  v13[3] = &unk_1E8EA5EB0;
  objc_copyWeak(&v16, &location);
  v14 = v7;
  v15 = v4;
  v11 = v4;
  v12 = v7;
  dispatch_async(controlQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __74__SBAppSwitcherSnapshotImageCache__asynchronouslyLoadSnapshotFromRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_snapshotImage:finishedLoadingForRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (SBAppSwitcherSnapshotImageCacheDelegate)delegate
{
  return (SBAppSwitcherSnapshotImageCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)reloadsSnapshotsForActiveInterfaceOrientationChange
{
  return self->_reloadsSnapshotsForActiveInterfaceOrientationChange;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue_fullSizeCachableAppLayouts, 0);
  objc_storeStrong((id *)&self->_queue_cachableAppLayouts, 0);
  objc_storeStrong((id *)&self->_orientationLockManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_snapshotRequestsCurrentlyBeingLoaded, 0);
  objc_storeStrong((id *)&self->_cacheEntryUpdateObservers, 0);
  objc_storeStrong((id *)&self->_cachedSnapshots, 0);
  objc_storeStrong((id *)&self->_controlQueue, 0);
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
}

void __57__SBAppSwitcherSnapshotImageCache_setCachableAppLayouts___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] Updating cache because there are new cachable app layouts.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __65__SBAppSwitcherSnapshotImageCache_setFullSizeCachableAppLayouts___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] Updating cache because there are new full size cachable app layouts.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_updateCacheForDisplayItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] cache update requested for display item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __62__SBAppSwitcherSnapshotImageCache__updateCacheForDisplayItem___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[Updating] cache since snapshot changed for display item %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)addSnapshotUpdateObserver:forDisplayItem:inAppLayout:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] display item %{public}@ is not one of the cachable one.");
  OUTLINED_FUNCTION_2_0();
}

void __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] cache miss: no cache entry yet for %{public}@");
  OUTLINED_FUNCTION_2_0();
}

void __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] cache hit for %{public}@");
  OUTLINED_FUNCTION_2_0();
}

void __88__SBAppSwitcherSnapshotImageCache_addSnapshotUpdateObserver_forDisplayItem_inAppLayout___block_invoke_2_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] cache miss: invalid cache entry for %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)reloadSnapshotsForInterfaceStyleChange:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] reloading snapshots for user interface style: %lu");
  OUTLINED_FUNCTION_2_0();
}

- (void)_snapshotChanged:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] snapshot changed notification received for display item %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_updateObserversForDisplayItem:inAppLayout:withCacheEntry:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] call completion block for display item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_cacheSnapshotForRequest:withDisplayItem:inAppLayout:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] no snapshot (or default image) for [%{public}@]");
  OUTLINED_FUNCTION_2_0();
}

- (void)_cacheSnapshotForRequest:withDisplayItem:inAppLayout:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] async snapshot load kicked off for %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_cacheSnapshotForRequest:withDisplayItem:inAppLayout:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] image loaded from existing XB cache %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_cacheSnapshotForRequest:withDisplayItem:inAppLayout:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] cache snapshot for request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_loadSnapshotForRequest:(uint64_t)a3 withDisplayItem:(NSObject *)a4 inAppLayout:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543618;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a4, a3, "[%{public}@] load snapshot request is no more valid, sequenceID: %lu", (uint8_t *)a2);
}

- (void)_loadSnapshotForRequest:withDisplayItem:inAppLayout:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] stopping default App Layouts loading cycle, waiting for downscaled snapshot request to complete for [%{public}@]");
  OUTLINED_FUNCTION_2_0();
}

- (void)_loadSnapshotForRequest:withDisplayItem:inAppLayout:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] creating downscaled default snapshot request for default app layout", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_loadSnapshotForRequest:withDisplayItem:inAppLayout:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] load snapshot request: %@");
  OUTLINED_FUNCTION_2_0();
}

void __87__SBAppSwitcherSnapshotImageCache__loadSnapshotForRequest_withDisplayItem_inAppLayout___block_invoke_224_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
  v4 = objc_msgSend(*(id *)(a1 + 40), "sequenceID");
  v6 = 138543618;
  v7 = v3;
  v8 = 2048;
  v9 = v4;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a2, v5, "\n|\n|— [%{public}@] [Loading] request was matched by already cached entry. Request sequenceID: %lu\n|", (uint8_t *)&v6);
}

void __115__SBAppSwitcherSnapshotImageCache__createDownscaledVariantForRequest_snapshot_displayItem_sceneHandle_application___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] failed to create default App Layouts downscaled variant for [%{public}@]");
  OUTLINED_FUNCTION_2_0();
}

void __124__SBAppSwitcherSnapshotImageCache_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] updating snapshots for new interface orientation %ld");
  OUTLINED_FUNCTION_2_0();
}

- (void)_purgeSnapshotRequestsForDisplayItem:withReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] purge snapshot requests for display item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_purgeSnapshotsForKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "\n|\n|— [%{public}@] [Purging] displayItems: %{public}@\n|");
  OUTLINED_FUNCTION_2_0();
}

- (void)_purgeSnapshotsForKey:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_11_0(a1, a2), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a3, v5, "\n|\n|— [%{public}@] [Purging] displayItem with uniqueID: %{public}@\n|", v6);

  OUTLINED_FUNCTION_20();
}

- (void)_purgeSnapshotsForKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] purge snapshots for display item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setSnapshotNeedsUpdateForDisplayItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "[%{public}@] set snapshots need update for display item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_snapshotImage:(NSObject *)a3 finishedLoadingForRequest:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;

  objc_msgSend((id)OUTLINED_FUNCTION_11_0(a1, a2), "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v3;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a3, v6, "[%{public}@] finished loading snapshot request %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_20();
}

- (void)_addCacheEntryForImage:fromRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] updating cache entry for completed snapshot request %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_asynchronouslyLoadSnapshotFromRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] loaded snapshot image for [%{public}@]");
  OUTLINED_FUNCTION_2_0();
}

- (void)_asynchronouslyLoadSnapshotFromRequest:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] failed to load snapshot image for [%{public}@]");
  OUTLINED_FUNCTION_2_0();
}

- (void)_asynchronouslyLoadSnapshotFromRequest:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] couldn't load image since request is no more valid [%{public}@]");
  OUTLINED_FUNCTION_2_0();
}

- (void)_asynchronouslyLoadSnapshotFromRequest:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_14(&dword_1D0540000, v0, v1, "[%{public}@] async snapshot image loading for request %{public}@");
  OUTLINED_FUNCTION_2_0();
}

@end
