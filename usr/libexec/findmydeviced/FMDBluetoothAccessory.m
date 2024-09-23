@implementation FMDBluetoothAccessory

- (FMDBluetoothAccessory)init
{
  FMDBluetoothAccessory *v2;
  FMDCommandContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDBluetoothAccessory;
  v2 = -[FMDBluetoothAccessory init](&v5, "init");
  if (v2)
  {
    v3 = -[FMDCommandContext initWithAccessory:]([FMDCommandContext alloc], "initWithAccessory:", v2);
    -[FMDBluetoothAccessory setCommandContext:](v2, "setCommandContext:", v3);

  }
  return v2;
}

- (FMDBluetoothAccessory)initWithBluetoothManagerDevice:(id)a3
{
  id v4;
  FMDBluetoothAccessory *v5;
  FMDBluetoothAccessory *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FMDAccessorySerialNumbers *v20;
  void *v21;
  FMDAccessorySerialNumbers *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;

  v4 = a3;
  v5 = -[FMDBluetoothAccessory init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[FMDBluetoothAccessory setBluetoothManagerDevice:](v5, "setBluetoothManagerDevice:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothConnected"));
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[FMDBluetoothAccessory setLastActiveTime:](v6, "setLastActiveTime:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[FMDBluetoothAccessory setName:](v6, "setName:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothMajorDeviceClass"));
    -[FMDBluetoothAccessory setMajorDeviceClass:](v6, "setMajorDeviceClass:", objc_msgSend(v11, "unsignedIntValue"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothMinorDeviceClass"));
    -[FMDBluetoothAccessory setMinorDeviceClass:](v6, "setMinorDeviceClass:", objc_msgSend(v12, "unsignedIntValue"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scoUID"));
    -[FMDBluetoothAccessory setScoUID:](v6, "setScoUID:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "address"));
    -[FMDBluetoothAccessory setAddress:](v6, "setAddress:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));
    -[FMDBluetoothAccessory setSerialNumber:](v6, "setSerialNumber:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firmwareRevision"));
    -[FMDBluetoothAccessory setFirmwareRevision:](v6, "setFirmwareRevision:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hardwareRevision"));
    -[FMDBluetoothAccessory setHardwareRevision:](v6, "setHardwareRevision:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "beacons"));
    -[FMDBluetoothAccessory updateBeaconsWithArray:](v6, "updateBeaconsWithArray:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "audioChannelInfo"));
    -[FMDBluetoothAccessory updateAudioChannelsWithArray:](v6, "updateAudioChannelsWithArray:", v19);

    v20 = [FMDAccessorySerialNumbers alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryInfo"));
    v22 = -[FMDAccessorySerialNumbers initWithAccessoryInfo:](v20, "initWithAccessoryInfo:", v21);
    -[FMDBluetoothAccessory setSerialNumbers:](v6, "setSerialNumbers:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothColorCode"));
    -[FMDBluetoothAccessory setBluetoothColorCode:](v6, "setBluetoothColorCode:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "styleDescriptor"));
    -[FMDBluetoothAccessory setStyleDescriptor:](v6, "setStyleDescriptor:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "batteryInfo"));
    -[FMDBluetoothAccessory setBatteryInfo:](v6, "setBatteryInfo:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothDeviceVendor"));
    -[FMDBluetoothAccessory setDeviceVendor:](v6, "setDeviceVendor:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothDeviceProductId"));
    -[FMDBluetoothAccessory setDeviceProductId:](v6, "setDeviceProductId:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryRSSI"));
    -[FMDBluetoothAccessory setAccessoryRSSI:](v6, "setAccessoryRSSI:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rssiUpdateDate"));
    -[FMDBluetoothAccessory setRssiUpdateDate:](v6, "setRssiUpdateDate:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory address](v6, "address"));
    -[FMDBluetoothAccessory setAudioRoutingIdentifier:](v6, "setAudioRoutingIdentifier:", v30);

    v31 = objc_alloc((Class)FMDAccessoryIdentifier);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory address](v6, "address"));
    v33 = objc_msgSend(v31, "initWithAddress:", v32);
    -[FMDBluetoothAccessory setAccessoryIdentifier:](v6, "setAccessoryIdentifier:", v33);

  }
  return v6;
}

- (BOOL)updateWithBeaconingIdentifier:(id)a3
{
  -[FMDBluetoothAccessory setBaUUID:](self, "setBaUUID:", a3);
  return 1;
}

- (void)updateWithAccessory:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  FMDBluetoothAccessory *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  FMDBluetoothAccessory *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_self(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 134218240;
      v49 = self;
      v50 = 2048;
      v51 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) updateWithAccessory: FMDInternalAccessory(0x%lX)", buf, 0x16u);

    }
    v11 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastActiveTime"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory lastActiveTime](self, "lastActiveTime"));
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v17 = v16;

    if (v14 > v17)
      -[FMDBluetoothAccessory setLastActiveTime:](self, "setLastActiveTime:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rssiUpdateDate"));
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory rssiUpdateDate](self, "rssiUpdateDate"));
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    v23 = v22;

    if (v20 > v23)
      -[FMDBluetoothAccessory setRssiUpdateDate:](self, "setRssiUpdateDate:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "beacons"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allValues"));
    -[FMDBluetoothAccessory updateBeaconsWithArray:](self, "updateBeaconsWithArray:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serialNumbers"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory serialNumbers](self, "serialNumbers"));

    if (!v27)
      -[FMDBluetoothAccessory setSerialNumbers:](self, "setSerialNumbers:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothColorCode"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory bluetoothColorCode](self, "bluetoothColorCode"));

    if (!v29)
      -[FMDBluetoothAccessory setBluetoothColorCode:](self, "setBluetoothColorCode:", v28);
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "styleDescriptor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory styleDescriptor](self, "styleDescriptor"));

    if (!v31)
      -[FMDBluetoothAccessory setStyleDescriptor:](self, "setStyleDescriptor:", v30);
    v46 = (void *)v30;
    v47 = v12;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "audioAsset"));
    -[FMDBluetoothAccessory setAudioAsset:](self, "setAudioAsset:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playbackChannels"));
    -[FMDBluetoothAccessory updatePlaybackChannels:](self, "updatePlaybackChannels:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "baUUID"));
    v35 = sub_1000031B8();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (FMDBluetoothAccessory *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUIDString"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory baUUID](self, "baUUID"));
      v45 = v26;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      v44 = v4;
      v40 = v28;
      v41 = v18;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address"));
      *(_DWORD *)buf = 138413058;
      v49 = v37;
      v50 = 2112;
      v51 = v38;
      v52 = 2112;
      v53 = v39;
      v54 = 2112;
      v55 = v42;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory existing baUUID: %@, new baUUID %@ for %@, %@", buf, 0x2Au);

      v18 = v41;
      v28 = v40;
      v4 = v44;

      v26 = v45;
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory baUUID](self, "baUUID"));
    if (!v43)
      -[FMDBluetoothAccessory setBaUUID:](self, "setBaUUID:", v34);

  }
}

