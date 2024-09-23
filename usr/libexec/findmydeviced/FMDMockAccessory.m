@implementation FMDMockAccessory

- (FMDMockAccessory)init
{
  FMDMockAccessory *v2;
  void *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDMockAccessory;
  v2 = -[FMDMockAccessory init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    -[FMDMockAccessory setPersistedValue:](v2, "setPersistedValue:", v3);

    v4 = dispatch_queue_create("com.apple.icloud.findmydeviced.mockaccessory", 0);
    -[FMDMockAccessory setAccessoryQueue:](v2, "setAccessoryQueue:", v4);

  }
  return v2;
}

- (FMDMockAccessory)initWithBluetoothManagerDevice:(id)a3
{
  id v4;
  FMDMockAccessory *v5;
  FMDMockAccessory *v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;

  v4 = a3;
  v5 = -[FMDMockAccessory init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[FMDMockAccessory setBluetoothManagerDevice:](v5, "setBluetoothManagerDevice:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothConnected"));
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[FMDMockAccessory setLastActiveTime:](v6, "setLastActiveTime:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[FMDMockAccessory setName:](v6, "setName:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothMajorDeviceClass"));
    -[FMDMockAccessory setMajorDeviceClass:](v6, "setMajorDeviceClass:", objc_msgSend(v11, "unsignedIntValue"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothMinorDeviceClass"));
    -[FMDMockAccessory setMinorDeviceClass:](v6, "setMinorDeviceClass:", objc_msgSend(v12, "unsignedIntValue"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scoUID"));
    -[FMDMockAccessory setScoUID:](v6, "setScoUID:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "address"));
    -[FMDMockAccessory setAddress:](v6, "setAddress:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));
    -[FMDMockAccessory setSerialNumber:](v6, "setSerialNumber:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firmwareRevision"));
    -[FMDMockAccessory setFirmwareRevision:](v6, "setFirmwareRevision:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hardwareRevision"));
    -[FMDMockAccessory setHardwareRevision:](v6, "setHardwareRevision:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "beacons"));
    -[FMDMockAccessory updateBeaconsWithArray:](v6, "updateBeaconsWithArray:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "audioChannelInfo"));
    -[FMDMockAccessory updateAudioChannelsWithArray:](v6, "updateAudioChannelsWithArray:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothColorCode"));
    -[FMDMockAccessory setBluetoothColorCode:](v6, "setBluetoothColorCode:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "batteryInfo"));
    -[FMDMockAccessory setBatteryInfo:](v6, "setBatteryInfo:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothDeviceVendor"));
    -[FMDMockAccessory setDeviceVendor:](v6, "setDeviceVendor:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothDeviceProductId"));
    -[FMDMockAccessory setDeviceProductId:](v6, "setDeviceProductId:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryRSSI"));
    -[FMDMockAccessory setAccessoryRSSI:](v6, "setAccessoryRSSI:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rssiUpdateDate"));
    -[FMDMockAccessory setRssiUpdateDate:](v6, "setRssiUpdateDate:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory address](v6, "address"));
    -[FMDMockAccessory setAudioRoutingIdentifier:](v6, "setAudioRoutingIdentifier:", v26);

    v27 = objc_alloc((Class)FMDAccessoryIdentifier);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory address](v6, "address"));
    v29 = objc_msgSend(v27, "initWithAddress:", v28);
    -[FMDMockAccessory setAccessoryIdentifier:](v6, "setAccessoryIdentifier:", v29);

  }
  return v6;
}

- (BOOL)updateAudioAsset:(id)a3
{
  return 0;
}

- (BOOL)updatePlaybackChannels:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v9;
  FMDMockAccessory *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDMockAccessory accessoryQueue](self, "accessoryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ADE50;
  block[3] = &unk_1002C1410;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory audioChannelInfo](self, "audioChannelInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ADFD4;
  v8[3] = &unk_1002C37F8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory persistedValue](self, "persistedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = NSStringFromSelector("persistedValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v4, "encodeObject:forKey:", v6, v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v9 = NSStringFromSelector("accessoryIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "encodeObject:forKey:", v11, v10);

}

- (FMDMockAccessory)initWithCoder:(id)a3
{
  id v4;
  FMDMockAccessory *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMDMockAccessory;
  v5 = -[FMDMockAccessory init](&v19, "init");
  if (v5)
  {
    v6 = objc_alloc((Class)NSUUID);
    v8 = objc_opt_class(NSString, v7);
    v9 = NSStringFromSelector("persistedValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v10));
    v12 = objc_msgSend(v6, "initWithUUIDString:", v11);
    -[FMDMockAccessory setPersistedValue:](v5, "setPersistedValue:", v12);

    v14 = objc_opt_class(NSString, v13);
    v15 = NSStringFromSelector("accessoryIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v16));
    -[FMDMockAccessory setAccessoryIdentifier:](v5, "setAccessoryIdentifier:", v17);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  FMDMockAccessory *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  v5 = (FMDMockAccessory *)a3;
  if (v5 == self)
  {
    v15 = 1;
  }
  else
  {
    v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory persistedValue](v5, "persistedValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory persistedValue](self, "persistedValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
      if (objc_msgSend(v8, "isEqualToString:", v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory accessoryIdentifier](self, "accessoryIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory accessoryIdentifier](v5, "accessoryIdentifier"));
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory name](self, "name"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory name](v5, "name"));
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory persistedValue](self, "persistedValue"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (void)updateAudioChannelsWithArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory audioChannelInfo](self, "audioChannelInfo"));
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AE4BC;
  v8[3] = &unk_1002C37F8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  -[FMDMockAccessory setAudioChannelInfo:](self, "setAudioChannelInfo:", v7);
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory beacons](self, "beacons"));
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AE5D8;
  v8[3] = &unk_1002C3CF0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  -[FMDMockAccessory setBeacons:](self, "setBeacons:", v7);
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory audioChannelInfo](self, "audioChannelInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AE76C;
  v5[3] = &unk_1002C3D40;
  v5[4] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (NSURL)audioURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory audioAsset](self, "audioAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fileURL"));

  return (NSURL *)v3;
}

