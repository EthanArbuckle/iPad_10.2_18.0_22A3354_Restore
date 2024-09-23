@implementation WPHomeKit

- (WPHomeKit)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  WPHomeKit *v7;
  WPHomeKit *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPHomeKit;
  v7 = -[WPClient initWithQueue:machName:](&v10, sel_initWithQueue_machName_, a4, 0);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_delegate, v6);

  return v8;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)dutyCycleToScanningRates:(SEL)a3
{
  int64_t v5;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *v7;
  id v8;

  retstr->var2 = 30;
  *(_OWORD *)&retstr->var0 = xmmword_209E73BD0;
  switch(a4)
  {
    case 2:
LABEL_7:
      v5 = 60;
      goto LABEL_8;
    case 1:
      self = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)_os_feature_enabled_impl();
      if ((_DWORD)self)
      {
        *(int64x2_t *)&retstr->var0 = vdupq_n_s64(0x1EuLL);
        return self;
      }
      goto LABEL_7;
    case 0:
      v5 = 300;
LABEL_8:
      retstr->var0 = v5;
      return self;
  }
  v7 = self;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a3, v7, CFSTR("WPHomeKit.m"), 86, CFSTR("Unknown duty cycle type"));

  return self;
}

- (unsigned)clientTypeFromHomeKitType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if (!a3)
    return 6;
  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnknownHomeKitType"), CFSTR("The HomeKit type isn't valid"), 0, v3, v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_exception_throw(v6);
  }
  return 17;
}

- (int64_t)homeKitTypeFromClientType:(unsigned __int8)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3 == 6)
    return 0;
  if (a3 != 17)
  {
    v4 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The client type %ld isn't valid"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exceptionWithName:reason:userInfo:", CFSTR("UnknownClientType"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(objc_retainAutorelease(v6));
  }
  return 1;
}

- (id)clientAsString
{
  return CFSTR("WPHomeKit");
}

- (void)invalidate
{
  objc_super v3;

  -[WPHomeKit setDelegate:](self, "setDelegate:", 0);
  if (self->_homeKitCBDiscovery)
    -[WPHomeKit tearDownCBDiscovery](self, "tearDownCBDiscovery");
  v3.receiver = self;
  v3.super_class = (Class)WPHomeKit;
  -[WPClient invalidate](&v3, sel_invalidate);
}

