@implementation WPObjectDiscovery

- (WPObjectDiscovery)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  WPObjectDiscovery *v9;
  WPObjectDiscovery *v10;
  id *p_isa;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  id *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_127_0);
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPObjectDiscovery initWithDelegate:queue:].cold.1(v8);
    v9 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WPObjectDiscovery;
    v10 = -[WPClient initWithQueue:machName:](&v16, sel_initWithQueue_machName_, v7, 0);
    p_isa = (id *)&v10->super.super.isa;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_delegate, v6);
      objc_storeWeak(p_isa + 15, v7);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_13);
      v12 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        objc_msgSend(p_isa, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v18 = p_isa;
        v19 = 2048;
        v20 = v14;
        _os_log_impl(&dword_209E41000, v13, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery initWithDelegate self: %p, delegate: %p", buf, 0x16u);

      }
    }
    self = p_isa;
    v9 = self;
  }

  return v9;
}

- (WPObjectDiscovery)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCA98];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is not a valid initializer for %@"), v5, v7);

  return 0;
}

- (id)clientAsString
{
  return CFSTR("WPObjectDiscovery");
}

- (void)invalidate
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_132_1);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery invalidate by client", buf, 2u);
  }
  -[WPObjectDiscovery setDelegate:](self, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)WPObjectDiscovery;
  -[WPClient invalidate](&v4, sel_invalidate);
}

- (id)scanRequestFromScanOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[3];

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPObjectDiscoveryScanKeyAdvBuffer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPObjectDiscoveryScanKeyAllowDuplicates"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPObjectDiscoveryScanKeyScanWhenLocked"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPObjectDiscoveryScanKeyScreenOffRate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPObjectDiscoveryScanKeyScreenOnRate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WPObjectDiscoveryScanKeyTimeout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "integerValue");
  v11 = objc_msgSend(v7, "integerValue");
  v12 = (void *)objc_opt_new();
  v14[0] = v10;
  v14[1] = v11;
  v14[2] = 30;
  objc_msgSend(v12, "setScanningRates:", v14);
  objc_msgSend(v12, "setAdvBuffer:", objc_msgSend(v4, "integerValue") & 7);
  objc_msgSend(v12, "setScanWhenLocked:", objc_msgSend(v6, "BOOLValue"));
  objc_msgSend(v12, "setScanCache:", 0);
  objc_msgSend(v12, "setAllowDuplicates:", objc_msgSend(v5, "BOOLValue"));
  objc_msgSend(v12, "setRssiThreshold:", &unk_24C290D28);
  objc_msgSend(v12, "setClientType:", 18);
  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v12, "setUpdateTime:");
  }

  return v12;
}

- (id)scanRequestFromScanMode:(int64_t)a3 UpdateTime:(double)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[3];

  if (_os_feature_enabled_impl())
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_139_0);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPObjectDiscovery scanRequestFromScanMode:UpdateTime:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  if ((unint64_t)a3 > 9)
  {
    v15 = 0;
    v16 = 0;
    v14 = 30;
  }
  else
  {
    v14 = qword_209E73E70[a3];
    v15 = qword_209E73EC0[a3];
    v16 = qword_209E73F10[a3];
  }
  v17 = (void *)objc_opt_new();
  v19[0] = v15;
  v19[1] = v16;
  v19[2] = v14;
  objc_msgSend(v17, "setScanningRates:", v19);
  objc_msgSend(v17, "setScanWhenLocked:", a3 > 4);
  objc_msgSend(v17, "setScanCache:", 0);
  objc_msgSend(v17, "setAllowDuplicates:", 1);
  objc_msgSend(v17, "setRssiThreshold:", &unk_24C290D28);
  objc_msgSend(v17, "setClientType:", 18);
  objc_msgSend(v17, "setUpdateTime:", a4);
  if (a3 <= 4)
    objc_msgSend(v17, "setAdvBuffer:", 5);
  return v17;
}

- (void)startScanning
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "ObjectDiscovery calling deprecated function %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startScanningWithMode:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (_os_feature_enabled_impl())
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_141_0);
    v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPObjectDiscovery startScanningWithMode:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  -[WPObjectDiscovery startScanningWithMode:Timeout:](self, "startScanningWithMode:Timeout:", a3, 0.0);
}

