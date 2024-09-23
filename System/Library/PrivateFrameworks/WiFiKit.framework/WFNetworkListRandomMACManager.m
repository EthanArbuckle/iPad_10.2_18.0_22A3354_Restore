@implementation WFNetworkListRandomMACManager

- (WFNetworkListRandomMACManager)initWithClient:(id)a3
{
  id v4;
  WFNetworkListRandomMACManager *v5;
  WFNetworkListRandomMACManager *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFNetworkListRandomMACManager;
  v5 = -[WFNetworkListRandomMACManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WFNetworkListRandomMACManager setClient:](v5, "setClient:", v4);
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[WFNetworkListRandomMACManager setCache:](v6, "setCache:", v7);

    -[WFNetworkListRandomMACManager setShouldResetCache:](v6, "setShouldResetCache:", 0);
  }

  return v6;
}

- (void)resetCacheWithCurrentNetworkName:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 shouldResetCache;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _WORD v16[17];

  *(_QWORD *)&v16[13] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(8uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    shouldResetCache = self->_shouldResetCache;
    v13 = 136315650;
    v14 = "-[WFNetworkListRandomMACManager resetCacheWithCurrentNetworkName:]";
    v15 = 1024;
    *(_DWORD *)v16 = shouldResetCache;
    v16[2] = 2112;
    *(_QWORD *)&v16[3] = v4;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s: shouldResetCache=%d currentNetworkName=%@", (uint8_t *)&v13, 0x1Cu);
  }

  if (self->_shouldResetCache)
  {
    if (v4)
    {
      -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListRandomMACManager cache](self, "cache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeAllObjects");

      if (v8)
      {
        WFLogForCategory(8uLL);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v10 && os_log_type_enabled(v10, v11))
        {
          v13 = 136315394;
          v14 = "-[WFNetworkListRandomMACManager resetCacheWithCurrentNetworkName:]";
          v15 = 2112;
          *(_QWORD *)v16 = v4;
          _os_log_impl(&dword_219FC8000, v10, v11, "%s: leaving current network='%@' in cache", (uint8_t *)&v13, 0x16u);
        }

        -[WFNetworkListRandomMACManager cache](self, "cache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v8, v4);

      }
      self->_shouldResetCache = 0;

    }
  }
  else
  {
    self->_shouldResetCache = 1;
  }

}

