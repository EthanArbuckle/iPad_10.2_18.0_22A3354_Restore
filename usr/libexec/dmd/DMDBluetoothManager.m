@implementation DMDBluetoothManager

+ (DMDBluetoothManager)sharedManager
{
  if (qword_1000EB790 != -1)
    dispatch_once(&qword_1000EB790, &stru_1000BA5B8);
  return (DMDBluetoothManager *)(id)qword_1000EB788;
}

- (DMDBluetoothManager)init
{
  DMDBluetoothManager *v2;
  uint64_t v3;
  BluetoothManager *bluetoothManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMDBluetoothManager;
  v2 = -[DMDBluetoothManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    bluetoothManager = v2->_bluetoothManager;
    v2->_bluetoothManager = (BluetoothManager *)v3;

  }
  return v2;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v3 = a3;
  self->_enabled = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDBluetoothManager bluetoothManager](self, "bluetoothManager"));
  v6 = objc_msgSend(v5, "available");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDBluetoothManager bluetoothManager](self, "bluetoothManager"));
    objc_msgSend(v7, "setEnabled:", v3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDBluetoothManager bluetoothManager](self, "bluetoothManager"));
    objc_msgSend(v8, "setPowered:", v3);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "availabilityChanged:", BluetoothAvailabilityChangedNotification, 0);
  }

  -[DMDBluetoothManager setStillNeedsUpdate:](self, "setStillNeedsUpdate:", v6 ^ 1);
}

- (void)availabilityChanged:(id)a3
{
  unsigned int v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[DMDBluetoothManager bluetoothManager](self, "bluetoothManager", a3));
  if (objc_msgSend(v9, "available"))
  {
    v4 = -[DMDBluetoothManager stillNeedsUpdate](self, "stillNeedsUpdate");

    if (!v4)
      return;
    v5 = -[DMDBluetoothManager enabled](self, "enabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDBluetoothManager bluetoothManager](self, "bluetoothManager"));
    objc_msgSend(v6, "setEnabled:", v5);

    v7 = -[DMDBluetoothManager enabled](self, "enabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDBluetoothManager bluetoothManager](self, "bluetoothManager"));
    objc_msgSend(v8, "setPowered:", v7);

    -[DMDBluetoothManager setStillNeedsUpdate:](self, "setStillNeedsUpdate:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "removeObserver:name:object:", self, BluetoothAvailabilityChangedNotification, 0);
  }

}

- (BluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)stillNeedsUpdate
{
  return self->_stillNeedsUpdate;
}

- (void)setStillNeedsUpdate:(BOOL)a3
{
  self->_stillNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end
