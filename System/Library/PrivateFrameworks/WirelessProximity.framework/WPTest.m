@implementation WPTest

- (WPTest)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  WPTest *v7;
  WPTest *v8;
  uint64_t v9;
  NSMutableDictionary *transfers;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  WPTest *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WPTest;
  v7 = -[WPClient initWithQueue:machName:](&v15, sel_initWithQueue_machName_, a4, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    transfers = v8->_transfers;
    v8->_transfers = (NSMutableDictionary *)v9;

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_5);
  v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[WPTest delegate](v8, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v17 = v8;
    v18 = 2048;
    v19 = v13;
    _os_log_impl(&dword_209E41000, v12, OS_LOG_TYPE_DEFAULT, "test initWithDelegate self: %p, delegate: %p", buf, 0x16u);

  }
  return v8;
}

- (WPTest)init
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

+ (int64_t)holdVouchers
{
  return 2;
}

- (id)clientAsString
{
  return CFSTR("WPTest");
}

- (void)invalidate
{
  NSObject *v3;
  objc_super v4;
  objc_super v5;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_101_0);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "test invalidate by client", buf, 2u);
  }
  -[WPTest setDelegate:](self, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WPTest;
  -[WPClient unregisterEndpoint:](&v5, sel_unregisterEndpoint_, CFSTR("wp.test"));
  v4.receiver = self;
  v4.super_class = (Class)WPTest;
  -[WPClient invalidate](&v4, sel_invalidate);
}

- (void)startAdvertisingOfType:(unsigned __int8)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6 options:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v10 = a3;
  v31[1] = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a7;
  if (v12 && (unint64_t)objc_msgSend(v12, "length") < 0x17)
  {
    +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAdvertisingRate:", a6);
    objc_msgSend(v14, "setConnectable:", 1);
    objc_msgSend(v14, "setAdvertisingData:", v12);
    if (a5 == 1)
      objc_msgSend(v14, "changePriorityValue:", 1);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_116);
    v20 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v23 = v14;
      v24 = 2048;
      v25 = a5;
      v26 = 2048;
      v27 = a6;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_209E41000, v20, OS_LOG_TYPE_DEFAULT, "test start advertising with data: %{public}@ priority %ld mode %ld options %@", buf, 0x2Au);
    }
    v21.receiver = self;
    v21.super_class = (Class)WPTest;
    -[WPClient startAdvertising:](&v21, sel_startAdvertising_, v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("test can't start advertising of type: %ld because bad data: %@ was provided"), v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_109);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v15 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    v31[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPTest delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[WPTest delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "test:didFailToStartAdvertisingOfType:withError:", self, v10, v17);

    }
  }

}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  -[WPTest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_121);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_INFO, "test advertising pending of type: %d", (uint8_t *)v9, 8u);
    }
    -[WPTest delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "test:didDeferAdvertisingType:", self, v3);

  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  -[WPTest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_124_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPTest advertisingStartedOfType:].cold.1();
    -[WPTest delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "test:didStartAdvertisingType:", self, v3);

  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  -[WPTest delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_125_0);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest advertisingFailedToStart:ofType:].cold.1(v4, v9, v6);
    -[WPTest delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "test:didFailToStartAdvertisingOfType:withError:", self, v4, v6);

  }
}

- (void)stopAdvertisingOfType:(unsigned __int8)a3
{
  int v3;
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_126_1);
  v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "test stop advertising of type: %d", buf, 8u);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPTest;
  -[WPClient stopAdvertising:](&v7, sel_stopAdvertising_, v5);

}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_129);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 134218242;
    v20 = v4;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "test advertising stopped of type: %ld with error: %@", (uint8_t *)&v19, 0x16u);

  }
  if (v6)
  {
    if (objc_msgSend(v6, "code") == 28)
    {
      -[WPTest delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_133_0);
        v12 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          objc_msgSend(v6, "localizedDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 134218242;
          v20 = v4;
          v21 = 2112;
          v22 = v14;
          _os_log_impl(&dword_209E41000, v13, OS_LOG_TYPE_DEFAULT, "[Privacy] test advertising stopped of type: %ld with error: %@", (uint8_t *)&v19, 0x16u);

        }
        -[WPTest delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "test:didStopAdvertisingType:withError:", self, v4, v6);
LABEL_19:

      }
    }
  }
  else
  {
    -[WPTest delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_137);
      v18 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPTest advertisingStoppedOfType:withError:].cold.1(v4, v18);
      -[WPTest delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "test:didStopAdvertisingType:", self, v4);
      goto LABEL_19;
    }
  }

}

