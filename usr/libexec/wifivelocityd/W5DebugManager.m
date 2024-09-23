@implementation W5DebugManager

- (W5DebugManager)initWithDiagnosticsModeManager:(id)a3 statusManager:(id)a4
{
  W5DebugManager *v6;
  dispatch_queue_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)W5DebugManager;
  v6 = -[W5DebugManager init](&v9, "init");
  if (v6
    && (v7 = dispatch_queue_create("com.apple.wifivelocity.debug", 0), (v6->_queue = (OS_dispatch_queue *)v7) != 0)
    && (v6->_diagnosticsModeManager = (W5DiagnosticsModeManager *)a3) != 0)
  {
    v6->_statusManager = (W5StatusManager *)a4;
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v4.receiver = self;
  v4.super_class = (Class)W5DebugManager;
  -[W5DebugManager dealloc](&v4, "dealloc");
}

- (void)queryDebugConfigurationAndReply:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034BB0;
  v4[3] = &unk_1000D5C20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)queryDebugConfigurationAndReturnError:(id *)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = sub_100035334;
  v23 = sub_100035344;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = sub_100035334;
  v17 = sub_100035344;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100035710;
  v12[3] = &unk_1000D6558;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[4] = v5;
  -[W5DebugManager queryDebugConfigurationAndReply:](self, "queryDebugConfigurationAndReply:", v12);
  v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v26 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v7 = (id)v14[5];
  v8 = (id)v20[5];
  if (a3)
  {
    v9 = (void *)v14[5];
    if (v9)
      *a3 = v9;
  }
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)setDebugConfiguration:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000357B8;
  block[3] = &unk_1000D5C70;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryWiFiDebugLoggingAndReply:(id)a3
{
  +[W5DebugManager __ios_wifiLoggingEnabledWithQueue:reply:](W5DebugManager, "__ios_wifiLoggingEnabledWithQueue:reply:", 0, a3);
}

- (void)setWiFiDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
  +[W5DebugManager __ios__setWiFiLoggingEnabled:queue:reply:](W5DebugManager, "__ios__setWiFiLoggingEnabled:queue:reply:", a3, 0, a4);
}

- (void)queryBluetoothDebugLoggingAndReply:(id)a3
{
  +[W5DebugManager __ios_bluetoothLoggingEnabledWithQueue:reply:](W5DebugManager, "__ios_bluetoothLoggingEnabledWithQueue:reply:", 0, a3);
}

- (void)setBluetoothDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
  +[W5DebugManager __ios_setBluetoothLoggingEnabled:queue:reply:](W5DebugManager, "__ios_setBluetoothLoggingEnabled:queue:reply:", a3, 0, a4);
}

- (void)querySTBCAndReply:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)setSTBCEnabled:(BOOL)a3 reply:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)queryDiagnosticsModeAndReply:(id)a3
{
  NSObject *global_queue;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100036150;
  v6[3] = &unk_1000D5C20;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(global_queue, v6);
}

- (void)setDiagnosticsMode:(id)a3 reply:(id)a4
{
  NSObject *global_queue;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036228;
  block[3] = &unk_1000D5C70;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(global_queue, block);
}

- (void)queryEAPOLDebugLoggingAndReply:(id)a3
{
  +[W5DebugManager __eapolLoggingEnabledWithQueue:reply:](W5DebugManager, "__eapolLoggingEnabledWithQueue:reply:", 0, a3);
}

- (void)setEAPOLDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
  +[W5DebugManager __setEAPOLLoggingEnabled:queue:reply:](W5DebugManager, "__setEAPOLLoggingEnabled:queue:reply:", a3, 0, a4);
}

- (void)setDHCPDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
  +[W5DebugManager __setDHCPLoggingEnabled:queue:reply:](W5DebugManager, "__setDHCPLoggingEnabled:queue:reply:", a3, 0, a4);
}

- (void)queryDNSDebugLoggingAndReply:(id)a3
{
  +[W5DebugManager __dnsLoggingEnabledWithQueue:reply:](W5DebugManager, "__dnsLoggingEnabledWithQueue:reply:", 0, a3);
}

- (void)setDNSDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
  +[W5DebugManager __setDNSLoggingEnabled:queue:reply:](W5DebugManager, "__setDNSLoggingEnabled:queue:reply:", a3, 0, a4);
}

- (void)queryAirPlayDebugLoggingAndReply:(id)a3
{
  +[W5DebugManager __airplayLoggingEnabledWithQueue:reply:](W5DebugManager, "__airplayLoggingEnabledWithQueue:reply:", 0, a3);
}