- (void)updateWithAccessory:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v5 = objc_opt_class(self, v4);
  isKindOfClass = objc_opt_isKindOfClass(v27, v5);
  v7 = v27;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "persistedValue"));
    -[FMDMockAccessory setPersistedValue:](self, "setPersistedValue:", v8);

    v9 = v27;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastActiveTime"));
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory lastActiveTime](self, "lastActiveTime"));
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v15 = v14;

    if (v12 > v15)
      objc_storeStrong((id *)&self->_lastActiveTime, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rssiUpdateDate"));
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory rssiUpdateDate](self, "rssiUpdateDate"));
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    v21 = v20;

    if (v18 > v21)
      -[FMDMockAccessory setRssiUpdateDate:](self, "setRssiUpdateDate:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "beacons"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allValues"));
    -[FMDMockAccessory updateBeaconsWithArray:](self, "updateBeaconsWithArray:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bluetoothColorCode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory bluetoothColorCode](self, "bluetoothColorCode"));

    if (!v25)
      -[FMDMockAccessory setBluetoothColorCode:](self, "setBluetoothColorCode:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playbackChannels"));
    -[FMDMockAccessory updatePlaybackChannels:](self, "updatePlaybackChannels:", v26);

    v7 = v27;
  }

}

+ (id)volatileKeysToExcludeFromRegisterDigest
{
  _QWORD v3[6];

  v3[0] = CFSTR("connectionStatus");
  v3[1] = CFSTR("lastActiveTime");
  v3[2] = CFSTR("batteryInfo");
  v3[3] = CFSTR("accessoryRSSI");
  v3[4] = CFSTR("accessoryRSSITimestamp");
  v3[5] = CFSTR("beacons");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 6));
}

