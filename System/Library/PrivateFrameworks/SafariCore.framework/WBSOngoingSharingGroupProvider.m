@implementation WBSOngoingSharingGroupProvider

+ (WBSOngoingSharingGroupProvider)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSOngoingSharingGroupProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, block);
  return (WBSOngoingSharingGroupProvider *)(id)sharedProvider_provider;
}

- (NSArray)cachedGroups
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__WBSOngoingSharingGroupProvider_cachedGroups__block_invoke;
  v5[3] = &unk_1E649BA10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __46__WBSOngoingSharingGroupProvider_cachedGroups__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __52__WBSOngoingSharingGroupProvider__notifySubscribers__block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "groupProviderReceivedUpdates:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addSubscriber:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__WBSOngoingSharingGroupProvider_addSubscriber___block_invoke;
  v7[3] = &unk_1E649B6D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __38__WBSOngoingSharingGroupProvider_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __38__WBSOngoingSharingGroupProvider_init__block_invoke_cold_1(v3, v2);
  }

}

void __48__WBSOngoingSharingGroupProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v1;

}

- (WBSOngoingSharingGroupProvider)init
{
  WBSOngoingSharingGroupProvider *v2;
  uint64_t v3;
  NSHashTable *subscribers;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSMutableDictionary *groupIDToPermissionLevelForCurrentUser;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id keybagLockStatusObserverToken;
  WBSOngoingSharingGroupProvider *v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WBSOngoingSharingGroupProvider;
  v2 = -[WBSOngoingSharingGroupProvider init](&v25, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSHashTable *)v3;

    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.SafariCore.%@.%p"), v7, v2);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    groupIDToPermissionLevelForCurrentUser = v2->_groupIDToPermissionLevelForCurrentUser;
    v2->_groupIDToPermissionLevelForCurrentUser = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubscriber:", v2);

    -[WBSOngoingSharingGroupProvider _fetchCurrentUserParticipantIDWithCompletion:](v2, "_fetchCurrentUserParticipantIDWithCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__fetchGroups, WBSKeychainSyncStatusMayHaveChangedNotification, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__contactsUpdatedNotification_, *MEMORY[0x1E0C96870], 0);

    -[WBSOngoingSharingGroupProvider _fetchGroups](v2, "_fetchGroups");
    objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "provisionWithReply:", &__block_literal_global_31);

    objc_initWeak(&location, v2);
    +[WBSKeyBagLockStatusManager sharedManager](WBSKeyBagLockStatusManager, "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __38__WBSOngoingSharingGroupProvider_init__block_invoke_17;
    v22[3] = &unk_1E649B5B0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v17, "addKeyBagLockStatusChangedObserverWithHandler:", v22);
    v18 = objc_claimAutoreleasedReturnValue();
    keybagLockStatusObserverToken = v2->_keybagLockStatusObserverToken;
    v2->_keybagLockStatusObserverToken = (id)v18;

    v20 = v2;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD block[4];
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[3] && v2[4] && !*(_BYTE *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_2;
    block[3] = &unk_1E649CC10;
    v3 = &v9;
    v4 = *(NSObject **)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    dispatch_async(v4, block);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_3;
    v5[3] = &unk_1E649D530;
    v3 = &v6;
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v2, "_fetchGroupsWithCompletion:", v5);

  }
}

- (void)_fetchGroupsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[WBSKeychainSyncingMonitor sharedMonitor](WBSKeychainSyncingMonitor, "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke;
  v8[3] = &unk_1E649D6E8;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "performTaskOnceKeychainSyncValueHasBeenFetchedOnQueue:task:", queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[16];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = +[WBSFeatureAvailability isOngoingCredentialSharingEnabled](WBSFeatureAvailability, "isOngoingCredentialSharingEnabled");
    v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "Fetching shared account groups", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD5C40], "all");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_31;
      v16[3] = &unk_1E649D6C0;
      v17 = *(id *)(a1 + 32);
      objc_copyWeak(&v18, v2);
      objc_msgSend(v7, "getGroupsWithRequest:completion:", v8, v16);

      objc_destroyWeak(&v18);
      v9 = v17;
