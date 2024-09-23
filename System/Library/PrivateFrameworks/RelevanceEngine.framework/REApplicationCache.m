@implementation REApplicationCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_37);
  return (id)sharedInstance_cache;
}

void __36__REApplicationCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[REApplicationCache _init]([REApplicationCache alloc], "_init");
  v1 = (void *)sharedInstance_cache;
  sharedInstance_cache = (uint64_t)v0;

}

- (id)_init
{
  REApplicationCache *v2;
  uint64_t v3;
  NSMutableDictionary *restrictedApps;
  uint64_t v5;
  NSMutableDictionary *removedApps;
  uint64_t v7;
  NSMutableDictionary *applicationTypes;
  uint64_t v9;
  NSMutableDictionary *watchKitExtensions;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  void *v13;
  void *v14;
  objc_class *v15;
  CSLPRFDefaultAppDataProvider *v16;
  CSLPRFDefaultAppDataProvider *appProvider;
  objc_super v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v19.receiver = self;
  v19.super_class = (Class)REApplicationCache;
  v2 = -[REApplicationCache init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    restrictedApps = v2->_restrictedApps;
    v2->_restrictedApps = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    removedApps = v2->_removedApps;
    v2->_removedApps = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    applicationTypes = v2->_applicationTypes;
    v2->_applicationTypes = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    watchKitExtensions = v2->_watchKitExtensions;
    v2->_watchKitExtensions = (NSMutableDictionary *)v9;

    v11 = dispatch_queue_create("com.apple.relevanceengine.systemapplicationcache", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REApplicationCache _init_loadApplicationTypesMapFromWorkspace:](v2, "_init_loadApplicationTypesMapFromWorkspace:", v13);
    objc_msgSend(v13, "addObserver:", v2);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v14 = (void *)getCSLPRFDefaultAppDataProviderClass_softClass;
    v24 = getCSLPRFDefaultAppDataProviderClass_softClass;
    if (!getCSLPRFDefaultAppDataProviderClass_softClass)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __getCSLPRFDefaultAppDataProviderClass_block_invoke;
      v20[3] = &unk_24CF8AC38;
      v20[4] = &v21;
      __getCSLPRFDefaultAppDataProviderClass_block_invoke((uint64_t)v20);
      v14 = (void *)v22[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v21, 8);
    v16 = (CSLPRFDefaultAppDataProvider *)objc_alloc_init(v15);
    appProvider = v2->_appProvider;
    v2->_appProvider = v16;

    -[CSLPRFDefaultAppDataProvider setDelegate:](v2->_appProvider, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)REApplicationCache;
  -[REApplicationCache dealloc](&v4, sel_dealloc);
}

- (BOOL)applicationIsRemoved:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__REApplicationCache_applicationIsRemoved___block_invoke;
  block[3] = &unk_24CF8DCF8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __43__REApplicationCache_applicationIsRemoved___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_applicationIsRemoved:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_applicationIsRemoved:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_removedApps, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[REApplicationCache _queue_loadStateForBundleID:](self, "_queue_loadStateForBundleID:", v4);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_removedApps, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)applicationIsRestricted:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__REApplicationCache_applicationIsRestricted___block_invoke;
  block[3] = &unk_24CF8DCF8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __46__REApplicationCache_applicationIsRestricted___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_applicationIsRestricted:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_applicationIsRestricted:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_restrictedApps, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[REApplicationCache _queue_loadStateForBundleID:](self, "_queue_loadStateForBundleID:", v4);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_restrictedApps, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)applicationIsRemote:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__REApplicationCache_applicationIsRemote___block_invoke;
  v7[3] = &unk_24CF8DD20;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[REApplicationCache _accessRemoteApplicationsMapWithCompletion:](self, "_accessRemoteApplicationsMapWithCompletion:", v7);
  LOBYTE(self) = v11[5] != 0;

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __42__REApplicationCache_applicationIsRemote___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "valueForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)localApplicationForRemoteApplication:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__16;
  v20 = __Block_byref_object_dispose__16;
  v21 = 0;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __59__REApplicationCache_localApplicationForRemoteApplication___block_invoke;
  v13 = &unk_24CF8DD20;
  v15 = &v16;
  v5 = v4;
  v14 = v5;
  -[REApplicationCache _accessRemoteApplicationsMapWithCompletion:](self, "_accessRemoteApplicationsMapWithCompletion:", &v10);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null", v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v17[5]) & 1) != 0)
    v7 = 0;
  else
    v7 = (void *)v17[5];
  v8 = v7;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __59__REApplicationCache_localApplicationForRemoteApplication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "valueForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)remoteApplicationForLocalApplication:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__16;
  v20 = __Block_byref_object_dispose__16;
  v21 = 0;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __59__REApplicationCache_remoteApplicationForLocalApplication___block_invoke;
  v13 = &unk_24CF8DD20;
  v15 = &v16;
  v5 = v4;
  v14 = v5;
  -[REApplicationCache _accessRemoteApplicationsMapWithCompletion:](self, "_accessRemoteApplicationsMapWithCompletion:", &v10);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null", v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v17[5]) & 1) != 0)
    v7 = 0;
  else
    v7 = (void *)v17[5];
  v8 = v7;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __59__REApplicationCache_remoteApplicationForLocalApplication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "keyForValue:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_accessRemoteApplicationsMapWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__REApplicationCache__accessRemoteApplicationsMapWithCompletion___block_invoke;
  block[3] = &unk_24CF8AA78;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __65__REApplicationCache__accessRemoteApplicationsMapWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  dispatch_semaphore_t v7;
  id v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = dispatch_semaphore_create(0);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__REApplicationCache__accessRemoteApplicationsMapWithCompletion___block_invoke_2;
    v6[3] = &unk_24CF8C290;
    v3 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    v7 = v2;
    v8 = v4;
    v6[4] = *(_QWORD *)(a1 + 32);
    v5 = v2;
    objc_msgSend(v3, "_queue_loadRemoteAppsCompletion:", v6);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  }
}

