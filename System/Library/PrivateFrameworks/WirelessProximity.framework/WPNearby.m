@implementation WPNearby

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[WPNearby delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPNearby delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nearby:didStopScanningForType:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v3));

  }
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
  objc_msgSend(v5, "setClientType:", +[WPNearby clientTypeFromNearbyType:](WPNearby, "clientTypeFromNearbyType:", a3));
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_182);
  v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "Nearby stop scanning: %{public}@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPNearby;
  -[WPClient stopScanning:](&v7, sel_stopScanning_, v5);

}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[WPNearby delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WPNearby delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nearby:didStartScanningForType:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v3));

  }
}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10 useCaseList:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  WPNearby *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  _BOOL4 v44;
  int64x2_t v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  id v53;
  int64x2_t v54;
  objc_super v55;
  int64x2_t v56;
  uint64_t v57;
  uint8_t buf[4];
  id v59;
  uint64_t v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x24BDAC8D0];
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a11;
  if (a7)
  {
    if (a7 == 1)
    {
      v22 = 30;
    }
    else if (a7 == 2)
    {
      v22 = 40;
    }
    else
    {
      v22 = a7;
    }
  }
  else
  {
    v22 = 10;
  }
  v23 = objc_msgSend(v17, "length");
  v24 = objc_msgSend(v18, "length");
  if (v23 <= 22 && v24 < 23)
  {
    v25 = (void *)objc_opt_new();
    v26 = v25;
    if (a3 != 1)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnknownNearbyType"), CFSTR("The nearby type isn't valid"), 0);
        v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_exception_throw(v52);
      }
      v27 = v19;
      switch(v22)
      {
        case 40:
          v28 = 30;
          break;
        case 5:
          v28 = 966;
          break;
        case 30:
          v28 = 40;
          break;
        case 20:
          v28 = 60;
          break;
        default:
          v28 = 300;
          break;
      }
      objc_msgSend(v25, "setClientType:", 15);
      objc_msgSend(v26, "setNearbyScanMode:", v22);
      v47 = -[WPClient isBubbleTestClient](self, "isBubbleTestClient");
      v45 = vdupq_n_s64(0x3C6uLL);
      v45.i64[0] = v28;
      v46 = v27;
      if (v22 == 40 && v47)
      {
        objc_msgSend(v26, "setNearbyScanMode:", 40, *(double *)v45.i64);
        v45 = vdupq_n_s64(0x1EuLL);
      }
LABEL_49:
      v56 = v45;
      v57 = 30;
      objc_msgSend(v26, "setScanningRates:", &v56);
      if (v17)
        objc_msgSend(v26, "setBlobValue:", v17);
      if (v18)
        objc_msgSend(v26, "setMaskValue:", v18);
      if (v46)
        objc_msgSend(v26, "setPeers:", v46);
      v34 = v46;
      if (v20)
        objc_msgSend(v26, "setRssiThreshold:", v20);
      objc_msgSend(v26, "setScanCache:", a10);
      objc_msgSend(v26, "setAllowDuplicates:", a9);
      if (objc_msgSend(v21, "count"))
      {
        v48 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(v21, "allObjects");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "arrayWithArray:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setUseCaseList:", v50);

      }
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_176_0);
      v51 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v59 = v26;
        _os_log_impl(&dword_209E41000, v51, OS_LOG_TYPE_DEFAULT, "Nearby start scanning with data: %{public}@", buf, 0xCu);
      }
      v55.receiver = self;
      v55.super_class = (Class)WPNearby;
      -[WPClient startScanning:](&v55, sel_startScanning_, v26);
      goto LABEL_64;
    }
    v40 = v20;
    v41 = v19;
    if (v22 > 29)
    {
      if (v22 != 40)
      {
        if (v22 == 30)
        {
          v42 = 40;
          goto LABEL_35;
        }
        goto LABEL_32;
      }
      v42 = 30;
    }
    else
    {
      if (v22 != 5)
      {
        if (v22 == 20)
        {
          v42 = 60;
          goto LABEL_35;
        }
LABEL_32:
        v42 = 300;
        goto LABEL_35;
      }
      v42 = 966;
    }
