@implementation CLWPBridge

- (CLWPBridge)initWithQueue:(id)a3
{
  CLWPBridge *v4;
  NSRecursiveLock *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLWPBridge;
  v4 = -[CLWPBridge init](&v7, "init");
  if (v4)
  {
    v5 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    v4->_instanceLock = v5;
    -[NSRecursiveLock setName:](v5, "setName:", CFSTR("com.apple.location.wpbridge"));
    v4->_state = 0;
    v4->_scanner = (WPDeviceScanner *)objc_msgSend(objc_alloc((Class)WPDeviceScanner), "initWithDelegate:queue:", v4, a3);
    v4->_zonesAndHandlers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->_tracker = (WPZoneTracker *)objc_msgSend(objc_alloc((Class)WPZoneTracker), "initWithDelegate:queue:", v4, a3);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSRecursiveLock lock](self->_instanceLock, "lock");
  -[WPZoneTracker invalidate](self->_tracker, "invalidate");

  self->_tracker = 0;
  self->_zonesAndHandlers = 0;
  -[CLWPBridge setUpdateHandler:](self, "setUpdateHandler:", 0);
  -[WPDeviceScanner invalidate](self->_scanner, "invalidate");

  self->_scanner = 0;
  -[CLWPBridge setStateHandler:](self, "setStateHandler:", 0);
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");

  self->_instanceLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWPBridge;
  -[CLWPBridge dealloc](&v3, "dealloc");
}

- (void)registerForStateUpdates:(id)a3
{
  void (**v5)(id, int64_t);

  -[NSRecursiveLock lock](self->_instanceLock, "lock");
  -[CLWPBridge setStateHandler:](self, "setStateHandler:", a3);
  if (-[CLWPBridge stateHandler](self, "stateHandler"))
  {
    v5 = -[CLWPBridge stateHandler](self, "stateHandler");
    v5[2](v5, self->_state);
  }
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
}

- (void)unregisterForStateUpdates
{
  -[NSRecursiveLock lock](self->_instanceLock, "lock");
  -[CLWPBridge setStateHandler:](self, "setStateHandler:", 0);
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
}

- (void)startScanForBeaconTypes:(int64_t)a3 updateHandler:(id)a4
{
  char v5;
  id v7;
  id v8;
  const __CFString *v9;
  NSDictionary *v10;
  NSObject *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;

  v5 = a3;
  -[NSRecursiveLock lock](self->_instanceLock, "lock");
  -[CLWPBridge setUpdateHandler:](self, "setUpdateHandler:", a4);
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = v7;
  if ((v5 & 1) != 0)
  {
    v9 = CFSTR("WPPuckCompany");
  }
  else
  {
    if ((v5 & 2) == 0)
      goto LABEL_6;
    v9 = CFSTR("WPPuckBeaconNoRanging");
  }
  objc_msgSend(v7, "addObject:", v9);
LABEL_6:
  v10 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, CFSTR("kPuckTypes"), 0);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021ABF80);
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2081;
    v17 = -[NSString UTF8String](-[NSDictionary description](v10, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"@iB: Scanner starting for beacons\", \"matching\":%{private, location:escape_only}s}", buf, 0x1Cu);
  }
  -[WPDeviceScanner unregisterAllDeviceChanges](self->_scanner, "unregisterAllDeviceChanges");
  -[WPDeviceScanner registerForDevicesMatching:options:](self->_scanner, "registerForDevicesMatching:options:", v10, 0);
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
}

- (void)stopScan
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  -[NSRecursiveLock lock](self->_instanceLock, "lock");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021ABF80);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"@iB: Scanner stopping\"}", (uint8_t *)v4, 0x12u);
  }
  -[CLWPBridge setUpdateHandler:](self, "setUpdateHandler:", 0);
  -[WPDeviceScanner unregisterAllDeviceChanges](self->_scanner, "unregisterAllDeviceChanges");
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
}

- (void)deviceScannerDidUpdateState:(id)a3
{
  -[CLWPBridge updateState](self, "updateState", a3);
}