- (NSDictionary)lastKnownLocationDeviceInfo
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
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory name](self, "name"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("deviceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("udid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory lastActiveTime](self, "lastActiveTime"));
  v40 = v7;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v7, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8200, CFSTR("lastActiveTime"));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory accessoryRSSI](self, "accessoryRSSI"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v9, CFSTR("accessoryRSSI"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory rssiUpdateDate](self, "rssiUpdateDate"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory rssiUpdateDate](self, "rssiUpdateDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v11, "fm_epoch")));
    objc_msgSend(v3, "fm_safeSetObject:forKey:", v12, CFSTR("accessoryRSSITimestamp"));

  }
  else
  {
    objc_msgSend(v3, "fm_safeSetObject:forKey:", &off_1002D8200, CFSTR("accessoryRSSITimestamp"));
  }

  v13 = objc_opt_new(NSMutableArray);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory batteryInfo](self, "batteryInfo"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), "dictionaryValue"));
        -[NSMutableArray addObject:](v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v16);
  }

  objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("batteryInfo"));
  v20 = objc_opt_new(NSMutableArray);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory beacons](self, "beacons"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allValues"));

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v42 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), "dictionaryValue"));
        -[NSMutableArray addObject:](v20, "addObject:", v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v24);
  }

  objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("beacons"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("locationServicesEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("findMyiPhone"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("activationLock"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory firmwareRevision](self, "firmwareRevision"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v28, CFSTR("firmwareVersion"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "productVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v30);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Accessory"), CFSTR("deviceClass"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory deviceVendor](self, "deviceVendor"));
  v32 = objc_msgSend(v31, "unsignedIntValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory deviceProductId](self, "deviceProductId"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i_%i"), v32, objc_msgSend(v33, "unsignedIntValue")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("productType"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "platform"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_proxy"), v36));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory bluetoothColorCode](self, "bluetoothColorCode"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v38, CFSTR("colorCode"));

  return (NSDictionary *)v3;
}

- (id)connectionStatusString
{
  unint64_t v2;

  v2 = -[FMDMockAccessory connectionState](self, "connectionState");
  if (v2 > 2)
    return 0;
  else
    return *(&off_1002C4CE8 + v2);
}

- (NSDictionary)deviceInfoForHostRegister
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory name](self, "name"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("deviceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("udid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory deviceVendor](self, "deviceVendor"));
  v8 = objc_msgSend(v7, "unsignedIntValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory deviceProductId](self, "deviceProductId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i_%i"), v8, objc_msgSend(v9, "unsignedIntValue")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("productType"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory connectionStatusString](self, "connectionStatusString"));
  objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("connectionStatus"));

  v12 = objc_opt_new(NSMutableArray);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory beacons](self, "beacons"));
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
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory lastActiveTime](self, "lastActiveTime"));
  v21 = v20;
  if (v20)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v20, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v22, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8200, CFSTR("lastActiveTime"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Accessory"), CFSTR("deviceClass"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "platform"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_proxy"), v24));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory accessoryRSSI](self, "accessoryRSSI"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v26, CFSTR("accessoryRSSI"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory rssiUpdateDate](self, "rssiUpdateDate"));
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory rssiUpdateDate](self, "rssiUpdateDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v28, "fm_epoch")));
    objc_msgSend(v3, "fm_safeSetObject:forKey:", v29, CFSTR("accessoryRSSITimestamp"));

  }
  else
  {
    objc_msgSend(v3, "fm_safeSetObject:forKey:", &off_1002D8200, CFSTR("accessoryRSSITimestamp"));
  }

  return (NSDictionary *)v3;
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

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockAccessory lastActiveTime](self, "lastActiveTime"));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8200, CFSTR("lastActiveTime"));
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

- (NSUUID)baUUID
{
  return 0;
}

- (BOOL)updateWithBeaconingIdentifier:(id)a3
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (FMDIdentifiable)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (FMDCommandContext)commandContext
{
  return self->_commandContext;
}

- (void)setCommandContext:(id)a3
{
  objc_storeStrong((id *)&self->_commandContext, a3);
}

- (unint64_t)audioSafetyStatus
{
  return self->_audioSafetyStatus;
}

- (void)setAudioSafetyStatus:(unint64_t)a3
{
  self->_audioSafetyStatus = a3;
}

- (BOOL)nearby
{
  return self->_nearby;
}

- (void)setNearby:(BOOL)a3
{
  self->_nearby = a3;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
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

- (NSDate)lastDiscoveryDate
{
  return self->_lastDiscoveryDate;
}

- (void)setLastDiscoveryDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastDiscoveryDate, a3);
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSString)audioRoutingIdentifier
{
  return self->_audioRoutingIdentifier;
}