- (void)setAirPlayDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
  +[W5DebugManager __setAirPlayLoggingEnabled:queue:reply:](W5DebugManager, "__setAirPlayLoggingEnabled:queue:reply:", a3, 0, a4);
}

- (void)queryOpenDirectoryDebugLoggingAndReply:(id)a3
{
  +[W5DebugManager __openDirectoryLoggingEnabledWithQueue:reply:](W5DebugManager, "__openDirectoryLoggingEnabledWithQueue:reply:", 0, a3);
}

- (void)setOpenDirectoryDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
  +[W5DebugManager __setOpenDirectoryLoggingEnabled:queue:reply:](W5DebugManager, "__setOpenDirectoryLoggingEnabled:queue:reply:", a3, 0, a4);
}

+ (void)setOSLogPreferenceLevel:(id)a3 enableOvserizeMessages:(BOOL)a4 subsystem:(id)a5
{
  _BOOL4 v5;
  NSURL *v7;
  id v8;
  id v9;
  id v10;
  const CFBooleanRef *v11;

  v5 = a4;
  v7 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/Library/Preferences/Logging/Subsystems/%@.plist"), a5), 0);
  v8 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v8, "setDictionary:", +[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v7));
  v9 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v9, "setDictionary:", objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DEFAULT-OPTIONS")));
  v10 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v10, "setDictionary:", objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Level")));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, CFSTR("Enable"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, CFSTR("Persist"));
  v11 = &kCFBooleanTrue;
  if (!v5)
    v11 = &kCFBooleanFalse;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", *v11, CFSTR("Enable-Oversize-Messages"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("Level"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("DEFAULT-OPTIONS"));
  objc_msgSend(v8, "writeToURL:atomically:", v7, 1);
}

+ (void)__ios_wifiLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036548;
  block[3] = &unk_1000D61F8;
  block[4] = a4;
  dispatch_async(global_queue, block);
}

+ (void)__ios__setWiFiLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  NSObject *global_queue;
  _QWORD block[6];
  BOOL v10;

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000366B8;
  block[3] = &unk_1000D65A8;
  v10 = a3;
  block[4] = a1;
  block[5] = a5;
  dispatch_async(global_queue, block);
}

+ (BOOL)__setEAPOLDebugFlagsEnabled:(BOOL)a3 error:(id *)a4
{
  int v5;
  const __SCPreferences *v6;
  const __SCPreferences *v7;
  int v8;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  v5 = a3;
  v6 = SCPreferencesCreate(kCFAllocatorDefault, (CFStringRef)-[NSProcessInfo processName](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "processName"), CFSTR("com.apple.eapolclient.plist"));
  v7 = v6;
  if (v6 && SCPreferencesLock(v6, 1u))
  {
    if (SCPreferencesSetValue(v7, CFSTR("LogFlags"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v5 << 31 >> 31)))&& SCPreferencesCommitChanges(v7)&& SCPreferencesApplyChanges(v7))
    {
      v8 = 0;
    }
    else
    {
      v8 = SCError();
    }
    SCPreferencesUnlock(v7);
    if (!a4)
      goto LABEL_10;
  }
  else
  {
    v8 = SCError();
    if (!a4)
      goto LABEL_10;
  }
  if (v8)
  {
    v10 = NSLocalizedFailureReasonErrorKey;
    v11 = CFSTR("err");
    *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainSystemConfiguration, v8, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  }
LABEL_10:
  if (v7)
    CFRelease(v7);
  return v8 == 0;
}

+ (BOOL)__getEAPOLDebugFlagsEnabled
{
  const __SCPreferences *v2;
  const __SCPreferences *v3;
  BOOL v4;

  v2 = SCPreferencesCreate(kCFAllocatorDefault, (CFStringRef)-[NSProcessInfo processName](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "processName"), CFSTR("com.apple.eapolclient.plist"));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_msgSend((id)SCPreferencesGetValue(v2, CFSTR("LogFlags")), "intValue") == -1;
  CFRelease(v3);
  return v4;
}

+ (void)__eapolLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  NSObject *global_queue;
  _QWORD v7[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036A40;
  v7[3] = &unk_1000D5C20;
  v7[4] = a1;
  v7[5] = a4;
  dispatch_async(global_queue, v7);
}

+ (void)__setEAPOLLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  NSObject *global_queue;
  _QWORD block[6];
  BOOL v10;

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036B54;
  block[3] = &unk_1000D65A8;
  v10 = a3;
  block[4] = a1;
  block[5] = a5;
  dispatch_async(global_queue, block);
}

