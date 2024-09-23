@implementation SDAutoUnlockTransport

+ (id)sharedTransport
{
  if (qword_1007C6B60 != -1)
    dispatch_once(&qword_1007C6B60, &stru_100719338);
  return (id)qword_1007C6B58;
}

- (SDAutoUnlockTransport)init
{
  SDAutoUnlockTransport *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sendDates;
  NSMutableDictionary *v5;
  NSMutableDictionary *completionHandlers;
  NSMutableDictionary *v7;
  NSMutableDictionary *autoUnlockDeviceCache;
  NSMutableDictionary *v9;
  NSMutableDictionary *sendIdentifierToSessionID;
  NSMapTable *v11;
  NSMapTable *clientMap;
  dispatch_queue_t v13;
  OS_dispatch_queue *clientQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *transportQueue;
  IDSService *v17;
  IDSService *idsService;
  IDSService *v19;
  void *v20;
  IDSService *v21;
  IDSService *activityService;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SDAutoUnlockTransport;
  v2 = -[SDUnlockTransport init](&v24, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    sendDates = v2->_sendDates;
    v2->_sendDates = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v5;

    v7 = objc_opt_new(NSMutableDictionary);
    autoUnlockDeviceCache = v2->_autoUnlockDeviceCache;
    v2->_autoUnlockDeviceCache = v7;

    v9 = objc_opt_new(NSMutableDictionary);
    sendIdentifierToSessionID = v2->_sendIdentifierToSessionID;
    v2->_sendIdentifierToSessionID = v9;

    v11 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, 0);
    clientMap = v2->_clientMap;
    v2->_clientMap = v11;

    v13 = dispatch_queue_create("com.apple.sharingd.auto-unlock.transport-client-queue", 0);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_create("com.apple.sharingd.auto-unlock.transport-queue", 0);
    transportQueue = v2->_transportQueue;
    v2->_transportQueue = (OS_dispatch_queue *)v15;

    v17 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.continuity.unlock"));
    idsService = v2->_idsService;
    v2->_idsService = v17;

    v19 = v2->_idsService;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](v2, "transportQueue"));
    -[IDSService addDelegate:queue:](v19, "addDelegate:queue:", v2, v20);

    v21 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.continuity.activity"));
    activityService = v2->_activityService;
    v2->_activityService = v21;

    objc_storeStrong((id *)&v2->_autoUnlockService, v2->_idsService);
    -[SDAutoUnlockTransport loadCloudPairRetries](v2, "loadCloudPairRetries");
    -[SDAutoUnlockTransport updateBluetoothIDCache](v2, "updateBluetoothIDCache");
  }
  return v2;
}

- (void)addClient:(id)a3 forIdentifer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017A73C;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeClientForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017A814;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)logDevices
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "devices"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IDS Devices: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)refreshAutoUnlockDeviceCache
{
  id v3;

  -[SDAutoUnlockTransport clearAutoUnlockDeviceCache](self, "clearAutoUnlockDeviceCache");
  v3 = -[SDAutoUnlockTransport enabledAutoUnlockDevicesUsingCache:](self, "enabledAutoUnlockDevicesUsingCache:", 0);
}

- (void)clearAutoUnlockDeviceCache
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing Auto Unlock device cache", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceCache](self, "autoUnlockDeviceCache"));
  objc_msgSend(v5, "removeAllObjects");

}

- (id)bluetoothIDForIDSID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10017AC98;
  v16 = sub_10017ACA8;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017ACB0;
  block[3] = &unk_100717808;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)onqueue_bluetoothIDForIDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "devices"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID"));
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nsuuid"));

          v9 = (void *)v15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)bluetoothDeviceIdentifiers
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
  v10 = sub_10017AC98;
  v11 = sub_10017ACA8;
  v12 = &__NSArray0__struct;
  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017AF3C;
  v6[3] = &unk_100716540;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)onqueue_bluetoothDeviceIdentifiers
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_opt_new(NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devices"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nsuuid"));
        if (objc_msgSend(v10, "supportsHandoff"))
          v12 = v11 == 0;
        else
          v12 = 1;
        if (!v12)
          -[NSMutableArray addObject:](v3, "addObject:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)pairedDeviceID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport activeDevice](self, "activeDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uniqueIDOverride"));

  return v3;
}

- (id)pairedAutoUnlockDevice
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport activeDevice](self, "activeDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:](self, "autoUnlockDeviceForIDSDevice:", v3));

  return v4;
}

- (id)activeDevice
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "devices"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isActive"))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)isDeviceSatellitePaired
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry activePairedDeviceSelectorBlock](NRPairedDeviceRegistry, "activePairedDeviceSelectorBlock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", NRDevicePropertyIsAltAccount));
  LOBYTE(v3) = objc_msgSend(v6, "BOOLValue");

  return (char)v3;
}

- (BOOL)deviceNearby
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport activeDevice](self, "activeDevice"));
  v3 = objc_msgSend(v2, "isNearby");

  return v3;
}

- (id)idsDevicesIDs
{
  NSMutableSet *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_opt_new(NSMutableSet);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devices"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "uniqueIDOverride"));
        -[NSMutableSet addObject:](v3, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)idsMacDeviceIDs
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_opt_new(NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devices"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modelIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));
        v13 = objc_msgSend(v12, "containsString:", CFSTR("mac"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIDOverride"));
          -[NSMutableArray addObject:](v3, "addObject:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)deviceNameForDeviceID:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return v4;
}

- (int64_t)deviceTypeForDeviceID:(id)a3
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", a3));
  v5 = -[SDAutoUnlockTransport deviceTypeForDevice:](self, "deviceTypeForDevice:", v4);

  return v5;
}

- (int64_t)deviceTypeForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  int64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  unsigned int v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
  v6 = objc_msgSend(v5, "containsString:", CFSTR("watch"));

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString"));
    v10 = objc_msgSend(v9, "containsString:", CFSTR("iphone"));

    if ((v10 & 1) != 0)
    {
      v7 = 2;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));
      v13 = objc_msgSend(v12, "containsString:", CFSTR("ipad"));

      if ((v13 & 1) != 0)
      {
        v7 = 3;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
        v16 = objc_msgSend(v15, "containsString:", CFSTR("reality"));

        if (v16)
          v7 = 5;
        else
          v7 = 4;
      }
    }
  }

  return v7;
}

