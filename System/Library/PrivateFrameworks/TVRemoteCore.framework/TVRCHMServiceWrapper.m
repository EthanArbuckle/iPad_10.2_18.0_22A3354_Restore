@implementation TVRCHMServiceWrapper

+ (id)wrapperWithService:(id)a3
{
  id v3;
  TVRCHMServiceWrapper *v4;

  v3 = a3;
  v4 = -[TVRCHMServiceWrapper initWithService:]([TVRCHMServiceWrapper alloc], "initWithService:", v3);

  return v4;
}

- (TVRCHMServiceWrapper)initWithService:(id)a3
{
  id v5;
  TVRCHMServiceWrapper *v6;
  TVRCHMServiceWrapper *v7;
  uint64_t v8;
  HMAccessory *accessory;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TVRCHMServiceWrapper;
  v6 = -[TVRCHMServiceWrapper init](&v12, sel_init);
  v7 = v6;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    objc_msgSend(v5, "accessory");
    v8 = objc_claimAutoreleasedReturnValue();
    accessory = v7->_accessory;
    v7->_accessory = (HMAccessory *)v8;

    v7->_connected = 0;
    objc_msgSend(v5, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCHMServiceWrapper _checkVolumeServicesForAccessory:](v7, "_checkVolumeServicesForAccessory:", v10);

    -[TVRCHMServiceWrapper _setCharacteristicsForService:](v7, "_setCharacteristicsForService:", v5);
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCHMServiceWrapper name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("name"));

  -[TVRCHMServiceWrapper model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("model"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCHMServiceWrapper connected](self, "connected"), CFSTR("connected"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_service, CFSTR("underlyingHMService"));
  -[TVRCHMServiceWrapper identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("identifier"));

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)name
{
  return -[HMService name](self->_service, "name");
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[HMService accessory](self->_service, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)model
{
  void *v2;
  void *v3;
  void *v4;
  __CFString **v5;
  int v6;
  NSString *v7;

  -[HMService accessory](self->_service, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD4A60]) & 1) != 0)
  {
    v5 = TVRCDeviceModelTypeAirplaySetTopBox;
  }
  else
  {
    v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD4A68]);
    v5 = TVRCDeviceModelTypeAirplayTelevision;
    if (v6)
      v5 = TVRCDeviceModelTypeAirplayStick;
  }
  v7 = *v5;

  return v7;
}

- (void)connect
{
  NSObject *v3;
  HMService *service;
  HMService *v5;
  HMHome *v6;
  HMHome *home;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *WeakRetained;
  HMService *v14;
  uint64_t v15;
  int v16;
  HMService *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!self->_connected)
  {
    _TVRCHomeKitLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      service = self->_service;
      v16 = 138412290;
      v17 = service;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to connect service %@", (uint8_t *)&v16, 0xCu);
    }

    -[HMService accessory](self->_service, "accessory");
    v5 = (HMService *)objc_claimAutoreleasedReturnValue();
    -[HMService home](v5, "home");
    v6 = (HMHome *)objc_claimAutoreleasedReturnValue();
    home = self->_home;
    self->_home = v6;

    _TVRCHomeKitLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        v16 = 138412290;
        v17 = v5;
        _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Found parent accessory %@", (uint8_t *)&v16, 0xCu);
      }

      v10 = -[HMService isReachable](v5, "isReachable");
      _TVRCHomeKitLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          v16 = 138412290;
          v17 = v5;
          _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Accessory %@ is reachable and local. Informing delegate that we can connect", (uint8_t *)&v16, 0xCu);
        }

        self->_connected = 1;
        -[TVRCHMServiceWrapper _startObservingServiceNotifications](self, "_startObservingServiceNotifications");
        -[TVRCHMServiceWrapper _updatePowerState](self, "_updatePowerState");
        -[TVRCHMServiceWrapper _updateMuteState](self, "_updateMuteState");
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "connectedToService:", self);
        goto LABEL_18;
      }
      if (v12)
      {
        v16 = 138412290;
        v17 = v5;
        _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "Accessory %@ is not reachable or local. Informing delegate that we disconnected", (uint8_t *)&v16, 0xCu);
      }

      v15 = 300;
    }
    else
    {
      if (v9)
      {
        v14 = self->_service;
        v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Could not find accessory for service %@. Informing delegate that we disconnected", (uint8_t *)&v16, 0xCu);
      }

      v15 = 301;
    }
    TVRCMakeError(v15, 0);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCHMServiceWrapper _disconnectWithError:](self, "_disconnectWithError:", WeakRetained);
