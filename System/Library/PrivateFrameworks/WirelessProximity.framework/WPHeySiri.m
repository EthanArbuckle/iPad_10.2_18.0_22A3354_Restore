@implementation WPHeySiri

- (WPHeySiri)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  WPHeySiri *v7;
  WPHeySiri *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPHeySiri;
  v7 = -[WPClient initWithQueue:machName:](&v10, sel_initWithQueue_machName_, a4, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_isScanning = 0;
  }

  return v8;
}

- (id)clientAsString
{
  return CFSTR("WPHeySiri");
}

- (void)invalidate
{
  objc_super v3;

  -[WPHeySiri setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WPHeySiri;
  -[WPClient invalidate](&v3, sel_invalidate);
}

+ (int64_t)holdVouchers
{
  return 12;
}

- (void)startScanningAndAdvertisingWithData:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_16);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "HeySiri start advertise and scan", v6, 2u);
  }
  -[WPHeySiri startAdvertisingWithData:](self, "startAdvertisingWithData:", v4);
  -[WPHeySiri startScanning](self, "startScanning");

}

- (void)stopScanningAndAdvertising
{
  NSObject *v3;
  uint8_t v4[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_104_2);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "HeySiri stop advertise and scan", v4, 2u);
  }
  -[WPHeySiri stopAdvertising](self, "stopAdvertising");
  -[WPHeySiri stopScanning](self, "stopScanning");
}

- (void)startAdvertisingWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUpdateTime:", 45.0);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPHeySiriAdvertisingData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAdvertisingData:", v6);
  if (+[WPClient isHomePodOrIOS](WPClient, "isHomePodOrIOS"))
    v7 = startAdvertisingWithData__rates[arc4random_uniform(6u)];
  else
    v7 = 48;
  objc_msgSend(v5, "setAdvertisingRate:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", clock_gettime_nsec_np(_CLOCK_MONOTONIC) / 0xF4240);
  objc_msgSend(v5, "setAdvertisementRequestedAt:", v8);

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_107);
  v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v5, "advertisingData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "advertisementRequestedAt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v11;
    v16 = 2048;
    v17 = objc_msgSend(v12, "longLongValue");
    _os_log_impl(&dword_209E41000, v10, OS_LOG_TYPE_DEFAULT, "HeySiri start advertising data=%@ at %llu", buf, 0x16u);

  }
  v13.receiver = self;
  v13.super_class = (Class)WPHeySiri;
  -[WPClient startAdvertising:](&v13, sel_startAdvertising_, v5);

}

- (void)stopAdvertising
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_110_0);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "HeySiri stop advertising", buf, 2u);
  }
  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)WPHeySiri;
  -[WPClient stopAdvertising:](&v5, sel_stopAdvertising_, v4);

}

- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "updateTime");
  if (v8 <= 0.0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_115_0);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPHeySiri updateAdvertisingRequest:withUpdate:].cold.2(v11, v6);
  }
  else
  {
    objc_msgSend(v6, "setUpdateTime:", 0.0);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_113_1);
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPHeySiri updateAdvertisingRequest:withUpdate:].cold.1((uint64_t)v6, v9, v10);
    -[WPHeySiri stopAdvertising](self, "stopAdvertising");
  }
  v7[2](v7, 0);

}

- (void)startScanning
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  int64x2_t v7;
  uint64_t v8;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_116_2);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "HeySiri start scanning", buf, 2u);
  }
  if (-[WPHeySiri isScanning](self, "isScanning"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_118_0);
    v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "HeySiri already scanning, do not restart", buf, 2u);
    }
  }
  else
  {
    -[WPHeySiri setIsScanning:](self, "setIsScanning:", 1);
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setUpdateTime:", 10.0);
    v7 = vdupq_n_s64(0x1EuLL);
    v8 = 30;
    objc_msgSend(v5, "setScanningRates:", &v7);
    objc_msgSend(v5, "setActiveScanning:", 0);
    objc_msgSend(v5, "setAllowDuplicates:", 1);
    if (+[WPClient isHomePod](WPClient, "isHomePod"))
      objc_msgSend(v5, "setAllowDuplicates:", 0);
    objc_msgSend(v5, "setRssiThreshold:", &unk_24C290E00);
    objc_msgSend(v5, "setClientType:", 8);
    objc_msgSend(v5, "setPriorityCritical:", 1);
    v6.receiver = self;
    v6.super_class = (Class)WPHeySiri;
    -[WPClient startScanning:](&v6, sel_startScanning_, v5);

  }
}

