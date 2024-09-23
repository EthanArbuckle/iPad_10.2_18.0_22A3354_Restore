@implementation SBApplicationLibraryObserver

+ (SBApplicationLibraryObserver)new
{
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBApplicationLibraryObserver.m"), 49, CFSTR("-[SBApplicationLibraryObserver new] is unavailable."));

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SBApplicationLibraryObserver;
  return (SBApplicationLibraryObserver *)objc_msgSendSuper2(&v6, "new");
}

- (SBApplicationLibraryObserver)init
{
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLibraryObserver.m"), 54, CFSTR("-[SBApplicationLibraryObserver init] is unavailable."));

  v6.receiver = self;
  v6.super_class = (Class)SBApplicationLibraryObserver;
  return -[SBApplicationLibraryObserver init](&v6, sel_init);
}

- (SBApplicationLibraryObserver)initWithAppLibrary:(id)a3 splashBoardController:(id)a4
{
  SBApplicationLibraryObserver *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *mainQueueProxy;
  NSMutableDictionary *v10;
  NSMutableDictionary *placeholdersByBundleID;
  uint64_t v12;
  NSHashTable *applicationObservers;
  uint64_t v14;
  NSHashTable *placeholderObservers;
  FBSApplicationLibrary *appLibrary;
  uint64_t v17;
  id v18;
  FBSApplicationLibrary *v19;
  id v20;
  FBSApplicationLibrary *v21;
  id v22;
  FBSApplicationLibrary *v23;
  id v24;
  FBSApplicationLibrary *v25;
  id v26;
  FBSApplicationLibrary *v27;
  id v28;
  FBSApplicationLibrary *v29;
  id v30;
  FBSApplicationLibrary *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSMutableDictionary *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  id *v44;
  id *v45;
  id *v46;
  id *v47;
  id *v48;
  id *v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  id location;
  objc_super v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v51 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBApplicationLibraryObserver initWithAppLibrary:splashBoardController:]");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("SBApplicationLibraryObserver.m"), 59, CFSTR("this call must be made on the main thread"));

  }
  kdebug_trace();
  v73.receiver = self;
  v73.super_class = (Class)SBApplicationLibraryObserver;
  v7 = -[SBApplicationLibraryObserver init](&v73, sel_init);
  if (v7)
  {
    v8 = dispatch_queue_create_with_target_V2("com.apple.springboard.applibrary.observer", 0, MEMORY[0x1E0C80D38]);
    mainQueueProxy = v7->_mainQueueProxy;
    v7->_mainQueueProxy = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    placeholdersByBundleID = v7->_placeholdersByBundleID;
    v7->_placeholdersByBundleID = v10;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
    v12 = objc_claimAutoreleasedReturnValue();
    applicationObservers = v7->_applicationObservers;
    v7->_applicationObservers = (NSHashTable *)v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
    v14 = objc_claimAutoreleasedReturnValue();
    placeholderObservers = v7->_placeholderObservers;
    v7->_placeholderObservers = (NSHashTable *)v14;

    objc_storeStrong((id *)&v7->_appLibrary, a3);
    objc_storeStrong((id *)&v7->_splashBoardController, a4);
    objc_initWeak(&location, v7);
    appLibrary = v7->_appLibrary;
    v17 = MEMORY[0x1E0C809B0];
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke;
    v70[3] = &unk_1E8EA1D48;
    v44 = &v71;
    objc_copyWeak(&v71, &location);
    v18 = (id)-[FBSApplicationLibrary observeDidAddPlaceholdersWithBlock:](appLibrary, "observeDidAddPlaceholdersWithBlock:", v70);
    v19 = v7->_appLibrary;
    v68[0] = v17;
    v68[1] = 3221225472;
    v68[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_2;
    v68[3] = &unk_1E8EA1D48;
    v45 = &v69;
    objc_copyWeak(&v69, &location);
    v20 = (id)-[FBSApplicationLibrary observeDidCancelPlaceholdersWithBlock:](v19, "observeDidCancelPlaceholdersWithBlock:", v68);
    v21 = v7->_appLibrary;
    v66[0] = v17;
    v66[1] = 3221225472;
    v66[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_3;
    v66[3] = &unk_1E8EA1D48;
    v46 = &v67;
    objc_copyWeak(&v67, &location);
    v22 = (id)-[FBSApplicationLibrary observeDidAddApplicationsWithBlock:](v21, "observeDidAddApplicationsWithBlock:", v66);
    v23 = v7->_appLibrary;
    v64[0] = v17;
    v64[1] = 3221225472;
    v64[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_4;
    v64[3] = &unk_1E8EC0B78;
    v47 = &v65;
    objc_copyWeak(&v65, &location);
    v24 = (id)-[FBSApplicationLibrary observeDidReplaceApplicationsWithBlock:](v23, "observeDidReplaceApplicationsWithBlock:", v64);
    v25 = v7->_appLibrary;
    v62[0] = v17;
    v62[1] = 3221225472;
    v62[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_5;
    v62[3] = &unk_1E8EC0B78;
    v48 = &v63;
    objc_copyWeak(&v63, &location);
    v26 = (id)-[FBSApplicationLibrary observeDidUpdateApplicationsWithBlock:](v25, "observeDidUpdateApplicationsWithBlock:", v62);
    v27 = v7->_appLibrary;
    v60[0] = v17;
    v60[1] = 3221225472;
    v60[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_6;
    v60[3] = &unk_1E8EA1D48;
    v49 = &v61;
    objc_copyWeak(&v61, &location);
    v28 = (id)-[FBSApplicationLibrary observeDidRemoveApplicationsWithBlock:](v27, "observeDidRemoveApplicationsWithBlock:", v60);
    v29 = v7->_appLibrary;
    v58[0] = v17;
    v58[1] = 3221225472;
    v58[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_7;
    v58[3] = &unk_1E8EA1D48;
    objc_copyWeak(&v59, &location);
    v30 = (id)-[FBSApplicationLibrary observeDidDemoteApplicationsWithBlock:](v29, "observeDidDemoteApplicationsWithBlock:", v58);
    v31 = v7->_appLibrary;
    v56[0] = v17;
    v56[1] = 3221225472;
    v56[2] = __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_8;
    v56[3] = &unk_1E8EA1F50;
    objc_copyWeak(&v57, &location);
    v32 = (id)-[FBSApplicationLibrary observeDidChangeNetworkUsageWithBlock:](v31, "observeDidChangeNetworkUsageWithBlock:", v56);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[FBSApplicationLibrary allPlaceholders](v7->_appLibrary, "allPlaceholders");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v74, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v53 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          v38 = v7->_placeholdersByBundleID;
          objc_msgSend(v37, "bundleIdentifier", v44, v45, v46, v47, v48, v49, v50);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v38, "setObject:forKey:", v37, v39);

        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v74, 16);
      }
      while (v34);
    }

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "registerObserver:", v7);

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v59);
    objc_destroyWeak(v49);
    objc_destroyWeak(v48);
    objc_destroyWeak(v47);
    objc_destroyWeak(v46);
    objc_destroyWeak(v45);
    objc_destroyWeak(v44);
    objc_destroyWeak(&location);
  }
  kdebug_trace();

  return v7;
}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didAddPlaceholders:", v3);

}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didCancelPlaceholders:", v3);

}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didAddApplications:", v3);

}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didReplaceApplications:", v3);

}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didUpdateApplications:", v3);

}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didRemoveApplications:", v3);

}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didDemoteApplications:", v3);

}

