@implementation PTDomainServer

- (PTDomainServer)init
{
  PTDomainServer *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableSet *v6;
  NSMutableSet *unregisteredClients;
  NSMutableDictionary *v8;
  NSMutableDictionary *clientsByDomainID;
  NSMutableDictionary *v10;
  NSMutableDictionary *settingsArchivesByDomainID;
  NSMutableSet *v12;
  NSMutableSet *loadedDomainIDs;
  NSMutableDictionary *v14;
  NSMutableDictionary *localSettingsByClassName;
  NSMutableSet *v16;
  NSMutableSet *dirtyDomainIDs;
  uint64_t v18;
  NSMutableDictionary *domainInfoByID;
  uint64_t v20;
  NSMutableDictionary *testRecipeInfoByID;
  NSObject *v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  PTParameterRecordsPersistenceManager *v31;
  PTParameterRecordsPersistenceManager *parameterRecordsPersistenceManager;
  void *v33;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)PTDomainServer;
  v3 = -[PTDomainServer init](&v36, sel_init);
  if (v3)
  {
    if (__listener)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PTDomainServer.m"), 61, CFSTR("PTDomainServer should only be instantiated once."));

    }
    _PTMigrateIfNecessary();
    v4 = dispatch_queue_create("com.apple.PrototypeTools.PTSettingsServer", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    unregisteredClients = v3->_unregisteredClients;
    v3->_unregisteredClients = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clientsByDomainID = v3->_clientsByDomainID;
    v3->_clientsByDomainID = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    settingsArchivesByDomainID = v3->_settingsArchivesByDomainID;
    v3->_settingsArchivesByDomainID = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    loadedDomainIDs = v3->_loadedDomainIDs;
    v3->_loadedDomainIDs = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    localSettingsByClassName = v3->_localSettingsByClassName;
    v3->_localSettingsByClassName = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    dirtyDomainIDs = v3->_dirtyDomainIDs;
    v3->_dirtyDomainIDs = v16;

    _PTReadDomainInfo();
    v18 = objc_claimAutoreleasedReturnValue();
    domainInfoByID = v3->_domainInfoByID;
    v3->_domainInfoByID = (NSMutableDictionary *)v18;

    _PTReadTestRecipeInfo();
    v20 = objc_claimAutoreleasedReturnValue();
    testRecipeInfoByID = v3->_testRecipeInfoByID;
    v3->_testRecipeInfoByID = (NSMutableDictionary *)v20;

    PTLogObjectForTopic(2);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = -[NSMutableDictionary count](v3->_domainInfoByID, "count");
      v24 = -[NSMutableDictionary count](v3->_testRecipeInfoByID, "count");
      *(_DWORD *)buf = 67109376;
      v38 = v23;
      v39 = 1024;
      v40 = v24;
      _os_log_impl(&dword_1B966F000, v22, OS_LOG_TYPE_DEFAULT, "PTDomainServer found %d registered domains and %d registered test recipes", buf, 0xEu);
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.PrototypeTools.domainserver"));
    v26 = (void *)__listener;
    __listener = v25;

    objc_msgSend((id)__listener, "setDelegate:", v3);
    objc_msgSend((id)__listener, "resume");
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.PrototypeTools.debugserver"));
    v28 = (void *)__debugServerListener;
    __debugServerListener = v27;

    objc_msgSend((id)__debugServerListener, "setDelegate:", v3);
    objc_msgSend((id)__debugServerListener, "resume");
    +[PTDefaults sharedInstance](PTDefaults, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v29, "observeTestRecipeDefaultsOnQueue:withBlock:", MEMORY[0x1E0C80D38], &__block_literal_global_9);

    v31 = objc_alloc_init(PTParameterRecordsPersistenceManager);
    parameterRecordsPersistenceManager = v3->_parameterRecordsPersistenceManager;
    v3->_parameterRecordsPersistenceManager = v31;

    -[PTParameterRecordsPersistenceManager createParameterRecordsFromArchiveDictionary](v3->_parameterRecordsPersistenceManager, "createParameterRecordsFromArchiveDictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTDomainServer setParameterRecordsOfTunedSettings:](v3, "setParameterRecordsOfTunedSettings:", v33);

  }
  return v3;
}

void __22__PTDomainServer_init__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PTDomainServerActiveTestRecipeChangedNotification"), 0);

}