- (void)startScanningWithData:(id)a3 forType:(int64_t)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  int64_t v38;
  void *v39;
  void *v40;
  objc_super v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  int64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v55 = v7;
    v56 = 2048;
    v57 = a4;
    _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit startScanningWithData %@, type %ld", buf, 0x16u);
  }
  v38 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WPHomeKitScanBlobData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WPHomeKitScanMaskData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WPHomeKitScanDutyCycle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WPHomeKitScanOptionRange"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WPHomeKitScanOptionWHB"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WPHomeKitScanOptionWHB"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue") ^ 1;

  }
  else
  {
    v15 = 1;
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WPHomeKitScanOptionRetainDuplicates"));
  v39 = (void *)v12;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 && v10)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v52 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid blob data provided, Blob Data: %@ is null but Mask data: %@ is not null"), 0, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  if (v9 && v10)
  {
    v20 = objc_msgSend(v10, "length");
    if (v20 > objc_msgSend(v9, "length"))
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v50 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid mask data provided, Mask data length: %lu > Blob data length: %lu"), objc_msgSend(v10, "length"), objc_msgSend(v9, "length"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
  }
  else if (!v9)
  {
    goto LABEL_17;
  }
  if ((unint64_t)objc_msgSend(v9, "length") > 0x16)
  {
LABEL_21:
    v23 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid data provided, Blob data: %@, Mask data: %@, Duty Cycle: %@"), v9, v10, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
LABEL_17:
  if (v10 && (unint64_t)objc_msgSend(v10, "length") > 0x16
    || objc_msgSend(v11, "integerValue") < 0
    || objc_msgSend(v11, "integerValue") >= 3)
  {
    goto LABEL_21;
  }
  if ((v15 & 1) != 0)
    goto LABEL_27;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_119);
  v33 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v33, OS_LOG_TYPE_DEFAULT, "HomeKit WHB scan requested", buf, 2u);
  }
  if (!-[WPHomeKit isWHBSupported](self, "isWHBSupported"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WPHomeKit.m"), 185, CFSTR("WHB Scan is only allowed on tvOS"));

  }
  v28 = v39;
  if (_os_feature_enabled_impl())
  {
    v35 = -[WPHomeKit startCBDiscoveryScan:forType:](self, "startCBDiscoveryScan:forType:", v7, v38);
LABEL_42:
    v19 = 0;
    goto LABEL_43;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_126);
  v36 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPHomeKit startScanningWithData:forType:].cold.1(v36);
  v37 = (void *)MEMORY[0x24BDD1540];
  v46 = *MEMORY[0x24BDD0FC8];
  v47 = CFSTR("WHB scan is not enabled.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  if (!v19)
  {
LABEL_27:
    v29 = (void *)objc_opt_new();
    -[WPHomeKit dutyCycleToScanningRates:](self, "dutyCycleToScanningRates:", objc_msgSend(v11, "integerValue"));
    v42 = v44;
    v43 = v45;
    objc_msgSend(v29, "setScanningRates:", &v42);
    objc_msgSend(v29, "setAllowDuplicates:", 0);
    objc_msgSend(v29, "setClientType:", -[WPHomeKit clientTypeFromHomeKitType:](self, "clientTypeFromHomeKitType:", v38));
    objc_msgSend(v29, "setActiveScanning:", objc_msgSend(v11, "integerValue") == 2);
    objc_msgSend(v29, "setBlobValue:", v9);
    objc_msgSend(v29, "setMaskValue:", v10);
    v28 = v39;
    if (v39)
      v30 = objc_msgSend(v39, "BOOLValue");
    else
      v30 = 0;
    objc_msgSend(v29, "setRange:", v30);
    if (v40)
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(v29, "setRetainDuplicates:", objc_msgSend(v40, "BOOLValue"));
      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_131);
        v31 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209E41000, v31, OS_LOG_TYPE_DEFAULT, "HomeKit scan option retain duplicates is not enabled.", buf, 2u);
        }
      }
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_133);
    v32 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v29;
      _os_log_impl(&dword_209E41000, v32, OS_LOG_TYPE_DEFAULT, "HomeKit start scan with %@", buf, 0xCu);
    }
    v41.receiver = self;
    v41.super_class = (Class)WPHomeKit;
    -[WPClient startScanning:](&v41, sel_startScanning_, v29);

    goto LABEL_42;
  }
  -[WPHomeKit delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    -[WPHomeKit delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "homeKit:failedToStartScanningWithError:forType:", self, v19, v38);

  }
  v28 = v39;
LABEL_43:

}

- (void)stopScanningForType:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_136);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "HomeKit stopScanning type %ld", buf, 0xCu);
  }
  if (self->_homeKitCBDiscovery && -[WPHomeKit discoveryFlagsContains:](self, "discoveryFlagsContains:", a3))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_138);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = a3;
      _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "HomeKit CBDiscovery stopScanning type %ld", buf, 0xCu);
    }
    -[WPHomeKit stopCBDiscoveryScan:](self, "stopCBDiscoveryScan:", a3);
  }
  else
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setClientType:", -[WPHomeKit clientTypeFromHomeKitType:](self, "clientTypeFromHomeKitType:", a3));
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_140);
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = (int64_t)v7;
      _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit stop scan with %@", buf, 0xCu);
    }
    v9.receiver = self;
    v9.super_class = (Class)WPHomeKit;
    -[WPClient stopScanning:](&v9, sel_stopScanning_, v7);

  }
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
  v9.super_class = (Class)WPHomeKit;
  -[WPClient stateDidChange:](&v9, sel_stateDidChange_, a3);
  if (-[WPClient state](self, "state") != v5)
  {
    -[WPHomeKit delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[WPHomeKit delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "homeKitDidUpdateState:", self);

    }
  }
}

- (void)checkAllowDuplicate
{
  objc_super v2;
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __32__WPHomeKit_checkAllowDuplicate__block_invoke;
  v3[3] = &unk_24C285B40;
  v3[4] = self;
  v2.receiver = self;
  v2.super_class = (Class)WPHomeKit;
  v3[0] = MEMORY[0x24BDAC760];
  -[WPClient checkAllowDuplicates:](&v2, sel_checkAllowDuplicates_, v3);
}

void __32__WPHomeKit_checkAllowDuplicate__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeKit:allowDuplicate:", *(_QWORD *)(a1 + 32), a2);

  }
}

