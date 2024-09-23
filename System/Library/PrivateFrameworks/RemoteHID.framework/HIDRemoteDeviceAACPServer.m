@implementation HIDRemoteDeviceAACPServer

- (HIDRemoteDeviceAACPServer)initWithQueue:(id)a3
{
  HIDRemoteDeviceAACPServer *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *btQueue;
  uint64_t v6;
  NSMutableData *decodeBuff;
  NSMutableDictionary *v8;
  NSMutableDictionary *endpointTimeSyncEnabled;
  HIDRemoteDeviceAACPServer *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HIDRemoteDeviceAACPServer;
  v3 = -[HIDRemoteDeviceServer initWithQueue:](&v12, sel_initWithQueue_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.hidrc.bluetooth", 0);
    btQueue = v3->_btQueue;
    v3->_btQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 1050);
    v6 = objc_claimAutoreleasedReturnValue();
    decodeBuff = v3->_decodeBuff;
    v3->_decodeBuff = (NSMutableData *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    endpointTimeSyncEnabled = v3->_endpointTimeSyncEnabled;
    v3->_endpointTimeSyncEnabled = v8;

    v10 = v3;
  }

  return v3;
}

- (id)description
{
  void *v2;
  const char *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  if (self->_timeSyncClock)
    v3 = "YES";
  else
    v3 = "NO";
  v7.receiver = self;
  v7.super_class = (Class)HIDRemoteDeviceAACPServer;
  -[HIDRemoteDeviceServer description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HIDRemoteDeviceAACPServer timeSync:%s %@>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)activate
{
  objc_super v3;

  -[HIDRemoteDeviceAACPServer btSessionCreate](self, "btSessionCreate");
  v3.receiver = self;
  v3.super_class = (Class)HIDRemoteDeviceAACPServer;
  -[HIDRemoteDeviceServer activate](&v3, sel_activate);
}

- (void)cancel
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  if (self->_session)
  {
    objc_storeStrong((id *)&self->_me, self);
    BTSessionDetachWithQueue();
  }
  -[HIDRemoteDeviceServer endpoints](self, "endpoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__HIDRemoteDeviceAACPServer_cancel__block_invoke;
  v5[3] = &unk_24DB1F190;
  v5[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  v4.receiver = self;
  v4.super_class = (Class)HIDRemoteDeviceAACPServer;
  -[HIDRemoteDeviceServer cancel](&v4, sel_cancel);
}

void __35__HIDRemoteDeviceAACPServer_cancel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "removeBTDevice:", objc_msgSend(v6, "unsignedLongLongValue"));

}

- (void)btSessionCreate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "BTSessionAttachWithQueue:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)btSessionInit:(BTSessionImpl *)a3
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  unsigned int v7;
  _QWORD v9[256];
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  self->_session = a3;
  if (BTAccessoryManagerGetDefault())
  {
    RemoteHIDLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer btSessionInit:].cold.5();
LABEL_13:

    return;
  }
  if (BTAccessoryManagerAddCallbacks())
  {
    RemoteHIDLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer btSessionInit:].cold.4();
    goto LABEL_13;
  }
  if (BTServiceAddCallbacks())
  {
    RemoteHIDLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer btSessionInit:].cold.3();
    goto LABEL_13;
  }
  v12 = 0xAAAAAAAAAAAAAAAALL;
  if (BTLocalDeviceGetDefault())
  {
    RemoteHIDLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer btSessionInit:].cold.2();
    goto LABEL_13;
  }
  v11 = 256;
  memset(v9, 170, sizeof(v9));
  if (BTLocalDeviceGetConnectedDevices())
  {
    RemoteHIDLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer btSessionInit:].cold.1();

  }
  else if (v11)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      v10 = 0;
      BTDeviceGetConnectedServices();
      -[HIDRemoteDeviceAACPServer btServiceEventHandler:services:eventType:event:result:](self, "btServiceEventHandler:services:eventType:event:result:", v9[v6], v10, 0, 11, 0);
      v6 = v7;
    }
    while (v11 > v7++);
  }
}