- (void)scanner:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  NSMutableDictionary *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  -[NSRecursiveLock lock](self->_instanceLock, "lock", a3, a4);
  v7 = objc_msgSend(-[CLWPBridge updateHandler](self, "updateHandler"), "copy");
  if (v7)
  {
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1012A03AC;
    v15[3] = &unk_10218B948;
    v15[4] = &v16;
    objc_msgSend(objc_msgSend(a5, "objectForKey:", CFSTR("kPuckTypes")), "enumerateObjectsUsingBlock:", v15);
    v9 = objc_msgSend(a5, "objectForKey:", CFSTR("kPuckID"));
    v10 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v9, CFSTR("beaconID"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17[3]), CFSTR("typeMask"), objc_msgSend(a5, "objectForKey:", CFSTR("kPuckRSSI")), CFSTR("rssi"), objc_msgSend(a5, "objectForKey:", CFSTR("kPuckTx")), CFSTR("tx"), +[NSDate date](NSDate, "date"), CFSTR("discovered"), objc_msgSend(a5, "objectForKey:", CFSTR("kPuckAdvertisingChannel")), CFSTR("channel"), 0);
    if ((v17[3] & 3) != 0)
    {
      v11 = objc_msgSend(a5, "objectForKey:", CFSTR("kPuckCompanyUUID"));
      if (v11)
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, CFSTR("proximityUUID"));
      v12 = objc_msgSend(a5, "objectForKey:", CFSTR("kPuckCompanyMajor"));
      if (v12)
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v12, CFSTR("major"));
      v13 = objc_msgSend(a5, "objectForKey:", CFSTR("kPuckCompanyMinor"));
      if (v13)
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v13, CFSTR("minor"));
    }
    v14 = objc_msgSend(a5, "objectForKey:", CFSTR("kPuckConfig"));
    if (v14)
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v14, CFSTR("config"));
    _Block_object_dispose(&v16, 8);
    -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
    ((void (**)(_QWORD, NSMutableDictionary *, _QWORD))v8)[2](v8, v10, 0);

  }
  else
  {
    -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
  }
}

- (void)scanner:(id)a3 didFailToRegisterDevices:(id)a4 withError:(id)a5
{
  void (**v7)(id, _QWORD, id);

  -[NSRecursiveLock lock](self->_instanceLock, "lock", a3, a4);
  v7 = (void (**)(id, _QWORD, id))objc_msgSend(-[CLWPBridge updateHandler](self, "updateHandler"), "copy");
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
  if (v7)
  {
    v7[2](v7, 0, a5);

  }
}

- (BOOL)startTrackingZone:(id)a3 forStates:(int64_t)a4 transitionHandler:(id)a5
{
  char v6;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;

  if (a4)
  {
    v6 = a4;
    -[NSRecursiveLock lock](self->_instanceLock, "lock");
    if (a5)
    {
      v9 = _Block_copy(a5);
      -[NSMutableDictionary setObject:forKey:](self->_zonesAndHandlers, "setObject:forKey:", v9, a3);
      _Block_release(v9);
    }
    v10 = objc_msgSend(a3, "advertisementData");
    if (v10)
    {
      v11 = +[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", objc_msgSend(a3, "advertisementData")), CFSTR("ZTZonesArray"));
      v12 = v11;
      if ((v6 & 1) != 0)
        v13 = &__kCFBooleanTrue;
      else
        v13 = &__kCFBooleanFalse;
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v13, CFSTR("ZTZoneEntry"));
      if ((v6 & 2) != 0)
        v14 = &__kCFBooleanTrue;
      else
        v14 = &__kCFBooleanFalse;
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v14, CFSTR("ZTZoneExit"));
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021ABF80);
      v15 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 68289283;
        v17[1] = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2081;
        v21 = objc_msgSend(-[NSMutableDictionary description](v12, "description"), "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"@iB: Tracker registering zone\", \"zone\":%{private, location:escape_only}s}", (uint8_t *)v17, 0x1Cu);
      }
      -[WPZoneTracker registerForZoneChangesMatching:](self->_tracker, "registerForZoneChangesMatching:", v12);
      -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return (char)v10;
}

