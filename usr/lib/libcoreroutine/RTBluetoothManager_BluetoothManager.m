@implementation RTBluetoothManager_BluetoothManager

- (BluetoothManager)bluetoothManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__RTBluetoothManager_BluetoothManager_bluetoothManager__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  if (bluetoothManager_onceToken != -1)
    dispatch_once(&bluetoothManager_onceToken, block);
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  return (BluetoothManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RTBluetoothManager_BluetoothManager;
  -[RTBluetoothManager_BluetoothManager dealloc](&v4, sel_dealloc);
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (void)updateConnections
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setObservingConnections:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_observingConnections != a3)
  {
    self->_observingConnections = a3;
    if (a3)
    {
      v4 = (void *)MEMORY[0x1E0C99E60];
      -[RTBluetoothManager_BluetoothManager bluetoothManager](self, "bluetoothManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "connectedDevices");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWithArray:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTBluetoothManager_BluetoothManager setConnectedDevices:](self, "setConnectedDevices:", v7);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_updateConnections, *MEMORY[0x1E0D033B0], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_updateConnections, *MEMORY[0x1E0D033C0], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_updateConnections, *MEMORY[0x1E0D03390], 0);
    }
    else
    {
      -[RTBluetoothManager_BluetoothManager setConnectedDevices:](self, "setConnectedDevices:", 0);
      -[RTBluetoothManager_BluetoothManager setCarKitConnectionState:](self, "setCarKitConnectionState:", 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D033B0], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0D033C0], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObserver:name:object:", self, *MEMORY[0x1E0D03390], 0);
    }

  }
}

- (void)shouldObserveConnections
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  +[RTNotification notificationName](RTBluetoothManagerNotificationConnected, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v3))
  {
    v4 = 1;
  }
  else
  {
    +[RTNotification notificationName](RTBluetoothManagerNotificationDisconnected, "notificationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5))
    {
      v4 = 1;
    }
    else
    {
      +[RTNotification notificationName](RTBluetoothManagerNotificationCarKitConnectionStateChanged, "notificationName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v6) != 0;

    }
  }

  -[RTBluetoothManager_BluetoothManager setObservingConnections:](self, "setObservingConnections:", v4);
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RTBluetoothManager_BluetoothManager;
  -[RTBluetoothManager internalAddObserver:name:](&v11, sel_internalAddObserver_name_, a3, v6);
  +[RTNotification notificationName](RTBluetoothManagerNotificationConnected, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) == 0)
  {
    +[RTNotification notificationName](RTBluetoothManagerNotificationDisconnected, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", v8))
    {
      +[RTNotification notificationName](RTBluetoothManagerNotificationCarKitConnectionStateChanged, "notificationName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqualToString:", v9);

      if ((v10 & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }

  }
LABEL_5:
  -[RTBluetoothManager_BluetoothManager shouldObserveConnections](self, "shouldObserveConnections");
LABEL_6:

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RTBluetoothManager_BluetoothManager;
  -[RTBluetoothManager internalRemoveObserver:name:](&v11, sel_internalRemoveObserver_name_, a3, v6);
  +[RTNotification notificationName](RTBluetoothManagerNotificationConnected, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) == 0)
  {
    +[RTNotification notificationName](RTBluetoothManagerNotificationDisconnected, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", v8))
    {
      +[RTNotification notificationName](RTBluetoothManagerNotificationCarKitConnectionStateChanged, "notificationName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqualToString:", v9);

      if ((v10 & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }

  }
LABEL_5:
  -[RTBluetoothManager_BluetoothManager shouldObserveConnections](self, "shouldObserveConnections");
LABEL_6:

}

- (int64_t)getCarKitConnectionStateFromConnectedDevices:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7)
    v8 = 1;
  else
    v8 = 2;

  return v8;
}

- (void)_fetchCarKitConnectedStateWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void (**v8)(id, int64_t);

  v8 = (void (**)(id, int64_t))a3;
  -[RTBluetoothManager_BluetoothManager bluetoothManager](self, "bluetoothManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTBluetoothManager_BluetoothManager bluetoothManager](self, "bluetoothManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectedDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[RTBluetoothManager_BluetoothManager getCarKitConnectionStateFromConnectedDevices:](self, "getCarKitConnectionStateFromConnectedDevices:", v6);

  }
  else
  {
    v7 = 0;
  }
  v8[2](v8, v7);

}

- (void)setCarKitConnectionState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  RTBluetoothManagerNotificationCarKitConnectionStateChanged *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_carKitConnectionState != a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      +[RTBluetoothManager carKitConnectionStateToString:](RTBluetoothManager, "carKitConnectionStateToString:", self->_carKitConnectionState);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTBluetoothManager carKitConnectionStateToString:](RTBluetoothManager, "carKitConnectionStateToString:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "CarKit connection state changed from, %@, to, %@", (uint8_t *)&v9, 0x16u);

    }
    self->_carKitConnectionState = a3;
    v8 = -[RTBluetoothManagerNotificationCarKitConnectionStateChanged initWithCarKitConnectionState:]([RTBluetoothManagerNotificationCarKitConnectionStateChanged alloc], "initWithCarKitConnectionState:", self->_carKitConnectionState);
    -[RTNotifier postNotification:](self, "postNotification:", v8);

  }
}

- (NSSet)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_connectedDevices, a3);
}

- (BOOL)observingConnections
{
  return self->_observingConnections;
}

- (int64_t)carKitConnectionState
{
  return self->_carKitConnectionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedDevices, 0);
}

@end