- (void)scanningFailedWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_142_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
  -[WPObjectDiscovery delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0FC8];
    v12[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 10, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPObjectDiscovery delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectDiscovery:failedToStartScanningWithError:", self, v9);

  }
}

- (BOOL)isScanningEnabled
{
  return 1;
}

- (void)startScanningWithMode:(int64_t)a3 Timeout:(double)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_147_0);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPObjectDiscovery startScanningWithMode:Timeout:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  if (-[WPObjectDiscovery isScanningEnabled](self, "isScanningEnabled"))
  {
    if (a3 >= 5 && (a4 > 6.0 || a4 == 0.0))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ObjectDiscovery scanning mode above %s (%ld) requires timeout of %0.2fs or less"), "Normal", 4, 0x4018000000000000);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPObjectDiscovery scanningFailedWithError:](self, "scanningFailedWithError:", v15);
    }
    else
    {
      -[WPObjectDiscovery scanRequestFromScanMode:UpdateTime:](self, "scanRequestFromScanMode:UpdateTime:", a3, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_152_1);
      v16 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v15;
        _os_log_impl(&dword_209E41000, v16, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery start scanning: %{public}@", buf, 0xCu);
      }
      v17.receiver = self;
      v17.super_class = (Class)WPObjectDiscovery;
      -[WPClient startScanning:](&v17, sel_startScanning_, v15);
    }

  }
}

- (BOOL)isValidScanOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  _BYTE v29[128];
  _QWORD v30[6];

  v30[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30[0] = CFSTR("WPObjectDiscoveryScanKeyAdvBuffer");
  v30[1] = CFSTR("WPObjectDiscoveryScanKeyAllowDuplicates");
  v30[2] = CFSTR("WPObjectDiscoveryScanKeyScanWhenLocked");
  v30[3] = CFSTR("WPObjectDiscoveryScanKeyScreenOffRate");
  v30[4] = CFSTR("WPObjectDiscoveryScanKeyScreenOnRate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v9);
  }

  v14 = objc_msgSend(v6, "count");
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ObjectDiscovery scan mandatory options missing %@ "), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_159);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    -[WPObjectDiscovery delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FC8];
      v28 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[WPObjectDiscovery delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectDiscovery:failedToStartScanningWithError:", self, v20);

    }
  }

  return v14 == 0;
}

- (BOOL)isValidScanRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "scanningRates");
    v6 = v16;
  }
  else
  {
    v6 = 0;
  }
  if ((objc_msgSend(v5, "advBuffer") & 4) != 0)
  {
    v7 = 0;
    v8 = 1;
    if (!v6 || v6 == 966 || v6 == 0xFFFF)
      goto LABEL_20;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ObjectDiscovery ADV Buffer scan with unsupported interval %ld "), v6);
  }
  else
  {
    if (v6)
    {
      v7 = 0;
LABEL_19:
      v8 = 1;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ObjectDiscovery screen-off scan with unsupported interval %ld "), 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_19;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_164_1);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
  -[WPObjectDiscovery delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0)
    goto LABEL_19;
  v11 = (void *)MEMORY[0x24BDD1540];
  v17 = *MEMORY[0x24BDD0FC8];
  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPObjectDiscovery delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectDiscovery:failedToStartScanningWithError:", self, v13);

  v8 = 0;
LABEL_20:

  return v8;
}

- (void)startScanningWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_165);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery startScanningWithOptions %@", buf, 0xCu);
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (-[WPObjectDiscovery isScanningEnabled](self, "isScanningEnabled")
      && -[WPObjectDiscovery isValidScanOptions:](self, "isValidScanOptions:", v4))
    {
      -[WPObjectDiscovery scanRequestFromScanOptions:](self, "scanRequestFromScanOptions:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[WPObjectDiscovery isValidScanRequest:](self, "isValidScanRequest:", v6))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_169_1);
        v7 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v10 = v6;
          _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery start scanning: %{public}@", buf, 0xCu);
        }
        v8.receiver = self;
        v8.super_class = (Class)WPObjectDiscovery;
        -[WPClient startScanning:](&v8, sel_startScanning_, v6);
      }

    }
  }
  else
  {
    -[WPObjectDiscovery scanningFailedWithError:](self, "scanningFailedWithError:", CFSTR("ObjectDiscovery startScanningWithOptions API is disabled"));
  }

}