LABEL_35:
    objc_msgSend(v25, "setClientType:", 16);
    objc_msgSend(v26, "setNearbyScanMode:", v22);
    if ((objc_msgSend(v21, "containsObject:", &unk_24C290CC8) & 1) != 0
      || objc_msgSend(v21, "containsObject:", &unk_24C290CE0))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_173);
      v43 = WiProxLog;
      v44 = os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT);
      v45 = vdupq_n_s64(0x3CuLL);
      v45.i64[0] = v42;
      if (v44)
      {
        v54 = v45;
        *(_DWORD *)buf = 138412290;
        v59 = v21;
        _os_log_impl(&dword_209E41000, v43, OS_LOG_TYPE_DEFAULT, "Nearby is asking for NearbyInfo EDT default camera or stream start scan %@", buf, 0xCu);
        v45 = v54;
      }
    }
    else
    {
      v45 = vdupq_n_s64(0x3C6uLL);
      v45.i64[0] = v42;
    }
    v46 = v41;
    v20 = v40;
    goto LABEL_49;
  }
  v53 = v18;
  v29 = v17;
  v30 = v21;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Nearby data (%ld bytes) or mask (%ld bytes) length is larger than the max length (22 bytes) for type: %ld"), v23, v24, a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = self;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_166);
  v33 = v20;
  v34 = v19;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
  v35 = (void *)MEMORY[0x24BDD1540];
  v60 = *MEMORY[0x24BDD0FC8];
  v61[0] = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPNearby delegate](v32, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_opt_respondsToSelector();

  if ((v38 & 1) != 0)
  {
    -[WPNearby delegate](v32, "delegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "nearby:didFailToStartScanningForType:withError:", v32, a3, v26);

  }
  v20 = v33;
  v21 = v30;
  v17 = v29;
  v18 = v53;
LABEL_64:

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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
  uint8_t buf[4];
  int64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _QWORD v46[6];
  _QWORD v47[8];

  v47[6] = *MEMORY[0x24BDAC8D0];
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

  v10 = +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v7);
  if (v5)
  {
    v11 = v10;
    -[WPNearby delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v38 = v9;
      v39 = v11;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceAddress"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceManufacturerData"));
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDevicePaired"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = CFSTR("WPNearbyKeyDeviceAddress");
      v17 = v14;
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "data");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v47[0] = v17;
      v47[1] = v15;
      v37 = (void *)v15;
      v46[1] = CFSTR("WPNearbyKeyManufacturerData");
      v46[2] = CFSTR("WPNearbyKeyPaired");
      v18 = (void *)MEMORY[0x24BDBD1C0];
      if (v16)
        v18 = v16;
      v47[2] = v18;
      v46[3] = CFSTR("WPNearbyKeyRSSI");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceRSSI"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v47[3] = v19;
      v46[4] = CFSTR("kDeviceChannel");
      objc_msgSend(v4, "objectForKeyedSubscript:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v47[4] = v20;
      v46[5] = CFSTR("WPNearbyKeyDeviceTime");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDeviceTime"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v47[5] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_195);
      v23 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        v41 = v39;
        v42 = 2112;
        v43 = v5;
        v44 = 2112;
        v45 = v22;
        _os_log_impl(&dword_209E41000, v23, OS_LOG_TYPE_INFO, "Nearby didDiscoverType %ld UUID %@ info %@", buf, 0x20u);
      }
      -[WPNearby delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v38;
      objc_msgSend(v24, "nearby:didDiscoverType:withData:fromPeer:peerInfo:", self, v39, v38, v5, v22);

    }
    else
    {
      -[WPNearby delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) != 0)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_199);
        v35 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          v41 = v11;
          v42 = 2112;
          v43 = v5;
          _os_log_impl(&dword_209E41000, v35, OS_LOG_TYPE_INFO, "Nearby didDiscoverType %ld UUID %@", buf, 0x16u);
        }
        -[WPNearby delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "nearby:didDiscoverType:withData:fromPeer:", self, v11, v9, v5);

      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_190_0);
    v25 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPNearby deviceDiscovered:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
  }

}

- (WPNearbyDelegate)delegate
{
  return (WPNearbyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (int64_t)nearbyTypeFromClientType:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if (a3 == 16)
    return 1;
  if (a3 != 15)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnknownClientType"), CFSTR("The client type isn't valid"), 0, v3, v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_exception_throw(v6);
  }
  return 0;
}

+ (unsigned)clientTypeFromNearbyType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if (a3 == 1)
    return 16;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("UnknownNearbyType"), CFSTR("The nearby type isn't valid"), 0, v3, v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_exception_throw(v6);
  }
  return 15;
}

