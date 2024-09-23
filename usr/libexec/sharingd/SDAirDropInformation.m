@implementation SDAirDropInformation

- (SDAirDropInformation)init
{
  SDAirDropInformation *v2;
  SDAirDropInformation *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *properties;
  uint64_t v6;
  SDStatusMonitor *monitor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDAirDropInformation;
  v2 = -[SDAirDropInformation init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    v4 = objc_opt_new(NSMutableDictionary);
    properties = v3->_properties;
    v3->_properties = v4;

    v6 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v6;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SDAirDropInformation stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropInformation;
  -[SDAirDropInformation dealloc](&v3, "dealloc");
}

- (BOOL)BOOLValue:(void *)a3
{
  CFTypeID v4;

  if (!a3)
    return 0;
  v4 = CFGetTypeID(a3);
  return v4 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)a3) != 0;
}

- (void)setProperty:(void *)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *properties;
  void *v8;
  id v9;

  v6 = a4;
  properties = self->_properties;
  v9 = v6;
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", a3, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", v6);
  if (objc_msgSend(v9, "isEqual:", kSFOperationWirelessEnabledKey))
  {
    -[SDStatusMonitor setWirelessEnabled:](self->_monitor, "setWirelessEnabled:", -[SDAirDropInformation BOOLValue:](self, "BOOLValue:", a3));
  }
  else if (objc_msgSend(v9, "isEqual:", kSFOperationBluetoothEnabledKey))
  {
    -[SDStatusMonitor setBluetoothEnabled:](self->_monitor, "setBluetoothEnabled:", -[SDAirDropInformation BOOLValue:](self, "BOOLValue:", a3));
  }
  else if (objc_msgSend(v9, "isEqualToString:", kSFOperationWirelessAccessPointKey))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDHotspotAgent sharedAgent](SDHotspotAgent, "sharedAgent"));
    objc_msgSend(v8, "disableTethering");

  }
  else if (objc_msgSend(v9, "isEqualToString:", kSFOperationAirplaneModeEnabledKey))
  {
    -[SDStatusMonitor setAirplaneModeEnabled:](self->_monitor, "setAirplaneModeEnabled:", -[SDAirDropInformation BOOLValue:](self, "BOOLValue:", a3));
  }

}

- (void)setInformationAndNotify
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];

  -[NSMutableDictionary removeAllObjects](self->_properties, "removeAllObjects");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSFOperationLegacyDeviceKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor wirelessCarPlay](self->_monitor, "wirelessCarPlay")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v3, kSFOperationWirelessCarPlayKey);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v4, kSFOperationWirelessEnabledKey);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor bluetoothEnabledIncludingRestricted](self->_monitor, "bluetoothEnabledIncludingRestricted")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v5, kSFOperationBluetoothEnabledKey);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor airplaneModeEnabled](self->_monitor, "airplaneModeEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v6, kSFOperationAirplaneModeEnabledKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[SDStatusMonitor ultraWideBandState](self->_monitor, "ultraWideBandState")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v7, kSFOperationUltraWideBandEnabledKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor computerToComputer](self->_monitor, "computerToComputer")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v8, kSFOperationComputerToComputerKey);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor deviceSupportsWAPI](self->_monitor, "deviceSupportsWAPI")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v9, kSFOperationDeviceSupportsWAPIKey);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDStatusMonitor wirelessAccessPoint](self->_monitor, "wirelessAccessPoint")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v10, kSFOperationWirelessAccessPointKey);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor someComputerName](self->_monitor, "someComputerName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v11, kSFOperationReceiverComputerNameKey);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F3EC4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)somethingChanged:(id)a3
{
  -[SDAirDropInformation setInformationAndNotify](self, "setInformationAndNotify", a3);
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.UserPictureChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.ComputerNameChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.WirelessModeChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.AirplaneModeChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.WirelessPowerChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.BluetoothPowerChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.HotspotMISStateChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.WirelessCarPlayChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.UltraWideBandStateChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)start
{
  if (!self->_started)
  {
    self->_started = 1;
    -[SDAirDropInformation addObservers](self, "addObservers");
    -[SDAirDropInformation setInformationAndNotify](self, "setInformationAndNotify");
  }
}

- (void)stop
{
  if (self->_started)
  {
    self->_started = 0;
    -[SDAirDropInformation removeObservers](self, "removeObservers");
  }
}

- (SDAirDropInformationDelegate)delegate
{
  return (SDAirDropInformationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