- (void)deviceDiscovered:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kDevicePeripheralUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kDeviceAdvertisingPacket"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kDeviceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  -[WPHomeKit delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPHomeKit delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "homeKit:foundDevice:withData:RSSI:type:", self, v4, v5, v10, -[WPHomeKit homeKitTypeFromClientType:](self, "homeKitTypeFromClientType:", v7));

  }
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[WPHomeKit delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPHomeKit delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeKitStartedScanning:forType:", self, -[WPHomeKit homeKitTypeFromClientType:](self, "homeKitTypeFromClientType:", v3));

  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[WPHomeKit delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPHomeKit delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeKitStoppedScanning:forType:", self, -[WPHomeKit homeKitTypeFromClientType:](self, "homeKitTypeFromClientType:", v3));

  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[WPHomeKit delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WPHomeKit delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeKit:failedToStartScanningWithError:forType:", self, v9, -[WPHomeKit homeKitTypeFromClientType:](self, "homeKitTypeFromClientType:", v4));

  }
}

- (void)setStartScanParametersfor:(id)a3 withValues:(id)a4 forType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  $2825F4736939C4A6D3AD43837233062D v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WPHomeKitScanDutyCycle"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WPHomeKitScanOptionRange"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WPHomeKit homeKitScanTypeToCBDiscoveryScanRates:](self, "homeKitScanTypeToCBDiscoveryScanRates:", objc_msgSend(v17, "integerValue"));
  v12 = objc_msgSend(v9, "discoveryFlags");
  v13 = -[WPHomeKit homeKitTypeToCBDiscoveryFlag:](self, "homeKitTypeToCBDiscoveryFlag:", a5) | v12;
  v14 = 0x400002000000;
  if (!v11.var1)
    v14 = 0x400000000000;
  v15 = v13 | v14;
  if (objc_msgSend(v10, "BOOLValue"))
    v16 = v15 | 0x10000000000;
  else
    v16 = v15;
  objc_msgSend(v9, "setDiscoveryFlags:", v16);
  objc_msgSend(v9, "setBleScanRate:", v11);
  objc_msgSend(v9, "setBleScanRateScreenOff:", HIDWORD(*(unint64_t *)&v11));
  objc_msgSend(v9, "setBleRSSIThresholdHint:", 4294967206);

}

- (void)setStopScanParametersforType:(int64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = -[CBDiscovery discoveryFlags](self->_homeKitCBDiscovery, "discoveryFlags");
  v6 = v5 & ~-[WPHomeKit homeKitTypeToCBDiscoveryFlag:](self, "homeKitTypeToCBDiscoveryFlag:", a3);
  if (-[WPHomeKit isHomeKitScanActive:](self, "isHomeKitScanActive:", v6))
    v7 = v6;
  else
    v7 = 0;
  -[CBDiscovery setDiscoveryFlags:](self->_homeKitCBDiscovery, "setDiscoveryFlags:", v7);
}

- (void)deviceFoundHandler:(id)a3 cached:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[5];
  _QWORD v35[7];

  v4 = a4;
  v35[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_158);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPHomeKit deviceFoundHandler:cached:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v6, "bleRSSI"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[WPHomeKit homeKitTypeFromCBDiscoveryFlag:](self, "homeKitTypeFromCBDiscoveryFlag:", objc_msgSend(v6, "discoveryFlags"));
  objc_msgSend(v6, "btAddressData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = *MEMORY[0x24BDBAFC8];
  objc_msgSend(v6, "bleAppleManufacturerData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v17;
  v34[1] = *MEMORY[0x24BDBAFC0];
  objc_msgSend(v6, "name");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = &stru_24C289820;
  v35[1] = v20;
  v34[2] = CFSTR("kDeviceStableIdentifier");
  objc_msgSend(v6, "stableIdentifier");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = &stru_24C289820;
  v35[2] = v23;
  v34[3] = *MEMORY[0x24BDBAFA0];
  v24 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[3] = v24;
  v34[4] = CFSTR("kCachedAdvertisement");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  v32[0] = CFSTR("kDeviceAdvertisingPacket");
  v32[1] = CFSTR("kDevicePeripheralUUID");
  v33[0] = v26;
  v33[1] = v31;
  v33[2] = v30;
  v32[2] = CFSTR("kDeviceRSSI");
  v32[3] = CFSTR("kDeviceType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[WPHomeKit clientTypeFromHomeKitType:](self, "clientTypeFromHomeKitType:", v29));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPHomeKit deviceDiscovered:](self, "deviceDiscovered:", v28);
}

- (void)deviceLostHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_164);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPHomeKit deviceLostHandler:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);

  objc_msgSend(v4, "btAddressData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("kDeviceStableIdentifier");
  objc_msgSend(v4, "stableIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &stru_24C289820;
  if (v16)
    v18 = (const __CFString *)v16;
  v25[0] = v18;
  v24[1] = *MEMORY[0x24BDBAFA0];
  v19 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)

  -[WPHomeKit delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[WPHomeKit delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "homeKit:lostDevice:withData:", self, v14, v20);

  }
}

