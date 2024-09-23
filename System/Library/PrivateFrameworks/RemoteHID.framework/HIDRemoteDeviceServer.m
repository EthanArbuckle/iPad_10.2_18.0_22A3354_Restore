@implementation HIDRemoteDeviceServer

- (HIDRemoteDeviceServer)initWithQueue:(id)a3
{
  id v5;
  HIDRemoteDeviceServer *v6;
  HIDRemoteDeviceServer *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *endpoints;
  dispatch_queue_t v10;
  OS_dispatch_queue *asyncQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HIDRemoteDeviceServer;
  v6 = -[HIDRemoteDeviceServer init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    endpoints = v7->_endpoints;
    v7->_endpoints = v8;

    v10 = dispatch_queue_create("com.apple.hid.RemoteHID", 0);
    asyncQueue = v7->_asyncQueue;
    v7->_asyncQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[4];
  id v12;

  v3 = (void *)objc_opt_new();
  -[HIDRemoteDeviceServer endpoints](self, "endpoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __36__HIDRemoteDeviceServer_description__block_invoke;
  v11[3] = &unk_24DB1F190;
  v12 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);

  v6 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)HIDRemoteDeviceServer;
  -[HIDRemoteDeviceServer description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<HIDRemoteDeviceServer state:%@ %@>"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __36__HIDRemoteDeviceServer_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copyState");
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (BOOL)connectEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HIDRemoteDeviceServer disconnectEndpoint:](self, "disconnectEndpoint:", v4);
  -[HIDRemoteDeviceServer endpoints](self, "endpoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "endpointID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  return 1;
}

- (void)disconnectEndpoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[HIDRemoteDeviceServer endpoints](self, "endpoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "endpointID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HIDRemoteDeviceServer endpoints](self, "endpoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "endpointID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllDevices");

    -[HIDRemoteDeviceServer endpoints](self, "endpoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "endpointID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

  }
}

- (BOOL)createRemoteDevice:(id)a3 deviceID:(unint64_t)a4 property:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HIDRemoteDevice *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  id location;
  uint8_t buf[4];
  HIDRemoteDevice *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE3E818]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24DB1FF70, CFSTR("ReportInterval"));
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "bytes");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v12, "initWithBytes:length:encoding:", v14, objc_msgSend(v15, "length") - 1, 4);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("SerialNumber"));

  }
  v17 = -[HIDRemoteDevice initWithProperties:]([HIDRemoteDevice alloc], "initWithProperties:", v9);
  if (v17)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v17);
    v18 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke;
    v31[3] = &unk_24DB1F278;
    objc_copyWeak(&v32, &location);
    v31[4] = self;
    -[HIDUserDevice setSetReportHandler:](v17, "setSetReportHandler:", v31);
    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_127;
    v29[3] = &unk_24DB1F2A0;
    objc_copyWeak(&v30, &location);
    v29[4] = self;
    -[HIDUserDevice setGetReportHandler:](v17, "setGetReportHandler:", v29);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VersionNumber"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = objc_opt_isKindOfClass();

    if ((v20 & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VersionNumber"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HIDRemoteDevice setTransportVersion:](v17, "setTransportVersion:", objc_msgSend(v21, "unsignedIntegerValue"));

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Side"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Side"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HIDRemoteDevice setSide:](v17, "setSide:", objc_msgSend(v24, "unsignedIntegerValue"));

    }
    -[HIDRemoteDevice setDeviceID:](v17, "setDeviceID:", a4);
    -[HIDRemoteDeviceServer queue](self, "queue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HIDUserDevice setDispatchQueue:](v17, "setDispatchQueue:", v25);

    -[HIDUserDevice activate](v17, "activate");
    objc_msgSend(v8, "addDevice:", v17);
    RemoteHIDLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v35 = v17;
      v36 = 2112;
      v37 = v8;
      v38 = 2112;
      v39 = v9;
      _os_log_impl(&dword_21960D000, v26, OS_LOG_TYPE_DEFAULT, "Create device:%@ for endpoint:%@ property:%@", buf, 0x20u);
    }

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  else
  {
    RemoteHIDLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer createRemoteDevice:deviceID:property:].cold.1();

  }
  return v17 != 0;
}

