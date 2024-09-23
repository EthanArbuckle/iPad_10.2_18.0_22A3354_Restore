@implementation SDDeviceAssetMonitor

+ (SDDeviceAssetMonitor)sharedAssetMonitor
{
  if (qword_1007C64F0 != -1)
    dispatch_once(&qword_1007C64F0, &stru_100714C98);
  return (SDDeviceAssetMonitor *)(id)qword_1007C64E8;
}

- (SDDeviceAssetMonitor)init
{
  SDDeviceAssetMonitor *v2;
  NSMutableSet *v3;
  NSMutableSet *tasks;
  NSMutableSet *v5;
  NSMutableSet *bluetoothDevices;
  SFDeviceAssetManager *v7;
  SFDeviceAssetManager *deviceAssetManager;
  CUSystemMonitor *v9;
  CUSystemMonitor *systemMonitor;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SDDeviceAssetMonitor;
  v2 = -[SDDeviceAssetMonitor init](&v12, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableSet);
    tasks = v2->_tasks;
    v2->_tasks = v3;

    v5 = objc_opt_new(NSMutableSet);
    bluetoothDevices = v2->_bluetoothDevices;
    v2->_bluetoothDevices = v5;

    v7 = objc_opt_new(SFDeviceAssetManager);
    deviceAssetManager = v2->_deviceAssetManager;
    v2->_deviceAssetManager = v7;

    v9 = objc_opt_new(CUSystemMonitor);
    systemMonitor = v2->_systemMonitor;
    v2->_systemMonitor = v9;

    -[SDDeviceAssetMonitor addObservers](v2, "addObservers");
  }
  return v2;
}

- (void)activateIfReady
{
  uint64_t v3;
  NSObject *v4;
  CUSystemMonitor *systemMonitor;
  int v6;
  const char *v7;

  v3 = asset_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SDDeviceAssetMonitor activateIfReady]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }

  if (!self->_activated)
  {
    if (-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked"))
    {
      self->_activated = 1;
      -[SFDeviceAssetManager activate](self->_deviceAssetManager, "activate");
      -[SDDeviceAssetMonitor setUpBluetoothDeviceMonitor](self, "setUpBluetoothDeviceMonitor");
      -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
      systemMonitor = self->_systemMonitor;
      self->_systemMonitor = 0;

    }
  }
}

- (void)addObservers
{
  CUSystemMonitor *systemMonitor;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD v9[5];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004A4C0;
  v9[3] = &unk_100714CC0;
  v9[4] = self;
  self->_stateHandle = os_state_add_handler(&_dispatch_main_q, v9);
  location = 0;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004A4C8;
  v6[3] = &unk_1007145D0;
  objc_copyWeak(&v7, &location);
  -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v6);
  systemMonitor = self->_systemMonitor;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004A4F4;
  v4[3] = &unk_1007145D0;
  objc_copyWeak(&v5, &location);
  -[CUSystemMonitor activateWithCompletion:](systemMonitor, "activateWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setUpBluetoothDeviceMonitor
{
  CUBluetoothClient *v3;
  CUBluetoothClient *bluetoothClient;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_opt_new(CUBluetoothClient);
  bluetoothClient = self->_bluetoothClient;
  self->_bluetoothClient = v3;

  -[CUBluetoothClient setFlags:](self->_bluetoothClient, "setFlags:", 1);
  location = 0;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004A658;
  v7[3] = &unk_100714CE8;
  objc_copyWeak(&v8, &location);
  -[CUBluetoothClient setDevicePairedHandler:](self->_bluetoothClient, "setDevicePairedHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004A6A0;
  v5[3] = &unk_100714CE8;
  objc_copyWeak(&v6, &location);
  -[CUBluetoothClient setDeviceUnpairedHandler:](self->_bluetoothClient, "setDeviceUnpairedHandler:", v5);
  -[CUBluetoothClient activate](self->_bluetoothClient, "activate");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)queryForBluetoothDevice:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  signed int v6;

  v3 = a3;
  v4 = objc_alloc((Class)SFDeviceAssetQuery);
  v5 = objc_msgSend(v3, "productIdentifier");
  v6 = objc_msgSend(v3, "colorCode");

  return objc_msgSend(v4, "initWithBluetoothProductIdentifier:color:", v5, v6);
}

- (void)bluetoothDevicePaired:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v6 = asset_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[SDDeviceAssetMonitor bluetoothDevicePaired:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v12, 0x16u);
  }

  v8 = objc_msgSend(v4, "supportsAACPService");
  if ((_DWORD)v8)
  {
    -[NSMutableSet addObject:](self->_bluetoothDevices, "addObject:", v4);
    v10 = objc_claimAutoreleasedReturnValue(-[SDDeviceAssetMonitor queryForBluetoothDevice:](self, "queryForBluetoothDevice:", v4));
    -[SDDeviceAssetMonitor downloadAssetsForQuery:](self, "downloadAssetsForQuery:", v10);
  }
  else
  {
    v11 = asset_log(v8, v9);
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[SDDeviceAssetMonitor bluetoothDevicePaired:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s ignoring %@", (uint8_t *)&v12, 0x16u);
    }
  }

}

