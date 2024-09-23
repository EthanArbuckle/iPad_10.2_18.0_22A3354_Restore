@implementation IOSBeacon

- (void).cxx_destruct
{
  BeaconSensor *value;

  value = self->_beaconSensor.__ptr_.__value_;
  self->_beaconSensor.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(BeaconSensor *, SEL))(*(_QWORD *)value + 8))(value, a2);
  objc_storeStrong((id *)&self->_scanResultQueue, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;

  v4 = a3;
  if (qword_100417ED8 != -1)
    dispatch_once(&qword_100417ED8, &stru_100404BE0);
  v5 = (id)qword_100417EE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(v4, "state");
    v7 = -[CBCentralManager state](self->_bluetoothManager, "state");
    v8 = 134218240;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Central manager state=%ld, Bluetooth Manager state=%ld", (uint8_t *)&v8, 0x16u);
  }

}

- (void)dealloc
{
  NSObject *scanResultQueue;
  IOSBeacon *v3;
  objc_super v4;
  _QWORD block[4];
  IOSBeacon *v6;

  scanResultQueue = self->_scanResultQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000BDB40;
  block[3] = &unk_100404BB0;
  v6 = self;
  v3 = v6;
  dispatch_sync(scanResultQueue, block);

  v4.receiver = v3;
  v4.super_class = (Class)IOSBeacon;
  -[IOSBeacon dealloc](&v4, "dealloc");
}

- (IOSBeacon)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOSBeacon;
  if (-[IOSBeacon init](&v3, "init"))
    operator new();
  return 0;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (BOOL)sensorPresent
{
  NSObject *v3;
  unsigned int v4;
  _DWORD v6[2];

  if (qword_100417ED8 != -1)
    dispatch_once(&qword_100417ED8, &stru_100404BE0);
  v3 = (id)qword_100417EE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = -[CBCentralManager state](self->_bluetoothManager, "state");
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Checking bluetooth sensor presence, state=%d", (uint8_t *)v6, 8u);
  }

  return 1;
}

- (void)start
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CBCentralManager *bluetoothManager;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[4];
  _QWORD v14[4];
  _BYTE v15[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(0);
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v5)));
        objc_msgSend(0, "addObject:", v6);

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v3);
  }
  bluetoothManager = self->_bluetoothManager;
  v13[0] = CBCentralManagerScanOptionAllowDuplicatesKey;
  v13[1] = CBCentralManagerScanOptionIsPrivilegedDaemonKey;
  v14[0] = &__kCFBooleanTrue;
  v14[1] = &__kCFBooleanTrue;
  v13[2] = CBCentralManagerScanOptionScanInterval;
  v13[3] = CBCentralManagerScanOptionScanWindow;
  v14[2] = &off_10040B190;
  v14[3] = &off_10040B190;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
  -[CBCentralManager scanForPeripheralsWithServices:options:](bluetoothManager, "scanForPeripheralsWithServices:options:", 0, v8);

}

- (void)stop
{
  -[CBCentralManager stopScan](self->_bluetoothManager, "stopScan");
}

- (void)getSensor
{
  return self->_beaconSensor.__ptr_.__value_;
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  (*(void (**)(BeaconSensor *, id, id, id))(*(_QWORD *)self->_beaconSensor.__ptr_.__value_ + 56))(self->_beaconSensor.__ptr_.__value_, a4, a5, a6);
}

@end
