@implementation TVRCHMHomeObserver

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_7);
  return (id)sharedInstance___sharedInstance;
}

void __36__TVRCHMHomeObserver_sharedInstance__block_invoke()
{
  TVRCHMHomeObserver *v0;
  void *v1;

  v0 = objc_alloc_init(TVRCHMHomeObserver);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (TVRCHMHomeObserver)init
{
  TVRCHMHomeObserver *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *serviceToAccessoryIDMapping;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVRCHMHomeObserver;
  v2 = -[TVRCHMHomeObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    serviceToAccessoryIDMapping = v2->_serviceToAccessoryIDMapping;
    v2->_serviceToAccessoryIDMapping = v3;

  }
  return v2;
}

- (void)setCurrentHome:(id)a3
{
  HMHome *v5;
  NSObject *v6;
  HMHome *currentHome;
  HMHome *v8;
  int v9;
  HMHome *v10;
  __int16 v11;
  HMHome *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (HMHome *)a3;
  _TVRCHomeKitLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentHome = self->_currentHome;
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = currentHome;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Setting home to be observed as %{public}@. Previous home - %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = v5;
  if (self->_currentHome != v5)
  {
    -[NSMutableDictionary removeAllObjects](self->_serviceToAccessoryIDMapping, "removeAllObjects", v5);
    -[HMHome setDelegate:](v5, "setDelegate:", self);
    -[HMHome setDelegate:](self->_currentHome, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_currentHome, a3);
    v8 = self->_currentHome;
  }
  if (v8)
    -[TVRCHMHomeObserver _updateAccessoriesForHome:](self, "_updateAccessoriesForHome:");

}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _TVRCHomeKitLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it added accessory %{public}@, for home %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[TVRCHMHomeObserver _updateServicesForAccessory:](self, "_updateServicesForAccessory:", v7);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _TVRCHomeKitLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v7;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it removed accessory %{public}@ from home %{public}@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v7, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCHMHomeObserver serviceToAccessoryIDMapping](self, "serviceToAccessoryIDMapping");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    _TVRCHomeKitLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_21A51B000, v12, OS_LOG_TYPE_DEFAULT, "Removing accessory %{public}@ from device list because it was removed from the Home", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(v7, "setDelegate:", 0);
    -[TVRCHMHomeObserver serviceToAccessoryIDMapping](self, "serviceToAccessoryIDMapping");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v9);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("TVRCMatchPointServiceRemovedNotification"), v11);

  }
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = v4;
    v8 = 1024;
    v9 = objc_msgSend(v4, "isReachable");
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated reachability for accessory %{public}@. Reachable %{BOOL}d", (uint8_t *)&v6, 0x12u);
  }

  -[TVRCHMHomeObserver _updateServicesForAccessory:](self, "_updateServicesForAccessory:", v4);
}

- (void)accessoryDidUpdateReachableTransports:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "reachableTransports");
  _TVRCHomeKitLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = v4;
    v9 = 1024;
    v10 = v5 & 1;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated Reachable Transports for accessory %{public}@. Has IP Transport - %{BOOL}d", (uint8_t *)&v7, 0x12u);
  }

  -[TVRCHMHomeObserver _updateServicesForAccessory:](self, "_updateServicesForAccessory:", v4);
}

- (void)accessory:(id)a3 didUpdateNameForService:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  _TVRCHomeKitLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated service name for service %{public}@, of accessory %{public}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("TVRCMatchPointServiceNameChangedNotification"), v6);

}

- (void)accessoryDidUpdateServices:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated services for accessory %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[TVRCHMHomeObserver _updateServicesForAccessory:](self, "_updateServicesForAccessory:", v4);
}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  _TVRCHomeKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "characteristicType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    v27 = 2114;
    v28 = v7;
    _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "HomeKit informed us that it updated characteristic: %{public}@ desc: %@ for accessory %{public}@", buf, 0x20u);

  }
  objc_msgSend(v9, "characteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD5770]);

  if (v14)
  {
    _TVRCHomeKitLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v16;
      _os_log_impl(&dword_21A51B000, v15, OS_LOG_TYPE_DEFAULT, "Active characteristic updated to: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v9, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value", CFSTR("TVRCMatchPointServiceActiveStateKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("TVRCMatchPointServiceActiveStateChangedNotification"), v8, v20);

    }
  }

}

- (void)_updateAccessoriesForHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Updating accessories for home %{public}@", buf, 0xCu);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v4, "accessories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[TVRCHMHomeObserver _updateServicesForAccessory:](self, "_updateServicesForAccessory:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_updateServicesForAccessory:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TVRCHMHomeObserver *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__TVRCHMHomeObserver__updateServicesForAccessory___block_invoke;
  v6[3] = &unk_24DCD8148;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TVRCHMHomeObserver _checkAccessoryReachabilityAndFetchTVServices:withCompletion:](self, "_checkAccessoryReachabilityAndFetchTVServices:withCompletion:", v5, v6);

}