- (void)updateBeaconsWithArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory beacons](self, "beacons"));
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100068F68;
  v8[3] = &unk_1002C3CF0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  -[FMDBluetoothAccessory setBeacons:](self, "setBeacons:", v7);
}

- (void)updateAudioChannelsWithArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  FMDBluetoothAccessory *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioChannelInfo](self, "audioChannelInfo"));
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000691A0;
  v11[3] = &unk_1002C37F8;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

  -[FMDBluetoothAccessory setAudioChannelInfo:](self, "setAudioChannelInfo:", v7);
  v8 = sub_1000031B8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioChannelInfo](self, "audioChannelInfo"));
    *(_DWORD *)buf = 134218242;
    v14 = self;
    v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) updateWithAccessory audio channels: %@", buf, 0x16u);

  }
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (int64_t)connectionState
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory bluetoothManagerDevice](self, "bluetoothManagerDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bluetoothConnected"));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)currentLastActiveTime
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  int v12;
  FMDBluetoothAccessory *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory bluetoothManagerDevice](self, "bluetoothManagerDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bluetoothConnected"));
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[FMDBluetoothAccessory setLastActiveTime:](self, "setLastActiveTime:", v6);
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) updated lastActiveTime", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) fetching cached lastActiveTime", (uint8_t *)&v12, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory lastActiveTime](self, "lastActiveTime"));
  }
  return v6;
}

- (id)lastDiscoveryDate
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000694B4;
  v11 = sub_1000694C4;
  v12 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory beacons](self, "beacons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000694CC;
  v6[3] = &unk_1002C3D18;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)shouldStopSoundNow
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioChannelInfo](self, "audioChannelInfo"));
  v4 = objc_msgSend(v3, "count") == (id)2;

  v12 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioChannelInfo](self, "audioChannelInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100069624;
  v8[3] = &unk_1002C3D40;
  v8[4] = &v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v5;
}

