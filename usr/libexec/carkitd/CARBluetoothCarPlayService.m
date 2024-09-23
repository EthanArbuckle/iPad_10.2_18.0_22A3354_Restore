@implementation CARBluetoothCarPlayService

- (CARBluetoothCarPlayService)initWithPeripheral:(id)a3
{
  id v5;
  CARBluetoothCarPlayService *v6;
  CARBluetoothCarPlayService *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  void *v12;
  void *v13;
  CARBluetoothLEService *v14;
  CARBluetoothLEService *service;
  CARPropertyListMessenger *v16;
  CARPropertyListMessenger *plistMessenger;
  id v18;
  uint64_t v19;
  NSDictionary *messageClassesForIdentifiers;
  NSMutableDictionary *v21;
  NSMutableDictionary *activeMessagesForDatas;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CARBluetoothCarPlayService;
  v6 = -[CARBluetoothCarPlayService init](&v24, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peripheral, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.carkit.BLE_service", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDLECarPlayServiceString));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDLECarPlayL2CAPPSMCharacteristicString));
    v14 = -[CARBluetoothLEService initWithPeripheral:serviceUUID:psmCharacteristicUUID:]([CARBluetoothLEService alloc], "initWithPeripheral:serviceUUID:psmCharacteristicUUID:", v5, v12, v13);
    service = v7->_service;
    v7->_service = v14;

    -[CARBluetoothLEService setServiceDelegate:](v7->_service, "setServiceDelegate:", v7);
    v16 = objc_alloc_init(CARPropertyListMessenger);
    plistMessenger = v7->_plistMessenger;
    v7->_plistMessenger = v16;

    -[CARPropertyListMessenger setMessageReceiver:](v7->_plistMessenger, "setMessageReceiver:", v7);
    v18 = sub_10002F2DC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    messageClassesForIdentifiers = v7->_messageClassesForIdentifiers;
    v7->_messageClassesForIdentifiers = (NSDictionary *)v19;

    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeMessagesForDatas = v7->_activeMessagesForDatas;
    v7->_activeMessagesForDatas = v21;

  }
  return v7;
}

- (BOOL)isActive
{
  CARBluetoothCarPlayService *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100057978;
  v5[3] = &unk_1000B5750;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)sendMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CARBluetoothCarPlayService *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100057A68;
  v7[3] = &unk_1000B5390;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_queue_popMessageForData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService activeMessagesForDatas](self, "activeMessagesForDatas"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService activeMessagesForDatas](self, "activeMessagesForDatas"));
    objc_msgSend(v8, "removeObjectForKey:", v4);

  }
  return v7;
}

- (void)_queue_handleFailedToSendMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_100056C84(2uLL);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_10006E950((uint64_t)v4, v7);

  v8 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService serviceDelegate](self, "serviceDelegate"));
  v9 = (void *)v8;
  if (v8 && (objc_opt_respondsToSelector(v8, "carPlayService:didFailToSendMessage:") & 1) != 0)
    objc_msgSend(v9, "carPlayService:didFailToSendMessage:", self, v4);

}

- (void)propertyListMessenger:(id)a3 didReceiveMessageWithIdentifier:(unsigned __int16)a4 contents:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  unsigned __int16 v12;

  v7 = a5;
  v8 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057E20;
  block[3] = &unk_1000B7558;
  v12 = a4;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)bluetoothLEService:(id)a3 didOpenChannel:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CARBluetoothCarPlayService *v10;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005805C;
  v8[3] = &unk_1000B5390;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)bluetoothLEService:(id)a3 didCloseChannel:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CARBluetoothCarPlayService *v10;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000581DC;
  v8[3] = &unk_1000B5390;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)bluetoothLEChannel:(id)a3 didSendData:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100058430;
  v8[3] = &unk_1000B5390;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)bluetoothLEChannel:(id)a3 didFailToSendData:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100058544;
  v8[3] = &unk_1000B5390;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)bluetoothLEChannel:(id)a3 didReceiveData:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[CARBluetoothCarPlayService queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005862C;
  v8[3] = &unk_1000B5390;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (CARBluetoothCarPlayServiceDelegate)serviceDelegate
{
  return (CARBluetoothCarPlayServiceDelegate *)objc_loadWeakRetained((id *)&self->_serviceDelegate);
}

- (void)setServiceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_serviceDelegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CARBluetoothLEService)service
{
  return self->_service;
}

- (CARPropertyListMessenger)plistMessenger
{
  return self->_plistMessenger;
}

- (NSDictionary)messageClassesForIdentifiers
{
  return self->_messageClassesForIdentifiers;
}

- (NSMutableDictionary)activeMessagesForDatas
{
  return self->_activeMessagesForDatas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeMessagesForDatas, 0);
  objc_storeStrong((id *)&self->_messageClassesForIdentifiers, 0);
  objc_storeStrong((id *)&self->_plistMessenger, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_serviceDelegate);
  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end
