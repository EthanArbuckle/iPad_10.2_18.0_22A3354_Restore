@implementation SYLinkableContentItemFinder

- (SYLinkableContentItemFinder)init
{
  SYLinkableContentItemFinder *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *itemFinderQueue;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v19.receiver = self;
  v19.super_class = (Class)SYLinkableContentItemFinder;
  v2 = -[SYLinkableContentItemFinder init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.synapse.linkableItemFinder", v3);
    itemFinderQueue = v2->__itemFinderQueue;
    v2->__itemFinderQueue = (OS_dispatch_queue *)v4;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SYHandleRemoteCurrentActivityChange, CFSTR("SYRemoteCurrentActivityDidChange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_initWeak(&location, v2);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v7 = (void *)getFBSDisplayLayoutMonitorConfigurationClass_softClass;
    v28 = getFBSDisplayLayoutMonitorConfigurationClass_softClass;
    v8 = MEMORY[0x1E0C809B0];
    if (!getFBSDisplayLayoutMonitorConfigurationClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke;
      v23 = &unk_1E757B260;
      v24 = &v25;
      __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke((uint64_t)&v20);
      v7 = (void *)v26[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v9, "configurationForDefaultMainDisplayMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __35__SYLinkableContentItemFinder_init__block_invoke;
    v16[3] = &unk_1E757B988;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v10, "setTransitionHandler:", v16);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v11 = (void *)getFBSDisplayLayoutMonitorClass_softClass;
    v28 = getFBSDisplayLayoutMonitorClass_softClass;
    if (!getFBSDisplayLayoutMonitorClass_softClass)
    {
      v20 = v8;
      v21 = 3221225472;
      v22 = __getFBSDisplayLayoutMonitorClass_block_invoke;
      v23 = &unk_1E757B260;
      v24 = &v25;
      __getFBSDisplayLayoutMonitorClass_block_invoke((uint64_t)&v20);
      v11 = (void *)v26[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v12, "monitorWithConfiguration:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    displayLayoutMonitor = v2->__displayLayoutMonitor;
    v2->__displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v13;

    v2->__foregroundAppLoadRetriesRemaining = 4;
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__SYLinkableContentItemFinder_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (v4 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "_itemFinderQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__SYLinkableContentItemFinder_init__block_invoke_2;
    v8[3] = &unk_1E757B460;
    v9 = v6;
    v10 = v4;
    dispatch_async(v7, v8);

  }
}

uint64_t __35__SYLinkableContentItemFinder_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForegroundAppsFromDisplayLayout:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;
  uint8_t buf[16];

  v3 = os_log_create("com.apple.synapse", "LinkableItemFinder");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_INFO, "Deallocating", buf, 2u);
  }

  -[SYLinkableContentItemFinder _displayLayoutMonitor](self, "_displayLayoutMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SYRemoteCurrentActivityDidChange"), 0);
  v6.receiver = self;
  v6.super_class = (Class)SYLinkableContentItemFinder;
  -[SYLinkableContentItemFinder dealloc](&v6, sel_dealloc);
}

- (void)fetchLinkableContentItemsExcludingActivities:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t v18;
  SEL v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.synapse", "LinkableItemFinder");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCC38000, v9, OS_LOG_TYPE_DEFAULT, "Request to fetch linkable items started", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v11 = v10;
  -[SYLinkableContentItemFinder _itemFinderQueue](self, "_itemFinderQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke;
  block[3] = &unk_1E757BA00;
  block[4] = self;
  v16 = v7;
  v18 = v11;
  v19 = a2;
  v17 = v8;
  v13 = v8;
  v14 = v7;
  dispatch_async(v12, block);

}

void __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke_2;
  v3[3] = &unk_1E757B9D8;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v3[4] = v1;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_fetchActiveLinkableUserActivitiesExcluding:completion:", v2, v3);

}

