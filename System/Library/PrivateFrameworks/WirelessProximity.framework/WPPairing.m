@implementation WPPairing

- (WPPairing)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  WPPairing *v19;
  WPPairing *v20;
  WPPairing *v21;
  uint64_t v22;
  NSMutableSet *ignoredDevices;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[WPClient isHomePod](WPClient, "isHomePod"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_4);
    v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPPairing initWithDelegate:queue:machName:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    v19 = 0;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)WPPairing;
    v20 = -[WPClient initWithQueue:machName:](&v31, sel_initWithQueue_machName_, v9, v10);
    v21 = v20;
    if (v20)
    {
      objc_storeWeak((id *)&v20->_delegate, v8);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v22 = objc_claimAutoreleasedReturnValue();
      ignoredDevices = v21->_ignoredDevices;
      v21->_ignoredDevices = (NSMutableSet *)v22;

      v21->_allowScreenOffScanning = 0;
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "persistentDomainForName:", CFSTR("com.apple.MobileBluetooth.debug"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("WIPROX"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ScreenOffProxPairing"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v21->_allowScreenOffScanning = objc_msgSend(v27, "BOOLValue");
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_99);
        v29 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          -[WPPairing initWithDelegate:queue:machName:].cold.2((unsigned __int8 *)&v21->_allowScreenOffScanning, v29);
      }

    }
    self = v21;
    v19 = self;
  }

  return v19;
}

- (WPPairing)initWithDelegate:(id)a3
{
  return -[WPPairing initWithDelegate:queue:machName:](self, "initWithDelegate:queue:machName:", a3, 0, 0);
}

- (WPPairing)initWithDelegate:(id)a3 queue:(id)a4
{
  return -[WPPairing initWithDelegate:queue:machName:](self, "initWithDelegate:queue:machName:", a3, a4, 0);
}

- (id)clientAsString
{
  return CFSTR("WPPairing");
}

- (void)invalidate
{
  objc_super v3;

  -[WPPairing setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WPPairing;
  -[WPClient invalidate](&v3, sel_invalidate);
}

- (void)startProximityPairingServiceScanningWithRSSI:(id)a3 duplicates:(BOOL)a4 scanMode:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  objc_super v16;
  _QWORD v17[3];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = 300;
  if ((unint64_t)(a5 - 1) < 2)
    v9 = 60;
  if (a5 == 3)
    v10 = 40;
  else
    v10 = v9;
  v11 = -[WPClient isBubbleTestClient](self, "isBubbleTestClient");
  v12 = v11 | v6;
  if (v11)
    v13 = 30;
  else
    v13 = v10;
  v14 = (void *)objc_opt_new();
  v17[0] = v13;
  v17[1] = v13;
  v17[2] = 30;
  objc_msgSend(v14, "setScanningRates:", v17);
  objc_msgSend(v14, "setAllowDuplicates:", v12);
  objc_msgSend(v14, "setClientType:", 7);
  if (v8)
    objc_msgSend(v14, "setRssiThreshold:", v8);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_105);
  v15 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v14;
    _os_log_impl(&dword_209E41000, v15, OS_LOG_TYPE_DEFAULT, "ProximityPairing start scanning with data: %{public}@", buf, 0xCu);
  }
  v16.receiver = self;
  v16.super_class = (Class)WPPairing;
  -[WPClient startScanning:](&v16, sel_startScanning_, v14);

}

- (void)startProximityPairingServiceScanningWithRSSI:(id)a3 duplicates:(BOOL)a4
{
  -[WPPairing startProximityPairingServiceScanningWithRSSI:duplicates:scanMode:](self, "startProximityPairingServiceScanningWithRSSI:duplicates:scanMode:", a3, a4, 0);
}