- (void)stopScanning
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[WPObjectDiscovery isScanningEnabled](self, "isScanningEnabled"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setClientType:", 18);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_170);
    v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v3;
      _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery stop scanning: %{public}@", buf, 0xCu);
    }
    v5.receiver = self;
    v5.super_class = (Class)WPObjectDiscovery;
    -[WPClient stopScanning:](&v5, sel_stopScanning_, v3);

  }
}

- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "setUpdateTime:", 0.0);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_173_1);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_INFO, "ObjectDiscovery timed-out scanning request: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  -[WPObjectDiscovery stopScanning](self, "stopScanning");
  v7[2](v7, 0);

}

- (void)stateDidChange:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WPObjectDiscovery;
  -[WPClient stateDidChange:](&v8, sel_stateDidChange_, a3);
  -[WPObjectDiscovery delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPObjectDiscovery delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectDiscoveryUpdatedState:", self);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_178_0);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPObjectDiscovery stateDidChange:].cold.1(v7, self);
}

- (void)deviceDiscovered:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)MEMORY[0x20BD1B9E4]();
  -[WPObjectDiscovery delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:](WPDObjectDiscoveryData, "objectDiscoveryReportFromAdvReport:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[WPObjectDiscovery delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectDiscovery:foundDevice:", self, v7);

    }
  }
  objc_autoreleasePoolPop(v4);

}

- (void)devicesDiscovered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x20BD1B9E4]();
  -[WPObjectDiscovery delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    v17 = (id)objc_opt_new();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__WPObjectDiscovery_devicesDiscovered___block_invoke;
    v11[3] = &unk_24C288070;
    v11[4] = &v12;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_185_1);
    v8 = (id)WiProxLog;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[WPObjectDiscovery devicesDiscovered:].cold.1((uint64_t)v18, objc_msgSend((id)v13[5], "count"), v8);

    -[WPObjectDiscovery delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v13[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectDiscovery:foundDevices:", self, v10);

    _Block_object_dispose(&v12, 8);
  }
  objc_autoreleasePoolPop(v5);

}

void __39__WPObjectDiscovery_devicesDiscovered___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:](WPDObjectDiscoveryData, "objectDiscoveryReportFromAdvReport:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v3 = v4;
  }

}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  -[WPObjectDiscovery delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_188_0);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPObjectDiscovery scanningStartedOfType:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    -[WPObjectDiscovery delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectDiscoveryStartedScanning:", self);

  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  -[WPObjectDiscovery delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_191_0);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPObjectDiscovery scanningStoppedOfType:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    -[WPObjectDiscovery delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectDiscoveryStoppedScanning:", self);

  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[WPObjectDiscovery delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_192_1);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPObjectDiscovery scanningFailedToStart:ofType:].cold.1(v8, v5);
    -[WPObjectDiscovery delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectDiscovery:failedToStartScanningWithError:", self, v5);

  }
}

- (WPObjectDiscoveryDelegate)delegate
{
  return (WPObjectDiscoveryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_queue);
}

- (void)setQueue:(id)a3
{
  objc_storeWeak((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queue);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)receivedTestResponse:(id)a3
{
  id v3;

  v3 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_238_1);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPObjectDiscovery(Test) receivedTestResponse:].cold.1();

}

- (void)startTest
{
  void *v3;
  void *v4;
  objc_super v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_239_1);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPObjectDiscovery(Test) startTest].cold.1((uint64_t)self, v3);
  if (-[WPClient isTestClient](self, "isTestClient"))
  {
    v6 = CFSTR("kWPTestRequestKeyID");
    v7[0] = &unk_24C290D40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5.receiver = self;
    v5.super_class = (Class)WPObjectDiscovery;
    -[WPClient sendTestRequest:](&v5, sel_sendTestRequest_, v4);

  }
}

- (void)stopTest
{
  void *v3;
  void *v4;
  objc_super v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_244_0);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPObjectDiscovery(Test) stopTest].cold.1((uint64_t)self, v3);
  if (-[WPClient isTestClient](self, "isTestClient"))
  {
    v6 = CFSTR("kWPTestRequestKeyID");
    v7[0] = &unk_24C290D58;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5.receiver = self;
    v5.super_class = (Class)WPObjectDiscovery;
    -[WPClient sendTestRequest:](&v5, sel_sendTestRequest_, v4);

  }
}