- (id)modelIdentifierForDeviceID:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelIdentifier"));

  return v4;
}

- (id)autoUnlockDeviceForDeviceID:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", a3));
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:](self, "autoUnlockDeviceForIDSDevice:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)autoUnlockDeviceForBluetoothID:(id)a3
{
  return -[SDAutoUnlockTransport autoUnlockDeviceForBluetoothID:cached:](self, "autoUnlockDeviceForBluetoothID:cached:", a3, 0);
}

- (id)autoUnlockDeviceForBluetoothID:(id)a3 cached:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForBluetoothID:](self, "idsDeviceForBluetoothID:", a3));
  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:cloudPaired:cached:](self, "autoUnlockDeviceForIDSDevice:cloudPaired:cached:", v6, 0, v4));
  else
    v7 = 0;

  return v7;
}

- (id)devicesWithLTKs
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  NSSet *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10017AC98;
  v11 = sub_10017ACA8;
  v12 = 0;
  v12 = objc_opt_new(NSSet);
  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017B96C;
  v6[3] = &unk_100716540;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)onqueue_devicesWithLTKs
{
  NSMutableSet *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_opt_new(NSMutableSet);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devices"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIDOverride"));
        v13 = objc_msgSend(v11, "ltkExistsForKeyDevice:", v12);

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIDOverride"));
          -[NSMutableSet addObject:](v3, "addObject:", v14);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)autoUnlockEligibleWatches
{
  return -[SDAutoUnlockTransport autoUnlockEligibleWatchesWithCloudPairing:](self, "autoUnlockEligibleWatchesWithCloudPairing:", 1);
}

- (id)autoUnlockEligibleWatchesWithCloudPairing:(BOOL)a3
{
  return -[SDAutoUnlockTransport autoUnlockEligibleDevicesWithCloudPairing:deviceType:](self, "autoUnlockEligibleDevicesWithCloudPairing:deviceType:", a3, 1);
}

- (id)autoUnlockEligibleDevicesWithCloudPairing:(BOOL)a3 deviceType:(int64_t)a4
{
  NSObject *v7;
  id v8;
  _QWORD v10[7];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  NSSet *v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10017AC98;
  v16 = sub_10017ACA8;
  v17 = 0;
  v17 = objc_opt_new(NSSet);
  v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10017BC44;
  v10[3] = &unk_100719360;
  v10[4] = self;
  v10[5] = &v12;
  v11 = a3;
  v10[6] = a4;
  dispatch_sync(v7, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)onqueue_autoUnlockEligibleDevices:(BOOL)a3 deviceType:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSDate *v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSDate *v40;
  void *v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  _BOOL8 v51;
  uint64_t v52;
  NSObject *v53;
  NSDate *v54;
  id v55;
  NSMutableSet *v57;
  void *v58;
  id obj;
  uint8_t v60;
  _BYTE v61[15];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  _BYTE v68[128];

  v5 = a3;
  v58 = (void *)sub_1000CE9F0(CFSTR("AUDeviceBlackList"));
  v57 = objc_opt_new(NSMutableSet);
  -[SDAutoUnlockTransport clearAutoUnlockDeviceCache](self, "clearAutoUnlockDeviceCache");
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "devices"));

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:cloudPaired:cached:](self, "autoUnlockDeviceForIDSDevice:cloudPaired:cached:", v13, v5, 0));
        v15 = v14;
        if (v14
          && (objc_msgSend(v14, "type") == (id)a4 || -[SDAutoUnlockTransport showOtherDevices](self, "showOtherDevices")))
        {
          if (a4 == 1
            && !(v16 = -[SDAutoUnlockTransport watchVersionEligibleForDevice:](self, "watchVersionEligibleForDevice:", v13)))
          {
            v27 = auto_unlock_log(v16);
            v21 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              sub_100180900(&v60, v61, v21);
          }
          else
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueID"));
            v18 = objc_msgSend(v58, "containsObject:", v17);

            if (!v18)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
              v24 = objc_msgSend(v23, "deviceKeyBagUnlocked");

              v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueIDOverride"));
              objc_msgSend(v15, "setKeyExists:", objc_msgSend(v25, "ltkExistsForKeyDevice:updateLTKs:", v26, v24));

              -[NSMutableSet addObject:](v57, "addObject:", v15);
              goto LABEL_18;
            }
            v20 = auto_unlock_log(v19);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueID"));
              *(_DWORD *)buf = 138412290;
              v67 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Skipping device in blacklist (device ID: %@)", buf, 0xCu);

            }
          }

        }
LABEL_18:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    }
    while (v10);
  }

  if (a4 == 1)
  {
    v28 = -[NSMutableSet count](v57, "count");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport lastSeenWatchDate](self, "lastSeenWatchDate"));
    v30 = v29;
    if (!v28)
    {

      if (v30)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport watchCurrentlyInList](self, "watchCurrentlyInList"));
        v47 = objc_msgSend(v46, "BOOLValue");

        if (!v47)
          goto LABEL_44;
        v49 = auto_unlock_log(v48);
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Last watch removed from list -- updating watchCurrentlyInList and lastSeenWatchDate", buf, 2u);
        }

        -[SDAutoUnlockTransport setWatchCurrentlyInList:](self, "setWatchCurrentlyInList:", &__kCFBooleanFalse);
      }
      else
      {
        v51 = -[SDAutoUnlockTransport activityServiceHasWatch](self, "activityServiceHasWatch");
        if (!v51)
          goto LABEL_44;
        v52 = auto_unlock_log(v51);
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Activity service has a Watch updating last seen date", buf, 2u);
        }

      }
      v54 = objc_opt_new(NSDate);
      -[SDAutoUnlockTransport setLastSeenWatchDate:](self, "setLastSeenWatchDate:", v54);

      goto LABEL_44;
    }

    if (!v30)
    {
      v32 = auto_unlock_log(v31);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Updating last seen date", buf, 2u);
      }

      v34 = objc_opt_new(NSDate);
      -[SDAutoUnlockTransport setLastSeenWatchDate:](self, "setLastSeenWatchDate:", v34);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport watchCurrentlyInList](self, "watchCurrentlyInList"));
    v36 = objc_msgSend(v35, "BOOLValue");

    if ((v36 & 1) == 0)
    {
      v38 = auto_unlock_log(v37);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Watch added to list -- updating watchCurrentlyInList and lastSeenWatchDate", buf, 2u);
      }

      -[SDAutoUnlockTransport setWatchCurrentlyInList:](self, "setWatchCurrentlyInList:", &__kCFBooleanTrue);
      v40 = objc_opt_new(NSDate);
      -[SDAutoUnlockTransport setLastSeenWatchDate:](self, "setLastSeenWatchDate:", v40);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport watchExistedInUnlockList](self, "watchExistedInUnlockList"));
    v42 = objc_msgSend(v41, "BOOLValue");

    if ((v42 & 1) == 0)
    {
      v44 = auto_unlock_log(v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Updating existed in list", buf, 2u);
      }

      -[SDAutoUnlockTransport setWatchExistedInUnlockList:](self, "setWatchExistedInUnlockList:", &__kCFBooleanTrue);
    }
  }