void __73__SBApplicationLibraryObserver_initWithAppLibrary_splashBoardController___block_invoke_8(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didChangeNetworkUsage:", a2);

}

- (NSArray)placeholders
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_placeholdersByBundleID, "allValues");
}

- (id)suspendCalloutsAssertionWithReason:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSMutableSet *suspendCalloutsAssertionReasons;
  NSMutableSet *v21;
  NSMutableSet *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  SBApplicationLibraryObserver *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationLibraryObserver.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBApplicationLibraryObserver suspendCalloutsAssertionWithReason:]");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("SBApplicationLibraryObserver.m"), 119, CFSTR("this call must be made on the main thread"));

  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__128;
  v44 = __Block_byref_object_dispose__128;
  v45 = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0D016C0]);
  v7 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke;
  v36[3] = &unk_1E8EA4CE8;
  v8 = v6;
  v37 = v8;
  v38 = self;
  v39 = &v40;
  v9 = (void *)MEMORY[0x1D17E5550](v36);
  v10 = objc_alloc(MEMORY[0x1E0D01698]);
  v11 = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C80D38];
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_26;
  v33[3] = &unk_1E8EC0BA0;
  v35 = &v40;
  v13 = v9;
  v34 = v13;
  v14 = (void *)objc_msgSend(v10, "initWithInfo:timeout:forResponseOnQueue:withHandler:", 0, v11, v33, 0.0);

  v28 = v7;
  v29 = 3221225472;
  v30 = __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_28;
  v31 = &unk_1E8E9E8D0;
  v15 = v13;
  v32 = v15;
  objc_msgSend(v14, "setInvalidationHandler:", &v28);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p: %@"), v14, v5, v28, v29, v30, v31);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v41[5];
  v41[5] = v16;

  SBLogAppLibrary();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v41[5];
    *(_DWORD *)buf = 138412290;
    v47 = v19;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "adding suspendCalloutsAssertion '%@'", buf, 0xCu);
  }

  suspendCalloutsAssertionReasons = self->_suspendCalloutsAssertionReasons;
  if (suspendCalloutsAssertionReasons)
  {
    -[NSMutableSet addObject:](suspendCalloutsAssertionReasons, "addObject:", v41[5]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v41[5]);
    v21 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v22 = self->_suspendCalloutsAssertionReasons;
    self->_suspendCalloutsAssertionReasons = v21;

    SBLogAppLibrary();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "suspending callouts", buf, 2u);
    }

    dispatch_suspend((dispatch_object_t)self->_mainQueueProxy);
  }

  _Block_object_dispose(&v40, 8);
  return v14;
}

