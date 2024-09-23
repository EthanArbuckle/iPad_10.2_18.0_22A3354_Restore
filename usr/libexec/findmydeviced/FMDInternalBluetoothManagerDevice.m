@implementation FMDInternalBluetoothManagerDevice

- (FMDInternalBluetoothManagerDevice)init
{
  FMDInternalBluetoothManagerDevice *v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDInternalBluetoothManagerDevice;
  v2 = -[FMDInternalBluetoothManagerDevice init](&v7, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("FMDInternalBluetoothManagerDevice", 0);
    -[FMDInternalBluetoothManagerDevice setSerialQueue:](v2, "setSerialQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMDInternalBluetoothManagerDevice setBeaconsByIdentifier:](v2, "setBeaconsByIdentifier:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMDInternalBluetoothManagerDevice setAudioChannelsByName:](v2, "setAudioChannelsByName:", v5);

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  FMDInternalBluetoothManagerDevice *v5;
  uint64_t v6;
  FMDInternalBluetoothManagerDevice *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v14;

  v5 = (FMDInternalBluetoothManagerDevice *)a3;
  if (v5 == self)
  {
    v12 = 1;
  }
  else
  {
    v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice address](v7, "address"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice address](self, "address"));
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice audioChannelInfo](self, "audioChannelInfo"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice audioChannelInfo](v7, "audioChannelInfo"));
        v12 = objc_msgSend(v10, "isEqualToArray:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)FMDInternalBluetoothManagerDevice;
      v12 = -[FMDInternalBluetoothManagerDevice isEqual:](&v14, "isEqual:", v5);
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice address](self, "address"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (FMDIdentifiable)accessoryIdentifier
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)FMDAccessoryIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice address](self, "address"));
  v5 = objc_msgSend(v3, "initWithAddress:", v4);

  return (FMDIdentifiable *)v5;
}

- (NSNumber)bluetoothMajorDeviceClass
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v2, "majorClass")));

  return (NSNumber *)v3;
}

- (NSNumber)bluetoothMinorDeviceClass
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v2, "minorClass")));

  return (NSNumber *)v3;
}

- (NSNumber)bluetoothDeviceVendor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v2, "vendorId")));

  return (NSNumber *)v3;
}

- (NSNumber)bluetoothDeviceProductId
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v2, "productId")));

  return (NSNumber *)v3;
}

- (NSString)address
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "address"));

  return (NSString *)v3;
}

- (NSString)scoUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scoUID"));

  return (NSString *)v3;
}

- (NSNumber)bluetoothConnected
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "connected")));

  }
  else
  {
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSString)name
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (NSDictionary)accessoryInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessoryInfo"));

  return (NSDictionary *)v3;
}

- (BOOL)isTemporaryPaired
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice bluetoothDevice](self, "bluetoothDevice"));
  v3 = objc_msgSend(v2, "isTemporaryPaired");

  return v3;
}

- (FMDBluetoothFrameworkDevice)bluetoothDevice
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100014A20;
  v11 = sub_100014A30;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014A38;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (FMDBluetoothFrameworkDevice *)v4;
}

- (void)addBLEBeacon:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  FMDInternalBluetoothManagerDevice *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = objc_msgSend(v5, "isValid");

  if (v6)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543874;
      v13 = objc_opt_class(self, v9);
      v14 = 2050;
      v15 = self;
      v16 = 2050;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p> addBLEBeacon: <%{public}p>", (uint8_t *)&v12, 0x20u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice beaconsByIdentifier](self, "beaconsByIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, v11);

  }
}

- (void)addAudioChannelStatus:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  FMDInternalBluetoothManagerDevice *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "channelName"));

  if (v5)
  {
    v6 = sub_1000031B8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138544130;
      v12 = objc_opt_class(self, v8);
      v13 = 2050;
      v14 = self;
      v15 = 2050;
      v16 = v4;
      v17 = 2112;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p> addAudioChannelStatus: <%{public}p> %@", (uint8_t *)&v11, 0x2Au);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice audioChannelsByName](self, "audioChannelsByName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "channelName"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v10);

  }
}

- (NSNumber)accessoryRSSI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice primaryBeacon](self, "primaryBeacon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rssi"));

  return (NSNumber *)v3;
}

- (NSDate)rssiUpdateDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice primaryBeacon](self, "primaryBeacon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "updateDate"));

  return (NSDate *)v3;
}

- (NSArray)audioChannelInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice audioChannelsByName](self, "audioChannelsByName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return (NSArray *)v3;
}

- (NSNumber)bluetoothColorCode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice primaryBeacon](self, "primaryBeacon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorCode"));

  return (NSNumber *)v3;
}

- (FMDAccessoryStyleDescriptor)styleDescriptor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice primaryBeacon](self, "primaryBeacon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "styleDescriptor"));

  return (FMDAccessoryStyleDescriptor *)v3;
}

- (id)primaryBeacon
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice beacons](self, "beacons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDBLEAudioAdvertisementParser primaryBeaconForBeacons:](FMDBLEAudioAdvertisementParser, "primaryBeaconForBeacons:", v2));

  return v3;
}

- (NSArray)beacons
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice beaconsByIdentifier](self, "beaconsByIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return (NSArray *)v3;
}

- (NSString)serialNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice address](self, "address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "externalAccessoryForMacAddress:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
  return (NSString *)v6;
}

- (NSString)firmwareRevision
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice address](self, "address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "externalAccessoryForMacAddress:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firmwareRevision"));
  return (NSString *)v6;
}

- (NSString)hardwareRevision
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDInternalBluetoothManagerDevice address](self, "address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "externalAccessoryForMacAddress:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hardwareRevision"));
  return (NSString *)v6;
}

- (NSArray)batteryInfo
{
  return 0;
}

+ (id)externalAccessoryForMacAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedAccessories"));

  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100225EEC((uint64_t)v5, v7);

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100014A20;
  v18 = sub_100014A30;
  v19 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000150A4;
  v11[3] = &unk_1002C1828;
  v8 = v3;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)setBluetoothDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothDevice, a3);
}

- (NSString)advertisementStatusKey
{
  return self->_advertisementStatusKey;
}

- (void)setAdvertisementStatusKey:(id)a3
{
  objc_storeStrong((id *)&self->_advertisementStatusKey, a3);
}

- (NSMutableDictionary)beaconsByIdentifier
{
  return self->_beaconsByIdentifier;
}

- (void)setBeaconsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_beaconsByIdentifier, a3);
}

- (NSMutableDictionary)audioChannelsByName
{
  return self->_audioChannelsByName;
}

- (void)setAudioChannelsByName:(id)a3
{
  objc_storeStrong((id *)&self->_audioChannelsByName, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_audioChannelsByName, 0);
  objc_storeStrong((id *)&self->_beaconsByIdentifier, 0);
  objc_storeStrong((id *)&self->_advertisementStatusKey, 0);
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
}

@end