intptr_t __65__REApplicationCache__accessRemoteApplicationsMapWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)watchKitExtensionForApplication:(id)a3
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
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__REApplicationCache_watchKitExtensionForApplication___block_invoke;
  block[3] = &unk_24CF8B008;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__REApplicationCache_watchKitExtensionForApplication___block_invoke(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0x24BDBC000;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a1[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "isWatchKitApp"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v5, "plugInKitPlugins", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v20;
LABEL_6:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
          objc_msgSend(v11, "protocol");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.watchkit"));

          if ((v13 & 1) != 0)
            break;
          if (v8 == ++v10)
          {
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v8)
              goto LABEL_6;
            goto LABEL_12;
          }
        }
        objc_msgSend(v11, "bundleIdentifier");
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = 0x24BDBC000uLL;
        if (v2)
          goto LABEL_15;
      }
      else
      {
LABEL_12:

        v3 = 0x24BDBC000;
      }
    }
    objc_msgSend(*(id *)(v3 + 3832), "null");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    objc_msgSend(*(id *)(a1[4] + 40), "setObject:forKeyedSubscript:", v2, a1[5]);

  }
  objc_msgSend(*(id *)(v3 + 3832), "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v2);

  v16 = *(_QWORD *)(a1[6] + 8);
  if ((v15 & 1) != 0)
    v17 = 0;
  else
    v17 = v2;
  v18 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v17;

}

- (unint64_t)typeForApplication:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__REApplicationCache_typeForApplication___block_invoke;
  block[3] = &unk_24CF8B008;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__REApplicationCache_typeForApplication___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "unsignedIntegerValue");
    v2 = v3;
  }

}