+ (void)__toggleDNSLoggingWithQueue:(id)a3 reply:(id)a4
{
  +[NSTask runTaskWithLaunchPath:arguments:reply:](NSTask, "runTaskWithLaunchPath:arguments:reply:", CFSTR("/usr/bin/killall"), &off_1000E7E90, a4);
}

+ (void)__dnsLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036CC0;
  block[3] = &unk_1000D61F8;
  block[4] = a4;
  dispatch_async(global_queue, block);
}

+ (void)__setDNSLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  _QWORD v5[7];
  BOOL v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100036EDC;
  v5[3] = &unk_1000D65D0;
  v6 = a3;
  v5[4] = a1;
  v5[5] = a4;
  v5[6] = a5;
  objc_msgSend(a1, "__dnsLoggingEnabledWithQueue:reply:", a4, v5);
}

+ (void)__setDHCPLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  const char *v6;
  const __CFString *v7;
  _QWORD v8[2];

  if (a3)
    v6 = "IPConfiguration: verbose mode enabled";
  else
    v6 = "IPConfiguration: verbose mode disabled";
  if (a3)
    v7 = CFSTR("1");
  else
    v7 = CFSTR("0");
  syslog(2, v6);
  v8[0] = CFSTR("setverbose");
  v8[1] = v7;
  +[NSTask runTaskWithLaunchPath:arguments:reply:](NSTask, "runTaskWithLaunchPath:arguments:reply:", CFSTR("/usr/sbin/ipconfig"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2), a5);
}

+ (void)__mostRecentLogWithSuffix:(id)a3 logPath:(id)a4 queue:(id)a5 reply:(id)a6
{
  id v9;
  NSObject *v10;
  _QWORD io_handler[9];
  _QWORD v12[4];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  v9 = +[NSMutableData data](NSMutableData, "data", a3, a4, a5);
  v10 = dispatch_io_create_with_path(0, (const char *)objc_msgSend(a4, "UTF8String"), 0, 0, (dispatch_queue_t)&_dispatch_main_q, &stru_1000D6610);
  dispatch_io_set_high_water(v10, 0x3E8uLL);
  io_handler[0] = _NSConcreteStackBlock;
  io_handler[1] = 3221225472;
  io_handler[2] = sub_100037148;
  io_handler[3] = &unk_1000D6638;
  io_handler[7] = a6;
  io_handler[8] = v12;
  io_handler[4] = v10;
  io_handler[5] = v9;
  io_handler[6] = a3;
  dispatch_io_read(v10, 0, 0xFFFFFFFFFFFFFFFFLL, (dispatch_queue_t)&_dispatch_main_q, io_handler);
  _Block_object_dispose(v12, 8);
}

+ (void)__openDirectoryLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000373B4;
  v4[3] = &unk_1000D6660;
  v4[4] = a3;
  v4[5] = a4;
  +[W5DebugManager __mostRecentLogWithSuffix:logPath:queue:reply:](W5DebugManager, "__mostRecentLogWithSuffix:logPath:queue:reply:", &off_1000E7EA8, CFSTR("/var/log/opendirectoryd.log"), a3, v4);
}

+ (void)__setOpenDirectoryLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  const __CFString *v6;
  NSArray *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v8 = CFSTR("set");
  v9 = CFSTR("log");
  if (a3)
    v6 = CFSTR("debug");
  else
    v6 = CFSTR("off");
  v10 = v6;
  v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 3);
  +[NSTask runTaskWithLaunchPath:arguments:reply:](NSTask, "runTaskWithLaunchPath:arguments:reply:", CFSTR("/usr/bin/odutil"), v7, a5, v8, v9);
}

+ (id)__valueForKey:(id)a3 domain:(id)a4
{
  id result;

  result = (id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  if (result)
    return result;
  return result;
}

+ (void)__setValue:(id)a3 key:(id)a4 domain:(id)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)a5);
  CFPreferencesAppSynchronize((CFStringRef)a5);
}

+ (void)__ios_bluetoothLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  v6 = objc_msgSend(objc_msgSend(a1, "__valueForKey:domain:", CFSTR("ShouldLog"), CFSTR("com.apple.wirelessproxd.debug")), "BOOLValue");
  v7 = objc_msgSend(objc_msgSend(a1, "__valueForKey:domain:", CFSTR("DiagnosticMode"), CFSTR("com.apple.MobileBluetooth.debug")), "BOOLValue");
  v8 = objc_msgSend(objc_msgSend(a1, "__valueForKey:domain:", CFSTR("DefaultLevel"), CFSTR("com.apple.MobileBluetooth.debug")), "isEqualToString:", CFSTR("Info"));
  v9 = objc_msgSend(objc_msgSend(objc_msgSend(a1, "__valueForKey:domain:", CFSTR("HCITraces"), CFSTR("com.apple.MobileBluetooth.debug")), "objectForKey:", CFSTR("StackDebugEnabled")), "isEqualToString:", CFSTR("TRUE"));
  v10 = objc_msgSend(objc_msgSend(objc_msgSend(a1, "__valueForKey:domain:", CFSTR("LE"), CFSTR("com.apple.MobileBluetooth.debug")), "objectForKey:", CFSTR("DebugLevel")), "isEqualToString:", CFSTR("Info"));
  if (a4)
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, v6 & v7 & v8 & v9 & v10);
}