- (void)btSessionEventHandler:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD *v12;
  HIDRemoteDeviceAACPServer *me;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  BTSessionImpl *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  RemoteHIDLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v17 = a3;
    v18 = 1024;
    v19 = a4;
    v20 = 1024;
    v21 = a5;
    _os_log_impl(&dword_21960D000, v9, OS_LOG_TYPE_DEFAULT, "btSessionEventHandler session:%p event:%d result:%d", buf, 0x18u);
  }

  if (a4 == 2)
  {
    self->_session = 0;
    v10 = dispatch_time(0, 1000000000);
    -[HIDRemoteDeviceAACPServer btQueue](self, "btQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__HIDRemoteDeviceAACPServer_btSessionEventHandler_event_result___block_invoke_2;
    v14[3] = &unk_24DB1F1D8;
    v14[4] = self;
    v12 = v14;
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    me = self->_me;
    self->_me = 0;

  }
  else
  {
    if (a4)
      return;
    if (a5)
    {
      v10 = dispatch_time(0, 1000000000);
      -[HIDRemoteDeviceAACPServer btQueue](self, "btQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __64__HIDRemoteDeviceAACPServer_btSessionEventHandler_event_result___block_invoke;
      v15[3] = &unk_24DB1F1D8;
      v15[4] = self;
      v12 = v15;
LABEL_9:
      dispatch_after(v10, v11, v12);

      return;
    }
    -[HIDRemoteDeviceAACPServer btSessionInit:](self, "btSessionInit:", a3);
  }
}

uint64_t __64__HIDRemoteDeviceAACPServer_btSessionEventHandler_event_result___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "btSessionCreate");
}

uint64_t __64__HIDRemoteDeviceAACPServer_btSessionEventHandler_event_result___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "btSessionCreate");
}

- (void)addBTDevice:(BTDeviceImpl *)a3
{
  int FeatureCapability;
  NSObject *v6;
  HIDRemoteEndpoint *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  _QWORD v15[3];
  int v16;
  uint8_t buf[4];
  _DWORD v18[7];

  *(_QWORD *)&v18[5] = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  FeatureCapability = BTAccessoryManagerGetFeatureCapability();
  RemoteHIDLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v18[0] = FeatureCapability;
    LOWORD(v18[1]) = 1024;
    *(_DWORD *)((char *)&v18[1] + 2) = v16;
    _os_log_impl(&dword_21960D000, v6, OS_LOG_TYPE_INFO, "BTAccessoryManagerGetFeatureCapability:%d (FEATURE_SENSOR_DATA:%d)", buf, 0xEu);
  }

  if (BTAccessoryManagerRegisterCustomMessageClient())
  {
    RemoteHIDLog();
    v7 = (HIDRemoteEndpoint *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer addBTDevice:].cold.4();
    goto LABEL_19;
  }
  if (BTAccessoryManagerRegisterCustomMessageClient())
  {
    RemoteHIDLog();
    v7 = (HIDRemoteEndpoint *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer addBTDevice:].cold.3();
    goto LABEL_19;
  }
  if (BTAccessoryManagerRegisterCustomMessageClient())
  {
    RemoteHIDLog();
    v7 = (HIDRemoteEndpoint *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer addBTDevice:].cold.2();
    goto LABEL_19;
  }
  v7 = -[HIDRemoteEndpoint initWithID:]([HIDRemoteEndpoint alloc], "initWithID:", a3);
  -[HIDRemoteDeviceServer endpoints](self, "endpoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HIDRemoteEndpoint endpointID](v7, "endpointID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  RemoteHIDLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v12)
      goto LABEL_18;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v18 = a3;
    v13 = "HID AACP device:%p already connected";
  }
  else
  {
    if (!v12)
      goto LABEL_18;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v18 = a3;
    v13 = "HID AACP device:%p";
  }
  _os_log_impl(&dword_21960D000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
LABEL_18:

  -[HIDRemoteDeviceServer connectEndpoint:](self, "connectEndpoint:", v7);
  v15[0] = 0xAAA00200AAAAAAAALL;
  -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:](self, "sendMessageBTDevice:data:size:transportVersion:side:", a3, v15, 8, 0, 0);
  -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:](self, "sendMessageBTDevice:data:size:transportVersion:side:", a3, v15, 8, 1, 0);
  if (-[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:](self, "sendMessageBTDevice:data:size:transportVersion:side:", a3, v15, 8, 1, 1))
  {
    RemoteHIDLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer addBTDevice:].cold.1();

  }