- (BOOL)playingSound
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioChannelInfo](self, "audioChannelInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000697EC;
  v5[3] = &unk_1002C3D40;
  v5[4] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (unint64_t)audioSafetyStatusForAirPods:(id)a3 knownStatus:(unint64_t)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (uint64_t)objc_msgSend(a3, "inEar");
  v6 = 1;
  if (a4 != 2)
    v6 = 2;
  if (v5 == 500)
    v7 = 0;
  else
    v7 = a4;
  if (v5 != 2)
    v6 = v7;
  v8 = 3;
  if (v5 != 1)
    v8 = a4;
  if (!v5)
    v8 = 0;
  if (v5 <= 1)
    return v8;
  else
    return v6;
}

- (unint64_t)audioSafetyStatusForStereoPair:(id)a3
{
  char *v3;

  v3 = (char *)objc_msgSend(a3, "onHeadStatus");
  if ((unint64_t)(v3 - 1) > 3)
    return 0;
  else
    return qword_100253800[(_QWORD)(v3 - 1)];
}

- (unint64_t)audioSafetyStatus
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  FMDBluetoothAccessory *v17;
  __int16 v18;
  uint64_t v19;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioChannelInfo](self, "audioChannelInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  v5 = objc_msgSend(v4, "copy");

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100069AA8;
  v11[3] = &unk_1002C3D68;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v13[3];
    *(_DWORD *)buf = 134218240;
    v17 = self;
    v18 = 2048;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) audioSafetyStatus: %lu ", buf, 0x16u);
  }

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (BOOL)nearby
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory bluetoothManagerDevice](self, "bluetoothManagerDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "beacons"));
  if (objc_msgSend(v4, "count"))
    v5 = 1;
  else
    v5 = (id)-[FMDBluetoothAccessory connectionState](self, "connectionState") == (id)1;

  return v5;
}

- (id)dictionaryValue
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory bluetoothColorCode](self, "bluetoothColorCode"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("colorCode"));

  v5 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory batteryInfo](self, "batteryInfo", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "dictionaryValue"));
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("batteryInfo"));
  return v3;
}

- (NSURL)audioURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioAsset](self, "audioAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fileURL"));

  return (NSURL *)v3;
}

- (BOOL)updateAudioAsset:(id)a3
{
  -[FMDBluetoothAccessory setAudioAsset:](self, "setAudioAsset:", a3);
  return 1;
}

- (BOOL)updatePlaybackChannels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  FMDBluetoothAccessory *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory playbackChannels](self, "playbackChannels"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  v8 = objc_msgSend(v5, "isEqualToSet:", v7);
  -[FMDBluetoothAccessory setPlaybackChannels:](self, "setPlaybackChannels:", v4);
  -[FMDBluetoothAccessory updateAudioChannelPlayingState:](self, "updateAudioChannelPlayingState:", v4);

  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioChannelInfo](self, "audioChannelInfo"));
    v13 = 134218242;
    v14 = self;
    v15 = 2112;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDBluetoothAccessory(0x%lX) setting channels %@", (uint8_t *)&v13, 0x16u);

  }
  return v8 ^ 1;
}

- (void)updateAudioChannelPlayingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioChannelInfo](self, "audioChannelInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100069F70;
  v8[3] = &unk_1002C37F8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

- (unint64_t)category
{
  return 1;
}

- (FMDAudioAccessoryInfo)audioAccessoryInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc((Class)FMDAudioAccessoryInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory serialNumbers](self, "serialNumbers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemSerialNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory serialNumbers](self, "serialNumbers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leftBudSerialNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory serialNumbers](self, "serialNumbers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rightBudSerialNumber"));
  v10 = objc_msgSend(v3, "initWithSystemSerialNumber:leftSerialNumber:rightSerialNumber:", v5, v7, v9);

  return (FMDAudioAccessoryInfo *)v10;
}

