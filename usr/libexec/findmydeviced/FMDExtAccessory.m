@implementation FMDExtAccessory

- (FMDExtAccessory)initWithExtAccessoryInfo:(id)a3
{
  id v4;
  FMDExtAccessory *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSString *address;
  id v10;
  void *v11;
  FMDAccessoryIdentifier *v12;
  FMDAccessoryIdentifier *accessoryIdentifier;
  uint64_t v14;
  NSString *accessoryType;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSDictionary *serialNumbers;
  uint64_t v20;
  NSString *firmwareVersion;
  uint64_t v22;
  NSDictionary *additionalInfo;
  FMDCommandContext *v24;
  FMDCommandContext *commandContext;
  NSString *style;
  NSDictionary *batteryInfo;
  objc_super v29;
  uint8_t buf[4];
  id v31;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FMDExtAccessory;
  v5 = -[FMDExtAccessory init](&v29, "init");
  if (v5)
  {
    v6 = sub_1000530AC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDExtAccessory initWithExtAccessoryInfo %@", buf, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceDiscoveryId"));
    address = v5->_address;
    v5->_address = (NSString *)v8;

    v10 = objc_alloc((Class)FMDAccessoryIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
    v12 = (FMDAccessoryIdentifier *)objc_msgSend(v10, "initWithString:", v11);
    accessoryIdentifier = v5->_accessoryIdentifier;
    v5->_accessoryIdentifier = v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryType"));
    accessoryType = v5->_accessoryType;
    v5->_accessoryType = (NSString *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    name = v5->_name;
    v5->_name = (NSString *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumbers"));
    serialNumbers = v5->_serialNumbers;
    v5->_serialNumbers = (NSDictionary *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firmwareVersion"));
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "additionalInfo"));
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v22;

    v24 = -[FMDCommandContext initWithAccessory:]([FMDCommandContext alloc], "initWithAccessory:", v5);
    commandContext = v5->_commandContext;
    v5->_commandContext = v24;

    style = v5->_style;
    v5->_style = (NSString *)CFSTR("-1");

    batteryInfo = v5->_batteryInfo;
    v5->_batteryInfo = (NSDictionary *)&off_1002D93E0;

  }
  return v5;
}

- (void)updateWithAccessory:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  FMDExtAccessory *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryIdentifier](v8, "accessoryIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryIdentifier"));
    if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryType](v8, "accessoryType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryType"));
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastActiveTime"));
        -[NSObject timeIntervalSinceReferenceDate](v14, "timeIntervalSinceReferenceDate");
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastActiveTime](v8, "lastActiveTime"));
        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        v19 = v18;

        if (v16 > v19)
          -[FMDExtAccessory setLastActiveTime:](v8, "setLastActiveTime:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastStatusUpdateTime"));
        objc_msgSend(v20, "timeIntervalSinceReferenceDate");
        v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastStatusUpdateTime](v8, "lastStatusUpdateTime"));
        objc_msgSend(v23, "timeIntervalSinceReferenceDate");
        v25 = v24;

        if (v22 > v25)
          -[FMDExtAccessory setLastStatusUpdateTime:](v8, "setLastStatusUpdateTime:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory style](v8, "style"));

        if (!v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "style"));
          -[FMDExtAccessory setStyle:](v8, "setStyle:", v27);

        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory name](v8, "name"));

        if (!v28)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
          -[FMDExtAccessory setName:](v8, "setName:", v29);

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory firmwareVersion](v8, "firmwareVersion"));

        if (!v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firmwareVersion"));
          -[FMDExtAccessory setFirmwareVersion:](v8, "setFirmwareVersion:", v31);

        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory serialNumbers](v8, "serialNumbers"));

        if (!v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumbers"));
          -[FMDExtAccessory setSerialNumbers:](v8, "setSerialNumbers:", v33);

        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "baUUID"));
        v35 = sub_1000031B8();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v44 = v20;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUIDString"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory baUUID](v8, "baUUID"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
          *(_DWORD *)buf = 138413058;
          v46 = v37;
          v47 = 2112;
          v48 = v38;
          v49 = 2112;
          v50 = v39;
          v51 = 2112;
          v52 = v40;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "FMDExtAccessory existing baUUID: %@, new baUUID %@ for %@, %@", buf, 0x2Au);

          v20 = v44;
        }

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory baUUID](v8, "baUUID"));
        if (!v41)
          -[FMDExtAccessory setBaUUID:](v8, "setBaUUID:", v34);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playbackChannels"));
        -[FMDExtAccessory updatePlaybackChannels:](v8, "updatePlaybackChannels:", v42);