LABEL_19:

}

- (int)sendMessageBTDevice:(BTDeviceImpl *)a3 data:(char *)a4 size:(unint64_t)a5 transportVersion:(unsigned __int8)a6 side:(unsigned __int8)a7
{
  int v8;
  NSObject *v11;
  char v12;
  int *v13;
  char v14;
  void *v15;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, char *, uint64_t);
  uint64_t v20;
  char v21;
  int v22;
  NSObject *v23;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  BTDeviceImpl *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  v27 = 0;
  if (a5 >= 8)
  {
    v8 = a6;
    *(_DWORD *)a4 = 0;
    *(_WORD *)(a4 + 1) = ++generation;
    a4[3] = 2 * (a7 & 1);
    RemoteHIDLogPackets();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v29 = a3;
      v30 = 1040;
      v31 = a5;
      v32 = 2096;
      v33 = a4;
      _os_log_debug_impl(&dword_21960D000, v11, OS_LOG_TYPE_DEBUG, "[%p] send packet:%{RemoteHID:packet}.*P", buf, 0x1Cu);
    }

    if (!v8)
    {
      v16 = 0;
LABEL_12:
      v22 = BTAccessoryManagerSendCustomMessage();
      if (!v22)
        goto LABEL_16;
      goto LABEL_13;
    }
    encodeHeader((uint64_t)a4, a5, 0, 0, &v26, 1);
    if ((v12 & 1) != 0)
    {
      v13 = (int *)(a4 + 4);
      encode((int *)a4 + 1, a5 - 4, 0, 0, &v27, 0, 1);
      if ((v14 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v27 + v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = objc_retainAutorelease(v15);
          encodeHeader((uint64_t)a4, a5, (uint64_t (*)(uint64_t, char *, uint64_t))objc_msgSend(v16, "mutableBytes"), (uint64_t (*)(uint64_t, char *, uint64_t))objc_msgSend(v16, "length"), &v26, 0);
          if ((v17 & 1) != 0)
          {
            v16 = objc_retainAutorelease(v16);
            v18 = objc_msgSend(v16, "mutableBytes");
            v19 = (uint64_t (*)(uint64_t, char *, uint64_t))(v18 + v26);
            v20 = objc_msgSend(v16, "length");
            encode(v13, a5 - 4, v19, (uint64_t (*)(uint64_t, char *, uint64_t))(v20 - v26), &v27, 0, 0);
            if ((v21 & 1) != 0)
            {
              v16 = objc_retainAutorelease(v16);
              objc_msgSend(v16, "mutableBytes");
              objc_msgSend(v16, "length");
              goto LABEL_12;
            }
            RemoteHIDLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:].cold.3();
          }
          else
          {
            RemoteHIDLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:].cold.4();
          }
          goto LABEL_29;
        }
        RemoteHIDLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:].cold.2();
      }
      else
      {
        RemoteHIDLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:].cold.5();
      }
    }
    else
    {
      RemoteHIDLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:].cold.6();
    }
    v16 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v16 = 0;
LABEL_30:
  v22 = 5;
LABEL_13:
  RemoteHIDLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:].cold.1();

LABEL_16:
  return v22;
}