- (id)localSettingsOfClass:(Class)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PTDomainServer_localSettingsOfClass___block_invoke;
  block[3] = &unk_1E7058658;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__PTDomainServer_localSettingsOfClass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  NSStringFromClass(*(Class *)(a1 + 48));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_archiveForDomainID:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    if (v5)
    {
      objc_msgSend(v6, "settingsFromArchiveDictionary:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_msgSend(objc_alloc((Class)v6), "initWithDefaultValues");
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_setObservationEnabled:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addKeyPathObserver:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_setRestoreDefaultsObserver:", *(_QWORD *)(a1 + 32));

  }
}

- (void)persistChanges
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PTDomainServer_persistChanges__block_invoke;
  block[3] = &unk_1E7058228;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __32__PTDomainServer_persistChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_persistChanges");
}

- (NSDictionary)domainInfoByID
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__PTDomainServer_domainInfoByID__block_invoke;
  v5[3] = &unk_1E7058680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __32__PTDomainServer_domainInfoByID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDictionary)testRecipeInfoByID
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PTDomainServer_testRecipeInfoByID__block_invoke;
  v5[3] = &unk_1E7058680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __36__PTDomainServer_testRecipeInfoByID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)rootSettingsProxyDefinitionForDomainID:(id)a3
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
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PTDomainServer_rootSettingsProxyDefinitionForDomainID___block_invoke;
  block[3] = &unk_1E70586A8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__PTDomainServer_rootSettingsProxyDefinitionForDomainID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_proxyDefinitionForDomainID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)rootSettingsArchiveForDomainID:(id)a3
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
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PTDomainServer_rootSettingsArchiveForDomainID___block_invoke;
  block[3] = &unk_1E70586A8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __49__PTDomainServer_rootSettingsArchiveForDomainID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_archiveForDomainID:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)activeTestRecipeID
{
  void *v2;
  void *v3;

  +[PTDefaults sharedInstance](PTDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeTestRecipeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)applyArchiveValue:(id)a3 forRootSettingsKeyPath:(id)a4 domainID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__PTDomainServer_applyArchiveValue_forRootSettingsKeyPath_domainID___block_invoke;
  v15[3] = &unk_1E70586D0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __68__PTDomainServer_applyArchiveValue_forRootSettingsKeyPath_domainID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applyArchiveValue:forKeyPath:domainID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)restoreDefaultValuesForDomainID:(id)a3
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
  v7[2] = __50__PTDomainServer_restoreDefaultValuesForDomainID___block_invoke;
  v7[3] = &unk_1E7058150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __50__PTDomainServer_restoreDefaultValuesForDomainID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_restoreDefaultsForDomainID:", *(_QWORD *)(a1 + 40));
}

- (void)invokeOutletAtKeyPath:(id)a3 domainID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PTDomainServer_invokeOutletAtKeyPath_domainID___block_invoke;
  block[3] = &unk_1E7058290;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __49__PTDomainServer_invokeOutletAtKeyPath_domainID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_invokeOutletAtKeyPath:domainID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)sendEvent:(int64_t)a3 forTestRecipeID:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PTDomainServer_sendEvent_forTestRecipeID___block_invoke;
  block[3] = &unk_1E70586F8;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

void __44__PTDomainServer_sendEvent_forTestRecipeID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PTLogObjectForTopic(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      PTPrototypingEventShortName(a1[6]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_1B966F000, v4, OS_LOG_TYPE_DEFAULT, "Sending '%@' to domain %@", buf, 0x16u);

    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "remoteObjectProxy");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sendActiveTestRecipeEvent:", a1[6]);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)setActiveTestRecipeID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *queue;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  +[PTDefaults sharedInstance](PTDefaults, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "testRecipeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v7 & 1) == 0)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PTDomainServer_setActiveTestRecipeID___block_invoke;
    block[3] = &unk_1E70586A8;
    v16 = &v17;
    block[4] = self;
    v9 = v4;
    v15 = v9;
    dispatch_sync(queue, block);
    if (v9)
    {
      objc_msgSend(v5, "setTestRecipeIdentifier:", v9);
      objc_msgSend((id)v18[5], "recipeDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTestRecipeDescription:", v10);

      objc_msgSend((id)v18[5], "events");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTestRecipeEatsVolumeUp:", objc_msgSend(v11, "containsIndex:", 1));

      objc_msgSend((id)v18[5], "events");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTestRecipeEatsVolumeDown:", objc_msgSend(v12, "containsIndex:", 2));

      objc_msgSend((id)v18[5], "events");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTestRecipeEatsRingerSwitch:", objc_msgSend(v13, "containsIndex:", 3));

    }
    else
    {
      objc_msgSend(v5, "setTestRecipeIdentifier:", 0);
      objc_msgSend(v5, "setTestRecipeDescription:", 0);
      objc_msgSend(v5, "setTestRecipeEatsVolumeUp:", 0);
      objc_msgSend(v5, "setTestRecipeEatsVolumeDown:", 0);
      objc_msgSend(v5, "setTestRecipeEatsRingerSwitch:", 0);
    }

    _Block_object_dispose(&v17, 8);
  }

}