- (id)startCBDiscoveryScan:(id)a3 forType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  CBDiscovery **p_homeKitCBDiscovery;
  CBDiscovery *homeKitCBDiscovery;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  CBDiscovery *v17;
  _QWORD block[6];
  _QWORD v20[4];
  id v21;
  WPHomeKit *v22;
  int64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_167);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v6;
    v28 = 2048;
    v29 = a4;
    _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "HomeKit CBDiscovery startCBDiscoveryScan %@, type %ld", buf, 0x16u);
  }
  p_homeKitCBDiscovery = &self->_homeKitCBDiscovery;
  homeKitCBDiscovery = self->_homeKitCBDiscovery;
  if (homeKitCBDiscovery)
  {
    -[WPHomeKit setStartScanParametersfor:withValues:forType:](self, "setStartScanParametersfor:withValues:forType:", homeKitCBDiscovery, v6, a4);
    -[CBDiscovery dispatchQueue](*p_homeKitCBDiscovery, "dispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_177;
    block[3] = &unk_24C285C78;
    block[4] = self;
    block[5] = a4;
    dispatch_async(v10, block);

    v11 = 0;
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBB250]);
    -[WPClient clientQueue](self, "clientQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = v13;
    else
      v15 = MEMORY[0x24BDAC9B8];
    objc_msgSend(v12, "setDispatchQueue:", v15);
    -[WPHomeKit setStartScanParametersfor:withValues:forType:](self, "setStartScanParametersfor:withValues:forType:", v12, v6, a4);
    v16 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_169;
    v25[3] = &unk_24C285BC8;
    v25[4] = self;
    objc_msgSend(v12, "setDeviceFoundHandler:", v25);
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_2;
    v24[3] = &unk_24C285BC8;
    v24[4] = self;
    objc_msgSend(v12, "setDeviceLostHandler:", v24);
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_3;
    v20[3] = &unk_24C285C30;
    v11 = v12;
    v21 = v11;
    v22 = self;
    v23 = a4;
    objc_msgSend(v11, "activateWithCompletion:", v20);
    objc_storeStrong((id *)&self->_homeKitCBDiscovery, v12);

  }
  -[WPHomeKit scanningStartedOfType:](self, "scanningStartedOfType:", -[WPHomeKit clientTypeFromHomeKitType:](self, "clientTypeFromHomeKitType:", a4));
  v17 = *p_homeKitCBDiscovery;

  return v17;
}

uint64_t __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_169(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceFoundHandler:cached:", a2, 0);
}

uint64_t __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceLostHandler:", a2);
}

void __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_171);
    v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_209E41000, v4, OS_LOG_TYPE_DEFAULT, "### HomeKit CBDiscovery activation failed : %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    objc_msgSend(*(id *)(a1 + 40), "setHomeKitCBDiscovery:", 0);
    v5 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    v11 = CFSTR("HomeKit WHB scan via CBDiscovery failed");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "scanningFailedToStart:ofType:", v7, objc_msgSend(*(id *)(a1 + 40), "clientTypeFromHomeKitType:", *(_QWORD *)(a1 + 48)));
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_175);
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit CBDiscovery activatied: %@", buf, 0xCu);
    }
  }

}

void __42__WPHomeKit_startCBDiscoveryScan_forType___block_invoke_177(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeKitCBDiscovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoveredDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    *(_QWORD *)&v6 = 138412290;
    v13 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "discoveryFlags", v13, (_QWORD)v14);
        if ((objc_msgSend(*(id *)(a1 + 32), "homeKitTypeToCBDiscoveryFlag:", *(_QWORD *)(a1 + 40)) & v11) != 0)
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_179);
          v12 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v13;
            v19 = v10;
            _os_log_debug_impl(&dword_209E41000, v12, OS_LOG_TYPE_DEBUG, "HomeKit CBDiscovery reporting cached device: %@", buf, 0xCu);
          }
          objc_msgSend(*(id *)(a1 + 32), "deviceFoundHandler:cached:", v10, 1);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

}

