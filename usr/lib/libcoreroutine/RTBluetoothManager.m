@implementation RTBluetoothManager

void __55__RTBluetoothManager_BluetoothManager_bluetoothManager__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = (void *)MEMORY[0x1E0D03410];
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSharedInstanceQueue:", v2);

}

void __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "bluetoothManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "connectedDevices");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v25 = objc_msgSend(v18, "count");
      _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%lu previously connected devices", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "connectedDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_60);

    _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v19 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v25 = v19;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%lu newly connected devices", buf, 0xCu);
    }

    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_6);
  }
  objc_msgSend(*(id *)(a1 + 32), "connectedDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "connectedDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_7;
    v21[3] = &unk_1E929E918;
    v13 = v5;
    v14 = *(_QWORD *)(a1 + 32);
    v22 = v13;
    v23 = v14;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v21);

  }
  if (objc_msgSend(v5, "count"))
  {
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_9;
    v20[3] = &unk_1E929E940;
    v20[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v20);
  }
  objc_msgSend(*(id *)(a1 + 32), "setConnectedDevices:", v5);
  v15 = *(void **)(a1 + 32);
  objc_msgSend(v15, "bluetoothManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "connectedDevices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCarKitConnectionState:", objc_msgSend(v15, "getCarKitConnectionStateFromConnectedDevices:", v17));

}

void __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);
  }

}

void __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);
  }

}

void __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  RTBluetoothManagerNotificationDisconnected *v5;
  void *v6;
  void *v7;
  RTBluetoothManagerNotificationDisconnected *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0 && objc_msgSend(v3, "type") == 17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "handsfree device disconnected, %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = [RTBluetoothManagerNotificationDisconnected alloc];
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[RTBluetoothManagerNotificationDisconnected initWithDeviceName:andDeviceAddress:](v5, "initWithDeviceName:andDeviceAddress:", v6, v7);

    objc_msgSend(*(id *)(a1 + 40), "postNotification:", v8);
  }

}

void __56__RTBluetoothManager_BluetoothManager_updateConnections__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  RTBluetoothManagerNotificationConnected *v7;
  void *v8;
  void *v9;
  RTBluetoothManagerNotificationConnected *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connectedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) == 0 && objc_msgSend(v3, "type") == 17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "handsfree device connected, %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = [RTBluetoothManagerNotificationConnected alloc];
    objc_msgSend(v3, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RTBluetoothManagerNotificationConnected initWithDeviceName:andDeviceAddress:](v7, "initWithDeviceName:andDeviceAddress:", v8, v9);

    objc_msgSend(*(id *)(a1 + 32), "postNotification:", v10);
  }

}

BOOL __84__RTBluetoothManager_BluetoothManager_getCarKitConnectionStateFromConnectedDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 17;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[RTBluetoothManager allocWithZone:](RTBluetoothManager_BluetoothManager, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTBluetoothManager;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityBluetooth);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[RTNotification notificationName](RTBluetoothManagerNotificationConnected, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[RTNotification notificationName](RTBluetoothManagerNotificationDisconnected, "notificationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v6) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      +[RTNotification notificationName](RTBluetoothManagerNotificationCarKitConnectionStateChanged, "notificationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "isEqualToString:", v7);

    }
  }

  return v5;
}

- (void)fetchCarKitConnectedStateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__RTBluetoothManager_fetchCarKitConnectedStateWithHandler___block_invoke;
    v6[3] = &unk_1E9297650;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __59__RTBluetoothManager_fetchCarKitConnectedStateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCarKitConnectedStateWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchCarKitConnectedStateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__RTBluetoothManager__fetchCarKitConnectedStateWithHandler___block_invoke;
    block[3] = &unk_1E9297178;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

uint64_t __60__RTBluetoothManager__fetchCarKitConnectedStateWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)carKitConnectionStateToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 1)
    v3 = CFSTR("connected");
  if (a3 == 2)
    return CFSTR("disconnected");
  else
    return (id)v3;
}

@end