void __40__PTDomainServer_setActiveTestRecipeID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)applyArchiveValue:(id)a3 forKeyPath:(id)a4 domainID:(id)a5 completion:(id)a6
{
  void (**v10)(id, _QWORD);

  v10 = (void (**)(id, _QWORD))a6;
  -[PTDomainServer applyArchiveValue:forRootSettingsKeyPath:domainID:](self, "applyArchiveValue:forRootSettingsKeyPath:domainID:", a3, a4, a5);
  v10[2](v10, 0);

}

- (void)requestArchiveDictionaryForDomainID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[PTDomainServer rootSettingsArchiveForDomainID:](self, "rootSettingsArchiveForDomainID:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v7, v8, 0);

}

- (void)restoreDefaultValuesForDomainID:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  -[PTDomainServer restoreDefaultValuesForDomainID:](self, "restoreDefaultValuesForDomainID:", a3);
  v6[2](v6, 0);

}

- (void)requestDomainInfoWithCompletion:(id)a3
{
  (*((void (**)(id, NSMutableDictionary *))a3 + 2))(a3, self->_domainInfoByID);
}

- (void)requestServerStatusWithCompletion:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("Running"));
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PTDomainServer *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_archiveValueForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__PTDomainServer_settings_changedValueForKeyPath___block_invoke;
  v13[3] = &unk_1E70586D0;
  v14 = v6;
  v15 = self;
  v16 = v8;
  v17 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(queue, v13);

}

void __50__PTDomainServer_settings_changedValueForKeyPath___block_invoke(uint64_t a1)
{
  objc_class *v2;
  id v3;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_queue_applyArchiveValue:forKeyPath:domainID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3);

}

- (void)settingsWillRestoreDefaults:(id)a3
{
  objc_msgSend(a3, "removeKeyPathObserver:", self);
}

- (void)settingsDidRestoreDefaults:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  PTDomainServer *v9;

  v4 = a3;
  objc_msgSend(v4, "addKeyPathObserver:", self);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PTDomainServer_settingsDidRestoreDefaults___block_invoke;
  v7[3] = &unk_1E7058150;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __45__PTDomainServer_settingsDidRestoreDefaults___block_invoke(uint64_t a1)
{
  objc_class *v2;
  id v3;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_queue_restoreDefaultsForDomainID:", v3);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v13;
  id v14;
  PTDomainServer *v15;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E7058290;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

  return 1;
}

uint64_t __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id location;

  v2 = *(void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == __debugServerListener)
  {
    PTDebugServerInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setExportedInterface:", v7);

    objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    PTDomainClientInterface();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRemoteObjectInterface:", v3);

    v4 = *(void **)(a1 + 40);
    PTDomainServerInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v5);

    objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addObject:", *(_QWORD *)(a1 + 40));
    objc_initWeak(&location, *(id *)(a1 + 40));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke_2;
    v9[3] = &unk_1E7058720;
    v6 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 48);
    objc_copyWeak(&v10, &location);
    objc_msgSend(v6, "setInvalidationHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return objc_msgSend(*(id *)(a1 + 40), "resume");
}

void __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke_3;
  v3[3] = &unk_1E7058720;
  v3[4] = v1;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __53__PTDomainServer_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "_queue_removeClient:", WeakRetained);

}

- (void)registerDomainWithInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  PTDomainServer *v10;
  id v11;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    PTTransactionBegin(CFSTR("PTDomainServer domain registration"));
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PTDomainServer_registerDomainWithInfo___block_invoke;
    block[3] = &unk_1E7058290;
    v9 = v4;
    v10 = self;
    v11 = v5;
    v7 = v5;
    dispatch_async(queue, block);

  }
  else
  {
    PTLogObjectForTopic(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B966F000, v7, OS_LOG_TYPE_DEFAULT, "Attempt to register prototype domain with nil info. Doing nothing.", buf, 2u);
    }
  }

}

