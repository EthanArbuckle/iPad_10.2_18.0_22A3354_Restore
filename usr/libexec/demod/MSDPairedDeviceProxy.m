@implementation MSDPairedDeviceProxy

- (MSDPairedDeviceProxy)init
{
  MSDPairedDeviceProxy *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MSDPairedDeviceProxy;
  v2 = -[MSDPairedDeviceProxy init](&v17, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    -[MSDPairedDeviceProxy setDeviceRegistry:](v2, "setDeviceRegistry:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = NRPairedDeviceRegistryRemoteUnpairingDidBeginNotification;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedDeviceProxy deviceRegistry](v2, "deviceRegistry"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "handleDeviceDidBeginUnpairingNotification:", v5, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = NRPairedDeviceRegistryDeviceDidUnpairNotification;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedDeviceProxy deviceRegistry](v2, "deviceRegistry"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "handleDeviceDidUnpairNotification:", v8, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = NRPairedDeviceRegistryDeviceDidBeginPairingNotification;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedDeviceProxy deviceRegistry](v2, "deviceRegistry"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "handleDeviceDidBeginPairingNotification:", v11, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v14 = NRPairedDeviceRegistryDeviceDidPairNotification;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedDeviceProxy deviceRegistry](v2, "deviceRegistry"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, "handleDeviceDidPairNotification:", v14, v15);

    -[MSDPairedDeviceProxy updatePairedDeviceInfo](v2, "updatePairedDeviceInfo");
  }
  return v2;
}

- (void)bootstrap
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)NSClassFromObject(self);
    v5 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bootstrapping %{public}@...", (uint8_t *)&v6, 0xCu);

  }
}

- (BOOL)canUpdateContent
{
  return 0;
}

- (BOOL)canLockSnapshot
{
  return 0;
}

- (BOOL)canUnlockSnapshot
{
  return 0;
}

- (BOOL)canRevertSnapshot
{
  return 0;
}

- (BOOL)canUnenrollWithObliteration:(BOOL)a3
{
  return 0;
}

- (BOOL)updateContentWithDeadline:(int)a3
{
  return 1;
}

- (BOOL)lockSnapshot
{
  return 1;
}

- (BOOL)unlockSnapshot
{
  return 1;
}

- (BOOL)revertSnapshot
{
  return 1;
}

- (BOOL)reboot
{
  return 1;
}

- (BOOL)unenrollWithObliteration:(BOOL)a3 callUnregister:(BOOL)a4
{
  return 1;
}

- (void)didUpdateDeviceReachability:(BOOL)a3
{
  _BOOL8 v3;
  MSDPairedDeviceProxy *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[MSDPairedDeviceProxy reachable](v4, "reachable") != v3)
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109376;
      v9[1] = -[MSDPairedDeviceProxy reachable](v4, "reachable");
      v10 = 1024;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Paired device reachability changed to from %{BOOL}d to %{BOOL}d", (uint8_t *)v9, 0xEu);
    }

    if (v3)
    {
      -[MSDPairedDeviceProxy savePairedDeviceLastSeenDate:](v4, "savePairedDeviceLastSeenDate:", 0);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toString"));
      -[MSDPairedDeviceProxy savePairedDeviceLastSeenDate:](v4, "savePairedDeviceLastSeenDate:", v8);

    }
    -[MSDPairedDeviceProxy setReachable:](v4, "setReachable:", v3);
  }
  objc_sync_exit(v4);

}

- (void)updatePairedDeviceInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MSDPairedDeviceProxy *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedDeviceProxy deviceRegistry](obj, "deviceRegistry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getActivePairedDevice"));
  -[MSDPairedDeviceProxy setDevice:](obj, "setDevice:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedDeviceProxy device](obj, "device"));
  if (v4)
  {
    -[MSDPairedDeviceProxy setPaired:](obj, "setPaired:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPairedDeviceProxy device](obj, "device"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", NRDevicePropertyUDID));
    -[MSDPairedDeviceProxy setUdid:](obj, "setUdid:", v6);

    -[MSDPairedDeviceProxy setReachable:](obj, "setReachable:", 1);
  }
  else
  {
    -[MSDPairedDeviceProxy setPaired:](obj, "setPaired:", 0);
    -[MSDPairedDeviceProxy setUdid:](obj, "setUdid:", 0);
    -[MSDPairedDeviceProxy setReachable:](obj, "setReachable:", 0);
    -[MSDPairedDeviceProxy savePairedDeviceLastSeenDate:](obj, "savePairedDeviceLastSeenDate:", 0);
  }
  objc_sync_exit(obj);

}

- (void)handleDeviceDidBeginPairingNotification:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[MSDPairedDeviceProxy handleDeviceDidBeginPairingNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s entered!", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  objc_msgSend(v5, "updateStage:", 30);

}

- (void)handleDeviceDidPairNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDPairedDeviceProxy handleDeviceDidPairNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s entered!", (uint8_t *)&v7, 0xCu);
  }

  -[MSDPairedDeviceProxy updatePairedDeviceInfo](self, "updatePairedDeviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](MSDMailProcessor, "sharedInstance"));
  objc_msgSend(v6, "sendImmediateDeviceInfoPing");

}

- (void)handleDeviceDidBeginUnpairingNotification:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[MSDPairedDeviceProxy handleDeviceDidBeginUnpairingNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s entered!", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  objc_msgSend(v5, "updateStage:", 31);

}

- (void)handleDeviceDidUnpairNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[MSDPairedDeviceProxy handleDeviceDidUnpairNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s entered!", (uint8_t *)&v8, 0xCu);
  }

  -[MSDPairedDeviceProxy updatePairedDeviceInfo](self, "updatePairedDeviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  objc_msgSend(v6, "updateStage:", 100);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](MSDMailProcessor, "sharedInstance"));
  objc_msgSend(v7, "sendImmediateDeviceInfoPing");

}

- (NSString)lastSeenDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("PairedDeviceLastSeenDate")));

  return (NSString *)v3;
}

- (void)savePairedDeviceLastSeenDate:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("PairedDeviceLastSeenDate"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("PairedDeviceLastSeenDate"));

}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
  self->_udid = (NSString *)a3;
}

- (NRPairedDeviceRegistry)deviceRegistry
{
  return self->_deviceRegistry;
}

- (void)setDeviceRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRegistry, a3);
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceRegistry, 0);
}

@end
