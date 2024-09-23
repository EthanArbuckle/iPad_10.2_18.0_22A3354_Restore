@implementation WPDConnection

- (WPDConnection)init
{
  WPDConnection *v2;
  WPDConnection *v3;
  WPCharacteristic *characteristicToSend;
  CBPeripheral *peripheral;
  uint64_t v6;
  NSDictionary *charsAndServicesToDiscover;
  uint64_t v8;
  NSMutableSet *subscribedCharacteristics;
  CBCentral *central;
  CBCharacteristic *centralCharacteristic;
  CBService *centralService;
  WPDConnection *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WPDConnection;
  v2 = -[WPDConnection init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dataLeftToSend = 0;
    characteristicToSend = v2->_characteristicToSend;
    v2->_characteristicToSend = 0;

    v3->_didConnectSent = 0;
    peripheral = v3->_peripheral;
    v3->_recentRole = 3;
    v3->_peripheral = 0;

    -[CBPeripheral setDelegate:](v3->_peripheral, "setDelegate:", v3);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    charsAndServicesToDiscover = v3->_charsAndServicesToDiscover;
    v3->_charsAndServicesToDiscover = (NSDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    subscribedCharacteristics = v3->_subscribedCharacteristics;
    v3->_subscribedCharacteristics = (NSMutableSet *)v8;

    central = v3->_central;
    v3->_central = 0;

    centralCharacteristic = v3->_centralCharacteristic;
    v3->_centralCharacteristic = 0;

    centralService = v3->_centralService;
    v3->_centralService = 0;

    v13 = v3;
  }

  return v3;
}

- (WPDConnection)initWithPeripheral:(id)a3
{
  id v4;
  WPDConnection *v5;
  WPDConnection *v6;

  v4 = a3;
  v5 = -[WPDConnection init](self, "init");
  v6 = v5;
  if (v5)
    -[WPDConnection updateWithPeripheral:](v5, "updateWithPeripheral:", v4);

  return v6;
}

- (WPDConnection)initWithCentral:(id)a3 characteristic:(id)a4
{
  id v6;
  id v7;
  WPDConnection *v8;
  WPDConnection *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[WPDConnection init](self, "init");
  v9 = v8;
  if (v8)
    -[WPDConnection updateWithCentral:characteristic:](v8, "updateWithCentral:characteristic:", v6, v7);

  return v9;
}

- (void)updateWithPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WPDConnection setRecentRole:](self, "setRecentRole:", 1);
  -[WPDConnection setPeripheral:](self, "setPeripheral:", v4);

  -[WPDConnection peripheral](self, "peripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDConnection setCharsAndServicesToDiscover:](self, "setCharsAndServicesToDiscover:", v6);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WPDConnection setSubscribedCharacteristics:](self, "setSubscribedCharacteristics:", v7);

}

- (void)updateWithCentral:(id)a3 characteristic:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WPDConnection setRecentRole:](self, "setRecentRole:", 0);
  -[WPDConnection setCentral:](self, "setCentral:", v7);

  -[WPDConnection setCentralCharacteristic:](self, "setCentralCharacteristic:", v6);
  objc_msgSend(v6, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[WPDConnection setCentralService:](self, "setCentralService:", v8);
}

- (id)getPeripheral
{
  void *v3;
  void *v4;

  -[WPDConnection peripheral](self, "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WPDConnection peripheral](self, "peripheral");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)getCentral
{
  void *v3;
  void *v4;

  -[WPDConnection central](self, "central");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WPDConnection central](self, "central");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)holdVoucher
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)voucher_copy();
  -[WPDConnection setVoucher:](self, "setVoucher:", v3);

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_13);
  v4 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[WPDConnection voucher](self, "voucher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDConnection getPeripheralUUID](self, "getPeripheralUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEFAULT, "Holding voucher %{public}@ for connection to peer %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_77);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "WPDConnection deallocating", buf, 2u);
  }
  -[WPDConnection peripheral](self, "peripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WPDConnection peripheral](self, "peripheral");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_79);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "WPDConnection set peripheral delegate to nil", buf, 2u);
    }
  }
  -[WPDConnection voucher](self, "voucher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_81);
    v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[WPDConnection getPeripheralUUID](self, "getPeripheralUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "Removing voucher for connection to peer %{public}@", buf, 0xCu);

    }
    -[WPDConnection setVoucher:](self, "setVoucher:", 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)WPDConnection;
  -[WPDConnection dealloc](&v11, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WPDConnection peripheral](self, "peripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDConnection central](self, "central");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("WPDConnection - Peripheral UUID: %@, Central UUID: %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int64_t)connectionType
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  -[WPDConnection peripheral](self, "peripheral");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[WPDConnection central](self, "central");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return 2;
  }
  -[WPDConnection peripheral](self, "peripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 1;
  -[WPDConnection central](self, "central");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_exception_throw(objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("No connection type"), CFSTR("No peripheral or central connection type"), 0)));
  return 0;
}

