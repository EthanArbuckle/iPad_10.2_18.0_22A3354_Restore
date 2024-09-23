@implementation TVRMSBonjourServiceProvider

- (TVRMSBonjourServiceProvider)init
{
  TVRMSBonjourServiceProvider *v2;
  uint64_t v3;
  NSMutableDictionary *services;
  uint64_t v5;
  NSNetServiceBrowser *netServiceBrowser;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *cache;
  uint64_t v10;
  NSMutableDictionary *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TVRMSBonjourServiceProvider;
  v2 = -[TVRMSBonjourServiceProvider init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    services = v2->_services;
    v2->_services = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    netServiceBrowser = v2->_netServiceBrowser;
    v2->_netServiceBrowser = (NSNetServiceBrowser *)v5;

    -[NSNetServiceBrowser setDelegate:](v2->_netServiceBrowser, "setDelegate:", v2);
    CFPreferencesAppSynchronize(CFSTR("com.apple.TVRemoteMediaServices"));
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("BonjourCacheKey"), CFSTR("com.apple.TVRemoteMediaServices"));
    v8 = objc_msgSend(v7, "mutableCopy");
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v8;

    if (!v2->_cache)
    {
      v10 = objc_opt_new();
      v11 = v2->_cache;
      v2->_cache = (NSMutableDictionary *)v10;

    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSNetServiceBrowser setDelegate:](self->_netServiceBrowser, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TVRMSBonjourServiceProvider;
  -[TVRMSBonjourServiceProvider dealloc](&v3, sel_dealloc);
}

- (NSString)searchType
{
  return (NSString *)CFSTR("_daap._tcp.");
}

- (NSString)searchDomain
{
  return (NSString *)CFSTR("local.");
}

- (NSString)searchScope
{
  return 0;
}

- (int64_t)serviceDiscoverySource
{
  return 0;
}

- (void)beginDiscovery
{
  void *v3;
  NSObject *v4;
  NSNetServiceBrowser *netServiceBrowser;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[TVRMSBonjourServiceProvider _searchString](self, "_searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRCRMSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Searching for services of type: %@", (uint8_t *)&v7, 0xCu);
  }

  netServiceBrowser = self->_netServiceBrowser;
  -[TVRMSBonjourServiceProvider searchDomain](self, "searchDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNetServiceBrowser searchForServicesOfType:inDomain:](netServiceBrowser, "searchForServicesOfType:inDomain:", v3, v6);

}

- (void)endDiscovery
{
  -[NSNetServiceBrowser stop](self->_netServiceBrowser, "stop");
}

- (int64_t)serviceTypeFromTXTDictionary:(id)a3
{
  void *v3;
  int64_t v4;

  -[TVRMSBonjourServiceProvider _valueForTXTRecordKey:inTXTDictionary:](self, "_valueForTXTRecordKey:inTXTDictionary:", CFSTR("DvTy"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsString:", CFSTR("AppleTV")))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (int64_t)serviceLegacyFlagsFromTXTDictionary:(id)a3
{
  return 0;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  TVRMSService *v8;
  void *v9;
  void *v10;
  void *v11;
  TVRMSService *v12;
  NSObject *v13;
  id WeakRetained;
  int v15;
  TVRMSService *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _TVRCRMSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v8 = (TVRMSService *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "Net service browser did find service: %@", (uint8_t *)&v15, 0xCu);

  }
  -[TVRMSBonjourServiceProvider _identifierForNetService:](self, "_identifierForNetService:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "startMonitoring");
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setState:", 0);
  objc_msgSend(v10, "setNetService:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_services, "setObject:forKeyedSubscript:", v10, v9);
  -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[TVRMSService initWithData:]([TVRMSService alloc], "initWithData:", v11);
    objc_msgSend(v10, "setService:", v12);
    objc_msgSend(v10, "setAvailable:", 1);
    _TVRCRMSLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v12;
      _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Found cached data for service: %@", (uint8_t *)&v15, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "serviceProvider:serviceDidBecomeAvailable:", self, v12);

  }
  else
  {
    v12 = (TVRMSService *)objc_opt_new();
    objc_msgSend(v10, "setService:", v12);
  }

}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  -[TVRMSBonjourServiceProvider _identifierForNetService:](self, "_identifierForNetService:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isAvailable"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "serviceProvider:serviceDidBecomeUnavailable:", self, v8);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_services, "removeObjectForKey:", v9);

}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id WeakRetained;
  NSObject *v19;
  int v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[TVRMSBonjourServiceProvider _identifierForNetService:](self, "_identifierForNetService:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRCRMSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v11)
    {
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v6, "name");
    v16 = objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v16;
    _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Service no longer exists for: %@", (uint8_t *)&v20, 0xCu);
LABEL_11:

    goto LABEL_16;
  }
  if (v11)
  {
    objc_msgSend(v6, "name");
    v12 = objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v12;
    _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Service txt record update: %@", (uint8_t *)&v20, 0xCu);

  }
  v13 = objc_msgSend(v9, "state");
  if (v13 == 2)
  {
    _TVRCRMSLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_21A51B000, v17, OS_LOG_TYPE_DEFAULT, "DNS resolution already complete for this service, updating clients immediately", (uint8_t *)&v20, 2u);
    }

    objc_msgSend(v9, "service");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[TVRMSBonjourServiceProvider _updateService:withNetService:txtData:](self, "_updateService:withNetService:txtData:", v10, v6, v7);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "serviceProvider:serviceDidBecomeAvailable:", self, v10);

      -[TVRMSBonjourServiceProvider _updateCacheWithService:identifier:](self, "_updateCacheWithService:identifier:", v10, v8);
      goto LABEL_16;
    }
    _TVRCRMSLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "name");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v19;
      _os_log_impl(&dword_21A51B000, v16, OS_LOG_TYPE_DEFAULT, "Bonjour service no longer exists for: %@", (uint8_t *)&v20, 0xCu);

    }
    goto LABEL_11;
  }
  if (!v13)
  {
    _TVRCRMSLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "name");
      v15 = objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v15;
      _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, "Performing DNS resolution for service: %@", (uint8_t *)&v20, 0xCu);

    }
    objc_msgSend(v9, "setState:", 1);
    objc_msgSend(v6, "resolveWithTimeout:", 10.0);
  }