void __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "signal")
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    SBLogAppLibrary();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "removing suspendCalloutsAssertion '%@'", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(v4 + 24);
      *(_QWORD *)(v4 + 24) = 0;

      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 32));
      SBLogAppLibrary();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "resuming callouts", (uint8_t *)&v7, 2u);
      }

    }
  }
}

void __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 != 5)
  {
    SBLogAppLibrary();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_26_cold_1(a1, (uint64_t)v3, v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_28(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (void)addApplicationLifecycleObserver:(id)a3
{
  -[SBApplicationLibraryObserver _addObserver:table:](self, "_addObserver:table:", a3, self->_applicationObservers);
}

- (void)removeApplicationLifecycleObserver:(id)a3
{
  -[SBApplicationLibraryObserver _removeObserver:table:](self, "_removeObserver:table:", a3, self->_applicationObservers);
}

- (void)addPlaceholderLifecycleObserver:(id)a3
{
  -[SBApplicationLibraryObserver _addObserver:table:](self, "_addObserver:table:", a3, self->_placeholderObservers);
}

- (void)removePlaceholderLifecycleObserver:(id)a3
{
  -[SBApplicationLibraryObserver _removeObserver:table:](self, "_removeObserver:table:", a3, self->_placeholderObservers);
}

- (void)_addObserver:(id)a3 table:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (v6 && (objc_msgSend(v5, "containsObject:", v6) & 1) == 0)
    objc_msgSend(v5, "addObject:", v6);

}

- (void)_removeObserver:(id)a3 table:(id)a4
{
  if (a3)
    objc_msgSend(a4, "removeObject:");
}

- (void)_waitForLaunchImageGenerationForApplications:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  dispatch_semaphore_t v12;
  XBApplicationController *splashBoardController;
  NSObject *v14;
  dispatch_time_t v15;
  _QWORD v16[4];
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  os_activity_scope_state_s state;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1D0540000, "XBCapture", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  v6 = objc_alloc_init(MEMORY[0x1E0DA8F38]);
  objc_msgSend(v6, "setContentTypeMask:", 2);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8F30]), "initWithApplicationInfo:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10));
        objc_msgSend(v11, "deleteSnapshotsMatchingPredicate:", v6);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }

  v12 = dispatch_semaphore_create(0);
  splashBoardController = self->_splashBoardController;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__SBApplicationLibraryObserver__waitForLaunchImageGenerationForApplications___block_invoke;
  v16[3] = &unk_1E8E9DED8;
  v14 = v12;
  v17 = v14;
  -[XBApplicationController captureOrUpdateLaunchImagesForApplications:firstImageIsReady:completion:](splashBoardController, "captureOrUpdateLaunchImagesForApplications:firstImageIsReady:completion:", v7, v16, 0);
  v15 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v14, v15);

  os_activity_scope_leave(&state);
}