LABEL_15:

      goto LABEL_16;
    }
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "Not fetching shared account groups because ongoing credential sharing is disabled", buf, 2u);
    }
    +[WBSKeychainSyncingMonitor sharedMonitor](WBSKeychainSyncingMonitor, "sharedMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "keychainSyncSettingValue");

    if ((unint64_t)(v11 - 1) >= 2)
    {
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSOngoingSharingGroupProviderErrorDomain"), 1, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      v12 = (void *)WeakRetained[3];
      v13 = MEMORY[0x1E0C9AA60];
      WeakRetained[3] = MEMORY[0x1E0C9AA60];

      v14 = (void *)WeakRetained[4];
      WeakRetained[4] = v13;

      objc_msgSend(WeakRetained, "_notifySubscribers");
    }
    v9 = 0;
LABEL_13:
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v9);
    goto LABEL_15;
  }
LABEL_16:

}

- (void)_notifySubscribers
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  WBSOngoingSharingGroupProvider *v7;

  v3 = (void *)-[NSHashTable copy](self->_subscribers, "copy");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__WBSOngoingSharingGroupProvider__notifySubscribers__block_invoke;
  v5[3] = &unk_1E649B6D8;
  v6 = v3;
  v7 = self;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_4;
  v7[3] = &unk_1E649B910;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

- (void)_fetchGroups
{
  -[WBSOngoingSharingGroupProvider _fetchGroupsWithCompletion:](self, "_fetchGroupsWithCompletion:", 0);
}

- (void)performTaskOnQueueAfterFetchingGroups:(id)a3 task:(id)a4
{
  -[WBSOngoingSharingGroupProvider _performTaskEnsuringGroupsAreLoadedOnQueue:shouldForceUpdate:task:](self, "_performTaskEnsuringGroupsAreLoadedOnQueue:shouldForceUpdate:task:", a3, 1, a4);
}

- (void)_performTaskEnsuringGroupsAreLoadedOnQueue:(id)a3 shouldForceUpdate:(BOOL)a4 task:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke;
  v13[3] = &unk_1E649D558;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)_fetchCurrentUserParticipantIDWithCompletion:(id)a3
{
  id v4;
  WBSScopeExitHandler *v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  WBSScopeExitHandler *v13;
  WBSOngoingSharingGroupProvider *v14;
  uint8_t buf[8];
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = objc_alloc_init(WBSScopeExitHandler);
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke;
  v16[3] = &unk_1E649CC10;
  v7 = v4;
  v17 = v7;
  -[WBSScopeExitHandler setHandler:](v5, "setHandler:", v16);
  objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_24;
    v12[3] = &unk_1E649D5D0;
    v13 = v5;
    v14 = self;
    objc_msgSend(v10, "fetchCurrentUserIdentifierWithReply:", v12);

  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v11, OS_LOG_TYPE_DEFAULT, "Not fetching current user participant ID because -[KCSharingGroupManager fetchCurrentUserIdentifierWithReply:] is not available.", buf, 2u);
    }
  }

}

void __38__WBSOngoingSharingGroupProvider_init__block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "Failed to provision for password sharing with error: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

uint64_t __48__WBSOngoingSharingGroupProvider_addSubscriber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