void __41__PTDomainServer_registerDomainWithInfo___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*((id *)a1[5] + 2), "containsObject:", a1[6]))
  {
    objc_msgSend(*((id *)a1[5] + 3), "objectForKey:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*((id *)a1[5] + 3), "setObject:forKey:", v3, v2);
    }
    objc_msgSend(v3, "addObject:", a1[6]);
    objc_msgSend(*((id *)a1[5] + 2), "removeObject:", a1[6]);

  }
  objc_msgSend(*((id *)a1[5] + 4), "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    PTLogObjectForTopic(2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)v11 = 138412290;
        *(_QWORD *)&v11[4] = v2;
        v7 = "Replacing domain info for %@";
LABEL_11:
        _os_log_impl(&dword_1B966F000, v5, OS_LOG_TYPE_DEFAULT, v7, v11, 0xCu);
      }
    }
    else if (v6)
    {
      *(_DWORD *)v11 = 138412290;
      *(_QWORD *)&v11[4] = v2;
      v7 = "Adding domain info for %@";
      goto LABEL_11;
    }

    objc_msgSend(*((id *)a1[5] + 4), "setObject:forKey:", a1[4], v2);
    _PTWriteDomainInfo(*((_QWORD *)a1[5] + 4));
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_31);
  }
  objc_msgSend(a1[5], "_queue_archiveForDomainID:", v2, *(_OWORD *)v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "updateSettingsFromArchive:", v8);
  else
    objc_msgSend(v9, "restoreDefaultSettings");

  PTTransactionEnd(CFSTR("PTDomainServer domain registration"));
}

void __41__PTDomainServer_registerDomainWithInfo___block_invoke_30()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PTDomainServerDomainsChangedNotification"), 0);

}

- (void)registerTestRecipeWithInfo:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  PTDomainServer *v9;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    PTTransactionBegin(CFSTR("PTDomainServer test recipe registration"));
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__PTDomainServer_registerTestRecipeWithInfo___block_invoke;
    v7[3] = &unk_1E7058150;
    v8 = v4;
    v9 = self;
    dispatch_async(queue, v7);
    v6 = v8;
  }
  else
  {
    PTLogObjectForTopic(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B966F000, v6, OS_LOG_TYPE_DEFAULT, "Attempt to register test recipe with nil info. Doing nothing.", buf, 2u);
    }
  }

}

void __45__PTDomainServer_registerTestRecipeWithInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    PTLogObjectForTopic(2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v7 = 138412290;
        v8 = v2;
        v6 = "Replacing test recipe info for %@";
LABEL_7:
        _os_log_impl(&dword_1B966F000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);
      }
    }
    else if (v5)
    {
      v7 = 138412290;
      v8 = v2;
      v6 = "Adding test recipe info for %@";
      goto LABEL_7;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forKey:", *(_QWORD *)(a1 + 32), v2);
    _PTWriteTestRecipeInfo(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_35);
  }
  PTTransactionEnd(CFSTR("PTDomainServer test recipe registration"));

}

void __45__PTDomainServer_registerTestRecipeWithInfo___block_invoke_34()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PTDomainServerTestRecipesChangedNotification"), 0);

}

- (void)registerRootSettingsProxyDefinition:(id)a3 forDomainID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    PTTransactionBegin(CFSTR("PTDomainServer proxy definition registration"));
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__PTDomainServer_registerRootSettingsProxyDefinition_forDomainID___block_invoke;
    v11[3] = &unk_1E7058150;
    v12 = v6;
    v13 = v8;
    dispatch_async(queue, v11);

    v10 = v12;
  }
  else
  {
    PTLogObjectForTopic(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B966F000, v10, OS_LOG_TYPE_DEFAULT, "Attempt to register proxy definition with either nil definition or nil domainID. Ignoring.", buf, 2u);
    }
  }

}

void __66__PTDomainServer_registerRootSettingsProxyDefinition_forDomainID___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  _PTWriteSettingsProxyDefinition(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__PTDomainServer_registerRootSettingsProxyDefinition_forDomainID___block_invoke_2;
  v2[3] = &unk_1E7058150;
  v3 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  PTTransactionEnd(CFSTR("PTDomainServer proxy definition registration"));

}