- (FMDBluetoothAccessory)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDBluetoothAccessory *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSString *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSString *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSString *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  NSString *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  NSString *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  NSString *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  NSString *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  NSString *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  NSString *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  NSString *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSSet *v107;
  void *v108;
  NSString *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  NSString *v114;
  void *v115;
  void *v116;
  _QWORD v118[4];

  v4 = a3;
  v6 = -[FMDBluetoothAccessory init](self, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSString, v5);
    v8 = NSStringFromSelector("name");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDBluetoothAccessory setName:](v6, "setName:", v10);

    v12 = objc_opt_class(NSString, v11);
    v13 = NSStringFromSelector("address");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v14));
    -[FMDBluetoothAccessory setAddress:](v6, "setAddress:", v15);

    v17 = objc_opt_class(NSString, v16);
    v18 = NSStringFromSelector("scoUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v19));
    -[FMDBluetoothAccessory setScoUID:](v6, "setScoUID:", v20);

    v22 = objc_opt_class(NSNumber, v21);
    v23 = NSStringFromSelector("majorDeviceClass");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v24));
    -[FMDBluetoothAccessory setMajorDeviceClass:](v6, "setMajorDeviceClass:", objc_msgSend(v25, "unsignedIntValue"));

    v27 = objc_opt_class(NSNumber, v26);
    v28 = NSStringFromSelector("minorDeviceClass");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v29));
    -[FMDBluetoothAccessory setMinorDeviceClass:](v6, "setMinorDeviceClass:", objc_msgSend(v30, "unsignedIntValue"));

    v32 = objc_opt_class(NSNumber, v31);
    v33 = NSStringFromSelector("deviceVendor");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v34));
    -[FMDBluetoothAccessory setDeviceVendor:](v6, "setDeviceVendor:", v35);

    v37 = objc_opt_class(NSNumber, v36);
    v38 = NSStringFromSelector("deviceProductId");
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v39));
    -[FMDBluetoothAccessory setDeviceProductId:](v6, "setDeviceProductId:", v40);

    v42 = objc_opt_class(NSString, v41);
    v43 = NSStringFromSelector("serialNumber");
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v42, v44));
    -[FMDBluetoothAccessory setSerialNumber:](v6, "setSerialNumber:", v45);

    v47 = objc_opt_class(NSString, v46);
    v48 = NSStringFromSelector("firmwareRevision");
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v47, v49));
    -[FMDBluetoothAccessory setFirmwareRevision:](v6, "setFirmwareRevision:", v50);

    v52 = objc_opt_class(NSString, v51);
    v53 = NSStringFromSelector("hardwareRevision");
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v52, v54));
    -[FMDBluetoothAccessory setHardwareRevision:](v6, "setHardwareRevision:", v55);

    v56 = objc_alloc((Class)FMDAccessoryIdentifier);
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory address](v6, "address"));
    v58 = objc_msgSend(v56, "initWithAddress:", v57);
    -[FMDBluetoothAccessory setAccessoryIdentifier:](v6, "setAccessoryIdentifier:", v58);

    v60 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(FMDAccessorySerialNumbers, v59), CFSTR("serialNumbers"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    -[FMDBluetoothAccessory setSerialNumbers:](v6, "setSerialNumbers:", v61);

    v63 = objc_opt_class(NSNumber, v62);
    v64 = NSStringFromSelector("bluetoothColorCode");
    v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v63, v65));
    -[FMDBluetoothAccessory setBluetoothColorCode:](v6, "setBluetoothColorCode:", v66);

    v68 = objc_opt_class(FMDAccessoryStyleDescriptor, v67);
    v69 = NSStringFromSelector("styleDescriptor");
    v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v68, v70));
    -[FMDBluetoothAccessory setStyleDescriptor:](v6, "setStyleDescriptor:", v71);

    v73 = objc_opt_class(NSDate, v72);
    v74 = NSStringFromSelector("lastActiveTime");
    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v73, v75));
    -[FMDBluetoothAccessory setLastActiveTime:](v6, "setLastActiveTime:", v76);

    v78 = objc_opt_class(NSString, v77);
    v79 = NSStringFromSelector("audioRoutingIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v78, v80));
    -[FMDBluetoothAccessory setAudioRoutingIdentifier:](v6, "setAudioRoutingIdentifier:", v81);

    v83 = objc_opt_class(FMDStandardAsset, v82);
    v84 = NSStringFromSelector("audioAsset");
    v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v83, v85));
    -[FMDBluetoothAccessory setAudioAsset:](v6, "setAudioAsset:", v86);

    v88 = objc_opt_class(NSDate, v87);
    v89 = NSStringFromSelector("rssiUpdateDate");
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v88, v90));
    -[FMDBluetoothAccessory setRssiUpdateDate:](v6, "setRssiUpdateDate:", v91);

    v93 = objc_opt_class(NSNumber, v92);
    v94 = NSStringFromSelector("accessoryRSSI");
    v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v93, v95));
    -[FMDBluetoothAccessory setAccessoryRSSI:](v6, "setAccessoryRSSI:", v96);

    v118[0] = objc_opt_class(NSDictionary, v97);
    v118[1] = objc_opt_class(NSArray, v98);
    v118[2] = objc_opt_class(FMDBLEBeacon, v99);
    v118[3] = objc_opt_class(FMDBLEBeaconIdentifier, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v118, 4));
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v101));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v102, CFSTR("beaconsV2")));
    -[FMDBluetoothAccessory setBeacons:](v6, "setBeacons:", v103);

    v105 = objc_opt_class(NSArray, v104);
    v107 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v105, objc_opt_class(FMDBatteryInfo, v106), 0);
    v108 = (void *)objc_claimAutoreleasedReturnValue(v107);
    v109 = NSStringFromSelector("batteryInfo");
    v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v108, v110));
    -[FMDBluetoothAccessory setBatteryInfo:](v6, "setBatteryInfo:", v111);

    v113 = objc_opt_class(NSUUID, v112);
    v114 = NSStringFromSelector("baUUID");
    v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v113, v115));
    -[FMDBluetoothAccessory setBaUUID:](v6, "setBaUUID:", v116);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  NSString *v29;
  void *v30;
  void *v31;
  NSString *v32;
  void *v33;
  void *v34;
  NSString *v35;
  void *v36;
  void *v37;
  NSString *v38;
  void *v39;
  void *v40;
  NSString *v41;
  void *v42;
  void *v43;
  NSString *v44;
  void *v45;
  NSArray *batteryInfo;
  NSString *v47;
  void *v48;
  void *v49;
  NSString *v50;
  void *v51;
  void *v52;
  NSString *v53;
  void *v54;
  void *v55;
  NSString *v56;
  void *v57;
  void *v58;
  NSString *v59;
  void *v60;
  void *v61;
  void *v62;
  NSString *v63;
  void *v64;
  id v65;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory name](self, "name"));
  v6 = NSStringFromSelector("name");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "encodeObject:forKey:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory address](self, "address"));
  v9 = NSStringFromSelector("address");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "encodeObject:forKey:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory scoUID](self, "scoUID"));
  v12 = NSStringFromSelector("scoUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v4, "encodeObject:forKey:", v11, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[FMDBluetoothAccessory majorDeviceClass](self, "majorDeviceClass")));
  v15 = NSStringFromSelector("majorDeviceClass");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v4, "encodeObject:forKey:", v14, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[FMDBluetoothAccessory minorDeviceClass](self, "minorDeviceClass")));
  v18 = NSStringFromSelector("minorDeviceClass");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v4, "encodeObject:forKey:", v17, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory deviceVendor](self, "deviceVendor"));
  v21 = NSStringFromSelector("deviceVendor");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v4, "encodeObject:forKey:", v20, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory deviceProductId](self, "deviceProductId"));
  v24 = NSStringFromSelector("deviceProductId");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v4, "encodeObject:forKey:", v23, v25);

  v65 = (id)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory currentLastActiveTime](self, "currentLastActiveTime"));
  v26 = NSStringFromSelector("lastActiveTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  objc_msgSend(v4, "encodeObject:forKey:", v65, v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory serialNumber](self, "serialNumber"));
  v29 = NSStringFromSelector("serialNumber");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  objc_msgSend(v4, "encodeObject:forKey:", v28, v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory firmwareRevision](self, "firmwareRevision"));
  v32 = NSStringFromSelector("firmwareRevision");
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  objc_msgSend(v4, "encodeObject:forKey:", v31, v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory hardwareRevision](self, "hardwareRevision"));
  v35 = NSStringFromSelector("hardwareRevision");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  objc_msgSend(v4, "encodeObject:forKey:", v34, v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory serialNumbers](self, "serialNumbers"));
  v38 = NSStringFromSelector("serialNumbers");
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  objc_msgSend(v4, "encodeObject:forKey:", v37, v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory bluetoothColorCode](self, "bluetoothColorCode"));
  v41 = NSStringFromSelector("bluetoothColorCode");
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  objc_msgSend(v4, "encodeObject:forKey:", v40, v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory styleDescriptor](self, "styleDescriptor"));
  v44 = NSStringFromSelector("styleDescriptor");
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  objc_msgSend(v4, "encodeObject:forKey:", v43, v45);

  batteryInfo = self->_batteryInfo;
  v47 = NSStringFromSelector("batteryInfo");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  objc_msgSend(v4, "encodeObject:forKey:", batteryInfo, v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioRoutingIdentifier](self, "audioRoutingIdentifier"));
  v50 = NSStringFromSelector("audioRoutingIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  objc_msgSend(v4, "encodeObject:forKey:", v49, v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioAsset](self, "audioAsset"));
  v53 = NSStringFromSelector("audioAsset");
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  objc_msgSend(v4, "encodeObject:forKey:", v52, v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryRSSI](self, "accessoryRSSI"));
  v56 = NSStringFromSelector("accessoryRSSI");
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  objc_msgSend(v4, "encodeObject:forKey:", v55, v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory rssiUpdateDate](self, "rssiUpdateDate"));
  v59 = NSStringFromSelector("rssiUpdateDate");
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  objc_msgSend(v4, "encodeObject:forKey:", v58, v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory beacons](self, "beacons"));
  objc_msgSend(v4, "encodeObject:forKey:", v61, CFSTR("beaconsV2"));

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory baUUID](self, "baUUID"));
  v63 = NSStringFromSelector("baUUID");
  v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
  objc_msgSend(v4, "encodeObject:forKey:", v62, v64);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory address](self, "address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory deviceVendor](self, "deviceVendor"));
  v6 = objc_msgSend(v5, "unsignedIntValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory deviceProductId](self, "deviceProductId"));
  v8 = objc_msgSend(v7, "unsignedIntValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory baUUID](self, "baUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMDAccessory(0x%lx) name - %@, signature - %@, deviceVendor - %d, deviceProductId - %d, baUUID - %@"), self, v3, v4, v6, v8, v10));

  return (NSString *)v11;
}

- (id)deviceInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  NSMutableArray *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *k;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory name](self, "name"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("deviceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("udid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory address](self, "address"));
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("deviceDiscoveryId"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory connectionStatusString](self, "connectionStatusString"));
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("connectionStatus"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory currentLastActiveTime](self, "currentLastActiveTime"));
  v57 = v9;
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v9, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8188, CFSTR("lastActiveTime"));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryRSSI](self, "accessoryRSSI"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v11, CFSTR("accessoryRSSI"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory rssiUpdateDate](self, "rssiUpdateDate"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory rssiUpdateDate](self, "rssiUpdateDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v13, "fm_epoch")));
    objc_msgSend(v3, "fm_safeSetObject:forKey:", v14, CFSTR("accessoryRSSITimestamp"));

  }
  else
  {
    objc_msgSend(v3, "fm_safeSetObject:forKey:", &off_1002D8188, CFSTR("accessoryRSSITimestamp"));
  }

  v15 = objc_opt_new(NSMutableArray);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory batteryInfo](self, "batteryInfo"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i), "dictionaryValue"));
        -[NSMutableArray addObject:](v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v18);
  }

  objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("batteryInfo"));
  v22 = objc_opt_new(NSMutableArray);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory audioChannelInfo](self, "audioChannelInfo"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allValues"));

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(_QWORD *)v63 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j), "dictionaryValue"));
        -[NSMutableArray addObject:](v22, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v26);
  }

  objc_msgSend(v3, "setValue:forKey:", v22, CFSTR("audioChannels"));
  v30 = objc_opt_new(NSMutableArray);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory beacons](self, "beacons"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allValues"));

  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v34; k = (char *)k + 1)
      {
        if (*(_QWORD *)v59 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)k), "dictionaryValue"));
        -[NSMutableArray addObject:](v30, "addObject:", v37);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    }
    while (v34);
  }

  objc_msgSend(v3, "setValue:forKey:", v30, CFSTR("beacons"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("locationServicesEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("findMyiPhone"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("activationLock"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory firmwareRevision](self, "firmwareRevision"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v38, CFSTR("firmwareVersion"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "productVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v40);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Accessory"), CFSTR("deviceClass"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory deviceVendor](self, "deviceVendor"));
  v42 = objc_msgSend(v41, "unsignedIntValue");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory deviceProductId](self, "deviceProductId"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i_%i"), v42, objc_msgSend(v43, "unsignedIntValue")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("productType"));

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "platform"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_proxy"), v46));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory otherDeviceInfo](self, "otherDeviceInfo"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v48, CFSTR("otherDevices"));

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory serialNumbers](self, "serialNumbers"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "dictionaryValue"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v50, CFSTR("serialNumbers"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory bluetoothColorCode](self, "bluetoothColorCode"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v51, CFSTR("colorCode"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory styleDescriptor](self, "styleDescriptor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "dictionaryValue"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v53, CFSTR("accessoryStyle"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory baUUID](self, "baUUID"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "UUIDString"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("baUUID"), v55);

  return v3;
}

+ (id)volatileKeysToExcludeFromRegisterDigest
{
  _QWORD v3[7];

  v3[0] = CFSTR("connectionStatus");
  v3[1] = CFSTR("lastActiveTime");
  v3[2] = CFSTR("batteryInfo");
  v3[3] = CFSTR("accessoryRSSI");
  v3[4] = CFSTR("accessoryRSSITimestamp");
  v3[5] = CFSTR("beacons");
  v3[6] = CFSTR("firmwareVersion");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 7));
}

- (id)lastKnownLocationDeviceInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory name](self, "name"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("deviceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("udid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory currentLastActiveTime](self, "currentLastActiveTime"));
  v44 = v7;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v7, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8188, CFSTR("lastActiveTime"));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryRSSI](self, "accessoryRSSI"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v9, CFSTR("accessoryRSSI"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory rssiUpdateDate](self, "rssiUpdateDate"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory rssiUpdateDate](self, "rssiUpdateDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v11, "fm_epoch")));
    objc_msgSend(v3, "fm_safeSetObject:forKey:", v12, CFSTR("accessoryRSSITimestamp"));

  }
  else
  {
    objc_msgSend(v3, "fm_safeSetObject:forKey:", &off_1002D8188, CFSTR("accessoryRSSITimestamp"));
  }

  v13 = objc_opt_new(NSMutableArray);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory batteryInfo](self, "batteryInfo"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i), "dictionaryValue"));
        -[NSMutableArray addObject:](v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v16);
  }

  objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("batteryInfo"));
  v20 = objc_opt_new(NSMutableArray);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory beacons](self, "beacons"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allValues"));

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j), "dictionaryValue"));
        -[NSMutableArray addObject:](v20, "addObject:", v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v24);
  }

  objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("beacons"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("locationServicesEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("findMyiPhone"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("activationLock"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory firmwareRevision](self, "firmwareRevision"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v28, CFSTR("firmwareVersion"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "productVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v30);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Accessory"), CFSTR("deviceClass"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory deviceVendor](self, "deviceVendor"));
  v32 = objc_msgSend(v31, "unsignedIntValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory deviceProductId](self, "deviceProductId"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i_%i"), v32, objc_msgSend(v33, "unsignedIntValue")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("productType"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "platform"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_proxy"), v36));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory serialNumbers](self, "serialNumbers"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dictionaryValue"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v39, CFSTR("serialNumbers"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory bluetoothColorCode](self, "bluetoothColorCode"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v40, CFSTR("colorCode"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory styleDescriptor](self, "styleDescriptor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "dictionaryValue"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v42, CFSTR("accessoryStyle"));

  return v3;
}

- (id)deviceInfoForHostRegister
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
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
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory name](self, "name"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("deviceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("udid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory deviceVendor](self, "deviceVendor"));
  v8 = objc_msgSend(v7, "unsignedIntValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory deviceProductId](self, "deviceProductId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i_%i"), v8, objc_msgSend(v9, "unsignedIntValue")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("productType"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory connectionStatusString](self, "connectionStatusString"));
  objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("connectionStatus"));

  v12 = objc_opt_new(NSMutableArray);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory beacons](self, "beacons"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allValues"));

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "dictionaryValue"));
        -[NSMutableArray addObject:](v12, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v16);
  }

  objc_msgSend(v3, "setValue:forKey:", v12, CFSTR("beacons"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory currentLastActiveTime](self, "currentLastActiveTime"));
  v21 = v20;
  if (v20)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v20, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v22, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8188, CFSTR("lastActiveTime"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Accessory"), CFSTR("deviceClass"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "platform"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_proxy"), v24));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryRSSI](self, "accessoryRSSI"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v26, CFSTR("accessoryRSSI"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory rssiUpdateDate](self, "rssiUpdateDate"));
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory rssiUpdateDate](self, "rssiUpdateDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v28, "fm_epoch")));
    objc_msgSend(v3, "fm_safeSetObject:forKey:", v29, CFSTR("accessoryRSSITimestamp"));

  }
  else
  {
    objc_msgSend(v3, "fm_safeSetObject:forKey:", &off_1002D8188, CFSTR("accessoryRSSITimestamp"));
  }

  return v3;
}