LABEL_17:

}

- (void)_updateCacheWithService:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary setObject:forKey:](self->_cache, "setObject:forKey:", v8, v7);
    CFPreferencesSetAppValue(CFSTR("BonjourCacheKey"), self->_cache, CFSTR("com.apple.TVRemoteMediaServices"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.TVRemoteMediaServices"));
  }
  else
  {
    _TVRCRMSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Unable to update service cache: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id WeakRetained;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVRMSBonjourServiceProvider _identifierForNetService:](self, "_identifierForNetService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    _TVRCRMSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    objc_msgSend(v4, "name");
    v16 = objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v16;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Service no longer exists for: %@", (uint8_t *)&v18, 0xCu);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v6, "setAvailable:", 1);
  objc_msgSend(v7, "setState:", 2);
  objc_msgSend(v7, "service");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _TVRCRMSLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v17;
      _os_log_impl(&dword_21A51B000, v16, OS_LOG_TYPE_DEFAULT, "Bonjour service no longer exists for: %@", (uint8_t *)&v18, 0xCu);

    }
    goto LABEL_10;
  }
  objc_msgSend(v4, "TXTRecordData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSBonjourServiceProvider _updateService:withNetService:txtData:](self, "_updateService:withNetService:txtData:", v8, v4, v9);

  _TVRCRMSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject displayName](v8, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Service [%@] resolved and fully available: %@, source: %@", (uint8_t *)&v18, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "serviceProvider:serviceDidBecomeAvailable:", self, v8);

  -[TVRMSBonjourServiceProvider _updateCacheWithService:identifier:](self, "_updateCacheWithService:identifier:", v8, v5);
LABEL_11:

}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCRMSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Service did not resolve: %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(v4, "resolveWithTimeout:", 30.0);

}

- (void)_updateService:(id)a3 withNetService:(id)a4 txtData:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = (void *)MEMORY[0x24BDD16B8];
  v9 = a4;
  objc_msgSend(v8, "dictionaryFromTXTRecordData:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNetworkName:", v11);

  objc_msgSend(v9, "hostName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHostName:", v12);

  v13 = objc_msgSend(v9, "port");
  objc_msgSend(v16, "setPort:", v13);
  objc_msgSend(v16, "setServiceType:", -[TVRMSBonjourServiceProvider serviceTypeFromTXTDictionary:](self, "serviceTypeFromTXTDictionary:", v10));
  objc_msgSend(v16, "setServiceLegacyFlags:", -[TVRMSBonjourServiceProvider serviceLegacyFlagsFromTXTDictionary:](self, "serviceLegacyFlagsFromTXTDictionary:", v10));
  -[TVRMSBonjourServiceProvider _valueForTXTRecordKey:inTXTDictionary:](self, "_valueForTXTRecordKey:inTXTDictionary:", CFSTR("hG"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHomeSharingGroupKey:", v14);
  objc_msgSend(v16, "setServiceDiscoverySource:", -[TVRMSBonjourServiceProvider serviceDiscoverySource](self, "serviceDiscoverySource"));
  -[TVRMSBonjourServiceProvider _valueForTXTRecordKey:inTXTDictionary:](self, "_valueForTXTRecordKey:inTXTDictionary:", CFSTR("Name"), v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[TVRMSBonjourServiceProvider _valueForTXTRecordKey:inTXTDictionary:](self, "_valueForTXTRecordKey:inTXTDictionary:", CFSTR("Machine Name"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      -[TVRMSBonjourServiceProvider _valueForTXTRecordKey:inTXTDictionary:](self, "_valueForTXTRecordKey:inTXTDictionary:", CFSTR("CtlN"), v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v16, "setDisplayName:", v15);

}

- (id)_valueForTXTRecordKey:(id)a3 inTXTDictionary:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a4, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_identifierForNetService:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_searchString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[TVRMSBonjourServiceProvider searchType](self, "searchType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSBonjourServiceProvider searchScope](self, "searchScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,_%@"), v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return v6;
}

- (TVRMSServiceProviderDelegate)delegate
{
  return (TVRMSServiceProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNetServiceBrowser)netServiceBrowser
{
  return self->_netServiceBrowser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

@end
