@implementation WPContinuity

- (WPContinuity)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  WPContinuity *v8;
  WPContinuity *v9;
  WPContinuity *v10;
  uint64_t v11;
  NSMutableDictionary *transfers;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_super v17;
  objc_super v18;
  uint8_t buf[4];
  WPContinuity *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (+[WPClient isHomePod](WPClient, "isHomePod"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_98_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPContinuity initWithDelegate:queue:].cold.1();
    v8 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WPContinuity;
    v9 = -[WPClient initWithQueue:machName:](&v18, sel_initWithQueue_machName_, v7, 0);
    v10 = v9;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_delegate, v6);
      v10->_btBandwidthState = -1;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v11 = objc_claimAutoreleasedReturnValue();
      transfers = v10->_transfers;
      v10->_transfers = (NSMutableDictionary *)v11;

      -[WPClient setConnectionUseCase:](v10, "setConnectionUseCase:", 6);
      v17.receiver = v10;
      v17.super_class = (Class)WPContinuity;
      -[WPClient listenToBandwidthNotifications](&v17, sel_listenToBandwidthNotifications);
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_7);
    v13 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      -[WPContinuity delegate](v10, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v20 = v10;
      v21 = 2048;
      v22 = v15;
      _os_log_impl(&dword_209E41000, v14, OS_LOG_TYPE_DEFAULT, "Continuity initWithDelegate self: %p, delegate: %p", buf, 0x16u);

    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (WPContinuity)init
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
  return CFSTR("WPContinuity");
}

- (void)invalidate
{
  NSObject *v3;
  objc_super v4;
  objc_super v5;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_104_0);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "Continuity invalidate by client", buf, 2u);
  }
  -[WPContinuity setDelegate:](self, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WPContinuity;
  -[WPClient unregisterEndpoint:](&v5, sel_unregisterEndpoint_, CFSTR("wp.continuity"));
  v4.receiver = self;
  v4.super_class = (Class)WPContinuity;
  -[WPClient invalidate](&v4, sel_invalidate);
}

+ (unsigned)clientTypeFromContinuityType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnknownContinuityType"), CFSTR("The continuity type isn't valid"), 0, v3, v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_exception_throw(v6);
  }
  return a3 + 12;
}

+ (int64_t)continuityTypeFromClientType:(unsigned __int8)a3
{
  void *v4;
  void *v5;
  void *v6;

  if ((a3 - 12) >= 3)
  {
    v4 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The client type %ld isn't valid"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exceptionWithName:reason:userInfo:", CFSTR("UnknownClientType"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(objc_retainAutorelease(v6));
  }
  return (a3 - 12);
}

- (void)populateClientGATT:(id)a3
{
  void (**v3)(id, id, void *);
  void *v4;
  void *v5;
  id v6;

  v3 = (void (**)(id, id, void *))a3;
  v6 = (id)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("8667556C-9A37-4C91-84ED-54EE27D90049"));
  objc_msgSend(v6, "setUuid:", v4);

  objc_msgSend(v6, "setProperties:", 264);
  objc_msgSend(v6, "setPermissions:", 8);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("D0611E78-BBB4-4591-A5F8-487910AE4366"));
  v3[2](v3, v6, v5);

}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length") && (unint64_t)objc_msgSend(v7, "length") < 0x17)
  {
    +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", +[WPContinuity clientTypeFromContinuityType:](WPContinuity, "clientTypeFromContinuityType:", a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdvertisingRate:", 48);
    objc_msgSend(v11, "setConnectable:", 1);
    objc_msgSend(v11, "setStopOnAdvertisingAddressChange:", 1);
    objc_msgSend(v11, "setAdvertisingData:", v7);
    objc_msgSend(v11, "setUpdateTime:", 2.0);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_128);
    v14 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_impl(&dword_209E41000, v14, OS_LOG_TYPE_DEFAULT, "Continuity start advertising with data: %{public}@", buf, 0xCu);
    }
    v15.receiver = self;
    v15.super_class = (Class)WPContinuity;
    -[WPClient startAdvertising:](&v15, sel_startAdvertising_, v11);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bad data was provided: %@"), v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPContinuity delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[WPContinuity delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "continuity:didFailToStartAdvertisingOfType:withError:", self, a3, v11);

    }
  }

}

- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4
{
  id v5;
  void (**v6)(id, id);
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, id))a4;
  objc_msgSend(v5, "setUpdateTime:", 0.0);
  objc_msgSend(v5, "setAdvertisingRate:", 290);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_131_1);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "Continuity update advertising with data: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v6[2](v6, v5);

}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = +[WPContinuity clientTypeFromContinuityType:](WPContinuity, "clientTypeFromContinuityType:", a3);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_132);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v4;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "Continuity stop advertising of type: %d", buf, 8u);
  }
  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)WPContinuity;
  -[WPClient stopAdvertising:](&v7, sel_stopAdvertising_, v6);

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
  -[WPContinuity delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_137_0);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_INFO, "Continuity advertising pending of type: %d", (uint8_t *)v9, 8u);
    }
    -[WPContinuity delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "continuityPendingAdvertisingOfType:advertisingType:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v3));

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
  -[WPContinuity delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_138_0);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPContinuity advertisingFailedToStart:ofType:].cold.1(v4, v9, v6);
    -[WPContinuity delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "continuity:didFailToStartAdvertisingOfType:withError:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4), v6);

  }
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_139);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218242;
    v17 = v4;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "Continuity advertising stopped of type: %ld with error: %@", (uint8_t *)&v16, 0x16u);
  }
  if (v6)
  {
    if (objc_msgSend(v6, "code") == 28)
    {
      -[WPContinuity delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_143);
        v10 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          objc_msgSend(v6, "localizedDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 134218242;
          v17 = v4;
          v18 = 2112;
          v19 = v12;
          _os_log_impl(&dword_209E41000, v11, OS_LOG_TYPE_DEFAULT, "[Privacy] Continuity advertising stopped of type: %ld with error: %@", (uint8_t *)&v16, 0x16u);

        }
        -[WPContinuity delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "continuityDidStopAdvertisingOfType:advertisingType:withError:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4), v6);
        goto LABEL_15;
      }
    }
  }
  else
  {
    -[WPContinuity delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[WPContinuity delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "continuityDidStopAdvertisingOfType:advertisingType:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4));
LABEL_15:

    }
  }

}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;

  v3 = a3;
  -[WPContinuity delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_148);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPContinuity advertisingStartedOfType:].cold.1(v3, v7);
    -[WPContinuity delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "continuityDidStartAdvertisingOfType:advertisingType:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v3));

  }
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4
{
  -[WPContinuity startScanningForType:withData:mask:peers:](self, "startScanningForType:withData:mask:peers:", a3, a4, 0, 0);
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 peers:(id)a5
{
  -[WPContinuity startScanningForType:withData:mask:peers:](self, "startScanningForType:withData:mask:peers:", a3, a4, 0, a5);
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6
{
  -[WPContinuity startScanningForType:withData:mask:peers:boostedScan:](self, "startScanningForType:withData:mask:peers:boostedScan:", a3, a4, a5, a6, 1);
}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  WPContinuity *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _BOOL8 v19;
  uint64_t v20;
  id v21;

  v7 = a7;
  v21 = a4;
  v12 = a5;
  v13 = a6;
  switch(a3)
  {
    case 2:
      v14 = self;
      v15 = 2;
LABEL_7:
      v16 = v21;
      v17 = v12;
      v18 = v13;
      v19 = v7;
      v20 = 0;
      goto LABEL_8;
    case 1:
      v14 = self;
      v15 = 1;
      goto LABEL_7;
    case 0:
      v14 = self;
      v15 = 0;
      v16 = v21;
      v17 = v12;
      v18 = v13;
      v19 = v7;
      v20 = 1;
LABEL_8:
      -[WPContinuity startScanningForType:withData:mask:peers:boostedScan:duplicates:](v14, "startScanningForType:withData:mask:peers:boostedScan:duplicates:", v15, v16, v17, v18, v19, v20);
      break;
  }

}

- (void)startScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[3];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v8 = a8;
  v36[1] = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = objc_msgSend(v14, "length");
  v18 = objc_msgSend(v15, "length");
  if (v17 > 22 || v18 >= 23)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Continuity data (%ld bytes) or mask (%ld bytes) length is larger than the max length (22 bytes) for type: %ld"), v17, v18, a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    v36[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPContinuity delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[WPContinuity delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "continuity:didFailToStartScanningForType:WithError:", self, a3, v26);

    }
  }
  else
  {
    v19 = (void *)objc_opt_new();
    v20 = v19;
    switch(a3)
    {
      case 2:
        v21 = 14;
        if (a7)
          goto LABEL_7;
LABEL_13:
        v22 = 0xFFFFLL;
        goto LABEL_14;
      case 1:
        v21 = 13;
        v22 = 966;
LABEL_14:
        v23 = 300;
        goto LABEL_15;
      case 0:
        v21 = 12;
        if (a7)
        {
LABEL_7:
          objc_msgSend(v19, "setUpdateTime:", 4.0);
          v22 = 0xFFFFLL;
          v23 = 60;
LABEL_15:
          objc_msgSend(v20, "setClientType:", v21);
          objc_msgSend(v20, "setAllowDuplicates:", v8);
          v32[0] = v23;
          v32[1] = v22;
          v32[2] = 30;
          objc_msgSend(v20, "setScanningRates:", v32);
          if (v14)
            objc_msgSend(v20, "setBlobValue:", v14);
          if (v15)
            objc_msgSend(v20, "setMaskValue:", v15);
          if (v16)
            objc_msgSend(v20, "setPeers:", v16);
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_158_1);
          v29 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v20;
            _os_log_impl(&dword_209E41000, v29, OS_LOG_TYPE_DEFAULT, "Continuity start scanning with data: %{public}@", buf, 0xCu);
          }
          v31.receiver = self;
          v31.super_class = (Class)WPContinuity;
          -[WPClient startScanning:](&v31, sel_startScanning_, v20);
          goto LABEL_31;
        }
        goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown continuity client type %ld"), a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_156);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();

  }