LABEL_18:

  }
}

- (void)disconnect
{
  -[TVRCHMServiceWrapper _disconnectWithError:](self, "_disconnectWithError:", 0);
}

- (void)sendButtonEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "eventType");
  if (v4 == 2)
  {
    v7 = -[TVRCHMServiceWrapper _remoteKeyForTVRCButton:](self, "_remoteKeyForTVRCButton:", v10);
    if (v7 != -1)
      -[TVRCHMServiceWrapper _sendRemoteKey:](self, "_sendRemoteKey:", v7);
    objc_msgSend(v10, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "buttonType");

    if (!-[TVRCHMServiceWrapper isTVAwake](self, "isTVAwake") && v9 != 30)
      -[TVRCHMServiceWrapper _sendWakeKey](self, "_sendWakeKey");
    if (v9 == 29)
    {
      -[TVRCHMServiceWrapper _sendMuteKey](self, "_sendMuteKey");
    }
    else if (v9 == 30)
    {
      -[TVRCHMServiceWrapper _togglePowerButton](self, "_togglePowerButton");
    }
  }
  else if (v4 == 1)
  {
    objc_msgSend(v10, "button");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "buttonType");

    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
      -[TVRCHMServiceWrapper _sendVolumeKey:](self, "_sendVolumeKey:", v6 == 10);
  }

}

- (BOOL)supportsVolumeControl
{
  return self->_volumeControlSupported && self->_volumeSelectorCharacteristic != 0;
}

- (BOOL)supportsMute
{
  return self->_muteCharacteristic != 0;
}

- (BOOL)supportsInfoKey
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HMCharacteristic metadata](self->_serviceCharacteristic, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "validValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (BOOL)supportsPowerButton
{
  return self->_activeCharacteristic != 0;
}

- (void)_startObservingServiceNotifications
{
  id v3;

  if (self->_service)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__serviceNameChanged_, CFSTR("TVRCMatchPointServiceNameChangedNotification"), self->_service);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__serviceRemoved_, CFSTR("TVRCMatchPointServiceRemovedNotification"), self->_service);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__serviceActiveStateChanged_, CFSTR("TVRCMatchPointServiceActiveStateChangedNotification"), self->_service);

  }
}

- (void)_stopObservingServiceNotifications
{
  id v3;

  if (self->_service)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("TVRCMatchPointServiceNameChangedNotification"), self->_service);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("TVRCMatchPointServiceRemovedNotification"), self->_service);

  }
}

- (void)_serviceNameChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  HMService *service;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  HMService *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _TVRCHomeKitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    service = self->_service;
    v7 = v5;
    -[TVRCHMServiceWrapper name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v5;
    v13 = 2112;
    v14 = service;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "%@ got notification that services updated name %@. New name : %@", (uint8_t *)&v11, 0x20u);

  }
  if (self->_connected)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[TVRCHMServiceWrapper name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "service:updatedName:", self, v10);

  }
}

- (void)_serviceRemoved:(id)a3
{
  NSObject *v4;
  void *v5;
  HMService *service;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  HMService *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _TVRCHomeKitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    service = self->_service;
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = service;
    v7 = v5;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ got notification that services went away %@. Disconnecting if still connected", (uint8_t *)&v9, 0x16u);

  }
  if (self->_connected)
  {
    TVRCMakeError(300, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCHMServiceWrapper _disconnectWithError:](self, "_disconnectWithError:", v8);

  }
}

- (void)_serviceActiveStateChanged:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TVRCMatchPointServiceActiveStateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Received notification that activeState changed to %@", (uint8_t *)&v6, 0xCu);
  }

}

- (BOOL)isTVAwake
{
  return -[TVRCHMServiceWrapper currentActiveState](self, "currentActiveState") == 1;
}