void __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  double v22;
  void *v23;
  NSObject *v24;
  SYContentItem *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  id obj;
  void *v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  double v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v35 = a3;
  v31 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  v10 = *(double *)(a1 + 48);
  v11 = os_log_create("com.apple.synapse", "LinkableItemFinder");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v47 = objc_msgSend(v7, "count");
    v48 = 2048;
    v49 = v9 - v10;
    _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_DEFAULT, "Request to fetch linkable items finished. Found %ld item(s). Duration %0.2fs.", buf, 0x16u);
  }

  v12 = objc_msgSend(v7, "count");
  if (v12 != objc_msgSend(v35, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SYLinkableContentItemFinder.m"), 132, CFSTR("Mismatch in number of activities and identifiers."));

  }
  v32 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v7;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v42;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v17);
        objc_msgSend(v35, "objectAtIndexedSubscript:", v15 + v17);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc(MEMORY[0x1E0CA5870]);
        v40 = 0;
        v21 = (void *)objc_msgSend(v20, "initWithBundleIdentifier:allowPlaceholder:error:", v19, 1, &v40);
        v22 = COERCE_DOUBLE(v40);
        if (v21)
        {
          objc_msgSend(v21, "localizedName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v19;
        }
        else
        {
          v24 = os_log_create("com.apple.synapse", "LinkableItemFinder");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v47 = (uint64_t)v19;
            v48 = 2112;
            v49 = v22;
            _os_log_error_impl(&dword_1BCC38000, v24, OS_LOG_TYPE_ERROR, "Error loading app record for \"%@\": %@", buf, 0x16u);
          }
          v23 = v19;
        }

        v25 = -[SYContentItem initWithUserActivity:sourceAppID:sourceAppName:identifier:]([SYContentItem alloc], "initWithUserActivity:sourceAppID:sourceAppName:identifier:", v18, v19, v23, 0);
        objc_msgSend(v34, "addObject:", v25);

        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      v15 += v17;
    }
    while (v14);
  }

  dispatch_get_global_queue(0, 0);
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke_14;
  block[3] = &unk_1E757B9B0;
  v27 = *(id *)(v32 + 40);
  v37 = v34;
  v38 = v31;
  v39 = v27;
  v28 = v31;
  v29 = v34;
  dispatch_async(v26, block);

}

uint64_t __87__SYLinkableContentItemFinder_fetchLinkableContentItemsExcludingActivities_completion___block_invoke_14(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_fetchActiveLinkableUserActivitiesExcluding:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  dispatch_time_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 buf;
  Class (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYLinkableContentItemFinder.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[SYLinkableContentItemFinder _currentForegroundAppBundleIDs](self, "_currentForegroundAppBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      v11 = "Allowing activities from foreground apps only: %@";
      v12 = v10;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 12;
LABEL_6:
      _os_log_impl(&dword_1BCC38000, v12, v13, v11, (uint8_t *)&buf, v14);
    }
  }
  else
  {
    if (-[SYLinkableContentItemFinder _foregroundAppLoadRetriesRemaining](self, "_foregroundAppLoadRetriesRemaining") >= 1)
    {
      v22 = dispatch_time(0, 50000000);
      -[SYLinkableContentItemFinder _itemFinderQueue](self, "_itemFinderQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke;
      block[3] = &unk_1E757B388;
      block[4] = self;
      v31 = v7;
      v32 = v8;
      v24 = v7;
      dispatch_after(v22, v23, block);

      -[SYLinkableContentItemFinder set_foregroundAppLoadRetriesRemaining:](self, "set_foregroundAppLoadRetriesRemaining:", -[SYLinkableContentItemFinder _foregroundAppLoadRetriesRemaining](self, "_foregroundAppLoadRetriesRemaining")- 1);
      goto LABEL_16;
    }
    v10 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      v11 = "Could not load foreground apps, allowing activities from all.";
      v12 = v10;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 2;
      goto LABEL_6;
    }
  }

  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v15 = (void *)getUAUserActivityProxyClass_softClass;
  v36 = getUAUserActivityProxyClass_softClass;
  v16 = MEMORY[0x1E0C809B0];
  if (!getUAUserActivityProxyClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v38 = __getUAUserActivityProxyClass_block_invoke;
    v39 = &unk_1E757B260;
    v40 = &v33;
    __getUAUserActivityProxyClass_block_invoke((uint64_t)&buf);
    v15 = (void *)v34[3];
  }
  v17 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v33, 8);
  objc_opt_class();
  v18 = (void *)MEMORY[0x1E0CA5920];
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_21;
  v26[3] = &unk_1E757BA50;
  v19 = v8;
  v29 = v19;
  v26[4] = self;
  v27 = v9;
  v28 = v7;
  v20 = v7;
  if ((objc_msgSend(v18, "_currentUserActivityProxiesWithOptions:matching:completionHandler:", 0, 0, v26) & 1) == 0)
  {
    v21 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SYLinkableContentItemFinder _fetchActiveLinkableUserActivitiesExcluding:completion:].cold.1(v21);

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v19 + 2))(v19, 0, 0, 0);
  }