- (void)stopScanning
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_123_0);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "HeySiri stop scanning", buf, 2u);
  }
  -[WPHeySiri setIsScanning:](self, "setIsScanning:", 0);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setClientType:", 8);
  v5.receiver = self;
  v5.super_class = (Class)WPHeySiri;
  -[WPClient stopScanning:](&v5, sel_stopScanning_, v4);

}

- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "updateTime");
  if (v8 <= 0.0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_128_0);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPHeySiri updateScanningRequest:withUpdate:].cold.2(v11, v6, self);
    -[WPHeySiri setIsScanning:](self, "setIsScanning:", 0);
  }
  else
  {
    objc_msgSend(v6, "setUpdateTime:", 0.0);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_126_2);
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPHeySiri updateScanningRequest:withUpdate:].cold.1((uint64_t)v6, v9, v10);
    -[WPHeySiri stopScanning](self, "stopScanning");
  }
  v7[2](v7, 0);

}

- (void)stateDidChange:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WPHeySiri;
  -[WPClient stateDidChange:](&v7, sel_stateDidChange_, a3);
  -[WPHeySiri delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPHeySiri delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "heySiriDidUpdateState:", self);

  }
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  uint8_t v8[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_133_1);
  v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "HeySiri started advertising", v8, 2u);
  }
  -[WPHeySiri delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPHeySiri delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heySiriStartedAdvertising:", self);

  }
}

- (void)advertisingStartedOfTypeAt:(unsigned __int8)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = mach_absolute_time();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_136_1);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = v4;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "HeySiri started advertising at %llu", (uint8_t *)&v9, 0xCu);
  }
  -[WPHeySiri delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WPHeySiri delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "heySiriStartedAdvertisingAt:timeStamp:", self, v4);

  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v5 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_139_1);
  v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "HeySiri stopped advertising", v10, 2u);
  }
  -[WPHeySiri delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WPHeySiri delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "heySiriStoppedAdvertising:", self);

  }
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPHeySiri delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPHeySiri delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heySiri:failedToStartAdvertisingWithError:", self, v8);

  }
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  void *v4;
  char v5;
  id v6;

  -[WPHeySiri delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPHeySiri delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "heySiriAdvertisingPending:", self);

  }
}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WPHeySiri delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePeripheralUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (unint64_t)objc_msgSend(v7, "length") >= 5)
    {
      objc_msgSend(v7, "subdataWithRange:", 4, objc_msgSend(v7, "length") - 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_148_0);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPHeySiri deviceDiscovered:].cold.2();
      v17[0] = v8;
      v16[0] = CFSTR("WPHeySiriKeyDeviceUUID");
      v16[1] = CFSTR("WPHeySiriKeyDeviceAddress");
      v13 = v9;
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "data");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17[1] = v13;
      v17[2] = v12;
      v16[2] = CFSTR("WPHeySiriKeyManufacturerData");
      v16[3] = CFSTR("WPHeySiriKeyDeviceTime");
      v16[4] = CFSTR("WPHeySiriKeyDeviceRSSI");
      v17[3] = v10;
      v17[4] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)

      -[WPHeySiri delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "heySiri:foundDevice:withInfo:", self, v8, v14);

    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_152_2);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPHeySiri deviceDiscovered:].cold.1();
    }

  }
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  uint8_t v8[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_153_0);
  v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "HeySiri started scanning", v8, 2u);
  }
  -[WPHeySiri delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPHeySiri delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heySiriStartedScanning:", self);

  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  uint8_t v8[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_156_0);
  v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "HeySiri stopped scanning", v8, 2u);
  }
  -[WPHeySiri delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPHeySiri delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heySiriStoppedScanning:", self);

  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WPHeySiri setIsScanning:](self, "setIsScanning:", 0);
  -[WPHeySiri delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPHeySiri delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heySiri:failedToStartScanningWithError:", self, v8);

  }
}