- (void)_disconnectWithError:(id)a3
{
  id v4;
  NSObject *v5;
  HMService *service;
  HMHome *home;
  id WeakRetained;
  int v9;
  HMService *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    v9 = 138412546;
    v10 = service;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to disconnect service %@ with error %{public}@", (uint8_t *)&v9, 0x16u);
  }

  if (self->_connected)
    -[TVRCHMServiceWrapper _stopObservingServiceNotifications](self, "_stopObservingServiceNotifications");
  *(_WORD *)&self->_connected = 0;
  home = self->_home;
  self->_home = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "disconnectedFromService:error:", self, v4);

}

- (void)_sendRemoteKey:(int64_t)a3
{
  NSObject *v5;
  HMService *service;
  NSObject *v7;
  HMService *v8;
  int v9;
  int64_t v10;
  __int16 v11;
  HMService *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    v9 = 134218242;
    v10 = a3;
    v11 = 2112;
    v12 = service;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to send key of type %ld to service %@", (uint8_t *)&v9, 0x16u);
  }

  if (self->_serviceCharacteristic)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    -[TVRCHMServiceWrapper _writeValue:toCharacteristic:](self, "_writeValue:toCharacteristic:", v7, self->_serviceCharacteristic);
  }
  else
  {
    _TVRCHomeKitLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_service;
      v9 = 138412290;
      v10 = (int64_t)v8;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "No characteristic of type HMCharacteristicRemoteKey exists for service %@", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)_sendWakeKey
{
  NSObject *v3;
  HMService *service;
  NSObject *v5;
  HMService *v6;
  int v7;
  HMService *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TVRCHomeKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    v7 = 138412290;
    v8 = service;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Sending wake key to service %@", (uint8_t *)&v7, 0xCu);
  }

  if (self->_activeCharacteristic)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    -[TVRCHMServiceWrapper _writeValue:toCharacteristic:](self, "_writeValue:toCharacteristic:", v5, self->_activeCharacteristic);
  }
  else
  {
    _TVRCHomeKitLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_service;
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "No characteristic of type HMCharacteristicTypeActive exists for service %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)_updatePowerState
{
  NSObject *v3;
  HMCharacteristic *activeCharacteristic;
  _QWORD v5[4];
  id v6;
  id buf[2];

  if (self->_activeCharacteristic)
  {
    _TVRCHomeKitLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Reading value for HMCharacteristicTypeActive", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    activeCharacteristic = self->_activeCharacteristic;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __41__TVRCHMServiceWrapper__updatePowerState__block_invoke;
    v5[3] = &unk_24DCD81E8;
    objc_copyWeak(&v6, buf);
    -[HMCharacteristic readValueWithCompletionHandler:](activeCharacteristic, "readValueWithCompletionHandler:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __41__TVRCHMServiceWrapper__updatePowerState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "activeCharacteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      _TVRCHomeKitLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __41__TVRCHMServiceWrapper__updatePowerState__block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(v5, "activeCharacteristic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v8 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setCurrentActiveState:", (int)-[NSObject intValue](v8, "intValue"));
      _TVRCHomeKitLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134217984;
        v12 = objc_msgSend(v5, "currentActiveState");
        _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Received value for HMCharacteristicTypeActive. Setting currentActiveState to %ld", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)_updateMuteState
{
  NSObject *v3;
  HMCharacteristic *muteCharacteristic;
  _QWORD v5[4];
  id v6;
  id buf[2];

  if (self->_muteCharacteristic)
  {
    _TVRCHomeKitLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Reading value for HMCharacteristicTypeMute", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    muteCharacteristic = self->_muteCharacteristic;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __40__TVRCHMServiceWrapper__updateMuteState__block_invoke;
    v5[3] = &unk_24DCD81E8;
    objc_copyWeak(&v6, buf);
    -[HMCharacteristic readValueWithCompletionHandler:](muteCharacteristic, "readValueWithCompletionHandler:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __40__TVRCHMServiceWrapper__updateMuteState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "activeCharacteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      _TVRCHomeKitLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __41__TVRCHMServiceWrapper__updatePowerState__block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(v5, "muteCharacteristic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v8 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setMuteEnabled:", -[NSObject BOOLValue](v8, "BOOLValue"));
      _TVRCHomeKitLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = objc_msgSend(v5, "muteEnabled");
        _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Received value for HMCharacteristicTypeMute. Setting muteEnabled to %{BOOL}d", (uint8_t *)v11, 8u);
      }

    }
  }

}

- (void)_togglePowerButton
{
  NSObject *v3;
  HMService *service;
  _BOOL4 v5;
  unint64_t v6;
  HMCharacteristic *activeCharacteristic;
  void *v8;
  NSObject *v9;
  HMService *v10;
  _QWORD v11[4];
  id v12[2];
  uint8_t buf[4];
  HMService *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _TVRCHomeKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412290;
    v14 = service;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Toggling power for service %@", buf, 0xCu);
  }

  if (self->_activeCharacteristic)
  {
    v5 = -[TVRCHMServiceWrapper isTVAwake](self, "isTVAwake");
    objc_initWeak((id *)buf, self);
    v6 = !v5;
    activeCharacteristic = self->_activeCharacteristic;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__TVRCHMServiceWrapper__togglePowerButton__block_invoke;
    v11[3] = &unk_24DCD8210;
    objc_copyWeak(v12, (id *)buf);
    v12[1] = (id)v6;
    -[HMCharacteristic writeValue:completionHandler:](activeCharacteristic, "writeValue:completionHandler:", v8, v11);

    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _TVRCHomeKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_service;
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "No characteristic of type HMCharacteristicTypeActive exists for service %@", buf, 0xCu);
    }

  }
}