LABEL_16:
}

uint64_t __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchActiveLinkableUserActivitiesExcluding:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id obj;
  void *v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _BYTE *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  _BYTE buf[24];
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v25 = v6;
  v26 = v5;
  if (!v5 || v6)
  {
    v24 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_21_cold_1((uint64_t)v25, v24);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v12, "uuid", v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bundleIdentifier");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v13)
            v16 = v14 == 0;
          else
            v16 = 1;
          if (v16)
          {
            v17 = os_log_create("com.apple.synapse", "LinkableItemFinder");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v13;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v15;
              _os_log_impl(&dword_1BCC38000, v17, OS_LOG_TYPE_DEFAULT, "Could not load activity %@ from %@. Proxy returned nil.", buf, 0x16u);
            }

          }
          else
          {
            objc_msgSend(v28, "addObject:", v13);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);
          }

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v28, "count"))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v47 = 0;
      v47 = objc_msgSend(v28, "count");
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      obj = v28;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v38 != v20)
              objc_enumerationMutation(obj);
            v22 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
            v23 = (void *)MEMORY[0x1E0CA5920];
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_23;
            v29[3] = &unk_1E757BA28;
            v29[4] = *(_QWORD *)(a1 + 32);
            v30 = v7;
            v31 = v22;
            v32 = *(id *)(a1 + 40);
            v33 = *(id *)(a1 + 48);
            v34 = v18;
            v36 = buf;
            v35 = *(id *)(a1 + 56);
            objc_msgSend(v23, "_fetchUserActivityWithUUID:completionHandler:", v22, v29);

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v19);
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

void __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v8 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldIncludeAsLinkableUserActivity:bundleID:foregroundBundleIDs:excludedActivities:", v5, v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)))objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v8 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_23_cold_1(a1, (uint64_t)v6, v8);
  }

  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "_activityFetchingFinishedWithActivities:appBundleIDs:foregroundBundleIDs:completion:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
  objc_sync_exit(v7);

}

- (BOOL)_shouldIncludeAsLinkableUserActivity:(id)a3 bundleID:(id)a4 foregroundBundleIDs:(id)a5 excludedActivities:(id)a6
{
  id v8;
  id v9;
  id v10;
  os_log_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a6;
  if (SYIsLinkableUserActivity(v8))
  {
    if (!objc_msgSend(v10, "count"))
    {
      v16 = 1;
      goto LABEL_16;
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = (os_log_t)v10;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (!v12)
    {
      v16 = 1;
      goto LABEL_15;
    }
    v13 = v12;
    v14 = *(_QWORD *)v19;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v11);
      if ((SYEquivalentUserActivities(v8, *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15)) & 1) != 0)
        break;
      if (v13 == ++v15)
      {
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v16 = 1;
        if (v13)
          goto LABEL_5;
        goto LABEL_15;
      }
    }
  }
  else
  {
    v11 = os_log_create("com.apple.synapse", "LinkableItemFinder");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_INFO, "Ignoring user activity from %@. No usable identifier.", buf, 0xCu);
    }
  }
  v16 = 0;
LABEL_15:

LABEL_16:
  return v16;
}