- (void)updateBeaconingState:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_246);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPObjectDiscovery(Test) updateBeaconingState:].cold.1();
  if (-[WPClient isTestClient](self, "isTestClient"))
  {
    v7[0] = CFSTR("kWPTestRequestKeyID");
    v7[1] = CFSTR("kWPTestBeaconStateKey");
    v8[0] = &unk_24C290D70;
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    -[WPClient sendTestRequest:](&v6, sel_sendTestRequest_, v5);

  }
}

- (void)updateBeaconingKeys:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_250_1);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPObjectDiscovery(Test) updateBeaconingKeys:].cold.1();
  if (-[WPClient isTestClient](self, "isTestClient"))
  {
    v7[0] = CFSTR("kWPTestRequestKeyID");
    v7[1] = CFSTR("kWPTestBeaconKeysKey");
    v8[0] = &unk_24C290D88;
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    -[WPClient sendTestRequest:](&v6, sel_sendTestRequest_, v5);

  }
}

- (void)updateBeaconingStatus:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_252);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPObjectDiscovery(Test) updateBeaconingStatus:].cold.1();
  if (-[WPClient isTestClient](self, "isTestClient"))
  {
    v7[0] = CFSTR("kWPTestRequestKeyID");
    v7[1] = CFSTR("kWPTestBeaconStatusKey");
    v8[0] = &unk_24C290DA0;
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    -[WPClient sendTestRequest:](&v6, sel_sendTestRequest_, v5);

  }
}

- (void)updateBeaconingExtended:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_254_1);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPObjectDiscovery(Test) updateBeaconingExtended:].cold.1();
  if (-[WPClient isTestClient](self, "isTestClient"))
  {
    v7[0] = CFSTR("kWPTestRequestKeyID");
    v7[1] = CFSTR("kWPTestBeaconExtendedKey");
    v8[0] = &unk_24C290DB8;
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    -[WPClient sendTestRequest:](&v6, sel_sendTestRequest_, v5);

  }
}

- (void)updateNearOwnerTokens:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_256);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPObjectDiscovery(Test) updateNearOwnerTokens:].cold.1();
  if (-[WPClient isTestClient](self, "isTestClient"))
  {
    v7[0] = CFSTR("kWPTestRequestKeyID");
    v7[1] = CFSTR("kWPTestNearOwnerTokensKey");
    v8[0] = &unk_24C290DD0;
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    -[WPClient sendTestRequest:](&v6, sel_sendTestRequest_, v5);

  }
}

- (void)updateBeaconingInterval:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_258);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPObjectDiscovery(Test) updateBeaconingInterval:].cold.1();
  if (-[WPClient isTestClient](self, "isTestClient"))
  {
    v7[0] = CFSTR("kWPTestRequestKeyID");
    v7[1] = CFSTR("kWPTestBeaconIntervalKey");
    v8[0] = &unk_24C290DE8;
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    -[WPClient sendTestRequest:](&v6, sel_sendTestRequest_, v5);

  }
}

- (void)initWithDelegate:(os_log_t)log queue:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209E41000, log, OS_LOG_TYPE_ERROR, "ObjectDiscovery is disabled via wiprox", v1, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)scanRequestFromScanMode:(uint64_t)a3 UpdateTime:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "ObjectDiscovery calling deprecated function %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startScanningWithMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "ObjectDiscovery calling deprecated function %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startScanningWithMode:(uint64_t)a3 Timeout:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "ObjectDiscovery calling deprecated function %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)stateDidChange:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "state");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_18_0(&dword_209E41000, v3, v4, "ObjectDiscovery state set to %{public}ld", v5);

  OUTLINED_FUNCTION_7_0();
}

- (void)devicesDiscovered:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_18_0(&dword_209E41000, a3, (uint64_t)a3, "ObjectDiscovery ADV Buffer read event with %lu peers", (uint8_t *)a1);
}

- (void)scanningStartedOfType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_209E41000, a1, a3, "ObjectDiscovery scanning started.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)scanningStoppedOfType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_209E41000, a1, a3, "ObjectDiscovery scanning stopped.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)scanningFailedToStart:(void *)a1 ofType:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_209E41000, v3, OS_LOG_TYPE_ERROR, "ObjectDiscovery scanning failed to start with error: %@", v5, 0xCu);

  OUTLINED_FUNCTION_7_0();
}

@end