void __42__TVRCHMServiceWrapper__togglePowerButton__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCHomeKitLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __42__TVRCHMServiceWrapper__togglePowerButton__block_invoke_cold_1();

    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "activeCharacteristic");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Successfully wrote value %@ to characteristic %@", (uint8_t *)&v10, 0x16u);

      }
      objc_msgSend(WeakRetained, "setCurrentActiveState:", *(_QWORD *)(a1 + 40));
    }
  }

}

- (void)_sendVolumeKey:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  HMService *service;
  NSObject *v8;
  HMService *v9;
  int v10;
  HMService *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  _TVRCHomeKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    service = self->_service;
    if (v3)
      v6 = CFSTR("YES");
    v10 = 138412546;
    v11 = service;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Sending volume key to service %@ with increment %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (self->_volumeSelectorCharacteristic)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", !v3);
    v8 = objc_claimAutoreleasedReturnValue();
    -[TVRCHMServiceWrapper _writeValue:toCharacteristic:](self, "_writeValue:toCharacteristic:", v8, self->_volumeSelectorCharacteristic);
  }
  else
  {
    _TVRCHomeKitLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_service;
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "No characteristic of type HMCharacteristicTypeVolumeSelector exists for service %@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)_sendMuteKey
{
  NSObject *v3;
  HMService *service;
  _BOOL4 v5;
  BOOL v6;
  HMCharacteristic *muteCharacteristic;
  void *v8;
  NSObject *v9;
  HMService *v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  HMService *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _TVRCHomeKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412290;
    v15 = service;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Sending mute key to service %@", buf, 0xCu);
  }

  if (self->_muteCharacteristic)
  {
    v5 = -[TVRCHMServiceWrapper muteEnabled](self, "muteEnabled");
    objc_initWeak((id *)buf, self);
    v6 = !v5;
    muteCharacteristic = self->_muteCharacteristic;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", !v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36__TVRCHMServiceWrapper__sendMuteKey__block_invoke;
    v11[3] = &unk_24DCD8238;
    objc_copyWeak(&v12, (id *)buf);
    v13 = v6;
    -[HMCharacteristic writeValue:completionHandler:](muteCharacteristic, "writeValue:completionHandler:", v8, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _TVRCHomeKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_service;
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "No characteristic of type HMCharacteristicTypeMute exists for service %@", buf, 0xCu);
    }

  }
}

void __36__TVRCHMServiceWrapper__sendMuteKey__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCHomeKitLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __36__TVRCHMServiceWrapper__sendMuteKey__block_invoke_cold_1();

    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "muteCharacteristic");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Successfully wrote value %@ to characteristic %@", (uint8_t *)&v10, 0x16u);

      }
      objc_msgSend(WeakRetained, "setMuteEnabled:", *(unsigned __int8 *)(a1 + 40));
    }
  }

}

