@implementation SBBluetoothController

+ (SBBluetoothController)sharedInstance
{
  void *v2;
  SBBluetoothController *v3;
  void *v4;

  v2 = (void *)__sharedBluetoothController;
  if (!__sharedBluetoothController)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBBluetoothController);
    v4 = (void *)__sharedBluetoothController;
    __sharedBluetoothController = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)__sharedBluetoothController;
  }
  return (SBBluetoothController *)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBBluetoothController stopWatchingForDevices](self, "stopWatchingForDevices");
  v3.receiver = self;
  v3.super_class = (Class)SBBluetoothController;
  -[SBBluetoothController dealloc](&v3, sel_dealloc);
}

- (id)firstBTDeviceToReportBatteryLevel
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_devices;
  v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        if (objc_msgSend(v6, "supportsBatteryLevel", (_QWORD)v8)
          && (objc_msgSend(v6, "connected") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_12;
        }
      }
      v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)canReportBatteryLevel
{
  void *v3;
  BOOL v4;
  void *v5;

  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHeadsetDocked") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SBBluetoothController firstBTDeviceToReportBatteryLevel](self, "firstBTDeviceToReportBatteryLevel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (int)batteryLevel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isHeadsetDocked"))
  {
    v4 = objc_msgSend(v3, "headsetBatteryCapacity");
  }
  else
  {
    -[SBBluetoothController firstBTDeviceToReportBatteryLevel](self, "firstBTDeviceToReportBatteryLevel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v4 = objc_msgSend(v5, "batteryLevel");
    else
      v4 = 0;

  }
  return v4;
}

- (void)noteDevicesChanged
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", SBBluetoothBatteryAvailabilityChangedNotification, 0);

}

- (void)startWatchingForDevices
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *devices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBBluetoothController stopWatchingForDevices](self, "stopWatchingForDevices");
  objc_msgSend(v9, "pairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableArray *)objc_msgSend(v3, "mutableCopy");
  devices = self->_devices;
  self->_devices = v4;

  if (!self->_devices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_devices;
    self->_devices = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_iapDeviceChanged_, CFSTR("SBUIHeadsetDockStatusChangedNotification"), 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_connectionChanged_, *MEMORY[0x1E0D03390], 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_addDeviceNotification_, *MEMORY[0x1E0D033B0], 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_removeDeviceNotification_, *MEMORY[0x1E0D033C0], 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_connectionChanged_, *MEMORY[0x1E0D03398], 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_batteryChanged_, *MEMORY[0x1E0D033A0], 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_bluetoothDeviceInitiatedVoiceControl_, *MEMORY[0x1E0D033F8], 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_bluetoothDeviceEndedVoiceControl_, *MEMORY[0x1E0D033F0], 0);
  -[SBBluetoothController noteDevicesChanged](self, "noteDevicesChanged");

}

- (void)stopWatchingForDevices
{
  void *v3;
  NSMutableArray *devices;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  devices = self->_devices;
  self->_devices = 0;

}

- (void)iapDeviceChanged:(id)a3
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBBluetoothController iapDeviceChanged:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBBluetoothController.m"), 120, CFSTR("this call must be made on the main thread"));

  }
  -[SBBluetoothController noteDevicesChanged](self, "noteDevicesChanged");
}

- (void)addDeviceNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBBluetoothController addDeviceNotification:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBBluetoothController.m"), 126, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(v7, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (-[NSMutableArray containsObject:](self->_devices, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_devices, "addObject:", v4);
    -[SBBluetoothController noteDevicesChanged](self, "noteDevicesChanged");
  }

}

- (void)removeDeviceNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBBluetoothController removeDeviceNotification:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBBluetoothController.m"), 141, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(v7, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableArray removeObject:](self->_devices, "removeObject:", v4);
    -[SBBluetoothController noteDevicesChanged](self, "noteDevicesChanged");
  }

}

- (void)updateTetheringConnected
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_tetheringConnected = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_devices;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "connectedServices", (_QWORD)v8) & 0x1000) != 0)
        {
          self->_tetheringConnected = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)connectionChanged:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *devices;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  id v12;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBBluetoothController connectionChanged:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBBluetoothController.m"), 169, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
  devices = self->_devices;
  self->_devices = v6;

  if (!self->_devices)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = self->_devices;
    self->_devices = v8;

  }
  -[SBBluetoothController noteDevicesChanged](self, "noteDevicesChanged");
  -[SBBluetoothController updateTetheringConnected](self, "updateTetheringConnected");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", SBBluetoothConnectionChangedNotification, 0, 0);

}

- (void)batteryChanged:(id)a3
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBBluetoothController batteryChanged:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBBluetoothController.m"), 184, CFSTR("this call must be made on the main thread"));

  }
  -[SBBluetoothController updateBattery](self, "updateBattery");
  -[SBBluetoothController noteDevicesChanged](self, "noteDevicesChanged");
}

- (void)updateBattery
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", SBBluetoothBatteryLevelChangedNotification, 0);

}

- (id)deviceForAudioRoute:(id)a3
{
  id v4;
  NSMutableArray *devices;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  devices = self->_devices;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__SBBluetoothController_deviceForAudioRoute___block_invoke;
  v10[3] = &unk_1E8EA2408;
  v6 = v4;
  v11 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](devices, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_devices, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __45__SBBluetoothController_deviceForAudioRoute___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "matchesUID:", v3);

  return v4;
}

- (BOOL)tetheringConnected
{
  return self->_tetheringConnected;
}

- (void)bluetoothDeviceInitiatedVoiceControl:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Bluetooth device voice control initiated: %@", (uint8_t *)&v7, 0xCu);
  }

  +[SBVoiceControlController sharedInstance](SBVoiceControlController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bluetoothDeviceInitiatedVoiceControl:", v6);

}

- (void)bluetoothDeviceEndedVoiceControl:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[SBVoiceControlController sharedInstance](SBVoiceControlController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bluetoothDeviceEndedVoiceControl:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
