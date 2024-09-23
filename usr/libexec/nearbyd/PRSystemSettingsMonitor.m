@implementation PRSystemSettingsMonitor

- (PRSystemSettingsMonitor)initWithQueue:(id)a3
{
  id v5;
  PRSystemSettingsMonitor *v6;
  PRSystemSettingsMonitor *v7;
  NSNumber *airplaneModeStatusInternal;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PRSystemSettingsMonitor;
  v6 = -[PRSystemSettingsMonitor init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    airplaneModeStatusInternal = v7->_airplaneModeStatusInternal;
    v7->_airplaneModeStatusInternal = 0;

    v7->_radioPrefs = 0;
    v7->_monitoring = 0;
  }

  return v7;
}

- (void)dealloc
{
  __SCPreferences *radioPrefs;
  objc_super v4;

  radioPrefs = self->_radioPrefs;
  if (radioPrefs)
    CFRelease(radioPrefs);
  v4.receiver = self;
  v4.super_class = (Class)PRSystemSettingsMonitor;
  -[PRSystemSettingsMonitor dealloc](&v4, "dealloc");
}

- (void)initRadioSCPreferencesRef
{
  __SCPreferences *v3;

  if (!self->_radioPrefs)
  {
    v3 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("com.apple.WirelessRadioManager:registerForAirplaneModeNotifications"), CFSTR("com.apple.radios.plist"));
    self->_radioPrefs = v3;
    if (!v3 && os_log_type_enabled((os_log_t)qword_10085B6E8, OS_LOG_TYPE_ERROR))
      sub_1003E5968();
  }
}

- (BOOL)startMonitoring
{
  BOOL v2;
  __SCPreferences *radioPrefs;
  int v5;
  int v6;
  NSObject *v7;
  OS_dispatch_queue *queue;
  _QWORD block[5];
  uint8_t buf[8];
  SCPreferencesContext context;

  if (self->_monitoring)
    return 1;
  radioPrefs = self->_radioPrefs;
  if (!radioPrefs)
  {
    -[PRSystemSettingsMonitor initRadioSCPreferencesRef](self, "initRadioSCPreferencesRef");
    radioPrefs = self->_radioPrefs;
  }
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  v5 = SCPreferencesSetCallback(radioPrefs, (SCPreferencesCallBack)sub_1002A2AFC, &context);
  v2 = v5 != 0;
  if (v5)
  {
    -[PRSystemSettingsMonitor setAirplaneModeStatusInternal:](self, "setAirplaneModeStatusInternal:", 0);
    -[PRSystemSettingsMonitor fetchAndUpdateAirplaneModeStatus](self, "fetchAndUpdateAirplaneModeStatus");
    v6 = SCPreferencesSetDispatchQueue(self->_radioPrefs, (dispatch_queue_t)self->_queue);
    v7 = qword_10085B6E8;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_10085B6E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "regulatory,ap,Airplane Mode notifications are successfully scheduled.", buf, 2u);
      }
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002A2B04;
      block[3] = &unk_1007FB340;
      block[4] = self;
      dispatch_async((dispatch_queue_t)queue, block);
    }
    else if (os_log_type_enabled((os_log_t)qword_10085B6E8, OS_LOG_TYPE_ERROR))
    {
      sub_1003E5994();
    }
    self->_monitoring = 1;
  }
  else if (os_log_type_enabled((os_log_t)qword_10085B6E8, OS_LOG_TYPE_ERROR))
  {
    sub_1003E59C0();
  }
  return v2;
}

- (void)airplaneModeStatusChanged
{
  NSObject *v3;
  PRSystemSettingsMonitor *v4;
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  void (**airplaneModeChangedHandler)(id, id);
  int v11;
  __CFString *v12;

  v3 = qword_10085B6E8;
  if (os_log_type_enabled((os_log_t)qword_10085B6E8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "regulatory,ap,Airplane Mode changed notification.", (uint8_t *)&v11, 2u);
  }
  -[PRSystemSettingsMonitor fetchAndUpdateAirplaneModeStatus](self, "fetchAndUpdateAirplaneModeStatus");
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[PRSystemSettingsMonitor airplaneModeStatus](v4, "airplaneModeStatus");
  v6 = (void *)qword_10085B6E8;
  if (os_log_type_enabled((os_log_t)qword_10085B6E8, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("PRAirplaneModeOff");
    if (v5 == (id)1)
      v7 = CFSTR("PRAirplaneModeOn");
    if (!v5)
      v7 = CFSTR("PRAirplaneModeStatusUnknown");
    v8 = v7;
    v11 = 138412290;
    v12 = v8;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "regulatory,ap,Airplane Mode changed: %@", (uint8_t *)&v11, 0xCu);

  }
  airplaneModeChangedHandler = (void (**)(id, id))v4->_airplaneModeChangedHandler;
  if (airplaneModeChangedHandler)
    airplaneModeChangedHandler[2](airplaneModeChangedHandler, v5);
  objc_sync_exit(v4);

}

- (void)fetchAndUpdateAirplaneModeStatus
{
  __SCPreferences *radioPrefs;

  SCPreferencesSynchronize(self->_radioPrefs);
  radioPrefs = self->_radioPrefs;
  if (radioPrefs)
  {
    SCPreferencesLock(radioPrefs, 1u);
    -[PRSystemSettingsMonitor setAirplaneModeStatusInternal:](self, "setAirplaneModeStatusInternal:", SCPreferencesGetValue(self->_radioPrefs, CFSTR("AirplaneMode")));
    SCPreferencesUnlock(self->_radioPrefs);
  }
  else if (os_log_type_enabled((os_log_t)qword_10085B6E8, OS_LOG_TYPE_ERROR))
  {
    sub_1003E59EC();
  }
}

- (unint64_t)airplaneModeStatus
{
  unint64_t result;

  if (!self->_radioPrefs)
  {
    -[PRSystemSettingsMonitor initRadioSCPreferencesRef](self, "initRadioSCPreferencesRef");
    -[PRSystemSettingsMonitor fetchAndUpdateAirplaneModeStatus](self, "fetchAndUpdateAirplaneModeStatus");
  }
  result = (unint64_t)self->_airplaneModeStatusInternal;
  if (result)
  {
    if (objc_msgSend((id)result, "BOOLValue"))
      return 1;
    else
      return 2;
  }
  return result;
}

- (id)airplaneModeChangedHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setAirplaneModeChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (__SCPreferences)radioPrefs
{
  return self->_radioPrefs;
}

- (void)setRadioPrefs:(__SCPreferences *)a3
{
  self->_radioPrefs = a3;
}

- (NSNumber)airplaneModeStatusInternal
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAirplaneModeStatusInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplaneModeStatusInternal, 0);
  objc_storeStrong(&self->_airplaneModeChangedHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