- (unint64_t)_trackedApplicationCount
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__REApplicationCache__trackedApplicationCount__block_invoke;
  v5[3] = &unk_24CF8C1C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__REApplicationCache__trackedApplicationCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)clearNanoRegistryApplications
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__REApplicationCache_clearNanoRegistryApplications__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __51__REApplicationCache_clearNanoRegistryApplications__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__REApplicationCache_clearNanoRegistryApplications__block_invoke_2;
  block[3] = &unk_24CF8AAF0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __51__REApplicationCache_clearNanoRegistryApplications__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("REApplicationStateDidChange"), *(_QWORD *)(a1 + 32));

}

- (void)_queue_loadRemoteAppsCompletion:(id)a3
{
  id v4;
  void *v5;
  CSLPRFDefaultAppDataProvider *appProvider;
  CSLPRFDefaultAppDataProvider *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  REApplicationCache *v12;
  __int16 v13;
  CSLPRFDefaultAppDataProvider *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_get_global_queue(33, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    appProvider = self->_appProvider;
    *(_DWORD *)buf = 138412802;
    v12 = self;
    v13 = 2112;
    v14 = appProvider;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_2132F7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ">>>> %@ is loading apps using %@, completionQueue %@", buf, 0x20u);
  }
  v7 = self->_appProvider;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__REApplicationCache__queue_loadRemoteAppsCompletion___block_invoke;
  v9[3] = &unk_24CF8DD70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[CSLPRFDefaultAppDataProvider loadAppsWithCompletion:completionQueue:](v7, "loadAppsWithCompletion:completionQueue:", v9, v5);

}

void __54__REApplicationCache__queue_loadRemoteAppsCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  REKeyValueMap *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  REKeyValueMap *v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  REKeyValueMap *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v26 = v4;
    v27 = 1024;
    v28 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2132F7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ">>>> %@ loaded %d apps, processing", buf, 0x12u);
  }
  v5 = -[REKeyValueMap initWithCapacity:]([REKeyValueMap alloc], "initWithCapacity:", objc_msgSend(v3, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10), "bundleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[REKeyValueMap addKey:withValue:](v5, "addKey:withValue:", v11, v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __54__REApplicationCache__queue_loadRemoteAppsCompletion___block_invoke_14;
  v19[3] = &unk_24CF8DD48;
  v14 = v5;
  v20 = v14;
  objc_msgSend(v13, "enumerateBundlesOfType:block:", 1, v19);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v5);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = -[REKeyValueMap count](v14, "count");
    v17 = (void *)MEMORY[0x2199B2434](*(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    v26 = v15;
    v27 = 1024;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_2132F7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ">>>> %@ mapps %d apps, calling %@", buf, 0x1Cu);

  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(void))(v18 + 16))();

}

void __54__REApplicationCache__queue_loadRemoteAppsCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDC1538];
  objc_msgSend(a2, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationProxyForBundleURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "counterpartIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = *(void **)(a1 + 32);
          objc_msgSend(v5, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addKey:withValue:", v11, v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)_clearApplicationTypesMap
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__REApplicationCache__clearApplicationTypesMap__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __47__REApplicationCache__clearApplicationTypesMap__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (void)_init_loadApplicationTypesMapFromWorkspace:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  NSMutableDictionary *applicationTypes;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      objc_msgSend(v7, "applicationState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isInstalled"))
      {
        v9 = objc_msgSend(v7, "developerType") == 1;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        applicationTypes = self->_applicationTypes;
        objc_msgSend(v7, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](applicationTypes, "setObject:forKeyedSubscript:", v10, v12);

        objc_msgSend(v5, "nextObject");
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v13;
      }

    }
    while (v7);
  }
  RELogForDomain(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = -[NSMutableDictionary count](self->_applicationTypes, "count");
    v16 = 134217984;
    v17 = v15;
    _os_log_impl(&dword_2132F7000, v14, OS_LOG_TYPE_INFO, "[AppCache] Tracking %lu installed apps.", (uint8_t *)&v16, 0xCu);
  }

}