uint64_t __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a5);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v25[5];
    v25[5] = v11;

    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_121;
    block[3] = &unk_24DB1F250;
    v14 = WeakRetained;
    v22 = a2;
    v23 = a3;
    v21 = &v24;
    v15 = *(_QWORD *)(a1 + 32);
    v19 = v14;
    v20 = v15;
    dispatch_async(v13, block);

    v16 = 0;
  }
  else
  {
    v16 = 3758097088;
  }
  _Block_object_dispose(&v24, 8);

  return v16;
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_121(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  intptr_t v13;
  NSObject *v14;
  int v15;
  int v16;
  const char *v17;
  int v18;
  NSObject *v19;
  int8x16_t v20;
  _QWORD block[4];
  int8x16_t v22;
  uint64_t *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[2];
  int v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  _BYTE v32[18];
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  v27[0] = &v26;
  v27[1] = 0x2020000000;
  v28 = -1431655766;
  RemoteHIDLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "deviceID");
    v5 = *(_QWORD *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 64);
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 67109890;
    v30 = v3;
    v31 = 2048;
    *(_QWORD *)v32 = v5;
    *(_WORD *)&v32[8] = 2048;
    *(_QWORD *)&v32[10] = v4;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_21960D000, v2, OS_LOG_TYPE_INFO, "[device:%d] setReport type:%ld reportID:%ld report:%@", buf, 0x26u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setLastSetReportStatus:", 3758097084);
  objc_msgSend(*(id *)(a1 + 32), "setWaitForReport:", 1);
  v7 = 0;
  v8 = MEMORY[0x24BDAC760];
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_122;
    block[3] = &unk_24DB1F228;
    v23 = &v26;
    v20 = *(int8x16_t *)(a1 + 32);
    v10 = (id)v20.i64[0];
    v22 = vextq_s8(v20, v20, 8uLL);
    v25 = *(_OWORD *)(a1 + 56);
    v24 = *(_QWORD *)(a1 + 48);
    dispatch_async(v9, block);

    objc_msgSend(*(id *)(a1 + 32), "semaphore");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_time(0, 200000000);
    v13 = dispatch_semaphore_wait(v11, v12);

    if (v13)
    {
      *(_DWORD *)(v27[0] + 24) = -536870186;
      objc_msgSend(*(id *)(a1 + 32), "setLastSetReportStatus:", 3758097110);
    }
    if (!*(_DWORD *)(v27[0] + 24))
      break;
    RemoteHIDLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(*(id *)(a1 + 32), "deviceID");
      v16 = *(_DWORD *)(v27[0] + 24);
      v17 = (const char *)&unk_219618466;
      if (v7 < 2)
        v17 = ", retrying";
      *(_DWORD *)buf = 67109634;
      v30 = v15;
      v31 = 1024;
      *(_DWORD *)v32 = v16;
      *(_WORD *)&v32[4] = 2080;
      *(_QWORD *)&v32[6] = v17;
      _os_log_error_impl(&dword_21960D000, v14, OS_LOG_TYPE_ERROR, "[device:%d] remoteDeviceSetReport:0x%x%s", buf, 0x18u);
    }

    if (++v7 == 3)
      goto LABEL_14;
  }

LABEL_14:
  v18 = objc_msgSend(*(id *)(a1 + 32), "lastSetReportStatus");
  *(_DWORD *)(v27[0] + 24) = v18;
  objc_msgSend(*(id *)(a1 + 32), "setWaitForReport:", 0);
  if (*(_DWORD *)(v27[0] + 24))
  {
    RemoteHIDLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_121_cold_1(objc_msgSend(*(id *)(a1 + 32), "deviceID"), (uint64_t)v27, buf, v19);

  }
  _Block_object_dispose(&v26, 8);
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_122(uint64_t a1)
{
  NSObject *v2;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "remoteDeviceSetReport:type:reportID:report:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 40));
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "semaphore");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v2);

  }
}