- (void)removeBTDevice:(BTDeviceImpl *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *endpointTimeSyncEnabled;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  NSMutableDictionary *v15;
  void *v16;
  int v17;
  BTDeviceImpl *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  RemoteHIDLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134217984;
    v18 = a3;
    _os_log_impl(&dword_21960D000, v5, OS_LOG_TYPE_DEFAULT, "HID AACP device remove:%p", (uint8_t *)&v17, 0xCu);
  }

  -[HIDRemoteDeviceServer endpoints](self, "endpoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HIDRemoteDeviceServer disconnectEndpoint:](self, "disconnectEndpoint:", v8);

  endpointTimeSyncEnabled = self->_endpointTimeSyncEnabled;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](endpointTimeSyncEnabled, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BDBD1C8], "isEqual:", v11))
  {
    v12 = BTAccessoryManagerRemoteTimeSyncEnable();
    if (v12)
    {
      v13 = v12;
      RemoteHIDLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 134218240;
        v18 = a3;
        v19 = 1024;
        v20 = v13;
        _os_log_impl(&dword_21960D000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't disable timesync for device:%p status:%d", (uint8_t *)&v17, 0x12u);
      }

    }
    v15 = self->_endpointTimeSyncEnabled;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v16);

  }
}

- (void)btDeviceMessageHandler:(BTDeviceImpl *)a3 type:(int)a4 data:(char *)a5 size:(unint64_t)a6
{
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  BTDeviceImpl *v30;
  __int16 v31;
  _BYTE v32[14];
  __int16 v33;
  _WORD v34[17];

  *(_QWORD *)&v34[13] = *MEMORY[0x24BDAC8D0];
  -[HIDRemoteDeviceServer endpoints](self, "endpoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  if (v13)
  {
    if (a4 != 0x100000)
    {
LABEL_6:
      RemoteHIDLogPackets();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = mach_absolute_time();
        *(_DWORD *)buf = 134219010;
        v30 = a3;
        v31 = 1024;
        *(_DWORD *)v32 = a4;
        *(_WORD *)&v32[4] = 2048;
        *(_QWORD *)&v32[6] = v17;
        v33 = 1040;
        *(_DWORD *)v34 = a6;
        v34[2] = 2096;
        *(_QWORD *)&v34[3] = a5;
        _os_log_debug_impl(&dword_21960D000, v16, OS_LOG_TYPE_DEBUG, "[%p] receive packet - type:0x%x timestamp:%lld packet:%{RemoteHID:packet}.*P", buf, 0x2Cu);
      }

      -[HIDRemoteDeviceServer endpointMessageHandler:data:size:](self, "endpointMessageHandler:data:size:", v13, a5, a6);
      goto LABEL_9;
    }
    decodeHeader((uint64_t)a5, a6, (uint64_t)-[NSMutableData mutableBytes](self->_decodeBuff, "mutableBytes"), -[NSMutableData length](self->_decodeBuff, "length"));
    if ((v14 & 1) != 0)
    {
      decode((uint64_t)a5, a6, (uint64_t)(-[NSMutableData mutableBytes](self->_decodeBuff, "mutableBytes") + 4), -[NSMutableData length](self->_decodeBuff, "length") - 4, &v28, 0);
      if ((v15 & 1) != 0)
      {
        a5 = -[NSMutableData mutableBytes](self->_decodeBuff, "mutableBytes");
        a6 = v28 + 4;
        goto LABEL_6;
      }
      RemoteHIDLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[HIDRemoteDeviceAACPServer btDeviceMessageHandler:type:data:size:].cold.2();
    }
    else
    {
      RemoteHIDLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[HIDRemoteDeviceAACPServer btDeviceMessageHandler:type:data:size:].cold.3();
    }

    RemoteHIDLogPackets();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = mach_absolute_time();
      *(_DWORD *)buf = 134218754;
      v30 = a3;
      v31 = 2048;
      *(_QWORD *)v32 = v27;
      *(_WORD *)&v32[8] = 1040;
      *(_DWORD *)&v32[10] = a6;
      v33 = 2096;
      *(_QWORD *)v34 = a5;
      _os_log_error_impl(&dword_21960D000, v26, OS_LOG_TYPE_ERROR, "[%p] encoded packet - timestamp:%lld packet:%{RemoteHID:encodedpacket}.*P", buf, 0x26u);
    }

  }
  else
  {
    RemoteHIDLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer btDeviceMessageHandler:type:data:size:].cold.1((uint64_t)a3, v18, v19, v20, v21, v22, v23, v24);

  }
