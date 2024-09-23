@implementation FMDExtAccessoryManager

- (FMDExtAccessoryManager)init
{
  FMDExtAccessoryManager *v2;
  dispatch_queue_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;
  const __CFString *v11;
  const __CFString *v12;

  v10.receiver = self;
  v10.super_class = (Class)FMDExtAccessoryManager;
  v2 = -[FMDExtAccessoryManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("FMDExtAccessoryManager.serialQueue", 0);
    -[FMDExtAccessoryManager setSerialQueue:](v2, "setSerialQueue:", v3);

    v4 = objc_alloc_init((Class)NSMutableDictionary);
    -[FMDExtAccessoryManager setAccessoriesByExtension:](v2, "setAccessoriesByExtension:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionsDataSource sharedInstance](FMDExtExtensionsDataSource, "sharedInstance"));
    -[FMDExtAccessoryManager setExtensionManager:](v2, "setExtensionManager:", v5);

    v6 = objc_alloc_init((Class)NSMutableSet);
    -[FMDExtAccessoryManager setExtensionsAlreadySynced:](v2, "setExtensionsAlreadySynced:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
    objc_msgSend(v7, "setListner:", v2);

    v11 = CFSTR("context");
    v12 = CFSTR("daemonLaunch");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    -[FMDExtAccessoryManager updateAccessoriesDatabaseWithContext:](v2, "updateAccessoriesDatabaseWithContext:", v8);

    -[FMDExtAccessoryManager startMonitoringAccessories](v2, "startMonitoringAccessories");
  }
  return v2;
}

- (void)startMonitoringAccessories
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateNotificationReceived:", BluetoothMagicPairedDeviceNameChangedNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateNotificationReceived:", BluetoothDeviceConnectSuccessNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateNotificationReceived:", BluetoothDeviceDisconnectSuccessNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateNotificationReceived:", CFSTR("FMIPDeviceDidPairBluetoothDevice"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateNotificationReceived:", CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.added"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateNotificationReceived:", CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.removed"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateNotificationReceived:", CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.attach"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateNotificationReceived:", CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.detach"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateNotificationReceived:", CFSTR("com.apple.accessories.connection.MFi4AccessoryDisconnected"), 0);

}

- (void)updateNotificationReceived:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Accessory Information changed notification received = %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = v7;
  if (qword_100306838 && (objc_msgSend(v7, "timeIntervalSinceDate:"), v9 < 1.0))
  {
    v10 = sub_1000530AC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "timeIntervalSinceDate:", qword_100306838);
      *(_DWORD *)buf = 134217984;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not updating because time between this and last = %f < 1", buf, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)&qword_100306838, v8);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name", CFSTR("context"), CFSTR("notificationName"), CFSTR("receivedNotificaiton")));
    v15[1] = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, &v14, 2));
    -[FMDExtAccessoryManager updateAccessoriesDatabaseWithContext:](self, "updateAccessoriesDatabaseWithContext:", v13);

  }
}

- (void)updateAccessoriesDatabaseWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  id v20;
  _QWORD v21[6];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;

  v20 = a3;
  v3 = sub_1000530AC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "updateAccessoriesDatabase called with context %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v6 = objc_msgSend(v5, "unlockState");

  if (v6 == (id)1)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDExtAccessoryManager skipping updateAccessoriesDatabase before first unlock", buf, 2u);
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAllExtensions](FMDExtExtensionHelper, "getAllExtensions"));
    v10 = sub_1000530AC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "extension IDList = %@", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryManager accessoryRegistry](self, "accessoryRegistry"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v9;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v8);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryProxyForId:withDelegate:](FMDExtExtensionHelper, "getAccessoryProxyForId:withDelegate:", v17, 0));
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_10007F898;
          v21[3] = &unk_1002C4188;
          v21[4] = v17;
          v21[5] = self;
          v22 = v12;
          objc_msgSend(v18, "fetchAllAccessoriesInfoWithInfo:withCompletion:", v20, v21);

        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

  }
}

- (void)updateAccessory:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  FMDExtAccessoryManager *v10;

  v4 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100080460;
  v8[3] = &unk_1002C13E8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (id)_allAccessories
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
  v10 = sub_100080EAC;
  v11 = sub_100080EBC;
  v12 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryManager serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100080EC4;
  v6[3] = &unk_1002C3DC8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)getAccessoriesWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc((Class)NSArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryManager _allAccessories](self, "_allAccessories"));
  v7 = objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);

  v8 = objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryManager serialQueue](self, "serialQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000810D8;
  v11[3] = &unk_1002C2038;
  v12 = v7;
  v13 = v4;
  v9 = v4;
  v10 = v7;
  dispatch_async(v8, v11);

}

- (void)configurationUpdated:(id)a3
{
  void *i;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *j;
  void *v11;
  void *v12;
  unsigned int v13;
  id obj;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryManager _allAccessories](self, "_allAccessories"));
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(_QWORD *)v18 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j);
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryType"));
              v13 = objc_msgSend(v12, "isEqualToString:", v5);

              if (v13)
                -[FMDExtAccessoryManager updateAccessory:](self, "updateAccessory:", v11);
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v8);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

}

- (void)supportedAccessoryTypesUpdated
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;

  v4 = CFSTR("context");
  v5 = CFSTR("supportedAccessoryTypesUpdated");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
  -[FMDExtAccessoryManager updateAccessoriesDatabaseWithContext:](self, "updateAccessoriesDatabaseWithContext:", v3);

}

- (FMDAccessoryRegistry)accessoryRegistry
{
  return (FMDAccessoryRegistry *)objc_loadWeakRetained((id *)&self->_accessoryRegistry);
}

- (void)setAccessoryRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryRegistry, a3);
}

- (NSMutableDictionary)accessoriesByExtension
{
  return self->_accessoriesByExtension;
}

- (void)setAccessoriesByExtension:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesByExtension, a3);
}

- (FMDExtExtensionsDataSource)extensionManager
{
  return self->_extensionManager;
}

- (void)setExtensionManager:(id)a3
{
  objc_storeStrong((id *)&self->_extensionManager, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSMutableSet)extensionsAlreadySynced
{
  return self->_extensionsAlreadySynced;
}

- (void)setExtensionsAlreadySynced:(id)a3
{
  objc_storeStrong((id *)&self->_extensionsAlreadySynced, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionsAlreadySynced, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_accessoriesByExtension, 0);
  objc_destroyWeak((id *)&self->_accessoryRegistry);
}

@end