- (void)startScanningForType:(unsigned __int8)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_super v30;
  uint64_t v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v14 = a3;
  v36[1] = *MEMORY[0x24BDAC8D0];
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = objc_msgSend(v16, "length");
  v21 = objc_msgSend(v17, "length");
  if (v20 > 22 || v21 >= 23)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("test data (%ld bytes) or mask (%ld bytes) length is larger than the max length (22 bytes) for type: %ld"), v20, v21, v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_140_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v24 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    v36[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPTest delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[WPTest delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "test:didFailToStartScanningForType:withError:", self, v14, v26);

    }
  }
  else
  {
    switch(a7)
    {
      case 5:
        v22 = 966;
        break;
      case 40:
        v22 = 30;
        break;
      case 30:
        v22 = 40;
        break;
      default:
        v22 = 300;
        break;
    }
    v26 = (void *)objc_opt_new();
    objc_msgSend(v26, "setClientType:", v14);
    v31 = v22;
    v32 = xmmword_209E73C90;
    objc_msgSend(v26, "setScanningRates:", &v31);
    if (v16)
      objc_msgSend(v26, "setBlobValue:", v16);
    if (v17)
      objc_msgSend(v26, "setMaskValue:", v17);
    if (v18)
      objc_msgSend(v26, "setPeers:", v18);
    if (v19)
      objc_msgSend(v26, "setRssiThreshold:", v19);
    objc_msgSend(v26, "setScanCache:", a10);
    objc_msgSend(v26, "setAllowDuplicates:", a9);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_145);
    v29 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_impl(&dword_209E41000, v29, OS_LOG_TYPE_DEFAULT, "test start scanning with data: %{public}@", buf, 0xCu);
    }
    v30.receiver = self;
    v30.super_class = (Class)WPTest;
    -[WPClient startScanning:](&v30, sel_startScanning_, v26);
  }

}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  -[WPTest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_150);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPTest scanningStartedOfType:].cold.1();
    -[WPTest delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "test:didStartScanningForType:", self, v3);

  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  -[WPTest delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_151);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest scanningFailedToStart:ofType:].cold.1(v4, v9, v6);
    -[WPTest delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "test:didFailToStartScanningForType:withError:", self, v4, v6);

  }
}

