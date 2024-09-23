@implementation PLCoreDataChangeMerger

- (void)registerToReceiveCoreDataChanges:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  PLCoreDataChangeMerger *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotosObjectLifecycleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412802;
    v7 = objc_opt_class();
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%@ %p registerToReceiveCoreDataChanges:%@", (uint8_t *)&v6, 0x20u);
  }

  -[PLManagedObjectContextList addContext:](self->_contextsToReceiveNotifications, "addContext:", v4);
}

- (PLCoreDataChangeMerger)init
{
  PLCoreDataChangeMerger *v2;
  PLManagedObjectContextList *v3;
  PLManagedObjectContextList *contextsToReceiveNotifications;
  dispatch_queue_t v5;
  OS_dispatch_queue *mergeChangesQueue;
  NSObject *v7;
  uint64_t v8;
  PLCoreDataChangeMerger *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  PLCoreDataChangeMerger *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PLCoreDataChangeMerger;
  v2 = -[PLCoreDataChangeMerger init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PLManagedObjectContextList);
    contextsToReceiveNotifications = v2->_contextsToReceiveNotifications;
    v2->_contextsToReceiveNotifications = v3;

    v5 = dispatch_queue_create("com.apple.PLManagedObjectContext.mergeChanges", 0);
    mergeChangesQueue = v2->_mergeChangesQueue;
    v2->_mergeChangesQueue = (OS_dispatch_queue *)v5;

    PLPhotosObjectLifecycleGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2048;
      v15 = v2;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "%@ %p init", buf, 0x16u);
    }

    v9 = v2;
  }

  return v2;
}

- (void)invalidate
{
  NSObject *v3;
  uint8_t buf[4];
  uint64_t v5;
  __int16 v6;
  PLCoreDataChangeMerger *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v5 = objc_opt_class();
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p invalidate BEGIN", buf, 0x16u);
  }

  pl_dispatch_sync();
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  PLCoreDataChangeMerger *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLCoreDataChangeMerger;
  -[PLCoreDataChangeMerger dealloc](&v4, sel_dealloc);
}

- (void)mergeIntoAllContextsChangesFromRemoteContextSave:(id)a3 completionHandler:(id)a4
{
  -[PLCoreDataChangeMerger mergeChangesFromRemoteContextSave:intoAllContextsNotIdenticalTo:completionHandler:](self, "mergeChangesFromRemoteContextSave:intoAllContextsNotIdenticalTo:completionHandler:", a3, 0, a4);
}

- (void)mergeChangesFromRemoteContextSave:(id)a3 intoAllContextsNotIdenticalTo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *mergeChangesQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id buf[2];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "mergeChangesFromRemoteContextSave", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, v10);
  mergeChangesQueue = self->_mergeChangesQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke;
  v15[3] = &unk_1E3670CB0;
  v15[4] = self;
  v17 = v9;
  v13 = v9;
  objc_copyWeak(&v18, buf);
  v16 = v8;
  v14 = v8;
  dispatch_async(mergeChangesQueue, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);
}

- (void)handleUnknownMergeEvent
{
  pl_dispatch_async();
}

- (void)refreshAllObjects
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PLCoreDataChangeMerger allContexts](self, "allContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9[0] = v6;
        v9[1] = 3221225472;
        v9[2] = __43__PLCoreDataChangeMerger_refreshAllObjects__block_invoke;
        v9[3] = &unk_1E3677AA0;
        v9[4] = v8;
        objc_msgSend(v8, "performBlock:", v9);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)allContextsNotIdenticalTo:(id)a3
{
  return -[PLManagedObjectContextList allContextsNotIdenticalTo:](self->_contextsToReceiveNotifications, "allContextsNotIdenticalTo:", a3);
}

- (id)allContexts
{
  return -[PLCoreDataChangeMerger allContextsNotIdenticalTo:](self, "allContextsNotIdenticalTo:", 0);
}

- (BOOL)isMergingCoalescedSaveNotification
{
  return self->_isMergingCoalescedSaveNotification;
}

- (void)setIsMergingCoalescedSaveNotification:(BOOL)a3
{
  self->_isMergingCoalescedSaveNotification = a3;
}

- (NSDictionary)allDidSaveObjectIDsUserInfo
{
  return self->_allDidSaveObjectIDsUserInfo;
}

- (void)setAllDidSaveObjectIDsUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDidSaveObjectIDsUserInfo, 0);
  objc_storeStrong((id *)&self->_mergeChangesQueue, 0);
  objc_storeStrong((id *)&self->_contextsToReceiveNotifications, 0);
}

