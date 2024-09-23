@implementation TPSCloudController

+ (id)sharedInstance
{
  if (sharedInstance_predicate != -1)
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_1);
  return (id)sharedInstance_gTPSCloudController;
}

void __36__TPSCloudController_sharedInstance__block_invoke()
{
  TPSCloudController *v0;
  void *v1;

  v0 = objc_alloc_init(TPSCloudController);
  v1 = (void *)sharedInstance_gTPSCloudController;
  sharedInstance_gTPSCloudController = (uint64_t)v0;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3368], v3);

  v5.receiver = self;
  v5.super_class = (Class)TPSCloudController;
  -[TPSCloudController dealloc](&v5, sel_dealloc);
}

- (TPSCloudController)init
{
  TPSCloudController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableSet *displayedContentIDs;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSCloudController;
  v2 = -[TPSCloudController init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.tipsd.cloudQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    displayedContentIDs = v2->_displayedContentIDs;
    v2->_displayedContentIDs = (NSMutableSet *)v6;

    -[TPSCloudController checkForUpdates](v2, "checkForUpdates");
  }
  return v2;
}

- (void)checkForUpdates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__TPSCloudController_checkForUpdates__block_invoke;
  block[3] = &unk_1E395B100;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__TPSCloudController_checkForUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronize");
  objc_msgSend(v2, "objectForKey:", CFSTR("TPSDCloudHintDisplayed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

  if (v3)
  {
    +[TPSLogger daemon](TPSLogger, "daemon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_19A906000, v7, OS_LOG_TYPE_DEFAULT, "Current cloud identifiers %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v3, CFSTR("TPSDCloudHintDisplayed"));
  objc_msgSend(v8, "synchronize");

}

- (BOOL)isHintDisplayedForContentID:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__TPSCloudController_isHintDisplayedForContentID___block_invoke;
  v7[3] = &unk_1E395B128;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  LOBYTE(self) = objc_msgSend((id)v9[5], "containsObject:", v4);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

void __50__TPSCloudController_isHintDisplayedForContentID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)hintDisplayedForContentID:(id)a3
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
  block[2] = __48__TPSCloudController_hintDisplayedForContentID___block_invoke;
  block[3] = &unk_1E395B150;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __48__TPSCloudController_hintDisplayedForContentID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("TPSDCloudHintDisplayed"));

  objc_msgSend(v6, "synchronize");
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "registerForNotifications:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSLogger daemon](TPSLogger, "daemon");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_19A906000, v10, OS_LOG_TYPE_DEFAULT, "Synchronizing displayed content IDs to KVS store: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v8, "setArray:forKey:", v9, CFSTR("TPSDCloudHintDisplayed"));
  objc_msgSend(v8, "synchronize");

}

- (id)_listDisplayContentIDs
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronize");
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_clearDisplayedContentIDs
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSLogger daemon](TPSLogger, "daemon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "synchronize"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_19A906000, v3, OS_LOG_TYPE_DEFAULT, "Synchronizing: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v2, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSLogger daemon](TPSLogger, "daemon");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_19A906000, v6, OS_LOG_TYPE_DEFAULT, "Current state: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v2, "setArray:forKey:", MEMORY[0x1E0C9AA60], CFSTR("TPSDCloudHintDisplayed"));
  +[TPSLogger daemon](TPSLogger, "daemon");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "synchronize"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_19A906000, v7, OS_LOG_TYPE_DEFAULT, "Saving: %@", (uint8_t *)&v11, 0xCu);

  }
  +[TPSLogger daemon](TPSLogger, "daemon");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_19A906000, v9, OS_LOG_TYPE_DEFAULT, "After state: %@", (uint8_t *)&v11, 0xCu);

  }
}

- (void)registerForNotifications:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  if (!self->_registered)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_updateKVStoreItems_, *MEMORY[0x1E0CB3368], v5);

    self->_registered = 1;
  }
}

- (void)updateKVStoreItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  TPSCloudController *v12;

  v4 = a3;
  +[TPSAnalyticsEventDaemonActive eventWithReason:alreadyRunning:](TPSAnalyticsEventDaemonActive, "eventWithReason:alreadyRunning:", CFSTR("cloudSync"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "log");

  objc_msgSend(v4, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB3358]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (unint64_t)objc_msgSend(v6, "integerValue") <= 1)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__TPSCloudController_updateKVStoreItems___block_invoke;
    block[3] = &unk_1E395B150;
    v11 = v9;
    v12 = self;
    dispatch_sync(queue, block);

  }
}

void __41__TPSCloudController_updateKVStoreItems___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0CB3360]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "synchronize");
  objc_msgSend(v3, "objectForKey:", CFSTR("TPSDCloudHintDisplayed"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v14 + 24);
  *(_QWORD *)(v14 + 24) = v13;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedContentIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