LABEL_31:

}

- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4
{
  id v5;
  void (**v6)(id, id);
  NSObject *v7;
  __int128 v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, id))a4;
  objc_msgSend(v5, "setUpdateTime:", 0.0);
  v8 = xmmword_209E73C10;
  v9 = 30;
  objc_msgSend(v5, "setScanningRates:", &v8);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_161);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "Continuity update scanning request with data: %{public}@", buf, 0xCu);
  }
  v6[2](v6, v5);

}

- (void)stopScanningForType:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setClientType:", +[WPContinuity clientTypeFromContinuityType:](WPContinuity, "clientTypeFromContinuityType:", a3));
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_162);
  v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "Continuity stop scanning: %{public}@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPContinuity;
  -[WPClient stopScanning:](&v7, sel_stopScanning_, v5);

}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[WPContinuity delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPContinuity delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "continuityDidStartScanningForType:scanningType:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v3));

  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[WPContinuity delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPContinuity delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "continuityDidStopScanningForType:scanningType:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v3));

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
  -[WPContinuity delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_169);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPContinuity scanningFailedToStart:ofType:].cold.1(v4, v9, v6);
    -[WPContinuity delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "continuity:didFailToStartScanningForType:WithError:", self, +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4), v6);

  }
}

- (void)startTrackingPeer:(id)a3 forType:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD1540];
  v12 = *MEMORY[0x24BDD0FC8];
  v13[0] = CFSTR("Continuity peer traking is unsupported");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 17, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPContinuity delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WPContinuity delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "continuityDidStartTrackingPeer:peer:type:error:", self, v6, a4, v9);

  }
}

- (void)startedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[WPContinuity delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4);
    -[WPContinuity delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "continuityDidStartTrackingPeer:peer:type:error:", self, v10, v8, 0);

  }
}

- (void)failedToStartTrackingPeer:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WPContinuity delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", objc_msgSend(v6, "clientType"));
    objc_msgSend(v6, "peerUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_174);
    v12 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      v14 = v12;
      objc_msgSend(v11, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v6, "clientType");
      objc_msgSend(v7, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v15;
      v20 = 1024;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_error_impl(&dword_209E41000, v14, OS_LOG_TYPE_ERROR, "Continuity failed to start tracking peer: %@ of type: %d with error: %@", (uint8_t *)&v18, 0x1Cu);

    }
    -[WPContinuity delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "continuityDidStartTrackingPeer:peer:type:error:", self, v11, v10, v7);

  }
}

- (void)stopTrackingPeer:(id)a3 forType:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WPContinuity delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WPContinuity delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "continuityDidStopTrackingPeer:peer:type:", self, v9, a4);

  }
}

- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[WPContinuity delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4);
    -[WPContinuity delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "continuityDidStopTrackingPeer:peer:type:", self, v10, v8);

  }
}

- (void)foundPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[WPContinuity delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4);
    -[WPContinuity delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "continuity:didFindPeer:type:", self, v10, v8);

  }
}

- (void)lostPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[WPContinuity delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v4);
    -[WPContinuity delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "continuity:didLosePeer:type:", self, v10, v8);

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
  int64_t v10;
  int64_t v11;
  void *v12;
  char v13;
  void *v14;

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

  v10 = +[WPContinuity continuityTypeFromClientType:](WPContinuity, "continuityTypeFromClientType:", v7);
  if (v5)
  {
    v11 = v10;
    -[WPContinuity delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[WPContinuity delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "continuity:didDiscoverType:withData:fromPeer:", self, v11, v9, v5);

    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_181);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPContinuity deviceDiscovered:].cold.1();
  }

}

- (void)connectToPeer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_186);
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPContinuity connectToPeer:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    v16 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0FC8];
    v34[0] = CFSTR("Continuity no peer was provided!");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 5, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPContinuity delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0)
      goto LABEL_21;
    -[WPContinuity delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "continuity:didConnectToPeer:error:", self, 0, v18);
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  if (-[WPClient state](self, "state") != 3)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[WPClient stateAsString:](WPClient, "stateAsString:", -[WPClient state](self, "state"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Can't connect to peer %@ when state is %@"), v22, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_192);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v24 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    v32 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 1, v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPContinuity delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[WPContinuity delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "continuity:didConnectToPeer:error:", self, v4, v20);

    }
    goto LABEL_20;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_194_0);
  v5 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v7;
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "Continuity connect to peer: %{public}@", buf, 0xCu);

  }
  v28.receiver = self;
  v28.super_class = (Class)WPContinuity;
  -[WPClient connectToPeer:](&v28, sel_connectToPeer_, v4);
LABEL_22:

}

- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  char v17;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v5 = a5;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_197);
    v10 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v8, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_209E41000, v11, OS_LOG_TYPE_DEFAULT, "Continuity connected to device: %{public}@", buf, 0xCu);

    }
    v23 = CFSTR("D0611E78-BBB4-4591-A5F8-487910AE4366");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("8667556C-9A37-4C91-84ED-54EE27D90049"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v18.receiver = self;
    v18.super_class = (Class)WPContinuity;
    -[WPClient discoverCharacteristicsAndServices:forPeripheral:](&v18, sel_discoverCharacteristicsAndServices_forPeripheral_, v14, v8);
    goto LABEL_13;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_202);
  v15 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_209E41000, v15, OS_LOG_TYPE_DEFAULT, "Continuity sending didConnectToPeer %@ with error %{public}@", buf, 0x16u);
  }
  -[WPContinuity delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[WPContinuity delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "continuity:didConnectToPeer:error:", self, v8, v9);
LABEL_13:

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
    dispatch_once(&WPLogInitOnce, &__block_literal_global_203);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "Continuity sending didConnectToPeer %@ over LEPipe", (uint8_t *)&v9, 0xCu);
  }
  -[WPContinuity delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WPContinuity delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "continuity:didConnectToPeer:error:", self, v4, 0);

  }
}

- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  objc_super v13;
  objc_super v14;
  uint8_t v15[8];
  _QWORD v16[5];
  objc_super v17;
  _BYTE buf[24];
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("D0611E78-BBB4-4591-A5F8-487910AE4366"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_208);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v7, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_209E41000, v10, OS_LOG_TYPE_DEFAULT, "Continuity discovered characteristics and services: %{public}@ for peripheral: %{public}@", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v19 = 0;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__WPContinuity_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_209;
    v16[3] = &unk_24C286AD8;
    v16[4] = buf;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_213);
      v12 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_209E41000, v12, OS_LOG_TYPE_DEFAULT, "Continuity subscribing to characteristic", v15, 2u);
      }
      v14.receiver = self;
      v14.super_class = (Class)WPContinuity;
      -[WPClient shouldSubscribe:toPeer:withCharacteristic:inService:](&v14, sel_shouldSubscribe_toPeer_withCharacteristic_inService_, 1, v7, CFSTR("8667556C-9A37-4C91-84ED-54EE27D90049"), CFSTR("D0611E78-BBB4-4591-A5F8-487910AE4366"));
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_217);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPContinuity discoveredCharacteristicsAndServices:forPeripheral:].cold.2();
      v13.receiver = self;
      v13.super_class = (Class)WPContinuity;
      -[WPClient disconnectFromPeer:](&v13, sel_disconnectFromPeer_, v7);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_204_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPContinuity discoveredCharacteristicsAndServices:forPeripheral:].cold.1();
    v17.receiver = self;
    v17.super_class = (Class)WPContinuity;
    -[WPClient disconnectFromPeer:](&v17, sel_disconnectFromPeer_, v7);
  }

}