LABEL_44:
  v55 = -[NSMutableSet copy](v57, "copy");

  return v55;
}

- (id)enabledAutoUnlockDevices
{
  return -[SDAutoUnlockTransport enabledAutoUnlockDevicesUsingCache:](self, "enabledAutoUnlockDevicesUsingCache:", 0);
}

- (id)enabledAutoUnlockDevicesUsingCache:(BOOL)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  NSSet *v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10017AC98;
  v14 = sub_10017ACA8;
  v15 = 0;
  v15 = objc_opt_new(NSSet);
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017C320;
  block[3] = &unk_100719388;
  block[4] = self;
  block[5] = &v10;
  v9 = a3;
  dispatch_sync(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)onqueue_enabledAutoUnlockDevicesUsingCache:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  __int128 v25;
  NSMutableSet *v26;
  void *v27;
  _BOOL4 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];

  v28 = a3;
  v27 = (void *)sub_1000CE9F0(CFSTR("AUDeviceBlackList"));
  v26 = objc_opt_new(NSMutableSet);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devices"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v30;
    *(_QWORD *)&v7 = 138412290;
    v25 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager", v25));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride"));
        v14 = objc_msgSend(v12, "ltkExistsForKeyDevice:updateLTKs:", v13, 0);

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:cloudPaired:cached:](self, "autoUnlockDeviceForIDSDevice:cloudPaired:cached:", v11, 1, v28));
          v16 = v15;
          if (v15 && objc_msgSend(v15, "unlockEnabled"))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueID"));
            v18 = objc_msgSend(v27, "containsObject:", v17);

            if (v18)
            {
              v20 = auto_unlock_log(v19);
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueID"));
                *(_DWORD *)buf = v25;
                v34 = v22;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Skipping enabled device in blacklist (device ID: %@)", buf, 0xCu);

              }
            }
            else
            {
              -[NSMutableSet addObject:](v26, "addObject:", v16);
            }
          }

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v23 = -[NSMutableSet copy](v26, "copy");
  return v23;
}