intptr_t __77__SBApplicationLibraryObserver__waitForLaunchImageGenerationForApplications___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_didAddPlaceholders:(id)a3
{
  NSObject *mainQueueProxy;
  id v5;
  _QWORD block[4];
  id v7;
  SBApplicationLibraryObserver *v8;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    mainQueueProxy = self->_mainQueueProxy;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SBApplicationLibraryObserver__didAddPlaceholders___block_invoke;
    block[3] = &unk_1E8E9E820;
    v7 = v5;
    v8 = self;
    dispatch_sync(mainQueueProxy, block);

  }
}

void __52__SBApplicationLibraryObserver__didAddPlaceholders___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
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
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
        objc_msgSend(v7, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v7, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *(id *)(*(_QWORD *)(a1 + 40) + 56);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "applicationPlaceholdersAdded:", *(_QWORD *)(a1 + 32), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)_didCancelPlaceholders:(id)a3
{
  NSObject *mainQueueProxy;
  id v5;
  _QWORD block[4];
  id v7;
  SBApplicationLibraryObserver *v8;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    mainQueueProxy = self->_mainQueueProxy;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__SBApplicationLibraryObserver__didCancelPlaceholders___block_invoke;
    block[3] = &unk_1E8E9E820;
    v7 = v5;
    v8 = self;
    dispatch_sync(mainQueueProxy, block);

  }
}

void __55__SBApplicationLibraryObserver__didCancelPlaceholders___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v6), "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObjectForKey:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *(id *)(*(_QWORD *)(a1 + 40) + 56);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "applicationPlaceholdersCancelled:", *(_QWORD *)(a1 + 32), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (void)_didAddApplications:(id)a3
{
  id v4;
  NSObject *mainQueueProxy;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  SBApplicationLibraryObserver *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  mainQueueProxy = self->_mainQueueProxy;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __52__SBApplicationLibraryObserver__didAddApplications___block_invoke;
  v12 = &unk_1E8E9E820;
  v6 = v4;
  v13 = v6;
  v14 = self;
  dispatch_sync(mainQueueProxy, &v9);
  XBLogFileManifest();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "bs_map:", &__block_literal_global_397, v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Applications were added. Updating launch images for: %{public}@", buf, 0xCu);

  }
  -[SBApplicationLibraryObserver _waitForLaunchImageGenerationForApplications:](self, "_waitForLaunchImageGenerationForApplications:", v6);

}

void __52__SBApplicationLibraryObserver__didAddApplications___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        objc_msgSend(v11, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v3, "addObject:", v12);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObjectForKey:", v7);
        }
        else
        {
          objc_msgSend(v2, "addObject:", v11);
        }

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);

  }
  v13 = (void *)MEMORY[0x1E0D229B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__SBApplicationLibraryObserver__didAddApplications___block_invoke_2;
  v19[3] = &unk_1E8E9E270;
  v14 = *(_QWORD *)(a1 + 40);
  v20 = v3;
  v21 = v14;
  v22 = v2;
  v15 = v2;
  v16 = v3;
  objc_msgSend(v13, "eventWithName:handler:", CFSTR("Applications Added"), v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "executeOrAppendEvent:", v17);

}