- (void)discoverCharacteristicsAndServices:(id)a3 forPeripheral:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WPDConnection peripheral](self, "peripheral");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v6, "allKeys", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

    -[WPDConnection setCharsAndServicesToDiscover:](self, "setCharsAndServicesToDiscover:", v6);
    -[WPDConnection peripheral](self, "peripheral");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "discoverServices:", v11);

    goto LABEL_14;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_92_0);
  v19 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    v11 = v19;
    objc_msgSend(v7, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDConnection peripheral](self, "peripheral");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v20;
    v31 = 2112;
    v32 = v23;
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_INFO, "Being asked to discover characteristics and services on a peripheral %@ that isn't this one %@", buf, 0x16u);

LABEL_14:
  }

}

- (id)getPeripheralUUID
{
  void *v3;
  void *v4;
  void *v5;

  -[WPDConnection peripheral](self, "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[WPDConnection peripheral](self, "peripheral");
  else
    -[WPDConnection central](self, "central");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  __CFString *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  __CFString *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "services");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || !objc_msgSend(v8, "count"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_95);
    v10 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      v23 = v10;
      objc_msgSend(v7, "localizedDescription");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v24;
      v33 = 2112;
      v34 = v8;
      v35 = 2112;
      v36 = v9;
      _os_log_error_impl(&dword_2175D1000, v23, OS_LOG_TYPE_ERROR, "Error %@ retrieving services %@ on peripheral %@. Disconnecting...", buf, 0x20u);

    }
    objc_msgSend(v7, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "localizedDescription");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CFSTR("No services were found");
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Couldn't discover services on peripheral %@ with error %@"), v9, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPDConnection client](self, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "connectedDevice:withError:shouldDiscover:", v9, v21, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_102;
    v27[3] = &unk_24D7C69B8;
    v12 = v13;
    v28 = v12;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v27);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_106_0);
    v15 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v6, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      v33 = 2114;
      v34 = v17;
      _os_log_impl(&dword_2175D1000, v16, OS_LOG_TYPE_DEFAULT, "Discovered services %{public}@ on peripheral %{public}@", buf, 0x16u);

    }
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_107;
    v25[3] = &unk_24D7C6A20;
    v25[4] = self;
    v26 = v6;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v25);

    v18 = v28;
  }

}

void __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_102(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@, "), v3);

}