- (id)enabledAutoUnlockLockDevices
{
  NSMutableSet *v3;
  NSObject *v4;
  NSMutableSet *v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SDAutoUnlockTransport *v12;
  NSMutableSet *v13;

  v3 = objc_opt_new(NSMutableSet);
  v4 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport transportQueue](self, "transportQueue"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10017C678;
  v11 = &unk_100714860;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync(v4, &v8);

  v6 = -[NSMutableSet copy](v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

- (id)autoUnlockDeviceForIDSDevice:(id)a3
{
  return -[SDAutoUnlockTransport autoUnlockDeviceForIDSDevice:cloudPaired:cached:](self, "autoUnlockDeviceForIDSDevice:cloudPaired:cached:", a3, 1, 0);
}

- (id)autoUnlockDeviceForIDSDevice:(id)a3 cloudPaired:(BOOL)a4 cached:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  SFAutoUnlockDevice *v29;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  unsigned int v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  int v49;
  unsigned int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  unsigned int v58;
  id v59;
  uint64_t v60;
  unsigned int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t buf[4];
  SFAutoUnlockDevice *v78;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport stableBluetoothIdentifierForIDSDevice:](self, "stableBluetoothIdentifierForIDSDevice:", v8));
  v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport nameForDevice:](self, "nameForDevice:", v8));
  v11 = (void *)v10;
  if (!v8
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIDOverride")), v12, !v12))
  {
    v26 = auto_unlock_log(v10);
    v25 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      sub_100180934(v25, v27, v28);
    goto LABEL_16;
  }
  v13 = objc_msgSend(v8, "deviceType");
  if (v13 == (id)6)
  {
    v14 = objc_msgSend(v8, "isLocallyPaired");
    if ((v14 & 1) == 0)
    {
      v70 = auto_unlock_log(v14);
      v25 = objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        sub_100180A34();
      goto LABEL_16;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelIdentifier"));
    v16 = sub_1000C92EC(v15);

    if (!v16)
    {
      v71 = auto_unlock_log(v17);
      v25 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        sub_1001809D4();
      goto LABEL_16;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport nanoRegistryDeviceForBluetoothIdentifier:](self, "nanoRegistryDeviceForBluetoothIdentifier:", v18));

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForProperty:", NRDevicePropertyName));
    v21 = (void *)v20;
    if (v20)
      v22 = (void *)v20;
    else
      v22 = v11;
    v23 = v22;

    v11 = v23;
  }
  if (v6 && !v9)
  {
    v24 = auto_unlock_log(v13);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100180968();
LABEL_16:
    v29 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (v5)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceCache](self, "autoUnlockDeviceCache"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIDOverride"));
    v29 = (SFAutoUnlockDevice *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v32));

    v34 = auto_unlock_log(v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v29;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Using cached device: %@", buf, 0xCu);
    }

    if (v29)
      goto LABEL_50;
  }
  v29 = objc_opt_new(SFAutoUnlockDevice);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIDOverride"));
  -[SFAutoUnlockDevice setUniqueID:](v29, "setUniqueID:", v36);

  -[SFAutoUnlockDevice setBluetoothID:](v29, "setBluetoothID:", v9);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelIdentifier"));
  -[SFAutoUnlockDevice setModelIdentifier:](v29, "setModelIdentifier:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productName"));
  -[SFAutoUnlockDevice setProductName:](v29, "setProductName:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productVersion"));
  -[SFAutoUnlockDevice setProductVersion:](v29, "setProductVersion:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productBuildVersion"));
  -[SFAutoUnlockDevice setProductBuildVersion:](v29, "setProductBuildVersion:", v40);

  -[SFAutoUnlockDevice setName:](v29, "setName:", v11);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enclosureColor"));
  -[SFAutoUnlockDevice setEnclosureColor:](v29, "setEnclosureColor:", v41);

  -[SFAutoUnlockDevice setDefaultPairedDevice:](v29, "setDefaultPairedDevice:", objc_msgSend(v8, "isDefaultPairedDevice"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport modelNameForDevice:](self, "modelNameForDevice:", v8));
  -[SFAutoUnlockDevice setModelName:](v29, "setModelName:", v42);

  objc_msgSend(v8, "operatingSystemVersion");
  objc_msgSend(v8, "operatingSystemVersion");
  v43 = v75 > 3 && v76 == 7;
  v44 = v76 > 7 || v43;
  -[SFAutoUnlockDevice setMajorOSVersion:](v29, "setMajorOSVersion:", v76);
  -[SFAutoUnlockDevice setSupportsAlwaysDirect:](v29, "setSupportsAlwaysDirect:", v76 > 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelIdentifier"));
  v46 = sub_1000C9334(v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  v74 = (uint64_t)objc_msgSend(v47, "integerValue");

  v48 = v74 > 2 ? v44 : 0;
  -[SFAutoUnlockDevice setSupportsApproveWithWatch:](v29, "setSupportsApproveWithWatch:", v48);
  v49 = sub_1000CE8D0(CFSTR("AUForceApproveLabel"), 0);
  v50 = -[SFAutoUnlockDevice supportsApproveWithWatch](v29, "supportsApproveWithWatch");
  v51 = v49 ? 0 : v50;
  -[SFAutoUnlockDevice setSupportsApproveIcon:](v29, "setSupportsApproveIcon:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIDOverride"));
  v73 = objc_msgSend(v52, "sessionKeyExistsForDeviceID:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "deviceIDsMissingSessionKey"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIDOverride"));
  v57 = objc_msgSend(v55, "containsObject:", v56) ^ 1;
  v58 = v76 > 3 ? v57 : 0;

  -[SFAutoUnlockDevice setSupportsEncryption:](v29, "setSupportsEncryption:", v73 & ~-[SDAutoUnlockTransport disableEncryption](self, "disableEncryption") & v58);
  v59 = -[SFAutoUnlockDevice setSupportsAdvertisingUnlocked:](v29, "setSupportsAdvertisingUnlocked:", v76 > 4);
  v61 = sub_1000C85B8((uint64_t)v59, v60);
  v62 = v76 > 6 ? v61 : 0;
  -[SFAutoUnlockDevice setSupportsConnectionCache:](v29, "setSupportsConnectionCache:", v62);
  -[SFAutoUnlockDevice setSupportsHEIC:](v29, "setSupportsHEIC:", v74 > 3);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIDOverride"));
  v65 = objc_msgSend(v63, "deviceEnabledAsKeyForIDSDeviceID:", v64);

  -[SFAutoUnlockDevice setCanUnlockDevice:](v29, "setCanUnlockDevice:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIDOverride"));
  v68 = objc_msgSend(v66, "deviceEnabledAsKey:", v67);

  -[SFAutoUnlockDevice setUnlockEnabled:](v29, "setUnlockEnabled:", v68);
  if (!v9)
    goto LABEL_48;
  if ((_DWORD)v68)
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[SFAutoUnlockDevice proxyBluetoothID](v29, "proxyBluetoothID"));
    -[SFAutoUnlockDevice setBluetoothCloudPaired:](v29, "setBluetoothCloudPaired:", v69 != 0);

  }
  else
  {
LABEL_48:
    -[SFAutoUnlockDevice setBluetoothCloudPaired:](v29, "setBluetoothCloudPaired:", v9 != 0);
  }
  if (v29)
  {
LABEL_50:
    v25 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockDeviceCache](self, "autoUnlockDeviceCache"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[SFAutoUnlockDevice uniqueID](v29, "uniqueID"));
    -[NSObject setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v29, v72);

    goto LABEL_17;
  }
LABEL_18:

  return v29;
}

- (id)approveBluetoothIDs
{
  SDAutoUnlockTransport *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedApproveBluetoothIDs](v2, "cachedApproveBluetoothIDs"));

  if (!v3)
    -[SDAutoUnlockTransport updateApproveBluetoothIDs](v2, "updateApproveBluetoothIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedApproveBluetoothIDs](v2, "cachedApproveBluetoothIDs"));
  objc_sync_exit(v2);

  return v4;
}

- (void)updateApproveBluetoothIDs
{
  SDAutoUnlockTransport *v2;
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_opt_new(NSMutableSet);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport enabledAutoUnlockDevices](v2, "enabledAutoUnlockDevices"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "supportsApproveWithWatch", (_QWORD)v18))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bluetoothID"));
          -[NSMutableSet addObject:](v3, "addObject:", v9);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedApproveBluetoothIDs](v2, "cachedApproveBluetoothIDs"));
  -[SDAutoUnlockTransport setCachedApproveBluetoothIDs:](v2, "setCachedApproveBluetoothIDs:", v3);

  objc_sync_exit(v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedApproveBluetoothIDs](v2, "cachedApproveBluetoothIDs"));
  v12 = objc_msgSend(v10, "isEqualToSet:", v11);

  if ((v12 & 1) == 0)
  {
    v14 = auto_unlock_log(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedApproveBluetoothIDs](v2, "cachedApproveBluetoothIDs"));
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updated approve bluetooth IDs: %@", buf, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "postNotificationName:object:", CFSTR("ApproveBluetoothIDsChanged"), 0);

  }
}

- (id)modelNameForDevice:(id)a3
{
  int64_t v3;

  v3 = -[SDAutoUnlockTransport deviceTypeForDevice:](self, "deviceTypeForDevice:", a3);
  if ((unint64_t)(v3 - 1) > 3)
    return &stru_10072FE60;
  else
    return off_1007193D0[v3 - 1];
}