void __38__WBSOngoingSharingGroupProvider_init__block_invoke_17(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  +[WBSKeyBagLockStatusManager sharedManager](WBSKeyBagLockStatusManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyBagLockStatus");

  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_fetchGroups");

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[WBSKeyBagLockStatusManager sharedManager](WBSKeyBagLockStatusManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyBagLockStatusChangedObserver:", self->_keybagLockStatusObserverToken);

  v4.receiver = self;
  v4.super_class = (Class)WBSOngoingSharingGroupProvider;
  -[WBSOngoingSharingGroupProvider dealloc](&v4, sel_dealloc);
}

- (NSArray)cachedInvitations
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__WBSOngoingSharingGroupProvider_cachedInvitations__block_invoke;
  v5[3] = &unk_1E649BA10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __51__WBSOngoingSharingGroupProvider_cachedInvitations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)cachedGroupWithID:(id)a3
{
  id v4;
  NSObject *queue;
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
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__WBSOngoingSharingGroupProvider_cachedGroupWithID___block_invoke;
  block[3] = &unk_1E649B700;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __52__WBSOngoingSharingGroupProvider_cachedGroupWithID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WBSOngoingSharingGroupProvider_cachedGroupWithID___block_invoke_2;
  v7[3] = &unk_1E649D508;
  v8 = v2;
  objc_msgSend(v3, "safari_firstObjectPassingTest:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __52__WBSOngoingSharingGroupProvider_cachedGroupWithID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)performTaskEnsuringGroupsAreLoadedOnQueue:(id)a3 task:(id)a4
{
  -[WBSOngoingSharingGroupProvider _performTaskEnsuringGroupsAreLoadedOnQueue:shouldForceUpdate:task:](self, "_performTaskEnsuringGroupsAreLoadedOnQueue:shouldForceUpdate:task:", a3, 0, a4);
}

uint64_t __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)canCurrentUserEditSavedAccountsInGroupWithID:(id)a3
{
  id v4;
  NSObject *queue;
  BOOL v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__WBSOngoingSharingGroupProvider_canCurrentUserEditSavedAccountsInGroupWithID___block_invoke;
    block[3] = &unk_1E649D580;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(queue, block);
    v6 = v12[3] != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void __79__WBSOngoingSharingGroupProvider_canCurrentUserEditSavedAccountsInGroupWithID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "integerValue");
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __79__WBSOngoingSharingGroupProvider_canCurrentUserEditSavedAccountsInGroupWithID___block_invoke_cold_1(v5);
    v4 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;

}

- (NSString)currentUserParticipantID
{
  NSObject *queue;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD v11[5];
  NSObject *v12;
  uint64_t *v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke;
  block[3] = &unk_1E649C470;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(queue, block);
  v5 = (void *)v16[5];
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke_2;
    v11[3] = &unk_1E649D5A8;
    v11[4] = self;
    v13 = &v15;
    v8 = v7;
    v12 = v8;
    -[WBSOngoingSharingGroupProvider _fetchCurrentUserParticipantIDWithCompletion:](self, "_fetchCurrentUserParticipantIDWithCompletion:", v11);
    v9 = dispatch_time(0, 1000000000);
    dispatch_group_wait(v8, v9);
    v6 = (id)v16[5];

  }
  _Block_object_dispose(&v15, 8);

  return (NSString *)v6;
}

void __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    v3 = objc_msgSend(v2, "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke_3;
  v5[3] = &unk_1E649BA10;
  v4 = *(_QWORD *)(a1 + 48);
  v5[4] = v2;
  v5[5] = v4;
  dispatch_sync(v3, v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasLoadedGroups
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__WBSOngoingSharingGroupProvider_hasLoadedGroups__block_invoke;
  v5[3] = &unk_1E649BA10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__WBSOngoingSharingGroupProvider_hasLoadedGroups__block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 24))
    v2 = *(_QWORD *)(v1 + 32) != 0;
  else
    v2 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_24_cold_1(v7, v6);
  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(NSObject **)(v8 + 8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_25;
  v11[3] = &unk_1E649B6D8;
  v11[4] = v8;
  v12 = v5;
  v10 = v5;
  dispatch_sync(v9, v11);

}

void __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

void __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WBSScopeExitHandler *v7;
  uint64_t v8;
  id v9;
  NSObject **WeakRetained;
  NSObject **v11;
  NSObject *v12;
  _QWORD v13[4];
  WBSScopeExitHandler *v14;
  id v15;
  id v16;
  NSObject **v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(WBSScopeExitHandler);
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_2;
  v18[3] = &unk_1E649B910;
  v20 = *(id *)(a1 + 32);
  v9 = v6;
  v19 = v9;
  -[WBSScopeExitHandler setHandler:](v7, "setHandler:", v18);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[1];
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_3;
    v13[3] = &unk_1E649D698;
    v14 = v7;
    v15 = v9;
    v16 = v5;
    v17 = v11;
    dispatch_async(v12, v13);

  }
}

uint64_t __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_3(void **a1)
{
  void **v1;
  NSObject *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;

  v1 = a1 + 5;
  if (a1[5])
  {
    v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_3_cold_1(v1, v2);
  }
  else
  {
    objc_msgSend(a1[6], "sortedArrayUsingComparator:", &__block_literal_global_34);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_filterObjectsUsingBlock:", &__block_literal_global_36);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_filterObjectsUsingBlock:", &__block_literal_global_38);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!WBSIsEqual(v4, *((void **)a1[7] + 3)) || (WBSIsEqual(v5, *((void **)a1[7] + 4)) & 1) == 0)
    {
      v6 = objc_msgSend(v4, "copy");
      v7 = a1[7];
      v8 = (void *)v7[3];
      v7[3] = v6;

      v9 = objc_msgSend(v5, "copy");
      v10 = a1[7];
      v11 = (void *)v10[4];
      v10[4] = v9;

      objc_msgSend(a1[7], "_updateCachedPermissionLevelsForCurrentUser");
      objc_msgSend(a1[7], "_notifySubscribers");
    }

  }
}

