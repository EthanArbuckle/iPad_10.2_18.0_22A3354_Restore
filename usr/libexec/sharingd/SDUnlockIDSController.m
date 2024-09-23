@implementation SDUnlockIDSController

- (SDUnlockIDSController)init
{
  SDUnlockIDSController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *errorHandlers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OS_dispatch_queue *serviceQueue;
  IDSService *v10;
  IDSService *idsService;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  IDSService *v16;
  IDSService *v17;
  IDSService *idsServiceClassA;
  uint64_t v19;
  NSHashTable *delegates;
  objc_super v22;
  uint8_t buf[4];
  IDSService *v24;

  v22.receiver = self;
  v22.super_class = (Class)SDUnlockIDSController;
  v2 = -[SDUnlockTransport init](&v22, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    errorHandlers = v2->_errorHandlers;
    v2->_errorHandlers = v3;

    v7 = SFMainQueue(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v8;

    v10 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.continuity.auth"));
    idsService = v2->_idsService;
    v2->_idsService = v10;

    v12 = -[IDSService addDelegate:queue:](v2->_idsService, "addDelegate:queue:", v2, v2->_serviceQueue);
    v14 = paired_unlock_log(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v2->_idsService;
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created continuity.auth service %@", buf, 0xCu);
    }

    v17 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.continuity.auth.classa"));
    idsServiceClassA = v2->_idsServiceClassA;
    v2->_idsServiceClassA = v17;

    -[IDSService addDelegate:queue:](v2->_idsServiceClassA, "addDelegate:queue:", v2, v2->_serviceQueue);
    objc_storeStrong((id *)&v2->_autoUnlockService, v2->_idsServiceClassA);
    v19 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v19;

  }
  return v2;
}

+ (SDUnlockIDSController)sharedController
{
  if (qword_1007C64A8 != -1)
    dispatch_once(&qword_1007C64A8, &stru_100714810);
  return (SDUnlockIDSController *)(id)qword_1007C64A0;
}

- (BOOL)hasDefaultDevice
{
  void *v2;
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isDefaultPairedDevice");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isDefaultPairedDeviceNearby
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const __CFString *v18;
  _BYTE v19[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isDefaultPairedDevice")
          && (objc_msgSend(v6, "isNearby") & 1) != 0)
        {
          LODWORD(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  v9 = paired_unlock_log(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if ((_DWORD)v3)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Default paired device nearby = %@", buf, 0xCu);
  }

  return (char)v3;
}

- (id)activeIDSDevice
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isActive"))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 errorHandler:(id)a7
{
  -[SDUnlockIDSController sendProtocolBufferData:withType:timeout:option:queueOneID:errorHandler:](self, "sendProtocolBufferData:withType:timeout:option:queueOneID:errorHandler:", a3, a4, a5, a6, 0, a7);
}

- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 queueOneID:(id)a7 errorHandler:(id)a8
{
  -[SDUnlockIDSController sendProtocolBufferData:withType:timeout:option:dataClass:queueOneID:errorHandler:](self, "sendProtocolBufferData:withType:timeout:option:dataClass:queueOneID:errorHandler:", a3, a4, a5, a6, 1, a7, a8);
}

- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 dataClass:(int64_t)a7 queueOneID:(id)a8 errorHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  SDUnlockIDSController *v28;
  id v29;
  int64_t v30;
  int64_t v31;
  unsigned __int16 v32;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  v19 = objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController serviceQueue](self, "serviceQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002AC08;
  v24[3] = &unk_100714838;
  v25 = v16;
  v26 = v17;
  v32 = a4;
  v27 = v15;
  v28 = self;
  v30 = a6;
  v31 = a7;
  v29 = v18;
  v20 = v18;
  v21 = v15;
  v22 = v17;
  v23 = v16;
  dispatch_async(v19, v24);

}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController serviceQueue](self, "serviceQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B018;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController serviceQueue](self, "serviceQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B0F0;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateSendOptions:(id)a3
{
  objc_msgSend(a3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionForceLocalDeliveryKey);
}

- (NSSet)autoUnlockEligibleDevices
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  const mach_header_64 *v8;
  const char *v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  SDUnlockIDSController *v19;
  const mach_header_64 *v20;
  const char *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  mach_header_64 *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];

  v33 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController idsService](self, "idsService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devices"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    v8 = &_mh_execute_header;
    v9 = "Skipping unpaired device: %@";
    v32 = v4;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v11, "isLocallyPaired", v32);
        if ((v12 & 1) == 0)
        {
          v26 = auto_unlock_log(v12);
          v17 = objc_claimAutoreleasedReturnValue(v26);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          *(_DWORD *)buf = 138412290;
          v39 = v11;
          v27 = (mach_header_64 *)v8;
          v28 = v17;
          v29 = v9;
LABEL_15:
          _os_log_impl(v27, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
          goto LABEL_16;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modelIdentifier"));
        v14 = sub_1000C92EC(v13);

        if (!v14)
        {
          v30 = auto_unlock_log(v15);
          v17 = objc_claimAutoreleasedReturnValue(v30);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          *(_DWORD *)buf = 138412290;
          v39 = v11;
          v27 = (mach_header_64 *)v8;
          v28 = v17;
          v29 = "Skipping Unsupported hardware: %@";
          goto LABEL_15;
        }
        v16 = objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController autoUnlockDeviceForIDSDevice:](self, "autoUnlockDeviceForIDSDevice:", v11));
        v17 = v16;
        if (v16 && -[NSObject type](v16, "type") == (id)1)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
          v19 = self;
          v20 = v8;
          v21 = v9;
          v22 = objc_msgSend(v18, "deviceKeyBagUnlocked");

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride"));
          v25 = v22;
          v9 = v21;
          v8 = v20;
          self = v19;
          v4 = v32;
          -[NSObject setKeyExists:](v17, "setKeyExists:", objc_msgSend(v23, "ltkExistsForKeyDevice:updateLTKs:", v24, v25));

          objc_msgSend(v33, "addObject:", v17);
        }