void __66__PTDomainServer_registerRootSettingsProxyDefinition_forDomainID___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("PTDomainIdentifierKey");
  v4[1] = CFSTR("PTDomainSettingsProxyDefinitionKey");
  v1 = *(_QWORD *)(a1 + 40);
  v5[0] = *(_QWORD *)(a1 + 32);
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("PTDomainServerSettingsProxyDefinitionChangedNotification"), 0, v2);

}

- (id)_queue_proxyDefinitionForDomainID:(id)a3
{
  return _PTReadSettingsProxyDefinition(a3);
}

- (id)_queue_archiveForDomainID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_settingsArchivesByDomainID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if ((-[NSMutableSet containsObject:](self->_loadedDomainIDs, "containsObject:", v4) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      _PTReadSettingsArchive(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settingsArchivesByDomainID, "setObject:forKeyedSubscript:", v5, v4);
      -[NSMutableSet addObject:](self->_loadedDomainIDs, "addObject:", v4);
    }
  }

  return v5;
}

- (void)_queue_applyArchiveValue:(id)a3 forKeyPath:(id)a4 domainID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  PTParameterRecordsPersistenceManager *parameterRecordsPersistenceManager;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  -[PTDomainServer _queue_archiveForDomainID:](self, "_queue_archiveForDomainID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_domainInfoByID, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "settingsClassName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[PTSettings emptyArchiveForSettingsClassName:](PTSettings, "emptyArchiveForSettingsClassName:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settingsArchivesByDomainID, "setObject:forKeyedSubscript:", v10, v9);
  }
  +[PTSettings _applyArchiveValue:forKeyPath:toArchive:](PTSettings, "_applyArchiveValue:forKeyPath:toArchive:", v18, v8, v10);
  -[PTDomainServer _queue_sendArchiveValue:forKeyPath:domainID:](self, "_queue_sendArchiveValue:forKeyPath:domainID:", v18, v8, v9);
  -[NSMutableSet addObject:](self->_dirtyDomainIDs, "addObject:", v9);
  -[PTDomainServer _queue_schedulePersistChanges](self, "_queue_schedulePersistChanges");
  v13 = -[PTDomainServer _hasValueChangedFromDefault:forKeypath:settingsClassName:](self, "_hasValueChangedFromDefault:forKeypath:settingsClassName:", v18, v8, v12);
  -[PTDomainServer parameterRecordsOfTunedSettings](self, "parameterRecordsOfTunedSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
    objc_msgSend(v14, "addRecordWithKeyPath:domainID:recordClassName:value:", v8, v9, v12, v18);
  else
    objc_msgSend(v14, "removeRecordWithKeyPath:domainID:", v8, v9);

  parameterRecordsPersistenceManager = self->_parameterRecordsPersistenceManager;
  -[PTDomainServer parameterRecordsOfTunedSettings](self, "parameterRecordsOfTunedSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTParameterRecordsPersistenceManager writeToDisk:](parameterRecordsPersistenceManager, "writeToDisk:", v17);

}

- (BOOL)_hasValueChangedFromDefault:(id)a3 forKeypath:(id)a4 settingsClassName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  char v12;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(NSClassFromString((NSString *)a5)), "initWithDefaultValues");
  objc_msgSend(v9, "valueForKeyPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v10, "doubleValue");
    v11 = BSFloatEqualToFloat();
  }
  else
  {
    v11 = objc_msgSend(v7, "isEqual:", v10);
  }
  v12 = v11 ^ 1;

  return v12;
}

- (void)_queue_restoreDefaultsForDomainID:(id)a3
{
  NSMutableDictionary *settingsArchivesByDomainID;
  id v5;

  settingsArchivesByDomainID = self->_settingsArchivesByDomainID;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](settingsArchivesByDomainID, "removeObjectForKey:", v5);
  -[NSMutableSet addObject:](self->_loadedDomainIDs, "addObject:", v5);
  -[PTDomainServer _queue_sendRestoreDefaultsForDomainID:](self, "_queue_sendRestoreDefaultsForDomainID:", v5);
  -[NSMutableSet addObject:](self->_dirtyDomainIDs, "addObject:", v5);

  -[PTDomainServer _queue_schedulePersistChanges](self, "_queue_schedulePersistChanges");
}