LABEL_24:
        goto LABEL_25;
      }
    }
    else
    {

    }
    v43 = sub_1000530AC();
    v14 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "got invalid accessory %@", buf, 0xCu);
    }
    goto LABEL_24;
  }
LABEL_25:

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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory playbackChannels](self, "playbackChannels"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));

  v8 = objc_msgSend(v5, "isEqualToSet:", v7);
  -[FMDExtAccessory setPlaybackChannels:](self, "setPlaybackChannels:", v4);
  -[FMDExtAccessory _updateAudioChannelPlayingState:](self, "_updateAudioChannelPlayingState:", v4);

  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_100229960(self, v10);

  return v8 ^ 1;
}

- (BOOL)updateComponnentsAvailability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory audioChannelInfo](self, "audioChannelInfo", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "channelName"));
        v14 = objc_msgSend(v4, "containsObject:", v13);

        if (objc_msgSend(v12, "availability") != (id)v14)
        {
          objc_msgSend(v12, "setAvailability:", v14);
          v9 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

- (void)_updateAudioChannelPlayingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory audioChannelInfo](self, "audioChannelInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005C710;
  v8[3] = &unk_1002C37F8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (int64_t)connectionState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  double v14;
  dispatch_time_t v15;
  intptr_t v16;
  id v17;
  NSDate *lastActiveTime;
  int v19;
  int64_t v20;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSDate *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  intptr_t v46;
  __int16 v47;
  uint64_t v48;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryType](self, "accessoryType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configForAccessoryType:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flavorForFeature:", CFSTR("connection")));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryControllerForFeature:flavor:](FMDExtExtensionHelper, "getAccessoryControllerForFeature:flavor:", CFSTR("connection"), v6));
    if (!v7)
    {
      v20 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = sub_10005CC04;
    v41 = sub_10005CC14;
    v42 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    v9 = sub_1000530AC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "start for connection status", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryIdentifier](self, "accessoryIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10005CC1C;
    v29[3] = &unk_1002C3820;
    v31 = &v37;
    v32 = &v33;
    v13 = v8;
    v30 = v13;
    objc_msgSend(v7, "connectionStatusForAccessory:withCompletion:", v12, v29);

    objc_msgSend(v5, "timeoutForFeature:", CFSTR("connection"));
    v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    v16 = dispatch_group_wait(v13, v15);
    if (v16 || v38[5])
    {
      v17 = sub_1000530AC();
      lastActiveTime = (NSDate *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(&lastActiveTime->super, OS_LOG_TYPE_ERROR))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory name](self, "name"));
        v28 = v38[5];
        *(_DWORD *)buf = 138412802;
        v44 = v27;
        v45 = 2048;
        v46 = v16;
        v47 = 2112;
        v48 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, &lastActiveTime->super, OS_LOG_TYPE_ERROR, "%@ connection status failed timeout %ld error %@", buf, 0x20u);

      }
      v19 = 1;
    }
    else
    {
      v22 = sub_1000530AC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory name](self, "name"));
        v25 = *((unsigned __int8 *)v34 + 24);
        *(_DWORD *)buf = 138412546;
        v44 = v24;
        v45 = 1024;
        LODWORD(v46) = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ connection status success %d", buf, 0x12u);

      }
      if (!*((_BYTE *)v34 + 24))
      {
        v19 = 0;
        v20 = 0;
LABEL_11:

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v37, 8);

        if (v19)
          v20 = 0;
        goto LABEL_16;
      }
      v26 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v19 = 0;
      lastActiveTime = self->_lastActiveTime;
      self->_lastActiveTime = v26;
    }

    v20 = 1;
    goto LABEL_11;
  }
  v20 = 0;
LABEL_17:

  return v20;
}

- (BOOL)nearby
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_1000530AC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1002299F4(v4, v5, v6, v7, v8, v9, v10, v11);

  return (id)-[FMDExtAccessory connectionState](self, "connectionState") == (id)1;
}