- (void)stopScanningForType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setClientType:", v3);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_152);
  v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "test stop scanning: %{public}@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPTest;
  -[WPClient stopScanning:](&v7, sel_stopScanning_, v5);

}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  -[WPTest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_157);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPTest scanningStoppedOfType:].cold.1();
    -[WPTest delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "test:didStopScanningForType:", self, v3);

  }
}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  _QWORD v26[6];
  _QWORD v27[7];

  v27[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePeripheralUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subdataWithRange:", 4, objc_msgSend(v8, "length") - 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WPTest delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v25 = v7;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceManufacturerData"));
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePaired"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = CFSTR("address");
      v15 = (uint64_t)v12;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "data");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v27[0] = v15;
      v27[1] = v13;
      v26[1] = CFSTR("data");
      v26[2] = CFSTR("paired");
      v16 = (void *)MEMORY[0x24BDBD1C0];
      if (v14)
        v16 = v14;
      v27[2] = v16;
      v26[3] = CFSTR("rssi");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v17;
      v26[4] = CFSTR("channel");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceChannel"));
      v24 = (void *)v13;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[4] = v18;
      v26[5] = CFSTR("time");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceTime"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[5] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      -[WPTest delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "test:didDiscoverType:withData:fromPeer:peerInfo:", self, v25, v9, v5, v20);

    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_158_0);
    v22 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest deviceDiscovered:].cold.1(v22);
  }

}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_176);
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest connectToPeer:withOptions:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    v17 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FC8];
    v37[0] = CFSTR("test no peer was provided!");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 6, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPTest delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
      goto LABEL_21;
    -[WPTest delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "test:didConnectToPeer:transport:error:", self, 0, 0, v19);
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  if (-[WPClient state](self, "state") != 3)
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[WPClient stateAsString:](WPClient, "stateAsString:", -[WPClient state](self, "state"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Can't connect to peer %@ when state is %@"), v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_183);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v25 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    v35 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 1, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPTest delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[WPTest delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "test:didConnectToPeer:transport:error:", self, v6, 0, v21);

    }
    goto LABEL_20;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_185);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "test connect to peer  %{public}@ with options %@", buf, 0x16u);
  }
  v29.receiver = self;
  v29.super_class = (Class)WPTest;
  -[WPClient connectToPeer:withOptions:](&v29, sel_connectToPeer_withOptions_, v6, v7);
LABEL_22:

}

- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_188);
    v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_209E41000, v10, OS_LOG_TYPE_DEFAULT, "Test connected to device: %{public}@ over GATT", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_190);
    v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_209E41000, v11, OS_LOG_TYPE_DEFAULT, "Test sending didConnectToPeer %@ with error %{public}@", (uint8_t *)&v15, 0x16u);
    }
    -[WPTest delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[WPTest delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "test:didConnectToPeer:transport:error:", self, v8, 1, v9);

    }
  }

}

- (void)connectedDeviceOverLEPipe:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_191);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "test sending didConnectToPeer %@ over LEPipe", (uint8_t *)&v9, 0xCu);
  }
  -[WPTest delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WPTest delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "test:didConnectToPeer:transport:error:", self, v4, 2, 0);

  }
}

- (void)sendData:(id)a3 toPeer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WPTest *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  __int16 v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("test no data was provided for peer: %@"), v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_194);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v21 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    v44[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPTest delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = objc_opt_respondsToSelector();

    if ((v22 & 1) == 0)
      goto LABEL_28;
    -[WPTest delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = self;
    v18 = 0;
    goto LABEL_16;
  }
  if (v7)
  {
    v9 = objc_msgSend(v6, "length");
    if ((unint64_t)(v9 - 60001) > 0xFFFFFFFFFFFF159FLL)
    {
      v38 = v9;
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v38, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendData:", v6);
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setData:", v10);
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("AF0BADB1-5B99-43CD-917A-A77BC549E3CC"));
      objc_msgSend(v13, "setUuid:", v35);

      objc_msgSend(v13, "setWriteType:", 0);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_209);
      v36 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPTest sendData:toPeer:].cold.4(v36, (uint64_t)v10, v8);
      v37.receiver = self;
      v37.super_class = (Class)WPTest;
      -[WPClient sendDataToCharacteristic:inService:forPeer:](&v37, sel_sendDataToCharacteristic_inService_forPeer_, v13, CFSTR("9FA480E0-4967-4542-9390-D343DC5D04AE"), v8);
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("test data length is invalid %ld (max: %lu)"), v9, 60000);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_204);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v11 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0FC8];
    v40 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPTest delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
    {
LABEL_28:

      goto LABEL_29;
    }
    -[WPTest delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = self;
    v18 = v6;
LABEL_16:
    objc_msgSend(v15, "test:didSendData:toPeer:error:", v17, v18, v8, v13);

    goto LABEL_28;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_200);
  v24 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPTest sendData:toPeer:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
  v32 = (void *)MEMORY[0x24BDD1540];
  v41 = *MEMORY[0x24BDD0FC8];
  v42 = CFSTR("test no peer was provided");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPTest delegate](self, "delegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = objc_opt_respondsToSelector();

  if ((v33 & 1) != 0)
  {
    -[WPTest delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "test:didSendData:toPeer:error:", self, v6, 0, v10);
    goto LABEL_28;
  }
LABEL_29:

}