uint64_t __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_127(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, size_t *a5)
{
  id WeakRetained;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  intptr_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  size_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  _DWORD v27[2];
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    RemoteHIDLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v27[0] = 67109632;
      v27[1] = objc_msgSend(WeakRetained, "deviceID");
      v28 = 2048;
      v29 = a2;
      v30 = 2048;
      v31 = a3;
      _os_log_impl(&dword_21960D000, v11, OS_LOG_TYPE_INFO, "[device:%d] getReport type:%ld reportID:%ld", (uint8_t *)v27, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a4, *a5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(WeakRetained, "setLastGetReport:", 0);
    objc_msgSend(WeakRetained, "setWaitForReport:", 1);
    v14 = objc_msgSend(*(id *)(a1 + 32), "remoteDeviceGetReport:type:reportID:report:", WeakRetained, a2, a3, v13);
    if ((_DWORD)v14)
    {
      v25 = v14;
      RemoteHIDLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_127_cold_3(WeakRetained);
    }
    else
    {
      objc_msgSend(WeakRetained, "semaphore");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = dispatch_time(0, 1000000000);
      v17 = dispatch_semaphore_wait(v15, v16);

      if (v17)
      {
        RemoteHIDLog();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 3758097110;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_127_cold_2(WeakRetained);
      }
      else
      {
        objc_msgSend(WeakRetained, "lastGetReport");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = objc_msgSend(v12, "length");
          objc_msgSend(WeakRetained, "lastGetReport");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "length");

          if (v19 >= v21)
            v22 = v21;
          else
            v22 = v19;
          *a5 = v22;
          v23 = (void *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
          objc_msgSend(WeakRetained, "lastGetReport");
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          memcpy(v23, (const void *)-[NSObject bytes](v24, "bytes"), *a5);
          v25 = 0;
        }
        else
        {
          RemoteHIDLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_127_cold_1(WeakRetained);
          v25 = 3758097084;
        }
      }
    }

    objc_msgSend(WeakRetained, "setWaitForReport:", 0);
  }
  else
  {
    v25 = 3758097088;
  }

  return v25;
}

- (unint64_t)syncRemoteTimestamp:(unint64_t)a3 forEndpoint:(id)a4
{
  return 0;
}

- (int)remoteDeviceSetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6
{
  return -536870201;
}

- (int)remoteDeviceGetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6
{
  return -536870201;
}

- (BOOL)remoteDeviceReportHandler:(id)a3 packet:(id *)a4
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v12;

  v5 = a3;
  v6 = ((unint64_t)a4->var0 >> 7) & 0x3FF;
  if (v6 > 5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4->var2, v6 - 5);
    v7 = objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v8 = objc_msgSend(v5, "handleReport:error:", v7, &v12);
    v9 = v12;
    if ((v8 & 1) == 0)
    {
      RemoteHIDLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:].cold.2();

    }
  }
  else
  {
    RemoteHIDLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:].cold.1();
    v8 = 0;
  }

  return v8;
}

- (BOOL)remoteDeviceTimestampedReportHandler:(id)a3 device:(id)a4 packet:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if ((*(_DWORD *)&a5->var0 & 0x1FF00u) <= 0x6FF)
  {
    RemoteHIDLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:].cold.1();
LABEL_4:
    v11 = 0;
    goto LABEL_11;
  }
  v12 = -[HIDRemoteDeviceServer syncRemoteTimestamp:forEndpoint:](self, "syncRemoteTimestamp:forEndpoint:", *(_QWORD *)(&a5->var1 + 1), v8);
  if (!v12)
  {
    RemoteHIDLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17 = *(_QWORD *)(&a5->var1 + 1);
      *(_DWORD *)buf = 134217984;
      v20 = v17;
      _os_log_impl(&dword_21960D000, v10, OS_LOG_TYPE_INFO, "Error syncing time with BT, dropping report! W2 TS:%llu", buf, 0xCu);
    }
    goto LABEL_4;
  }
  v13 = v12;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", (char *)&a5->var2 + 5, (((unint64_t)a5->var0 >> 7) & 0x3FF) - 13);
  v10 = objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v11 = objc_msgSend(v9, "handleReport:withTimestamp:error:", v10, v13, &v18);
  v14 = v18;
  if ((v11 & 1) == 0)
  {
    RemoteHIDLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:].cold.2();

  }
LABEL_11:

  return v11;
}

