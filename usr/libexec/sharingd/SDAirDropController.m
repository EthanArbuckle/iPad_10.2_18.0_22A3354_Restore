@implementation SDAirDropController

- (SDAirDropController)init
{
  SDAirDropController *v2;
  SDAirDropController *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *properties;
  uint64_t v6;
  SDStatusMonitor *monitor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDAirDropController;
  v2 = -[SDAirDropController init](&v9, "init");
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

  -[SDAirDropController stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropController;
  -[SDAirDropController dealloc](&v3, "dealloc");
}

- (void)configureSettingsForAirDrop
{
  unsigned int v3;
  char v4;
  uint64_t v5;
  unsigned int v6;
  char v7;
  uint64_t v8;
  id v9;

  v3 = -[SDStatusMonitor bluetoothEnabled](self->_monitor, "bluetoothEnabled");
  v4 = v3;
  v5 = v3 ^ 1;
  v6 = -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled");
  v7 = v6;
  v8 = v6 ^ 1;
  if ((v5 & 1) != 0 || (_DWORD)v8)
  {
    if (-[SDStatusMonitor deviceSupportsWAPI](self->_monitor, "deviceSupportsWAPI"))
    {
      -[SDAirDropController presentEnableRadiosAlertForBluetooth:andWLAN:](self, "presentEnableRadiosAlertForBluetooth:andWLAN:", v5, v8);
    }
    else
    {
      if ((v7 & 1) == 0)
        -[SDStatusMonitor setWirelessEnabled:](self->_monitor, "setWirelessEnabled:", 1);
      if ((v4 & 1) == 0)
        -[SDStatusMonitor setBluetoothEnabled:](self->_monitor, "setBluetoothEnabled:", 1);
    }
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(+[SDHotspotAgent sharedAgent](SDHotspotAgent, "sharedAgent"));
  if ((objc_msgSend(v9, "p2pAllowed") & 1) == 0 && objc_msgSend(v9, "isTetheringInUse"))
    -[SDAirDropController presentDisablePersonalHotspotAlert](self, "presentDisablePersonalHotspotAlert");

}

- (void)presentEnableRadiosAlertForBluetooth:(BOOL)a3 andWLAN:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  SFUserAlert *v7;
  SFUserAlert *radiosUserNotification;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t v24[16];
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  BOOL v29;
  BOOL v30;
  id location;

  if (!self->_radiosUserNotification)
  {
    v4 = a4;
    v5 = a3;
    v7 = objc_opt_new(SFUserAlert);
    radiosUserNotification = self->_radiosUserNotification;
    self->_radiosUserNotification = v7;

    v10 = SFLocalizedStringForKey(CFSTR("AirDrop"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[SFUserAlert setTitle:](self->_radiosUserNotification, "setTitle:", v11);

    if (v5 || v4)
    {
      v13 = CFSTR("WILL_TURN_ON_BLUETOOTH_TITLE");
      if (v5 && v4)
        v13 = CFSTR("WILL_TURN_ON_BLUETOOTH_AND_WLAN_TITLE");
      if (v5)
        v14 = v13;
      else
        v14 = CFSTR("WILL_TURN_ON_WLAN_TITLE");
      v15 = SFLocalizedStringForKey(v14, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      -[SFUserAlert setMessage:](self->_radiosUserNotification, "setMessage:", v16);

    }
    v17 = SFLocalizedStringForKey(CFSTR("TURN_ON_BUTTON_TITLE"), v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[SFUserAlert setDefaultButtonTitle:](self->_radiosUserNotification, "setDefaultButtonTitle:", v18);

    v20 = SFLocalizedStringForKey(CFSTR("CANCEL_BUTTON_TITLE"), v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[SFUserAlert setAlternateButtonTitle:](self->_radiosUserNotification, "setAlternateButtonTitle:", v21);

    location = 0;
    objc_initWeak(&location, self->_radiosUserNotification);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100210D44;
    v27[3] = &unk_10071C0A8;
    v29 = v4;
    v30 = v5;
    objc_copyWeak(&v28, &location);
    v27[4] = self;
    -[SFUserAlert setResponseHandler:](self->_radiosUserNotification, "setResponseHandler:", v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100210E78;
    v25[3] = &unk_10071C0D0;
    objc_copyWeak(&v26, &location);
    v25[4] = self;
    v22 = airdrop_log(-[SFUserAlert setErrorHandler:](self->_radiosUserNotification, "setErrorHandler:", v25));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Asking user to enable radios", v24, 2u);
    }

    -[SFUserAlert present](self->_radiosUserNotification, "present");
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (void)presentDisablePersonalHotspotAlert
{
  SFUserAlert *v3;
  SFUserAlert *phUserNotification;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[8];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id location;

  if (!self->_phUserNotification)
  {
    v3 = objc_opt_new(SFUserAlert);
    phUserNotification = self->_phUserNotification;
    self->_phUserNotification = v3;

    v6 = SFLocalizedStringForKey(CFSTR("WILL_TURN_OFF_PERSONAL_HOTSPOT_TITLE"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[SFUserAlert setTitle:](self->_phUserNotification, "setTitle:", v7);

    v9 = SFLocalizedStringForKey(CFSTR("WILL_TURN_OFF_PERSONAL_HOTSPOT_BODY"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SFUserAlert setMessage:](self->_phUserNotification, "setMessage:", v10);

    v12 = SFLocalizedStringForKey(CFSTR("ENABLE_BUTTON_TITLE"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[SFUserAlert setDefaultButtonTitle:](self->_phUserNotification, "setDefaultButtonTitle:", v13);

    v15 = SFLocalizedStringForKey(CFSTR("CANCEL_BUTTON_TITLE"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[SFUserAlert setAlternateButtonTitle:](self->_phUserNotification, "setAlternateButtonTitle:", v16);

    location = 0;
    objc_initWeak(&location, self->_phUserNotification);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10021116C;
    v22[3] = &unk_10071C0F8;
    objc_copyWeak(&v23, &location);
    v22[4] = self;
    -[SFUserAlert setResponseHandler:](self->_phUserNotification, "setResponseHandler:", v22);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10021121C;
    v20[3] = &unk_10071C0D0;
    objc_copyWeak(&v21, &location);
    v20[4] = self;
    v17 = airdrop_log(-[SFUserAlert setErrorHandler:](self->_phUserNotification, "setErrorHandler:", v20));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Asking user to disable Personal Hotspot", v19, 2u);
    }

    -[SFUserAlert present](self->_phUserNotification, "present");
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (void)setProperty:(void *)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *properties;
  unsigned int v8;
  void *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  void *v12;

  v6 = a4;
  properties = self->_properties;
  v12 = v6;
  if (!a3)
  {
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", v6);
LABEL_12:
    v9 = v12;
    goto LABEL_13;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", a3, v6);
  v8 = objc_msgSend(v12, "isEqual:", kSFOperationDiscoverableModeKey);
  v9 = v12;
  if (v8)
  {
    if (CFEqual(a3, kSFOperationDiscoverableModeContactsOnly))
    {
      v10 = sub_1000505FC();
      v9 = v12;
      if ((v10 & 1) != 0)
        goto LABEL_13;
      v11 = sub_1000502E0();
    }
    else
    {
      if (!CFEqual(a3, kSFOperationDiscoverableModeEveryone))
      {
LABEL_11:
        -[SDStatusMonitor setDiscoverableMode:](self->_monitor, "setDiscoverableMode:", a3);
        goto LABEL_12;
      }
      v11 = sub_1000505FC();
    }
    v9 = v12;
    if ((v11 & 1) == 0)
    {
      -[SDAirDropController configureSettingsForAirDrop](self, "configureSettingsForAirDrop");
      goto LABEL_11;
    }
  }
LABEL_13:

}

- (void)setStatusAndNotify
{
  void *v3;
  _QWORD block[5];

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSFOperationLegacyDeviceKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSFOperationLegacyModeEnabledKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSFOperationLegacyModeSettableKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor discoverableMode](self->_monitor, "discoverableMode"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v3, kSFOperationDiscoverableModeKey);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002114AC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)somethingChanged:(id)a3
{
  -[SDAirDropController setStatusAndNotify](self, "setStatusAndNotify", a3);
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.AppleIDAccountInfoChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.AppleIDChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "somethingChanged:", CFSTR("com.apple.sharingd.DiscoverableModeChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)start
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;

  if (!self->_started)
  {
    v3 = (OS_os_transaction *)os_transaction_create("SDAirDropController");
    transaction = self->_transaction;
    self->_transaction = v3;

    self->_started = 1;
    -[SDAirDropController addObservers](self, "addObservers");
    -[SDAirDropController setStatusAndNotify](self, "setStatusAndNotify");
  }
}

- (void)stop
{
  OS_os_transaction *transaction;

  if (self->_started)
  {
    self->_started = 0;
    -[SDAirDropController removeObservers](self, "removeObservers");
    transaction = self->_transaction;
    self->_transaction = 0;

  }
}

- (SDAirDropControllerDelegate)delegate
{
  return (SDAirDropControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_radiosUserNotification, 0);
  objc_storeStrong((id *)&self->_phUserNotification, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