void __67__WPContinuity_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_209(uint64_t a1, void *a2, _BYTE *a3)
{
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(a2, "isEqualToString:", CFSTR("8667556C-9A37-4C91-84ED-54EE27D90049")))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_210);
    v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_INFO, "Continuity found our characteristic", v6, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint8_t buf[8];
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];

  v8 = a3;
  v37[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v8)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_226);
    v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPContinuity updatedNotificationState:forCharacteristic:inService:withPeripheral:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
    v25 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    v35 = CFSTR("Continuity notification is disabled");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 22, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPContinuity delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if ((v26 & 1) == 0)
      goto LABEL_23;
    -[WPContinuity delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "continuity:didConnectToPeer:error:", self, v12, v16);
    goto LABEL_22;
  }
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("8667556C-9A37-4C91-84ED-54EE27D90049"))
    || !objc_msgSend(v11, "isEqualToString:", CFSTR("D0611E78-BBB4-4591-A5F8-487910AE4366")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Continuity service or characteristic is not found, received notification for characteristic: %@, service: %@"), v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_222);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPContinuity updatedNotificationState:forCharacteristic:inService:withPeripheral:].cold.1();
    v29 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FC8];
    v37[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v30 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 20, v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPContinuity delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v30) = objc_opt_respondsToSelector();

    if ((v30 & 1) != 0)
    {
      -[WPContinuity delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "continuity:didConnectToPeer:error:", self, v12, v28);

    }
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  -[WPContinuity delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_218_0);
    v15 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E41000, v15, OS_LOG_TYPE_DEFAULT, "Continuity notification is enabled, send Central didConnect", buf, 2u);
    }
    -[WPContinuity delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "continuity:didConnectToPeer:error:", self, v12, 0);
    goto LABEL_23;
  }
LABEL_24:

}

- (void)disconnectFromPeer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_233);
    v5 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      objc_msgSend(v4, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "Continuity disconnect from peer: %{public}@", buf, 0xCu);

    }
    v21.receiver = self;
    v21.super_class = (Class)WPContinuity;
    -[WPClient disconnectFromPeer:](&v21, sel_disconnectFromPeer_, v4);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_229);
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPContinuity disconnectFromPeer:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    v16 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FC8];
    v25[0] = CFSTR("Continuity peer is null");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPContinuity delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[WPContinuity delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "continuity:didDisconnectFromPeer:error:", self, 0, v18);

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
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Continuity peer: %@ is disconnected with error: %@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_236);
    v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_209E41000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - send didDisconnect", buf, 0xCu);
    }

  }
  -[WPContinuity transfers](self, "transfers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "resetTransfer");
  -[WPContinuity delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_238);
    v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_209E41000, v17, OS_LOG_TYPE_DEFAULT, "Continuity sending didDisconnectFromPeer %@ with error %@", buf, 0x16u);
    }
    -[WPContinuity delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "continuity:didDisconnectFromPeer:error:", self, v6, v7);

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
    dispatch_once(&WPLogInitOnce, &__block_literal_global_239_0);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "Continuity disconnected %@ over LE pipe with error %@", (uint8_t *)&v9, 0x16u);
  }
  -[WPContinuity disconnectedDevice:withError:](self, "disconnectedDevice:withError:", v6, v7);

}

