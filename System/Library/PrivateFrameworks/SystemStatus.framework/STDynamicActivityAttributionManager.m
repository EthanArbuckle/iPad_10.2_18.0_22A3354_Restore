@implementation STDynamicActivityAttributionManager

- (STDynamicActivityAttributionManager)init
{
  STDynamicActivityAttributionManager *v3;
  STLocalDynamicActivityAttributionManager *v4;

  if (_os_feature_enabled_impl())
  {
    v3 = -[STDynamicActivityAttributionManager initWithLocalManager:]((id *)&self->super.isa, 0);
  }
  else
  {
    v4 = objc_alloc_init(STLocalDynamicActivityAttributionManager);
    v3 = -[STDynamicActivityAttributionManager initWithLocalManager:]((id *)&self->super.isa, v4);

  }
  return v3;
}

- (id)initWithLocalManager:(id *)a1
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  STDynamicActivityAttributionMonitor *v8;
  id v9;
  objc_super v11;

  v4 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)STDynamicActivityAttributionManager;
    v5 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v5;
    if (v5)
    {
      *((_DWORD *)v5 + 2) = 0;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = a1[4];
      a1[4] = (id)v6;

      objc_storeStrong(a1 + 2, a2);
      if (!v4)
      {
        v8 = objc_alloc_init(STDynamicActivityAttributionMonitor);
        v9 = a1[3];
        a1[3] = v8;

        objc_msgSend(a1[3], "activate");
      }
    }
  }

  return a1;
}

- (void)dealloc
{
  STDynamicActivityAttributionManager *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (STDynamicActivityAttributionManager *)self->_monitor;
  -[STDynamicActivityAttributionManager invalidate](self, "invalidate");
  v3.receiver = v2;
  v3.super_class = (Class)STDynamicActivityAttributionManager;
  -[STDynamicActivityAttributionManager dealloc](&v3, sel_dealloc);
}