- (BOOL)remoteDeviceReportHandler:(id)a3 header:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  BOOL v10;
  BOOL v11;

  v6 = a3;
  objc_msgSend(v6, "getDevice:", *(_DWORD *)a4 & 0x7FLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    RemoteHIDLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:header:].cold.1();

    goto LABEL_11;
  }
  if ((*((_BYTE *)a4 + 2) & 0x10) != 0)
    v8 = -[HIDRemoteDeviceServer remoteDeviceTimestampedReportHandler:device:packet:](self, "remoteDeviceTimestampedReportHandler:device:packet:", v6, v7, a4);
  else
    v8 = -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:](self, "remoteDeviceReportHandler:packet:", v7, a4);
  v10 = v8;
  objc_msgSend(v7, "setHandleReportCount:", objc_msgSend(v7, "handleReportCount") + 1);
  if (!v10)
  {
    objc_msgSend(v7, "setHandleReportError:", objc_msgSend(v7, "handleReportError") + 1);
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)remoteDeviceSetReportHandler:(id)a3 packet:(id *)a4
{
  id v5;
  void *v6;
  $BB3D4576025F56031F4E4DA6F5282AC4 var0;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  BOOL v18;
  NSObject *v19;

  v5 = a3;
  v6 = v5;
  var0 = a4->var0;
  if ((*(_DWORD *)&a4->var0 & 0x1FF80u) <= 0x27F)
  {
    RemoteHIDLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:].cold.1();
LABEL_15:
    v18 = 0;
    goto LABEL_16;
  }
  if ((*(_DWORD *)&var0 & 0x200000) == 0)
  {
    RemoteHIDLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceSetReportHandler:packet:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_15;
  }
  objc_msgSend(v5, "getDevice:", *(_BYTE *)&var0 & 0x7F);
  v16 = objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (!v16)
  {
    RemoteHIDLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:header:].cold.1();

    goto LABEL_15;
  }
  v17 = 0;
  if ((*(_DWORD *)&a4->var0 & 0x400000) != 0 && (*(_DWORD *)&a4->var0 & 0x1FF80u) >= 0x401)
    v17 = *(unsigned int *)a4->var2;
  v18 = -[NSObject setReportHandler:reportID:status:](v16, "setReportHandler:reportID:status:", a4->var1, 0, v17) == 0;
LABEL_16:

  return v18;
}

- (BOOL)remoteDeviceGetReportHandler:(id)a3 packet:(id *)a4
{
  id v5;
  void *v6;
  $BB3D4576025F56031F4E4DA6F5282AC4 var0;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;

  v5 = a3;
  v6 = v5;
  var0 = a4->var0;
  if ((*(_DWORD *)&a4->var0 & 0x1FF80u) <= 0x27F)
  {
    RemoteHIDLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:].cold.1();
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  if ((*(_DWORD *)&var0 & 0x200000) == 0)
  {
    RemoteHIDLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceSetReportHandler:packet:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_12;
  }
  objc_msgSend(v5, "getDevice:", *(_BYTE *)&var0 & 0x7F);
  v16 = objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (!v16)
  {
    RemoteHIDLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:header:].cold.1();

    goto LABEL_12;
  }
  v17 = -[NSObject getReportHandler:reportID:report:reportLength:](v16, "getReportHandler:reportID:report:reportLength:", a4->var1, 0, a4->var2, (((unint64_t)a4->var0 >> 7) & 0x3FF) - 5) == 0;
LABEL_13:

  return v17;
}