- (WPNearby)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  WPNearby *v7;
  WPNearby *v8;
  uint64_t v9;
  NSMutableDictionary *transfers;
  NSArray *leCapablePeers;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v16;
  objc_super v17;
  uint8_t buf[4];
  WPNearby *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WPNearby;
  v7 = -[WPClient initWithQueue:machName:](&v17, sel_initWithQueue_machName_, a4, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_btBandwidthState = -1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    transfers = v8->_transfers;
    v8->_transfers = (NSMutableDictionary *)v9;

    leCapablePeers = v8->_leCapablePeers;
    v8->_leCapablePeers = 0;

    -[WPClient setConnectionUseCase:](v8, "setConnectionUseCase:", 8);
    v16.receiver = v8;
    v16.super_class = (Class)WPNearby;
    -[WPClient listenToBandwidthNotifications](&v16, sel_listenToBandwidthNotifications);
    v8->_nearbySignPostID = os_signpost_id_make_with_pointer((os_log_t)WiProxLog, v8);
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_8);
  v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[WPNearby delegate](v8, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v19 = v8;
    v20 = 2048;
    v21 = v14;
    _os_log_impl(&dword_209E41000, v13, OS_LOG_TYPE_DEFAULT, "Nearby initWithDelegate self: %p, delegate: %p", buf, 0x16u);

  }
  return v8;
}

- (WPNearby)init
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
  return CFSTR("WPNearby");
}

- (void)invalidate
{
  NSObject *v3;
  objc_super v4;
  objc_super v5;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_125_1);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v3, OS_LOG_TYPE_DEFAULT, "Nearby invalidate by client", buf, 2u);
  }
  -[WPNearby setDelegate:](self, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WPNearby;
  -[WPClient unregisterEndpoint:](&v5, sel_unregisterEndpoint_, CFSTR("wp.nearby"));
  v4.receiver = self;
  v4.super_class = (Class)WPNearby;
  -[WPClient invalidate](&v4, sel_invalidate);
}

- (void)populateClientGATT:(id)a3
{
  void (**v3)(id, id, void *);
  void *v4;
  void *v5;
  id v6;

  v3 = (void (**)(id, id, void *))a3;
  v6 = (id)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("AF0BADB1-5B99-43CD-917A-A77BC549E3CC"));
  objc_msgSend(v6, "setUuid:", v4);

  objc_msgSend(v6, "setProperties:", 24);
  objc_msgSend(v6, "setPermissions:", 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("9FA480E0-4967-4542-9390-D343DC5D04AE"));
  v3[2](v3, v6, v5);

}

- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6 options:(id)a7
{
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

  v31[1] = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a7;
  if (v12 && (unint64_t)objc_msgSend(v12, "length") < 0x17)
  {
    +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", +[WPNearby clientTypeFromNearbyType:](WPNearby, "clientTypeFromNearbyType:", a3));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAdvertisingRate:", a6);
    objc_msgSend(v14, "setConnectable:", 1);
    objc_msgSend(v14, "setStopOnAdvertisingAddressChange:", 1);
    objc_msgSend(v14, "setAdvertisingData:", v12);
    if (a3 == 1 && a5 == 1)
    {
      objc_msgSend(v14, "changePriorityValue:", 1);
      objc_msgSend(v14, "setUpdateTime:", 5.0);
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_143_0);
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
      _os_log_impl(&dword_209E41000, v20, OS_LOG_TYPE_DEFAULT, "Nearby start advertising with data: %{public}@ priority %ld mode %ld options %@", buf, 0x2Au);
    }
    v21.receiver = self;
    v21.super_class = (Class)WPNearby;
    -[WPClient startAdvertising:](&v21, sel_startAdvertising_, v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Nearby can't start advertising of type: %ld because bad data: %@ was provided"), a3, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_135);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v15 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    v31[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPNearby delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[WPNearby delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "nearby:didFailToStartAdvertisingOfType:withError:", self, a3, v17);

    }
  }

}

- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6
{
  -[WPNearby startAdvertisingOfType:data:priority:mode:options:](self, "startAdvertisingOfType:data:priority:mode:options:", a3, a4, a5, a6, 0);
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 priority:(int64_t)a5
{
  -[WPNearby startAdvertisingOfType:data:priority:mode:](self, "startAdvertisingOfType:data:priority:mode:", a3, a4, a5, 290);
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4
{
  -[WPNearby startAdvertisingOfType:withData:priority:](self, "startAdvertisingOfType:withData:priority:", a3, a4, 0);
}

- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4
{
  id v5;
  void (**v6)(id, id);
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, id))a4;
  objc_msgSend(v5, "setUpdateTime:", 0.0);
  if (objc_msgSend(v5, "advertisingRate") == 432)
    v7 = 432;
  else
    v7 = 290;
  objc_msgSend(v5, "setAdvertisingRate:", v7);
  if (objc_msgSend(v5, "clientType") == 16)
    objc_msgSend(v5, "changePriorityValue:", 0);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_146);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "Nearby update advertising with data: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  v6[2](v6, v5);

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
  -[WPNearby delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_149);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_INFO, "Nearby advertising pending of type: %d", (uint8_t *)v9, 8u);
    }
    -[WPNearby delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nearby:didDeferAdvertisingType:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v3));

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
  -[WPNearby delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_152_0);
    v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPNearby advertisingStartedOfType:].cold.1(v3, v7);
    -[WPNearby delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nearby:didStartAdvertisingType:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v3));

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
  -[WPNearby delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_153);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPNearby advertisingFailedToStart:ofType:].cold.1(v4, v9, v6);
    -[WPNearby delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nearby:didFailToStartAdvertisingOfType:withError:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4), v6);

  }
}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = +[WPNearby clientTypeFromNearbyType:](WPNearby, "clientTypeFromNearbyType:", a3);
  +[WPAdvertisingRequest requestForClientType:](WPAdvertisingRequest, "requestForClientType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_154);
  v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v4;
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "Nearby stop advertising of type: %d", buf, 8u);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPNearby;
  -[WPClient stopAdvertising:](&v7, sel_stopAdvertising_, v5);

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
    dispatch_once(&WPLogInitOnce, &__block_literal_global_157_0);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218242;
    v17 = v4;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "Nearby advertising stopped of type: %ld with error: %@", (uint8_t *)&v16, 0x16u);
  }
  if (v6)
  {
    if (objc_msgSend(v6, "code") == 28)
    {
      -[WPNearby delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_161_0);
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
          _os_log_impl(&dword_209E41000, v11, OS_LOG_TYPE_DEFAULT, "[Privacy] Nearby advertising stopped of type: %ld with error: %@", (uint8_t *)&v16, 0x16u);

        }
        -[WPNearby delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nearby:didStopAdvertisingType:withError:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4), v6);
        goto LABEL_15;
      }
    }
  }
  else
  {
    -[WPNearby delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[WPNearby delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "nearby:didStopAdvertisingType:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4));
LABEL_15:

    }
  }

}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7
{
  uint64_t v7;

  LOBYTE(v7) = a3 == 1;
  -[WPNearby startScanningForType:data:mask:peers:scanMode:rssi:duplicates:](self, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:", v7);
}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9
{
  uint64_t v9;

  LOWORD(v9) = a9;
  -[WPNearby startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:](self, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:", a3, a4, a5, a6, a7, a8, v9);
}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10
{
  uint64_t v10;

  LOWORD(v10) = __PAIR16__(a10, a9);
  -[WPNearby startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:](self, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:", a3, a4, a5, a6, a7, a8, v10, 0);
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
  -[WPNearby delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_181_0);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPNearby scanningFailedToStart:ofType:].cold.1(v4, v9, v6);
    -[WPNearby delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nearby:didFailToStartScanningForType:withError:", self, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4), v6);

  }
}

- (void)clearDuplicatesForType:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setClientType:", +[WPNearby clientTypeFromNearbyType:](WPNearby, "clientTypeFromNearbyType:", a3));
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_187);
  v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl(&dword_209E41000, v6, OS_LOG_TYPE_DEFAULT, "Nearby clear duplicate filter cache type %ld", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)WPNearby;
  -[WPClient clearDuplicateFilterCache:](&v7, sel_clearDuplicateFilterCache_, v5);

}

- (void)connectToPeer:(id)a3
{
  -[WPNearby connectToPeer:withOptions:](self, "connectToPeer:withOptions:", a3, 0);
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
      dispatch_once(&WPLogInitOnce, &__block_literal_global_202_0);
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPNearby connectToPeer:withOptions:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    v17 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FC8];
    v37[0] = CFSTR("Nearby no peer was provided!");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 6, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPNearby delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
      goto LABEL_21;
    -[WPNearby delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "nearby:didConnectToPeer:transport:error:", self, 0, 0, v19);
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
      dispatch_once(&WPLogInitOnce, &__block_literal_global_209_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v25 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    v35 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 1, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPNearby delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[WPNearby delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "nearby:didConnectToPeer:transport:error:", self, v6, 0, v21);

    }
    goto LABEL_20;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_211);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "Nearby connect to peer  %{public}@ with options %@", buf, 0x16u);
  }
  v29.receiver = self;
  v29.super_class = (Class)WPNearby;
  -[WPClient connectToPeer:withOptions:](&v29, sel_connectToPeer_withOptions_, v6, v7);
LABEL_22:

}