LABEL_9:

}

- (void)btServiceEventHandler:(BTDeviceImpl *)a3 services:(unsigned int)a4 eventType:(int)a5 event:(unsigned int)a6 result:(int)a7
{
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  RemoteHIDLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14[0] = 67109888;
    v14[1] = a4;
    v15 = 1024;
    v16 = a5;
    v17 = 1024;
    v18 = a6;
    v19 = 1024;
    v20 = a7;
    _os_log_debug_impl(&dword_21960D000, v13, OS_LOG_TYPE_DEBUG, "btServiceEventHandler services:0x%x eventType:%d event:%d result:%d", (uint8_t *)v14, 0x1Au);
  }

  if ((a4 & 0x80000) != 0)
  {
    if (a6 != 11 || a7 | a5)
    {
      if (a5 == 1 && a6 == 12)
        -[HIDRemoteDeviceAACPServer removeBTDevice:](self, "removeBTDevice:", a3);
    }
    else
    {
      -[HIDRemoteDeviceAACPServer addBTDevice:](self, "addBTDevice:", a3);
    }
  }
}

- (void)btAccessoryEventHandler:(BTDeviceImpl *)a3 event:(int)a4 state:(int)a5
{
  NSObject *v9;
  NSObject *v10;
  TSClockManager *v11;
  TSClockManager *coreTimeSyncManager;
  int TimeSyncId;
  NSObject *v14;
  TSUserFilteredClock *v15;
  TSUserFilteredClock *v16;
  NSObject *v17;
  NSObject *v18;
  TSUserFilteredClock *timeSyncClock;
  uint8_t buf[4];
  BTDeviceImpl *v21;
  __int16 v22;
  _WORD v23[9];

  *(_QWORD *)&v23[5] = *MEMORY[0x24BDAC8D0];
  RemoteHIDLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v21 = a3;
    v22 = 1024;
    *(_DWORD *)v23 = a4;
    v23[2] = 1024;
    *(_DWORD *)&v23[3] = a5;
    _os_log_impl(&dword_21960D000, v9, OS_LOG_TYPE_INFO, "btAccessoryEventHandler device:%p event:%d state:%d", buf, 0x18u);
  }

  if (a4 == 8)
  {
    RemoteHIDLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = a3;
      _os_log_impl(&dword_21960D000, v18, OS_LOG_TYPE_DEFAULT, "TIMESYNC_NOT_AVAILABLE device:%p", buf, 0xCu);
    }

    timeSyncClock = self->_timeSyncClock;
    self->_timeSyncClock = 0;

  }
  else if (a4 == 7)
  {
    RemoteHIDLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = a3;
      _os_log_impl(&dword_21960D000, v10, OS_LOG_TYPE_DEFAULT, "TIMESYNC_AVAILABLE device:%p", buf, 0xCu);
    }

    if (!self->_coreTimeSyncManager)
    {
      objc_msgSend(MEMORY[0x24BEB70C0], "sharedClockManager");
      v11 = (TSClockManager *)objc_claimAutoreleasedReturnValue();
      coreTimeSyncManager = self->_coreTimeSyncManager;
      self->_coreTimeSyncManager = v11;

      if (!self->_coreTimeSyncManager)
      {
        RemoteHIDLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[HIDRemoteDeviceAACPServer btAccessoryEventHandler:event:state:].cold.1();
        goto LABEL_23;
      }
    }
    TimeSyncId = BTAccessoryManagerGetTimeSyncId();
    RemoteHIDLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v21 = a3;
      v22 = 2048;
      *(_QWORD *)v23 = 0;
      _os_log_impl(&dword_21960D000, v14, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetTimeSyncId device:%p tsID:0x%llx", buf, 0x16u);
    }

    if (TimeSyncId)
    {
      RemoteHIDLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[HIDRemoteDeviceAACPServer btAccessoryEventHandler:event:state:].cold.3();
      goto LABEL_23;
    }
    -[TSClockManager clockWithClockIdentifier:](self->_coreTimeSyncManager, "clockWithClockIdentifier:", 0);
    v15 = (TSUserFilteredClock *)objc_claimAutoreleasedReturnValue();
    v16 = self->_timeSyncClock;
    self->_timeSyncClock = v15;

    if (!self->_timeSyncClock)
    {
      RemoteHIDLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[HIDRemoteDeviceAACPServer btAccessoryEventHandler:event:state:].cold.2();
LABEL_23:

    }
  }
}