- (BOOL)updateWithBeaconingIdentifier:(id)a3
{
  -[FMDExtAccessory setBaUUID:](self, "setBaUUID:", a3);
  return 1;
}

- (unint64_t)category
{
  return 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FMDExtAccessory *v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = -[FMDExtAccessory init](+[FMDExtAccessory allocWithZone:](FMDExtAccessory, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  -[FMDExtAccessory setAccessoryIdentifier:](v4, "setAccessoryIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryType](self, "accessoryType"));
  -[FMDExtAccessory setAccessoryType:](v4, "setAccessoryType:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory name](self, "name"));
  -[FMDExtAccessory setName:](v4, "setName:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory firmwareVersion](self, "firmwareVersion"));
  -[FMDExtAccessory setFirmwareVersion:](v4, "setFirmwareVersion:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory address](self, "address"));
  -[FMDExtAccessory setAddress:](v4, "setAddress:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory extensionId](self, "extensionId"));
  -[FMDExtAccessory setExtensionId:](v4, "setExtensionId:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory serialNumbers](self, "serialNumbers"));
  -[FMDExtAccessory setSerialNumbers:](v4, "setSerialNumbers:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory additionalInfo](self, "additionalInfo"));
  -[FMDExtAccessory setAdditionalInfo:](v4, "setAdditionalInfo:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory additionalInfo](self, "additionalInfo"));
  -[FMDExtAccessory setBatteryInfo:](v4, "setBatteryInfo:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastActiveTime](self, "lastActiveTime"));
  -[FMDExtAccessory setLastActiveTime:](v4, "setLastActiveTime:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastStatusUpdateTime](self, "lastStatusUpdateTime"));
  -[FMDExtAccessory setLastStatusUpdateTime:](v4, "setLastStatusUpdateTime:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastDiscoveryDate](self, "lastDiscoveryDate"));
  -[FMDExtAccessory setLastDiscoveryDate:](v4, "setLastDiscoveryDate:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory style](self, "style"));
  -[FMDExtAccessory setStyle:](v4, "setStyle:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory baUUID](self, "baUUID"));
  -[FMDExtAccessory setBaUUID:](v4, "setBaUUID:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory commandContext](self, "commandContext"));
  -[FMDExtAccessory setCommandContext:](v4, "setCommandContext:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory playbackChannels](self, "playbackChannels"));
  -[FMDExtAccessory setPlaybackChannels:](v4, "setPlaybackChannels:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory audioChannelInfo](self, "audioChannelInfo"));
  -[FMDExtAccessory setAudioChannelInfo:](v4, "setAudioChannelInfo:", v21);

  return v4;
}

- (FMDExtAccessory)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDExtAccessory *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  FMDAccessoryIdentifier *v11;
  FMDAccessoryIdentifier *accessoryIdentifier;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  NSString *accessoryType;
  uint64_t v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  uint64_t v23;
  NSString *name;
  uint64_t v25;
  uint64_t v26;
  NSString *v27;
  void *v28;
  uint64_t v29;
  NSString *firmwareVersion;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  uint64_t v35;
  NSString *address;
  uint64_t v37;
  uint64_t v38;
  NSString *v39;
  void *v40;
  uint64_t v41;
  NSString *extensionId;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSSet *v48;
  void *v49;
  NSString *v50;
  void *v51;
  uint64_t v52;
  NSDictionary *serialNumbers;
  NSString *v54;
  void *v55;
  uint64_t v56;
  NSDictionary *additionalInfo;
  NSString *v58;
  void *v59;
  uint64_t v60;
  NSDictionary *batteryInfo;
  uint64_t v62;
  uint64_t v63;
  NSString *v64;
  void *v65;
  uint64_t v66;
  NSString *style;
  uint64_t v68;
  uint64_t v69;
  NSString *v70;
  void *v71;
  uint64_t v72;
  NSDate *lastActiveTime;
  uint64_t v74;
  uint64_t v75;
  NSString *v76;
  void *v77;
  uint64_t v78;
  NSDate *lastStatusUpdateTime;
  uint64_t v80;
  uint64_t v81;
  NSString *v82;
  void *v83;
  uint64_t v84;
  NSDate *lastDiscoveryDate;
  uint64_t v86;
  uint64_t v87;
  NSString *v88;
  void *v89;
  uint64_t v90;
  NSUUID *baUUID;

  v4 = a3;
  v6 = -[FMDExtAccessory init](self, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSString, v5);
    v8 = NSStringFromSelector("accessoryIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));

    v11 = (FMDAccessoryIdentifier *)objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v10);
    accessoryIdentifier = v6->_accessoryIdentifier;
    v6->_accessoryIdentifier = v11;

    v14 = objc_opt_class(NSString, v13);
    v15 = NSStringFromSelector("accessoryType");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v16));
    accessoryType = v6->_accessoryType;
    v6->_accessoryType = (NSString *)v17;

    v20 = objc_opt_class(NSString, v19);
    v21 = NSStringFromSelector("name");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v22));
    name = v6->_name;
    v6->_name = (NSString *)v23;

    v26 = objc_opt_class(NSString, v25);
    v27 = NSStringFromSelector("firmwareVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v28));
    firmwareVersion = v6->_firmwareVersion;
    v6->_firmwareVersion = (NSString *)v29;

    v32 = objc_opt_class(NSString, v31);
    v33 = NSStringFromSelector("address");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v34));
    address = v6->_address;
    v6->_address = (NSString *)v35;

    v38 = objc_opt_class(NSString, v37);
    v39 = NSStringFromSelector("extensionId");
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v38, v40));
    extensionId = v6->_extensionId;
    v6->_extensionId = (NSString *)v41;

    v44 = objc_opt_class(NSDictionary, v43);
    v46 = objc_opt_class(NSArray, v45);
    v48 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v44, v46, objc_opt_class(NSString, v47), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v50 = NSStringFromSelector("serialNumber");
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, v51));
    serialNumbers = v6->_serialNumbers;
    v6->_serialNumbers = (NSDictionary *)v52;

    v54 = NSStringFromSelector("additionalInfo");
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, v55));
    additionalInfo = v6->_additionalInfo;
    v6->_additionalInfo = (NSDictionary *)v56;

    v58 = NSStringFromSelector("batteryInfo");
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, v59));
    batteryInfo = v6->_batteryInfo;
    v6->_batteryInfo = (NSDictionary *)v60;

    v63 = objc_opt_class(NSString, v62);
    v64 = NSStringFromSelector("style");
    v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v63, v65));
    style = v6->_style;
    v6->_style = (NSString *)v66;

    v69 = objc_opt_class(NSDate, v68);
    v70 = NSStringFromSelector("lastActiveTime");
    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v69, v71));
    lastActiveTime = v6->_lastActiveTime;
    v6->_lastActiveTime = (NSDate *)v72;

    v75 = objc_opt_class(NSDate, v74);
    v76 = NSStringFromSelector("lastStatusUpdateTime");
    v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
    v78 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v75, v77));
    lastStatusUpdateTime = v6->_lastStatusUpdateTime;
    v6->_lastStatusUpdateTime = (NSDate *)v78;

    v81 = objc_opt_class(NSDate, v80);
    v82 = NSStringFromSelector("lastDiscoveryDate");
    v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
    v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v81, v83));
    lastDiscoveryDate = v6->_lastDiscoveryDate;
    v6->_lastDiscoveryDate = (NSDate *)v84;

    v87 = objc_opt_class(NSUUID, v86);
    v88 = NSStringFromSelector("baUUID");
    v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
    v90 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v87, v89));
    baUUID = v6->_baUUID;
    v6->_baUUID = (NSUUID *)v90;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  NSString *v25;
  void *v26;
  void *v27;
  NSString *v28;
  void *v29;
  void *v30;
  NSString *v31;
  void *v32;
  void *v33;
  NSString *v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  NSString *v40;
  void *v41;
  void *v42;
  NSString *v43;
  void *v44;
  NSString *v45;
  void *v46;
  id v47;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  v7 = NSStringFromSelector("accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v4, "encodeObject:forKey:", v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryType](self, "accessoryType"));
  v10 = NSStringFromSelector("accessoryType");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v4, "encodeObject:forKey:", v9, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory name](self, "name"));
  v13 = NSStringFromSelector("name");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v4, "encodeObject:forKey:", v12, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory firmwareVersion](self, "firmwareVersion"));
  v16 = NSStringFromSelector("firmwareVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v4, "encodeObject:forKey:", v15, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory address](self, "address"));
  v19 = NSStringFromSelector("address");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v4, "encodeObject:forKey:", v18, v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory extensionId](self, "extensionId"));
  v22 = NSStringFromSelector("extensionId");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  objc_msgSend(v4, "encodeObject:forKey:", v21, v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory serialNumbers](self, "serialNumbers"));
  v25 = NSStringFromSelector("serialNumbers");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  objc_msgSend(v4, "encodeObject:forKey:", v24, v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory additionalInfo](self, "additionalInfo"));
  v28 = NSStringFromSelector("additionalInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  objc_msgSend(v4, "encodeObject:forKey:", v27, v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory batteryInfo](self, "batteryInfo"));
  v31 = NSStringFromSelector("batteryInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  objc_msgSend(v4, "encodeObject:forKey:", v30, v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastActiveTime](self, "lastActiveTime"));
  v34 = NSStringFromSelector("lastActiveTime");
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  objc_msgSend(v4, "encodeObject:forKey:", v33, v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastStatusUpdateTime](self, "lastStatusUpdateTime"));
  v37 = NSStringFromSelector("lastStatusUpdateTime");
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  objc_msgSend(v4, "encodeObject:forKey:", v36, v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastDiscoveryDate](self, "lastDiscoveryDate"));
  v40 = NSStringFromSelector("lastDiscoveryDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  objc_msgSend(v4, "encodeObject:forKey:", v39, v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory style](self, "style"));
  v43 = NSStringFromSelector("style");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  objc_msgSend(v4, "encodeObject:forKey:", v42, v44);

  v47 = (id)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory baUUID](self, "baUUID"));
  v45 = NSStringFromSelector("baUUID");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  objc_msgSend(v4, "encodeObject:forKey:", v47, v46);

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
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory address](self, "address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryType](self, "accessoryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory baUUID](self, "baUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMDAccessory(0x%lx) name - %@, signature - %@, accessoryType - %@, baUUID - %@"), self, v3, v4, v5, v7));

  return (NSString *)v8;
}