- (void)startProximityPairingServiceScanning
{
  -[WPPairing startProximityPairingServiceScanningWithRSSI:duplicates:scanMode:](self, "startProximityPairingServiceScanningWithRSSI:duplicates:scanMode:", 0, 1, 0);
}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePeripheralUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceName"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePaired"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceChannel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceTime"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceProxPairingStatusDecrypted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAccessoryStatusDecrypted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "length") > 6)
  {
    v23 = v6;
    -[WPPairing delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v27[0] = CFSTR("WPPairingKeyName");
      v27[1] = CFSTR("WPPairingKeyPaired");
      v12 = (void *)v8;
      v28[0] = v8;
      v28[1] = v26;
      v27[2] = CFSTR("WPPairingKeyAdvertisingChannel");
      v27[3] = CFSTR("WPPairingKeyRSSI");
      v28[2] = v25;
      v28[3] = v7;
      v27[4] = CFSTR("WPPairingKeyDeviceTime");
      v27[5] = CFSTR("WPPairingKeyDeviceAddress");
      v16 = v9;
      v28[4] = v24;
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28[5] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      if (!v9)
      if (v10)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, CFSTR("WPPairingKeyStatusDecrypted"));
      if (v11)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, CFSTR("WPPairingKeyAccessoryStatusDecrypted"));
      -[WPPairing delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "copy");
      objc_msgSend(v19, "pairing:foundDevice:payload:rssi:peerInfo:", self, v23, v5, v7, v20);

      v6 = v23;
    }
    else
    {
      v12 = (void *)v8;
      -[WPPairing delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      v6 = v23;
      if ((v22 & 1) == 0)
        goto LABEL_19;
      -[WPPairing delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pairing:foundDevice:payload:rssi:", self, v19, v5, v7);
    }

    goto LABEL_19;
  }
  v12 = (void *)v8;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_108);
  v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPPairing deviceDiscovered:].cold.1(v13, v5);
LABEL_19:

}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPPairing delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPPairing delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pairingStartedScanning:", self);

  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPPairing delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPPairing delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pairing:failedToStartScanningWithError:", self, v8);

  }
}

- (void)stopProximityPairingServiceScanning
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setClientType:", 7);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_119_0);
  v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "ProximityPairing stop scanning", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)WPPairing;
  -[WPClient stopScanning:](&v5, sel_stopScanning_, v3);

}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPPairing delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPPairing delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pairingStoppedScanning:", self);

  }
}

- (void)ignoreDeviceUntilNextUnlock:(id)a3 ignoreDevice:(BOOL)a4
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_124);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPPairing ignoreDeviceUntilNextUnlock:ignoreDevice:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

}

- (void)clearProximityPairingServiceDuplicates
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setClientType:", 7);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_125);
  v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "ProximityPairing clear duplicate cache", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)WPPairing;
  -[WPClient clearDuplicateFilterCache:](&v5, sel_clearDuplicateFilterCache_, v3);

}

- (void)stateDidChange:(int64_t)a3
{
  int64_t v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  v5 = -[WPClient state](self, "state");
  v9.receiver = self;
  v9.super_class = (Class)WPPairing;
  -[WPClient stateDidChange:](&v9, sel_stateDidChange_, a3);
  if (-[WPClient state](self, "state") != v5)
  {
    -[WPPairing delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[WPPairing delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pairingDidUpdateState:", self);

    }
  }
}

- (WPPairingDelegate)delegate
{
  return (WPPairingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)ignoredDevices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIgnoredDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)allowScreenOffScanning
{
  return self->_allowScreenOffScanning;
}

- (void)setAllowScreenOffScanning:(BOOL)a3
{
  self->_allowScreenOffScanning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(uint64_t)a3 queue:(uint64_t)a4 machName:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_209E41000, a1, a3, "ProximityPairing is not supported on this product", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithDelegate:(unsigned __int8 *)a1 queue:(NSObject *)a2 machName:.cold.2(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_209E41000, a2, OS_LOG_TYPE_DEBUG, "Using allow screen off scanning for prox pairing: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1_1();
}

- (void)deviceDiscovered:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = 134217984;
  v5 = objc_msgSend(a2, "length");
  _os_log_error_impl(&dword_209E41000, v3, OS_LOG_TYPE_ERROR, "ProximityPairing minimum advertisement data length expected: 7, received: %lu", (uint8_t *)&v4, 0xCu);

}

- (void)ignoreDeviceUntilNextUnlock:(uint64_t)a3 ignoreDevice:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_209E41000, a1, a3, "Unimplemented for now, will scope if it's being used", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