- (int)remoteDeviceSetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  int v18;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", objc_msgSend(v10, "length") + 9);
  RemoteHIDLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v21 = 134218498;
    v22 = objc_msgSend(v9, "deviceID");
    v23 = 2048;
    v24 = a4;
    v25 = 2112;
    v26 = v10;
    _os_log_debug_impl(&dword_21960D000, v12, OS_LOG_TYPE_DEBUG, "remoteDeviceSetReport deviceID:0x%llx type:%ld report:%@", (uint8_t *)&v21, 0x20u);
  }

  v13 = objc_retainAutorelease(v11);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_retainAutorelease(v10);
  memcpy((void *)(v14 + 9), (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
  *(_DWORD *)(v14 + 4) = *(_DWORD *)(v14 + 4) & 0xFFFFFF80 | objc_msgSend(v9, "deviceID") & 0x7F;
  *(_DWORD *)(v14 + 4) = *(_DWORD *)(v14 + 4) & 0xFF80007F | ((objc_msgSend(v15, "length") << 7) + 640) & 0x1FF80 | 0x60000;
  *(_BYTE *)(v14 + 8) = a4;
  v16 = objc_msgSend(v9, "endpointID");
  v17 = objc_retainAutorelease(v13);
  if (-[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:](self, "sendMessageBTDevice:data:size:transportVersion:side:", v16, objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), objc_msgSend(v9, "transportVersion"), objc_msgSend(v9, "side")))
  {
    RemoteHIDLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer remoteDeviceSetReport:type:reportID:report:].cold.1();

    v18 = -536870212;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)createRemoteDevice:(id)a3 deviceID:(unint64_t)a4 property:(id)a5
{
  id v8;
  id v9;
  __int128 v10;
  void *v11;
  void *v12;
  NSMutableDictionary *endpointTimeSyncEnabled;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSMutableDictionary *v23;
  void *v24;
  BOOL v25;
  objc_super v27;
  _BYTE buf[12];
  __int16 v29;
  int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[2];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("BT-AACP"), CFSTR("Transport"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24DB1FF58, CFSTR("RequestTimeout"));
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v45 + 15) = v10;
  v44 = v10;
  v45[0] = v10;
  v42 = v10;
  v43 = v10;
  v40 = v10;
  v41 = v10;
  v38 = v10;
  v39 = v10;
  v36 = v10;
  v37 = v10;
  v34 = v10;
  v35 = v10;
  v32 = v10;
  v33 = v10;
  v31 = v10;
  objc_msgSend(v8, "endpointID");
  if (!BTDeviceGetAddressString())
  {
    memset(buf, 170, 6);
    if (!BTDeviceAddressFromString())
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("BT_ADDR"));

    }
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TimeSyncEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "unsignedIntValue"))
  {
    endpointTimeSyncEnabled = self->_endpointTimeSyncEnabled;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v8, "endpointID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](endpointTimeSyncEnabled, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(MEMORY[0x24BDBD1C8], "isEqual:", v15) & 1) != 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    v16 = objc_msgSend(v8, "endpointID");
    v17 = BTAccessoryManagerRemoteTimeSyncEnable();
    if (v17)
    {
      v18 = v17;
      RemoteHIDLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v16;
        v29 = 1024;
        v30 = v18;
        v20 = "Couldn't enable timesync for device:%p status:%d";
        v21 = v19;
        v22 = 18;
LABEL_12:
        _os_log_impl(&dword_21960D000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
    else
    {
      v23 = self->_endpointTimeSyncEnabled;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v8, "endpointID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v24);

      RemoteHIDLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v16;
        v20 = "Enabled timesync for device:%p";
        v21 = v19;
        v22 = 12;
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
LABEL_15:
  v27.receiver = self;
  v27.super_class = (Class)HIDRemoteDeviceAACPServer;
  v25 = -[HIDRemoteDeviceServer createRemoteDevice:deviceID:property:](&v27, sel_createRemoteDevice_deviceID_property_, v8, a4, v9);

  return v25;
}

- (int)remoteDeviceGetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6
{
  char v7;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int v17;
  NSObject *v19;

  v7 = a4;
  v10 = (objc_class *)MEMORY[0x24BDBCEC8];
  v11 = a6;
  v12 = a3;
  v13 = objc_retainAutorelease((id)objc_msgSend([v10 alloc], "initWithLength:", 10));
  v14 = objc_msgSend(v13, "bytes");
  *(_DWORD *)(v14 + 4) = *(_DWORD *)(v14 + 4) & 0xFF800000 | objc_msgSend(v12, "deviceID") & 0x7F | 0x80300;
  *(_BYTE *)(v14 + 8) = v7;
  *(_BYTE *)(v14 + 9) = a5;
  v15 = objc_msgSend(v12, "endpointID");
  v16 = objc_retainAutorelease(v13);
  LODWORD(self) = -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:](self, "sendMessageBTDevice:data:size:transportVersion:side:", v15, objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), objc_msgSend(v12, "transportVersion"), objc_msgSend(v12, "side"));

  if ((_DWORD)self)
  {
    RemoteHIDLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer remoteDeviceGetReport:type:reportID:report:].cold.1();

    v17 = -536870212;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)syncRemoteTimestamp:(unint64_t)a3 forEndpoint:(id)a4
{
  uint64_t v6;
  TSUserFilteredClock **p_timeSyncClock;
  TSUserFilteredClock *timeSyncClock;
  unint64_t v9;
  unint64_t denom;
  uint64_t numer;
  NSObject *v12;
  unint64_t v14;
  unint64_t v15;
  const char *v16;
  mach_timebase_info info;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  v6 = mach_absolute_time();
  mach_timebase_info(&info);
  p_timeSyncClock = &self->_timeSyncClock;
  timeSyncClock = self->_timeSyncClock;
  if (timeSyncClock && -[TSUserFilteredClock lockState](timeSyncClock, "lockState") == 2)
  {
    v9 = -[TSUserFilteredClock convertFromDomainToMachAbsoluteTime:](*p_timeSyncClock, "convertFromDomainToMachAbsoluteTime:", a3);
    numer = info.numer;
    denom = info.denom;
    RemoteHIDLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = v9 - v6;
      if (v6 > v9)
        v14 = v6 - v9;
      v15 = v14 * numer;
      v16 = "-";
      if (v6 > v9)
        v16 = "+";
      *(_DWORD *)buf = 134219010;
      v19 = a3;
      v20 = 2048;
      v21 = v6;
      v22 = 2048;
      v23 = v9;
      v24 = 2080;
      v25 = v16;
      v26 = 2048;
      v27 = v15 / denom;
      _os_log_debug_impl(&dword_21960D000, v12, OS_LOG_TYPE_DEBUG, "W2 btclk(ns):%llu local abs:%llu Synced ts:%llu remote->local latency(ns):%s%llu", buf, 0x34u);
    }
  }
  else
  {
    RemoteHIDLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer syncRemoteTimestamp:forEndpoint:].cold.1((id *)p_timeSyncClock, v12);
    v9 = 0;
  }

  return v9;
}