- (id)deviceInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory name](self, "name"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("deviceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("udid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory address](self, "address"));
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("deviceDiscoveryId"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory connectionStatusString](self, "connectionStatusString"));
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("connectionStatus"));

  v9 = objc_claimAutoreleasedReturnValue(-[FMDExtAccessory additionalInfo](self, "additionalInfo"));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory additionalInfo](self, "additionalInfo"));
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory additionalInfo](self, "additionalInfo"));
      objc_msgSend(v3, "addEntriesFromDictionary:", v13);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastActiveTime](self, "lastActiveTime"));
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v14, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8140, CFSTR("lastActiveTime"));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastStatusUpdateTime](self, "lastStatusUpdateTime"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastStatusUpdateTime](self, "lastStatusUpdateTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v18, "fm_epoch")));
    objc_msgSend(v3, "fm_safeSetObject:forKey:", v19, CFSTR("accessoryRSSITimestamp"));

  }
  else
  {
    objc_msgSend(v3, "fm_safeSetObject:forKey:", &off_1002D8140, CFSTR("accessoryRSSITimestamp"));
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory batteryInfo](self, "batteryInfo"));
  objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("batteryInfo"));

  v21 = objc_opt_new(NSMutableArray);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory audioChannelInfo](self, "audioChannelInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allValues"));

  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i), "dictionaryValue"));
        -[NSMutableArray addObject:](v21, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v25);
  }

  objc_msgSend(v3, "setValue:forKey:", v21, CFSTR("audioChannels"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("locationServicesEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("findMyiPhone"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("activationLock"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory firmwareVersion](self, "firmwareVersion"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v29, CFSTR("firmwareVersion"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "productVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v31);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Accessory"), CFSTR("deviceClass"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryType](self, "accessoryType"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v32));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("productType"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryType](self, "accessoryType"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "configForAccessoryType:", v35));

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "version"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("cachedConfigVersion"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "platform"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_proxy"), v39));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory otherDeviceInfo](self, "otherDeviceInfo"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v41, CFSTR("otherDevices"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory serialNumbers](self, "serialNumbers"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v42, CFSTR("serialNumbers"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory style](self, "style"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v43, CFSTR("deviceColor"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory baUUID](self, "baUUID"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "UUIDString"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("baUUID"), v45);

  v46 = sub_1000530AC();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v3;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "device Info = %@", buf, 0xCu);
  }

  return v3;
}