- (void)stopTrackingZone:(id)a3
{
  NSDictionary *v5;
  NSObject *v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  -[NSRecursiveLock lock](self->_instanceLock, "lock");
  v5 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", objc_msgSend(a3, "advertisementData")), CFSTR("ZTZonesArray"), 0);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021ABF80);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2081;
    v12 = -[NSString UTF8String](-[NSDictionary description](v5, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"@iB: Tracker unregistering zone\", \"zone\":%{private, location:escape_only}s}", buf, 0x1Cu);
  }
  -[WPZoneTracker unregisterForZoneChanges:](self->_tracker, "unregisterForZoneChanges:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_zonesAndHandlers, "removeObjectForKey:", a3);
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
}

- (void)stopTrackingZones
{
  -[NSRecursiveLock lock](self->_instanceLock, "lock");
  -[WPZoneTracker unregisterAllZoneChanges](self->_tracker, "unregisterAllZoneChanges");
  -[NSMutableDictionary removeAllObjects](self->_zonesAndHandlers, "removeAllObjects");
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
}

- (void)_didTransitionZoneWithData:(id)a3 trueMajor:(id)a4 trueMinor:(id)a5 state:(int64_t)a6
{
  id v11;
  _QWORD v12[8];

  -[NSRecursiveLock lock](self->_instanceLock, "lock");
  v11 = -[NSMutableDictionary copy](self->_zonesAndHandlers, "copy");
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1012A08B8;
  v12[3] = &unk_1021ABF10;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = a5;
  v12[7] = a6;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v12);

}

- (void)zoneTrackerDidUpdateState:(id)a3
{
  -[CLWPBridge updateState](self, "updateState", a3);
}

- (void)zoneTracker:(id)a3 enteredZoneInfo:(id)a4
{
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  v6 = objc_msgSend(a4, "objectForKeyedSubscript:", WPZoneTrackerKeyZone);
  v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", WPZoneTrackerKeyMajor), "integerValue"));
  v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", WPZoneTrackerKeyMinor), "integerValue"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021ABF80);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
  {
    v10[0] = 68289283;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2081;
    v14 = objc_msgSend(objc_msgSend(v6, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"iB: Tracker entered zone\", \"zone\":%{private, location:escape_only}s}", (uint8_t *)v10, 0x1Cu);
  }
  -[CLWPBridge _didTransitionZoneWithData:trueMajor:trueMinor:state:](self, "_didTransitionZoneWithData:trueMajor:trueMinor:state:", v6, v7, v8, 1);
}

- (void)zoneTracker:(id)a3 exitedZone:(id)a4
{
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021ABF80);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2081;
    v11 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"iB: Tracker exited zone\", \"zone\":%{private, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  -[CLWPBridge _didTransitionZoneWithData:trueMajor:trueMinor:state:](self, "_didTransitionZoneWithData:trueMajor:trueMinor:state:", a4, 0, 0, 2);
}

- (void)zoneTracker:(id)a3 didFailToRegisterZones:(id)a4 withError:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  _QWORD v13[6];
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  -[NSRecursiveLock lock](self->_instanceLock, "lock", a3);
  v8 = -[NSMutableDictionary copy](self->_zonesAndHandlers, "copy");
  -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021ABF80);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136380931;
    v19 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    v20 = 2081;
    v21 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Warning Tracker failed to register zones,%{private}s with error,%{private}s", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021ABF80);
    v10 = qword_1022A0038;
    v14 = 136380931;
    v15 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    v16 = 2081;
    v17 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 0, "#Warning Tracker failed to register zones,%{private}s with error,%{private}s", &v14, 22);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLWPBridge zoneTracker:didFailToRegisterZones:withError:]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1012A0F24;
  v13[3] = &unk_1021ABF60;
  v13[4] = v8;
  v13[5] = a5;
  objc_msgSend(objc_msgSend(a4, "objectForKey:", CFSTR("ZTZonesArray")), "enumerateObjectsUsingBlock:", v13);
  sub_100C33C6C(CFSTR("not-associated-with-client"), 2);

}

- (void)updateState
{
  int64_t v3;
  void (**v4)(id, int64_t);

  -[NSRecursiveLock lock](self->_instanceLock, "lock");
  if ((-[WPDeviceScanner state](self->_scanner, "state") == (id)3
     || -[WPDeviceScanner state](self->_scanner, "state") == (id)2)
    && (-[WPZoneTracker state](self->_tracker, "state") == (id)3
     || -[WPZoneTracker state](self->_tracker, "state") == (id)2))
  {
    if (-[WPDeviceScanner state](self->_scanner, "state") == (id)2)
    {
      v3 = 2;
    }
    else if (-[WPZoneTracker state](self->_tracker, "state") == (id)2)
    {
      v3 = 2;
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }
  if (v3 == self->_state)
  {
    -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
  }
  else
  {
    self->_state = v3;
    v4 = (void (**)(id, int64_t))objc_msgSend(-[CLWPBridge stateHandler](self, "stateHandler"), "copy");
    -[NSRecursiveLock unlock](self->_instanceLock, "unlock");
    if (v4)
    {
      v4[2](v4, v3);

    }
  }
}

- (id)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