- (id)currentAttributionKeyForClient:(id)a3
{
  id v4;
  STLocalDynamicActivityAttributionManager *v5;
  STLocalDynamicActivityAttributionManager *v6;
  void *v7;
  STDynamicActivityAttributionMonitor *monitor;
  STDynamicActivityAttributionMonitor *v9;
  void *v10;
  STLocalDynamicActivityAttributionManager *v11;
  void *v12;
  _QWORD v14[4];
  STLocalDynamicActivityAttributionManager *v15;

  v4 = a3;
  if (!self)
  {
    monitor = 0;
    goto LABEL_5;
  }
  v5 = self->_localManager;
  if (!v5)
  {
    monitor = self->_monitor;
LABEL_5:
    v9 = monitor;
    -[STDynamicActivityAttributionMonitor currentAttributions](v9, "currentAttributions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__STDynamicActivityAttributionManager_currentAttributionKeyForClient___block_invoke;
    v14[3] = &unk_1E91E4B78;
    v11 = (STLocalDynamicActivityAttributionManager *)v4;

    v15 = v11;
    objc_msgSend(v10, "bs_firstObjectPassingTest:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "localizationKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v15;
    goto LABEL_6;
  }
  v6 = v5;
  -[STLocalDynamicActivityAttributionManager currentAttributionKeyForClient:](v5, "currentAttributionKeyForClient:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

uint64_t __70__STDynamicActivityAttributionManager_currentAttributionKeyForClient___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "clientExecutablePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)currentAttributedAppForClient:(id)a3
{
  id v4;
  STLocalDynamicActivityAttributionManager *v5;
  STLocalDynamicActivityAttributionManager *v6;
  void *v7;
  STDynamicActivityAttributionMonitor *monitor;
  STDynamicActivityAttributionMonitor *v9;
  void *v10;
  STLocalDynamicActivityAttributionManager *v11;
  void *v12;
  _QWORD v14[4];
  STLocalDynamicActivityAttributionManager *v15;

  v4 = a3;
  if (!self)
  {
    monitor = 0;
    goto LABEL_5;
  }
  v5 = self->_localManager;
  if (!v5)
  {
    monitor = self->_monitor;
LABEL_5:
    v9 = monitor;
    -[STDynamicActivityAttributionMonitor currentAttributions](v9, "currentAttributions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__STDynamicActivityAttributionManager_currentAttributedAppForClient___block_invoke;
    v14[3] = &unk_1E91E4B78;
    v11 = (STLocalDynamicActivityAttributionManager *)v4;

    v15 = v11;
    objc_msgSend(v10, "bs_firstObjectPassingTest:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v15;
    goto LABEL_6;
  }
  v6 = v5;
  -[STLocalDynamicActivityAttributionManager currentAttributedAppForClient:](v5, "currentAttributedAppForClient:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

uint64_t __69__STDynamicActivityAttributionManager_currentAttributedAppForClient___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "clientExecutablePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)currentAttributionForClient:(id *)a3
{
  STDynamicActivityAttributionManager *v4;
  STLocalDynamicActivityAttributionManager *v5;
  STLocalDynamicActivityAttributionManager *v6;
  __int128 v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if (self)
  {
    v4 = self;
    v5 = self->_localManager;
    if (v5)
    {
      v6 = v5;
      v7 = *(_OWORD *)&a3->var0[4];
      v11 = *(_OWORD *)a3->var0;
      v12 = v7;
      -[STLocalDynamicActivityAttributionManager currentAttributionForClient:](v5, "currentAttributionForClient:", &v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
    self = (STDynamicActivityAttributionManager *)v4->_monitor;
  }
  v10 = *(_OWORD *)&a3->var0[4];
  v11 = *(_OWORD *)a3->var0;
  v12 = v10;
  -[STDynamicActivityAttributionManager attributionForClient:](self, "attributionForClient:", &v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)currentAttributionForAttribution:(id)a3
{
  id v4;
  STLocalDynamicActivityAttributionManager *v5;
  STLocalDynamicActivityAttributionManager *v6;
  void *v7;
  STDynamicActivityAttributionMonitor *monitor;

  v4 = a3;
  if (!self)
  {
    monitor = 0;
    goto LABEL_5;
  }
  v5 = self->_localManager;
  if (!v5)
  {
    monitor = self->_monitor;
LABEL_5:
    -[STDynamicActivityAttributionMonitor attributionForAttribution:](monitor, "attributionForAttribution:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = v5;
  -[STLocalDynamicActivityAttributionManager currentAttributionForAttribution:](v5, "currentAttributionForAttribution:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v7;
}

- (void)setLocalizableAttributionKey:(id)a3 andApplication:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;
  STLocalDynamicActivityAttributionManager *v10;
  STLocalDynamicActivityAttributionManager *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (self)
  {
    v10 = self->_localManager;
    if (v10)
    {
      v11 = v10;
      -[STLocalDynamicActivityAttributionManager setLocalizableAttributionKey:andApplication:forClient:](v10, "setLocalizableAttributionKey:andApplication:forClient:", v12, v8, v9);

    }
  }

}

- (void)setAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8;
  id v9;
  STLocalDynamicActivityAttributionManager *v10;
  STLocalDynamicActivityAttributionManager *v11;
  __int128 v12;
  _OWORD v13[2];

  v8 = a3;
  v9 = a5;
  if (self)
  {
    v10 = self->_localManager;
    if (v10)
    {
      v11 = v10;
      v12 = *(_OWORD *)&a4->var0[4];
      v13[0] = *(_OWORD *)a4->var0;
      v13[1] = v12;
      -[STLocalDynamicActivityAttributionManager setAttributionLocalizableKey:maskingClientAuditToken:forClient:](v10, "setAttributionLocalizableKey:maskingClientAuditToken:forClient:", v8, v13, v9);

    }
  }

}

- (void)setAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8;
  id v9;
  STLocalDynamicActivityAttributionManager *v10;
  STLocalDynamicActivityAttributionManager *v11;
  __int128 v12;
  _OWORD v13[2];

  v8 = a3;
  v9 = a5;
  if (self)
  {
    v10 = self->_localManager;
    if (v10)
    {
      v11 = v10;
      v12 = *(_OWORD *)&a4->var0[4];
      v13[0] = *(_OWORD *)a4->var0;
      v13[1] = v12;
      -[STLocalDynamicActivityAttributionManager setAttributionStringWithFormat:maskingClientAuditToken:forClient:](v10, "setAttributionStringWithFormat:maskingClientAuditToken:forClient:", v8, v13, v9);

    }
  }

}

- (void)setAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8;
  id v9;
  STLocalDynamicActivityAttributionManager *v10;
  STLocalDynamicActivityAttributionManager *v11;
  __int128 v12;
  _OWORD v13[2];

  v8 = a3;
  v9 = a5;
  if (self)
  {
    v10 = self->_localManager;
    if (v10)
    {
      v11 = v10;
      v12 = *(_OWORD *)&a4->var0[4];
      v13[0] = *(_OWORD *)a4->var0;
      v13[1] = v12;
      -[STLocalDynamicActivityAttributionManager setAttributionWebsiteString:maskingClientAuditToken:forClient:](v10, "setAttributionWebsiteString:maskingClientAuditToken:forClient:", v8, v13, v9);

    }
  }

}

- (void)subscribeToUpdates:(id)a3
{
  id v4;
  STLocalDynamicActivityAttributionManager *v5;
  NSMutableSet *v6;
  os_unfair_lock_s *p_clientLock;
  NSMutableSet *lock_registeredClients;
  uint64_t v9;
  STDynamicActivityAttributionMonitor *monitor;
  STDynamicActivityAttributionMonitor *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id location;

  v4 = a3;
  if (self)
  {
    v5 = self->_localManager;
    if (v5)
    {
      v6 = (NSMutableSet *)v5;
      -[STLocalDynamicActivityAttributionManager subscribeToUpdates:](v5, "subscribeToUpdates:", v4);
      goto LABEL_10;
    }
    p_clientLock = &self->_clientLock;
    os_unfair_lock_lock(&self->_clientLock);
    lock_registeredClients = self->_lock_registeredClients;
  }
  else
  {
    p_clientLock = (os_unfair_lock_s *)8;
    os_unfair_lock_lock((os_unfair_lock_t)8);
    lock_registeredClients = 0;
  }
  v6 = lock_registeredClients;
  v9 = -[NSMutableSet count](v6, "count");
  -[NSMutableSet addObject:](v6, "addObject:", v4);
  os_unfair_lock_unlock(p_clientLock);
  if (self)
    monitor = self->_monitor;
  else
    monitor = 0;
  v11 = monitor;
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  if (!v9)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__STDynamicActivityAttributionManager_subscribeToUpdates___block_invoke;
    v19[3] = &unk_1E91E4BA0;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    -[STDynamicActivityAttributionMonitor setHandler:](v11, "setHandler:", v19);
    objc_destroyWeak(&v20);
  }
  -[STDynamicActivityAttributionMonitor currentAttributions](v11, "currentAttributions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __58__STDynamicActivityAttributionManager_subscribeToUpdates___block_invoke_2;
  block[3] = &unk_1E91E4AD8;
  v17 = v4;
  v18 = v13;
  v15 = v13;
  dispatch_async(v14, block);

  objc_destroyWeak(&location);
LABEL_10:

}

void __58__STDynamicActivityAttributionManager_subscribeToUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  os_unfair_lock_lock(WeakRetained + 2);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 32);
  else
    v6 = 0;
  v7 = (void *)objc_msgSend(v6, "copy");
  os_unfair_lock_unlock(WeakRetained + 2);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "currentAttributionsDidChange:", v3, (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

uint64_t __58__STDynamicActivityAttributionManager_subscribeToUpdates___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "currentAttributionsDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)unsubscribeFromUpdates:(id)a3
{
  STLocalDynamicActivityAttributionManager *v4;
  NSMutableSet *v5;
  os_unfair_lock_s *p_clientLock;
  NSMutableSet *lock_registeredClients;
  uint64_t v8;
  STDynamicActivityAttributionMonitor *monitor;
  id v10;

  v10 = a3;
  if (self)
  {
    v4 = self->_localManager;
    if (v4)
    {
      v5 = (NSMutableSet *)v4;
      -[STLocalDynamicActivityAttributionManager unsubscribeFromUpdates:](v4, "unsubscribeFromUpdates:", v10);
      goto LABEL_9;
    }
    p_clientLock = &self->_clientLock;
    os_unfair_lock_lock(&self->_clientLock);
    lock_registeredClients = self->_lock_registeredClients;
  }
  else
  {
    p_clientLock = (os_unfair_lock_s *)8;
    os_unfair_lock_lock((os_unfair_lock_t)8);
    lock_registeredClients = 0;
  }
  v5 = lock_registeredClients;
  -[NSMutableSet removeObject:](v5, "removeObject:", v10);
  v8 = -[NSMutableSet count](v5, "count");
  os_unfair_lock_unlock(p_clientLock);
  if (!v8)
  {
    if (self)
      monitor = self->_monitor;
    else
      monitor = 0;
    -[STDynamicActivityAttributionMonitor setHandler:](monitor, "setHandler:", 0);
  }
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_registeredClients, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_localManager, 0);
}

@end
