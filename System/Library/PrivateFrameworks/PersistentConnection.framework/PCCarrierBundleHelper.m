@implementation PCCarrierBundleHelper

+ (id)helper
{
  if (helper_onceToken != -1)
    dispatch_once(&helper_onceToken, &__block_literal_global_7);
  return (id)helper_sInstance;
}

void __31__PCCarrierBundleHelper_helper__block_invoke()
{
  PCCarrierBundleHelper *v0;
  void *v1;

  v0 = objc_alloc_init(PCCarrierBundleHelper);
  v1 = (void *)helper_sInstance;
  helper_sInstance = (uint64_t)v0;

}

- (PCCarrierBundleHelper)init
{
  PCCarrierBundleHelper *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  CoreTelephonyClient *ctClient;
  uint64_t v7;
  CTBundle *bundle;
  CoreTelephonyClient *v9;
  void *v10;
  id v11;
  uint64_t v12;
  CTXPCServiceSubscriptionContext *currentDataContext;
  NSDictionary *cachedPushSettings;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PCCarrierBundleHelper;
  v2 = -[PCCarrierBundleHelper init](&v17, sel_init);
  if (v2)
  {
    PCCreateQueue("PCCarrierBundleHelper-ctQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v2->_queue);
    ctClient = v2->_ctClient;
    v2->_ctClient = (CoreTelephonyClient *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 2);
    bundle = v2->_bundle;
    v2->_bundle = (CTBundle *)v7;

    -[CoreTelephonyClient setDelegate:](v2->_ctClient, "setDelegate:", v2);
    v9 = v2->_ctClient;
    v16 = 0;
    -[CoreTelephonyClient getCurrentDataSubscriptionContextSync:](v9, "getCurrentDataSubscriptionContextSync:", &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (v11 || !v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl(&dword_1CBC1B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to get currentDataSimContext. {error: %@}", buf, 0xCu);
      }
    }
    else
    {
      v12 = objc_msgSend(v10, "copy");
      currentDataContext = v2->_currentDataContext;
      v2->_currentDataContext = (CTXPCServiceSubscriptionContext *)v12;

    }
    cachedPushSettings = v2->_cachedPushSettings;
    v2->_cachedPushSettings = 0;

  }
  return v2;
}

- (id)copyValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  PCCarrierBundleHelper *v7;
  void *v8;
  CoreTelephonyClient *ctClient;
  CTBundle *bundle;
  void *v11;
  id v12;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)-[CTXPCServiceSubscriptionContext copy](v7->_currentDataContext, "copy");
  objc_sync_exit(v7);

  if (v8)
  {
    if (a4)
      *a4 = 0;
    ctClient = v7->_ctClient;
    bundle = v7->_bundle;
    v14 = 0;
    v11 = (void *)-[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](ctClient, "copyCarrierBundleValue:key:bundleType:error:", v8, v6, bundle, &v14);
    v12 = v14;
    if (v12)
    {

      if (a4)
        *a4 = objc_retainAutorelease(v12);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PCCarrierBundleHelper copyValueForKey:error:].cold.1((uint64_t)v6, (uint64_t)v12);
      v11 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CBC1B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trying to copy carrier bundle value but we don't have a valid CTXPCServiceSubscriptionContext yet", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)copyValueFromPushBundleForKey:(id)a3 error:(id *)a4
{
  id v6;
  PCCarrierBundleHelper *v7;
  NSDictionary *cachedPushSettings;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSDictionary *v14;
  PCCarrierBundleHelper *v15;
  NSDictionary *v16;
  NSDictionary *v17;
  void *v18;
  void *v19;
  id v21;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = self;
  objc_sync_enter(v7);
  cachedPushSettings = v7->_cachedPushSettings;
  if (cachedPushSettings)
  {
    -[NSDictionary objectForKey:](cachedPushSettings, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "copy");

    objc_sync_exit(v7);
  }
  else
  {
    objc_sync_exit(v7);

    v21 = 0;
    v11 = -[PCCarrierBundleHelper copyValueForKey:error:](v7, "copyValueForKey:error:", CFSTR("PushSettings"), &v21);
    v12 = v21;
    v13 = v12;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = (NSDictionary *)v11;
      v15 = v7;
      objc_sync_enter(v15);
      v16 = v7->_cachedPushSettings;
      v7->_cachedPushSettings = v14;
      v17 = v14;

      objc_sync_exit(v15);
      -[NSDictionary objectForKey:](v17, "objectForKey:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(v18, "copy");
    }
    else
    {
      v19 = 0;
    }
    v10 = v19;

  }
  return v10;
}

- (BOOL)BOOLValueFromPushBundleForKey:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v11;

  if (a4)
    *a4 = 0;
  v5 = a3;
  +[PCCarrierBundleHelper helper](PCCarrierBundleHelper, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = (void *)objc_msgSend(v6, "copyValueFromPushBundleForKey:error:", v5, &v11);

  v8 = v11;
  if (a4)
    *a4 = objc_retainAutorelease(v8);
  v9 = objc_msgSend(v7, "BOOLValue");

  return v9;
}

- (void)addDelegate:(id)a3
{
  PCCarrierBundleHelper *v4;
  id v5;
  NSHashTable *delegates;
  uint64_t v7;
  NSHashTable *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = v9;
  delegates = v4->_delegates;
  if (!delegates)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    v8 = v4->_delegates;
    v4->_delegates = (NSHashTable *)v7;

    delegates = v4->_delegates;
    v5 = v9;
  }
  -[NSHashTable addObject:](delegates, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeDelegate:(id)a3
{
  PCCarrierBundleHelper *v4;
  NSHashTable *delegates;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_delegates, "removeObject:", v6);
  if (!-[NSHashTable count](v4->_delegates, "count"))
  {
    delegates = v4->_delegates;
    v4->_delegates = 0;

  }
  objc_sync_exit(v4);

}

- (void)_processCarrierBundleChange:(id)a3
{
  id v4;
  PCCarrierBundleHelper *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  NSDictionary *cachedPushSettings;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = 0;
  if (v4 && v5->_currentDataContext)
  {
    v7 = objc_msgSend(v4, "slotID");
    v6 = v7 == -[CTXPCServiceSubscriptionContext slotID](v5->_currentDataContext, "slotID");
  }
  v8 = (void *)-[NSHashTable copy](v5->_delegates, "copy");
  cachedPushSettings = v5->_cachedPushSettings;
  v5->_cachedPushSettings = 0;

  objc_sync_exit(v5);
  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "carrierBundleDidChange", (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)_updateCurrentDataSimContext:(id)a3
{
  CTXPCServiceSubscriptionContext *v4;
  CTXPCServiceSubscriptionContext *currentDataContext;
  PCCarrierBundleHelper *obj;

  v4 = (CTXPCServiceSubscriptionContext *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentDataContext = obj->_currentDataContext;
  obj->_currentDataContext = v4;

  objc_sync_exit(obj);
}

- (void)operatorBundleChange:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1CBC1B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "operatorBundleChange - context %@", (uint8_t *)&v5, 0xCu);
  }
  -[PCCarrierBundleHelper _processCarrierBundleChange:](self, "_processCarrierBundleChange:", v4);

}

- (void)currentDataSimChanged:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1CBC1B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "currentDataSimChanged - context %@", (uint8_t *)&v5, 0xCu);
  }
  -[PCCarrierBundleHelper _updateCurrentDataSimContext:](self, "_updateCurrentDataSimContext:", v4);
  -[PCCarrierBundleHelper _processCarrierBundleChange:](self, "_processCarrierBundleChange:", v4);

}

- (NSDictionary)cachedPushSettings
{
  return self->_cachedPushSettings;
}

- (void)setCachedPushSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPushSettings, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_currentDataContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
}

- (void)copyValueForKey:(uint64_t)a1 error:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_1CBC1B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to copy carrier bundle value. {key: %@, error: %@}", (uint8_t *)&v2, 0x16u);
}

@end