- (void)setAudioRoutingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_audioRoutingIdentifier, a3);
}

- (NSDictionary)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (void)setCompleteDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_completeDeviceInfo, a3);
}

- (void)setDeviceInfoForHostRegister:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfoForHostRegister, a3);
}

- (void)setDeviceInfoForHostCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfoForHostCurrentLocation, a3);
}

- (void)setLocationDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_locationDeviceInfo, a3);
}

- (void)setLastKnownLocationDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownLocationDeviceInfo, a3);
}

- (NSUUID)persistedValue
{
  return self->_persistedValue;
}

- (void)setPersistedValue:(id)a3
{
  objc_storeStrong((id *)&self->_persistedValue, a3);
}

- (NSDate)lastActiveTime
{
  return self->_lastActiveTime;
}

- (void)setLastActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastActiveTime, a3);
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

- (NSArray)playbackChannels
{
  return self->_playbackChannels;
}

- (void)setPlaybackChannels:(id)a3
{
  objc_storeStrong((id *)&self->_playbackChannels, a3);
}

- (NSDictionary)beacons
{
  return self->_beacons;
}

- (void)setBeacons:(id)a3
{
  objc_storeStrong((id *)&self->_beacons, a3);
}

- (NSDictionary)audioChannelInfo
{
  return self->_audioChannelInfo;
}

- (void)setAudioChannelInfo:(id)a3
{
  objc_storeStrong((id *)&self->_audioChannelInfo, a3);
}

- (FMDAsset)audioAsset
{
  return self->_audioAsset;
}

- (void)setAudioAsset:(id)a3
{
  objc_storeStrong((id *)&self->_audioAsset, a3);
}

- (NSNumber)accessoryRSSI
{
  return self->_accessoryRSSI;
}

- (void)setAccessoryRSSI:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryRSSI, a3);
}

- (NSString)firmwareRevision
{
  return self->_firmwareRevision;
}

- (void)setFirmwareRevision:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareRevision, a3);
}

- (FMDBluetoothManagerDevice)bluetoothManagerDevice
{
  return self->_bluetoothManagerDevice;
}

- (void)setBluetoothManagerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothManagerDevice, a3);
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

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)hardwareRevision
{
  return self->_hardwareRevision;
}

- (void)setHardwareRevision:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareRevision, a3);
}

- (OS_dispatch_queue)accessoryQueue
{
  return self->_accessoryQueue;
}

- (void)setAccessoryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryQueue, a3);
}

- (FMDAudioAccessoryInfo)audioAccessoryInfo
{
  return self->_audioAccessoryInfo;
}

- (void)setAudioAccessoryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_audioAccessoryInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_accessoryQueue, 0);
  objc_storeStrong((id *)&self->_hardwareRevision, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_scoUID, 0);
  objc_storeStrong((id *)&self->_bluetoothManagerDevice, 0);
  objc_storeStrong((id *)&self->_firmwareRevision, 0);
  objc_storeStrong((id *)&self->_accessoryRSSI, 0);
  objc_storeStrong((id *)&self->_audioAsset, 0);
  objc_storeStrong((id *)&self->_audioChannelInfo, 0);
  objc_storeStrong((id *)&self->_beacons, 0);
  objc_storeStrong((id *)&self->_playbackChannels, 0);
  objc_storeStrong((id *)&self->_bluetoothColorCode, 0);
  objc_storeStrong((id *)&self->_batteryInfo, 0);
  objc_storeStrong((id *)&self->_rssiUpdateDate, 0);
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_persistedValue, 0);
  objc_storeStrong((id *)&self->_lastKnownLocationDeviceInfo, 0);
  objc_storeStrong((id *)&self->_locationDeviceInfo, 0);
  objc_storeStrong((id *)&self->_deviceInfoForHostCurrentLocation, 0);
  objc_storeStrong((id *)&self->_deviceInfoForHostRegister, 0);
  objc_storeStrong((id *)&self->_completeDeviceInfo, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_audioRoutingIdentifier, 0);
  objc_storeStrong((id *)&self->_lastDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_deviceProductId, 0);
  objc_storeStrong((id *)&self->_deviceVendor, 0);
  objc_storeStrong((id *)&self->_commandContext, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