- (void)connectedDevice:(id)a3 withError:(id)a4 shouldDiscover:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v5 = a5;
  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_214_0);
    v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_209E41000, v10, OS_LOG_TYPE_DEFAULT, "Nearby connected to device: %{public}@ over GATT", buf, 0xCu);
    }
    v21 = CFSTR("9FA480E0-4967-4542-9390-D343DC5D04AE");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("AF0BADB1-5B99-43CD-917A-A77BC549E3CC"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16.receiver = self;
    v16.super_class = (Class)WPNearby;
    -[WPClient discoverCharacteristicsAndServices:forPeripheral:](&v16, sel_discoverCharacteristicsAndServices_forPeripheral_, v12, v8);
    goto LABEL_13;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_219);
  v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_209E41000, v13, OS_LOG_TYPE_DEFAULT, "Nearby sending didConnectToPeer %@ with error %{public}@", buf, 0x16u);
  }
  -[WPNearby delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[WPNearby delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nearby:didConnectToPeer:transport:error:", self, v8, 1, v9);
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
    dispatch_once(&WPLogInitOnce, &__block_literal_global_220);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "Nearby sending didConnectToPeer %@ over LEPipe", (uint8_t *)&v9, 0xCu);
  }
  -[WPNearby delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WPNearby delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nearby:didConnectToPeer:transport:error:", self, v4, 2, 0);

  }
}

- (void)discoveredCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;
  objc_super v28;
  uint8_t v29[8];
  _QWORD v30[5];
  objc_super v31;
  _BYTE buf[24];
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("9FA480E0-4967-4542-9390-D343DC5D04AE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_225_0);
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_209E41000, v9, OS_LOG_TYPE_DEFAULT, "Nearby discovered characteristics and services: %{public}@ for peripheral: %{public}@", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v33 = 0;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __63__WPNearby_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_226;
    v30[3] = &unk_24C286AD8;
    v30[4] = buf;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v30);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_228_0);
      v10 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_209E41000, v10, OS_LOG_TYPE_DEFAULT, "Nearby subscribing to characteristic", v29, 2u);
      }
      v28.receiver = self;
      v28.super_class = (Class)WPNearby;
      -[WPClient shouldSubscribe:toPeer:withCharacteristic:inService:](&v28, sel_shouldSubscribe_toPeer_withCharacteristic_inService_, 1, v7, CFSTR("AF0BADB1-5B99-43CD-917A-A77BC549E3CC"), CFSTR("9FA480E0-4967-4542-9390-D343DC5D04AE"));
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_232_0);
      v19 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPNearby discoveredCharacteristicsAndServices:forPeripheral:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
      v27.receiver = self;
      v27.super_class = (Class)WPNearby;
      -[WPClient disconnectFromPeer:](&v27, sel_disconnectFromPeer_, v7);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_221_0);
    v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPNearby discoveredCharacteristicsAndServices:forPeripheral:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    v31.receiver = self;
    v31.super_class = (Class)WPNearby;
    -[WPClient disconnectFromPeer:](&v31, sel_disconnectFromPeer_, v7);
  }

}

uint64_t __63__WPNearby_discoveredCharacteristicsAndServices_forPeripheral___block_invoke_226(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", CFSTR("AF0BADB1-5B99-43CD-917A-A77BC549E3CC"));
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (void)updatedNotificationState:(BOOL)a3 forCharacteristic:(id)a4 inService:(id)a5 withPeripheral:(id)a6
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
      dispatch_once(&WPLogInitOnce, &__block_literal_global_241);
    v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPNearby updatedNotificationState:forCharacteristic:inService:withPeripheral:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
    v25 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    v35 = CFSTR("Nearby notification is disabled");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 22, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPNearby delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_opt_respondsToSelector();

    if ((v26 & 1) == 0)
      goto LABEL_23;
    -[WPNearby delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "nearby:didConnectToPeer:transport:error:", self, v12, 1, v16);
    goto LABEL_22;
  }
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("AF0BADB1-5B99-43CD-917A-A77BC549E3CC"))
    || !objc_msgSend(v11, "isEqualToString:", CFSTR("9FA480E0-4967-4542-9390-D343DC5D04AE")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Nearby service or characteristic is not found, received notification for characteristic: %@, service: %@"), v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_237_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPNearby updatedNotificationState:forCharacteristic:inService:withPeripheral:].cold.1();
    v29 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FC8];
    v37[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v30 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 20, v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPNearby delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v30) = objc_opt_respondsToSelector();

    if ((v30 & 1) != 0)
    {
      -[WPNearby delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "nearby:didConnectToPeer:transport:error:", self, v12, 1, v28);

    }