- (id)newScanRecordWithRandomMACFromScanRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *cache;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  os_log_type_t v24;
  NSObject *v25;
  WFNetworkListRandomMACManager *v26;
  void *v27;
  id v28;
  ether_addr *v29;
  const UInt8 *v30;
  void *v31;
  CFDataRef v32;
  CFDataRef v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  const void *v38;
  WFNetworkScanRecord *v39;
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  _BOOL4 v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = objc_msgSend(v4, "isRandomMACAddressEnabled");
  cache = self->_cache;
  objc_msgSend(v4, "ssid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("kWFNetworkListRandomMACCacheAddressKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (!v11)
    {
      WFLogForCategory(8uLL);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13)
      {
        v15 = v13;
        if (os_log_type_enabled(v15, v14))
        {
          objc_msgSend(v4, "ssid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v43 = "-[WFNetworkListRandomMACManager newScanRecordWithRandomMACFromScanRecord:]";
          v44 = 2112;
          v45 = v16;
          _os_log_impl(&dword_219FC8000, v15, v14, "%s: private address not in cache for '%@'", buf, 0x16u);

        }
      }

      -[WFNetworkListRandomMACManager client](self, "client");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ssid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v17, "newRandomMACAddressForSSID:", v18);

    }
    v19 = v11 != 0;
    objc_msgSend(v10, "objectForKey:", CFSTR("kWFNetworkListRandomMACCacheStatusKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v20, "BOOLValue");

  }
  else
  {
    -[WFNetworkListRandomMACManager client](self, "client");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ssid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v21, "newRandomMACAddressForSSID:", v22);

    v19 = 0;
  }
  WFLogForCategory(8uLL);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v23)
  {
    v25 = v23;
    if (os_log_type_enabled(v25, v24))
    {
      objc_msgSend(v4, "ssid");
      v41 = v6;
      v26 = self;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v43 = "-[WFNetworkListRandomMACManager newScanRecordWithRandomMACFromScanRecord:]";
      v44 = 2112;
      v45 = v12;
      v46 = 2112;
      v47 = v27;
      v48 = 1024;
      v49 = v7;
      v50 = 1024;
      v51 = v19;
      _os_log_impl(&dword_219FC8000, v25, v24, "%s: private address='%@' for '%@' (enabled=%d, cached=%d)", buf, 0x2Cu);

      self = v26;
      v6 = v41;
    }

  }
  if (v12)
  {
    v28 = objc_retainAutorelease(v12);
    v29 = ether_aton((const char *)objc_msgSend(v28, "UTF8String"));
    if (v29)
    {
      v30 = (const UInt8 *)v29;
      v31 = (void *)objc_opt_new();
      v32 = CFDataCreate(0, v30, 6);
      if (v32)
      {
        v33 = v32;
        objc_msgSend(v31, "setObject:forKey:", v32, CFSTR("PRIVATE_MAC_ADDRESS_VALUE"));

        if ((_DWORD)v7)
          v34 = 2;
        else
          v34 = 1;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v35, CFSTR("PRIVATE_MAC_ADDRESS_TYPE"));

        objc_msgSend(v6, "setObject:forKey:", v31, CFSTR("PRIVATE_MAC_ADDRESS"));
      }

    }
    objc_msgSend(v4, "ssid");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v4, "ssid");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNetworkListRandomMACManager setRandomMAC:forNetwork:enabled:shouldAlwaysDisplayRandomAddress:](self, "setRandomMAC:forNetwork:enabled:shouldAlwaysDisplayRandomAddress:", v28, v37, v7, 0);

    }
  }
  v38 = (const void *)WiFiNetworkCreate();
  v39 = -[WFNetworkScanRecord initWithNetworkRef:]([WFNetworkScanRecord alloc], "initWithNetworkRef:", v38);
  CFRelease(v38);

  return v39;
}

- (void)setRandomMAC:(id)a3 forNetwork:(id)a4 enabled:(BOOL)a5 shouldAlwaysDisplayRandomAddress:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  os_log_type_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _BYTE v23[10];
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v6 = a6;
  v7 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (v10)
  {
    -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NSObject setObject:forKey:](v12, "setObject:forKey:", v10, CFSTR("kWFNetworkListRandomMACCacheAddressKey"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v12, "setObject:forKey:", v13, CFSTR("kWFNetworkListRandomMACCacheStatusKey"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v12, "setObject:forKey:", v14, CFSTR("kWFNetworkListRandomMACCacheAlwaysDisplayRandomKey"));

    -[NSMutableDictionary setObject:forKey:](self->_cache, "setObject:forKey:", v12, v11);
    WFLogForCategory(8uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
    {
      v18 = 136316162;
      v19 = "-[WFNetworkListRandomMACManager setRandomMAC:forNetwork:enabled:shouldAlwaysDisplayRandomAddress:]";
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      *(_QWORD *)v23 = v11;
      *(_WORD *)&v23[8] = 1024;
      v24 = v7;
      v25 = 1024;
      v26 = v6;
      _os_log_impl(&dword_219FC8000, v15, v16, "%s: caching private address='%@' for '%@' (enabled=%d, always cached=%d)", (uint8_t *)&v18, 0x2Cu);
    }

  }
  else
  {
    WFLogForCategory(8uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    v17 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v17))
    {
      v18 = 136315906;
      v19 = "-[WFNetworkListRandomMACManager setRandomMAC:forNetwork:enabled:shouldAlwaysDisplayRandomAddress:]";
      v20 = 2112;
      v21 = v11;
      v22 = 1024;
      *(_DWORD *)v23 = v7;
      *(_WORD *)&v23[4] = 1024;
      *(_DWORD *)&v23[6] = v6;
      _os_log_impl(&dword_219FC8000, v12, v17, "%s: unable to cache nil private address for '%@' (enabled=%d, always cached=%d)", (uint8_t *)&v18, 0x22u);
    }
  }

}