void __52__SBApplicationLibraryObserver__didAddApplications___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 56);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v17;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "applicationPlaceholdersInstalled:", *(_QWORD *)(a1 + 32));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v4);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "applicationsAdded:", *(_QWORD *)(a1 + 48), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      }
      while (v9);
    }

  }
}

uint64_t __52__SBApplicationLibraryObserver__didAddApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

- (void)_didReplaceApplications:(id)a3
{
  void *v4;
  void *v5;
  NSObject *mainQueueProxy;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  SBApplicationLibraryObserver *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  mainQueueProxy = self->_mainQueueProxy;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __56__SBApplicationLibraryObserver__didReplaceApplications___block_invoke;
  v13 = &unk_1E8E9E820;
  v7 = v5;
  v14 = v7;
  v15 = self;
  dispatch_sync(mainQueueProxy, &v10);
  if (objc_msgSend(v7, "count", v10, v11, v12, v13))
  {
    XBLogFileManifest();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "bs_map:", &__block_literal_global_42_0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Applications were replaced. Updating launch images for: %{public}@", buf, 0xCu);

    }
    -[SBApplicationLibraryObserver _waitForLaunchImageGenerationForApplications:](self, "_waitForLaunchImageGenerationForApplications:", v7);
  }

}

void __56__SBApplicationLibraryObserver__didReplaceApplications___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        objc_msgSend(v11, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v3, "addObject:", v12);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObjectForKey:", v7);
        }
        else
        {
          objc_msgSend(v2, "addObject:", v11);
        }

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);

  }
  v13 = (void *)MEMORY[0x1E0D229B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__SBApplicationLibraryObserver__didReplaceApplications___block_invoke_2;
  v19[3] = &unk_1E8E9E270;
  v14 = *(_QWORD *)(a1 + 40);
  v20 = v3;
  v21 = v14;
  v22 = v2;
  v15 = v2;
  v16 = v3;
  objc_msgSend(v13, "eventWithName:handler:", CFSTR("Applications Updated"), v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "executeOrAppendEvent:", v17);

}

void __56__SBApplicationLibraryObserver__didReplaceApplications___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 56);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v17;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "applicationPlaceholdersInstalled:", *(_QWORD *)(a1 + 32));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v4);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "applicationsReplaced:", *(_QWORD *)(a1 + 48), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      }
      while (v9);
    }

  }
}

uint64_t __56__SBApplicationLibraryObserver__didReplaceApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

