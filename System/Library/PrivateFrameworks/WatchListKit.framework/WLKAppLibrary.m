@implementation WLKAppLibrary

- (id)allAppBundleIdentifiers
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__WLKAppLibrary_allAppBundleIdentifiers__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_bundleIdentifiersfromProxies:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "bundleIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)_subscriptionInfosForProxies:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__WLKAppLibrary__subscriptionInfosForProxies___block_invoke;
  v9[3] = &unk_1E68A9158;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __40__WLKAppLibrary_allAppBundleIdentifiers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

+ (id)defaultAppLibrary
{
  if (defaultAppLibrary___once != -1)
    dispatch_once(&defaultAppLibrary___once, &__block_literal_global_37);
  return (id)defaultAppLibrary___defaultAppLibrary;
}

- (id)dictionaryRepresentation
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__WLKAppLibrary_dictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E68A8CE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__WLKAppLibrary_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = v2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[3];
  if (v5)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("Installed"));
    v4 = *(_QWORD **)(a1 + 32);
  }
  v6 = v4[4];
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Subscribed"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("Subscribed"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v13, "subscriptionInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v14, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    v16 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("SubscriptionInfo"));

    v4 = *(_QWORD **)(a1 + 32);
  }
  v17 = v4[5];
  if (v17)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("Test"));
    v4 = *(_QWORD **)(a1 + 32);
  }
  v18 = v4[6];
  if (v18)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("NonConforming"));
  v19 = objc_msgSend(v3, "copy");
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

- (WLKAppLibrary)init
{
  WLKAppLibrary *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *refreshQueue;
  id v7;
  void *v8;
  void *v9;
  _QWORD handler[4];
  WLKAppLibrary *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WLKAppLibrary;
  v2 = -[WLKAppLibrary init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("WLKAppLibraryQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("WLKAppLibraryRefreshQueue", 0);
    refreshQueue = v2->_refreshQueue;
    v2->_refreshQueue = (OS_dispatch_queue *)v5;

    v7 = -[WLKAppLibrary _refreshAppLibrary](v2, "_refreshAppLibrary");
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__subscriptionsDidChangeNotification_, CFSTR("VSActiveSubscriptionsDidChangeNotification"), 0);

    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __21__WLKAppLibrary_init__block_invoke;
    handler[3] = &unk_1E68A8820;
    v12 = v2;
    notify_register_dispatch("com.apple.WatchListKit.WLKAppLibraryDidChangeNotification", &v2->_didChangeNotificationToken, MEMORY[0x1E0C80D38], handler);

  }
  return v2;
}

- (id)_refreshAppLibrary
{
  void *v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *accessQueue;
  id v12;
  _QWORD block[11];
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t v21[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  uint8_t *v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__5;
  v40 = __Block_byref_object_dispose__5;
  v41 = 0;
  v3 = (void *)MEMORY[0x1B5E47E50](self, a2);
  WLKStartupSignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Library.Refresh", ", buf, 2u);
  }

  v5 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = 0;
  +[WLKAppLibraryCore sharedInstance](WLKAppLibraryCore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __35__WLKAppLibrary__refreshAppLibrary__block_invoke;
  v27[3] = &unk_1E68A9180;
  v29 = buf;
  v8 = v5;
  v28 = v8;
  objc_msgSend(v6, "fetchApplications:", v27);

  v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  WLKStartupSignpostLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Library.Refresh", ", v21, 2u);
  }

  *(_QWORD *)v21 = 0;
  v22 = v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__5;
  v19[4] = __Block_byref_object_dispose__5;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__5;
  v17[4] = __Block_byref_object_dispose__5;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__5;
  v15[4] = __Block_byref_object_dispose__5;
  v16 = 0;
  accessQueue = self->_accessQueue;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __35__WLKAppLibrary__refreshAppLibrary__block_invoke_26;
  block[3] = &unk_1E68A91A8;
  block[4] = self;
  block[5] = v21;
  block[6] = v19;
  block[7] = v17;
  block[8] = v15;
  block[9] = buf;
  block[10] = &v36;
  dispatch_sync(accessQueue, block);
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(buf, 8);

  objc_autoreleasePoolPop(v3);
  v12 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  return v12;
}

void __35__WLKAppLibrary__refreshAppLibrary__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __34__WLKAppLibrary_defaultAppLibrary__block_invoke()
{
  NSObject *v0;
  WLKAppLibrary *v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  WLKStartupSignpostLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Library.Init", ", buf, 2u);
  }

  v1 = objc_alloc_init(WLKAppLibrary);
  v2 = (void *)defaultAppLibrary___defaultAppLibrary;
  defaultAppLibrary___defaultAppLibrary = (uint64_t)v1;

  WLKStartupSignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Library.Init", ", v4, 2u);
  }

}