void __50__TVRCHMHomeObserver__updateServicesForAccessory___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v8)
    {
      v9 = v8;
      v20 = v5;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "serviceToAccessoryIDMapping");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v12, v6);

          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "postNotificationName:object:", CFSTR("TVRCMatchPointServiceAddedNotification"), v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v9);
      v5 = v20;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "serviceToAccessoryIDMapping");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _TVRCHomeKitLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v26 = v17;
        _os_log_impl(&dword_21A51B000, v16, OS_LOG_TYPE_DEFAULT, "Removing accessory because it is no longer reachable or does not have a service type of HMServiceTypeTelevision anymore, %{public}@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
      objc_msgSend(*(id *)(a1 + 40), "serviceToAccessoryIDMapping");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:", v6);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:", CFSTR("TVRCMatchPointServiceRemovedNotification"), v7);

    }
  }

}

- (void)_checkAccessoryReachabilityAndFetchTVServices:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  id v36;
  TVRCHMHomeObserver *v37;
  id v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  _BYTE v57[10];
  __int16 v58;
  _BOOL4 v59;
  _BYTE v60[128];
  uint64_t v61;

  v37 = self;
  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v38 = a4;
  v39 = v5;
  v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v5, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v50;
    v10 = *MEMORY[0x24BDD6C70];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v12, "serviceType", v37);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v10);

        if (v14)
        {
          _TVRCHomeKitLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v55 = v12;
            v56 = 2114;
            *(_QWORD *)v57 = v39;
            _os_log_impl(&dword_21A51B000, v15, OS_LOG_TYPE_DEFAULT, "Found service %{public}@ with type HMServiceTypeTelevision in accessory %{public}@", buf, 0x16u);
          }

          objc_msgSend(v40, "addObject:", v12);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v40, "count"))
  {
    _TVRCHomeKitLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_40;
    *(_DWORD *)buf = 138543362;
    v55 = v39;
    v23 = "No Television service found in accessory %{public}@. Skipping it";
    goto LABEL_39;
  }
  v16 = objc_msgSend(v39, "isReachable");
  v17 = objc_msgSend(v39, "suspendedState");
  v18 = objc_msgSend(v39, "reachableTransports") & 1;
  _TVRCHomeKitLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v55 = v39;
    v56 = 1024;
    *(_DWORD *)v57 = v16;
    *(_WORD *)&v57[4] = 1024;
    *(_DWORD *)&v57[6] = v18;
    v58 = 1024;
    v59 = v17 == 3;
    _os_log_impl(&dword_21A51B000, v19, OS_LOG_TYPE_DEFAULT, "Accessory %{public}@ reachable: %{BOOL}d | locally reachable: %{BOOL}d | suspended: %{BOOL}d", buf, 0x1Eu);
  }

  if (v17 == 3 || (v18 ? (v20 = v16) : (v20 = 0), v20 == 1))
  {
    v21 = v38;
    if (v38)
      (*((void (**)(id, uint64_t, id))v38 + 2))(v38, 1, v40);
    goto LABEL_42;
  }
  if (v16 && !v18)
  {
    _TVRCHomeKitLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v39;
      _os_log_impl(&dword_21A51B000, v24, OS_LOG_TYPE_DEFAULT, "Accessory %{public}@ is reachable but does NOT contain ReachableTransportIP. Checking for BLE wake support...", buf, 0xCu);
    }

    objc_msgSend(v40, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v25, "characteristics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v46;
      v30 = *MEMORY[0x24BDD5778];
      while (2)
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(v26);
          v32 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v32, "characteristicType", v37);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", v30);

          if (v34)
          {
            _TVRCHomeKitLog();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v55 = v32;
              v56 = 2114;
              *(_QWORD *)v57 = v25;
              _os_log_impl(&dword_21A51B000, v35, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicTypeActiveIdentifier, %{public}@ for service %{public}@. Reading value...", buf, 0x16u);
            }

            v41[0] = MEMORY[0x24BDAC760];
            v41[1] = 3221225472;
            v41[2] = __83__TVRCHMHomeObserver__checkAccessoryReachabilityAndFetchTVServices_withCompletion___block_invoke;
            v41[3] = &unk_24DCD8170;
            v42 = v25;
            v21 = v38;
            v44 = v38;
            v43 = v40;
            v36 = v25;
            -[TVRCHMHomeObserver _readCharacteristic:completion:](v37, "_readCharacteristic:completion:", v32, v41);

            goto LABEL_42;
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v28)
          continue;
        break;
      }
    }

  }
  _TVRCHomeKitLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v39;
    v23 = "Skipping accessory %{public}@ as it not reachable and not suspended";
LABEL_39:
    _os_log_impl(&dword_21A51B000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
  }
LABEL_40:

  v21 = v38;
  if (v38)
    (*((void (**)(id, _QWORD, _QWORD))v38 + 2))(v38, 0, 0);
LABEL_42:

}