- (void)bluetoothDeviceUnpaired:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v6 = asset_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[SDDeviceAssetMonitor bluetoothDeviceUnpaired:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v12, 0x16u);
  }

  v8 = -[NSMutableSet containsObject:](self->_bluetoothDevices, "containsObject:", v4);
  if ((_DWORD)v8)
  {
    -[NSMutableSet removeObject:](self->_bluetoothDevices, "removeObject:", v4);
    -[SDDeviceAssetMonitor triggerAssetCleanupWithBluetoothDeviceRemoved:](self, "triggerAssetCleanupWithBluetoothDeviceRemoved:", v4);
  }
  else
  {
    v10 = asset_log(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[SDDeviceAssetMonitor bluetoothDeviceUnpaired:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s ignoring %@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (void)triggerAssetCleanupWithBluetoothDeviceRemoved:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDDeviceAssetMonitor queryForBluetoothDevice:](self, "queryForBluetoothDevice:", v4));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self->_bluetoothDevices;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDDeviceAssetMonitor queryForBluetoothDevice:](self, "queryForBluetoothDevice:", v11, (_QWORD)v21));
        v13 = objc_msgSend(v12, "isEqual:", v5);
        if ((_DWORD)v13)
        {
          v19 = asset_log(v13, v14);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v4;
            v27 = 2112;
            v28 = v11;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "assets for removed device %@ is still needed by %@", buf, 0x16u);
          }

          goto LABEL_15;
        }

      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v8)
        continue;
      break;
    }
  }

  v17 = asset_log(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "cleaning up assets for removed device %@", buf, 0xCu);
  }

  -[SFDeviceAssetManager purgeAssetsMatchingQuery:](self->_deviceAssetManager, "purgeAssetsMatchingQuery:", v5);
LABEL_15:

}

- (void)downloadAssetsForQuery:(id)a3
{
  id v4;
  SDDeviceAssetTask *v5;
  NSDate *v6;
  SDDeviceAssetMonitor *v7;
  id v8;
  SDDeviceAssetTask *v9;
  id v10;
  id v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, int, void *);
  void *v15;
  id v16;
  SDDeviceAssetTask *v17;

  v4 = a3;
  v5 = objc_opt_new(SDDeviceAssetTask);
  v6 = objc_opt_new(NSDate);
  -[SDDeviceAssetTask setDate:](v5, "setDate:", v6);

  -[SDDeviceAssetTask setQuery:](v5, "setQuery:", v4);
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableSet addObject:](v7->_tasks, "addObject:", v5);
  objc_sync_exit(v7);

  v8 = objc_alloc((Class)SFDeviceAssetRequestConfiguration);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10004AD54;
  v15 = &unk_100714D10;
  v16 = v4;
  v17 = v5;
  v9 = v5;
  v10 = v4;
  v11 = objc_msgSend(v8, "initWithQueryResultHandler:", &v12);
  objc_msgSend(v11, "setTimeout:", 9999.0, v12, v13, v14, v15);
  -[SFDeviceAssetManager getAssetBundleForDeviceQuery:withRequestConfiguration:](v7->_deviceAssetManager, "getAssetBundleForDeviceQuery:withRequestConfiguration:", v10, v11);

}

- (os_state_data_s)stateDump
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  os_state_data_s *v11;
  os_state_data_s *v12;
  id v14;
  id v15;
  uint8_t buf[16];

  v3 = asset_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dumping state", buf, 2u);
  }

  v15 = 0;
  NSAppendPrintF(&v15, "\n");
  v5 = v15;
  v6 = objc_claimAutoreleasedReturnValue(-[SDDeviceAssetMonitor state](self, "state"));
  v7 = (void *)v6;
  if (v6)
  {
    v14 = v5;
    NSAppendPrintF(&v14, "%@\n", v6);
    v8 = v14;

    v5 = v8;
  }
  if (v5)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v5, 200, 0, 0));
    v10 = objc_msgSend(v9, "length");
    v11 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v10 + 200, 0xB1E2BB2EuLL);
    v12 = v11;
    if (v11)
    {
      v11->var0 = 1;
      v11->var1.var1 = v10;
      __strlcpy_chk(v11->var3, "Device Asset Monitor State", 64, 64);
      v9 = objc_retainAutorelease(v9);
      memcpy(v12->var4, objc_msgSend(v9, "bytes"), (size_t)v10);
    }
  }
  else
  {
    v9 = 0;
    v12 = 0;
  }

  return v12;
}

- (NSString)state
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id v6;
  NSDate *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableSet *v12;
  NSMutableSet *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSMutableSet *v18;
  uint64_t v19;
  NSMutableSet *v20;
  NSMutableSet *v22;
  NSMutableSet *v23;
  NSMutableSet *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _BYTE v33[128];

  v32 = 0;
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v32, "-- %@ --\n", v5);
  v6 = v32;

  v31 = v6;
  v7 = objc_opt_new(NSDate);
  NSAppendPrintF(&v31, "Current Date: %@\n", v7);
  v8 = v31;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceAssetManager networkStatus](self->_deviceAssetManager, "networkStatus"));
  if (v9)
  {
    v30 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceAssetManager networkStatus](self->_deviceAssetManager, "networkStatus"));
    NSAppendPrintF(&v30, "%@\n", v10);
    v11 = v30;

    v8 = v11;
  }
  v29 = v8;
  NSAppendPrintF(&v29, "## Tasks:\n");
  v12 = (NSMutableSet *)v29;

  if (-[NSMutableSet count](self->_tasks, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = self->_tasks;
    v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        v18 = v12;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v17);
          v24 = v18;
          NSAppendPrintF(&v24, "    %@\n", v19);
          v12 = v24;

          v17 = (char *)v17 + 1;
          v18 = v12;
        }
        while (v15 != v17);
        v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v15);
    }
  }
  else
  {
    v23 = v12;
    NSAppendPrintF(&v23, "    None\n");
    v13 = v12;
    v12 = v23;
  }

  v22 = v12;
  NSAppendPrintF(&v22, "Device Asset Monitor State End\n");
  v20 = v22;

  return (NSString *)v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_bluetoothClient, 0);
  objc_storeStrong((id *)&self->_bluetoothDevices, 0);
  objc_storeStrong((id *)&self->_deviceAssetManager, 0);
}

@end