- (void)sentData:(id)a3 toEndpoint:(id)a4 forPeripheral:(id)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11 && !objc_msgSend(v11, "isEqualToString:", CFSTR("wp.test")))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_214);
    v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      objc_msgSend(v12, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v11;
      v25 = 2112;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      _os_log_error_impl(&dword_209E41000, v20, OS_LOG_TYPE_ERROR, "test Sent data to a endpoint: %@ to peer: %@ with error: %@ that isn't of type test", (uint8_t *)&v23, 0x20u);

    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_212);
    v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_209E41000, v14, OS_LOG_TYPE_DEFAULT, "test didSendData over LE pipe", (uint8_t *)&v23, 2u);
    }
    -[WPTest delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      if ((unint64_t)objc_msgSend(v10, "length") >= 2)
      {
        objc_msgSend(v10, "subdataWithRange:", 2, objc_msgSend(v10, "length") - 2);
        v17 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v17;
      }
      -[WPTest delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "test:didSendData:toPeer:error:", self, v10, v12, v13);

    }
  }

}

- (void)receivedData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  if (!((unint64_t)a4 | (unint64_t)a5))
  {
    -[WPTest transfers](self, "transfers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = -[WPDataTransfer initDataTransferForPeer:]([WPDataTransfer alloc], "initDataTransferForPeer:", v11);
      -[WPTest transfers](self, "transfers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v11);

      -[WPTest transfers](self, "transfers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_216);
    v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPTest receivedData:forCharacteristic:inService:forPeripheral:].cold.1((uint64_t)v10, v17);
    if (objc_msgSend(v13, "addNewData:", v10))
    {
      kdebug_trace();
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_218);
      v18 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        v19 = v18;
        objc_msgSend(v13, "currentReceivedData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 134217984;
        v27 = objc_msgSend(v20, "length");
        _os_log_impl(&dword_209E41000, v19, OS_LOG_TYPE_INFO, "Test END receiving data of length %ld", (uint8_t *)&v26, 0xCu);

      }
      -[WPTest delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        -[WPTest delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentReceivedData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v24, "copy");
        objc_msgSend(v23, "test:didReceiveData:fromPeer:", self, v25, v11);

      }
      objc_msgSend(v13, "resetTransfer");
    }

  }
}

- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("wp.test")))
    -[WPTest receivedData:forCharacteristic:inService:forPeripheral:](self, "receivedData:forCharacteristic:inService:forPeripheral:", v9, 0, 0, v8);

}

- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v8 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("AF0BADB1-5B99-43CD-917A-A77BC549E3CC"))
    && (objc_msgSend(v12, "isEqualToString:", CFSTR("9FA480E0-4967-4542-9390-D343DC5D04AE")) & 1) != 0)
  {
    if (v8)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_223);
      v13 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        v19 = v10;
        _os_log_impl(&dword_209E41000, v13, OS_LOG_TYPE_DEFAULT, "test central connected to our device %{public}@, send Peripheral didConnect", (uint8_t *)&v18, 0xCu);
      }
      -[WPTest delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[WPTest delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "test:didConnectToPeer:transport:error:", self, v10, 1, 0);

      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_225);
      v17 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_209E41000, v17, OS_LOG_TYPE_DEFAULT, "Saw unsubscribe...disconnection pending", (uint8_t *)&v18, 2u);
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_221);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest central:subscribed:toCharacteristic:inService:].cold.1();
  }

}

- (void)disconnectFromPeer:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_232);
    v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "test disconnect from peer: %{public}@", buf, 0xCu);
    }
    v19.receiver = self;
    v19.super_class = (Class)WPTest;
    -[WPClient disconnectFromPeer:](&v19, sel_disconnectFromPeer_, v4);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_228);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest disconnectFromPeer:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    v14 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = CFSTR("test peer is null");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPTest delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[WPTest delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "test:didDisconnectFromPeer:error:", self, 0, v16);

    }
  }

}