- (void)sendData:(id)a3 toPeer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WPContinuity *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  objc_super v46;
  __int16 v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Continuity no data was provided for peer: %@"), v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_242);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v25 = (void *)MEMORY[0x24BDD1540];
    v58 = *MEMORY[0x24BDD0FC8];
    v59[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPContinuity delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if ((v26 & 1) == 0)
      goto LABEL_32;
    -[WPContinuity delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = self;
    v22 = 0;
    goto LABEL_20;
  }
  if (v7)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_250);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = objc_msgSend(v6, "length");
      objc_msgSend(v8, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v51 = v11;
      v52 = 2112;
      v53 = v6;
      v54 = 2112;
      v55 = v12;
      _os_log_impl(&dword_209E41000, v10, OS_LOG_TYPE_DEFAULT, "Continuity send data: (%lu) %@ to peer: %@", buf, 0x20u);

    }
    v13 = objc_msgSend(v6, "length");
    if ((unint64_t)(v13 - 60001) > 0xFFFFFFFFFFFF159FLL)
    {
      v47 = v13;
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v47, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendData:", v6);
      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "setData:", v14);
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("8667556C-9A37-4C91-84ED-54EE27D90049"));
      objc_msgSend(v17, "setUuid:", v39);

      objc_msgSend(v17, "setWriteType:", 0);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_257);
      v40 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v40;
        objc_msgSend(v17, "data");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "length");
        objc_msgSend(v17, "data");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v51 = v43;
        v52 = 2112;
        v53 = v44;
        v54 = 2112;
        v55 = v45;
        _os_log_impl(&dword_209E41000, v41, OS_LOG_TYPE_DEFAULT, "Continuity send data to characteristic: (%lu) %@ to peer: %@", buf, 0x20u);

      }
      v46.receiver = self;
      v46.super_class = (Class)WPContinuity;
      -[WPClient sendDataToCharacteristic:inService:forPeer:](&v46, sel_sendDataToCharacteristic_inService_forPeer_, v17, CFSTR("D0611E78-BBB4-4591-A5F8-487910AE4366"), v8);
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Continuity data length is invalid %ld (max: %lu)"), v13, 60000);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_254);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v15 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0FC8];
    v49 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPContinuity delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0)
    {
LABEL_32:

      goto LABEL_33;
    }
    -[WPContinuity delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = self;
    v22 = v6;
LABEL_20:
    objc_msgSend(v19, "continuity:didSendData:toPeer:error:", v21, v22, v8, v17);

    goto LABEL_32;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_248);
  v28 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPContinuity sendData:toPeer:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);
  v36 = (void *)MEMORY[0x24BDD1540];
  v56 = *MEMORY[0x24BDD0FC8];
  v57 = CFSTR("Continuity no peer was provided");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
  v37 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v37);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPContinuity delegate](self, "delegate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v37) = objc_opt_respondsToSelector();

  if ((v37 & 1) != 0)
  {
    -[WPContinuity delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "continuity:didSendData:toPeer:error:", self, v6, 0, v14);
    goto LABEL_32;
  }
LABEL_33:

}

- (void)sentData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6 withError:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("8667556C-9A37-4C91-84ED-54EE27D90049"))
    && objc_msgSend(v14, "isEqualToString:", CFSTR("D0611E78-BBB4-4591-A5F8-487910AE4366")))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_260);
    v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v16, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412290;
      v29 = v19;
      _os_log_impl(&dword_209E41000, v18, OS_LOG_TYPE_DEFAULT, "Continuity didSendData over GATT with error %@", (uint8_t *)&v28, 0xCu);

    }
    -[WPContinuity delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      if ((unint64_t)objc_msgSend(v12, "length") >= 2)
      {
        objc_msgSend(v12, "subdataWithRange:", 2, objc_msgSend(v12, "length") - 2);
        v22 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v22;
      }
      -[WPContinuity delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "continuity:didSendData:toPeer:error:", self, v12, v15, v16);

    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_262);
    v24 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      v25 = v24;
      objc_msgSend(v15, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138413058;
      v29 = v13;
      v30 = 2112;
      v31 = v14;
      v32 = 2112;
      v33 = v26;
      v34 = 2112;
      v35 = v27;
      _os_log_error_impl(&dword_209E41000, v25, OS_LOG_TYPE_ERROR, "Continuity sent data to a characteristic: %@ or service: %@ to peer: %@ with error: %@ that isn't of type Continuity", (uint8_t *)&v28, 0x2Au);

    }
  }

}