uint64_t __83__TVRCHMHomeObserver__checkAccessoryReachabilityAndFetchTVServices_withCompletion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _TVRCHomeKitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v7 = 138543618;
    v8 = v5;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Service %{public}@ locally reachable: %{BOOL}d ", (uint8_t *)&v7, 0x12u);
  }

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, a1[5]);
  return result;
}

- (void)_readCharacteristic:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  HMHome *currentHome;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  TVRCHMHomeObserver *v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[3];
  char v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  HMHome *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD75D0], "readRequestWithCharacteristic:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD75C0];
  v39[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "characteristicBatchRequestWithReadRequests:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v12 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke;
  v28[3] = &unk_24DCD8198;
  v13 = v6;
  v32 = v33;
  v29 = v13;
  v30 = self;
  v14 = v7;
  v31 = v14;
  objc_msgSend(v11, "setCompletionHandler:", v28);
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke_20;
  v25[3] = &unk_24DCD81C0;
  v25[4] = self;
  v27 = v33;
  v15 = v14;
  v26 = v15;
  objc_msgSend(v11, "setProgressHandler:", v25);
  if (self->_currentHome)
  {
    _TVRCHomeKitLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      currentHome = self->_currentHome;
      *(_DWORD *)buf = 138412546;
      v36 = v11;
      v37 = 2114;
      v38 = currentHome;
      _os_log_impl(&dword_21A51B000, v16, OS_LOG_TYPE_DEFAULT, "Performing Batch Characteristic Read Request %@, on home %{public}@", buf, 0x16u);
    }

    -[HMHome performBatchCharacteristicRequest:](self->_currentHome, "performBatchCharacteristicRequest:", v11);
  }
  else
  {
    _TVRCHomeKitLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[TVRCHMHomeObserver _readCharacteristic:completion:].cold.1((uint64_t)v11, v18, v19, v20, v21, v22, v23, v24);

  }
  _Block_object_dispose(v33, 8);

}

void __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _TVRCHomeKitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v13 = 138543618;
    v14 = v10;
    v15 = 1024;
    v16 = v11;
    v7 = "Batch Characteristic completion called with no error - %{public}@, localReachability=%{BOOL}d";
    v8 = v5;
    v9 = 18;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke_cold_1(a1, (uint64_t)v3, v5);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_checkErrorForLocallySuspendedAccessory:", v3);
  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v13 = 67109120;
    LODWORD(v14) = v6;
    v7 = "Batch Characteristic completion with error, final check to see if accessory is locally reachable, locallyReachable=%{BOOL}d";
    v8 = v5;
    v9 = 8;
LABEL_10:
    _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
  }
LABEL_11:

  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

}

void __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        _TVRCHomeKitLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v8;
          _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Batch Characteristic Read progress handler called with response - %@", buf, 0xCu);
        }

        objc_msgSend(v8, "error");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 32), "_checkErrorForLocallySuspendedAccessory:", v10))
        {
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          if (!*(_BYTE *)(v11 + 24))
          {
            *(_BYTE *)(v11 + 24) = 1;
            v12 = *(_QWORD *)(a1 + 40);
            if (v12)
              (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);

            goto LABEL_16;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_16:

}

- (BOOL)_checkErrorForLocallySuspendedAccessory:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    _TVRCHomeKitLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v3;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Checking error for locally suspended accessory %{public}@", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BDD1398]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _TVRCHomeKitLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[TVRCHMHomeObserver _checkErrorForLocallySuspendedAccessory:].cold.2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(v6, "domain");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject isEqualToString:](v14, "isEqualToString:", *MEMORY[0x24BDD5BD8]);
    if (v15)
    {
      v16 = objc_msgSend(v6, "code");

      if (v16 != 2401)
      {
        LOBYTE(v15) = 0;
        goto LABEL_13;
      }
      _TVRCHomeKitLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[TVRCHMHomeObserver _checkErrorForLocallySuspendedAccessory:].cold.1(v14);
    }

LABEL_13:
    goto LABEL_14;
  }
  LOBYTE(v15) = 1;
LABEL_14:

  return v15;
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (NSMutableDictionary)serviceToAccessoryIDMapping
{
  return self->_serviceToAccessoryIDMapping;
}

- (void)setServiceToAccessoryIDMapping:(id)a3
{
  objc_storeStrong((id *)&self->_serviceToAccessoryIDMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceToAccessoryIDMapping, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
}

- (void)_readCharacteristic:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, a2, a3, "Could not perform Batch Characteristic Read Request %@ since no valid home was found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __53__TVRCHMHomeObserver__readCharacteristic_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_21A51B000, log, OS_LOG_TYPE_ERROR, "Batch Characteristic completion called %{public}@. Error : %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_checkErrorForLocallySuspendedAccessory:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A51B000, log, OS_LOG_TYPE_ERROR, "Error code HMErrorCodeAccessorySuspendedLocally when reading active characteristic. Returning reachability as YES", v1, 2u);
}

- (void)_checkErrorForLocallySuspendedAccessory:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, a2, a3, "Underlying HomeKit Error - %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