LABEL_22:

    goto LABEL_23;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_233_0);
  v13 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v13, OS_LOG_TYPE_DEFAULT, "Nearby notification is enabled, send Central didConnect", buf, 2u);
  }
  -[WPNearby delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[WPNearby delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nearby:didConnectToPeer:transport:error:", self, v12, 1, 0);
LABEL_23:

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
  WPNearby *v17;
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
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Nearby no data was provided for peer: %@"), v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_244);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v21 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    v44[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPNearby delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = objc_opt_respondsToSelector();

    if ((v22 & 1) == 0)
      goto LABEL_28;
    -[WPNearby delegate](self, "delegate");
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
        dispatch_once(&WPLogInitOnce, &__block_literal_global_257_0);
      v36 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPNearby sendData:toPeer:].cold.4(v36, (uint64_t)v10, v8);
      v37.receiver = self;
      v37.super_class = (Class)WPNearby;
      -[WPClient sendDataToCharacteristic:inService:forPeer:](&v37, sel_sendDataToCharacteristic_inService_forPeer_, v13, CFSTR("9FA480E0-4967-4542-9390-D343DC5D04AE"), v8);
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Nearby data length is invalid %ld (max: %lu)"), v9, 60000);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_254_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPTest startAdvertisingOfType:data:priority:mode:options:].cold.1();
    v11 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0FC8];
    v40 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPNearby delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
    {
LABEL_28:

      goto LABEL_29;
    }
    -[WPNearby delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = self;
    v18 = v6;
LABEL_16:
    objc_msgSend(v15, "nearby:didSendData:toPeer:error:", v17, v18, v8, v13);

    goto LABEL_28;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_250_0);
  v24 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPNearby sendData:toPeer:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
  v32 = (void *)MEMORY[0x24BDD1540];
  v41 = *MEMORY[0x24BDD0FC8];
  v42 = CFSTR("Nearby no peer was provided");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 8, v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPNearby delegate](self, "delegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = objc_opt_respondsToSelector();

  if ((v33 & 1) != 0)
  {
    -[WPNearby delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nearby:didSendData:toPeer:error:", self, v6, 0, v10);
    goto LABEL_28;
  }
LABEL_29:

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
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("AF0BADB1-5B99-43CD-917A-A77BC549E3CC"))
    && objc_msgSend(v14, "isEqualToString:", CFSTR("9FA480E0-4967-4542-9390-D343DC5D04AE")))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_260_0);
    v17 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v16, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412290;
      v29 = v19;
      _os_log_impl(&dword_209E41000, v18, OS_LOG_TYPE_DEFAULT, "Nearby didSendData over GATT with error %@", (uint8_t *)&v28, 0xCu);

    }
    -[WPNearby delegate](self, "delegate");
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
      -[WPNearby delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "nearby:didSendData:toPeer:error:", self, v12, v15, v16);

    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_262_0);
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
      _os_log_error_impl(&dword_209E41000, v25, OS_LOG_TYPE_ERROR, "Nearby Sent data to a characteristic: %@ or service: %@ to peer: %@ with error: %@ that isn't of type Nearby", (uint8_t *)&v28, 0x2Au);

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
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11
    || (objc_msgSend(v11, "isEqualToString:", CFSTR("nearby")) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", CFSTR("wp.nearby")))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_263_0);
    v14 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v24 = 134217984;
      v25 = objc_msgSend(v10, "length");
      _os_log_impl(&dword_209E41000, v15, OS_LOG_TYPE_DEFAULT, "WPPM: Nearby didSendData over LE pipe: %lu", (uint8_t *)&v24, 0xCu);

    }
    -[WPNearby delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      if ((unint64_t)objc_msgSend(v10, "length") >= 2)
      {
        objc_msgSend(v10, "subdataWithRange:", 2, objc_msgSend(v10, "length") - 2);
        v18 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v18;
      }
      -[WPNearby delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "nearby:didSendData:toPeer:error:", self, v10, v12, v13);

    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_265_0);
    v20 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      objc_msgSend(v12, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412802;
      v25 = (uint64_t)v11;
      v26 = 2112;
      v27 = v22;
      v28 = 2112;
      v29 = v23;
      _os_log_error_impl(&dword_209E41000, v21, OS_LOG_TYPE_ERROR, "Nearby Sent data to a endpoint: %@ to peer: %@ with error: %@ that isn't of type Nearby", (uint8_t *)&v24, 0x20u);

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
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  v13 = a6;
  if (!(v11 | v12)
    || objc_msgSend((id)v11, "isEqualToString:", CFSTR("AF0BADB1-5B99-43CD-917A-A77BC549E3CC"))
    && objc_msgSend((id)v12, "isEqualToString:", CFSTR("9FA480E0-4967-4542-9390-D343DC5D04AE")))
  {
    -[WPNearby transfers](self, "transfers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = -[WPDataTransfer initDataTransferForPeer:]([WPDataTransfer alloc], "initDataTransferForPeer:", v13);
      -[WPNearby transfers](self, "transfers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v13);

      -[WPNearby transfers](self, "transfers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_267_0);
    v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPNearby receivedData:forCharacteristic:inService:forPeripheral:].cold.1((uint64_t)v10, v19);
    if (objc_msgSend(v15, "addNewData:", v10))
    {
      kdebug_trace();
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_269);
      v20 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        objc_msgSend(v15, "currentReceivedData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 134217984;
        v29 = objc_msgSend(v22, "length");
        _os_log_impl(&dword_209E41000, v21, OS_LOG_TYPE_DEFAULT, "WPPM: Nearby didReceiveData data of length %ld", (uint8_t *)&v28, 0xCu);

      }
      -[WPNearby delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();

      if ((v24 & 1) != 0)
      {
        -[WPNearby delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentReceivedData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "copy");
        objc_msgSend(v25, "nearby:didReceiveData:fromPeer:", self, v27, v13);

      }
      objc_msgSend(v15, "resetTransfer");
    }

  }
}

- (void)receivedData:(id)a3 fromEndpoint:(id)a4 forPeripheral:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t nearbySignPostID;
  uint8_t v14[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (id)WiProxLog;
  v12 = v11;
  nearbySignPostID = self->_nearbySignPostID;
  if (nearbySignPostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_209E41000, v12, OS_SIGNPOST_EVENT, nearbySignPostID, "WPNearby receivedData:fromEndpoint:forPeripheral", (const char *)&unk_209E7912D, v14, 2u);
  }

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("wp.nearby")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("nearby")))
  {
    -[WPNearby receivedData:forCharacteristic:inService:forPeripheral:](self, "receivedData:forCharacteristic:inService:forPeripheral:", v8, 0, 0, v10);
  }

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
        dispatch_once(&WPLogInitOnce, &__block_literal_global_274);
      v13 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        v19 = v10;
        _os_log_impl(&dword_209E41000, v13, OS_LOG_TYPE_DEFAULT, "Nearby central connected to our device %{public}@, send Peripheral didConnect", (uint8_t *)&v18, 0xCu);
      }
      -[WPNearby delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[WPNearby delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "nearby:didConnectToPeer:transport:error:", self, v10, 1, 0);

      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_276);
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
      dispatch_once(&WPLogInitOnce, &__block_literal_global_272);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPNearby central:subscribed:toCharacteristic:inService:].cold.1();
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
      dispatch_once(&WPLogInitOnce, &__block_literal_global_283);
    v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "Nearby disconnect from peer: %{public}@", buf, 0xCu);
    }
    v19.receiver = self;
    v19.super_class = (Class)WPNearby;
    -[WPClient disconnectFromPeer:](&v19, sel_disconnectFromPeer_, v4);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_279);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPNearby disconnectFromPeer:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    v14 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = CFSTR("Nearby peer is null");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPNearby delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[WPNearby delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "nearby:didDisconnectFromPeer:error:", self, 0, v16);

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
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Nearby peer: %@ is disconnected with error: %@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_286);
    v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_209E41000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - send didDisconnect", buf, 0xCu);
    }

  }
  -[WPNearby transfers](self, "transfers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "resetTransfer");
  -[WPNearby delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_288);
    v17 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_209E41000, v17, OS_LOG_TYPE_DEFAULT, "Nearby sending didDisconnectFromPeer %@ with error %@", buf, 0x16u);
    }
    -[WPNearby delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nearby:didDisconnectFromPeer:error:", self, v6, v7);

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
    dispatch_once(&WPLogInitOnce, &__block_literal_global_289_0);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_209E41000, v8, OS_LOG_TYPE_DEFAULT, "Nearby disconnected %@ over LE pipe with error %@", (uint8_t *)&v9, 0x16u);
  }
  -[WPNearby disconnectedDevice:withError:](self, "disconnectedDevice:withError:", v6, v7);

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
  v13[0] = CFSTR("Nearby peer traking is unsupported");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 17, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPNearby delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WPNearby delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nearby:didStartTrackingPeer:type:error:", self, v6, a4, v9);

  }
}