- (BOOL)watchVersionEligibleForDevice:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  BOOL v7;
  uint64_t v9;
  int v10;
  uint8_t buf[4];
  int v12;

  v3 = a3;
  v4 = auto_unlock_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
    {
      objc_msgSend(v3, "operatingSystemVersion");
      v6 = v10;
    }
    else
    {
      v6 = 0;
    }
    *(_DWORD *)buf = 67109120;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device version: %d", buf, 8u);
  }

  if (v3)
  {
    objc_msgSend(v3, "operatingSystemVersion");
    v7 = v9 > 2;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)macVersionEligibleForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelIdentifier"));
  v7 = GestaltProductTypeStringToDeviceClass();

  if (!v5)
  {
    v12 = auto_unlock_log(v8);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      sub_100180A94();

    goto LABEL_19;
  }
  if (v7 == 1)
  {
    v14 = auto_unlock_log(v8);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "operatingSystemVersion");
      objc_msgSend(v5, "operatingSystemVersion");
      *(_DWORD *)buf = 67109376;
      v30 = v23;
      v31 = 1024;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Remote iOS major version: %d and minor version: %d", buf, 0xEu);
    }

    objc_msgSend(v5, "operatingSystemVersion");
    if (v21 <= 14)
    {
      objc_msgSend(v5, "operatingSystemVersion");
      if (v20 == 14)
      {
        objc_msgSend(v5, "operatingSystemVersion");
        v11 = v19 >= 0;
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (v7 != 100)
  {
    v16 = auto_unlock_log(v8);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      sub_100180B00((uint64_t)v4, v7, v17);

    goto LABEL_19;
  }
  v9 = auto_unlock_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "operatingSystemVersion");
    objc_msgSend(v5, "operatingSystemVersion");
    *(_DWORD *)buf = 67109376;
    v30 = v28;
    v31 = 1024;
    v32 = v27;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Remote MacOS major version: %d and minor version: %d", buf, 0xEu);
  }

  objc_msgSend(v5, "operatingSystemVersion");
  if (v26 > 10)
  {
LABEL_15:
    v11 = 1;
    goto LABEL_20;
  }
  objc_msgSend(v5, "operatingSystemVersion");
  if (v25 != 10)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v5, "operatingSystemVersion");
  v11 = v24 > 12;
LABEL_20:

  return v11;
}

- (id)nameForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if (-[SDAutoUnlockTransport showIDInName](self, "showIDInName"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIDOverride"));
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v7));

    v5 = (void *)v8;
  }

  return v5;
}

- (id)proxyBluetoothDeviceIDForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "companionIDForWatchID:", v4));

  if (!v6)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport onqueue_bluetoothIDForIDSID:](self, "onqueue_bluetoothIDForIDSID:", v6));
  if (!v7)
  {
    v8 = auto_unlock_log(0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100180B98(v9, v10, v11, v12, v13, v14, v15, v16);

    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (id)idsDeviceForUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "devices"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIDOverride"));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)idsDeviceForBluetoothID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "devices"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nsuuid"));
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)idsDeviceIDsForBluetoothID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devices"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nsuuid"));
        v14 = objc_msgSend(v13, "isEqual:", v4);

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueIDOverride"));
          -[NSMutableArray addObject:](v5, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)cachedIDSDeviceIDsForBluetoothID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedBluetoothIDToUniqueIDs](self, "cachedBluetoothIDToUniqueIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (void)logBluetoothIDCache
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedBluetoothIDToUniqueIDs](self, "cachedBluetoothIDToUniqueIDs"));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bluetooth ID cache %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)updateBluetoothIDCache
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id obj;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[SDAutoUnlockTransport setCachedBluetoothIDToUniqueIDs:](self, "setCachedBluetoothIDToUniqueIDs:", v3);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devices"));

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport stableBluetoothIdentifierForIDSDevice:](self, "stableBluetoothIdentifierForIDSDevice:", v10));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIDOverride"));
        v13 = (void *)v12;
        if (v11)
          v14 = v12 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedBluetoothIDToUniqueIDs](self, "cachedBluetoothIDToUniqueIDs"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v11));
          v17 = objc_msgSend(v16, "mutableCopy");
          v18 = v17;
          if (v17)
            v19 = v17;
          else
            v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v20 = v19;

          objc_msgSend(v20, "addObject:", v13);
          v21 = objc_msgSend(v20, "copy");
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cachedBluetoothIDToUniqueIDs](self, "cachedBluetoothIDToUniqueIDs"));
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v11);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v7);
  }

  v24 = auto_unlock_log(v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Updated bluetooth ID cache", buf, 2u);
  }

}

- (id)placeholderDevice
{
  SFAutoUnlockDevice *v2;

  v2 = objc_opt_new(SFAutoUnlockDevice);
  -[SFAutoUnlockDevice setUniqueID:](v2, "setUniqueID:", CFSTR("5EAFD122-F291-4D56-B1F9-D856CBBC7E0C"));
  -[SFAutoUnlockDevice setBluetoothID:](v2, "setBluetoothID:", 0);
  -[SFAutoUnlockDevice setModelIdentifier:](v2, "setModelIdentifier:", CFSTR("Watch0,0"));
  -[SFAutoUnlockDevice setProductName:](v2, "setProductName:", CFSTR("Watch OS"));
  -[SFAutoUnlockDevice setProductVersion:](v2, "setProductVersion:", CFSTR("0.0"));
  -[SFAutoUnlockDevice setProductBuildVersion:](v2, "setProductBuildVersion:", CFSTR("14S000"));
  -[SFAutoUnlockDevice setName:](v2, "setName:", CFSTR("Placeholder"));
  -[SFAutoUnlockDevice setEnclosureColor:](v2, "setEnclosureColor:", CFSTR("0"));
  -[SFAutoUnlockDevice setDefaultPairedDevice:](v2, "setDefaultPairedDevice:", 0);
  -[SFAutoUnlockDevice setModelName:](v2, "setModelName:", CFSTR("Apple Watch"));
  -[SFAutoUnlockDevice setProxyBluetoothID:](v2, "setProxyBluetoothID:", 0);
  -[SFAutoUnlockDevice setUnlockEnabled:](v2, "setUnlockEnabled:", 0);
  -[SFAutoUnlockDevice setBluetoothCloudPaired:](v2, "setBluetoothCloudPaired:", 0);
  -[SFAutoUnlockDevice setPlaceholder:](v2, "setPlaceholder:", 1);
  return v2;
}