- (void)_queue_loadStateForBundleID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v13, 0, 0);
  objc_msgSend(v4, "applicationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && objc_msgSend(v5, "isValid"))
  {
    v7 = objc_msgSend(v6, "isRestricted");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_restrictedApps, "setObject:forKeyedSubscript:", v8, v13);

    if ((objc_msgSend(v6, "isInstalled") & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v13, 1, 0);
      objc_msgSend(v10, "applicationState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "isPlaceholder") ^ 1;

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_removedApps, "setObject:forKeyedSubscript:", v12, v13);

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_restrictedApps, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v13);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_removedApps, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v13);
  }

}

- (void)applicationStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RELogForDomain(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    NSStringFromSelector(sel_bundleIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "[AppCache] %lu were changed: %{public}@.", buf, 0x16u);

  }
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__REApplicationCache_applicationStateDidChange___block_invoke;
  v12[3] = &unk_24CF8AB18;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(queue, v12);

}

uint64_t __48__REApplicationCache_applicationStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RELogForDomain(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    NSStringFromSelector(sel_bundleIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v18 = v6;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "[AppCache] %lu were installed: %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__REApplicationCache_applicationsDidInstall___block_invoke;
  block[3] = &unk_24CF8C580;
  block[4] = self;
  v15 = v10;
  v16 = v4;
  v12 = v4;
  v13 = v10;
  dispatch_async(queue, block);

}

void __45__REApplicationCache_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeObjectsInArray:", v4);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v16 = v4;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v11, 0, 0);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "_typeForRecord:", v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v13, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__REApplicationCache_applicationsDidInstall___block_invoke_2;
    block[3] = &unk_24CF8AB18;
    v14 = *(_QWORD *)(a1 + 32);
    v18 = v6;
    v19 = v14;
    v15 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v4 = v16;
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_applicationsDidChange:", *(_QWORD *)(a1 + 48));

}

void __45__REApplicationCache_applicationsDidInstall___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("REApplicationStateBundleIdentifiers");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("REApplicationStateDidInstall"), *(_QWORD *)(a1 + 40), v3);

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[4];
  id v13;
  REApplicationCache *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  RELogForDomain(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    NSStringFromSelector(sel_bundleIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v16 = v6;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "[AppCache] %lu were uninstalled: %{public}@", buf, 0x16u);

  }
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__REApplicationCache_applicationsDidUninstall___block_invoke;
  v12[3] = &unk_24CF8AB18;
  v13 = v4;
  v14 = self;
  v11 = v4;
  dispatch_async(queue, v12);

}

void __47__REApplicationCache_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7), "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObjectForKey:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v2, "copy");
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __47__REApplicationCache_applicationsDidUninstall___block_invoke_2;
  v15 = &unk_24CF8AB18;
  v10 = *(_QWORD *)(a1 + 40);
  v16 = v9;
  v17 = v10;
  v11 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], &v12);
  objc_msgSend(*(id *)(a1 + 40), "_queue_applicationsDidChange:", *(_QWORD *)(a1 + 32), v12, v13, v14, v15);

}

void __47__REApplicationCache_applicationsDidUninstall___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("REApplicationStateBundleIdentifiers");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("REApplicationStateDidUninstall"), *(_QWORD *)(a1 + 40), v3);

}

- (void)_queue_applicationsDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[REApplicationCache _queue_loadStateForBundleID:](self, "_queue_loadStateForBundleID:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[NSMutableDictionary removeAllObjects](self->_watchKitExtensions, "removeAllObjects");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__REApplicationCache__queue_applicationsDidChange___block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __51__REApplicationCache__queue_applicationsDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("REApplicationStateDidChange"), *(_QWORD *)(a1 + 32));

}

- (unint64_t)_typeForRecord:(id)a3
{
  return objc_msgSend(a3, "developerType") == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProvider, 0);
  objc_storeStrong((id *)&self->_remoteApplicationsMap, 0);
  objc_storeStrong((id *)&self->_watchKitExtensions, 0);
  objc_storeStrong((id *)&self->_removedApps, 0);
  objc_storeStrong((id *)&self->_restrictedApps, 0);
  objc_storeStrong((id *)&self->_applicationTypes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