uint64_t __21__WLKAppLibrary_init__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 88), &state64);
  result = getpid();
  if (state64 != (int)result)
    return objc_msgSend(*(id *)(a1 + 32), "_handleInvalidationWithReason:", CFSTR("WLKAppLibraryDidChange"));
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int didChangeNotificationToken;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  didChangeNotificationToken = self->_didChangeNotificationToken;
  if (didChangeNotificationToken)
    notify_cancel(didChangeNotificationToken);
  v6.receiver = self;
  v6.super_class = (Class)WLKAppLibrary;
  -[WLKAppLibrary dealloc](&v6, sel_dealloc);
}

- (id)installedAppBundleIdentifiers
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__WLKAppLibrary_installedAppBundleIdentifiers__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__WLKAppLibrary_installedAppBundleIdentifiers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (id)subscribedAppBundleIdentifiers
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__WLKAppLibrary_subscribedAppBundleIdentifiers__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__WLKAppLibrary_subscribedAppBundleIdentifiers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (id)testAppBundleIdentifiers
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__WLKAppLibrary_testAppBundleIdentifiers__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__WLKAppLibrary_testAppBundleIdentifiers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (id)installedAppProxies
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__WLKAppLibrary_installedAppProxies__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__WLKAppLibrary_installedAppProxies__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("Installed"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)subscribedAppProxies
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__WLKAppLibrary_subscribedAppProxies__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__WLKAppLibrary_subscribedAppProxies__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("Subscribed"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)testAppProxies
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__WLKAppLibrary_testAppProxies__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__WLKAppLibrary_testAppProxies__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("Test"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allAppProxies
{
  NSObject *accessQueue;
  void *v4;
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__WLKAppLibrary_allAppProxies__block_invoke;
  v6[3] = &unk_1E68A84D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  objc_msgSend((id)v8[5], "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__WLKAppLibrary_allAppProxies__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("Installed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("Subscribed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(v6 + 8), "objectForKeyedSubscript:", CFSTR("Test"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

}

- (id)subscriptionInfoForBundle:(id)a3
{
  id v4;
  NSObject *accessQueue;
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
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WLKAppLibrary_subscriptionInfoForBundle___block_invoke;
  block[3] = &unk_1E68A9130;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__WLKAppLibrary_subscriptionInfoForBundle___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", CFSTR("Subscribed"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", a1[5]);

        if (v9)
        {
          objc_msgSend(v7, "subscriptionInfo");
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = *(_QWORD *)(a1[6] + 8);
          v12 = *(void **)(v11 + 40);
          *(_QWORD *)(v11 + 40) = v10;

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)localizedNameForBundle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v10;
  id v11;

  v3 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v5)
  {

    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v10;

    v4 = (void *)v6;
  }
  objc_msgSend(v4, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isTVAppInstalled
{
  void *v2;
  void *v3;
  char v4;

  -[WLKAppLibrary installedAppBundleIdentifiers](self, "installedAppBundleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WLKTVAppBundleID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)refresh
{
  WLKTransactionScope *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int didChangeNotificationToken;
  pid_t v8;
  uint8_t v10[16];

  v3 = -[WLKTransactionScope initWithIdentifier:]([WLKTransactionScope alloc], "initWithIdentifier:", CFSTR("WLKAppLibrary.refresh"));
  -[WLKAppLibrary _refreshAppLibrary](self, "_refreshAppLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("WLKAppLibraryDidChangeNotification"), v4);

    if (WLKShouldRunInProcess())
    {
      WLKSystemLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - posting cross process note", v10, 2u);
      }

      didChangeNotificationToken = self->_didChangeNotificationToken;
      v8 = getpid();
      notify_set_state(didChangeNotificationToken, v8);
      notify_post("com.apple.WatchListKit.WLKAppLibraryDidChangeNotification");
    }
  }

  return v4;
}

void __46__WLKAppLibrary__subscriptionInfosForProxies___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") && objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);

}

- (id)_nonConformingAppBundleIdentifiers
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__WLKAppLibrary__nonConformingAppBundleIdentifiers__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__WLKAppLibrary__nonConformingAppBundleIdentifiers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (id)_nonConformingAppProxies
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__WLKAppLibrary__nonConformingAppProxies__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__WLKAppLibrary__nonConformingAppProxies__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("NonConforming"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)beginIgnoringAppLibraryChanges
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WLKAppLibrary_beginIgnoringAppLibraryChanges__block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __47__WLKAppLibrary_beginIgnoringAppLibraryChanges__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (void)endIgnoringAppLibraryChanges
{
  NSObject *accessQueue;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  accessQueue = self->_accessQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__WLKAppLibrary_endIgnoringAppLibraryChanges__block_invoke;
  block[3] = &unk_1E68A8CE0;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(accessQueue, block);
  if (*((_BYTE *)v12 + 24))
  {
    WLKSystemLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - No longer ignoring app library. Refreshing...", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __45__WLKAppLibrary_endIgnoringAppLibraryChanges__block_invoke_23;
    v7[3] = &unk_1E68A7FC0;
    objc_copyWeak(&v8, buf);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __45__WLKAppLibrary_endIgnoringAppLibraryChanges__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 80);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    *(_QWORD *)(v1 + 80) = v4;
    v5 = *(_QWORD *)(result + 32);
    if (!*(_QWORD *)(v5 + 80))
    {
      if (*(_BYTE *)(v5 + 72))
      {
        *(_BYTE *)(v5 + 72) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
      }
    }
  }
  return result;
}

void __45__WLKAppLibrary_endIgnoringAppLibraryChanges__block_invoke_23(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "refresh");

}

void __35__WLKAppLibrary__refreshAppLibrary__block_invoke_26(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  int v59;
  void *v60;
  id v61;
  int v62;
  void *v63;
  id v64;
  int v65;
  void *v66;
  id v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  uint8_t buf[4];
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1[4] + 40), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(a1[4] + 24), "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_msgSend(*(id *)(a1[4] + 32), "copy");
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = (id *)a1[4];
  objc_msgSend(v11[1], "objectForKeyedSubscript:", CFSTR("Subscribed"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_subscriptionInfosForProxies:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1[8] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  objc_storeStrong((id *)(a1[4] + 8), *(id *)(*(_QWORD *)(a1[9] + 8) + 40));
  v16 = (id *)a1[4];
  objc_msgSend(v16[1], "objectForKeyedSubscript:", CFSTR("Test"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_bundleIdentifiersfromProxies:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = a1[4];
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  objc_msgSend(*(id *)(a1[4] + 40), "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = a1[4];
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

  v24 = (id *)a1[4];
  objc_msgSend(v24[1], "objectForKeyedSubscript:", CFSTR("Installed"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_bundleIdentifiersfromProxies:", v25);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = a1[4];
  v28 = *(void **)(v27 + 24);
  *(_QWORD *)(v27 + 24) = v26;

  objc_msgSend(*(id *)(a1[4] + 24), "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = a1[4];
  v31 = *(void **)(v30 + 24);
  *(_QWORD *)(v30 + 24) = v29;

  v32 = (id *)a1[4];
  objc_msgSend(v32[1], "objectForKeyedSubscript:", CFSTR("Subscribed"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_bundleIdentifiersfromProxies:", v33);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = a1[4];
  v36 = *(void **)(v35 + 32);
  *(_QWORD *)(v35 + 32) = v34;

  objc_msgSend(*(id *)(a1[4] + 32), "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = a1[4];
  v39 = *(void **)(v38 + 32);
  *(_QWORD *)(v38 + 32) = v37;

  v40 = (id *)a1[4];
  objc_msgSend(v40[1], "objectForKeyedSubscript:", CFSTR("NonConforming"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_bundleIdentifiersfromProxies:", v41);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = a1[4];
  v44 = *(void **)(v43 + 48);
  *(_QWORD *)(v43 + 48) = v42;

  objc_msgSend(*(id *)(a1[4] + 48), "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = a1[4];
  v47 = *(void **)(v46 + 48);
  *(_QWORD *)(v46 + 48) = v45;

  v48 = (id *)a1[4];
  objc_msgSend(v48[1], "objectForKeyedSubscript:", CFSTR("Subscribed"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_subscriptionInfosForProxies:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObjectsFromArray:", *(_QWORD *)(a1[4] + 40));
  objc_msgSend(v51, "addObjectsFromArray:", *(_QWORD *)(a1[4] + 24));
  objc_msgSend(v51, "addObjectsFromArray:", *(_QWORD *)(a1[4] + 32));
  objc_msgSend(v51, "allObjects");
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = a1[4];
  v54 = *(void **)(v53 + 16);
  *(_QWORD *)(v53 + 16) = v52;

  v55 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v55 || *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) || *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v56 = *(id *)(a1[4] + 40);
    v57 = v55;
    v58 = v57;
    if (v56 == v57)
    {

    }
    else
    {
      if (!v57 || !v56)
        goto LABEL_27;
      v59 = objc_msgSend(v56, "isEqual:", v57);

      if (!v59)
        goto LABEL_28;
    }
    v60 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v56 = *(id *)(a1[4] + 24);
    v61 = v60;
    if (v56 == v61)
    {

    }
    else
    {
      v58 = v61;
      if (!v56 || !v61)
        goto LABEL_27;
      v62 = objc_msgSend(v56, "isEqual:", v61);

      if (!v62)
        goto LABEL_28;
    }
    v63 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
    v56 = *(id *)(a1[4] + 32);
    v64 = v63;
    if (v56 == v64)
    {

LABEL_22:
      v66 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
      v56 = v50;
      v67 = v66;
      if (v56 == v67)
      {

LABEL_41:
        goto LABEL_42;
      }
      v58 = v67;
      if (v56 && v67)
      {
        v68 = objc_msgSend(v56, "isEqual:", v67);

        if ((v68 & 1) != 0)
          goto LABEL_42;
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    v58 = v64;
    if (v56 && v64)
    {
      v65 = objc_msgSend(v56, "isEqual:", v64);

      if (!v65)
        goto LABEL_28;
      goto LABEL_22;
    }
LABEL_27:

LABEL_28:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "wlk_arrayDifference:", *(_QWORD *)(a1[4] + 40));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v69, "count"))
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v69, CFSTR("TestChanges"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "wlk_arrayDifference:", *(_QWORD *)(a1[4] + 24));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v70, "count"))
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v70, CFSTR("InstalledChanges"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "wlk_arrayDifference:", *(_QWORD *)(a1[4] + 32));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v71, "count"))
    {
      objc_msgSend(v56, "setObject:forKeyedSubscript:", v71, CFSTR("SubscribedChanges"));
      v72 = v71;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "wlk_dictionaryDifference:", v50);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v72, "count"))
      {
        WLKSystemLogObject();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v72;
          _os_log_impl(&dword_1B515A000, v73, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - Subscription info did change: %@", buf, 0xCu);
        }

        v80 = CFSTR("SubscriptionInfoChanges");
        v81 = v72;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v74, CFSTR("SubscribedChanges"));

      }
    }
    v75 = objc_msgSend(v56, "copy");
    v76 = *(_QWORD *)(a1[10] + 8);
    v77 = *(void **)(v76 + 40);
    *(_QWORD *)(v76 + 40) = v75;

    WLKSystemLogObject();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      v79 = *(void **)(*(_QWORD *)(a1[10] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v83 = v79;
      _os_log_impl(&dword_1B515A000, v78, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - Library did change: %@", buf, 0xCu);
    }

    goto LABEL_41;
  }
LABEL_42:

}

- (void)_handleInvalidationWithReason:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *accessQueue;
  id v7;
  NSObject *v8;
  NSObject *refreshQueue;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v5 = MEMORY[0x1E0C809B0];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WLKAppLibrary__handleInvalidationWithReason___block_invoke;
  block[3] = &unk_1E68A9130;
  block[4] = self;
  v7 = v4;
  v13 = v7;
  v14 = &v15;
  dispatch_sync(accessQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - Invalidating: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    refreshQueue = self->_refreshQueue;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __47__WLKAppLibrary__handleInvalidationWithReason___block_invoke_31;
    v10[3] = &unk_1E68A7FC0;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_async(refreshQueue, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }

  _Block_object_dispose(&v15, 8);
}

void __47__WLKAppLibrary__handleInvalidationWithReason___block_invoke(_QWORD *a1)
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
  if (*(uint64_t *)(a1[4] + 80) >= 1)
  {
    WLKSystemLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = a1[5];
      v4 = *(_QWORD *)(a1[4] + 80);
      v5 = 138412546;
      v6 = v3;
      v7 = 2048;
      v8 = v4;
      _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - %@, but currently ignoring app library changes (%ld).", (uint8_t *)&v5, 0x16u);
    }

    *(_BYTE *)(a1[4] + 72) = 1;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
}

void __47__WLKAppLibrary__handleInvalidationWithReason___block_invoke_31(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "refresh");

}

- (void)_subscriptionsDidChangeNotification:(id)a3
{
  -[WLKAppLibrary _handleInvalidationWithReason:](self, "_handleInvalidationWithReason:", CFSTR("Subscription changed"));
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  v6 = v4;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "bundleIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        WLKTVAppBundleID();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "postNotificationName:object:", CFSTR("WLKAppLibraryTVAppDidInstallNotification"), self);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
    v6 = v4;
  }
LABEL_11:

  -[WLKAppLibrary _handleInvalidationWithReason:](self, "_handleInvalidationWithReason:", CFSTR("App installed"));
}

- (void)applicationsDidUninstall:(id)a3
{
  -[WLKAppLibrary _handleInvalidationWithReason:](self, "_handleInvalidationWithReason:", CFSTR("App uninstalled"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_nonConformingAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_testAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_subscribedAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_installedAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_appProxies, 0);
}

@end