- (id)otherDeviceInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceName"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceName"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory currentLastActiveTime](self, "currentLastActiveTime"));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8188, CFSTR("lastActiveTime"));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceClassString"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceClass"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "platform"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceUDID"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("udid"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "productType"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productType"), v16);

  v19 = v3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));

  return v17;
}

- (id)connectionStatusString
{
  unint64_t v2;

  v2 = -[FMDBluetoothAccessory connectionState](self, "connectionState");
  if (v2 > 2)
    return 0;
  else
    return *(&off_1002C3D88 + v2);
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (NSNumber)deviceVendor
{
  return self->_deviceVendor;
}

- (void)setDeviceVendor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceVendor, a3);
}

- (NSNumber)deviceProductId
{
  return self->_deviceProductId;
}

- (void)setDeviceProductId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProductId, a3);
}

- (NSString)audioRoutingIdentifier
{
  return self->_audioRoutingIdentifier;
}

- (void)setAudioRoutingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_audioRoutingIdentifier, a3);
}

- (FMDAsset)audioAsset
{
  return self->_audioAsset;
}

- (void)setAudioAsset:(id)a3
{
  objc_storeStrong((id *)&self->_audioAsset, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)scoUID
{
  return self->_scoUID;
}

- (void)setScoUID:(id)a3
{
  objc_storeStrong((id *)&self->_scoUID, a3);
}

- (unsigned)majorDeviceClass
{
  return self->_majorDeviceClass;
}

- (void)setMajorDeviceClass:(unsigned int)a3
{
  self->_majorDeviceClass = a3;
}

- (unsigned)minorDeviceClass
{
  return self->_minorDeviceClass;
}

- (void)setMinorDeviceClass:(unsigned int)a3
{
  self->_minorDeviceClass = a3;
}

- (NSDate)lastActiveTime
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastActiveTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)playbackChannels
{
  return self->_playbackChannels;
}