- (void)remoteDeviceConnectHandler:(id)a3 packet:(id *)a4 transportVersion:(unsigned __int8)a5 side:(unsigned __int8)a6
{
  int v6;
  uint64_t v7;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  unsigned __int16 *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  const char *v24;
  size_t v25;
  CFTypeRef v26;
  CFTypeID v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  id v32;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = ((unint64_t)a4->var0 >> 7) & 0x3FF;
  if (v11 > 4)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4->var1, v11 - 4);
    v12 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSObject length](v12, "length") >= 6
      && ((v13 = objc_retainAutorelease(v12), v14 = -[NSObject bytes](v13, "bytes"), *(_DWORD *)v14 == 1836597052)
        ? (v15 = *(_BYTE *)(v14 + 4) == 108)
        : (v15 = 0),
          v15))
    {
      v32 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v13, 2, 0, &v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v22 = v32;
        objc_msgSend(v22, "description");
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      if ((unint64_t)-[NSObject length](v12, "length") < 4
        || (v16 = objc_retainAutorelease(v12),
            v17 = (unsigned __int16 *)-[NSObject bytes](v16, "bytes"),
            *v17 ^ 0xD3 | *((unsigned __int8 *)v17 + 2)))
      {
        v18 = 0;
        v19 = CFSTR("Unrecognized data format");
        goto LABEL_12;
      }
      v31 = 0;
      v23 = objc_retainAutorelease(v16);
      v24 = (const char *)-[NSObject bytes](v23, "bytes");
      v25 = -[NSObject length](v23, "length");
      v26 = IOCFUnserializeBinary(v24, v25, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, (CFStringRef *)&v31);
      v18 = (void *)v26;
      if (v26 && (v27 = CFGetTypeID(v26), v27 != CFDictionaryGetTypeID()))
      {
        CFRelease(v18);
        v18 = 0;
        v28 = CFSTR("Unserialized data is not a dictionary");
      }
      else
      {
        v28 = 0;
      }
      if (v31)
        v19 = v31;
      else
        v19 = (__CFString *)v28;
    }
    if (!v19 && v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = objc_msgSend(v18, "mutableCopy");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v7);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v29, CFSTR("VersionNumber"));

        if ((_DWORD)v7)
        {
          if (v6 == 16)
            v30 = &unk_24DB1FF88;
          else
            v30 = &unk_24DB1FF70;
          -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v30, CFSTR("Side"), v31);
        }
        -[HIDRemoteDeviceServer createRemoteDevice:deviceID:property:](self, "createRemoteDevice:deviceID:property:", v10, *(_DWORD *)&a4->var0 & 0x7FLL, v21, v31);
        v19 = 0;
        goto LABEL_16;
      }
      v19 = 0;
    }
LABEL_12:
    RemoteHIDLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer remoteDeviceConnectHandler:packet:transportVersion:side:].cold.3();

    RemoteHIDLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[HIDRemoteDeviceServer remoteDeviceConnectHandler:packet:transportVersion:side:].cold.2((uint64_t)v12, v21);
LABEL_16:

    goto LABEL_17;
  }
  RemoteHIDLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:].cold.1();
LABEL_17:

}

- (void)endpointMessageHandler:(id)a3 data:(char *)a4 size:(unint64_t)a5
{
  id v8;
  void *v9;
  char *v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v21;

  v8 = a3;
  v9 = v8;
  if (a5 <= 7)
  {
    RemoteHIDLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer endpointMessageHandler:data:size:].cold.1((uint64_t)a4, a5);
  }
  else
  {
    v10 = a4 + 4;
    v11 = a4[3];
    if ((~v11 & 3) != 0)
      v12 = 1;
    else
      v12 = 16;
    if ((v11 & 1) != 0)
      v13 = 1;
    else
      v13 = 16;
    v14 = v11 & 2;
    if ((v11 & 2) != 0)
      v15 = v12;
    else
      v15 = v13;
    if ((_DWORD)v15 != objc_msgSend(v8, "primarySide"))
    {
      objc_msgSend(v9, "setPrimarySide:", v15);
      objc_msgSend(v9, "removeAllDevices");
    }
    v16 = &a4[a5];
    if (v14)
      v17 = 16;
    else
      v17 = 1;
    while (v10 + 4 <= v16)
    {
      v18 = *(unsigned int *)v10;
      v19 = (v18 >> 7) & 0x3FF;
      if (v19 < 4 || &v10[v19] > v16)
        break;
      *(_DWORD *)v10 = v18 | (32 * v14);
      -[HIDRemoteDeviceServer endpointPacketHandler:packet:transportVersion:side:](self, "endpointPacketHandler:packet:transportVersion:side:", v9, v10, *a4, v17);
      v10 += ((unint64_t)*(unsigned int *)v10 >> 7) & 0x3FF;
      if (v10 >= v16)
        goto LABEL_22;
    }
    RemoteHIDLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceServer endpointMessageHandler:data:size:].cold.2((uint64_t)a4, a5);
  }

LABEL_22:
}