- (void)_didUpdateApplications:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBApplicationLibraryObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SBApplicationLibraryObserver__didUpdateApplications___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __55__SBApplicationLibraryObserver__didUpdateApplications___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
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
  objc_msgSend(*(id *)(a1 + 32), "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "applicationsUpdated:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_appBundleIDsForApplications:(id)a3
{
  return (id)objc_msgSend(a3, "bs_map:", &__block_literal_global_43_2);
}

uint64_t __61__SBApplicationLibraryObserver__appBundleIDsForApplications___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

- (void)_didRemoveApplications:(id)a3
{
  id v4;
  NSObject *mainQueueProxy;
  id v6;
  _QWORD block[4];
  id v8;
  SBApplicationLibraryObserver *v9;

  v4 = a3;
  mainQueueProxy = self->_mainQueueProxy;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SBApplicationLibraryObserver__didRemoveApplications___block_invoke;
  block[3] = &unk_1E8E9E820;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(mainQueueProxy, block);

}

void __55__SBApplicationLibraryObserver__didRemoveApplications___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D229B0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __55__SBApplicationLibraryObserver__didRemoveApplications___block_invoke_2;
  v14 = &unk_1E8E9E820;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v15 = v3;
  v16 = v4;
  objc_msgSend(v2, "eventWithName:handler:", CFSTR("Applications Removed"), &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeOrAppendEvent:", v5);

  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  v7 = _os_activity_create(&dword_1D0540000, "XBInvalidate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &v10);

  XBLogFileManifest();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "_appBundleIDsForApplications:", *(_QWORD *)(a1 + 32), v10.opaque[0], v10.opaque[1], v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "FBSApplicationLibrary removed applications. Removing launch images for %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeCachedLaunchImagesForApplications:forgettingApps:", *(_QWORD *)(a1 + 32), 1);
  os_activity_scope_leave(&v10);

}

void __55__SBApplicationLibraryObserver__didRemoveApplications___block_invoke_2(uint64_t a1)
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
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "applicationsRemoved:", *(_QWORD *)(a1 + 32), (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (void)_didDemoteApplications:(id)a3
{
  id v4;
  NSObject *mainQueueProxy;
  id v6;
  _QWORD block[4];
  id v8;
  SBApplicationLibraryObserver *v9;

  v4 = a3;
  mainQueueProxy = self->_mainQueueProxy;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SBApplicationLibraryObserver__didDemoteApplications___block_invoke;
  block[3] = &unk_1E8E9E820;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(mainQueueProxy, block);

}

void __55__SBApplicationLibraryObserver__didDemoteApplications___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D229B0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __55__SBApplicationLibraryObserver__didDemoteApplications___block_invoke_2;
  v14 = &unk_1E8E9E820;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v15 = v3;
  v16 = v4;
  objc_msgSend(v2, "eventWithName:handler:", CFSTR("Applications Demoted"), &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeOrAppendEvent:", v5);

  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  v7 = _os_activity_create(&dword_1D0540000, "XBInvalidate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &v10);

  XBLogFileManifest();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "_appBundleIDsForApplications:", *(_QWORD *)(a1 + 32), v10.opaque[0], v10.opaque[1], v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "FBSApplicationLibrary demoted applications. Removing launch images for %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeCachedLaunchImagesForApplications:forgettingApps:", *(_QWORD *)(a1 + 32), 1);
  os_activity_scope_leave(&v10);

}

void __55__SBApplicationLibraryObserver__didDemoteApplications___block_invoke_2(uint64_t a1)
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
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "applicationsDemoted:", *(_QWORD *)(a1 + 32), (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (void)_didChangeNetworkUsage:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__SBApplicationLibraryObserver__didChangeNetworkUsage___block_invoke;
  v3[3] = &unk_1E8E9F508;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __55__SBApplicationLibraryObserver__didChangeNetworkUsage___block_invoke(uint64_t a1)
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "applicationPlaceholdersNetworkUsageChanged:", *(unsigned __int8 *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  NSObject *mainQueueProxy;
  _QWORD block[5];

  mainQueueProxy = self->_mainQueueProxy;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__SBApplicationLibraryObserver_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(mainQueueProxy, block);
}

void __105__SBApplicationLibraryObserver_profileConnectionDidReceiveEffectiveSettingsChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t buf[8];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogAppLibrary();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "restriction update: profile change", buf, 2u);
  }

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "applicationRestrictionsMayHaveChanged", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  NSObject *mainQueueProxy;
  _QWORD block[5];

  mainQueueProxy = self->_mainQueueProxy;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__SBApplicationLibraryObserver_profileConnectionDidReceiveProfileListChangedNotification_userInfo___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(mainQueueProxy, block);
}

void __99__SBApplicationLibraryObserver_profileConnectionDidReceiveProfileListChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t buf[8];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogAppLibrary();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "visibility update: profile change", buf, 2u);
  }

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "applicationVisibilityMayHaveChanged", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderObservers, 0);
  objc_storeStrong((id *)&self->_applicationObservers, 0);
  objc_storeStrong((id *)&self->_placeholdersByBundleID, 0);
  objc_storeStrong((id *)&self->_mainQueueProxy, 0);
  objc_storeStrong((id *)&self->_suspendCalloutsAssertionReasons, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_splashBoardController, 0);
}

void __67__SBApplicationLibraryObserver_suspendCalloutsAssertionWithReason___block_invoke_26_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "unexpected response from suspendCalloutsAssertion '%@' : %@", (uint8_t *)&v4, 0x16u);
}

@end