- (void)stopCBDiscoveryScan:(int64_t)a3
{
  -[WPHomeKit setStopScanParametersforType:](self, "setStopScanParametersforType:");
  -[WPHomeKit scanningStoppedOfType:](self, "scanningStoppedOfType:", -[WPHomeKit clientTypeFromHomeKitType:](self, "clientTypeFromHomeKitType:", a3));
}

- (void)tearDownCBDiscovery
{
  CBDiscovery *homeKitCBDiscovery;
  CBDiscovery *v4;

  homeKitCBDiscovery = self->_homeKitCBDiscovery;
  if (homeKitCBDiscovery)
  {
    -[CBDiscovery invalidate](homeKitCBDiscovery, "invalidate");
    v4 = self->_homeKitCBDiscovery;
    self->_homeKitCBDiscovery = 0;

  }
}

- (unint64_t)homeKitTypeToCBDiscoveryFlag:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0x400000;
  if (a3 != 1)
  {
    v4 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The homeKit type %ld isn't valid. Cannot Convert to CBDiscoveryFlags"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exceptionWithName:reason:userInfo:", CFSTR("UnknownClientType"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(objc_retainAutorelease(v6));
  }
  return 0x1000000;
}

- (BOOL)discoveryFlagsContains:(int64_t)a3
{
  uint64_t v5;

  v5 = -[CBDiscovery discoveryFlags](self->_homeKitCBDiscovery, "discoveryFlags");
  return (-[WPHomeKit homeKitTypeToCBDiscoveryFlag:](self, "homeKitTypeToCBDiscoveryFlag:", a3) & v5) != 0;
}

- (BOOL)isHomeKitScanActive:(unint64_t)a3
{
  return (a3 & 0x1400000) != 0;
}

- (int64_t)homeKitTypeFromCBDiscoveryFlag:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if ((a3 & 0x400000) != 0)
    return 0;
  if ((a3 & 0x1000000) == 0)
  {
    v4 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The CBDiscoveryFlag %llu isn't valid. Cannot Convert to homeKit type"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exceptionWithName:reason:userInfo:", CFSTR("UnknownClientType"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(objc_retainAutorelease(v6));
  }
  return 1;
}

- ($2825F4736939C4A6D3AD43837233062D)homeKitScanTypeToCBDiscoveryScanRates:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v8;

  if (a3)
  {
    if (a3 == 1)
    {
      v5 = _os_feature_enabled_impl();
      v3 = 0x1400000000;
      if (v5)
        v3 = 0x3C00000000;
      v4 = 40;
      if (v5)
        v4 = 60;
    }
    else if (a3 == 2)
    {
      v3 = 0x1400000000;
      v4 = 40;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WPHomeKit.m"), 514, CFSTR("Unknown duty cycle type"));

      v4 = 0;
      v3 = 0x1400000000;
    }
  }
  else
  {
    v3 = 0x1400000000;
    v4 = 30;
  }
  return ($2825F4736939C4A6D3AD43837233062D)(v4 | v3);
}

- (void)setHomeKitCBDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitCBDiscovery, a3);
}

- (id)homeKitCBDiscovery
{
  return self->_homeKitCBDiscovery;
}

- (BOOL)isWHBSupported
{
  return 0;
}

- (void)invalidateWHBScanSession
{
  if (self->_homeKitCBDiscovery)
    -[WPHomeKit tearDownCBDiscovery](self, "tearDownCBDiscovery");
}

- (WPHomeKitDelegate)delegate
{
  return (WPHomeKitDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeKitCBDiscovery, 0);
}

- (void)startScanningWithData:(os_log_t)log forType:.cold.1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = CFSTR("WHB scan is not enabled.");
  _os_log_error_impl(&dword_209E41000, log, OS_LOG_TYPE_ERROR, "HomeKit %@", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)deviceFoundHandler:(uint64_t)a3 cached:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209E41000, a2, a3, "HomeKit CBDiscovery Device found or updated: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deviceLostHandler:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209E41000, a2, a3, "HomeKit CBDiscovery Device lost: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
