@implementation DeviceContext

- (DeviceContext)init
{
  DeviceContext *v2;
  id v3;
  void *v4;
  os_log_t v5;
  OS_os_log *log;
  NSMutableDictionary *v7;
  NSMutableDictionary *currentContext;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DeviceContext;
  v2 = -[DeviceContext init](&v10, "init");
  if (v2)
  {
    v3 = sub_1000090D4();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    -[DeviceContext setQueue:](v2, "setQueue:", v4);

    v5 = os_log_create("com.apple.powerexperienced", "contextmonitor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    currentContext = v2->_currentContext;
    v2->_currentContext = v7;

  }
  return v2;
}

- (void)start
{
  OS_os_log *log;
  uint8_t v4[16];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Starting Device Context", v4, 2u);
  }
  -[DeviceContext initializeMonitors](self, "initializeMonitors");
}

- (void)initializeMonitors
{
  void *v3;
  const __CFString *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;

  v3 = (void *)MGGetStringAnswer(CFSTR("DeviceClass"), a2);
  v4 = CFSTR("iPhone");
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone"));

  if ((v5 & 1) != 0
    || (v7 = (void *)MGGetStringAnswer(CFSTR("DeviceClass"), v6),
        v4 = CFSTR("Watch"),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Watch")),
        v7,
        v8))
  {
    -[DeviceContext setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("kPlatformContext"));
  }
  -[DeviceContext initPowerSourceChange](self, "initPowerSourceChange");
  -[DeviceContext initLockStateChange](self, "initLockStateChange");
}

- (void)handleXPCEvent:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  const char *string;

  v4 = a3;
  v5 = sub_1000090D4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  dispatch_assert_queue_V2(v6);

  string = xpc_dictionary_get_string(v4, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.system.powersources.source"))
  {
    -[DeviceContext handlePowerSourceChange](self, "handlePowerSourceChange");
  }
  else if (!strcmp(string, "com.apple.springboard.lockstate"))
  {
    -[DeviceContext handleLockStateChange](self, "handleLockStateChange");
  }
}

- (void)handlePowerSourceChange
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _DWORD v6[2];

  v3 = IOPSDrawingUnlimitedPower(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  -[DeviceContext setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("kPluggedInContext"));

  v5 = objc_claimAutoreleasedReturnValue(-[DeviceContext log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Power source update. AC powered %d", (uint8_t *)v6, 8u);
  }

}

- (void)handleBatteryLevelChange
{
  void *v3;
  NSObject *v4;
  void *v5;
  __int16 v6;
  unsigned int v7;
  uint8_t buf[4];
  void *v9;

  v7 = 0;
  v6 = 0;
  if (!IOPSGetPercentRemaining(&v7, (char *)&v6 + 1, &v6))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
    -[DeviceContext setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v3, CFSTR("kBatteryLevelContext"));

    v4 = objc_claimAutoreleasedReturnValue(-[DeviceContext log](self, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceContext objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("kBatteryLevelContext")));
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "battery level %@", buf, 0xCu);

    }
  }
}

- (void)initPowerSourceChange
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[5];
  _QWORD handler[5];

  if (notify_register_check("com.apple.system.powersources.source", &dword_10001BE30))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[DeviceContext log](self, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10000D0D4(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[DeviceContext queue](self, "queue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000083A0;
  handler[3] = &unk_100014608;
  handler[4] = self;
  v12 = notify_register_dispatch("com.apple.system.powersources.percent", &dword_10001BE34, v11, handler);

  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[DeviceContext log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000D0A4(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  v21 = objc_claimAutoreleasedReturnValue(-[DeviceContext queue](self, "queue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000083A8;
  v22[3] = &unk_1000145C0;
  v22[4] = self;
  dispatch_async(v21, v22);

}

- (void)initLockStateChange
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (notify_register_check("com.apple.springboard.lockstate", &dword_10001BE38))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[DeviceContext log](self, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10000D104(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  -[DeviceContext handleLockStateChange](self, "handleLockStateChange");
}

- (void)handleLockStateChange
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t state64;

  v3 = sub_1000090D4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  state64 = 0;
  if (notify_get_state(dword_10001BE38, &state64))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", state64));
    -[DeviceContext setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v5, CFSTR("kLockStateContext"));

  }
}

+ (DeviceContext)sharedInstance
{
  if (qword_10001BE48 != -1)
    dispatch_once(&qword_10001BE48, &stru_100014628);
  return (DeviceContext *)(id)qword_10001BE40;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceContext currentContext](self, "currentContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[DeviceContext willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceContext currentContext](self, "currentContext"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

  -[DeviceContext didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentContext"));
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)currentContext
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