- (void)sentData:(id)a3 toEndpoint:(id)a4 forPeripheral:(id)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11 || objc_msgSend(v11, "isEqualToString:", CFSTR("wp.continuity")))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_263);
    v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = objc_msgSend(v10, "length");
      objc_msgSend(v13, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 134218242;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_209E41000, v15, OS_LOG_TYPE_DEFAULT, "WPPM: Continuity didSendData %lu over LE pipe with error %@", (uint8_t *)&v22, 0x16u);

    }
    -[WPContinuity delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      if ((unint64_t)objc_msgSend(v10, "length") >= 2)
      {
        objc_msgSend(v10, "subdataWithRange:", 2, objc_msgSend(v10, "length") - 2);
        v20 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v20;
      }
      -[WPContinuity delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "continuity:didSendData:toPeer:error:", self, v10, v12, v13);

    }
  }

}

- (void)receivedData:(id)a3 forCharacteristic:(id)a4 inService:(id)a5 forPeripheral:(id)a6
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  v13 = a6;
  if (!(v11 | v12)
    || objc_msgSend((id)v11, "isEqualToString:", CFSTR("8667556C-9A37-4C91-84ED-54EE27D90049"))
    && objc_msgSend((id)v12, "isEqualToString:", CFSTR("D0611E78-BBB4-4591-A5F8-487910AE4366")))
  {
    -[WPContinuity transfers](self, "transfers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = -[WPDataTransfer initDataTransferForPeer:]([WPDataTransfer alloc], "initDataTransferForPeer:", v13);
      -[WPContinuity transfers](self, "transfers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v13);

      -[WPContinuity transfers](self, "transfers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_265);
    v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      v21 = objc_msgSend(v10, "length");
      objc_msgSend(v13, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 134218498;
      v33 = v21;
      v34 = 2112;
      v35 = v10;
      v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_209E41000, v20, OS_LOG_TYPE_DEFAULT, "Continuity received data (%ld) %@ from peer %@", (uint8_t *)&v32, 0x20u);

    }
    if (objc_msgSend(v15, "addNewData:", v10))
    {
      kdebug_trace();
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_267);
      v23 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        objc_msgSend(v15, "currentReceivedData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");
        v32 = 134217984;
        v33 = v26;
        _os_log_impl(&dword_209E41000, v24, OS_LOG_TYPE_DEFAULT, "WPPM: Continuity didReceiveData data of length %ld", (uint8_t *)&v32, 0xCu);

      }
      -[WPContinuity delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) != 0)
      {
        -[WPContinuity delegate](self, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentReceivedData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(v29, "continuity:didReceiveData:fromPeer:", self, v31, v13);

      }
      objc_msgSend(v15, "resetTransfer");
    }

  }
}

- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("wp.continuity")))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_270);
    v10 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = 134217984;
      v13 = objc_msgSend(v8, "length");
      _os_log_impl(&dword_209E41000, v11, OS_LOG_TYPE_DEFAULT, "Continuity received data over LE pipe %ld", (uint8_t *)&v12, 0xCu);

    }
    -[WPContinuity receivedData:forCharacteristic:inService:forPeripheral:](self, "receivedData:forCharacteristic:inService:forPeripheral:", v8, 0, 0, v9);
  }

}

- (void)central:(id)a3 subscribed:(BOOL)a4 toCharacteristic:(id)a5 inService:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  int v21;
  id v22;
  uint64_t v23;

  v8 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("8667556C-9A37-4C91-84ED-54EE27D90049"))
    && (objc_msgSend(v12, "isEqualToString:", CFSTR("D0611E78-BBB4-4591-A5F8-487910AE4366")) & 1) != 0)
  {
    if (v8)
    {
      -[WPContinuity delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        -[WPContinuity delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "continuity:didConnectToPeer:error:", self, v10, 0);

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_273);
        v16 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138543362;
          v22 = v10;
          v17 = "Continuity central connected to our device %{public}@, send Peripheral didConnect";
          v18 = v16;
          v19 = 12;
LABEL_18:
          _os_log_impl(&dword_209E41000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, v19);
        }
      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_275);
      v20 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        v17 = "Saw unsubscribe...disconnection pending";
        v18 = v20;
        v19 = 2;
        goto LABEL_18;
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_271);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPContinuity central:subscribed:toCharacteristic:inService:].cold.1();
  }

}