LABEL_16:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v6);
  }

  return (NSSet *)v33;
}

- (id)autoUnlockDeviceForIDSDevice:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  SFAutoUnlockDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nsuuid"));

  if (v4)
  {
    v6 = objc_opt_new(SFAutoUnlockDevice);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIDOverride"));
    -[SFAutoUnlockDevice setUniqueID:](v6, "setUniqueID:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nsuuid"));
    -[SFAutoUnlockDevice setBluetoothID:](v6, "setBluetoothID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelIdentifier"));
    -[SFAutoUnlockDevice setModelIdentifier:](v6, "setModelIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productName"));
    -[SFAutoUnlockDevice setProductName:](v6, "setProductName:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productVersion"));
    -[SFAutoUnlockDevice setProductVersion:](v6, "setProductVersion:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productBuildVersion"));
    -[SFAutoUnlockDevice setProductBuildVersion:](v6, "setProductBuildVersion:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    -[SFAutoUnlockDevice setName:](v6, "setName:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosureColor"));
    -[SFAutoUnlockDevice setEnclosureColor:](v6, "setEnclosureColor:", v14);

    -[SFAutoUnlockDevice setDefaultPairedDevice:](v6, "setDefaultPairedDevice:", objc_msgSend(v3, "isDefaultPairedDevice"));
    -[SFAutoUnlockDevice setModelName:](v6, "setModelName:", CFSTR("Apple Watch"));
    if (v3)
    {
      objc_msgSend(v3, "operatingSystemVersion");
      v15 = v47;
      objc_msgSend(v3, "operatingSystemVersion");
      v16 = v45 > 3;
    }
    else
    {
      v16 = 0;
      v15 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v45 = 0;
      v46 = 0;
      v44 = 0;
    }
    -[SFAutoUnlockDevice setMajorOSVersion:](v6, "setMajorOSVersion:", v15, v44, v45, v46, v47, v48, v49);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelIdentifier"));
    v26 = sub_1000C9334(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (uint64_t)objc_msgSend(v27, "integerValue");

    v29 = v15 == 7 && v16;
    if (v15 > 7)
      v29 = 1;
    if (v28 > 2)
      v30 = v29;
    else
      v30 = 0;
    -[SFAutoUnlockDevice setSupportsApproveWithWatch:](v6, "setSupportsApproveWithWatch:", v30);
    -[SFAutoUnlockDevice setSupportsApproveIcon:](v6, "setSupportsApproveIcon:", -[SFAutoUnlockDevice supportsApproveWithWatch](v6, "supportsApproveWithWatch"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIDOverride"));
    v33 = objc_msgSend(v31, "sessionKeyExistsForDeviceID:", v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "deviceIDsMissingSessionKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIDOverride"));
    v37 = objc_msgSend(v35, "containsObject:", v36);

    -[SFAutoUnlockDevice setSupportsEncryption:](v6, "setSupportsEncryption:", v33 & (v37 ^ 1));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIDOverride"));
    v40 = objc_msgSend(v38, "deviceEnabledAsKey:", v39);

    -[SFAutoUnlockDevice setUnlockEnabled:](v6, "setUnlockEnabled:", v40);
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nsuuid"));
    v18 = v41;
    if (v41 && (v40 & 1) != 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SFAutoUnlockDevice proxyBluetoothID](v6, "proxyBluetoothID"));
      -[SFAutoUnlockDevice setBluetoothCloudPaired:](v6, "setBluetoothCloudPaired:", v42 != 0);

    }
    else
    {
      -[SFAutoUnlockDevice setBluetoothCloudPaired:](v6, "setBluetoothCloudPaired:", v41 != 0);
    }
  }
  else
  {
    v17 = auto_unlock_log(v5);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10002C194((uint64_t)v3, v18, v19, v20, v21, v22, v23, v24);
    v6 = 0;
  }

  return v6;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;

  v5 = a4;
  v7 = paired_unlock_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKeyPath:", CFSTR("@unionOfObjects.uniqueID")));
    v10 = SFCompactStringFromCollection(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "nearbyDevicesChanged %@", buf, 0xCu);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController delegates](self, "delegates", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v17, "idsControllerNearbyStateChanged:") & 1) != 0)
          objc_msgSend(v17, "idsControllerNearbyStateChanged:", self);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];

  v4 = paired_unlock_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Space became avaliable", buf, 2u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController delegates](self, "delegates", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "idsControllerSpaceDidBecomeAvailable:") & 1) != 0)
          objc_msgSend(v11, "idsControllerSpaceDidBecomeAvailable:", self);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;

  v8 = a6;
  v12 = a5;
  v13 = a7;
  v14 = a4;
  v15 = a3;
  v17 = paired_unlock_log(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    if (v8)
      v19 = CFSTR("YES");
    v34 = v19;
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "success = %@, identifier = %@, error = %@", buf, 0x20u);
  }

  v32.receiver = self;
  v32.super_class = (Class)SDUnlockIDSController;
  -[SDUnlockTransport service:account:identifier:didSendWithSuccess:error:](&v32, "service:account:identifier:didSendWithSuccess:error:", v15, v14, v12, v8, v13);

  if (!v8)
  {
    v20 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_errorHandlers, "objectForKeyedSubscript:", v12));
    v22 = (void *)v20;
    if (v20)
    {
      (*(void (**)(uint64_t, id))(v20 + 16))(v20, v13);
    }
    else
    {
      v23 = paired_unlock_log(0, v21);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10002C1FC(v24, v25, v26, v27, v28, v29, v30, v31);

    }
  }

}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  unsigned int v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  void *v52;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v14 = paired_unlock_log(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v11, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
    v18 = objc_msgSend(v17, "length");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
    *(_DWORD *)buf = 67109634;
    v48 = v16;
    v49 = 1024;
    v50 = v18;
    v51 = 2112;
    v52 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Incoming protobuf (type = %d, size = %u, data = %@)", buf, 0x18u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceForFromID:", v12));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uniqueIDOverride"));

  if (v11)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v23 = objc_claimAutoreleasedReturnValue(-[SDUnlockIDSController delegates](self, "delegates"));
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v24)
    {
      v25 = v24;
      v39 = v12;
      v40 = v10;
      v26 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v28, "idsController:didReceiveProtoData:forType:") & 1) != 0)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
            objc_msgSend(v28, "idsController:didReceiveProtoData:forType:", self, v29, objc_msgSend(v11, "type"));

          }
          if ((objc_opt_respondsToSelector(v28, "idsController:didReceiveProtoData:forType:deviceID:") & 1) != 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
            objc_msgSend(v28, "idsController:didReceiveProtoData:forType:deviceID:", self, v30, objc_msgSend(v11, "type"), v41);

          }
        }
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v25);
      v12 = v39;
      v10 = v40;
    }
  }
  else
  {
    v31 = paired_unlock_log(v21, v22);
    v23 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10002C230(v23, v32, v33, v34, v35, v36, v37, v38);
  }

}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a4;
  v7 = (void (**)(_QWORD))a5;
  v8 = paired_unlock_log();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didSwitchActivePairedDevice %@", (uint8_t *)&v10, 0xCu);
  }

  v7[2](v7);
}

- (id)dataClassStringForDataClass:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("SDUnlockSendDataClassClassA");
  if (a3 == 1)
    return CFSTR("SDUnlockSendDataClassClassD");
  else
    return (id)v3;
}

- (id)autoUnlockService
{
  return self->_autoUnlockService;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdsService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (IDSService)idsServiceClassA
{
  return (IDSService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdsServiceClassA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)errorHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setErrorHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_idsServiceClassA, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_autoUnlockService, 0);
}

@end