- (WPHeySiriProtocol)delegate
{
  return (WPHeySiriProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startScanningAndAdvertisingWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[3];
  objc_super v38;
  uint64_t v39;
  const __CFString *v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_205);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v4;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "HeySiri startScanningAndAdvertisingWithDataAndOptions %@", buf, 0xCu);
  }
  if (!-[WPClient isTestClient](self, "isTestClient"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_209_1);
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPHeySiri(Test) startScanningAndAdvertisingWithOptions:].cold.3(v9, v10, v11);
    v12 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0FC8];
    v40 = CFSTR("Non-test client calling test API.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 29, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPHeySiri scanningFailedToStart:ofType:](self, "scanningFailedToStart:ofType:", v14, 8);
    -[WPHeySiri advertisingFailedToStart:ofType:](self, "advertisingFailedToStart:ofType:", v14, 8);
    goto LABEL_51;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestScan"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestScan"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue") ^ 1;

  }
  else
  {
    v8 = 1;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestAdvertise"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestAdvertise"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_212_1);
      v19 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209E41000, v19, OS_LOG_TYPE_DEFAULT, "HeySiri start advertising", buf, 2u);
      }
      +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", 8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUpdateTime:", 45.0);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPHeySiriAdvertisingData"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WPHeySiriAdvertisingData"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAdvertisingData:", v22);

      }
      else
      {
        objc_msgSend(v20, "setAdvertisingData:", 0);
      }

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestAdvertisingRate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestAdvertisingRate"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAdvertisingRate:", objc_msgSend(v24, "integerValue"));

      }
      else
      {
        objc_msgSend(v20, "setAdvertisingRate:", 48);
      }

      objc_msgSend(v20, "advertisingData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_214_2);
        v26 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          -[WPHeySiri(Test) startScanningAndAdvertisingWithOptions:].cold.2(v26, v20);
      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_216_0);
        v27 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPHeySiri(Test) startScanningAndAdvertisingWithOptions:].cold.1(v27);
      }
      v38.receiver = self;
      v38.super_class = (Class)WPHeySiri;
      -[WPClient startAdvertising:](&v38, sel_startAdvertising_, v20);

    }
  }
  if ((v8 & 1) == 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_218_1);
    v28 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E41000, v28, OS_LOG_TYPE_DEFAULT, "HeySiri start scanning", buf, 2u);
    }
    -[WPHeySiri setIsScanning:](self, "setIsScanning:", 1);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestScanDutyCycle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestScanDutyCycle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "integerValue");

    }
    else
    {
      v31 = 100;
    }

    v14 = (void *)objc_opt_new();
    v37[0] = 3000 / v31;
    v37[1] = 3000 / v31;
    v37[2] = 30;
    objc_msgSend(v14, "setScanningRates:", v37);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestActiveScan"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestActiveScan"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setActiveScanning:", objc_msgSend(v33, "BOOLValue"));

    }
    else
    {
      objc_msgSend(v14, "setActiveScanning:", 0);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestScanWithDups"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kWPHeySiriTestScanWithDups"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAllowDuplicates:", objc_msgSend(v35, "BOOLValue"));

    }
    else
    {
      objc_msgSend(v14, "setAllowDuplicates:", 0);
    }

    objc_msgSend(v14, "setRssiThreshold:", &unk_24C290E00);
    objc_msgSend(v14, "setClientType:", 8);
    objc_msgSend(v14, "setPriorityCritical:", 1);
    v36.receiver = self;
    v36.super_class = (Class)WPHeySiri;
    -[WPClient startScanning:](&v36, sel_startScanning_, v14);
LABEL_51:

  }
}

- (void)updateAdvertisingRequest:(uint64_t)a3 withUpdate:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_209E41000, a2, a3, "HeySiri timed-out advertising request with data: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)updateAdvertisingRequest:(void *)a1 withUpdate:(void *)a2 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v3 = OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend(a2, "updateTime");
  v6 = 134217984;
  v7 = v4;
  OUTLINED_FUNCTION_0_0(&dword_209E41000, v3, v5, "HeySiri advertising updateTime set to %.2f", (uint8_t *)&v6);

  OUTLINED_FUNCTION_7_0();
}

- (void)updateScanningRequest:(uint64_t)a3 withUpdate:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_209E41000, a2, a3, "HeySiri timed-out scan request with data: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)updateScanningRequest:(void *)a3 withUpdate:.cold.2(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;

  v5 = OUTLINED_FUNCTION_11_1(a1);
  objc_msgSend(a2, "updateTime");
  v7 = 134218240;
  v8 = v6;
  v9 = 1024;
  v10 = objc_msgSend(a3, "isScanning");
  _os_log_error_impl(&dword_209E41000, v5, OS_LOG_TYPE_ERROR, "HeySiri scan updateTime set to %.2f, current scan: %d", (uint8_t *)&v7, 0x12u);

}

- (void)deviceDiscovered:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_209E41000, v0, OS_LOG_TYPE_ERROR, "HeySiri invalid TLD=%@ from %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)deviceDiscovered:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_209E41000, v0, OS_LOG_TYPE_DEBUG, "HeySiri data=%@ from %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