void __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_107(uint64_t a1, void *a2)
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
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "charsAndServicesToDiscover");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v7, "allObjects", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_109_1);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_107_cold_1();
    objc_msgSend(*(id *)(a1 + 40), "discoverCharacteristics:forService:", v8, v3);

  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_110);
  v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDConnection peripheral:didDiscoverCharacteristicsForService:error:].cold.1(v11, v9);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "characteristics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __71__WPDConnection_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_111;
  v32 = &unk_24D7C6A68;
  v14 = v12;
  v33 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v29);

  objc_msgSend(v8, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v9;
  if (v10 || !objc_msgSend(v14, "count"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_113_0);
    v16 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      v26 = v16;
      objc_msgSend(v10, "localizedDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v39 = v27;
      v40 = 2112;
      v41 = v14;
      v42 = 2112;
      v43 = v15;
      _os_log_error_impl(&dword_2175D1000, v26, OS_LOG_TYPE_ERROR, "Error %@ retrieving characteristics %@ on peripheral %@. Disconnecting...", buf, 0x20u);

    }
    objc_msgSend(v10, "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    if (v17)
    {
      objc_msgSend(v10, "localizedDescription");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = CFSTR("No characteristics were found");
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Couldn't discover characteristics on peripheral %@ with error %@"), v15, v19, v28, v29, v30, v31, v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FC8];
    v37 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 20, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPDConnection client](self, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "connectedDevice:withError:shouldDiscover:", v15, v21, 0);
  }
  else
  {
    -[WPDConnection client](self, "client");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v21;
    v35 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    objc_msgSend(v8, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString discoveredCharacteristicsAndServices:forPeripheral:](v19, "discoveredCharacteristicsAndServices:forPeripheral:", v22, v23);

  }
}

void __71__WPDConnection_peripheral_didDiscoverCharacteristicsForService_error___block_invoke_111(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *log;
  WPDConnection *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Couldn't update notification state for characteristic %@ on peripheral %@ with error %@"), v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FC8];
    v39[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 22, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_120_1);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDConnection peripheral:didUpdateNotificationStateForCharacteristic:error:].cold.1();
    -[WPDConnection client](self, "client");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "connectedDevice:withError:shouldDiscover:", v21, v19, 0);
  }
  else
  {
    objc_msgSend(v9, "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "service");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_122_1);
    v25 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      log = v25;
      v26 = objc_msgSend(v9, "isNotifying");
      objc_msgSend(v9, "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "service");
      v31 = self;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v33 = v26;
      v34 = 2114;
      v35 = v27;
      v36 = 2114;
      v37 = v29;
      _os_log_impl(&dword_2175D1000, log, OS_LOG_TYPE_DEFAULT, "Changed notification state %d for characteristic %{public}@ in service %{public}@", buf, 0x1Cu);

      self = v31;
    }
    -[WPDConnection client](self, "client");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updatedNotificationState:forCharacteristic:inService:withPeripheral:", objc_msgSend(v9, "isNotifying"), v16, v19, v20);
  }

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_123_1);
    v11 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDConnection peripheral:didUpdateValueForCharacteristic:error:].cold.2(v11, v10, v8);
    objc_msgSend(v8, "setNotifyValue:forCharacteristic:", 0, v9);
    -[WPDConnection client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "disconnectFromPeer:", v13);
  }
  else
  {
    objc_msgSend(v9, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "service");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_125_2);
    v18 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDConnection peripheral:didUpdateValueForCharacteristic:error:].cold.1(v18, v9, v8);
    -[WPDConnection client](self, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "receivedData:fromCharacteristic:inService:forPeripheral:", v20, v12, v13, v17);

  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_126_1);
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v7;
    _os_log_impl(&dword_2175D1000, v8, OS_LOG_TYPE_DEFAULT, "Services have been modified. %@ have been invalidated", (uint8_t *)&v21, 0xCu);
  }
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDConnection peripheral](self, "peripheral");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if ((v12 & 1) != 0)
  {
    if (v7 && objc_msgSend(v7, "count"))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_132_1);
      v13 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        -[WPDConnection charsAndServicesToDiscover](self, "charsAndServicesToDiscover");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v15;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_2175D1000, v14, OS_LOG_TYPE_DEFAULT, "Re-discovering services and characteristics %@ on peripheral %@", (uint8_t *)&v21, 0x16u);

      }
      -[WPDConnection charsAndServicesToDiscover](self, "charsAndServicesToDiscover");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDConnection peripheral](self, "peripheral");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDConnection discoverCharacteristicsAndServices:forPeripheral:](self, "discoverCharacteristicsAndServices:forPeripheral:", v18, v20);

    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_130_2);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPDConnection peripheral:didModifyServices:].cold.1();
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_128_2);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDConnection peripheral:didModifyServices:].cold.2();
  }

}