- (void)setPlaybackChannels:(id)a3
{
  objc_storeStrong((id *)&self->_playbackChannels, a3);
}

- (FMDBluetoothManagerDevice)bluetoothManagerDevice
{
  return self->_bluetoothManagerDevice;
}

- (void)setBluetoothManagerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothManagerDevice, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)firmwareRevision
{
  return self->_firmwareRevision;
}

- (void)setFirmwareRevision:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareRevision, a3);
}

- (NSString)hardwareRevision
{
  return self->_hardwareRevision;
}

- (void)setHardwareRevision:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareRevision, a3);
}

- (NSNumber)accessoryRSSI
{
  return self->_accessoryRSSI;
}

- (void)setAccessoryRSSI:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryRSSI, a3);
}

- (NSDate)rssiUpdateDate
{
  return self->_rssiUpdateDate;
}

- (void)setRssiUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_rssiUpdateDate, a3);
}

- (NSArray)batteryInfo
{
  return self->_batteryInfo;
}

- (void)setBatteryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_batteryInfo, a3);
}

- (NSNumber)bluetoothColorCode
{
  return self->_bluetoothColorCode;
}

- (void)setBluetoothColorCode:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothColorCode, a3);
}

- (NSUUID)baUUID
{
  return self->_baUUID;
}

