@implementation SBBluetoothAccessoryBatteryMonitor

- (SBBluetoothAccessoryBatteryMonitor)init
{
  SBBluetoothAccessoryBatteryMonitor *v2;
  NSMutableSet *v3;
  NSMutableSet *accessoryNamesInLowPower;
  BCBatteryDeviceController *v5;
  BCBatteryDeviceController *batteryDeviceController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBBluetoothAccessoryBatteryMonitor;
  v2 = -[SBBluetoothAccessoryBatteryMonitor init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    accessoryNamesInLowPower = v2->_accessoryNamesInLowPower;
    v2->_accessoryNamesInLowPower = v3;

    v5 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E0D01B20]);
    batteryDeviceController = v2->_batteryDeviceController;
    v2->_batteryDeviceController = v5;

    -[BCBatteryDeviceController addBatteryDeviceObserver:queue:](v2->_batteryDeviceController, "addBatteryDeviceObserver:queue:", v2, MEMORY[0x1E0C80D38]);
  }
  return v2;
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = *MEMORY[0x1E0D01B30];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "productIdentifier") == v8 && objc_msgSend(v10, "vendor") == 1)
          -[SBBluetoothAccessoryBatteryMonitor _popLowPowerAlertForAccessoryIfNecessary:](self, "_popLowPowerAlertForAccessoryIfNecessary:", v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_popLowPowerAlertForAccessoryIfNecessary:(id)a3
{
  void *v4;
  int v5;
  SBBluetoothAccessoryLowPowerAlertItem *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableSet containsObject:](self->_accessoryNamesInLowPower, "containsObject:", v4);
  if (objc_msgSend(v8, "isLowBattery") && objc_msgSend(v8, "isConnected"))
  {
    if ((v5 & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_accessoryNamesInLowPower, "addObject:", v4);
      v6 = -[SBBluetoothAccessoryLowPowerAlertItem initWithAccessory:batteryLevel:]([SBBluetoothAccessoryLowPowerAlertItem alloc], "initWithAccessory:batteryLevel:", v4, objc_msgSend(v8, "percentCharge"));
      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activateAlertItem:", v6);

    }
  }
  else if ((objc_msgSend(v8, "isLowBattery") & 1) == 0 && ((v5 ^ 1) & 1) == 0)
  {
    -[NSMutableSet removeObject:](self->_accessoryNamesInLowPower, "removeObject:", v4);
  }

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[SBBluetoothAccessoryBatteryMonitor descriptionBuilder](self, "descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)descriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_accessoryNamesInLowPower, CFSTR("Accessory Names in Low Power"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_accessoryNamesInLowPower, 0);
}

@end