- (os_state_data_s)stateHandler:(os_state_hints_s *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  os_state_data_s *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  _QWORD v21[6];
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = (id)0xAAAAAAAAAAAAAAAALL;
  v29 = (id)objc_opt_new();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v23 = 0;
  if (a3->var2 - 4 < 0xFFFFFFFE)
  {
    v7 = 0;
    v10 = 0;
    goto LABEL_9;
  }
  -[HIDRemoteDeviceServer endpoints](self, "endpoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __42__HIDRemoteDeviceAACPServer_stateHandler___block_invoke;
  v21[3] = &unk_24DB1F200;
  v21[4] = v22;
  v21[5] = &v24;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v21);

  v6 = v25[5];
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  v9 = v8;
  if (!v7)
  {
    v10 = 0;
    if (!v8)
      goto LABEL_9;
    goto LABEL_6;
  }
  v10 = (os_state_data_s *)malloc_type_calloc(1uLL, objc_msgSend(v7, "length") + 200, 0x2C60EA41uLL);
  if (v10)
  {
    __strlcpy_chk();
    v10->var0 = 1;
    v10->var1.var1 = objc_msgSend(v7, "length");
    v11 = objc_retainAutorelease(v7);
    memcpy(v10->var4, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  }
  if (v9)
  {
LABEL_6:
    RemoteHIDLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[HIDRemoteDeviceAACPServer stateHandler:].cold.1((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);

  }
LABEL_9:

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

uint64_t __42__HIDRemoteDeviceAACPServer_stateHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend(a3, "copyState");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (OS_dispatch_queue)btQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBtQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btQueue, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_endpointTimeSyncEnabled, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_coreTimeSyncManager, 0);
  objc_storeStrong((id *)&self->_decodeBuff, 0);
}

- (void)btSessionInit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "BTLocalDeviceGetConnectedDevices:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)btSessionInit:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "BTLocalDeviceGetDefault:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)btSessionInit:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "BTServiceAddCallbacks:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)btSessionInit:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "BTAccessoryManagerAddCallbacks:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)btSessionInit:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "BTAccessoryManagerGetDefault:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addBTDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21960D000, v0, v1, "addDevice device:%p result:%d", v2, v3);
  OUTLINED_FUNCTION_7();
}