- (id)subscribe:(BOOL)a3 toPeer:(id)a4 withCharacteristic:(id)a5 inService:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v24;
  __CFString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v8 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[WPDConnection getCharacteristicWithUUID:inService:forPeripheral:](self, "getCharacteristicWithUUID:inService:forPeripheral:", v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("Unsubscribing");
  if (v8)
    v14 = CFSTR("Subscribing");
  v15 = v14;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_137_1);
  v16 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    objc_msgSend(v10, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544130;
    v25 = v15;
    v26 = 2114;
    v27 = v11;
    v28 = 2114;
    v29 = v12;
    v30 = 2114;
    v31 = v18;
    _os_log_impl(&dword_2175D1000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ to characteristic %{public}@ in service %{public}@ to peer %{public}@", (uint8_t *)&v24, 0x2Au);

  }
  -[WPDConnection peripheral](self, "peripheral");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNotifyValue:forCharacteristic:", v8, v13);

  -[WPDConnection subscribedCharacteristics](self, "subscribedCharacteristics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v8)
  {
    objc_msgSend(v20, "addObject:", v11);
LABEL_11:

    goto LABEL_12;
  }
  v22 = objc_msgSend(v20, "containsObject:", v11);

  if (v22)
  {
    -[WPDConnection subscribedCharacteristics](self, "subscribedCharacteristics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObject:", v11);
    goto LABEL_11;
  }
LABEL_12:

  return 0;
}

- (id)sendDataToCharacteristic:(id)a3 inService:(id)a4 forPeer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WPDConnection characteristicToSend](self, "characteristicToSend");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sending in progress, wait for didSend callback to send next chunk of data"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1540];
    v47 = *MEMORY[0x24BDD0FC8];
    v48[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 21, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  -[WPDConnection peripheral](self, "peripheral");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDConnection central](self, "central");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_140_3);
  v16 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v42 = v10;
    v43 = 2112;
    v44 = v12;
    v45 = 2112;
    v46 = v14;
    _os_log_debug_impl(&dword_2175D1000, v16, OS_LOG_TYPE_DEBUG, "Sending data to %@. Current peripheral: %@, current central: %@", buf, 0x20u);
  }
  objc_msgSend(v12, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqual:", v10))
  {

  }
  else
  {
    objc_msgSend(v14, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", v10);

    if ((v19 & 1) == 0)
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v12, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("CoreBluetooth couldn't find the peripheral %@ or central %@ to send data with requested peer %@"), v23, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BDD0FC8];
      v40 = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 6, v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_144_1);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDClient disconnectedPeer:error:].cold.1();

      goto LABEL_34;
    }
  }
  objc_msgSend(v8, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDConnection setDataLeftToSend:](self, "setDataLeftToSend:", objc_msgSend(v20, "length"));

  -[WPDConnection setCharacteristicToSend:](self, "setCharacteristicToSend:", v8);
  -[WPDConnection setCharacteristicService:](self, "setCharacteristicService:", v9);
  if (v14)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_146_1);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDConnection sendDataToCharacteristic:inService:forPeer:].cold.3();
    -[WPDConnection sendDataToCentral](self, "sendDataToCentral");
LABEL_16:
    v15 = 0;
    goto LABEL_34;
  }
  if (v12)
  {
    objc_msgSend(v12, "services");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_148_2);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPDConnection sendDataToCharacteristic:inService:forPeer:].cold.2();
      -[WPDConnection sendDataToPeripheral](self, "sendDataToPeripheral");
      goto LABEL_16;
    }
  }
  -[WPDConnection setCharacteristicToSend:](self, "setCharacteristicToSend:", 0);
  v30 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "UUIDString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("No peripheral or central to send data with requested peer %@"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x24BDD1540];
  v37 = *MEMORY[0x24BDD0FC8];
  v38 = v32;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 6, v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_152_2);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDClient disconnectedPeer:error:].cold.1();

LABEL_34:
  return v15;
}

- (int64_t)fetchConnectionType
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  -[WPDConnection peripheral](self, "peripheral");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[WPDConnection central](self, "central");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return 2;
  }
  -[WPDConnection peripheral](self, "peripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 1;
  -[WPDConnection central](self, "central");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    return 0;
  else
    return 3;
}

- (void)sendDataToCentral
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_3(&dword_2175D1000, a3, (uint64_t)a3, "Sent packet okay", a1);
}