- (void)setBaUUID:(id)a3
{
  objc_storeStrong((id *)&self->_baUUID, a3);
}

- (FMDAccessoryStyleDescriptor)styleDescriptor
{
  return self->_styleDescriptor;
}

- (void)setStyleDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_styleDescriptor, a3);
}

- (FMDAccessorySerialNumbers)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumbers, a3);
}

- (NSDictionary)audioChannelInfo
{
  return self->_audioChannelInfo;
}

- (void)setAudioChannelInfo:(id)a3
{
  objc_storeStrong((id *)&self->_audioChannelInfo, a3);
}

- (NSDictionary)beacons
{
  return self->_beacons;
}

- (void)setBeacons:(id)a3
{
  objc_storeStrong((id *)&self->_beacons, a3);
}

- (FMDCommandContext)commandContext
{
  return self->_commandContext;
}

- (void)setCommandContext:(id)a3
{
  objc_storeStrong((id *)&self->_commandContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandContext, 0);
  objc_storeStrong((id *)&self->_beacons, 0);
  objc_storeStrong((id *)&self->_audioChannelInfo, 0);
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_styleDescriptor, 0);
  objc_storeStrong((id *)&self->_baUUID, 0);
  objc_storeStrong((id *)&self->_bluetoothColorCode, 0);
  objc_storeStrong((id *)&self->_batteryInfo, 0);
  objc_storeStrong((id *)&self->_rssiUpdateDate, 0);
  objc_storeStrong((id *)&self->_accessoryRSSI, 0);
  objc_storeStrong((id *)&self->_hardwareRevision, 0);
  objc_storeStrong((id *)&self->_firmwareRevision, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_bluetoothManagerDevice, 0);
  objc_storeStrong((id *)&self->_playbackChannels, 0);
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_scoUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_audioAsset, 0);
  objc_storeStrong((id *)&self->_audioRoutingIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceProductId, 0);
  objc_storeStrong((id *)&self->_deviceVendor, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