- (BOOL)activityServiceHasWatch
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport activityService](self, "activityService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "devices"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v4)
    goto LABEL_14;
  v5 = v4;
  v6 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lowercaseString"));
      if (!objc_msgSend(v10, "containsString:", CFSTR("watch")))
        goto LABEL_11;
      if (!v8)
      {
        v13 = 0;
LABEL_11:

        continue;
      }
      objc_msgSend(v8, "operatingSystemVersion");

      if (v13 > 2)
      {
        v11 = 1;
        goto LABEL_15;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v5);
LABEL_14:
  v11 = 0;
LABEL_15:

  return v11;
}

- (BOOL)localDeviceIDSRegistered
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  unsigned int v22;
  _BYTE v23[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accounts"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "accountType") == 1)
        {
          v10 = v9;

          v6 = v10;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v12 = auto_unlock_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v6, "registrationStatus");
    *(_DWORD *)buf = 67109120;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDS registration status: %d", buf, 8u);
  }

  v15 = objc_msgSend(v6, "registrationStatus") == 5;
  return v15;
}

- (id)connectionCacheDevices
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport enabledAutoUnlockDevices](self, "enabledAutoUnlockDevices"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "supportsConnectionCache"))
          -[NSMutableArray addObject:](v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)nanoRegistryDeviceForBluetoothIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getAllDevices"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = _NRDevicePropertyBluetoothIdentifier;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:", v10, (_QWORD)v16));
        if (objc_msgSend(v3, "isEqualToString:", v13))
        {
          v14 = v12;

          goto LABEL_11;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)stableBluetoothIdentifierForIDSDevice:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nsuuid"));
  if (!v4)
  {
    if ((objc_opt_respondsToSelector(v3, "stableBluetoothIdentifier") & 1) != 0)
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "performSelector:", "stableBluetoothIdentifier"));
    else
      v4 = 0;
  }

  return v4;
}

- (void)handleSuccessfulMessageSentWithIdentifier:(id)a3 sessionID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientMap](self, "clientMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v8));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport sendIdentifierToSessionID](self, "sendIdentifierToSessionID"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    }
  }

}

- (void)updateRetryDatesForDeviceIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  _QWORD v31[2];
  _QWORD v32[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", 86400.0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", 900.0));

  v31[0] = CFSTR("CloudPairGeneralRetryDate");
  v31[1] = CFSTR("CloudPairShortRetryDate");
  v32[0] = v6;
  v32[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cloudPairRetryRecords](self, "cloudPairRetryRecords", (_QWORD)v24));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cloudPairRetryRecords](self, "cloudPairRetryRecords"));
  objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("AutoUnlockCloudPairRetries"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v19, "synchronize");

  v21 = auto_unlock_log(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cloudPairRetryRecords](self, "cloudPairRetryRecords"));
    *(_DWORD *)buf = 138412290;
    v29 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Updated cloud pairing retry dates %@", buf, 0xCu);

  }
}

- (BOOL)canRetryCloudPairingForDeviceID:(id)a3 useShortDate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  BOOL v20;
  int v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport cloudPairRetryRecords](self, "cloudPairRetryRecords"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (v8)
  {
    if (v4)
      v9 = CFSTR("CloudPairShortRetryDate");
    else
      v9 = CFSTR("CloudPairGeneralRetryDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));
    if (v10
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
          objc_msgSend(v11, "timeIntervalSinceDate:", v10),
          v13 = v12,
          v11,
          v13 < 0.0))
    {
      v15 = auto_unlock_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        if (v4)
          v17 = CFSTR("YES");
        else
          v17 = CFSTR("NO");
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CloudPairShortRetryDate")));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CloudPairGeneralRetryDate")));
        v22 = 138413058;
        v23 = v6;
        v24 = 2112;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        v28 = 2112;
        v29 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Still backing off cloud pair retry (device ID: %@, use short: %@, short date: %@, general date: %@)", (uint8_t *)&v22, 0x2Au);

      }
      v20 = 0;
    }
    else
    {
      v20 = 1;
    }

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (void)loadCloudPairRetries
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("AutoUnlockCloudPairRetries")));
  if (v4 && (v5 = objc_opt_class(NSDictionary, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
    v6 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  else
    v6 = objc_opt_new(NSMutableDictionary);
  v7 = v6;
  -[SDAutoUnlockTransport setCloudPairRetryRecords:](self, "setCloudPairRetryRecords:", v6);

}

- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 timeout:(id)a7 errorHandler:(id)a8
{
  -[SDAutoUnlockTransport sendPayload:toDevice:type:sessionID:queueOneID:timeout:errorHandler:](self, "sendPayload:toDevice:type:sessionID:queueOneID:timeout:errorHandler:", a3, a4, a5, a6, 0, a7, a8);
}

- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 errorHandler:(id)a9
{
  uint64_t v12;
  id v16;
  _QWORD v17[4];
  id v18;

  v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10017EBC0;
  v17[3] = &unk_1007193B0;
  v18 = a9;
  v16 = v18;
  -[SDAutoUnlockTransport sendPayload:toDevice:type:sessionID:queueOneID:timeout:completion:](self, "sendPayload:toDevice:type:sessionID:queueOneID:timeout:completion:", a3, a4, v12, a6, a7, a8, v17);

}

- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 completion:(id)a9
{
  id v9;

  v9 = -[SDAutoUnlockTransport sendPayload:toDevice:type:sessionID:queueOneID:wantsACK:timeout:completion:](self, "sendPayload:toDevice:type:sessionID:queueOneID:wantsACK:timeout:completion:", a3, a4, a5, a6, a7, 0, a8, a9);
}

- (id)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 wantsACK:(BOOL)a8 timeout:(id)a9 completion:(id)a10
{
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SDAutoUnlockTransport;
  v10 = -[SDUnlockTransport sendAutoUnlockPayload:toDevice:type:sessionID:queueOneID:timeout:completion:](&v12, "sendAutoUnlockPayload:toDevice:type:sessionID:queueOneID:timeout:completion:", a3, a4, a5, a6, a7, a9, a10);
  return (id)objc_claimAutoreleasedReturnValue(v10);
}

- (id)transferDataFromPayload:(id)a3 sessionID:(id)a4
{
  id v6;
  id v7;
  SDAutoUnlockSessionWrapper *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(SDAutoUnlockSessionWrapper);
  -[SDAutoUnlockSessionWrapper setVersion:](v8, "setVersion:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport dataFromUUID:](self, "dataFromUUID:", v6));

  -[SDAutoUnlockSessionWrapper setSessionID:](v8, "setSessionID:", v9);
  -[SDAutoUnlockSessionWrapper setPayload:](v8, "setPayload:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v8, "data"));
  return v10;
}

- (id)dataFromUUID:(id)a3
{
  _QWORD v4[2];

  v4[0] = 0;
  v4[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v4);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, 16));
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[SDAutoUnlockTransport updateBluetoothIDCache](self, "updateBluetoothIDCache", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017EDD0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;

  v5 = a4;
  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Nearby devices changed %@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017EF54;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v8, block);

}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10017F0BC;
  v17[3] = &unk_100714990;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(v13, v17);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  v7 = a5;
  v8 = v7;
  if (v7)
  {
    v9 = auto_unlock_log(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport sendIdentifierToSessionID](self, "sendIdentifierToSessionID"));
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received IDS ACK (identifier: %@, mapping: %@)", buf, 0x16u);

    }
    v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport clientQueue](self, "clientQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10017F828;
    v13[3] = &unk_100714860;
    v13[4] = self;
    v14 = v8;
    dispatch_async(v12, v13);

  }
}