- (void)sendDataToPeripheral
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_2175D1000, v0, v1, "iOS MTU: %lu", v2);
  OUTLINED_FUNCTION_0();
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *log;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDConnection characteristicToSend](self, "characteristicToSend");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_176_1);
    v19 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    {
      log = v19;
      objc_msgSend(v9, "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedDescription");
      *(_DWORD *)buf = 138412802;
      v31 = v27;
      v32 = 2112;
      v33 = v26;
      v34 = 2112;
      v35 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v35;
      _os_log_error_impl(&dword_2175D1000, log, OS_LOG_TYPE_ERROR, "Failed writing to characteristic %@ of peer %@ with error: %@. Forcing disconnection", buf, 0x20u);

    }
    -[WPDConnection client](self, "client");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sentData:forCharacteristic:inService:forPeripheral:withError:", v17, v12, v15, v18, v10);

    objc_msgSend(v8, "setNotifyValue:forCharacteristic:", 0, v9);
    -[WPDConnection client](self, "client");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "disconnectFromPeer:", v22);

  }
  else if (-[WPDConnection dataLeftToSend](self, "dataLeftToSend"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_178_1);
    v23 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDConnection peripheral:didWriteValueForCharacteristic:error:].cold.2(v23);
    -[WPDConnection sendDataToPeripheral](self, "sendDataToPeripheral");
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_180_1);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDConnection peripheral:didWriteValueForCharacteristic:error:].cold.1();
    -[WPDConnection client](self, "client");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sentData:forCharacteristic:inService:forPeripheral:withError:", v17, v12, v15, v18, 0);

    -[WPDConnection resetData](self, "resetData");
  }

}

- (id)getCharacteristicWithUUID:(id)a3 inService:(id)a4 forPeripheral:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  _BYTE *v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WPDConnection peripheral](self, "peripheral");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WPDConnection peripheral](self, "peripheral");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "services");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    v34 = 0;
    v14 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __67__WPDConnection_getCharacteristicWithUUID_inService_forPeripheral___block_invoke_182;
    v26[3] = &unk_24D7C6E30;
    v15 = v9;
    v27 = v15;
    v28 = &v29;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);
    v16 = (void *)v30[5];
    if (v16)
    {
      objc_msgSend(v16, "characteristics");
      v17 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v36 = __Block_byref_object_copy__3;
      v37 = __Block_byref_object_dispose__3;
      v38 = 0;
      v23[0] = v14;
      v23[1] = 3221225472;
      v23[2] = __67__WPDConnection_getCharacteristicWithUUID_inService_forPeripheral___block_invoke_184;
      v23[3] = &unk_24D7C6E78;
      v24 = v8;
      v25 = buf;
      -[NSObject enumerateObjectsUsingBlock:](v17, "enumerateObjectsUsingBlock:", v23);
      v18 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v18)
      {
        v19 = v18;
      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_186_1);
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDConnection getCharacteristicWithUUID:inService:forPeripheral:].cold.2();
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_183_1);
      v17 = (id)WiProxLog;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[WPDConnection peripheral](self, "peripheral");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2112;
        v36 = (uint64_t (*)(uint64_t, uint64_t))v13;
        _os_log_error_impl(&dword_2175D1000, v17, OS_LOG_TYPE_ERROR, "Wireless Proximity can't retrieve the service %@ for peripheral %@. Services found = %@", buf, 0x20u);

      }
      v18 = 0;
    }

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_181_1);
    v20 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDConnection getCharacteristicWithUUID:inService:forPeripheral:].cold.1((uint64_t)v10, v20, self);
    v18 = 0;
  }

  return v18;
}

void __67__WPDConnection_getCharacteristicWithUUID_inService_forPeripheral___block_invoke_182(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __67__WPDConnection_getCharacteristicWithUUID_inService_forPeripheral___block_invoke_184(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)readyForDataTransfer
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[WPDConnection characteristicToSend](self, "characteristicToSend");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[WPDConnection central](self, "central");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[WPDConnection sendDataToCentral](self, "sendDataToCentral");
  }
}