- (void)endpointPacketHandler:(id)a3 packet:(id *)a4 transportVersion:(unsigned __int8)a5 side:(unsigned __int8)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  NSObject *v11;
  NSObject *v12;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  RemoteHIDLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[HIDRemoteDeviceServer endpointPacketHandler:packet:transportVersion:side:].cold.2(a4, v11);

  switch((*(unsigned int *)a4 >> 17) & 7)
  {
    case 0u:
      -[HIDRemoteDeviceServer remoteDeviceConnectHandler:packet:transportVersion:side:](self, "remoteDeviceConnectHandler:packet:transportVersion:side:", v10, a4, v7, v6);
      break;
    case 1u:
      objc_msgSend(v10, "removeDeviceID:", *(_DWORD *)a4 & 0x7FLL);
      break;
    case 2u:
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:header:](self, "remoteDeviceReportHandler:header:", v10, a4);
      break;
    case 3u:
      -[HIDRemoteDeviceServer remoteDeviceSetReportHandler:packet:](self, "remoteDeviceSetReportHandler:packet:", v10, a4);
      break;
    case 4u:
      -[HIDRemoteDeviceServer remoteDeviceGetReportHandler:packet:](self, "remoteDeviceGetReportHandler:packet:", v10, a4);
      break;
    default:
      RemoteHIDLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[HIDRemoteDeviceServer endpointPacketHandler:packet:transportVersion:side:].cold.1();

      break;
  }

}

- (void)disconnectAll
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21960D000, log, OS_LOG_TYPE_DEBUG, "DisconnectAll", v1, 2u);
  OUTLINED_FUNCTION_2();
}

uint64_t __38__HIDRemoteDeviceServer_disconnectAll__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnectEndpoint:");
}

- (NSMutableDictionary)endpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
}

- (void)createRemoteDevice:deviceID:property:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_21960D000, v0, v1, "HIDUserDevice failed, property:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_121_cold_1(int a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  int v4;

  v4 = *(_DWORD *)(*(_QWORD *)a2 + 24);
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v4;
  _os_log_error_impl(&dword_21960D000, log, OS_LOG_TYPE_ERROR, "[device:%d] remoteDeviceSetReport:0x%x", buf, 0xEu);
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_127_cold_1(void *a1)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a1, "deviceID");
  objc_msgSend(a1, "lastGetReport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);

  OUTLINED_FUNCTION_5_0();
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_127_cold_2(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "deviceID");
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(v1, v2, v3, v4, v5, 8u);
  OUTLINED_FUNCTION_7();
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_127_cold_3(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "deviceID");
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xEu);
  OUTLINED_FUNCTION_14();
}

- (void)remoteDeviceReportHandler:packet:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "Invalid report size:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)remoteDeviceReportHandler:packet:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_21960D000, v0, v1, "handleReport:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)remoteDeviceReportHandler:header:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "HID Device for deviceID:%d does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)remoteDeviceSetReportHandler:(uint64_t)a3 packet:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21960D000, a1, a3, "Expected response", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)remoteDeviceConnectHandler:(uint64_t)a1 packet:(NSObject *)a2 transportVersion:side:.cold.2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a1, 1);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_21960D000, a2, v4, "HIDPacketDevice config data:%@", v5);

  OUTLINED_FUNCTION_14();
}

- (void)remoteDeviceConnectHandler:packet:transportVersion:side:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_21960D000, v0, v1, "HIDPacketDevice de-serialization error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)endpointMessageHandler:(uint64_t)a1 data:(uint64_t)a2 size:.cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_0(&dword_21960D000, v3, v4, "Invalid header - length:%zu data:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

- (void)endpointMessageHandler:(uint64_t)a1 data:(uint64_t)a2 size:.cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_0(&dword_21960D000, v3, v4, "Invalid message - length:%zu data:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

- (void)endpointPacketHandler:packet:transportVersion:side:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "Unsupported packet type:%u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)endpointPacketHandler:(_DWORD *)a1 packet:(NSObject *)a2 transportVersion:side:.cold.2(_DWORD *a1, NSObject *a2)
{
  int v2;
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *a1 & 0x7F;
  v3 = (*a1 >> 17) & 7;
  v4 = (*a1 >> 7) & 0x3FF;
  v5[0] = 67109632;
  v5[1] = v2;
  v6 = 1024;
  v7 = v3;
  v8 = 1024;
  v9 = v4;
  _os_log_debug_impl(&dword_21960D000, a2, OS_LOG_TYPE_DEBUG, "endpointPacketHandler deviceid:%u type:%d size:%u", (uint8_t *)v5, 0x14u);
  OUTLINED_FUNCTION_7();
}

@end