- (BOOL)isSSIDinCache:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(8uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v9 = 136315650;
    v10 = "-[WFNetworkListRandomMACManager isSSIDinCache:]";
    v11 = 1024;
    v12 = v5 != 0;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_219FC8000, v6, v7, "%s: cached=%d private address for '%@'", (uint8_t *)&v9, 0x1Cu);
  }

  return v5 != 0;
}

- (BOOL)shouldEnableRandomMACForSSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  os_log_type_t v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("kWFNetworkListRandomMACCacheStatusKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    WFLogForCategory(8uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v9 && os_log_type_enabled(v9, v10))
    {
      v17 = 136315650;
      v18 = "-[WFNetworkListRandomMACManager shouldEnableRandomMACForSSID:]";
      v19 = 2112;
      v20 = v4;
      v21 = 1024;
      v22 = v8;
      v11 = "%s: cached value for '%@' enabled=%d";
      v12 = v9;
      v13 = v10;
      v14 = 28;
LABEL_10:
      _os_log_impl(&dword_219FC8000, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
  else
  {
    WFLogForCategory(8uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(4uLL);
    LOBYTE(v8) = 1;
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v9 && os_log_type_enabled(v9, v15))
    {
      v17 = 136315394;
      v18 = "-[WFNetworkListRandomMACManager shouldEnableRandomMACForSSID:]";
      v19 = 2112;
      v20 = v4;
      v11 = "%s: no cached value for '%@'";
      v12 = v9;
      v13 = v15;
      v14 = 22;
      goto LABEL_10;
    }
  }

  return v8;
}

- (BOOL)shouldAlwaysDisplayRandomAddressForSSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  os_log_type_t v10;
  os_log_type_t v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("kWFNetworkListRandomMACCacheAlwaysDisplayRandomKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    WFLogForCategory(8uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v9 && os_log_type_enabled(v9, v10))
    {
      v13 = 136315650;
      v14 = "-[WFNetworkListRandomMACManager shouldAlwaysDisplayRandomAddressForSSID:]";
      v15 = 2112;
      v16 = v4;
      v17 = 1024;
      v18 = v8;
      _os_log_impl(&dword_219FC8000, v9, v10, "%s: cached value for '%@' always=%d", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    WFLogForCategory(8uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(4uLL);
    LOBYTE(v8) = 0;
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v9)
    {
      if (os_log_type_enabled(v9, v11))
      {
        v13 = 136315394;
        v14 = "-[WFNetworkListRandomMACManager shouldAlwaysDisplayRandomAddressForSSID:]";
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_219FC8000, v9, v11, "%s: no cached value for '%@'", (uint8_t *)&v13, 0x16u);
      }
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (id)cachedRandomMACForSSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  os_log_type_t v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    WFLogForCategory(8uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v11))
    {
      v13 = 136315394;
      v14 = "-[WFNetworkListRandomMACManager cachedRandomMACForSSID:]";
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_219FC8000, v8, v11, "%s: '%@' does not exist in cache", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_12;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("kWFNetworkListRandomMACCacheAddressKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    WFLogForCategory(8uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      v8 = v8;
      if (os_log_type_enabled(v8, v9))
      {
        v10 = -[NSMutableDictionary count](self->_cache, "count");
        v13 = 136315650;
        v14 = "-[WFNetworkListRandomMACManager cachedRandomMACForSSID:]";
        v15 = 2112;
        v16 = v4;
        v17 = 2048;
        v18 = v10;
        _os_log_impl(&dword_219FC8000, v8, v9, "%s: no private address found for '%@' (cached=%lu)", (uint8_t *)&v13, 0x20u);
      }

    }
LABEL_12:

    v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (WFClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (BOOL)shouldResetCache
{
  return self->_shouldResetCache;
}

- (void)setShouldResetCache:(BOOL)a3
{
  self->_shouldResetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
