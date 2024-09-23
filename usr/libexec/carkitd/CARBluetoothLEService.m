@implementation CARBluetoothLEService

- (CARBluetoothLEService)initWithPeripheral:(id)a3 serviceUUID:(id)a4 psmCharacteristicUUID:(id)a5
{
  id v9;
  id v10;
  id v11;
  CARBluetoothLEService *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  CARBluetoothLEConnectionState *currentConnectionState;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CARBluetoothLEService;
  v12 = -[CARBluetoothLEService init](&v19, "init");
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("com.apple.carkit.BLE_service", v14);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v12->_peripheral, a3);
    objc_msgSend(v9, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_serviceUUID, a4);
    objc_storeStrong((id *)&v12->_psmCharacteristicUUID, a5);
    currentConnectionState = v12->_currentConnectionState;
    v12->_currentConnectionState = 0;

    -[CARBluetoothLEService _discoverService](v12, "_discoverService");
  }

  return v12;
}

- (void)_discoverService
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CARBluetoothLEService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DDCC;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (CARBluetoothLEChannel)activeChannel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEService currentConnectionState](self, "currentConnectionState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serviceChannel"));

  return (CARBluetoothLEChannel *)v3;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CARBluetoothLEService *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CARBluetoothLEService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E008;
  block[3] = &unk_1000B53B8;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[CARBluetoothLEService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E3EC;
  block[3] = &unk_1000B53B8;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[CARBluetoothLEService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E7D4;
  block[3] = &unk_1000B53B8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  CARBluetoothLEService *v15;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[CARBluetoothLEService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EB8C;
  block[3] = &unk_1000B53B8;
  v13 = v7;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (CBUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (CBUUID)psmCharacteristicUUID
{
  return self->_psmCharacteristicUUID;
}

- (CARBluetoothLEServiceDelegate)serviceDelegate
{
  return (CARBluetoothLEServiceDelegate *)objc_loadWeakRetained((id *)&self->_serviceDelegate);
}

- (void)setServiceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_serviceDelegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (CARBluetoothLEConnectionState)currentConnectionState
{
  return self->_currentConnectionState;
}

- (void)setCurrentConnectionState:(id)a3
{
  objc_storeStrong((id *)&self->_currentConnectionState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnectionState, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_serviceDelegate);
  objc_storeStrong((id *)&self->_psmCharacteristicUUID, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end