- (void)bandwidthStateUpdated:(id)a3
{
  _BOOL8 v4;
  int64_t v5;
  void *v6;
  char v7;
  id v8;

  v4 = objc_msgSend(a3, "integerValue") < 2;
  v5 = -[WPContinuity btBandwidthState](self, "btBandwidthState");
  -[WPContinuity setBtBandwidthState:](self, "setBtBandwidthState:", v4);
  if (-[WPContinuity btBandwidthState](self, "btBandwidthState") != v5)
  {
    -[WPContinuity delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[WPContinuity delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "continuityDidChangeBluetoothBandwidthState:", self);

    }
  }
}

- (void)stateDidChange:(int64_t)a3
{
  int64_t v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;
  uint8_t buf[4];
  int64_t v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = -[WPClient state](self, "state");
  v14.receiver = self;
  v14.super_class = (Class)WPContinuity;
  -[WPClient stateDidChange:](&v14, sel_stateDidChange_, a3);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_280);
  v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = -[WPClient state](self, "state");
    *(_DWORD *)buf = 134218496;
    v16 = a3;
    v17 = 2048;
    v18 = v5;
    v19 = 2048;
    v20 = v8;
    _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "Continuity stateDidChange: %ld, old %ld, pipe state %ld", buf, 0x20u);

  }
  if (-[WPClient state](self, "state") != v5)
  {
    if (-[WPClient state](self, "state") == 3)
    {
      v13.receiver = self;
      v13.super_class = (Class)WPContinuity;
      -[WPClient registerEndpoint:requireAck:requireEncryption:](&v13, sel_registerEndpoint_requireAck_requireEncryption_, CFSTR("wp.continuity"), 1, 1);
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)WPContinuity;
      -[WPClient unregisterEndpoint:](&v12, sel_unregisterEndpoint_, CFSTR("wp.continuity"));
    }
    -[WPContinuity delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[WPContinuity delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "continuityDidUpdateState:", self);

    }
  }
}

- (void)peerTrackingFull
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WPContinuity;
  -[WPClient peerTrackingFull](&v8, sel_peerTrackingFull);
  -[WPContinuity delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WPContinuity delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "continuity:peerTrackingAvailable:", self, 0);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_289);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_INFO, "Continuity peer tracking is full", v7, 2u);
    }
  }
}

- (void)peerTrackingAvailable
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WPContinuity;
  -[WPClient peerTrackingAvailable](&v6, sel_peerTrackingAvailable);
  -[WPContinuity delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WPContinuity delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "continuity:peerTrackingAvailable:", self, 1);

  }
}

- (int64_t)btBandwidthState
{
  return self->_btBandwidthState;
}

- (void)setBtBandwidthState:(int64_t)a3
{
  self->_btBandwidthState = a3;
}

- (WPContinuityDelegate)delegate
{
  return (WPContinuityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)transfers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTransfers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transfers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:queue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_2(&dword_209E41000, v0, v1, "Continuity is not supported on this product", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_3(&dword_209E41000, v6, v7, "Continuity advertising failed to start of type: %d with error: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_1();
}

- (void)advertisingStartedOfType:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_209E41000, a2, OS_LOG_TYPE_DEBUG, "Continuity advertising started of type: %d", (uint8_t *)v2, 8u);
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
  OUTLINED_FUNCTION_3(&dword_209E41000, v6, v7, "Continuity failed to start scanning of type: %d with error: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_1();
}

- (void)deviceDiscovered:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_2(&dword_209E41000, v0, v1, "Continuity Advert UUID not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)connectToPeer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "%@ - send didConnect", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)discoveredCharacteristicsAndServices:forPeripheral:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_2(&dword_209E41000, v0, v1, "Continuity can't find the continuity service. Disconnecting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)discoveredCharacteristicsAndServices:forPeripheral:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_2(&dword_209E41000, v0, v1, "Continuity characteristic wasn't found, disconnecting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)updatedNotificationState:forCharacteristic:inService:withPeripheral:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_209E41000, v0, v1, "Continuity send Central didConnect with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updatedNotificationState:(uint64_t)a3 forCharacteristic:(uint64_t)a4 inService:(uint64_t)a5 withPeripheral:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "Continuity send Central didConnect with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)disconnectFromPeer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "%@ - sending didDisconnect", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendData:(uint64_t)a3 toPeer:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
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
  _os_log_error_impl(&dword_209E41000, v1, OS_LOG_TYPE_ERROR, "Continuity received subscription notification of characteristic: %@, service: %@ is not of type Continuity", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
