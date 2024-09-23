@implementation TVRMSPairingServiceProvider

- (TVRMSPairingServiceProvider)init
{
  TVRMSPairingServiceProvider *v2;
  uint64_t v3;
  NSMutableDictionary *unmonitoredServices;
  uint64_t v5;
  NSMutableDictionary *monitoredServices;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVRMSPairingServiceProvider;
  v2 = -[TVRMSBonjourServiceProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    unmonitoredServices = v2->_unmonitoredServices;
    v2->_unmonitoredServices = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    monitoredServices = v2->_monitoredServices;
    v2->_monitoredServices = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVRMSPairingServiceProvider;
  -[TVRMSBonjourServiceProvider dealloc](&v4, sel_dealloc);
}

- (id)searchType
{
  return CFSTR("_touch-able._tcp.");
}

- (int64_t)serviceDiscoverySource
{
  return 2;
}

- (int64_t)serviceLegacyFlagsFromTXTDictionary:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  if (-[TVRMSBonjourServiceProvider serviceTypeFromTXTDictionary:](self, "serviceTypeFromTXTDictionary:", v4) == 2)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("OSsi"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setPairedNetworkNames:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  NSArray **p_pairedNetworkNames;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v4 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  p_pairedNetworkNames = &self->_pairedNetworkNames;
  v5 = self->_pairedNetworkNames;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v10, p_pairedNetworkNames, v22) & 1) == 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_monitoredServices, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](self->_monitoredServices, "removeObjectForKey:", v10);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unmonitoredServices, "setObject:forKeyedSubscript:", v11, v10);
          -[TVRMSBonjourServiceProvider netServiceBrowser](self, "netServiceBrowser");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVRMSBonjourServiceProvider netServiceBrowser:didRemoveService:moreComing:](self, "netServiceBrowser:didRemoveService:moreComing:", v12, v11, 1);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  objc_storeStrong((id *)p_pairedNetworkNames, v22);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = *p_pairedNetworkNames;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_unmonitoredServices, "objectForKeyedSubscript:", v18, p_pairedNetworkNames);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_unmonitoredServices, "removeObjectForKey:", v18);
          -[TVRMSBonjourServiceProvider netServiceBrowser](self, "netServiceBrowser");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVRMSPairingServiceProvider netServiceBrowser:didFindService:moreComing:](self, "netServiceBrowser:didFindService:moreComing:", v20, v19, 1);

        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v15);
  }

}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NSArray *pairedNetworkNames;
  int *v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  pairedNetworkNames = self->_pairedNetworkNames;
  if (pairedNetworkNames && !-[NSArray containsObject:](pairedNetworkNames, "containsObject:", v10))
  {
    _TVRCRMSLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Discovered a paired service with network name [%@] that doesn't have a matching pairing record, disregarding", buf, 0xCu);
    }

    v12 = &OBJC_IVAR___TVRMSPairingServiceProvider__unmonitoredServices;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TVRMSPairingServiceProvider;
    -[TVRMSBonjourServiceProvider netServiceBrowser:didFindService:moreComing:](&v14, sel_netServiceBrowser_didFindService_moreComing_, v8, v9, v5);
    v12 = &OBJC_IVAR___TVRMSPairingServiceProvider__monitoredServices;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v12), "setObject:forKeyedSubscript:", v9, v10);

}

- (NSArray)pairedNetworkNames
{
  return self->_pairedNetworkNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedNetworkNames, 0);
  objc_storeStrong((id *)&self->_monitoredServices, 0);
  objc_storeStrong((id *)&self->_unmonitoredServices, 0);
}

@end