uint64_t __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "safari_localizedCompareSortingEmptyStringAndNumericPrefixToEnd:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "groupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

BOOL __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_2_35(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "currentUserParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inviteStatus") == 2;

  return v3;
}

BOOL __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_3_37(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "currentUserParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inviteStatus") == 1;

  return v3;
}

- (void)_contactsUpdatedNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__WBSOngoingSharingGroupProvider__contactsUpdatedNotification___block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __63__WBSOngoingSharingGroupProvider__contactsUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifySubscribers");
}

- (void)_updateCachedPermissionLevelsForCurrentUser
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *groupIDToPermissionLevelForCurrentUser;
  void *v12;
  NSArray *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_cachedGroups;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "participants");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_firstObjectPassingTest:", &__block_literal_global_41_1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "permissionLevel"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        groupIDToPermissionLevelForCurrentUser = self->_groupIDToPermissionLevelForCurrentUser;
        objc_msgSend(v7, "groupID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](groupIDToPermissionLevelForCurrentUser, "setObject:forKeyedSubscript:", v10, v12);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

uint64_t __77__WBSOngoingSharingGroupProvider__updateCachedPermissionLevelsForCurrentUser__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentUser");
}

- (void)_addNewGroupToCachedGroups:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WBSOngoingSharingGroupProvider__addNewGroupToCachedGroups___block_invoke;
  block[3] = &unk_1E649B6D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __61__WBSOngoingSharingGroupProvider__addNewGroupToCachedGroups___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__WBSOngoingSharingGroupProvider__addNewGroupToCachedGroups___block_invoke_2;
  v9[3] = &unk_1E649D508;
  v10 = *(id *)(a1 + 40);
  if ((objc_msgSend(v2, "safari_containsObjectPassingTest:", v9) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v6;

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateCachedPermissionLevelsForCurrentUser");
  objc_msgSend(*(id *)(a1 + 32), "_notifySubscribers");

}

uint64_t __61__WBSOngoingSharingGroupProvider__addNewGroupToCachedGroups___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)groupsUpdated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__WBSOngoingSharingGroupProvider_groupsUpdated__block_invoke;
  v2[3] = &unk_1E649B768;
  v2[4] = self;
  -[WBSOngoingSharingGroupProvider _fetchCurrentUserParticipantIDWithCompletion:](self, "_fetchCurrentUserParticipantIDWithCompletion:", v2);
}

uint64_t __47__WBSOngoingSharingGroupProvider_groupsUpdated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchGroupsWithCompletion:", 0);
}

- (void)accountChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__WBSOngoingSharingGroupProvider_accountChanged__block_invoke;
  v2[3] = &unk_1E649B768;
  v2[4] = self;
  -[WBSOngoingSharingGroupProvider _fetchCurrentUserParticipantIDWithCompletion:](self, "_fetchCurrentUserParticipantIDWithCompletion:", v2);
}

uint64_t __48__WBSOngoingSharingGroupProvider_accountChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchGroupsWithCompletion:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keybagLockStatusObserverToken, 0);
  objc_storeStrong((id *)&self->_cachedCurrentUserParticipantID, 0);
  objc_storeStrong((id *)&self->_groupIDToPermissionLevelForCurrentUser, 0);
  objc_storeStrong((id *)&self->_cachedInvitations, 0);
  objc_storeStrong((id *)&self->_cachedGroups, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __79__WBSOngoingSharingGroupProvider_canCurrentUserEditSavedAccountsInGroupWithID___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B2621000, log, OS_LOG_TYPE_FAULT, "Could not find permission level for current user in shared group.", v1, 2u);
}

void __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_24_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "Failed to fetch current user participant ID with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

void __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_3_cold_1(void **a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "Failed to fetch shared credential groups with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

@end