- (void)addBTDevice:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "BTAccessoryManagerRegisterCustomMessageClient 3:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addBTDevice:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "BTAccessoryManagerRegisterCustomMessageClient 2:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addBTDevice:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "BTAccessoryManagerRegisterCustomMessageClient 1:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21960D000, v0, v1, "BTAccessoryManagerSendCustomMessage fail - device:%p result:%d", v2, v3);
  OUTLINED_FUNCTION_7();
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21960D000, v0, v1, "encodedData alloc fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21960D000, v0, v1, "encode fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21960D000, v0, v1, "encodeHeader fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21960D000, v0, v1, "encode size fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21960D000, v0, v1, "encodeHeader size fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)btDeviceMessageHandler:(uint64_t)a3 type:(uint64_t)a4 data:(uint64_t)a5 size:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_21960D000, a2, a3, "Unknown device:%p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)btDeviceMessageHandler:type:data:size:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21960D000, v0, v1, "decode fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)btDeviceMessageHandler:type:data:size:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21960D000, v0, v1, "decodeHeader fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)btAccessoryEventHandler:event:state:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21960D000, v0, v1, "Couldn't create TSClockManager!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)btAccessoryEventHandler:event:state:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21960D000, v0, v1, "Couldn't create TSUserFilteredClock!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)btAccessoryEventHandler:event:state:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21960D000, v0, v1, "BTAccessoryManagerGetTimeSyncId failed result:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)remoteDeviceSetReport:type:reportID:report:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21960D000, v0, v1, "SetReport device:%p status:%d", v2, v3);
  OUTLINED_FUNCTION_7();
}

- (void)remoteDeviceGetReport:type:reportID:report:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21960D000, v0, v1, "GetReport device:%p status:%d", v2, v3);
  OUTLINED_FUNCTION_7();
}

- (void)syncRemoteTimestamp:(id *)a1 forEndpoint:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(*a1, "clockIdentifier");
  v5 = objc_msgSend(*a1, "lockState");
  v6 = 134218240;
  v7 = v4;
  v8 = 1024;
  v9 = v5;
  _os_log_error_impl(&dword_21960D000, a2, OS_LOG_TYPE_ERROR, "Timesync: not locked, clockID: 0x%llx state: %d", (uint8_t *)&v6, 0x12u);
}

- (void)stateHandler:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_21960D000, a2, a3, "Plist Serialization error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

@end