uint64_t __43__PLCoreDataChangeMerger_refreshAllObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshAllObjects");
}

void __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 25) = 1;
    objc_msgSend(*(id *)(a1 + 32), "allContexts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v26 = v3;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      v7 = MEMORY[0x1E0C809B0];
      if (v6)
      {
        v8 = v6;
        v9 = *(_QWORD *)v39;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v39 != v9)
              objc_enumerationMutation(v5);
            v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
            v36[0] = v7;
            v36[1] = 3221225472;
            v36[2] = __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_2;
            v36[3] = &unk_1E3677C18;
            v36[4] = v11;
            v37 = v4;
            objc_msgSend(v11, "performBlockAndWait:", v36);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        }
        while (v8);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v7;
      v32[1] = 3221225472;
      v32[2] = __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_3;
      v32[3] = &unk_1E3677530;
      v14 = v4;
      v33 = v14;
      v15 = v5;
      v34 = v15;
      v16 = v12;
      v35 = v16;
      objc_msgSend(v13, "performBlockAndWait:", v32);

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v29;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v29 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v21);
            v27[0] = v7;
            v27[1] = 3221225472;
            v27[2] = __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_5;
            v27[3] = &unk_1E3677C18;
            v23 = *(_QWORD *)(a1 + 32);
            v27[4] = v22;
            v27[5] = v23;
            objc_msgSend(v22, "performBlockAndWait:", v27);
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
        }
        while (v19);
      }

      v3 = v26;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = CFSTR("PLUnknownMergeEvent");
    v43 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("PLManagedObjectContextsPhotoKitNotification"), 0, v25);

  }
}

void __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "registeredObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isDeleted") & 1) == 0)
        {
          objc_msgSend(v7, "entity");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v9);
          }
          objc_msgSend(v7, "objectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v11);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

void __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_4;
  v3[3] = &unk_1E366AE50;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_5(uint64_t a1)
{
  double v2;
  double v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "stalenessInterval");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "setStalenessInterval:", 0.1);
  objc_msgSend(*(id *)(a1 + 32), "pl_refresh");
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isBackingALAssetsLibrary"))
    v4 = v10 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "resetAllFetchingAlbums");
    if (+[PLManagedObjectContext assetsLibraryLoggingEnabled](PLManagedObjectContext, "assetsLibraryLoggingEnabled"))
    {
      NSLog(CFSTR("##### %@ PLGenericChangeNotification: UNKNOWN MERGE"), *(_QWORD *)(a1 + 40));
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB37C0];
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationWithName:object:userInfo:", CFSTR("PLGenericChangeNotification"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotification:", v8);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isUserInterfaceContext"))
  {
    +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postShouldReloadNotificationWithPhotoLibrary:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "setStalenessInterval:", v3);

}

void __49__PLCoreDataChangeMerger_handleUnknownMergeEvent__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a3;
  objc_msgSend(v5, "fetchRequestWithEntityName:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIncludesSubentities:", 1);
  objc_msgSend(v10, "setIncludesPendingChanges:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v7);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeFetchRequest:error:", v10, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

void __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = (void *)MEMORY[0x19AEC1554]();
    v3 = *(void **)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v3, "allContextsNotIdenticalTo:", WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke_2;
    v19[3] = &unk_1E36682D8;
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v5, "_pl_filter:", v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("coalescedEvent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = objc_msgSend(v8, "BOOLValue");

    v9 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = v9;

    if (objc_msgSend(v7, "count"))
    {
      +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke_3;
      v16[3] = &unk_1E3677C18;
      v17 = *(id *)(a1 + 40);
      v18 = v7;
      objc_msgSend(v12, "sync:identifyingBlock:library:", v16, 0, 0);

    }
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 32);
    *(_QWORD *)(v13 + 32) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("PLManagedObjectContextsPhotoKitNotification"), 0, *(_QWORD *)(a1 + 40));

    objc_autoreleasePoolPop(v2);
  }
}

uint64_t __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldMergeFromRemoteContextWithChanges:", *(_QWORD *)(a1 + 32));
}

uint64_t __108__PLCoreDataChangeMerger_mergeChangesFromRemoteContextSave_intoAllContextsNotIdenticalTo_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0C97B88], "mergeChangesFromRemoteContextSave:intoContexts:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __36__PLCoreDataChangeMerger_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  PLPhotosObjectLifecycleGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_opt_class();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412546;
    v6 = v3;
    v7 = 2048;
    v8 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "%@ %p invalidate END", (uint8_t *)&v5, 0x16u);
  }

}

@end
