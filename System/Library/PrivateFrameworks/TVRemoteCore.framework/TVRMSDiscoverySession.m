@implementation TVRMSDiscoverySession

+ (id)localDiscoverySession
{
  return objc_alloc_init(TVRMSDiscoverySession);
}

+ (id)proxyDiscoverySession
{
  return objc_alloc_init(TVRMSDiscoverySessionProxy);
}

- (TVRMSDiscoverySession)init
{
  TVRMSDiscoverySession *v2;
  uint64_t v3;
  NSMutableSet *availableServices;
  uint64_t v5;
  TVRMSReachability *reachability;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVRMSDiscoverySession;
  v2 = -[TVRMSDiscoverySession init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    availableServices = v2->_availableServices;
    v2->_availableServices = (NSMutableSet *)v3;

    +[TVRMSReachability reachabilityForLocalWiFi](TVRMSReachability, "reachabilityForLocalWiFi");
    v5 = objc_claimAutoreleasedReturnValue();
    reachability = v2->_reachability;
    v2->_reachability = (TVRMSReachability *)v5;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleHSGroupIDDidChangeNotification_, *MEMORY[0x24BE4F310], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleReachabilityChangedNotification_, kReachabilityChangedNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TVRMSDiscoverySession endDiscovery](self, "endDiscovery");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVRMSDiscoverySession;
  -[TVRMSDiscoverySession dealloc](&v4, sel_dealloc);
}

- (void)beginDiscovery
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TVRMSDiscoverySession endDiscovery](self, "endDiscovery");
  -[TVRMSDiscoverySession _enableProviders](self, "_enableProviders");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_providers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "beginDiscovery", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[TVRMSReachability startNotifier](self->_reachability, "startNotifier");
  -[TVRMSDiscoverySession _updateWifiAvailability](self, "_updateWifiAvailability");
}

- (void)endDiscovery
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TVRMSReachability stopNotifier](self->_reachability, "stopNotifier");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_providers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "endDiscovery", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_availableServices, "removeAllObjects");
}

- (NSArray)availableServices
{
  return (NSArray *)-[NSMutableSet allObjects](self->_availableServices, "allObjects");
}

- (void)setPairedNetworkNames:(id)a3
{
  id v4;
  void *v5;
  NSArray **p_pairedNetworkNames;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x24BDBD1A8];
  p_pairedNetworkNames = &self->_pairedNetworkNames;
  objc_storeStrong((id *)&self->_pairedNetworkNames, v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_providers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v12, "setPairedNetworkNames:", *p_pairedNetworkNames, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)serviceProvider:(id)a3 serviceDidBecomeAvailable:(id)a4
{
  id WeakRetained;

  if (a4)
  {
    -[NSMutableSet addObject:](self->_availableServices, "addObject:", a4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "discoverySessionDidUpdateAvailableServices:", self);

  }
}

- (void)serviceProvider:(id)a3 serviceDidBecomeUnavailable:(id)a4
{
  id WeakRetained;

  -[NSMutableSet removeObject:](self->_availableServices, "removeObject:", a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "discoverySessionDidUpdateAvailableServices:", self);

}

- (void)_enableProviders
{
  NSArray *v3;
  int64_t discoveryTypes;
  uint64_t i;
  void *v6;
  void *v7;
  NSArray *providers;

  v3 = (NSArray *)objc_opt_new();
  discoveryTypes = self->_discoveryTypes;
  if (discoveryTypes >= 1)
  {
    for (i = 1; i <= discoveryTypes; i *= 2)
    {
      if ((discoveryTypes & i) != 0)
      {
        -[TVRMSDiscoverySession _providerForDiscoveryType:](self, "_providerForDiscoveryType:", i);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          objc_msgSend(v6, "setDelegate:", self);
          -[NSArray addObject:](v3, "addObject:", v7);
        }

        discoveryTypes = self->_discoveryTypes;
      }
    }
  }
  providers = self->_providers;
  self->_providers = v3;

}

- (id)_providerForDiscoveryType:(int64_t)a3
{
  NSObject *v4;
  NSObject *v6;
  void *v7;
  NSObject *v9;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 4:
      _TVRCRMSLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Enabling pairing discovery provider", (uint8_t *)&v10, 2u);
      }

      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setPairedNetworkNames:", self->_pairedNetworkNames);
      return v7;
    case 2:
      _TVRCRMSLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Enabling appleTV discovery provider", (uint8_t *)&v10, 2u);
      }
      goto LABEL_12;
    case 1:
      _TVRCRMSLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Enabling home-sharing discovery provider", (uint8_t *)&v10, 2u);
      }
LABEL_12:

      return (id)objc_opt_new();
    default:
      _TVRCRMSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134217984;
        v11 = a3;
        _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Discovery controller attempted to enable unknown provider type: %td", (uint8_t *)&v10, 0xCu);
      }

      return 0;
  }
}

- (void)_handleHSGroupIDDidChangeNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _TVRCRMSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Home sharing ID changed, restarting discovery", v5, 2u);
  }

  -[TVRMSDiscoverySession endDiscovery](self, "endDiscovery");
  -[TVRMSDiscoverySession beginDiscovery](self, "beginDiscovery");
}

- (void)_updateWifiAvailability
{
  _BOOL4 v3;
  id WeakRetained;
  char v5;
  id v6;

  v3 = -[TVRMSReachability currentReachabilityStatus](self->_reachability, "currentReachabilityStatus") != 0;
  if (self->_networkAvailable != v3)
  {
    self->_networkAvailable = v3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "discoverySessionNetworkAvailabilityDidChange:", self);

    }
  }
}

- (TVRMSDiscoverySessionDelegate)delegate
{
  return (TVRMSDiscoverySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)discoveryTypes
{
  return self->_discoveryTypes;
}

- (void)setDiscoveryTypes:(int64_t)a3
{
  self->_discoveryTypes = a3;
}

- (BOOL)isNetworkAvailable
{
  return self->_networkAvailable;
}

- (NSArray)pairedNetworkNames
{
  return self->_pairedNetworkNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedNetworkNames, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_availableServices, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
}

@end
