@implementation WPDManager

- (WPDaemonServer)server
{
  return (WPDaemonServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (BOOL)isScanAllowlistedForType:(unsigned __int8)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[WPDManager scanAllowlist](WPDManager, "scanAllowlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "containsIndex:", v3);
  else
    v6 = 1;

  return v6;
}

+ (id)scanAllowlist
{
  return (id)_scanAllowlist;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (int64_t)state
{
  return self->_state;
}

+ (BOOL)isInternalBuild
{
  return _isInternalBuild;
}

+ (id)advAllowlist
{
  return (id)_advAllowlist;
}

+ (void)initialize
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    _isInternalBuild = os_variant_has_internal_diagnostics();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_1);
    v2 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 67109120;
      LODWORD(v12) = _isInternalBuild;
      _os_log_impl(&dword_2175D1000, v2, OS_LOG_TYPE_DEFAULT, "WPDManager _isInternalBuild: %d", (uint8_t *)&v11, 8u);
    }
    if (_isInternalBuild)
    {
      _getCombinedAllowlist(CFSTR("ScanDenylist"), CFSTR("ScanAllowlist"));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)_scanAllowlist;
      _scanAllowlist = v3;

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_78);
      v5 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = _scanAllowlist;
        _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "WPDManager scanAllowlist: %@", (uint8_t *)&v11, 0xCu);
      }
      _getCombinedAllowlist(CFSTR("AdvDenylist"), CFSTR("AdvAllowlist"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)_advAllowlist;
      _advAllowlist = v6;

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_80);
      v8 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = _advAllowlist;
        _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "WPDManager advAllowlist %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v9 = (void *)_scanAllowlist;
      _scanAllowlist = 0;

      v10 = (void *)_advAllowlist;
      _advAllowlist = 0;

    }
  }
}

- (BOOL)isInternalBuild
{
  return +[WPDManager isInternalBuild](WPDManager, "isInternalBuild");
}

- (NSIndexSet)scanAllowlist
{
  return (NSIndexSet *)+[WPDManager scanAllowlist](WPDManager, "scanAllowlist");
}

- (NSIndexSet)advAllowlist
{
  return (NSIndexSet *)+[WPDManager advAllowlist](WPDManager, "advAllowlist");
}

- (WPDManager)initWithServer:(id)a3 Name:(id)a4
{
  id v6;
  id v7;
  WPDManager *v8;
  WPDManager *v9;
  NSSet *cbManagers;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WPDManager;
  v8 = -[WPDManager init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_server, v6);
    objc_storeStrong((id *)&v9->_name, a4);
    v9->_state = 0;
    *(_WORD *)&v9->_restricted = 0;
    cbManagers = v9->_cbManagers;
    v9->_cbManagers = 0;

    v9->_isHomePod = +[WPDaemonServer isHomePod](WPDaemonServer, "isHomePod");
  }

  return v9;
}

- (void)cleanup
{
  NSObject *v3;
  NSString *name;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_82);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    v5 = 138412290;
    v6 = name;
    _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "%@ dealloc", (uint8_t *)&v5, 0xCu);
  }
  -[WPDManager setState:](self, "setState:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[WPDManager cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)WPDManager;
  -[WPDManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x219A0EE8C](self, a2);
  -[WPDManager generateStateDumpStrings](self, "generateStateDumpStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@\n"), self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "subarrayWithRange:", 1, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "appendString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSString *)v12;
}

- (id)generateStateDumpStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("========= %@ =========\n"), self->_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x24BDD17C8];
  +[WPDManager wpStateAsString:](WPDManager, "wpStateAsString:", -[WPDManager state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("state: %@ (%d)\n"), v6, -[WPDManager state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = -[WPDManager testMode](self, "testMode");
  v10 = "no";
  if (v9)
    v10 = "yes";
  objc_msgSend(v8, "stringWithFormat:", CFSTR("testMode: %s\n"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)generateStateDump
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WPDManager generateStateDumpStrings](self, "generateStateDumpStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_99);
        v8 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v7;
          _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "WPDaemon statedump: %@", buf, 0xCu);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

}

- (void)cbManagerDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WPDManager cbManagers](self, "cbManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[WPDManager server](self, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cbManagerDidUpdateState:", v4);

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_100);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDManager cbManagerDidUpdateState:].cold.1(v8, self, (uint64_t)v4);
  }

}

- (void)updateState:(int64_t)a3 Restricted:(BOOL)a4
{
  _BOOL8 v4;
  int v5;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[WPDManager setState:](self, "setState:");
  -[WPDManager setRestricted:](self, "setRestricted:", v4);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_101);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    v8 = v7;
    -[WPDManager name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 1024;
    v13 = v5;
    v14 = 1024;
    v15 = v4;
    _os_log_debug_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEBUG, "Manager %@ updated state:%d restricted:%d", (uint8_t *)&v10, 0x18u);

  }
  -[WPDManager update](self, "update");
}

- (void)update
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[WPDManager update]";
  _os_log_error_impl(&dword_2175D1000, log, OS_LOG_TYPE_ERROR, "%s must override", (uint8_t *)&v1, 0xCu);
}

- (BOOL)isAdvertisingAllowlistedForType:(unsigned __int8)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[WPDManager advAllowlist](WPDManager, "advAllowlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "containsIndex:", v3);
  else
    v6 = 1;

  return v6;
}

+ (id)wpStateAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_24D7C1AD0[a3 - 1];
}

+ (id)cbStateAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9)
    return CFSTR("unknown");
  else
    return off_24D7C1AE8[a3 - 1];
}

+ (void)initializeAdvDenylist:(id)a3 AdvAllowlist:(id)a4 ScanDenylist:(id)a5 ScanAllowlist:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (_isInternalBuild)
  {
    _combineDenylistAndAllowlist(v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)_scanAllowlist;
  _scanAllowlist = v13;

  if (_scanAllowlist)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_117);
    v15 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412802;
      v20 = CFSTR("ScanDenylist");
      v21 = 2112;
      v22 = CFSTR("ScanAllowlist");
      v23 = 2112;
      v24 = _scanAllowlist;
      _os_log_impl(&dword_2175D1000, v15, OS_LOG_TYPE_DEFAULT, "Combined %@ and %@ into allowlist: %@", (uint8_t *)&v19, 0x20u);
    }
  }
  if (_isInternalBuild)
  {
    _combineDenylistAndAllowlist(v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)_advAllowlist;
  _advAllowlist = v16;

  if (_advAllowlist)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_119);
    v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412802;
      v20 = CFSTR("AdvDenylist");
      v21 = 2112;
      v22 = CFSTR("AdvAllowlist");
      v23 = 2112;
      v24 = _advAllowlist;
      _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_DEFAULT, "Combined %@ and %@ into allowlist: %@", (uint8_t *)&v19, 0x20u);
    }
  }

}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isHomePod
{
  return self->_isHomePod;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)restricted
{
  return self->_restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (NSSet)cbManagers
{
  return self->_cbManagers;
}

- (void)setCbManagers:(id)a3
{
  objc_storeStrong((id *)&self->_cbManagers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbManagers, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)cbManagerDidUpdateState:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_2175D1000, v5, OS_LOG_TYPE_ERROR, "%@ manager - unexpected CB manager %@", (uint8_t *)&v7, 0x16u);

}

@end