- (int64_t)_remoteKeyForTVRCButton:(id)a3
{
  void *v3;
  uint64_t v4;
  int64_t result;
  int64_t v6;

  objc_msgSend(a3, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buttonType");

  result = -1;
  switch(v4)
  {
    case 12:
      result = 4;
      break;
    case 13:
      result = 5;
      break;
    case 14:
      result = 6;
      break;
    case 15:
      result = 7;
      break;
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
      return result;
    case 23:
      result = 9;
      break;
    case 24:
      result = 10;
      break;
    case 25:
      result = 15;
      break;
    default:
      v6 = 8;
      if (v4 != 1)
        v6 = -1;
      if (v4 == 5)
        result = 11;
      else
        result = v6;
      break;
  }
  return result;
}

- (id)_televisionServiceForAccessory:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "services", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x24BDD6C70];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "serviceType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v7);

        if (v11)
        {
          v12 = v9;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)_setCharacteristicsForService:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  HMCharacteristic **p_serviceCharacteristic;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  HMCharacteristic **location;
  id v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v23 = a3;
  objc_msgSend(v23, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    v8 = *MEMORY[0x24BDD5990];
    v9 = *MEMORY[0x24BDD5770];
    location = &self->_activeCharacteristic;
    p_serviceCharacteristic = &self->_serviceCharacteristic;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        _TVRCHomeKitLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "localizedDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v21;
          v31 = 2112;
          v32 = v23;
          _os_log_debug_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEBUG, "Found characteristic, %{public}@ for service %@", buf, 0x16u);

        }
        objc_msgSend(v12, "characteristicType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v8);

        if (v15)
        {
          _TVRCHomeKitLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v12;
            v31 = 2112;
            v32 = v23;
            _os_log_impl(&dword_21A51B000, v16, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicRemoteKey, %{public}@ for service %@", buf, 0x16u);
          }

          v17 = (id *)p_serviceCharacteristic;
        }
        else
        {
          objc_msgSend(v12, "characteristicType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v9);

          if (!v19)
            goto LABEL_17;
          _TVRCHomeKitLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v12;
            v31 = 2112;
            v32 = v23;
            _os_log_impl(&dword_21A51B000, v20, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicTypeActive, %{public}@ for service %@", buf, 0x16u);
          }

          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = __54__TVRCHMServiceWrapper__setCharacteristicsForService___block_invoke;
          v24[3] = &unk_24DCD8260;
          v24[4] = v12;
          objc_msgSend(v12, "enableNotification:completionHandler:", 1, v24);
          v17 = (id *)location;
        }
        objc_storeStrong(v17, v12);
LABEL_17:
        ++v11;
      }
      while (v6 != v11);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v6);
  }

}

void __54__TVRCHMServiceWrapper__setCharacteristicsForService___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  _TVRCHomeKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __54__TVRCHMServiceWrapper__setCharacteristicsForService___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Enabled notifications for HMCharacteristicTypeActive", v5, 2u);
  }

}