- (BOOL)appleWatchExisted
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport lastSeenWatchDate](self, "lastSeenWatchDate"));
  v3 = v2 != 0;

  return v3;
}

- (void)resetAppleWatchExisted
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting apple watch existed state", v5, 2u);
  }

  -[SDAutoUnlockTransport setLastSeenWatchDate:](self, "setLastSeenWatchDate:", 0);
  -[SDAutoUnlockTransport setWatchExistedInUnlockList:](self, "setWatchExistedInUnlockList:", &__kCFBooleanFalse);
  -[SDAutoUnlockTransport setWatchCurrentlyInList:](self, "setWatchCurrentlyInList:", &__kCFBooleanFalse);
}

- (BOOL)watchSeenRecently
{
  void *v2;
  void *v3;
  void *v4;
  NSDate *v5;
  double v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport lastSeenWatchDate](self, "lastSeenWatchDate"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateByAddingTimeInterval:", 2419200.0));
    v5 = objc_opt_new(NSDate);
    -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v4);
    v7 = v6 < 0.0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDate)lastSeenWatchDate
{
  NSDate *lastSeenWatchDate;
  void *v4;
  NSDate *v5;
  NSDate *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSDate *v10;
  int v12;
  NSDate *v13;

  lastSeenWatchDate = self->_lastSeenWatchDate;
  if (lastSeenWatchDate)
    return lastSeenWatchDate;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("AutoUnlockLastSeenWatchDate")));
  v6 = self->_lastSeenWatchDate;
  self->_lastSeenWatchDate = v5;

  if (!self->_lastSeenWatchDate)
  {
    lastSeenWatchDate = 0;
    return lastSeenWatchDate;
  }
  v8 = auto_unlock_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_lastSeenWatchDate;
    v12 = 138412290;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loaded lastSeenWatchDate %@", (uint8_t *)&v12, 0xCu);
  }

  return self->_lastSeenWatchDate;
}

- (void)setLastSeenWatchDate:(id)a3
{
  NSDate **p_lastSeenWatchDate;
  NSDate *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_lastSeenWatchDate = &self->_lastSeenWatchDate;
  objc_storeStrong((id *)p_lastSeenWatchDate, a3);
  v6 = *p_lastSeenWatchDate;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setObject:forKey:", *p_lastSeenWatchDate, CFSTR("AutoUnlockLastSeenWatchDate"));
  else
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("AutoUnlockLastSeenWatchDate"));

}

- (NSNumber)watchExistedInUnlockList
{
  NSNumber *watchExistedInUnlockList;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  const __CFString *v11;
  int v13;
  const __CFString *v14;

  watchExistedInUnlockList = self->_watchExistedInUnlockList;
  if (!watchExistedInUnlockList)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", CFSTR("AutoUnlockWatchExistedInUnlockList"))));
    v6 = self->_watchExistedInUnlockList;
    self->_watchExistedInUnlockList = v5;

    v8 = auto_unlock_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[NSNumber BOOLValue](self->_watchExistedInUnlockList, "BOOLValue");
      v11 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      v13 = 138412290;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loaded watchExistedInUnlockList %@", (uint8_t *)&v13, 0xCu);
    }

    watchExistedInUnlockList = self->_watchExistedInUnlockList;
  }
  return watchExistedInUnlockList;
}

- (void)setWatchExistedInUnlockList:(id)a3
{
  id v4;
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_watchExistedInUnlockList, a3);
  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v6, "setBool:forKey:", v5, CFSTR("AutoUnlockWatchExistedInUnlockList"));
}

- (NSNumber)watchCurrentlyInList
{
  NSNumber *watchCurrentlyInList;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  const __CFString *v11;
  int v13;
  const __CFString *v14;

  watchCurrentlyInList = self->_watchCurrentlyInList;
  if (!watchCurrentlyInList)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", CFSTR("AutoUnlockWatchCurrentlyInList"))));
    v6 = self->_watchCurrentlyInList;
    self->_watchCurrentlyInList = v5;

    v8 = auto_unlock_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[NSNumber BOOLValue](self->_watchCurrentlyInList, "BOOLValue");
      v11 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      v13 = 138412290;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loaded watchCurrentlyInList %@", (uint8_t *)&v13, 0xCu);
    }

    watchCurrentlyInList = self->_watchCurrentlyInList;
  }
  return watchCurrentlyInList;
}

- (void)setWatchCurrentlyInList:(id)a3
{
  id v4;
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_watchCurrentlyInList, a3);
  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v6, "setBool:forKey:", v5, CFSTR("AutoUnlockWatchCurrentlyInList"));
}

- (BOOL)showIDInName
{
  return sub_1000CE8D0(CFSTR("AUShowIDInName"), 0) != 0;
}

- (BOOL)showOtherDevices
{
  return sub_1000CE8D0(CFSTR("AUShowOtherDevices"), 0) != 0;
}

- (BOOL)disableEncryption
{
  return sub_1000CE8D0(CFSTR("AUDisableEncryption"), 0) != 0;
}