+ (id)volatileKeysToExcludeFromRegisterDigest
{
  _QWORD v3[6];

  v3[0] = CFSTR("connectionStatus");
  v3[1] = CFSTR("lastActiveTime");
  v3[2] = CFSTR("batteryInfo");
  v3[3] = CFSTR("accessoryRSSI");
  v3[4] = CFSTR("accessoryRSSITimestamp");
  v3[5] = CFSTR("firmwareVersion");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 6));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory name](self, "name"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("deviceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("udid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastActiveTime](self, "lastActiveTime"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v7, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8140, CFSTR("lastActiveTime"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastStatusUpdateTime](self, "lastStatusUpdateTime"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastStatusUpdateTime](self, "lastStatusUpdateTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v11, "fm_epoch")));
    objc_msgSend(v3, "fm_safeSetObject:forKey:", v12, CFSTR("accessoryRSSITimestamp"));

  }
  else
  {
    objc_msgSend(v3, "fm_safeSetObject:forKey:", &off_1002D8140, CFSTR("accessoryRSSITimestamp"));
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory batteryInfo](self, "batteryInfo"));
  objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("batteryInfo"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("locationServicesEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("findMyiPhone"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("activationLock"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory firmwareVersion](self, "firmwareVersion"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v14, CFSTR("firmwareVersion"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "productVersion"));
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("productVersion"), v16);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Accessory"), CFSTR("deviceClass"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryType](self, "accessoryType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v17));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("productType"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "platform"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_proxy"), v20));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory serialNumbers](self, "serialNumbers"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v22, CFSTR("serialNumbers"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory style](self, "style"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v23, CFSTR("deviceColor"));

  return v3;
}