- (void)_checkVolumeServicesForAccessory:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  HMCharacteristic **p_volumeSelectorCharacteristic;
  void *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(a3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    v8 = *MEMORY[0x24BDD6C48];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v7)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v9);
      objc_msgSend(v10, "serviceType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v8);

      if ((v12 & 1) != 0)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (!v6)
          goto LABEL_32;
        goto LABEL_3;
      }
    }
    v13 = v10;

    if (v13)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = v13;
      objc_msgSend(v13, "characteristics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      if (!v15)
        goto LABEL_31;
      v16 = v15;
      v17 = *(_QWORD *)v36;
      v18 = *MEMORY[0x24BDD5A98];
      v19 = *MEMORY[0x24BDD5AA0];
      v32 = *MEMORY[0x24BDD5920];
      while (1)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v21, "characteristicType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", v18);

          if (v23)
          {
            _TVRCHomeKitLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v44 = v21;
              v45 = 2112;
              v46 = v33;
              _os_log_impl(&dword_21A51B000, v24, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicTypeVolume, %{public}@ for service %@", buf, 0x16u);
            }

            self->_volumeControlSupported = 1;
          }
          else
          {
            objc_msgSend(v21, "characteristicType");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", v19);

            if (v26)
            {
              _TVRCHomeKitLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v44 = v21;
                v45 = 2112;
                v46 = v33;
                _os_log_impl(&dword_21A51B000, v27, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicTypeVolumeSelector, %{public}@ for service %@", buf, 0x16u);
              }

              self->_volumeControlSupported = 1;
              p_volumeSelectorCharacteristic = &self->_volumeSelectorCharacteristic;
            }
            else
            {
              objc_msgSend(v21, "characteristicType");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "isEqualToString:", v32);

              if (!v30)
                continue;
              _TVRCHomeKitLog();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v44 = v21;
                v45 = 2112;
                v46 = v33;
                _os_log_impl(&dword_21A51B000, v31, OS_LOG_TYPE_DEFAULT, "Found characteristic of type HMCharacteristicTypeMute, %{public}@ for service %@", buf, 0x16u);
              }

              v34[0] = MEMORY[0x24BDAC760];
              v34[1] = 3221225472;
              v34[2] = __57__TVRCHMServiceWrapper__checkVolumeServicesForAccessory___block_invoke;
              v34[3] = &unk_24DCD8260;
              v34[4] = v21;
              objc_msgSend(v21, "enableNotification:completionHandler:", 1, v34);
              p_volumeSelectorCharacteristic = &self->_muteCharacteristic;
            }
            objc_storeStrong((id *)p_volumeSelectorCharacteristic, v21);
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        if (!v16)
        {
LABEL_31:

          v4 = v33;
          goto LABEL_32;
        }
      }
    }
  }
  else
  {
LABEL_32:

  }
}

void __57__TVRCHMServiceWrapper__checkVolumeServicesForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  _TVRCHomeKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __54__TVRCHMServiceWrapper__setCharacteristicsForService___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Enabled notifications for HMCharacteristicTypeMute", v5, 2u);
  }

}

- (id)_writeRequestForCharacteristic:(id)a3 withValue:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD75F8], "writeRequestWithCharacteristic:value:", a3, a4);
}

- (void)_writeValue:(id)a3 toCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  HMHome *home;
  NSObject *v15;
  NSObject *v16;
  HMHome *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  HMHome *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD75F8], "writeRequestWithCharacteristic:value:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD75C0];
  v34[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "characteristicBatchRequestWithWriteRequests:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __53__TVRCHMServiceWrapper__writeValue_toCharacteristic___block_invoke;
  v27 = &unk_24DCD8288;
  v12 = v7;
  v28 = v12;
  v13 = v6;
  v29 = v13;
  objc_msgSend(v11, "setCompletionHandler:", &v24);
  objc_msgSend(v11, "setProgressHandler:", &__block_literal_global_8, v24, v25, v26, v27);
  home = self->_home;
  _TVRCHomeKitLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (home)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_home;
      *(_DWORD *)buf = 138412546;
      v31 = v11;
      v32 = 2112;
      v33 = v17;
      _os_log_impl(&dword_21A51B000, v16, OS_LOG_TYPE_DEFAULT, "Performing Batch Characteristic Write Request %@, on home %@", buf, 0x16u);
    }

    -[HMHome performBatchCharacteristicRequest:](self->_home, "performBatchCharacteristicRequest:", v11);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[TVRCHMServiceWrapper _writeValue:toCharacteristic:].cold.1((uint64_t)v11, v16, v18, v19, v20, v21, v22, v23);

  }
}

void __53__TVRCHMServiceWrapper__writeValue_toCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _TVRCHomeKitLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__TVRCHMServiceWrapper__writeValue_toCharacteristic___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Successfully wrote value %@ to characteristic %@", (uint8_t *)&v8, 0x16u);

  }
}

