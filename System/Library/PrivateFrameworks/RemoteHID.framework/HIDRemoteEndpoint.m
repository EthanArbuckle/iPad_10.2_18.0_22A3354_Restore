@implementation HIDRemoteEndpoint

- (HIDRemoteEndpoint)initWithID:(unint64_t)a3
{
  HIDRemoteEndpoint *v4;
  HIDRemoteEndpoint *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *devices;
  uint64_t v8;
  NSMutableArray *prevDeviceLog;
  HIDRemoteEndpoint *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HIDRemoteEndpoint;
  v4 = -[HIDRemoteEndpoint init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_endpointID = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    devices = v5->_devices;
    v5->_devices = v6;

    v8 = objc_opt_new();
    prevDeviceLog = v5->_prevDeviceLog;
    v5->_prevDeviceLog = (NSMutableArray *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)getDevice:(unint64_t)a3
{
  NSMutableDictionary *devices;
  void *v4;
  void *v5;

  devices = self->_devices;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](devices, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addDevice:(id)a3
{
  NSMutableDictionary *devices;
  void *v5;
  id v6;

  v6 = a3;
  -[HIDRemoteEndpoint removeDeviceID:](self, "removeDeviceID:", objc_msgSend(v6, "deviceID"));
  devices = self->_devices;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "deviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v6, v5);

  objc_msgSend(v6, "setEndpointID:", -[HIDRemoteEndpoint endpointID](self, "endpointID"));
}

- (void)removeDevice:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *devices;
  void *v7;
  void *v8;
  NSObject *v9;
  NSMutableArray *prevDeviceLog;
  void *v11;
  uint64_t *p_devices;
  NSMutableDictionary *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    devices = self->_devices;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "deviceID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](devices, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      RemoteHIDLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412546;
        v18 = v5;
        v19 = 2048;
        v20 = -[HIDRemoteEndpoint endpointID](self, "endpointID");
        _os_log_impl(&dword_21960D000, v9, OS_LOG_TYPE_DEFAULT, "Remove device:%@ for endpoint:%llu", (uint8_t *)&v17, 0x16u);
      }

      if ((unint64_t)-[NSMutableArray count](self->_prevDeviceLog, "count") >= 0x32)
        -[NSMutableArray removeObjectAtIndex:](self->_prevDeviceLog, "removeObjectAtIndex:", 0);
      prevDeviceLog = self->_prevDeviceLog;
      objc_msgSend(v5, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](prevDeviceLog, "addObject:", v11);

      objc_msgSend(v5, "cancel");
    }
  }
  v13 = self->_devices;
  p_devices = (uint64_t *)&self->_devices;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "deviceID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", 0, v14);

  RemoteHIDLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[HIDRemoteEndpoint removeDevice:].cold.1(p_devices, v15, v16);

}

- (void)removeDeviceID:(unint64_t)a3
{
  NSMutableDictionary *devices;
  void *v5;
  id v6;

  devices = self->_devices;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](devices, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HIDRemoteEndpoint removeDevice:](self, "removeDevice:", v5);

}

- (void)removeAllDevices
{
  NSObject *v3;
  NSMutableDictionary *devices;
  _QWORD v5[5];
  uint8_t buf[4];
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  RemoteHIDLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = -[HIDRemoteEndpoint endpointID](self, "endpointID");
    _os_log_impl(&dword_21960D000, v3, OS_LOG_TYPE_DEFAULT, "Removing all devices for endpoint:%llu", buf, 0xCu);
  }

  devices = self->_devices;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__HIDRemoteEndpoint_removeAllDevices__block_invoke;
  v5[3] = &unk_24DB1F190;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devices, "enumerateKeysAndObjectsUsingBlock:", v5);
  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
}

void __37__HIDRemoteEndpoint_removeAllDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 0x32)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectAtIndex:", 0);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v7, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(v7, "cancel");
}

- (id)copyState
{
  void *v3;
  void *v4;
  NSMutableDictionary *devices;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  devices = self->_devices;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __30__HIDRemoteEndpoint_copyState__block_invoke;
  v9[3] = &unk_24DB1F190;
  v10 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devices, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HIDRemoteEndpoint endpointID](self, "endpointID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("EndpointID"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("RemoteDevices"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_prevDeviceLog, CFSTR("PreviousRemoteDevices"));

  return v3;
}

void __30__HIDRemoteEndpoint_copyState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "description");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (unint64_t)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(unint64_t)a3
{
  self->_endpointID = a3;
}

- (unsigned)primarySide
{
  return self->_primarySide;
}

- (void)setPrimarySide:(unsigned __int8)a3
{
  self->_primarySide = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevDeviceLog, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

- (void)removeDevice:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_13(&dword_21960D000, a2, a3, "Remaining devices:%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_7();
}

@end