- (id)deviceInfoForHostRegister
{
  id v3;
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
  void *v18;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory name](self, "name"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("deviceName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("udid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryType](self, "accessoryType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v7));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("productType"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory connectionStatusString](self, "connectionStatusString"));
  objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("connectionStatus"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastActiveTime](self, "lastActiveTime"));
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v10, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v12, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8140, CFSTR("lastActiveTime"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastStatusUpdateTime](self, "lastStatusUpdateTime"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastStatusUpdateTime](self, "lastStatusUpdateTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v14, "fm_epoch")));
    objc_msgSend(v3, "fm_safeSetObject:forKey:", v15, CFSTR("accessoryRSSITimestamp"));

  }
  else
  {
    objc_msgSend(v3, "fm_safeSetObject:forKey:", &off_1002D8140, CFSTR("accessoryRSSITimestamp"));
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Accessory"), CFSTR("deviceClass"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "platform"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_proxy"), v17));

  objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("platform"), v18);
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

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory lastActiveTime](self, "lastActiveTime"));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "fm_epoch")));
    objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("lastActiveTime"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", &off_1002D8140, CFSTR("lastActiveTime"));
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

  v2 = -[FMDExtAccessory connectionState](self, "connectionState");
  if (v2 > 2)
    return 0;
  else
    return off_1002C3840[v2];
}

- (BOOL)accessoryInfoChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  unsigned int v39;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryIdentifier"));
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
  {

    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory accessoryType](self, "accessoryType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryType"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (!v9)
  {
LABEL_12:
    v19 = sub_1000530AC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100229A28(v20, v21, v22, v23, v24, v25, v26, v27);

    goto LABEL_18;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory name](self, "name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0)
  {
LABEL_17:

    goto LABEL_18;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory firmwareVersion](self, "firmwareVersion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firmwareVersion"));
  if (!objc_msgSend(v12, "isEqualToString:", v13))
  {
LABEL_16:

    goto LABEL_17;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory serialNumbers](self, "serialNumbers"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumbers"));
  if (!objc_msgSend(v14, "isEqualToDictionary:", v15))
  {

    goto LABEL_16;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory address](self, "address"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "address"));
  v39 = objc_msgSend(v16, "isEqualToString:", v17);

  if (!v39)
    goto LABEL_18;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory baUUID](self, "baUUID"));
  if (!v10)
  {
    v18 = 0;
    goto LABEL_22;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baUUID"));
  if (!v11)
  {
    v18 = 0;
    goto LABEL_22;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory baUUID](self, "baUUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baUUID"));
  if ((objc_msgSend(v12, "isEqual:", v13) & 1) == 0)
    goto LABEL_16;
  v18 = 1;