void __53__TVRCHMServiceWrapper__writeValue_toCharacteristic___block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _TVRCHomeKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Batch Characteristic Write progress handler called - %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_readValueForCharacteristic:(id)a3 completionHandler:(id)a4
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
  HMHome *home;
  NSObject *v17;
  NSObject *v18;
  HMHome *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  HMHome *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD75D0], "readRequestWithCharacteristic:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD75C0];
  v35[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "characteristicBatchRequestWithReadRequests:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke;
  v29[3] = &unk_24DCD82F0;
  v13 = v7;
  v30 = v13;
  objc_msgSend(v11, "setProgressHandler:", v29);
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke_29;
  v26[3] = &unk_24DCD8318;
  v14 = v6;
  v27 = v14;
  v15 = v13;
  v28 = v15;
  objc_msgSend(v11, "setCompletionHandler:", v26);
  home = self->_home;
  _TVRCHomeKitLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (home)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_home;
      *(_DWORD *)buf = 138412546;
      v32 = v11;
      v33 = 2112;
      v34 = v19;
      _os_log_impl(&dword_21A51B000, v18, OS_LOG_TYPE_DEFAULT, "Performing Batch Characteristic Read Request %@, on home %@", buf, 0x16u);
    }

    -[HMHome performBatchCharacteristicRequest:](self->_home, "performBatchCharacteristicRequest:", v11);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[TVRCHMHomeObserver _readCharacteristic:completion:].cold.1((uint64_t)v11, v18, v20, v21, v22, v23, v24, v25);

  }
}

void __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        _TVRCHomeKitLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "request");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "characteristic");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v19 = v9;
          v20 = 2112;
          v21 = v12;
          _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Received value %@ for read request on characteristic %@", buf, 0x16u);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v4);
  }

}

void __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _TVRCHomeKitLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke_29_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (TVRCHMServiceWrapperDelegate)delegate
{
  return (TVRCHMServiceWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HMService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (HMCharacteristic)serviceCharacteristic
{
  return self->_serviceCharacteristic;
}

- (void)setServiceCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_serviceCharacteristic, a3);
}

- (HMCharacteristic)activeCharacteristic
{
  return self->_activeCharacteristic;
}

- (void)setActiveCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_activeCharacteristic, a3);
}

- (HMCharacteristic)volumeSelectorCharacteristic
{
  return self->_volumeSelectorCharacteristic;
}

- (void)setVolumeSelectorCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_volumeSelectorCharacteristic, a3);
}

- (HMCharacteristic)muteCharacteristic
{
  return self->_muteCharacteristic;
}

- (void)setMuteCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_muteCharacteristic, a3);
}

- (BOOL)sentWakeKey
{
  return self->_sentWakeKey;
}

- (void)setSentWakeKey:(BOOL)a3
{
  self->_sentWakeKey = a3;
}

- (BOOL)volumeControlSupported
{
  return self->_volumeControlSupported;
}

- (void)setVolumeControlSupported:(BOOL)a3
{
  self->_volumeControlSupported = a3;
}

- (int64_t)currentActiveState
{
  return self->_currentActiveState;
}

- (void)setCurrentActiveState:(int64_t)a3
{
  self->_currentActiveState = a3;
}

- (BOOL)muteEnabled
{
  return self->_muteEnabled;
}

- (void)setMuteEnabled:(BOOL)a3
{
  self->_muteEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteCharacteristic, 0);
  objc_storeStrong((id *)&self->_volumeSelectorCharacteristic, 0);
  objc_storeStrong((id *)&self->_activeCharacteristic, 0);
  objc_storeStrong((id *)&self->_serviceCharacteristic, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __41__TVRCHMServiceWrapper__updatePowerState__block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21A51B000, v0, (uint64_t)v0, "Failed to read to chacratersitic %@. Error : %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

void __42__TVRCHMServiceWrapper__togglePowerButton__block_invoke_cold_1()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "activeCharacteristic");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_21A51B000, v3, v4, "Failed to write to characteristic %@. Error : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __36__TVRCHMServiceWrapper__sendMuteKey__block_invoke_cold_1()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4();
  objc_msgSend(v0, "muteCharacteristic");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_21A51B000, v3, v4, "Failed to write to characteristic %@. Error : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __54__TVRCHMServiceWrapper__setCharacteristicsForService___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v0), "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_21A51B000, v2, v3, "Failed to enable notification for characteristic %@. Error : %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_writeValue:(uint64_t)a3 toCharacteristic:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21A51B000, a2, a3, "Could not perform Batch Characteristic Write Request %@ since no valid home was found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __53__TVRCHMServiceWrapper__writeValue_toCharacteristic___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v0), "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_21A51B000, v2, v3, "Failed to write to characteristic %@. Error : %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __70__TVRCHMServiceWrapper__readValueForCharacteristic_completionHandler___block_invoke_29_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v0), "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_21A51B000, v2, v3, "Failed to read to chacratersitic %@. Error : %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
