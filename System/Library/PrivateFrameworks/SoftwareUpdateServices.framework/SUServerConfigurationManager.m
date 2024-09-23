@implementation SUServerConfigurationManager

- (SUServerConfigurationManager)init
{
  SUServerConfigurationManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *stateQueue;
  uint64_t v6;
  SUCoreConfigServer *suCoreServerConfig;
  uint64_t v8;
  uint64_t v9;
  SUCoreConfig *projectConfig;
  uint64_t v11;
  NSDictionary *config;
  NSMutableArray *v13;
  NSMutableArray *listeners;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SUServerConfigurationManager;
  v2 = -[SUServerConfigurationManager init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.softwareupdateservicesd.serverConfigStateQueue", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BEAE7E8], "sharedServerSettings");
    v6 = objc_claimAutoreleasedReturnValue();
    suCoreServerConfig = v2->_suCoreServerConfig;
    v2->_suCoreServerConfig = (SUCoreConfigServer *)v6;

    v8 = *MEMORY[0x24BEAEAA8];
    -[SUCoreConfigServer listenForConfigChanges:withName:](v2->_suCoreServerConfig, "listenForConfigChanges:withName:", v2, *MEMORY[0x24BEAEAA8]);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA38]), "initWithProjectName:", v8);
    projectConfig = v2->_projectConfig;
    v2->_projectConfig = (SUCoreConfig *)v9;

    -[SUCoreConfig getConfig](v2->_projectConfig, "getConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    config = v2->_config;
    v2->_config = (NSDictionary *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    listeners = v2->_listeners;
    v2->_listeners = v13;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred_1 != -1)
    dispatch_once(&sharedInstance_pred_1, &__block_literal_global_10);
  return (id)sharedInstance___instance_4;
}

void __46__SUServerConfigurationManager_sharedInstance__block_invoke()
{
  SUServerConfigurationManager *v0;
  void *v1;

  v0 = objc_alloc_init(SUServerConfigurationManager);
  v1 = (void *)sharedInstance___instance_4;
  sharedInstance___instance_4 = (uint64_t)v0;

}

- (void)addListener:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUServerConfigurationManager_addListener___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

uint64_t __44__SUServerConfigurationManager_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SUServerConfigurationManager_removeListener___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

uint64_t __47__SUServerConfigurationManager_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (NSNumber)softwareUpdateAutoScanInterval
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__SUServerConfigurationManager_softwareUpdateAutoScanInterval__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

void __62__SUServerConfigurationManager_softwareUpdateAutoScanInterval__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getNumberConfigForKey:", *MEMORY[0x24BEAEAA0]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)defaultToOldInactivityPredictor
{
  SUServerConfigurationManager *v2;
  NSObject *stateQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = v2->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__SUServerConfigurationManager_defaultToOldInactivityPredictor__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __63__SUServerConfigurationManager_defaultToOldInactivityPredictor__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getNumberConfigForKey:", CFSTR("FallbackToCoreDuetInactivityPredictor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (BOOL)_queue_didValueChange:(id)a3 oldConfig:(id)a4 newConfig:(id)a5 type:(unint64_t)a6 valueRemoved:(BOOL *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a6)
  {
    SULogInfo(CFSTR("Unknown SUServerConfigValueType %lu"), v15, v16, v17, v18, v19, v20, v21, a6);
    v22 = 0;
  }
  else
  {
    v22 = -[SUServerConfigurationManager _queue_didNumberValueChange:oldConfig:newConfig:valueRemoved:](self, "_queue_didNumberValueChange:oldConfig:newConfig:valueRemoved:", v12, v13, v14, a7);
  }

  return v22;
}

- (BOOL)_queue_didNumberValueChange:(id)a3 oldConfig:(id)a4 newConfig:(id)a5 valueRemoved:(BOOL *)a6
{
  NSObject *stateQueue;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v16;

  stateQueue = self->_stateQueue;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 || v14)
  {
    v15 = 1;
    if (v13 || !v14)
    {
      if (!v13 || !v14 || (v16 = objc_msgSend(v13, "intValue"), v16 == objc_msgSend(v14, "intValue")))
        v15 = 0;
    }
  }
  else
  {
    v15 = 1;
    if (a6)
      *a6 = 1;
  }

  return v15;
}

- (void)coreConfigServerSettingsUpdated:(id)a3 error:(id)a4
{
  id v5;
  NSObject *stateQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SUServerConfigurationManager *v10;

  v5 = a3;
  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__SUServerConfigurationManager_coreConfigServerSettingsUpdated_error___block_invoke;
  v8[3] = &unk_24CE3B610;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(stateQueue, v8);

}

void __70__SUServerConfigurationManager_coreConfigServerSettingsUpdated_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Projects"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEAEAA8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Changed"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Removed"));
    v7 = *MEMORY[0x24BEAEAA0];
    if (objc_msgSend(*(id *)(a1 + 40), "_queue_didNumberValueChange:oldConfig:newConfig:valueRemoved:", *MEMORY[0x24BEAEAA0], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), v3, &v22))
    {
      if (v22)
      {
        objc_msgSend(v6, "addObject:", v7);
      }
      else
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v7);

      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 40), v3);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = *(id *)(*(_QWORD *)(a1 + 40) + 24);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v12)
      {
        v13 = v12;
        v17 = v6;
        v14 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v16, "serverConfigManager:configValuesChanged:", *(_QWORD *)(a1 + 40), v4);
          }
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v13);
        v6 = v17;
      }
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = v3;
      v10 = *(id *)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v9;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_projectConfig, 0);
  objc_storeStrong((id *)&self->_suCoreServerConfig, 0);
}

@end