LABEL_22:
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory baUUID](self, "baUUID"));
  if (!v30)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baUUID"));
    if (v33)
    {
      v32 = 1;
      goto LABEL_31;
    }
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baUUID"));
  if (v31)
  {

    v32 = 0;
    if (v30)
      goto LABEL_25;
LABEL_30:
    v33 = 0;
LABEL_31:

    if ((v18 & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory baUUID](self, "baUUID"));
  v32 = v34 != 0;

  if (!v30)
    goto LABEL_30;
LABEL_25:

  if (v18)
  {
LABEL_32:

  }
LABEL_33:
  if (v10)

  if (!v32)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory additionalInfo](self, "additionalInfo"));
    if (v35 || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "additionalInfo"))) != 0)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory additionalInfo](self, "additionalInfo"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "additionalInfo"));
      v38 = objc_msgSend(v36, "isEqualToDictionary:", v37);

      if (v35)
      {
LABEL_42:

        v28 = v38 ^ 1;
        goto LABEL_19;
      }
    }
    else
    {
      v38 = 1;
    }

    goto LABEL_42;
  }
LABEL_18:
  v28 = 1;
LABEL_19:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  FMDExtAccessory *v5;
  uint64_t v6;
  FMDExtAccessory *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;

  v5 = (FMDExtAccessory *)a3;
  if (v5 == self)
    goto LABEL_6;
  v6 = objc_opt_class(self, v4);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    goto LABEL_8;
  v7 = v5;
  if (-[FMDExtAccessory accessoryInfoChanged:](self, "accessoryInfoChanged:", v7)
    || (v8 = objc_claimAutoreleasedReturnValue(-[FMDExtAccessory style](self, "style"))) == 0)
  {

    goto LABEL_8;
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory style](self, "style"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessory style](v7, "style"));
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
LABEL_6:
  v13 = 1;
LABEL_9:

  return v13;
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryType, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSString)extensionId
{
  return self->_extensionId;
}

- (void)setExtensionId:(id)a3
{
  objc_storeStrong((id *)&self->_extensionId, a3);
}

- (NSString)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (NSDate)lastActiveTime
{
  return self->_lastActiveTime;
}

- (void)setLastActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastActiveTime, a3);
}

- (void)setLastDiscoveryDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastDiscoveryDate, a3);
}

- (NSDate)lastStatusUpdateTime
{
  return self->_lastStatusUpdateTime;
}

- (void)setLastStatusUpdateTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastStatusUpdateTime, a3);
}

- (NSArray)playbackChannels
{
  return self->_playbackChannels;
}

- (void)setPlaybackChannels:(id)a3
{
  objc_storeStrong((id *)&self->_playbackChannels, a3);
}

- (NSDictionary)audioChannelInfo
{
  return self->_audioChannelInfo;
}

- (void)setAudioChannelInfo:(id)a3
{
  objc_storeStrong((id *)&self->_audioChannelInfo, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumbers, a3);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareVersion, a3);
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
  objc_storeStrong((id *)&self->_additionalInfo, a3);
}

- (NSDictionary)batteryInfo
{
  return self->_batteryInfo;
}

- (void)setBatteryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_batteryInfo, a3);
}

- (NSUUID)baUUID
{
  return self->_baUUID;
}

- (void)setBaUUID:(id)a3
{
  objc_storeStrong((id *)&self->_baUUID, a3);
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
  objc_storeStrong((id *)&self->_baUUID, 0);
  objc_storeStrong((id *)&self->_batteryInfo, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_audioChannelInfo, 0);
  objc_storeStrong((id *)&self->_playbackChannels, 0);
  objc_storeStrong((id *)&self->_lastStatusUpdateTime, 0);
  objc_storeStrong((id *)&self->_lastDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_extensionId, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