- (void)_activityFetchingFinishedWithActivities:(id)a3 appBundleIDs:(id)a4 foregroundBundleIDs:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(id, void *, void *, _QWORD);
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  id obj;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v9;
  v12 = v10;
  v13 = a5;
  v14 = (void (**)(id, void *, void *, _QWORD))a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    v33 = 0u;
    obj = v13;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          v21 = v11;
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __115__SYLinkableContentItemFinder__activityFetchingFinishedWithActivities_appBundleIDs_foregroundBundleIDs_completion___block_invoke;
          v28[3] = &unk_1E757BA78;
          v29 = v12;
          v30 = v22;
          v31 = v15;
          v32 = v16;
          v11 = v21;
          objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v28);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v18);
    }

  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __115__SYLinkableContentItemFinder__activityFetchingFinishedWithActivities_appBundleIDs_foregroundBundleIDs_completion___block_invoke_2;
    v24[3] = &unk_1E757BAA0;
    v25 = v12;
    v26 = v15;
    v27 = v16;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v24);

  }
  v14[2](v14, v15, v16, 0);

}

void __115__SYLinkableContentItemFinder__activityFetchingFinishedWithActivities_appBundleIDs_foregroundBundleIDs_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
  }

}

void __115__SYLinkableContentItemFinder__activityFetchingFinishedWithActivities_appBundleIDs_foregroundBundleIDs_completion___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1[5], "addObject:", v6);
    objc_msgSend(a1[6], "addObject:", v5);
  }

}

- (void)_updateForegroundAppsFromDisplayLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "elements", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isUIApplicationElement"))
        {
          objc_msgSend(v11, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "bundleIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[SYLinkableContentItemFinder _foregroundAppBundleIDs](self, "_foregroundAppBundleIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLinkableContentItemFinder set_foregroundAppBundleIDs:](self, "set_foregroundAppBundleIDs:", v5);
  if (!v14)
  {
    if (-[SYLinkableContentItemFinder _foregroundAppLoadRetriesRemaining](self, "_foregroundAppLoadRetriesRemaining"))
      goto LABEL_14;
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "isEqualToArray:", v14) & 1) == 0)
  {
LABEL_13:
    -[SYLinkableContentItemFinder delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "linkableItemFinderItemsMightHaveChanged:", self);

  }
LABEL_14:

}

- (void)handleRemoteCurrentActivityDidChange
{
  NSObject *v3;
  _QWORD block[5];

  -[SYLinkableContentItemFinder _itemFinderQueue](self, "_itemFinderQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SYLinkableContentItemFinder_handleRemoteCurrentActivityDidChange__block_invoke;
  block[3] = &unk_1E757B758;
  block[4] = self;
  dispatch_async(v3, block);

}

void __67__SYLinkableContentItemFinder_handleRemoteCurrentActivityDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "linkableItemFinderItemsMightHaveChanged:", *(_QWORD *)(a1 + 32));

}

- (SYLinkableContentItemFinderDelegate)delegate
{
  return (SYLinkableContentItemFinderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBSDisplayLayoutMonitor)_displayLayoutMonitor
{
  return self->__displayLayoutMonitor;
}

- (NSArray)_foregroundAppBundleIDs
{
  return self->__foregroundAppBundleIDs;
}

- (void)set_foregroundAppBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)_foregroundAppLoadRetriesRemaining
{
  return self->__foregroundAppLoadRetriesRemaining;
}

- (void)set_foregroundAppLoadRetriesRemaining:(int64_t)a3
{
  self->__foregroundAppLoadRetriesRemaining = a3;
}

- (OS_dispatch_queue)_itemFinderQueue
{
  return self->__itemFinderQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__itemFinderQueue, 0);
  objc_storeStrong((id *)&self->__foregroundAppBundleIDs, 0);
  objc_storeStrong((id *)&self->__displayLayoutMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_fetchActiveLinkableUserActivitiesExcluding:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "Failed to start request for current user activities.", v1, 2u);
}

void __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_21_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "Request for current user activities failed: %@", (uint8_t *)&v2, 0xCu);
}

void __86__SYLinkableContentItemFinder__fetchActiveLinkableUserActivitiesExcluding_completion___block_invoke_23_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "Error fetching user activity %@: %@", (uint8_t *)&v4, 0x16u);
}

@end