- (void)_queue_removeClient:(id)a3
{
  id v4;
  NSMutableDictionary *clientsByDomainID;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSMutableSet removeObject:](self->_unregisteredClients, "removeObject:", v4);
  clientsByDomainID = self->_clientsByDomainID;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__PTDomainServer__queue_removeClient___block_invoke;
  v7[3] = &unk_1E7058788;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientsByDomainID, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __38__PTDomainServer__queue_removeClient___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)_queue_schedulePersistChanges
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_persistScheduled)
  {
    PTTransactionBegin(CFSTR("PTDomainServer scheduled to persist changes"));
    PTLogObjectForTopic(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = 0x4024000000000000;
      _os_log_impl(&dword_1B966F000, v3, OS_LOG_TYPE_DEFAULT, "Will persist changes %gs from now", buf, 0xCu);
    }

    v4 = dispatch_time(0, 10000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PTDomainServer__queue_schedulePersistChanges__block_invoke;
    block[3] = &unk_1E7058228;
    block[4] = self;
    dispatch_after(v4, queue, block);
    self->_persistScheduled = 1;
  }
}

void __47__PTDomainServer__queue_schedulePersistChanges__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_persistChanges");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  PTTransactionEnd(CFSTR("PTDomainServer scheduled to persist changes"));
}

- (void)_queue_persistChanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  PTTransactionBegin(CFSTR("PTDomainServer persisting changes"));
  if (-[NSMutableSet count](self->_dirtyDomainIDs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet allObjects](self->_dirtyDomainIDs, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = v5 - 1;
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);
        if (v7 < v8)
          objc_msgSend(v3, "appendString:", CFSTR(", "));

        ++v7;
      }
      while (v6 != v7);
    }
    PTLogObjectForTopic(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v3;
      _os_log_impl(&dword_1B966F000, v10, OS_LOG_TYPE_DEFAULT, "Persisting changes for domains: %{public}@", buf, 0xCu);
    }

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_dirtyDomainIDs;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[PTDomainServer _queue_archiveForDomainID:](self, "_queue_archiveForDomainID:", v16, (_QWORD)v19);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
          _PTWriteSettingsArchive(v17, v16);
        else
          _PTClearSettingsArchive(v16);

      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  -[NSMutableSet removeAllObjects](self->_dirtyDomainIDs, "removeAllObjects");
  PTTransactionEnd(CFSTR("PTDomainServer persisting changes"));
}

- (void)_queue_sendArchiveValue:(id)a3 forKeyPath:(id)a4 domainID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  v8 = a3;
  v9 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary objectForKey:](self->_clientsByDomainID, "objectForKey:", a5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "remoteObjectProxy");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setArchiveValue:forKeyPath:", v8, v9);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)_queue_sendRestoreDefaultsForDomainID:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary objectForKey:](self->_clientsByDomainID, "objectForKey:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "remoteObjectProxy");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "restoreDefaultSettings");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_queue_invokeOutletAtKeyPath:(id)a3 domainID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PTLogObjectForTopic(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1B966F000, v8, OS_LOG_TYPE_DEFAULT, "Invoking outlet %@ in domain %@", buf, 0x16u);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary objectForKey:](self->_clientsByDomainID, "objectForKey:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "remoteObjectProxy");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "invokeOutletAtKeyPath:", v6);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (PTParameterRecords)parameterRecordsOfTunedSettings
{
  return self->_parameterRecordsOfTunedSettings;
}

- (void)setParameterRecordsOfTunedSettings:(id)a3
{
  objc_storeStrong((id *)&self->_parameterRecordsOfTunedSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterRecordsOfTunedSettings, 0);
  objc_storeStrong((id *)&self->_parameterRecordsPersistenceManager, 0);
  objc_storeStrong((id *)&self->_dirtyDomainIDs, 0);
  objc_storeStrong((id *)&self->_localSettingsByClassName, 0);
  objc_storeStrong((id *)&self->_loadedDomainIDs, 0);
  objc_storeStrong((id *)&self->_settingsArchivesByDomainID, 0);
  objc_storeStrong((id *)&self->_testRecipeInfoByID, 0);
  objc_storeStrong((id *)&self->_domainInfoByID, 0);
  objc_storeStrong((id *)&self->_clientsByDomainID, 0);
  objc_storeStrong((id *)&self->_unregisteredClients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