- (void)startedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[WPNearby delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WPNearby delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nearby:didStartTrackingPeer:type:error:", self, v9, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4), 0);

  }
}

- (void)failedToStartTrackingPeer:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  int64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_294);
  v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPNearby failedToStartTrackingPeer:error:].cold.1((uint64_t)v6, v8, v7);
  -[WPNearby delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", objc_msgSend(v6, "clientType"));
    objc_msgSend(v6, "peerUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPNearby delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nearby:didStartTrackingPeer:type:error:", self, v12, v11, v7);

  }
}

- (void)stopTrackingPeer:(id)a3 forType:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WPNearby delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WPNearby delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nearby:didStopTrackingPeer:type:", self, v9, a4);

  }
}

- (void)stoppedTrackingPeer:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[WPNearby delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WPNearby delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nearby:didStopTrackingPeer:type:", self, v9, +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4));

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
  -[WPNearby delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4);
    -[WPNearby delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nearby:didFindPeer:type:", self, v10, v8);

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
  -[WPNearby delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = +[WPNearby nearbyTypeFromClientType:](WPNearby, "nearbyTypeFromClientType:", v4);
    -[WPNearby delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nearby:didLosePeer:type:", self, v10, v8);

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
  v5 = -[WPNearby btBandwidthState](self, "btBandwidthState");
  -[WPNearby setBtBandwidthState:](self, "setBtBandwidthState:", v4);
  if (-[WPNearby btBandwidthState](self, "btBandwidthState") != v5)
  {
    -[WPNearby delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[WPNearby delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nearbyDidChangeBluetoothBandwidthState:", self);

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
  v14.super_class = (Class)WPNearby;
  -[WPClient stateDidChange:](&v14, sel_stateDidChange_, a3);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_305);
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
    _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "Nearby stateDidChange: %ld, old %ld, pipe state %ld", buf, 0x20u);

  }
  if (-[WPClient state](self, "state") != v5)
  {
    if (-[WPClient state](self, "state") == 3)
    {
      v13.receiver = self;
      v13.super_class = (Class)WPNearby;
      -[WPClient registerEndpoint:requireAck:requireEncryption:](&v13, sel_registerEndpoint_requireAck_requireEncryption_, CFSTR("wp.nearby"), 1, 0);
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)WPNearby;
      -[WPClient unregisterEndpoint:](&v12, sel_unregisterEndpoint_, CFSTR("wp.nearby"));
    }
    -[WPNearby delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[WPNearby delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nearbyDidUpdateState:", self);

    }
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

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)transfers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTransfers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)leCapablePeers
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLeCapablePeers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leCapablePeers, 0);
  objc_storeStrong((id *)&self->_transfers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)advertisingStartedOfType:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_209E41000, a2, OS_LOG_TYPE_DEBUG, "Nearby advertising started of type: %d", (uint8_t *)v2, 8u);
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
  OUTLINED_FUNCTION_3(&dword_209E41000, v6, v7, "Nearby advertising failed to start of type: %d with error: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_1();
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
  OUTLINED_FUNCTION_3(&dword_209E41000, v6, v7, "Nearby failed to start scanning of type: %d with error: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_1();
}

- (void)deviceDiscovered:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_209E41000, a1, a3, "Nearby Advert UUID not available", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)connectToPeer:(uint64_t)a3 withOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "%@ - send didConnect", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)discoveredCharacteristicsAndServices:(uint64_t)a3 forPeripheral:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_209E41000, a1, a3, "Nearby can't find the nearby service. Disconnecting", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)discoveredCharacteristicsAndServices:(uint64_t)a3 forPeripheral:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_209E41000, a1, a3, "Nearby characteristic wasn't found, disconnecting", a5, a6, a7, a8, 0);
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
  OUTLINED_FUNCTION_0_3(&dword_209E41000, v0, v1, "Nearby send Central didConnect with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updatedNotificationState:(uint64_t)a3 forCharacteristic:(uint64_t)a4 inService:(uint64_t)a5 withPeripheral:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "Nearby send Central didConnect with error: %@", a5, a6, a7, a8, 2u);
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
  OUTLINED_FUNCTION_4(&dword_209E41000, v6, v7, "Nearby send data size %lu: %@ peer: %@", v8, v9, v10, v11, 2u);

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
  OUTLINED_FUNCTION_4(&dword_209E41000, v4, v5, "Nearby received data %@ of length %ld from peer %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)central:subscribed:toCharacteristic:inService:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_11_0(&dword_209E41000, v1, (uint64_t)v1, "Nearby received subscription notification of characteristic: %@, service: %@ is not of type Nearby", v2);
  OUTLINED_FUNCTION_1();
}

- (void)disconnectFromPeer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_209E41000, a1, a3, "%@ - sending didDisconnect", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)failedToStartTrackingPeer:(void *)a3 error:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_11_0(&dword_209E41000, v5, v7, "Nearby failed to start tracking peer: %@ with error: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_0_1();
}

@end