- (BOOL)pairingRequestIsValidForDeviceID:(id)a3 messageContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  NSObject *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverReceivedTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "escrowSecretCreationDateForDeviceID:", v5));

  v11 = auto_unlock_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412802;
    v24 = v9;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Pairing request arrived (creation date: %@ server date: %@) from device: %@", (uint8_t *)&v23, 0x20u);
  }

  if (v9 && v7 && (v13 = objc_msgSend(v7, "timeIntervalSinceDate:", v9), v14 < 0.0)
    || objc_msgSend(v6, "fromServerStorage")
    && (v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverReceivedTime")),
        objc_msgSend(v15, "timeIntervalSinceDate:", v16),
        v18 = v17,
        v16,
        v15,
        v18 >= 60.0))
  {
    v20 = auto_unlock_log(v13);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v9;
      v25 = 2112;
      v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Pairing request arrived outside window (creation date: %@ server date: %@)", (uint8_t *)&v23, 0x16u);
    }

    v19 = 0;
  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (id)state
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SDAutoUnlockTransport *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v35;
  id obj;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _BYTE v50[128];

  v49 = 0;
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v49, "%@\n", v5);
  v6 = v49;

  v48 = v6;
  NSAppendPrintF(&v48, "-------------\n");
  v7 = v48;

  v8 = objc_alloc_init((Class)NSMutableSet);
  v10 = SFDeviceClassCodeGet(v8, v9);
  if ((_DWORD)v10 == 1)
  {
    v12 = self;
    v13 = 0;
    v14 = 1;
  }
  else
  {
    if (SFDeviceClassCodeGet(v10, v11) != 8)
      goto LABEL_6;
    v12 = self;
    v13 = 1;
    v14 = 2;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport autoUnlockEligibleDevicesWithCloudPairing:deviceType:](v12, "autoUnlockEligibleDevicesWithCloudPairing:deviceType:", v13, v14));
  objc_msgSend(v8, "unionSet:", v15);

LABEL_6:
  v47 = v7;
  NSAppendPrintF(&v47, "Eligible Devices: %@\n", v8);
  v16 = v47;

  v46 = v16;
  NSAppendPrintF(&v46, "\n");
  v17 = v46;

  v45 = v17;
  NSAppendPrintF(&v45, "Unlock IDS Devices\n");
  v18 = v45;

  v44 = v18;
  NSAppendPrintF(&v44, "-------------\n");
  v19 = v44;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockTransport idsService](self, "idsService"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "devices"));

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v22)
  {
    v23 = v22;
    v35 = v8;
    obj = v21;
    v24 = *(_QWORD *)v41;
    v25 = v19;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v39 = v25;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "uniqueID"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "modelIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "productBuildVersion"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "nsuuid"));
        NSAppendPrintF(&v39, "%''@, %@, %@, %@, BT=%@", v28, v29, v30, v31, v32);
        v33 = v39;

        v38 = v33;
        NSAppendPrintF(&v38, "\n");
        v25 = v38;

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v23);
    v19 = obj;
    v8 = v35;
  }
  else
  {

    v37 = v19;
    NSAppendPrintF(&v37, "No devices registered\n");
    v25 = v37;
  }

  return v25;
}

- (id)autoUnlockService
{
  return self->_autoUnlockService;
}

- (SDAutoUnlockTransportClient)primaryClient
{
  return (SDAutoUnlockTransportClient *)objc_loadWeakRetained((id *)&self->_primaryClient);
}

- (void)setPrimaryClient:(id)a3
{
  objc_storeWeak((id *)&self->_primaryClient, a3);
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
  objc_storeStrong((id *)&self->_idsService, a3);
}

- (IDSService)activityService
{
  return self->_activityService;
}

- (void)setActivityService:(id)a3
{
  objc_storeStrong((id *)&self->_activityService, a3);
}

- (OS_dispatch_queue)transportQueue
{
  return self->_transportQueue;
}

- (void)setTransportQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transportQueue, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (NSMapTable)clientMap
{
  return self->_clientMap;
}

- (void)setClientMap:(id)a3
{
  objc_storeStrong((id *)&self->_clientMap, a3);
}

- (NSMutableDictionary)completionHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCompletionHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableDictionary)sendIdentifierToSessionID
{
  return self->_sendIdentifierToSessionID;
}

- (void)setSendIdentifierToSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sendIdentifierToSessionID, a3);
}

- (NSMutableDictionary)sendDates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSendDates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSDate)lastSendDate
{
  return self->_lastSendDate;
}

- (void)setLastSendDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSendDate, a3);
}

- (NSMutableDictionary)autoUnlockDeviceCache
{
  return self->_autoUnlockDeviceCache;
}

- (void)setAutoUnlockDeviceCache:(id)a3
{
  objc_storeStrong((id *)&self->_autoUnlockDeviceCache, a3);
}

- (NSMutableDictionary)cloudPairRetryRecords
{
  return self->_cloudPairRetryRecords;
}

- (void)setCloudPairRetryRecords:(id)a3
{
  objc_storeStrong((id *)&self->_cloudPairRetryRecords, a3);
}

- (NSMutableDictionary)cachedBluetoothIDToUniqueIDs
{
  return self->_cachedBluetoothIDToUniqueIDs;
}

- (void)setCachedBluetoothIDToUniqueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cachedBluetoothIDToUniqueIDs, a3);
}

- (NSSet)cachedApproveBluetoothIDs
{
  return self->_cachedApproveBluetoothIDs;
}

- (void)setCachedApproveBluetoothIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cachedApproveBluetoothIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedApproveBluetoothIDs, 0);
  objc_storeStrong((id *)&self->_cachedBluetoothIDToUniqueIDs, 0);
  objc_storeStrong((id *)&self->_cloudPairRetryRecords, 0);
  objc_storeStrong((id *)&self->_autoUnlockDeviceCache, 0);
  objc_storeStrong((id *)&self->_lastSendDate, 0);
  objc_storeStrong((id *)&self->_sendDates, 0);
  objc_storeStrong((id *)&self->_sendIdentifierToSessionID, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_clientMap, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_transportQueue, 0);
  objc_storeStrong((id *)&self->_activityService, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_destroyWeak((id *)&self->_primaryClient);
  objc_storeStrong((id *)&self->_autoUnlockService, 0);
  objc_storeStrong((id *)&self->_watchCurrentlyInList, 0);
  objc_storeStrong((id *)&self->_watchExistedInUnlockList, 0);
  objc_storeStrong((id *)&self->_lastSeenWatchDate, 0);
}

@end