+ (void)__ios_setBluetoothLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  _BOOL8 v6;
  BOOL v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;

  v6 = a3;
  objc_msgSend(a1, "__setValue:key:domain:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3, a4), CFSTR("ShouldLog"), CFSTR("com.apple.wirelessproxd.debug"));
  objc_msgSend(a1, "__setValue:key:domain:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6), CFSTR("DiagnosticMode"), CFSTR("com.apple.MobileBluetooth.debug"));
  v8 = !v6;
  if (v6)
    v9 = CFSTR("Info");
  else
    v9 = CFSTR("Error");
  if (v8)
    v10 = CFSTR("FALSE");
  else
    v10 = CFSTR("TRUE");
  objc_msgSend(a1, "__setValue:key:domain:", v9, CFSTR("DefaultLevel"), CFSTR("com.apple.MobileBluetooth.debug"));
  v13 = CFSTR("StackDebugEnabled");
  v14 = v10;
  objc_msgSend(a1, "__setValue:key:domain:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1), CFSTR("HCITraces"), CFSTR("com.apple.MobileBluetooth.debug"));
  v11 = CFSTR("DebugLevel");
  v12 = v9;
  objc_msgSend(a1, "__setValue:key:domain:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), CFSTR("LE"), CFSTR("com.apple.MobileBluetooth.debug"));
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

+ (void)__enableAirPlayLoggingWithQueue:(id)a3 reply:(id)a4
{
  +[NSTask runTaskWithLaunchPath:arguments:reply:](NSTask, "runTaskWithLaunchPath:arguments:reply:", _NSConcreteStackBlock, 3221225472, sub_100037988, &unk_1000D5DE8, CFSTR("/usr/local/bin/airplayutil"), a4);
}

+ (void)__disableAirPlayLoggingWithQueue:(id)a3 reply:(id)a4
{
  +[NSTask runTaskWithLaunchPath:arguments:reply:](NSTask, "runTaskWithLaunchPath:arguments:reply:", CFSTR("/usr/local/bin/airplayutil"), &off_1000E7F20, a4);
}

+ (void)__setAirPlayLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  if (a3)
    +[W5DebugManager __enableAirPlayLoggingWithQueue:reply:](W5DebugManager, "__enableAirPlayLoggingWithQueue:reply:", a4, a5);
  else
    +[W5DebugManager __disableAirPlayLoggingWithQueue:reply:](W5DebugManager, "__disableAirPlayLoggingWithQueue:reply:", a4, a5);
}

+ (void)__airplayLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  +[NSTask runTaskWithLaunchPath:arguments:outputData:reply:](NSTask, "runTaskWithLaunchPath:arguments:outputData:reply:", CFSTR("/usr/local/bin/airplayutil"), &off_1000E7F38, _NSConcreteStackBlock, 3221225472, sub_100037B10, &unk_1000D5DE8, +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 0), a4);
}

- (void)__queryMegaWiFiProfileInstalledAndReply:(id)a3
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037C14;
  block[3] = &unk_1000D61F8;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

- (void)__setMegaWiFiProfileInstalled:(BOOL)a3 reply:(id)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100037DB4;
  v4[3] = &unk_1000D6688;
  v5 = a3;
  v4[4] = a4;
  -[W5DebugManager __queryMegaWiFiProfileInstalledAndReply:](self, "__queryMegaWiFiProfileInstalledAndReply:", v4);
}

- (void)__queryNoLoggingWiFiProfileInstalledAndReply:(id)a3
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037F30;
  block[3] = &unk_1000D61F8;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

- (void)__setNoLoggingWiFiProfileInstalled:(BOOL)a3 reply:(id)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000380D0;
  v4[3] = &unk_1000D6688;
  v5 = a3;
  v4[4] = a4;
  -[W5DebugManager __queryNoLoggingWiFiProfileInstalledAndReply:](self, "__queryNoLoggingWiFiProfileInstalledAndReply:", v4);
}

@end