- (void)disconnectedDevice:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("test peer: %@ is disconnected with error: %@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_237);
    v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_209E41000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - send didDisconnect", buf, 0xCu);
    }

  }
  -[WPTest transfers](self, "transfers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "resetTransfer");
  -[WPTest delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_239);
    v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_209E41000, v17, OS_LOG_TYPE_DEFAULT, "test sending didDisconnectFromPeer %@ with error %@", buf, 0x16u);
    }
    -[WPTest delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "test:didDisconnectFromPeer:error:", self, v6, v7);

  }
}

- (void)disconnectedDeviceOverLEPipe:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_240);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "test disconnected %@ over LE pipe with error %@", (uint8_t *)&v9, 0x16u);
  }
  -[WPTest disconnectedDevice:withError:](self, "disconnectedDevice:withError:", v6, v7);

}

- (void)stateDidChange:(int64_t)a3
{
  int64_t v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v5 = -[WPClient state](self, "state");
  v11.receiver = self;
  v11.super_class = (Class)WPTest;
  -[WPClient stateDidChange:](&v11, sel_stateDidChange_, a3);
  if (-[WPClient state](self, "state") != v5)
  {
    if (-[WPClient state](self, "state") == 3)
    {
      v10.receiver = self;
      v10.super_class = (Class)WPTest;
      -[WPClient registerEndpoint:requireAck:requireEncryption:](&v10, sel_registerEndpoint_requireAck_requireEncryption_, CFSTR("wp.test"), 1, 0);
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)WPTest;
      -[WPClient unregisterEndpoint:](&v9, sel_unregisterEndpoint_, CFSTR("wp.test"));
    }
    -[WPTest delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[WPTest delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "testDidUpdateState:", self);

    }
  }
}

- (WPTestDelegate)delegate
{
  return (WPTestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)transfers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTransfers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transfers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startAdvertisingOfType:data:priority:mode:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_209E41000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)advertisingStartedOfType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_0(&dword_209E41000, v0, v1, "test advertising started of type: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)advertisingFailedToStart:(void *)a3 ofType:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_12(a1, a2);
  objc_msgSend(a3, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_209E41000, v6, v7, "test advertising failed to start of type: %d with error: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_1();
}

- (void)advertisingStoppedOfType:(unsigned __int8)a1 withError:(NSObject *)a2 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_209E41000, a2, OS_LOG_TYPE_DEBUG, "test advertising stopped of type: %ld", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)scanningStartedOfType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_0(&dword_209E41000, v0, v1, "test started scanning of type: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)scanningFailedToStart:(void *)a3 ofType:.cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_12(a1, a2);
  objc_msgSend(a3, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_209E41000, v6, v7, "test failed to start scanning of type: %d with error: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_1();
}

- (void)scanningStoppedOfType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_0(&dword_209E41000, v0, v1, "test scanning stopped of type: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)deviceDiscovered:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209E41000, log, OS_LOG_TYPE_ERROR, "test Advert UUID not available", v1, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)connectToPeer:(uint64_t)a3 withOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "%@ - send didConnect", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendData:(uint64_t)a3 toPeer:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendData:(void *)a3 toPeer:.cold.4(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a1;
  OUTLINED_FUNCTION_11();
  objc_msgSend(a3, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_209E41000, v6, v7, "test send data size %lu: %@ peer: %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)receivedData:(uint64_t)a1 forCharacteristic:(void *)a2 inService:forPeripheral:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_209E41000, v4, v5, "Test received data %@ of length %ld from peer %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)central:subscribed:toCharacteristic:inService:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_209E41000, v1, OS_LOG_TYPE_ERROR, "test received subscription notification of characteristic: %@, service: %@ is not of type test", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)disconnectFromPeer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "%@ - sending didDisconnect", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