- (void)resetData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "Resetting data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (WPDClient)client
{
  return (WPDClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (NSMutableSet)subscribedCharacteristics
{
  return self->_subscribedCharacteristics;
}

- (void)setSubscribedCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedCharacteristics, a3);
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

- (BOOL)didConnectSent
{
  return self->_didConnectSent;
}

- (void)setDidConnectSent:(BOOL)a3
{
  self->_didConnectSent = a3;
}

- (int64_t)recentRole
{
  return self->_recentRole;
}

- (void)setRecentRole:(int64_t)a3
{
  self->_recentRole = a3;
}

- (CBPeripheral)peripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPeripheral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CBCentral)central
{
  return (CBCentral *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCentral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)charsAndServicesToDiscover
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCharsAndServicesToDiscover:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (WPCharacteristic)characteristicToSend
{
  return (WPCharacteristic *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCharacteristicToSend:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)characteristicService
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCharacteristicService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unint64_t)dataLeftToSend
{
  return self->_dataLeftToSend;
}

- (void)setDataLeftToSend:(unint64_t)a3
{
  self->_dataLeftToSend = a3;
}

- (CBCharacteristic)centralCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCentralCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CBService)centralService
{
  return (CBService *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCentralService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CBPeripheralManager)sendDataManager
{
  return (CBPeripheralManager *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSendDataManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)connectablePacket
{
  return self->_connectablePacket;
}

- (void)setConnectablePacket:(BOOL)a3
{
  self->_connectablePacket = a3;
}

- (OS_voucher)voucher
{
  return (OS_voucher *)objc_getProperty(self, a2, 120, 1);
}

- (void)setVoucher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_sendDataManager, 0);
  objc_storeStrong((id *)&self->_centralService, 0);
  objc_storeStrong((id *)&self->_centralCharacteristic, 0);
  objc_storeStrong((id *)&self->_characteristicService, 0);
  objc_storeStrong((id *)&self->_characteristicToSend, 0);
  objc_storeStrong((id *)&self->_charsAndServicesToDiscover, 0);
  objc_storeStrong((id *)&self->_central, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_subscribedCharacteristics, 0);
  objc_destroyWeak((id *)&self->_client);
}

void __48__WPDConnection_peripheral_didDiscoverServices___block_invoke_107_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_2175D1000, v0, v1, "Discovering characteristics %@", v2);
  OUTLINED_FUNCTION_0();
}

- (void)peripheral:(void *)a1 didDiscoverCharacteristicsForService:(void *)a2 error:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  v3 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "UUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a2;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v3, v5, "Discovered characteristics for service %@ on peripheral for %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)peripheral:didUpdateNotificationStateForCharacteristic:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "%@. Disconnecting...", v2);
  OUTLINED_FUNCTION_0();
}

- (void)peripheral:(void *)a1 didUpdateValueForCharacteristic:(void *)a2 error:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[24];

  v5 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7_0(&dword_2175D1000, v5, v9, "Received Value Update for characteristic %{public}@ for peripheral %@. Notifying daemon client.", v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)peripheral:(void *)a1 didUpdateValueForCharacteristic:(void *)a2 error:(void *)a3 .cold.2(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v5 = OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_11_1(&dword_2175D1000, v9, v10, "Error updating characteristic value %@ on peripheral %@, disconnecting", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_1_1();
}

- (void)peripheral:didModifyServices:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "No services to rediscover, ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)peripheral:didModifyServices:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "Not our peripheral, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendDataToCharacteristic:inService:forPeer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "Sending data to peripheral", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendDataToCharacteristic:inService:forPeer:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "Sending data to central", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)peripheral:didWriteValueForCharacteristic:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2175D1000, v0, v1, "Sent all the data succesfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)peripheral:(void *)a1 didWriteValueForCharacteristic:error:.cold.2(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "dataLeftToSend");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_2175D1000, v1, v2, "Still have %ld bytes to send", v3);

  OUTLINED_FUNCTION_8();
}

- (void)getCharacteristicWithUUID:(uint64_t)a1 inService:(void *)a2 forPeripheral:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
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

  v4 = a2;
  objc_msgSend(a3, "peripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_11_1(&dword_2175D1000, v6, v7, "Wireless Proximity can't retrieve the peripheral %@. Connected peripheral: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

- (void)getCharacteristicWithUUID:inService:forPeripheral:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "Wireless Proximity can't retrieve the characteristic %@", v2);
  OUTLINED_FUNCTION_0();
}

@end
