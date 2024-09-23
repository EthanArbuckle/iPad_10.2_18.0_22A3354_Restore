@implementation BiometricKitXPCServerMesa

- (void)updateBioLogState
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "updateBioLogState\n", (uint8_t *)&v13, 2u);
  }
  -[BiometricKitXPCServer identities](self, "identities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BioLogBase updateLogger:withServerObject:identities:](BioLogLegacy, "updateLogger:withServerObject:identities:", &self->_vibrationPatterns, self, v5);

  -[__IOHIDEventSystemClient updateBioLog:](self->_hidClient, "updateBioLog:", self->_vibrationPatterns);
  if (self->_vibrationPatterns)
  {
    v6 = 1;
  }
  else
  {
    +[BioLog y](_TtC5BKDM16BioLog, "y");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  v8 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 44, v6, 0, 0, 0, 0);
  if (v8)
  {
    v11 = v8;
    v12 = (__osLog ? __osLog : v3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136316162;
      v14 = "[self performCommand:kBioLogEnabledCommand inValue:enabled inData:((void *)0) inSize:0 outData:((void *)0) o"
            "utSize:((void *)0)] == 0 ";
      v15 = 2048;
      v16 = v11;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v21 = 1024;
      v22 = 381;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
  }
  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitXPCServer setAriadneSignposts:](self, "setAriadneSignposts:", objc_msgSend(v9, "BOOLForKey:", CFSTR("ariadneSignpostsEnabled")));

  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v3;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "updateBioLogState -> void\n", (uint8_t *)&v13, 2u);
  }
}

- (BiometricKitXPCServerMesa)init
{
  NSObject *v3;
  NSObject *v4;
  BiometricKitXPCServerMesa *v5;
  BiometricKitXPCServerMesa *v6;
  id v7;
  void *v8;
  MesaCoreAnalytics *v9;
  __IOHIDEventSystemClient *hidClient;
  __IOHIDEventSystemClient *v11;
  __IOHIDEventSystemClient *v12;
  void *v13;
  uint64_t v14;
  void *enrollmentCount;
  id v16;
  void *v17;
  void *v18;
  NSMutableArray *vibrationPatterns;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  dispatch_queue_t v24;
  NSDate *currentDate;
  NSObject *p_super;
  BiometricKitXPCServerMesa *v27;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v29;
  __CFNotificationCenter *v30;
  __CFString *v31;
  __CFNotificationCenter *v32;
  __CFNotificationCenter *v33;
  __CFNotificationCenter *v34;
  dispatch_source_t v35;
  void *loggingType;
  IONotificationPort *v37;
  const __CFDictionary *v38;
  kern_return_t v39;
  NSObject *v40;
  NSObject *v42;
  kern_return_t v43;
  NSObject *v44;
  _QWORD block[4];
  BiometricKitXPCServerMesa *v46;
  objc_super v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLog)
    v4 = __osLog;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEFAULT, "init\n", buf, 2u);
  }
  v47.receiver = self;
  v47.super_class = (Class)BiometricKitXPCServerMesa;
  v5 = -[BiometricKitXPCServer init](&v47, sel_init);
  v6 = v5;
  if (!v5)
  {
    if (__osLog)
      v42 = __osLog;
    else
      v42 = v3;
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_DWORD *)buf = 136316162;
    v49 = "self";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = "";
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v56 = 1024;
    v57 = 647;
    goto LABEL_54;
  }
  LOWORD(v5->_connect) = 0;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v8 = *(void **)&v6->_showDebugImages;
  *(_QWORD *)&v6->_showDebugImages = v7;

  if (!*(_QWORD *)&v6->_showDebugImages)
  {
    if (__osLog)
      v42 = __osLog;
    else
      v42 = v3;
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_DWORD *)buf = 136316162;
    v49 = "_templListCache";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = "";
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v56 = 1024;
    v57 = 652;
    goto LABEL_54;
  }
  v9 = objc_alloc_init(MesaCoreAnalytics);
  hidClient = v6->_hidClient;
  v6->_hidClient = (__IOHIDEventSystemClient *)v9;

  v11 = v6->_hidClient;
  if (!v11)
  {
    if (__osLog)
      v42 = __osLog;
    else
      v42 = v3;
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_DWORD *)buf = 136316162;
    v49 = "_statistics != ((void *)0)";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = "";
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v56 = 1024;
    v57 = 655;
    goto LABEL_54;
  }
  -[__IOHIDEventSystemClient setServer:](v11, "setServer:", v6);
  v12 = v6->_hidClient;
  -[BiometricKitXPCServer biometricABC](v6, "biometricABC");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[__IOHIDEventSystemClient setBiometricABC:](v12, "setBiometricABC:", v13);

  v6->_statistics = 0;
  v6->_sensorInfo.version = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = objc_claimAutoreleasedReturnValue();
  enrollmentCount = (void *)v6->_enrollmentCount;
  v6->_enrollmentCount = v14;

  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = *(void **)&v6->_lastSBLockMsg;
  *(_QWORD *)&v6->_lastSBLockMsg = v16;

  v18 = *(void **)&v6->_lastSBLockMsg;
  if (!v18)
  {
    if (__osLog)
      v42 = __osLog;
    else
      v42 = v3;
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_DWORD *)buf = 136316162;
    v49 = "_vibrationPatterns";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = "";
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v56 = 1024;
    v57 = 664;
    goto LABEL_54;
  }
  objc_msgSend(v18, "setObject:atIndexedSubscript:", &unk_251CB3C58, 0);
  objc_msgSend(*(id *)&v6->_lastSBLockMsg, "setObject:atIndexedSubscript:", &unk_251CB3C80, 1);
  objc_msgSend(*(id *)&v6->_lastSBLockMsg, "setObject:atIndexedSubscript:", &unk_251CB3CA8, 2);
  BYTE3(v6->_wakeGestureManager) = 0;
  vibrationPatterns = v6->_vibrationPatterns;
  v6->_vibrationPatterns = 0;

  v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = *(void **)&v6->_status;
  *(_QWORD *)&v6->_status = v20;

  v22 = IOHIDEventSystemClientCreate();
  v6->_hidClientQueue = (OS_dispatch_queue *)v22;
  if (!v22)
  {
    if (__osLog)
      v42 = __osLog;
    else
      v42 = v3;
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_DWORD *)buf = 136316162;
    v49 = "_hidClient";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = "";
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v56 = 1024;
    v57 = 690;
    goto LABEL_54;
  }
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = dispatch_queue_create("com.apple.biometrickitd.hid", v23);
  currentDate = v6->_currentDate;
  v6->_currentDate = (NSDate *)v24;

  p_super = &v6->_currentDate->super;
  if (!p_super)
  {
    if (__osLog)
      v42 = __osLog;
    else
      v42 = v3;
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_DWORD *)buf = 136316162;
    v49 = "_hidClientQueue";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = "";
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v56 = 1024;
    v57 = 694;
    goto LABEL_54;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__BiometricKitXPCServerMesa_init__block_invoke;
  block[3] = &unk_251CA06E0;
  v27 = v6;
  v46 = v27;
  dispatch_async(p_super, block);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v27, (CFNotificationCallback)__SettingsNotificationCallback, CFSTR("com.apple.biometrickitd.enableMatchVibe"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v29 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v29, v27, (CFNotificationCallback)__SettingsNotificationCallback, CFSTR("com.apple.biometrickitd.AppleMesaSEPLoggingLevel"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v30 = CFNotificationCenterGetDarwinNotifyCenter();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAE940]);
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(v30, v27, (CFNotificationCallback)__thermalLevelCallback, v31, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  -[BiometricKitXPCServerMesa registerForLiftToWakeNotifications:](v27, "registerForLiftToWakeNotifications:", 1);
  v32 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v32, v27, (CFNotificationCallback)__LoggingSettingsNotificationCallback, CFSTR("com.apple.ManagedConfiguration.profileListChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v33 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v33, v27, (CFNotificationCallback)__LoggingSettingsNotificationCallback, CFSTR("com.apple.biometrickitd.debugLogEnabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v34 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v34, v27, (CFNotificationCallback)__LoggingSettingsNotificationCallback, CFSTR("com.apple.biometrickitd.debugLogPath"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  signal(15, (void (__cdecl *)(int))1);
  v35 = dispatch_source_create(MEMORY[0x24BDACA08], 0xFuLL, 0, MEMORY[0x24BDAC9B8]);
  loggingType = (void *)v27->_loggingType;
  v27->_loggingType = (unint64_t)v35;

  dispatch_source_set_event_handler((dispatch_source_t)v27->_loggingType, &__block_literal_global);
  dispatch_resume((dispatch_object_t)v27->_loggingType);
  v37 = -[BiometricKitXPCServer notifyport](v27, "notifyport");
  v38 = IOServiceMatching("AppleBiometricServices");
  v39 = IOServiceAddMatchingNotification(v37, "IOServiceFirstMatch", v38, (IOServiceMatchingCallback)__serviceMatch, v27, (io_iterator_t *)&v27->super._reporter);
  if (!v39)
  {
    __serviceMatch(v27, LODWORD(v27->super._reporter));
    -[BiometricKitXPCServerMesa setupDailyUpdateTimer](v27, "setupDailyUpdateTimer");
    if (__osLogTrace)
      v40 = __osLogTrace;
    else
      v40 = v3;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v49 = (const char *)v27;
      _os_log_impl(&dword_24B74E000, v40, OS_LOG_TYPE_DEBUG, "init -> %@\n", buf, 0xCu);
    }
    return v27;
  }
  v43 = v39;
  if (__osLog)
    v42 = __osLog;
  else
    v42 = v3;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v49 = "err == 0 ";
    v50 = 2048;
    v51 = v43;
    v52 = 2080;
    v53 = "";
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v56 = 1024;
    v57 = 789;
LABEL_54:
    _os_log_impl(&dword_24B74E000, v42, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_55:

  if (__osLogTrace)
    v44 = __osLogTrace;
  else
    v44 = v3;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v49 = 0;
    _os_log_impl(&dword_24B74E000, v44, OS_LOG_TYPE_ERROR, "init -> %@\n", buf, 0xCu);
  }
  return 0;
}

void __33__BiometricKitXPCServerMesa_init__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x24BD27898]();
  v1 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithObjectsAndKeys:", v2, CFSTR("PrimaryUsagePage"), v3, CFSTR("PrimaryUsage"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IOHIDEventSystemClientSetMatchingMultiple();
  IOHIDEventSystemClientScheduleWithDispatchQueue();

  objc_autoreleasePoolPop(v0);
}

void __33__BiometricKitXPCServerMesa_init__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  if (__osLog)
    v0 = __osLog;
  else
    v0 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_24B74E000, v0, OS_LOG_TYPE_DEFAULT, "SIGTERM received\n", v1, 2u);
  }
  exit(0);
}

- (int)initAutoBugCapture
{
  MesaAutoBugCapture *v3;
  void *v4;
  MesaAutoBugCapture *v5;
  void *v6;
  __IOHIDEventSystemClient *hidClient;
  void *v8;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = [MesaAutoBugCapture alloc];
  -[BiometricKitXPCServer biometricABCDispatchQueue](self, "biometricABCDispatchQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BiometricAutoBugCapture initWithDomain:process:dispatchQueue:](v3, "initWithDomain:process:dispatchQueue:", CFSTR("TouchID"), CFSTR("biometrickitd"), v4);
  -[BiometricKitXPCServer setBiometricABC:](self, "setBiometricABC:", v5);

  -[BiometricKitXPCServer biometricABC](self, "biometricABC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    hidClient = self->_hidClient;
    -[BiometricKitXPCServer biometricABC](self, "biometricABC");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__IOHIDEventSystemClient setBiometricABC:](hidClient, "setBiometricABC:", v8);

    return 0;
  }
  else
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136316162;
      v12 = "self.biometricABC";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v19 = 1024;
      v20 = 841;
      _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    }
    return 263;
  }
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  io_object_t reporter;
  io_connect_t reporter_high;
  io_object_t services;
  io_object_t v7;
  objc_super v8;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  reporter = (io_object_t)self->super._reporter;
  if (reporter)
    IOObjectRelease(reporter);
  reporter_high = HIDWORD(self->super._reporter);
  if (reporter_high)
    IOServiceClose(reporter_high);
  services = self->_services;
  if (services)
    IOObjectRelease(services);
  v7 = HIDWORD(self->super._reporter);
  if (v7)
    IOObjectRelease(v7);
  MEMORY[0x24BD27418](self->_hidClientQueue, self->_currentDate);
  -[BiometricKitXPCServerMesa registerForLiftToWakeNotifications:](self, "registerForLiftToWakeNotifications:", 0);
  v8.receiver = self;
  v8.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer dealloc](&v8, sel_dealloc);
}

- (void)disconnectingClient:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BiometricKitXPCServerMesa;
  v4 = a3;
  -[BiometricKitXPCServer disconnectingClient:](&v5, sel_disconnectingClient_, v4);
  -[NSMutableArray logDisconnectingClient:](self->_vibrationPatterns, "logDisconnectingClient:", v4, v5.receiver, v5.super_class);

}

- (void)notifyAppIsInactive:(BOOL)a3 withClient:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v11;

  v4 = a3;
  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer notifyAppIsInactive:withClient:](&v11, sel_notifyAppIsInactive_withClient_, v4, v6);
  -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  if (v10 == v6 && BYTE1(self->_sensorInfo.structSize))
    -[BiometricKitXPCServerMesa disableHomeButton:](self, "disableHomeButton:", v4 ^ 1);

}

- (void)sendStatusMessage:(unsigned int)a3 toClient:(id)a4
{
  uint64_t v4;
  id v6;
  NSMutableArray *vibrationPatterns;
  void *v8;
  objc_super v9;
  _QWORD v10[2];

  v4 = *(_QWORD *)&a3;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)BiometricKitXPCServerMesa;
  v6 = a4;
  -[BiometricKitXPCServer sendStatusMessage:toClient:](&v9, sel_sendStatusMessage_toClient_, v4, v6);
  vibrationPatterns = self->_vibrationPatterns;
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1, v9.receiver, v9.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray logStatusMessage:withData:timestamp:forClients:](vibrationPatterns, "logStatusMessage:withData:timestamp:forClients:", v4, 0, 0, v8);

}

- (int)enroll:(int)a3 forUser:(unsigned int)a4 withOptions:(id)a5 withClient:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  NSMutableArray *vibrationPatterns;
  id v12;
  signed int v13;
  uint64_t v14;
  void *v15;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  vibrationPatterns = self->_vibrationPatterns;
  v12 = a5;
  -[NSMutableArray logEnrollStartForUser:fromClient:](vibrationPatterns, "logEnrollStartForUser:fromClient:", v7, v10);
  v18.receiver = self;
  v18.super_class = (Class)BiometricKitXPCServerMesa;
  v13 = -[BiometricKitXPCServer enroll:forUser:withOptions:withClient:](&v18, sel_enroll_forUser_withOptions_withClient_, v8, v7, v12, v10);

  v14 = v13;
  if (v13)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "err == 0 ";
      v21 = 2048;
      v22 = v13;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v27 = 1024;
      v28 = 998;
      _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    +[BioLog y](_TtC5BKDM16BioLog, "y");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logEnrollStartWithUserID:client:", v7, v10);

  }
  -[NSMutableArray logEnrollStartError:](self->_vibrationPatterns, "logEnrollStartError:", v14);

  return v14;
}

- (int)initEnrollOperation:(id)a3 biometricType:(int)a4 userID:(unsigned int)a5 options:(id)a6 client:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v22;
  NSObject *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (!v12)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 136316162;
    v26 = "operation";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v33 = 1024;
    v34 = 1017;
    goto LABEL_18;
  }
  if (!v14)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 136316162;
    v26 = "client";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v33 = 1024;
    v34 = 1018;
LABEL_18:
    _os_log_impl(&dword_24B74E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_19:
    v20 = 258;
    goto LABEL_7;
  }
  v24.receiver = self;
  v24.super_class = (Class)BiometricKitXPCServerMesa;
  v16 = -[BiometricKitXPCServer initEnrollOperation:biometricType:userID:options:client:](&v24, sel_initEnrollOperation_biometricType_userID_options_client_, v12, v10, v9, v13, v14);
  if (v16)
  {
    v20 = v16;
    if (__osLog)
      v23 = __osLog;
    else
      v23 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "err == 0 ";
      v27 = 2048;
      v28 = v20;
      v29 = 2080;
      v30 = "";
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v33 = 1024;
      v34 = 1021;
      _os_log_impl(&dword_24B74E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    objc_msgSend(v15, "clientInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("BKClientBundleIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

    if (v19)
      objc_msgSend(v12, "setProcessedFlags:", objc_msgSend(v12, "processedFlags") | 1);
    v20 = 0;
  }
LABEL_7:

  return v20;
}

- (int)performEnrollCommand:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  int v13;
  void *v14;
  char v15;
  NSObject *v17;
  NSObject *v18;
  uint8_t buf[48];
  __int128 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = -[BiometricKitXPCServerMesa getCommProtocolVersion](self, "getCommProtocolVersion");
    if (v5)
    {
      v13 = v5;
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = "";
      *(_WORD *)&buf[32] = 2080;
      *(_QWORD *)&buf[34] = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
      *(_WORD *)&buf[42] = 1024;
      *(_DWORD *)&buf[44] = 1046;
    }
    else
    {
      if (LOWORD(self->_connect) > 1u)
      {
        v21 = 0;
        v20 = 0u;
        memset(buf, 0, sizeof(buf));
        *(_DWORD *)&buf[4] = objc_msgSend(v4, "userID");
        v10 = objc_msgSend(v4, "authData");
        v11 = *(_QWORD *)(v10 + 32);
        v12 = *(_OWORD *)(v10 + 16);
        *(_OWORD *)&buf[8] = *(_OWORD *)v10;
        *(_OWORD *)&buf[24] = v12;
        *(_QWORD *)&buf[40] = v11;
        v9 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 3, 2, 0, buf, 68, 0, 0);
      }
      else
      {
        *(_DWORD *)buf = 0;
        *(_DWORD *)&buf[4] = objc_msgSend(v4, "userID");
        v6 = objc_msgSend(v4, "authData");
        v7 = *(_QWORD *)(v6 + 32);
        v8 = *(_OWORD *)(v6 + 16);
        *(_OWORD *)&buf[8] = *(_OWORD *)v6;
        *(_OWORD *)&buf[24] = v8;
        *(_QWORD *)&buf[40] = v7;
        v9 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 3, 1, 0, buf, 48, 0, 0);
      }
      v13 = v9;
      if (!v9)
      {
        -[__IOHIDEventSystemClient startBioOperation:](self->_hidClient, "startBioOperation:", v4);
        BYTE1(self->_sensorInfo.structSize) = 1;
        objc_msgSend(v4, "client");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "clientAppIsInactive");

        if ((v15 & 1) == 0)
          -[BiometricKitXPCServerMesa disableHomeButton:](self, "disableHomeButton:", 1);
        v13 = 0;
        goto LABEL_10;
      }
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = "";
      *(_WORD *)&buf[32] = 2080;
      *(_QWORD *)&buf[34] = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
      *(_WORD *)&buf[42] = 1024;
      *(_DWORD *)&buf[44] = 1065;
    }
    _os_log_impl(&dword_24B74E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_10;
  }
  if (__osLog)
    v17 = __osLog;
  else
    v17 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "operation";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = "";
    *(_WORD *)&buf[32] = 2080;
    *(_QWORD *)&buf[34] = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
    *(_WORD *)&buf[42] = 1024;
    *(_DWORD *)&buf[44] = 1042;
    _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v13 = 258;
LABEL_10:

  return v13;
}

- (int)match:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  signed int v11;
  uint64_t v12;
  void *v13;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableArray logMatchStart:withOptions:fromClient:](self->_vibrationPatterns, "logMatchStart:withOptions:fromClient:", v8, v9, v10);
  v16.receiver = self;
  v16.super_class = (Class)BiometricKitXPCServerMesa;
  v11 = -[BiometricKitXPCServer match:withOptions:withClient:](&v16, sel_match_withOptions_withClient_, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "err == 0 ";
      v19 = 2048;
      v20 = v12;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 1094;
      _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    +[BioLog y](_TtC5BKDM16BioLog, "y");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logMatchStartWithFilter:options:client:", v8, v9, v10);

  }
  -[NSMutableArray logMatchStartError:](self->_vibrationPatterns, "logMatchStartError:", v12);

  return v12;
}

- (id)createMatchOperation
{
  return objc_alloc_init(BiometricMatchOperationMesa);
}

- (int)initMatchOperation:(id)a3 filter:(id)a4 options:(id)a5 client:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  int Bool;
  int v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  objc_super v41;
  char v42;
  __int16 v43;
  __int16 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  v44 = 0;
  v43 = 0;
  v42 = 0;
  if (!v10)
  {
    if (__osLog)
      v37 = __osLog;
    else
      v37 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_115;
    *(_DWORD *)buf = 136316162;
    v46 = "operation";
    v47 = 2048;
    v48 = 0;
    v49 = 2080;
    v50 = "";
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v53 = 1024;
    v54 = 1127;
    goto LABEL_114;
  }
  if (!v13)
  {
    if (__osLog)
      v37 = __osLog;
    else
      v37 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_115;
    *(_DWORD *)buf = 136316162;
    v46 = "client";
    v47 = 2048;
    v48 = 0;
    v49 = 2080;
    v50 = "";
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v53 = 1024;
    v54 = 1128;
    goto LABEL_114;
  }
  v41.receiver = self;
  v41.super_class = (Class)BiometricKitXPCServerMesa;
  v15 = -[BiometricKitXPCServer initMatchOperation:filter:options:client:](&v41, sel_initMatchOperation_filter_options_client_, v10, v11, v12, v13);
  if (v15)
  {
    v35 = v15;
    if (__osLog)
      v38 = __osLog;
    else
      v38 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_DWORD *)buf = 136316162;
    v46 = "err == 0 ";
    v47 = 2048;
    v48 = v35;
    v49 = 2080;
    v50 = "";
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v53 = 1024;
    v54 = 1131;
LABEL_78:
    _os_log_impl(&dword_24B74E000, v38, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_32;
  }
  if (!v12)
    goto LABEL_10;
  Bool = dictionaryGetBool();
  if (Bool)
  {
    v35 = Bool;
    if (__osLog)
      v38 = __osLog;
    else
      v38 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_DWORD *)buf = 136316162;
    v46 = "err == 0 ";
    v47 = 2048;
    v48 = v35;
    v49 = 2080;
    v50 = "";
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v53 = 1024;
    v54 = 1135;
    goto LABEL_78;
  }
  v17 = dictionaryGetBool();
  if (v17)
  {
    v35 = v17;
    if (__osLog)
      v38 = __osLog;
    else
      v38 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_DWORD *)buf = 136316162;
    v46 = "err == 0 ";
    v47 = 2048;
    v48 = v35;
    v49 = 2080;
    v50 = "";
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v53 = 1024;
    v54 = 1138;
    goto LABEL_78;
  }
  v18 = dictionaryGetBool();
  if (v18)
  {
    v35 = v18;
    if (__osLog)
      v38 = __osLog;
    else
      v38 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_DWORD *)buf = 136316162;
    v46 = "err == 0 ";
    v47 = 2048;
    v48 = v35;
    v49 = 2080;
    v50 = "";
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v53 = 1024;
    v54 = 1141;
    goto LABEL_78;
  }
  v19 = dictionaryGetBool();
  if (v19)
  {
    v35 = v19;
    if (__osLog)
      v38 = __osLog;
    else
      v38 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_DWORD *)buf = 136316162;
    v46 = "err == 0 ";
    v47 = 2048;
    v48 = v35;
    v49 = 2080;
    v50 = "";
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v53 = 1024;
    v54 = 1144;
    goto LABEL_78;
  }
  v20 = dictionaryGetBool();
  if (v20)
  {
    v35 = v20;
    if (__osLog)
      v38 = __osLog;
    else
      v38 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_DWORD *)buf = 136316162;
    v46 = "err == 0 ";
    v47 = 2048;
    v48 = v35;
    v49 = 2080;
    v50 = "";
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v53 = 1024;
    v54 = 1147;
    goto LABEL_78;
  }
LABEL_10:
  if (HIBYTE(v44))
  {
    if (objc_msgSend(v10, "forUnlock"))
    {
      if (__osLog)
        v37 = __osLog;
      else
        v37 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        goto LABEL_115;
      *(_DWORD *)buf = 136316162;
      v46 = "!operation.forUnlock";
      v47 = 2048;
      v48 = 0;
      v49 = 2080;
      v50 = "";
      v51 = 2080;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v53 = 1024;
      v54 = 1152;
      goto LABEL_114;
    }
    if (objc_msgSend(v10, "forCredentialSet"))
    {
      if (__osLog)
        v37 = __osLog;
      else
        v37 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        goto LABEL_115;
      *(_DWORD *)buf = 136316162;
      v46 = "!operation.forCredentialSet";
      v47 = 2048;
      v48 = 0;
      v49 = 2080;
      v50 = "";
      v51 = 2080;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v53 = 1024;
      v54 = 1153;
      goto LABEL_114;
    }
    if (objc_msgSend(v10, "forPreArm"))
    {
      if (__osLog)
        v37 = __osLog;
      else
        v37 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        goto LABEL_115;
      *(_DWORD *)buf = 136316162;
      v46 = "!operation.forPreArm";
      v47 = 2048;
      v48 = 0;
      v49 = 2080;
      v50 = "";
      v51 = 2080;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v53 = 1024;
      v54 = 1154;
      goto LABEL_114;
    }
    if (objc_msgSend(v10, "stopOnSuccess"))
    {
      if (__osLog)
        v37 = __osLog;
      else
        v37 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        goto LABEL_115;
      *(_DWORD *)buf = 136316162;
      v46 = "!operation.stopOnSuccess";
      v47 = 2048;
      v48 = 0;
      v49 = 2080;
      v50 = "";
      v51 = 2080;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v53 = 1024;
      v54 = 1155;
      goto LABEL_114;
    }
    if (objc_msgSend(v10, "noBioLockout"))
    {
      if (__osLog)
        v37 = __osLog;
      else
        v37 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        goto LABEL_115;
      *(_DWORD *)buf = 136316162;
      v46 = "!operation.noBioLockout";
      v47 = 2048;
      v48 = 0;
      v49 = 2080;
      v50 = "";
      v51 = 2080;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v53 = 1024;
      v54 = 1156;
      goto LABEL_114;
    }
    objc_msgSend(v10, "selectedIdentitiesBlob");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      if (__osLog)
        v37 = __osLog;
      else
        v37 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        goto LABEL_115;
      *(_DWORD *)buf = 136316162;
      v46 = "!operation.selectedIdentitiesBlob";
      v47 = 2048;
      v48 = 0;
      v49 = 2080;
      v50 = "";
      v51 = 2080;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v53 = 1024;
      v54 = 1157;
      goto LABEL_114;
    }
    if (!v11)
    {
      if (__osLog)
        v37 = __osLog;
      else
        v37 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        goto LABEL_115;
      *(_DWORD *)buf = 136316162;
      v46 = "filter";
      v47 = 2048;
      v48 = 0;
      v49 = 2080;
      v50 = "";
      v51 = 2080;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v53 = 1024;
      v54 = 1160;
      goto LABEL_114;
    }
    v22 = (void *)MEMORY[0x24BDBCEB8];
    -[BiometricKitXPCServer identities](self, "identities");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = -[BiometricKitXPCServer filterIdentities:withFilter:](self, "filterIdentities:withFilter:", v24, v11);
    if (v25)
    {
      v35 = v25;
      if (__osLog)
        v39 = __osLog;
      else
        v39 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_133;
      *(_DWORD *)buf = 136316162;
      v46 = "err == 0 ";
      v47 = 2048;
      v48 = v35;
      v49 = 2080;
      v50 = "";
      v51 = 2080;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v53 = 1024;
      v54 = 1163;
    }
    else
    {
      if (objc_msgSend(v24, "count") != 1)
      {
        if (__osLog)
          v40 = __osLog;
        else
          v40 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v46 = "[identities count] == 1";
          v47 = 2048;
          v48 = 0;
          v49 = 2080;
          v50 = "";
          v51 = 2080;
          v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
          v53 = 1024;
          v54 = 1164;
          _os_log_impl(&dword_24B74E000, v40, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v35 = 258;
        goto LABEL_133;
      }
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "userID");
      *(_DWORD *)objc_msgSend(v10, "extendEnrollmentIdentity") = v27;

      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "getUUIDBytes:", objc_msgSend(v10, "extendEnrollmentIdentity") + 4);

      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUserID:", objc_msgSend(v30, "userID"));

      v31 = -[BiometricKitXPCServer parseAuthDict:toAuthData:](self, "parseAuthDict:toAuthData:", v12, objc_msgSend(v10, "extendEnrollmentAuthData"));
      if (!v31)
      {

        goto LABEL_22;
      }
      v35 = v31;
      if (__osLog)
        v39 = __osLog;
      else
        v39 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
LABEL_133:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 136316162;
      v46 = "err == 0 ";
      v47 = 2048;
      v48 = v35;
      v49 = 2080;
      v50 = "";
      v51 = 2080;
      v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v53 = 1024;
      v54 = 1171;
    }
    _os_log_impl(&dword_24B74E000, v39, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_133;
  }
LABEL_22:
  if ((_BYTE)v44 && (objc_msgSend(v10, "forPreArm") & 1) == 0)
  {
    if (__osLog)
      v37 = __osLog;
    else
      v37 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_115;
    *(_DWORD *)buf = 136316162;
    v46 = "operation.forPreArm";
    v47 = 2048;
    v48 = 0;
    v49 = 2080;
    v50 = "";
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v53 = 1024;
    v54 = 1181;
LABEL_114:
    _os_log_impl(&dword_24B74E000, v37, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_115:
    v35 = 258;
    goto LABEL_32;
  }
  objc_msgSend(v10, "setForExtendEnrollment:", HIBYTE(v44));
  objc_msgSend(v10, "setCaptureOnly:", v44);
  objc_msgSend(v10, "setFilterHomeButtonEvents:", HIBYTE(v43));
  objc_msgSend(v10, "setSuppressHapticFeedback:", v43);
  if (HIBYTE(v44))
  {
    objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 2);
    objc_msgSend(v14, "clientInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("BKClientBundleIdentifier"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

    if (v34)
      objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 4);
  }
  if ((_BYTE)v44)
    objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 0x400);
  if (v42)
    objc_msgSend(v10, "setProcessedFlags:", objc_msgSend(v10, "processedFlags") | 0x2000);
  v35 = 0;
LABEL_32:

  return v35;
}

- (int)performMatchCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _DWORD *v8;
  _DWORD *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  char v28;
  int v29;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    if (__osLog)
      v31 = __osLog;
    else
      v31 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    v34 = 136316162;
    v35 = "operation";
    v36 = 2048;
    v37 = 0;
    v38 = 2080;
    v39 = "";
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v42 = 1024;
    v43 = 1220;
    goto LABEL_39;
  }
  v7 = objc_retainAutorelease(v5);
  v8 = (_DWORD *)objc_msgSend(v7, "mutableBytes");
  if (v8)
  {
    v9 = v8;
    *v8 = objc_msgSend(v4, "processedFlags");
    v9[1] = objc_msgSend(v4, "userID");
    if (!objc_msgSend(v4, "forCredentialSet"))
    {
      if (objc_msgSend(v4, "forExtendEnrollment"))
      {
        v15 = objc_msgSend(v4, "extendEnrollmentIdentity");
        v16 = *(_DWORD *)(v15 + 16);
        *(_OWORD *)(v9 + 2) = *(_OWORD *)v15;
        v9[6] = v16;
        v17 = objc_msgSend(v4, "extendEnrollmentAuthData");
        v18 = *(_QWORD *)(v17 + 32);
        v19 = *(_OWORD *)(v17 + 16);
        *(_OWORD *)(v9 + 7) = *(_OWORD *)v17;
        *(_OWORD *)(v9 + 11) = v19;
        *(_QWORD *)(v9 + 15) = v18;
      }
      else if (objc_msgSend(v4, "noBioLockout"))
      {
        v9[2] = objc_msgSend(v4, "noBioLockoutUserID");
        v20 = objc_msgSend(v4, "noBioLockoutAuthData");
        v21 = *(_QWORD *)(v20 + 32);
        v22 = *(_OWORD *)(v20 + 16);
        *(_OWORD *)(v9 + 3) = *(_OWORD *)v20;
        *(_OWORD *)(v9 + 7) = v22;
        *(_QWORD *)(v9 + 11) = v21;
      }
      goto LABEL_10;
    }
    objc_msgSend(v4, "acmContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11 < 0x21)
    {
      objc_msgSend(v4, "acmContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2] = objc_msgSend(v12, "length");

      objc_msgSend(v4, "acmContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "acmContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getBytes:length:", v9 + 3, objc_msgSend(v14, "length"));

LABEL_10:
      objc_msgSend(v4, "selectedIdentitiesBlob");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v4, "selectedIdentitiesBlob");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendData:", v24);

      }
      v25 = objc_retainAutorelease(v7);
      v26 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 4, 0, objc_msgSend(v25, "bytes"), objc_msgSend(v25, "length"), 0, 0);
      if (v26)
      {
        v29 = v26;
        if (__osLog)
          v33 = __osLog;
        else
          v33 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = 136316162;
          v35 = "err == 0 ";
          v36 = 2048;
          v37 = v29;
          v38 = 2080;
          v39 = "";
          v40 = 2080;
          v41 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
          v42 = 1024;
          v43 = 1247;
          _os_log_impl(&dword_24B74E000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v34, 0x30u);
        }
      }
      else
      {
        -[__IOHIDEventSystemClient startBioOperation:](self->_hidClient, "startBioOperation:", v4);
        if (objc_msgSend(v4, "filterHomeButtonEvents"))
        {
          BYTE1(self->_sensorInfo.structSize) = 1;
          objc_msgSend(v4, "client");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "clientAppIsInactive");

          if ((v28 & 1) == 0)
            -[BiometricKitXPCServerMesa disableHomeButton:](self, "disableHomeButton:", 1);
        }
        v29 = 0;
      }
      goto LABEL_17;
    }
    if (__osLog)
      v31 = __osLog;
    else
      v31 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_40:
      v29 = 258;
      goto LABEL_17;
    }
    v34 = 136316162;
    v35 = "operation.acmContext.length <= sizeof(inData->matchInitData.data.acmContext.data)";
    v36 = 2048;
    v37 = 0;
    v38 = 2080;
    v39 = "";
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v42 = 1024;
    v43 = 1229;
LABEL_39:
    _os_log_impl(&dword_24B74E000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v34, 0x30u);
    goto LABEL_40;
  }
  if (__osLog)
    v32 = __osLog;
  else
    v32 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v34 = 136316162;
    v35 = "inData";
    v36 = 2048;
    v37 = 0;
    v38 = 2080;
    v39 = "";
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v42 = 1024;
    v43 = 1223;
    _os_log_impl(&dword_24B74E000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v34, 0x30u);
  }
  v29 = 260;
LABEL_17:

  return v29;
}

- (int)detectPresenceWithOptions:(id)a3 withClient:(id)a4
{
  id v6;
  id v7;
  signed int v8;
  uint64_t v9;
  void *v10;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMutableArray logFingerDetectStartWithOptions:fromClient:](self->_vibrationPatterns, "logFingerDetectStartWithOptions:fromClient:", v6, v7);
  v13.receiver = self;
  v13.super_class = (Class)BiometricKitXPCServerMesa;
  v8 = -[BiometricKitXPCServer detectPresenceWithOptions:withClient:](&v13, sel_detectPresenceWithOptions_withClient_, v6, v7);
  v9 = v8;
  if (v8)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v15 = "err == 0 ";
      v16 = 2048;
      v17 = v9;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v22 = 1024;
      v23 = 1279;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    +[BioLog y](_TtC5BKDM16BioLog, "y");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logFingerDetectStartWithOptions:client:", v6, v7);

  }
  -[NSMutableArray logFingerDetectStartError:](self->_vibrationPatterns, "logFingerDetectStartError:", v9);

  return v9;
}

- (int)performPresenceDetectCommand:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 38, 0, 0, 0, 0, 0);
  v6 = v5;
  if (v5)
  {
    if (__osLog)
      v8 = __osLog;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "err == 0 ";
      v11 = 2048;
      v12 = v6;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v17 = 1024;
      v18 = 1299;
      _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  else
  {
    -[__IOHIDEventSystemClient startBioOperation:](self->_hidClient, "startBioOperation:", v4);
  }

  return v6;
}

- (int)cancelWithClient:(id)a3
{
  id v4;
  signed int v5;
  uint64_t v6;
  void *v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableArray logCancelFromClient:](self->_vibrationPatterns, "logCancelFromClient:", v4);
  v10.receiver = self;
  v10.super_class = (Class)BiometricKitXPCServerMesa;
  v5 = -[BiometricKitXPCServer cancelWithClient:](&v10, sel_cancelWithClient_, v4);
  v6 = v5;
  if (v5)
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "err == 0 ";
      v13 = 2048;
      v14 = v6;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v19 = 1024;
      v20 = 1320;
      _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    +[BioLog y](_TtC5BKDM16BioLog, "y");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logCancelWithClient:", v4);

  }
  -[NSMutableArray logCancelError:](self->_vibrationPatterns, "logCancelError:", v6);

  return v6;
}

- (int)performCancelCommand
{
  int v3;
  uint64_t v4;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[__IOHIDEventSystemClient cancel](self->_hidClient, "cancel");
  v3 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 12, 0, 0, 0, 0, 0);
  v4 = v3;
  if (v3)
  {
    if (__osLog)
      v6 = __osLog;
    else
      v6 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136316162;
      v8 = "err == 0 ";
      v9 = 2048;
      v10 = v4;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v15 = 1024;
      v16 = 1346;
      _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
  BYTE1(self->_sensorInfo.structSize) = 0;
  -[BiometricKitXPCServerMesa disableHomeButton:](self, "disableHomeButton:", 0);
  return v4;
}

- (int)updateIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableArray logUpdateIdentity:withOptions:fromClient:](self->_vibrationPatterns, "logUpdateIdentity:withOptions:fromClient:", v8, v9, v10);
  if (objc_msgSend(v8, "type") == 1)
  {
    v15.receiver = self;
    v15.super_class = (Class)BiometricKitXPCServerMesa;
    v11 = -[BiometricKitXPCServer updateIdentity:withOptions:withClient:](&v15, sel_updateIdentity_withOptions_withClient_, v8, v9, v10);
    if ((_DWORD)v11)
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v17 = "err == 0 ";
        v18 = 2048;
        v19 = (int)v11;
        v20 = 2080;
        v21 = "";
        v22 = 2080;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v24 = 1024;
        v25 = 1378;
        _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "identity.type == kBiometricKitIdentityTypeFinger";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v24 = 1024;
      v25 = 1375;
      _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 258;
  }
  -[NSMutableArray logUpdateIdentity:withError:](self->_vibrationPatterns, "logUpdateIdentity:withError:", v8, v11);

  return v11;
}

- (int)removeIdentity:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  signed int v11;
  uint64_t v12;
  void *v13;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableArray logRemoveIdentity:withOptions:fromClient:withTimestamp:](self->_vibrationPatterns, "logRemoveIdentity:withOptions:fromClient:withTimestamp:", v8, v9, v10, mach_absolute_time());
  v16.receiver = self;
  v16.super_class = (Class)BiometricKitXPCServerMesa;
  v11 = -[BiometricKitXPCServer removeIdentity:withOptions:withClient:](&v16, sel_removeIdentity_withOptions_withClient_, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "err == 0 ";
      v19 = 2048;
      v20 = v12;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 1400;
      _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    +[BioLog y](_TtC5BKDM16BioLog, "y");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logRemoveIdentity:options:client:", v8, v9, v10);

  }
  -[NSMutableArray logRemoveIdentity:withError:](self->_vibrationPatterns, "logRemoveIdentity:withError:", v8, v12);

  return v12;
}

- (int)removeAllIdentitiesForUser:(unsigned int)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  signed int v10;
  uint64_t v11;
  void *v12;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[NSMutableArray logRemoveAllIdentitiesForUser:withOptions:fromClient:](self->_vibrationPatterns, "logRemoveAllIdentitiesForUser:withOptions:fromClient:", v6, v8, v9);
  v15.receiver = self;
  v15.super_class = (Class)BiometricKitXPCServerMesa;
  v10 = -[BiometricKitXPCServer removeAllIdentitiesForUser:withOptions:withClient:](&v15, sel_removeAllIdentitiesForUser_withOptions_withClient_, v6, v8, v9);
  v11 = v10;
  if (v10)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "err == 0 ";
      v18 = 2048;
      v19 = v11;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v24 = 1024;
      v25 = 1422;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    +[BioLog y](_TtC5BKDM16BioLog, "y");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logRemoveAllIdentitiesWithUserID:options:client:", v6, v8, v9);

  }
  return v11;
}

- (id)getIdentityFromUUID:(id)a3 withClient:(id)a4
{
  NSMutableArray *vibrationPatterns;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  vibrationPatterns = self->_vibrationPatterns;
  v7 = a4;
  v8 = a3;
  -[NSMutableArray logGetIdentityFromUUID:fromClient:](vibrationPatterns, "logGetIdentityFromUUID:fromClient:", v8, v7);
  v11.receiver = self;
  v11.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer getIdentityFromUUID:withClient:](&v11, sel_getIdentityFromUUID_withClient_, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)identities:(id)a3 withClient:(id)a4
{
  NSMutableArray *vibrationPatterns;
  id v7;
  id v8;
  void *v9;
  objc_super v11;

  vibrationPatterns = self->_vibrationPatterns;
  v7 = a4;
  v8 = a3;
  -[NSMutableArray logGetIdentities:fromClient:](vibrationPatterns, "logGetIdentities:fromClient:", v8, v7);
  v11.receiver = self;
  v11.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer identities:withClient:](&v11, sel_identities_withClient_, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)getMaxIdentityCount:(int)a3 withClient:(id)a4
{
  uint64_t v4;
  NSMutableArray *vibrationPatterns;
  id v7;
  id v8;
  objc_super v10;

  v4 = *(_QWORD *)&a3;
  vibrationPatterns = self->_vibrationPatterns;
  v7 = a4;
  -[NSMutableArray logGetMaxIdentityCount:fromClient:](vibrationPatterns, "logGetMaxIdentityCount:fromClient:", v4, v7);
  v10.receiver = self;
  v10.super_class = (Class)BiometricKitXPCServerMesa;
  v8 = -[BiometricKitXPCServer getMaxIdentityCount:withClient:](&v10, sel_getMaxIdentityCount_withClient_, v4, v7);

  return (int64_t)v8;
}

- (int64_t)getFreeIdentityCount:(int)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *vibrationPatterns;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v19[2] = *MEMORY[0x24BDAC8D0];
  vibrationPatterns = self->_vibrationPatterns;
  v18[0] = CFSTR("type");
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a5;
  objc_msgSend(v10, "numberWithUnsignedInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("user");
  v19[0] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v14, v11);

  v17.receiver = self;
  v17.super_class = (Class)BiometricKitXPCServerMesa;
  v15 = -[BiometricKitXPCServer getFreeIdentityCount:forUser:withClient:](&v17, sel_getFreeIdentityCount_forUser_withClient_, v6, v5, v11);

  return (int64_t)v15;
}

- (void)disableHomeButton:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 67109120;
    LODWORD(v10) = v3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "disableHomeButton: %d\n", (uint8_t *)&v9, 8u);
  }
  if (self->_hidClientQueue)
  {
    if (v3)
    {
      if (!BYTE3(self->_wakeGestureManager))
        IOHIDEventSystemClientRegisterEventFilterCallback();
    }
    else if (BYTE3(self->_wakeGestureManager))
    {
      IOHIDEventSystemClientUnregisterEventFilterCallback();
    }
    BYTE3(self->_wakeGestureManager) = v3;
  }
  else
  {
    if (__osLog)
      v8 = __osLog;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = "_hidClient";
      v11 = 2048;
      v12 = 0;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v17 = 1024;
      v18 = 1487;
      _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
    }
  }
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEBUG, "disableHomeButton: -> void\n", (uint8_t *)&v9, 2u);
  }
}

- (void)homeButtonPressed
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "homeButtonPressed\n", buf, 2u);
  }
  -[BiometricKitXPCServer allClients](self, "allClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "delegateRegistered")
          && (objc_msgSend(v10, "clientAppIsBackground") & 1) == 0)
        {
          objc_msgSend(v10, "homeButtonPressed");
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v3;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_DEBUG, "homeButtonPressed -> void\n", buf, 2u);
  }

}

- (void)touchIDButtonPressed:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  _BOOL4 v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v24 = v3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "touchIDButtonPressed: %d\n", buf, 8u);
  }
  -[NSMutableArray logHomeButtonState:fromKernel:withTimestamp:](self->_vibrationPatterns, "logHomeButtonState:fromKernel:withTimestamp:", v3, 0, mach_absolute_time());
  +[BioLog y](_TtC5BKDM16BioLog, "y");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logButtonState:", v3);

  if (v3)
  {
    -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v8);
    -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_msgSend(v10, "type");
      if (v11 == 1 || v11 == 2 && objc_msgSend(v10, "filterHomeButtonEvents"))
        -[BiometricKitXPCServerMesa homeButtonPressed](self, "homeButtonPressed");
    }

    objc_sync_exit(v8);
  }
  -[BiometricKitXPCServer allClients](self, "allClients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v16, "delegateRegistered")
          && (objc_msgSend(v16, "clientAppIsBackground") & 1) == 0)
        {
          objc_msgSend(v16, "touchIDButtonPressed:", v3);
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v5;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_DEBUG, "touchIDButtonPressed: -> void\n", buf, 2u);
  }

}

- (int)systemSleepStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = 67109120;
    LODWORD(v12) = v3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "willSleep: %d\n", (uint8_t *)&v11, 8u);
  }
  v7 = -[BiometricKitXPCServerMesa getCommProtocolVersion](self, "getCommProtocolVersion");
  if (v7)
  {
    v8 = v7;
    if (__osLog)
      v9 = __osLog;
    else
      v9 = v5;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136316162;
      v12 = "err == 0 ";
      v13 = 2048;
      v14 = v8;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v19 = 1024;
      v20 = 1581;
      goto LABEL_21;
    }
  }
  else if (LOWORD(self->_connect) < 2u)
  {
    return 0;
  }
  else
  {
    v8 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 87, v3, 0, 0, 0, 0);
    if (v8)
    {
      v9 = (__osLog ? __osLog : v5);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 136316162;
        v12 = "err == 0 ";
        v13 = 2048;
        v14 = v8;
        v15 = 2080;
        v16 = "";
        v17 = 2080;
        v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v19 = 1024;
        v20 = 1591;
LABEL_21:
        _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  return v8;
}

- (int)checkSensorReadiness
{
  int v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  int dailyUpdateTimer_low;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  _BYTE v15[10];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = -[BiometricKitXPCServerMesa getCommProtocolVersion](self, "getCommProtocolVersion");
  v4 = MEMORY[0x24BDACB70];
  if (v3)
  {
    v6 = v3;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v15 = "err == 0 ";
    *(_WORD *)&v15[8] = 2048;
    v16 = v6;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v21 = 1024;
    v22 = 1610;
LABEL_23:
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_7;
  }
  if (LOWORD(self->_connect) < 2u)
  {
    v6 = 0;
    LOBYTE(self->_dailyUpdateTimer) = 1;
    goto LABEL_7;
  }
  v13 = 0;
  v12 = 1;
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 83, 0, 0, 0, &v13, &v12);
  if (v5)
  {
    v6 = v5;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v4;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v15 = "err == 0 ";
    *(_WORD *)&v15[8] = 2048;
    v16 = v6;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v21 = 1024;
    v22 = 1618;
    goto LABEL_23;
  }
  if (v12 == 1)
  {
    v6 = 0;
    LOBYTE(self->_dailyUpdateTimer) = v13 != 0;
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = v4;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v15 = "size == sizeof(outData)";
      *(_WORD *)&v15[8] = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v21 = 1024;
      v22 = 1619;
      _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v6 = 261;
  }
LABEL_7:
  if (__osLog)
    v7 = __osLog;
  else
    v7 = v4;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    dailyUpdateTimer_low = LOBYTE(self->_dailyUpdateTimer);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v15 = v6;
    *(_WORD *)&v15[4] = 1024;
    *(_DWORD *)&v15[6] = dailyUpdateTimer_low;
    _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEFAULT, "checkSensorReadiness -> %d (sensorReady:%u)\n", buf, 0xEu);
  }
  return v6;
}

- (void)reportMesaHardwarePass:(BOOL)a3
{
  int v3;
  NSObject *v4;
  NSObject *v6;
  _QWORD block[4];
  char v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v4 = __osLog;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v10 = v3;
    v11 = 1024;
    v12 = reportMesaHardwarePass__alreadyReported;
    v13 = 1024;
    v14 = reportMesaHardwarePass__lastHardwarePass;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEFAULT, "reportMesaHardwarePass: %u (alreadyReported=%u, lastHardwarePass=%u)\n", buf, 0x14u);
  }
  if (reportMesaHardwarePass__alreadyReported != 1 || reportMesaHardwarePass__lastHardwarePass != v3)
  {
    reportMesaHardwarePass__alreadyReported = 1;
    reportMesaHardwarePass__lastHardwarePass = v3;
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__BiometricKitXPCServerMesa_reportMesaHardwarePass___block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    v8 = v3;
    dispatch_async(v6, block);

  }
}

void __52__BiometricKitXPCServerMesa_reportMesaHardwarePass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  _QWORD v8[4];
  char v9;

  v2 = (void *)os_transaction_create();
  v3 = (void *)MEMORY[0x24BD27898]();
  if (objc_opt_class())
  {
    v4 = objc_alloc_init(MEMORY[0x24BED8D40]);
    v5 = v4;
    v6 = *(_BYTE *)(a1 + 32);
    if (v6)
      v7 = 1;
    else
      v7 = 2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __52__BiometricKitXPCServerMesa_reportMesaHardwarePass___block_invoke_2;
    v8[3] = &__block_descriptor_33_e20_v20__0B8__NSError_12l;
    v9 = v6;
    objc_msgSend(v4, "postComponentStatusEventFor:status:withReply:", 12, v7, v8);

  }
  else if (!*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BE0CF28], "displayTouchIDIssueNotification");
  }
  objc_autoreleasePoolPop(v3);

}

void __52__BiometricKitXPCServerMesa_reportMesaHardwarePass___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (__osLog)
      v6 = __osLog;
    else
      v6 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136316162;
      v8 = "success";
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v15 = 1024;
      v16 = 1659;
      _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
    if (!*(_BYTE *)(a1 + 32))
      objc_msgSend(MEMORY[0x24BE0CF28], "displayTouchIDIssueNotification");
  }

}

- (int)initSensor
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  _BYTE v14[24];
  const char *v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEFAULT, "initSensor\n", v14, 2u);
  }
  v5 = -[BiometricKitXPCServerMesa cachePatch](self, "cachePatch");
  if (v5)
  {
    v9 = v5;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_DWORD *)v14 = 136316162;
    *(_QWORD *)&v14[4] = "err == 0 ";
    *(_WORD *)&v14[12] = 2048;
    *(_QWORD *)&v14[14] = v9;
    *(_WORD *)&v14[22] = 2080;
    v15 = "";
    LOWORD(v16) = 2080;
    *(_QWORD *)((char *)&v16 + 2) = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickit"
                                    "d/BiometricKitXPCServerMesa.m";
    WORD5(v16) = 1024;
    HIDWORD(v16) = 1690;
LABEL_16:
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v14, 0x30u);
    goto LABEL_20;
  }
  v6 = -[BiometricKitXPCServerMesa loadMSRkData](self, "loadMSRkData");
  if (v6)
  {
    v9 = v6;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_DWORD *)v14 = 136316162;
    *(_QWORD *)&v14[4] = "err == 0 ";
    *(_WORD *)&v14[12] = 2048;
    *(_QWORD *)&v14[14] = v9;
    *(_WORD *)&v14[22] = 2080;
    v15 = "";
    LOWORD(v16) = 2080;
    *(_QWORD *)((char *)&v16 + 2) = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickit"
                                    "d/BiometricKitXPCServerMesa.m";
    WORD5(v16) = 1024;
    HIDWORD(v16) = 1694;
    goto LABEL_16;
  }
  v7 = 3;
  while (1)
  {
    v8 = -[BiometricKitXPCServerMesa resetSensor](self, "resetSensor");
    if (!v8)
      break;
    v9 = v8;
    if (!--v7)
    {
      if (__osLog)
        v10 = __osLog;
      else
        v10 = v3;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v14 = 136316162;
        *(_QWORD *)&v14[4] = "err == 0 ";
        *(_WORD *)&v14[12] = 2048;
        *(_QWORD *)&v14[14] = v9;
        *(_WORD *)&v14[22] = 2080;
        v15 = "";
        LOWORD(v16) = 2080;
        *(_QWORD *)((char *)&v16 + 2) = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometri"
                                        "ckitd/BiometricKitXPCServerMesa.m";
        WORD5(v16) = 1024;
        HIDWORD(v16) = 1705;
        goto LABEL_16;
      }
      goto LABEL_20;
    }
  }
  v11 = -[BiometricKitXPCServerMesa cacheSensorInfo](self, "cacheSensorInfo");
  if (v11)
  {
    v9 = v11;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v14 = 136316162;
      *(_QWORD *)&v14[4] = "err == 0 ";
      *(_WORD *)&v14[12] = 2048;
      *(_QWORD *)&v14[14] = v9;
      *(_WORD *)&v14[22] = 2080;
      v15 = "";
      LOWORD(v16) = 2080;
      *(_QWORD *)((char *)&v16 + 2) = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrick"
                                      "itd/BiometricKitXPCServerMesa.m";
      WORD5(v16) = 1024;
      HIDWORD(v16) = 1709;
      goto LABEL_16;
    }
  }
  else
  {
    v9 = -[BiometricKitXPCServerMesa loadCalibrationData](self, "loadCalibrationData");
    if (!v9)
    {
      -[__IOHIDEventSystemClient initSensor](self->_hidClient, "initSensor");
      goto LABEL_20;
    }
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v14 = 136316162;
      *(_QWORD *)&v14[4] = "err == 0 ";
      *(_WORD *)&v14[12] = 2048;
      *(_QWORD *)&v14[14] = v9;
      *(_WORD *)&v14[22] = 2080;
      v15 = "";
      LOWORD(v16) = 2080;
      *(_QWORD *)((char *)&v16 + 2) = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrick"
                                      "itd/BiometricKitXPCServerMesa.m";
      WORD5(v16) = 1024;
      HIDWORD(v16) = 1741;
      goto LABEL_16;
    }
  }
LABEL_20:
  -[BiometricKitXPCServerMesa reportMesaHardwarePass:](self, "reportMesaHardwarePass:", v9 == 0, *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16);
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = v3;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v14 = 67109120;
    *(_DWORD *)&v14[4] = v9;
    _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_DEFAULT, "initSensor -> %d\n", v14, 8u);
  }
  return v9;
}

- (int)resetSensor
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "resetSensor\n", (uint8_t *)&v12, 2u);
  }
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 2, 2, 0, 0, 0, 0);
  if (v5)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "err == 0 ";
      v14 = 2048;
      v15 = v5;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v20 = 1024;
      v21 = 1766;
      _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    if (__osLogTrace)
      v11 = __osLogTrace;
    else
      v11 = v3;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 67109120;
      LODWORD(v13) = v5;
      v7 = v11;
      v8 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace)
      v6 = __osLogTrace;
    else
      v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 67109120;
      LODWORD(v13) = 0;
      v7 = v6;
      v8 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_24B74E000, v7, v8, "resetSensor -> %{errno}d\n", (uint8_t *)&v12, 8u);
    }
  }
  return v5;
}

- (int)cachePatch
{
  uint64_t v3;
  NSObject *v4;
  const __CFURL *v5;
  const __CFURL *v6;
  const __CFString *v7;
  const __CFString *v8;
  FILE *v9;
  FILE *v10;
  int v11;
  int v12;
  size_t st_size;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  stat v29;
  uint8_t v30[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  uint8_t buf[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "cachePatch\n", buf, 2u);
  }
  memset(&v29, 0, sizeof(v29));
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  *(_OWORD *)buf = 0u;
  v41 = 0u;
  v5 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (!v5)
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = v3;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v30 = 136316162;
      v31 = "dir";
      v32 = 2048;
      v33 = 0;
      v34 = 2080;
      v35 = "";
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v38 = 1024;
      v39 = 1797;
      _os_log_impl(&dword_24B74E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
    }
    goto LABEL_44;
  }
  v6 = v5;
  v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
  if (!v7)
  {
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v3;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v30 = 136316162;
      v31 = "str";
      v32 = 2048;
      v33 = 0;
      v34 = 2080;
      v35 = "";
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v38 = 1024;
      v39 = 1800;
      _os_log_impl(&dword_24B74E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
    }
    CFRelease(v6);
LABEL_44:
    v16 = 2;
LABEL_21:
    if (__osLogTrace)
      v17 = __osLogTrace;
    else
      v17 = v3;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v30 = 67109120;
      LODWORD(v31) = v16;
      _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "cachePatch -> %{errno}d\n", v30, 8u);
    }
    return v16;
  }
  v8 = v7;
  if (!CFStringGetCString(v7, (char *)buf, 256, 0x8000100u))
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v3;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v30 = 136316162;
      v31 = "ok";
      v32 = 2048;
      v33 = 0;
      v34 = 2080;
      v35 = "";
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v38 = 1024;
      v39 = 1803;
      _os_log_impl(&dword_24B74E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
    }
    v15 = 0;
    v10 = 0;
    goto LABEL_81;
  }
  snprintf((char *)buf, 0x100uLL, "%s/%s", (const char *)buf, "MesaCustomPatch.binary");
  if (access((const char *)buf, 4) == -1)
  {
    v15 = 0;
    v10 = 0;
    v16 = 0;
    goto LABEL_16;
  }
  v9 = fopen((const char *)buf, "rb");
  if (v9)
  {
    v10 = v9;
    v11 = fileno(v9);
    v12 = fstat(v11, &v29);
    if (v12)
    {
      v16 = v12;
      if (__osLog)
        v24 = __osLog;
      else
        v24 = v3;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v30 = 136316162;
        v31 = "err == 0 ";
        v32 = 2048;
        v33 = v16;
        v34 = 2080;
        v35 = "";
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v38 = 1024;
        v39 = 1814;
        _os_log_impl(&dword_24B74E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
      }
      v15 = 0;
    }
    else
    {
      st_size = v29.st_size;
      if (v29.st_size)
      {
        v14 = malloc_type_malloc(v29.st_size, 0x42E1D64AuLL);
        if (v14)
        {
          v15 = v14;
          if (fread(v14, 1uLL, st_size, v10) == st_size)
          {
            v16 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 36, 0, v15, st_size, 0, 0);
            if (v16)
            {
              v28 = (__osLog ? __osLog : v3);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v30 = 136316162;
                v31 = "err == 0 ";
                v32 = 2048;
                v33 = v16;
                v34 = 2080;
                v35 = "";
                v36 = 2080;
                v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
                v38 = 1024;
                v39 = 1826;
                _os_log_impl(&dword_24B74E000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
              }
            }
            goto LABEL_16;
          }
          if (__osLog)
            v27 = __osLog;
          else
            v27 = v3;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v30 = 136316162;
            v31 = "read == size";
            v32 = 2048;
            v33 = 0;
            v34 = 2080;
            v35 = "";
            v36 = 2080;
            v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
            v38 = 1024;
            v39 = 1823;
            _os_log_impl(&dword_24B74E000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
          }
LABEL_81:
          v16 = 5;
          goto LABEL_16;
        }
        if (__osLog)
          v26 = __osLog;
        else
          v26 = v3;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v30 = 136316162;
          v31 = "data";
          v32 = 2048;
          v33 = 0;
          v34 = 2080;
          v35 = "";
          v36 = 2080;
          v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
          v38 = 1024;
          v39 = 1820;
          _os_log_impl(&dword_24B74E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
        }
        v15 = 0;
        v16 = 12;
      }
      else
      {
        if (__osLog)
          v25 = __osLog;
        else
          v25 = v3;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v30 = 136316162;
          v31 = "size > 0";
          v32 = 2048;
          v33 = 0;
          v34 = 2080;
          v35 = "";
          v36 = 2080;
          v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
          v38 = 1024;
          v39 = 1817;
          _os_log_impl(&dword_24B74E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
        }
        v15 = 0;
        v16 = 33;
      }
    }
  }
  else
  {
    if (__osLog)
      v23 = __osLog;
    else
      v23 = v3;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v30 = 136316162;
      v31 = "file";
      v32 = 2048;
      v33 = 0;
      v34 = 2080;
      v35 = "";
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v38 = 1024;
      v39 = 1811;
      _os_log_impl(&dword_24B74E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v30, 0x30u);
    }
    v15 = 0;
    v10 = 0;
    v16 = *__error();
  }
LABEL_16:
  CFRelease(v6);
  CFRelease(v8);
  if (v15)
    free(v15);
  if (v10)
    fclose(v10);
  if (v16)
    goto LABEL_21;
  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v3;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v30 = 67109120;
    LODWORD(v31) = 0;
    _os_log_impl(&dword_24B74E000, v18, OS_LOG_TYPE_DEBUG, "cachePatch -> %{errno}d\n", v30, 8u);
  }
  return 0;
}

- (int)diagnostics:(int)a3 withOptions:(id)a4 passed:(BOOL *)a5 withDetails:(id *)a6 withClient:(id)a7
{
  uint64_t v10;
  __CFString *v12;
  id v13;
  NSObject *v14;
  id *v15;
  NSMutableArray *vibrationPatterns;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  id *v24;
  NSObject *v25;
  __objc2_class *v26;
  int v27;
  void *v28;
  uint64_t v29;
  BOOL *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *superclass;
  _BOOL4 v41;
  id v42;
  _BOOL4 v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  NSObject *v48;
  void *v49;
  BOOL *v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[2];
  _QWORD v59[2];
  const __CFString *v60;
  void *v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t buf[56];
  uint64_t v65;

  v10 = *(_QWORD *)&a3;
  v65 = *MEMORY[0x24BDAC8D0];
  v12 = (__CFString *)a4;
  v13 = a7;
  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v10;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v12;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = a5;
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = a6;
    *(_WORD *)&buf[38] = 2112;
    *(_QWORD *)&buf[40] = v13;
    _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_DEBUG, "diagnostics:withOptions:passed:withDetails:withClient: %d %@ %p %p %@\n", buf, 0x30u);
  }
  v50 = a5;
  v15 = a6;
  v54 = 0;
  v55 = 0;
  v52 = 0;
  v53 = 0;
  vibrationPatterns = self->_vibrationPatterns;
  v62[0] = CFSTR("test");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v62[1] = CFSTR("options");
  v19 = CFSTR("<nil>");
  if (v12)
    v19 = v12;
  v63[0] = v17;
  v63[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v20, v13);

  switch((int)v10)
  {
    case 1:
      v21 = 0;
      v22 = 0;
      v23 = HIDWORD(self->super._reporter) != 0;
      v24 = a6;
      goto LABEL_29;
    case 2:
      v27 = 1;
      goto LABEL_18;
    case 3:
      v27 = 2;
      goto LABEL_18;
    case 4:
      v27 = 3;
LABEL_18:
      LODWORD(v55) = v27;
      goto LABEL_20;
    case 5:
      LODWORD(v55) = 4;
      -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("kEsdMonitorTimeout"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v55) = objc_msgSend(v28, "unsignedIntValue");

LABEL_20:
      v24 = a6;
      v52 = 16;
      v29 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 41, 0, &v55, 8, &v53, &v52);
      if ((_DWORD)v29)
      {
        v22 = v29;
        if (__osLog)
          v48 = __osLog;
        else
          v48 = MEMORY[0x24BDACB70];
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          goto LABEL_70;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "err == 0 ";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = (int)v22;
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = "";
        *(_WORD *)&buf[32] = 2080;
        *(_QWORD *)&buf[34] = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biom"
                              "etricKitXPCServerMesa.m";
        *(_WORD *)&buf[42] = 1024;
        *(_DWORD *)&buf[44] = 1897;
        goto LABEL_69;
      }
      if (v52 != 16)
      {
        v22 = 3758097084;
        if (__osLog)
          v48 = __osLog;
        else
          v48 = MEMORY[0x24BDACB70];
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          goto LABEL_70;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "size == sizeof(outData)";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 0;
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = "";
        *(_WORD *)&buf[32] = 2080;
        *(_QWORD *)&buf[34] = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biom"
                              "etricKitXPCServerMesa.m";
        *(_WORD *)&buf[42] = 1024;
        *(_DWORD *)&buf[44] = 1898;
LABEL_69:
        _os_log_impl(&dword_24B74E000, v48, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_70:
        v21 = 0;
        v23 = 0;
        goto LABEL_29;
      }
      v23 = (_DWORD)v53 != 0;
      if ((_DWORD)v10 == 5)
      {
        v56[0] = CFSTR("kStartedOperations");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIDWORD(v53));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v49;
        v56[1] = CFSTR("kEsdOccurrence");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v54);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v57[1] = v32;
        v56[2] = CFSTR("kSystemUpTime");
        v33 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "systemUptime");
        objc_msgSend(v33, "numberWithDouble:");
        v35 = v13;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v57[2] = v36;
        v56[3] = CFSTR("kEsdMonitoredOccurrence");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIDWORD(v54));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v57[3] = v37;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v35;
        v24 = v15;

LABEL_28:
        v22 = 0;
LABEL_29:
        v30 = v50;
        goto LABEL_32;
      }
      if ((_DWORD)v10 == 4)
      {
        v58[0] = CFSTR("kProvisioningState");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIDWORD(v53));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v58[1] = CFSTR("kDevGidDisabled");
        v59[0] = v38;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v54);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v39;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
      }
      v30 = v50;
      if ((_DWORD)v10 == 3)
      {
        v60 = CFSTR("kCalDataState");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIDWORD(v53));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = 0;
      }
      v22 = 0;
LABEL_32:
      v26 = MesaCoreAnalyticsWeeklyEvent;
      if (v30)
LABEL_33:
        *v30 = v23;
LABEL_34:
      if (v24)
        *v24 = objc_retainAutorelease(v21);
      -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v22);
      if (v26[15].superclass)
        superclass = v26[15].superclass;
      else
        superclass = MEMORY[0x24BDACB70];
      if (!(_DWORD)v22)
      {
        if (!os_log_type_enabled(superclass, OS_LOG_TYPE_DEBUG))
          goto LABEL_58;
        if (v30)
        {
          v43 = *v30;
          if (v24)
          {
LABEL_47:
            v44 = *v24;
LABEL_56:
            *(_QWORD *)buf = 67109634;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v43;
            *(_WORD *)&buf[14] = 2112;
            *(_QWORD *)&buf[16] = v44;
            v45 = superclass;
            v46 = OS_LOG_TYPE_DEBUG;
            goto LABEL_57;
          }
        }
        else
        {
          v43 = 0;
          if (v24)
            goto LABEL_47;
        }
        v44 = 0;
        goto LABEL_56;
      }
      if (os_log_type_enabled(superclass, OS_LOG_TYPE_ERROR))
      {
        if (v30)
        {
          v41 = *v30;
          if (v24)
          {
LABEL_43:
            v42 = *v24;
LABEL_50:
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&buf[4] = v22;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v41;
            *(_WORD *)&buf[14] = 2112;
            *(_QWORD *)&buf[16] = v42;
            v45 = superclass;
            v46 = OS_LOG_TYPE_ERROR;
LABEL_57:
            _os_log_impl(&dword_24B74E000, v45, v46, "diagnostics:withOptions:passed:withDetails:withClient: -> %{errno}d %d %@\n", buf, 0x18u);
            goto LABEL_58;
          }
        }
        else
        {
          v41 = 0;
          if (v24)
            goto LABEL_43;
        }
        v42 = 0;
        goto LABEL_50;
      }
LABEL_58:

      return v22;
    default:
      if (__osLog)
        v25 = __osLog;
      else
        v25 = MEMORY[0x24BDACB70];
      v26 = MesaCoreAnalyticsWeeklyEvent;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "err == 0 ";
        *(_WORD *)&buf[12] = 2048;
        v22 = 45;
        *(_QWORD *)&buf[14] = 45;
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = "";
        *(_WORD *)&buf[32] = 2080;
        *(_QWORD *)&buf[34] = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biom"
                              "etricKitXPCServerMesa.m";
        *(_WORD *)&buf[42] = 1024;
        *(_DWORD *)&buf[44] = 1892;
        _os_log_impl(&dword_24B74E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        v21 = 0;
        v23 = 0;
      }
      else
      {
        v21 = 0;
        v23 = 0;
        v22 = 45;
      }
      v24 = v15;
      v30 = v50;
      if (!v50)
        goto LABEL_34;
      goto LABEL_33;
  }
}

- (void)timestampEvent:(unint64_t)a3 absoluteTime:(unint64_t)a4
{
  -[__IOHIDEventSystemClient timestampEvent:absoluteTime:](self->_hidClient, "timestampEvent:absoluteTime:", a3, a4);
}

- (id)getIdentitiesDatabaseUUIDForUser:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4;
  NSMutableArray *vibrationPatterns;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  const __CFString *v15;
  _QWORD v16[2];

  v4 = *(_QWORD *)&a3;
  v16[1] = *MEMORY[0x24BDAC8D0];
  vibrationPatterns = self->_vibrationPatterns;
  v15 = CFSTR("user");
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a4;
  objc_msgSend(v8, "numberWithUnsignedInt:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v11, v9);

  v14.receiver = self;
  v14.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer getIdentitiesDatabaseUUIDForUser:withClient:](&v14, sel_getIdentitiesDatabaseUUIDForUser_withClient_, v4, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)getIdentitiesDatabaseHashForUser:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4;
  NSMutableArray *vibrationPatterns;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  const __CFString *v15;
  _QWORD v16[2];

  v4 = *(_QWORD *)&a3;
  v16[1] = *MEMORY[0x24BDAC8D0];
  vibrationPatterns = self->_vibrationPatterns;
  v15 = CFSTR("user");
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a4;
  objc_msgSend(v8, "numberWithUnsignedInt:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v11, v9);

  v14.receiver = self;
  v14.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer getIdentitiesDatabaseHashForUser:withClient:](&v14, sel_getIdentitiesDatabaseHashForUser_withClient_, v4, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int)dropUnlockTokenWithClient:(id)a3
{
  NSMutableArray *vibrationPatterns;
  id v6;
  int v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  vibrationPatterns = self->_vibrationPatterns;
  v6 = a3;
  -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, 0, v6);
  v10.receiver = self;
  v10.super_class = (Class)BiometricKitXPCServerMesa;
  v7 = -[BiometricKitXPCServer dropUnlockTokenWithClient:](&v10, sel_dropUnlockTokenWithClient_, v6);

  if (v7)
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "err == 0 ";
      v13 = 2048;
      v14 = v7;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v19 = 1024;
      v20 = 1974;
      _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v7);
  return v7;
}

- (int)forceBioLockoutForUser:(unsigned int)a3 withOptions:(id)a4 withClient:(id)a5
{
  uint64_t v6;
  NSMutableArray *vibrationPatterns;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v6 = *(_QWORD *)&a3;
  v31[2] = *MEMORY[0x24BDAC8D0];
  vibrationPatterns = self->_vibrationPatterns;
  v30[0] = CFSTR("userID");
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "numberWithUnsignedInt:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = CFSTR("options");
  v31[0] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12 != 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v15, v11);

  v19.receiver = self;
  v19.super_class = (Class)BiometricKitXPCServerMesa;
  v16 = -[BiometricKitXPCServer forceBioLockoutForUser:withOptions:withClient:](&v19, sel_forceBioLockoutForUser_withOptions_withClient_, v6, v12, v11);

  if (v16)
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "err == 0 ";
      v22 = 2048;
      v23 = v16;
      v24 = 2080;
      v25 = "";
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v28 = 1024;
      v29 = 1995;
      _os_log_impl(&dword_24B74E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v16);
  return v16;
}

- (int)enrollContinue
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "enrollContinue\n", (uint8_t *)&v12, 2u);
  }
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 14, 0, 0, 0, 0, 0);
  if (v5)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "err == 0 ";
      v14 = 2048;
      v15 = v5;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v20 = 1024;
      v21 = 2016;
      _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    if (__osLogTrace)
      v11 = __osLogTrace;
    else
      v11 = v3;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 67109120;
      LODWORD(v13) = v5;
      v7 = v11;
      v8 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace)
      v6 = __osLogTrace;
    else
      v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 67109120;
      LODWORD(v13) = 0;
      v7 = v6;
      v8 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_24B74E000, v7, v8, "enrollContinue -> %{errno}d\n", (uint8_t *)&v12, 8u);
    }
  }
  return v5;
}

- (id)pullAlignmentData
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  char *v6;
  NSObject *v7;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t v14[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint8_t buf[3064];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "pullAlignmentData\n", buf, 2u);
  }
  bzero(buf, 0xBF4uLL);
  v13 = 3060;
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 8, 0, 0, 0, buf, &v13);
  if (v5)
  {
    v9 = v5;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)v14 = 136316162;
    v15 = "err == 0 ";
    v16 = 2048;
    v17 = v9;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v22 = 1024;
    v23 = 2038;
    goto LABEL_27;
  }
  if (v13 == 3060)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 3060);
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[__IOHIDEventSystemClient enrollProgress:](self->_hidClient, "enrollProgress:", v6);
    }
    else
    {
      if (__osLog)
        v12 = __osLog;
      else
        v12 = v3;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v14 = 136316162;
        v15 = "alignmentData";
        v16 = 2048;
        v17 = 0;
        v18 = 2080;
        v19 = "";
        v20 = 2080;
        v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v22 = 1024;
        v23 = 2043;
        _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v14, 0x30u);
      }
    }
    if (__osLogTrace)
      v7 = __osLogTrace;
    else
      v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v14 = 138412546;
      v15 = v6;
      v16 = 1024;
      LODWORD(v17) = 0;
      _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEBUG, "pullAlignmentData -> %@ (%{errno}d)\n", v14, 0x12u);
    }
    return v6;
  }
  v9 = -536870212;
  if (__osLog)
    v10 = __osLog;
  else
    v10 = v3;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v14 = 136316162;
    v15 = "size == sizeof(outData)";
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v22 = 1024;
    v23 = 2039;
LABEL_27:
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v14, 0x30u);
  }
LABEL_28:
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v3;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v14 = 138412546;
    v15 = 0;
    v16 = 1024;
    LODWORD(v17) = v9;
    _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "pullAlignmentData -> %@ (%{errno}d)\n", v14, 0x12u);
  }
  return 0;
}

- (id)getNodeTopologyForIdentity:(id)a3 withClient:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSMutableArray *vibrationPatterns;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint8_t v27[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  const __CFString *v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  _QWORD v45[2];
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v40 = v7;
    v41 = 2112;
    v42 = v7;
    v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "getNodeTopologyForIdentity:withClient: %p(%@) %@\n", buf, 0x20u);
  }
  v45[0] = 0;
  v45[1] = 0;
  v46 = 0;
  bzero(buf, 0xBF4uLL);
  v26 = 3060;
  if (v8)
  {
    vibrationPatterns = self->_vibrationPatterns;
    v37 = CFSTR("identity");
    v38 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v12, v8);

  }
  if (v7)
  {
    -[BiometricKitXPCServer validateAllUsers](self, "validateAllUsers");
    LODWORD(v45[0]) = objc_msgSend(v7, "userID");
    objc_msgSend(v7, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getUUIDBytes:", (char *)v45 + 4);

    v14 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", objc_msgSend(v7, "userID"));
    if ((_DWORD)v14)
    {
      v18 = v14;
      if (__osLog)
        v24 = __osLog;
      else
        v24 = v9;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      *(_DWORD *)v27 = 136316162;
      v28 = "err == 0 ";
      v29 = 2048;
      v30 = (int)v18;
      v31 = 2080;
      v32 = "";
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v35 = 1024;
      v36 = 2078;
    }
    else
    {
      v15 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 17, 0, v45, 20, buf, &v26);
      if ((_DWORD)v15)
      {
        v18 = v15;
        if (__osLog)
          v24 = __osLog;
        else
          v24 = v9;
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          goto LABEL_54;
        *(_DWORD *)v27 = 136316162;
        v28 = "err == 0 ";
        v29 = 2048;
        v30 = (int)v18;
        v31 = 2080;
        v32 = "";
        v33 = 2080;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v35 = 1024;
        v36 = 2081;
      }
      else
      {
        if (v26 == 3060)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 3060);
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (char *)v16;
            v18 = 0;
            goto LABEL_14;
          }
          if (__osLog)
            v25 = __osLog;
          else
            v25 = v9;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v27 = 136316162;
            v28 = "result";
            v29 = 2048;
            v30 = 0;
            v31 = 2080;
            v32 = "";
            v33 = 2080;
            v34 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
            v35 = 1024;
            v36 = 2085;
            _os_log_impl(&dword_24B74E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
          }
          v18 = 0;
          goto LABEL_54;
        }
        v18 = 3758097084;
        if (__osLog)
          v24 = __osLog;
        else
          v24 = v9;
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
LABEL_54:
          v17 = 0;
          goto LABEL_14;
        }
        *(_DWORD *)v27 = 136316162;
        v28 = "size == sizeof(outData)";
        v29 = 2048;
        v30 = 0;
        v31 = 2080;
        v32 = "";
        v33 = 2080;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v35 = 1024;
        v36 = 2082;
      }
    }
    _os_log_impl(&dword_24B74E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
    goto LABEL_54;
  }
  if (__osLog)
    v23 = __osLog;
  else
    v23 = v9;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v27 = 136316162;
    v28 = "identity";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = "";
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v35 = 1024;
    v36 = 2068;
    _os_log_impl(&dword_24B74E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
  }
  v17 = 0;
  v18 = 22;
LABEL_14:
  if (v8)
    -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v18);
  if (__osLogTrace)
    v19 = __osLogTrace;
  else
    v19 = v9;
  if ((_DWORD)v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v27 = 138412546;
      v28 = v17;
      v29 = 1024;
      LODWORD(v30) = v18;
      v20 = v19;
      v21 = OS_LOG_TYPE_ERROR;
LABEL_24:
      _os_log_impl(&dword_24B74E000, v20, v21, "getNodeTopologyForIdentity:withClient: -> %@ (%{errno}d)\n", v27, 0x12u);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 138412546;
    v28 = v17;
    v29 = 1024;
    LODWORD(v30) = 0;
    v20 = v19;
    v21 = OS_LOG_TYPE_DEBUG;
    goto LABEL_24;
  }

  return v17;
}

- (id)getProtectedConfigurationForUser:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4;
  id v7;
  NSMutableArray *vibrationPatterns;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  const __CFString *v14;
  _QWORD v15[2];

  v4 = *(_QWORD *)&a3;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (v7)
  {
    vibrationPatterns = self->_vibrationPatterns;
    v14 = CFSTR("user");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v10, v7);

  }
  v13.receiver = self;
  v13.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer getProtectedConfigurationForUser:withClient:](&v13, sel_getProtectedConfigurationForUser_withClient_, v4, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)getSystemProtectedConfigurationWithClient:(id)a3
{
  NSMutableArray *vibrationPatterns;
  id v6;
  void *v7;
  objc_super v9;

  vibrationPatterns = self->_vibrationPatterns;
  v6 = a3;
  -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, 0, v6);
  v9.receiver = self;
  v9.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer getSystemProtectedConfigurationWithClient:](&v9, sel_getSystemProtectedConfigurationWithClient_, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 withOptions:(id)a5 withClient:(id)a6
{
  uint64_t v7;
  NSMutableArray *vibrationPatterns;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v7 = *(_QWORD *)&a4;
  v28 = *MEMORY[0x24BDAC8D0];
  vibrationPatterns = self->_vibrationPatterns;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[NSMutableArray logProtectedConfiguration:forUser:fromClient:](vibrationPatterns, "logProtectedConfiguration:forUser:fromClient:", v13, v7, v11);
  v17.receiver = self;
  v17.super_class = (Class)BiometricKitXPCServerMesa;
  LODWORD(v7) = -[BiometricKitXPCServer setProtectedConfiguration:forUser:withOptions:withClient:](&v17, sel_setProtectedConfiguration_forUser_withOptions_withClient_, v13, v7, v12, v11);

  v14 = (int)v7;
  if ((_DWORD)v7)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "err == 0 ";
      v20 = 2048;
      v21 = v14;
      v22 = 2080;
      v23 = "";
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v26 = 1024;
      v27 = 2128;
      _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  -[NSMutableArray logProtectedConfigurationError:](self->_vibrationPatterns, "logProtectedConfigurationError:", v14);
  return v14;
}

- (int)setSystemProtectedConfiguration:(id)a3 withOptions:(id)a4 withClient:(id)a5
{
  NSMutableArray *vibrationPatterns;
  id v9;
  id v10;
  id v11;
  int v12;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  vibrationPatterns = self->_vibrationPatterns;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[NSMutableArray logProtectedConfiguration:forUser:fromClient:](vibrationPatterns, "logProtectedConfiguration:forUser:fromClient:", v11, 0xFFFFFFFFLL, v9);
  v15.receiver = self;
  v15.super_class = (Class)BiometricKitXPCServerMesa;
  v12 = -[BiometricKitXPCServer setSystemProtectedConfiguration:withOptions:withClient:](&v15, sel_setSystemProtectedConfiguration_withOptions_withClient_, v11, v10, v9);

  if (v12)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "err == 0 ";
      v18 = 2048;
      v19 = v12;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v24 = 1024;
      v25 = 2149;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  -[NSMutableArray logProtectedConfigurationError:](self->_vibrationPatterns, "logProtectedConfigurationError:", v12);
  return v12;
}

- (BOOL)getEnabledForUnlock
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint8_t buf[4];
  _BYTE v17[10];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "getEnabledForUnlock\n", buf, 2u);
  }
  v15 = 0;
  v14 = 1;
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 48, 0, 0, 0, &v15, &v14);
  if (v5)
  {
    v10 = v5;
    if (__osLog)
      v11 = __osLog;
    else
      v11 = v3;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v17 = "err == 0 ";
      *(_WORD *)&v17[8] = 2048;
      v18 = v10;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 2172;
      _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace)
      v12 = __osLogTrace;
    else
      v12 = v3;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v17 = v15;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = v10;
      v7 = v12;
      v8 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
  }
  else
  {
    if (v14 != 1)
    {
      if (__osLog)
        v13 = __osLog;
      else
        v13 = v3;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v17 = "size == sizeof(outData)";
        *(_WORD *)&v17[8] = 2048;
        v18 = 0;
        v19 = 2080;
        v20 = "";
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v23 = 1024;
        v24 = 2173;
        _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v15 = 0;
    }
    if (__osLogTrace)
      v6 = __osLogTrace;
    else
      v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v17 = v15;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = 0;
      v7 = v6;
      v8 = OS_LOG_TYPE_DEBUG;
LABEL_13:
      _os_log_impl(&dword_24B74E000, v7, v8, "getEnabledForUnlock -> %d (%{errno}d)\n", buf, 0xEu);
    }
  }
  return v15 != 0;
}

- (int)setAppleMesaSEPLoggingLevel
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "setAppleMesaSEPLoggingLevel\n", (uint8_t *)&v13, 2u);
  }
  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberForKey:", CFSTR("AppleMesaSEPLoggingLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (v7 = -[BiometricKitXPCServerMesa setIORegistryProperty:toValue:onService:](self, "setIORegistryProperty:toValue:onService:", CFSTR("LoggingLevel"), v6, CFSTR("AppleMesaSEPDriver"))) != 0)
  {
    v9 = v7;
    if (__osLog)
      v11 = __osLog;
    else
      v11 = v3;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136316162;
      v14 = "err == 0 ";
      v15 = 2048;
      v16 = v9;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v21 = 1024;
      v22 = 2196;
      _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
    if (__osLogTrace)
      v12 = __osLogTrace;
    else
      v12 = v3;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 67109120;
      LODWORD(v14) = v9;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "setAppleMesaSEPLoggingLevel -> %{errno}d\n", (uint8_t *)&v13, 8u);
    }
  }
  else
  {
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v13 = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "setAppleMesaSEPLoggingLevel -> %{errno}d\n", (uint8_t *)&v13, 8u);
    }
    v9 = 0;
  }

  return v9;
}

- (void)vibrate:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = (const char *)a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "vibrate: %ld\n", (uint8_t *)&v12, 0xCu);
  }
  if (objc_msgSend(*(id *)&self->_lastSBLockMsg, "count") < (unint64_t)a3)
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "[_vibrationPatterns count] >= numberOfVibrations";
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v20 = 1024;
      v21 = 2239;
      _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberForKey:", CFSTR("enableMatchVibe2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && objc_msgSend(v8, "BOOLValue"))
    {
      objc_msgSend(*(id *)&self->_lastSBLockMsg, "objectAtIndexedSubscript:", a3 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        AudioServicesPlaySystemSoundWithVibration();

    }
  }
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "vibrate: -> void\n", (uint8_t *)&v12, 2u);
  }

}

- (int64_t)getProvisioningStateWithClient:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  int64_t v12;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  unsigned int v17;
  uint8_t buf[4];
  _BYTE v19[10];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v19 = v5;
    _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEBUG, "getProvisioningStateWithClient: %@\n", buf, 0xCu);
  }
  v17 = 0;
  v16 = 4;
  if (v5)
    -[NSMutableArray logCall:withParameters:fromClient:](self->_vibrationPatterns, "logCall:withParameters:fromClient:", a2, 0, v5);
  v8 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 16, 0, 0, 0, &v17, &v16);
  if ((_DWORD)v8)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v6;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      v20 = (int)v8;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 2273;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (v16 != 4)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v6;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v19 = "size == sizeof(outData)";
      *(_WORD *)&v19[8] = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 2274;
      _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v17 = 0;
  }
  if (v5)
    -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v8);
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = v6;
  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v19 = v17;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = v8;
      v10 = v9;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_20:
      _os_log_impl(&dword_24B74E000, v10, v11, "getProvisioningStateWithClient -> %d (%{errno}d)\n", buf, 0xEu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v19 = v17;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = 0;
    v10 = v9;
    v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_20;
  }
  v12 = v17;

  return v12;
}

- (int)getBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v5;
  id v9;
  NSMutableArray *vibrationPatterns;
  void *v11;
  void *v12;
  signed int v13;
  uint64_t v14;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  const __CFString *v28;
  _QWORD v29[2];

  v5 = *(_QWORD *)&a4;
  v29[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  if (v9)
  {
    vibrationPatterns = self->_vibrationPatterns;
    v28 = CFSTR("user");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v12, v9);

  }
  v17.receiver = self;
  v17.super_class = (Class)BiometricKitXPCServerMesa;
  v13 = -[BiometricKitXPCServer getBioLockoutState:forUser:withClient:](&v17, sel_getBioLockoutState_forUser_withClient_, a3, v5, v9);
  v14 = v13;
  if (v13)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "err == 0 ";
      v20 = 2048;
      v21 = v14;
      v22 = 2080;
      v23 = "";
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v26 = 1024;
      v27 = 2295;
      _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }

  return v14;
}

- (BOOL)isFingerOnWithClient:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  char v8;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = BYTE2(self->_wakeGestureManager);
    v10 = 138412546;
    v11 = v5;
    v12 = 1024;
    v13 = v7;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "isFingerOnWithClient: %@ -> %d\n", (uint8_t *)&v10, 0x12u);
  }
  if (-[BiometricKitXPCServer ariadneSignposts](self, "ariadneSignposts"))
    kdebug_trace();
  if (v5)
    -[NSMutableArray logCall:withParameters:fromClient:](self->_vibrationPatterns, "logCall:withParameters:fromClient:", a2, 0, v5);
  if (-[BiometricKitXPCServer ariadneSignposts](self, "ariadneSignposts"))
    kdebug_trace();
  v8 = BYTE2(self->_wakeGestureManager);

  return v8;
}

- (int)enableBackgroundFdet:(BOOL)a3 withClient:(id)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSMutableArray *vibrationPatterns;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v19;
  NSObject *v20;
  int v21;
  _BYTE v22[18];
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  const __CFString *v29;
  _QWORD v30[2];

  v4 = a3;
  v30[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v21 = 67109378;
    *(_DWORD *)v22 = v4;
    *(_WORD *)&v22[4] = 2112;
    *(_QWORD *)&v22[6] = v7;
    _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_DEBUG, "enableBackgroundFdet:withClient: %d %@\n", (uint8_t *)&v21, 0x12u);
  }
  vibrationPatterns = self->_vibrationPatterns;
  v29 = CFSTR("enable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v12, v7);

  v13 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 69, v4, 0, 0, 0, 0);
  if ((_DWORD)v13)
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = v8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = 136316162;
      *(_QWORD *)v22 = "err == 0 ";
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = (int)v13;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v27 = 1024;
      v28 = 2330;
      _os_log_impl(&dword_24B74E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v13);
    if (__osLogTrace)
      v20 = __osLogTrace;
    else
      v20 = v8;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = 67109120;
      *(_DWORD *)v22 = v13;
      v16 = v20;
      v17 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    +[BioLog y](_TtC5BKDM16BioLog, "y");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logBackgroundFingerDetectState:", v4);

    -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, 0);
    if (__osLogTrace)
      v15 = __osLogTrace;
    else
      v15 = v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v21 = 67109120;
      *(_DWORD *)v22 = 0;
      v16 = v15;
      v17 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_24B74E000, v16, v17, "enableBackgroundFdet:withClient: -> %{errno}d\n", (uint8_t *)&v21, 8u);
    }
  }

  return v13;
}

- (BOOL)isXARTAvailableWithClient:(id)a3
{
  id v5;
  BOOL v6;
  objc_super v8;

  v5 = a3;
  if (v5)
    -[NSMutableArray logCall:withParameters:fromClient:](self->_vibrationPatterns, "logCall:withParameters:fromClient:", a2, 0, v5);
  v8.receiver = self;
  v8.super_class = (Class)BiometricKitXPCServerMesa;
  v6 = -[BiometricKitXPCServer isXARTAvailableWithClient:](&v8, sel_isXARTAvailableWithClient_, v5);

  return v6;
}

- (int)getBiometryAvailability:(int64_t *)a3 forUser:(unsigned int)a4 withClient:(id)a5
{
  uint64_t v5;
  id v9;
  NSMutableArray *vibrationPatterns;
  void *v11;
  void *v12;
  int v13;
  objc_super v15;
  const __CFString *v16;
  _QWORD v17[2];

  v5 = *(_QWORD *)&a4;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  if (v9)
  {
    vibrationPatterns = self->_vibrationPatterns;
    v16 = CFSTR("user");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v12, v9);

  }
  v15.receiver = self;
  v15.super_class = (Class)BiometricKitXPCServerMesa;
  v13 = -[BiometricKitXPCServer getBiometryAvailability:forUser:withClient:](&v15, sel_getBiometryAvailability_forUser_withClient_, a3, v5, v9);

  return v13;
}

- (int)getLastMatchEvent:(id *)a3 withClient:(id)a4
{
  NSMutableArray *vibrationPatterns;
  id v8;
  objc_super v10;

  vibrationPatterns = self->_vibrationPatterns;
  v8 = a4;
  -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, 0, v8);
  v10.receiver = self;
  v10.super_class = (Class)BiometricKitXPCServerMesa;
  LODWORD(a3) = -[BiometricKitXPCServer getLastMatchEvent:withClient:](&v10, sel_getLastMatchEvent_withClient_, a3, v8);

  return (int)a3;
}

- (int)setCalibrationData:(id)a3 source:(int)a4
{
  char *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  int v11;
  NSObject *v12;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v15 = 134218496;
    v16 = v6;
    v17 = 2048;
    v18 = objc_msgSend(v6, "length");
    v19 = 1024;
    LODWORD(v20) = a4;
    _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_DEFAULT, "setCalibrationData:source: %p[%ld] %d\n", (uint8_t *)&v15, 0x1Cu);

  }
  v10 = objc_retainAutorelease(v6);
  v11 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 32, (unsigned __int16)a4, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0, 0);
  if (v11)
  {
    v14 = (__osLog ? __osLog : v7);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 136316162;
      v16 = "err == 0 ";
      v17 = 2048;
      v18 = v11;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 2385;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
    }
  }
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = v7;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 67109120;
    LODWORD(v16) = v11;
    _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_DEFAULT, "setCalibrationData:source: -> %{errno}d\n", (uint8_t *)&v15, 8u);
  }

  return v11;
}

- (int)setMSRkData:(id)a3
{
  char *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  int v9;
  NSObject *v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v13 = 134218240;
    v14 = v4;
    v15 = 2048;
    v16 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEFAULT, "setMSRkData: %p[%ld]\n", (uint8_t *)&v13, 0x16u);

  }
  v8 = objc_retainAutorelease(v4);
  v9 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 92, 0, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 0, 0);
  if (v9)
  {
    v12 = (__osLog ? __osLog : v5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136316162;
      v14 = "err == 0 ";
      v15 = 2048;
      v16 = v9;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v21 = 1024;
      v22 = 2404;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
  }
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109120;
    LODWORD(v14) = v9;
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEFAULT, "setMSRkData: -> %{errno}d\n", (uint8_t *)&v13, 8u);
  }

  return v9;
}

- (id)getModuleSerialNumber
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  char *v7;
  NSObject *v8;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  _OWORD v25[2];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "getModuleSerialNumber\n", buf, 2u);
  }
  memset(v25, 0, sizeof(v25));
  v14 = 32;
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 34, 0, 0, 0, v25, &v14);
  if (v5)
  {
    v10 = v5;
    if (__osLog)
      v11 = __osLog;
    else
      v11 = v3;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "err == 0 ";
      v17 = 2048;
      v18 = v10;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 2427;
      _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v14 > 0x11)
    {
      v6 = objc_alloc(MEMORY[0x24BDD17C8]);
      v7 = (char *)objc_msgSend(v6, "initWithBytes:length:encoding:", v25, v14, 1);
      if (__osLogTrace)
        v8 = __osLogTrace;
      else
        v8 = v3;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v7;
        v17 = 1024;
        LODWORD(v18) = 0;
        _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "getModuleSerialNumber -> %@ (%{errno}d)\n", buf, 0x12u);
      }
      return v7;
    }
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v3;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "size >= 18";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 2428;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v10 = 22;
  }
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v3;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v16 = 0;
    v17 = 1024;
    LODWORD(v18) = v10;
    _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "getModuleSerialNumber -> %@ (%{errno}d)\n", buf, 0x12u);
  }
  return 0;
}

- (id)getFDRCalibrationData
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "getFDRCalibrationData\n", buf, 2u);
  }
  -[BiometricKitXPCServerMesa getModuleSerialNumber](self, "getModuleSerialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v3;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "serialNumber";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = "";
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v28 = 1024;
      v29 = 2454;
      _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v6 = 0;
    goto LABEL_27;
  }
  v18[0] = CFSTR("GetCombined");
  v18[1] = CFSTR("VerifyData");
  v19[0] = MEMORY[0x24BDBD1C8];
  v19[1] = MEMORY[0x24BDBD1C0];
  v18[2] = CFSTR("StripImg4");
  v19[2] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFAllocatorGetDefault();
  v7 = AMFDRCreateWithOptions();
  if (!v7)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v3;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "amfdr";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = "";
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v28 = 1024;
      v29 = 2462;
      _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
LABEL_27:
    v9 = 0;
    goto LABEL_10;
  }
  v8 = (const void *)v7;
  v9 = (void *)AMFDRDataCopy();
  if (!v9)
  {
    v17 = (__osLog ? __osLog : v3);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "calData";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = "";
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v28 = 1024;
      v29 = 2465;
      _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  CFRelease(v8);
LABEL_10:
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v3;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = v10;
    v12 = objc_msgSend(v9, "length");
    *(_DWORD *)buf = 134218240;
    v21 = (const char *)v9;
    v22 = 2048;
    v23 = v12;
    _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_DEBUG, "getFDRCalibrationData -> %p[%ld]\n", buf, 0x16u);

  }
  v13 = v9;

  return v13;
}

- (id)getRemoteFDRCalibrationData
{
  NSObject *v2;
  uint8_t v4[16];

  if (__osLogTrace)
    v2 = __osLogTrace;
  else
    v2 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24B74E000, v2, OS_LOG_TYPE_DEBUG, "getRemoteFDRCalibrationData\n", v4, 2u);
  }
  return 0;
}

- (id)getEEPROMCalibrationData
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "getEEPROMCalibrationData\n", (uint8_t *)&v13, 2u);
  }
  getLocalEEPROMCalibrationData();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = v2;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = v6;
      v8 = objc_msgSend(v5, "length");
      v13 = 134218240;
      v14 = v5;
      v15 = 2048;
      v16 = v8;
      v9 = v7;
      v10 = OS_LOG_TYPE_DEBUG;
LABEL_14:
      _os_log_impl(&dword_24B74E000, v9, v10, "getEEPROMCalibrationData -> %p[%ld]\n", (uint8_t *)&v13, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    v11 = objc_msgSend(0, "length");
    v13 = 134218240;
    v14 = 0;
    v15 = 2048;
    v16 = v11;
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }
  return v5;
}

+ (id)getSysCfgCalibrationData
{
  NSObject *v2;
  NSObject *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  CFTypeRef CFProperty;
  const void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "getSysCfgCalibrationData\n", (uint8_t *)&v17, 2u);
  }
  v4 = IOServiceNameMatching("biosensor,mesa");
  if (!v4)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v2;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v17 = 136316162;
    v18 = "matching";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v25 = 1024;
    v26 = 2534;
LABEL_27:
    _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    goto LABEL_34;
  }
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], v4);
  if (!MatchingService)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v2;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v17 = 136316162;
    v18 = "service != 0";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v25 = 1024;
    v26 = 2538;
    goto LABEL_27;
  }
  v6 = MatchingService;
  CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("calibration-blob"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v8 = CFProperty;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", CFProperty);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "length") <= 8)
    {
      if (__osLog)
        v16 = __osLog;
      else
        v16 = v2;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316162;
        v18 = "([calibrationData length] > (__builtin_offsetof(tsCafpnCal, uiStructSize) + sizeof(((tsCafpnCal *)0)->uiStructSize)))";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v25 = 1024;
        v26 = 2544;
        _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
    }
    else
    {
      v10 = objc_retainAutorelease(v9);
      objc_msgSend(v10, "setLength:", *(unsigned int *)(objc_msgSend(v10, "bytes") + 4));
    }
    IOObjectRelease(v6);
    CFRelease(v8);
    if (v9)
    {
      if (__osLogTrace)
        v11 = __osLogTrace;
      else
        v11 = v2;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v17 = 138412290;
        v18 = (const char *)v9;
        _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_DEBUG, "getSysCfgCalibrationData -> %@\n", (uint8_t *)&v17, 0xCu);
      }
      return v9;
    }
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v2;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "property";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 2541;
      _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    IOObjectRelease(v6);
  }
LABEL_34:
  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = v2;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v17 = 138412290;
    v18 = 0;
    _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "getSysCfgCalibrationData -> %@\n", (uint8_t *)&v17, 0xCu);
  }
  v9 = 0;
  return v9;
}

- (id)getFDRDataForClass:(id)a3
{
  char *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v3 = (char *)a3;
  v4 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "getFDRDataForClass: %@\n", buf, 0xCu);
  }
  v23[0] = CFSTR("GetCombined");
  v23[1] = CFSTR("VerifyData");
  v24[0] = MEMORY[0x24BDBD1C8];
  v24[1] = MEMORY[0x24BDBD1C0];
  v23[2] = CFSTR("StripImg4");
  v24[2] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)AMFDRSealingMapCopyLocalDataForClass();
  if (!v7)
  {
    v12 = (__osLog ? __osLog : v4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v14 = "calData";
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v21 = 1024;
      v22 = 2579;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = v4;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    v10 = objc_msgSend(v7, "length");
    *(_DWORD *)buf = 134218240;
    v14 = (const char *)v7;
    v15 = 2048;
    v16 = v10;
    _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_DEBUG, "getFDRDataForClass -> %p[%ld]\n", buf, 0x16u);

  }
  return v7;
}

- (id)getFDR3CalibrationData
{
  NSObject *v3;
  uint8_t v5[16];

  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "getFDR3CalibrationData\n", v5, 2u);
  }
  -[BiometricKitXPCServerMesa getFDRDataForClass:](self, "getFDRDataForClass:", CFSTR("FSC2"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getFDRMSRkData
{
  NSObject *v3;
  uint8_t v5[16];

  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "getFDRMSRkData\n", v5, 2u);
  }
  -[BiometricKitXPCServerMesa getFDRDataForClass:](self, "getFDRDataForClass:", CFSTR("MSRk"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)performDisplayStatusChangedCommand:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  uint64_t v6;
  void *v7;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 20, a3, 0, 0, 0, 0);
  v6 = v5;
  if (v5)
  {
    v9 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136316162;
      v11 = "err == 0 ";
      v12 = 2048;
      v13 = v6;
      v14 = 2080;
      v15 = "";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v18 = 1024;
      v19 = 2625;
      _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
  }
  -[NSMutableArray logDisplayState:withTimestamp:](self->_vibrationPatterns, "logDisplayState:withTimestamp:", v3, mach_absolute_time());
  +[BioLog y](_TtC5BKDM16BioLog, "y");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logDisplayState:", v3);

  -[__IOHIDEventSystemClient displayStatusChanged:](self->_hidClient, "displayStatusChanged:", v3);
  if (v3)
    BYTE1(self->_wakeGestureManager) = 0;
  return v6;
}

- (int64_t)getEnrollmentCount
{
  return (int64_t)self->_templListCache;
}

- (int)getTimestampCollection:(id *)a3
{
  int v4;
  __int128 v5;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  memset(v10, 0, 25);
  v8 = 0u;
  if (a3)
  {
    v4 = -[BiometricKitXPCServerMesa getDataFromDriverCommand:value:data:size:](self, "getDataFromDriverCommand:value:data:size:", 51, 0, &v8, 57);
    v5 = v9;
    *(_OWORD *)&a3->var0 = v8;
    *(_OWORD *)&a3->var2 = v5;
    *(_OWORD *)&a3->var4 = v10[0];
    *(_OWORD *)((char *)&a3->var5 + 1) = *(_OWORD *)((char *)v10 + 9);
  }
  else
  {
    v4 = -536870206;
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "timestampCollection";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v19 = 1024;
      v20 = 2661;
      _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

- (int)getDataFromDriverCommand:(unsigned __int8)a3 value:(unsigned __int8)a4 data:(char *)a5 size:(unint64_t)a6
{
  int v7;
  int v8;
  NSObject *v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!a5)
  {
    v8 = -536870206;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return v8;
    *(_DWORD *)buf = 136316162;
    v13 = "data";
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v20 = 1024;
    v21 = 2679;
LABEL_27:
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    return v8;
  }
  if (!a6)
  {
    v8 = -536870206;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return v8;
    *(_DWORD *)buf = 136316162;
    v13 = "dataSize";
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v20 = 1024;
    v21 = 2680;
    goto LABEL_27;
  }
  v11 = a6;
  v7 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", a3, a4, 0, 0, a5, &v11);
  if (v7)
  {
    v8 = v7;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return v8;
    *(_DWORD *)buf = 136316162;
    v13 = "err == 0 ";
    v14 = 2048;
    v15 = v8;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v20 = 1024;
    v21 = 2685;
    goto LABEL_27;
  }
  if (v11 == a6)
    return 0;
  if (__osLog)
    v10 = __osLog;
  else
    v10 = MEMORY[0x24BDACB70];
  v8 = -536870212;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v13 = "size == dataSize";
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v20 = 1024;
    v21 = 2686;
    goto LABEL_27;
  }
  return v8;
}

- (void)registerDelegate:(BOOL)a3 withClient:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BiometricKitXPCServerMesa;
  v6 = a4;
  -[BiometricKitXPCServer registerDelegate:withClient:](&v7, sel_registerDelegate_withClient_, v4, v6);
  -[NSMutableArray logDelegateRegistered:fromClient:](self->_vibrationPatterns, "logDelegateRegistered:fromClient:", v4, v6, v7.receiver, v7.super_class);

}

- (int)getCommProtocolVersion
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  __int16 v6;
  NSObject *v7;
  int v8;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "getCommProtocolVersion\n", buf, 2u);
  }
  if (LOWORD(self->_connect))
    goto LABEL_12;
  v12 = 4;
  v13 = 0;
  v14 = 3;
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 1, 0, &v14, 4, &v13, &v12);
  if (v5)
  {
    v8 = v5;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "err == 0 ";
      v17 = 2048;
      v18 = v8;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 2720;
LABEL_29:
      _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v12 == 4)
    {
      v6 = v13;
      if (v13 >= 3)
        v6 = 3;
      LOWORD(self->_connect) = v6;
LABEL_12:
      if (__osLogTrace)
        v7 = __osLogTrace;
      else
        v7 = v3;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = 0;
        _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEBUG, "getCommProtocolVersion -> %{errno}d\n", buf, 8u);
      }
      return 0;
    }
    v8 = -536870212;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "size == sizeof(outData)";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 2721;
      goto LABEL_29;
    }
  }
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v3;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v8;
    _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "getCommProtocolVersion -> %{errno}d\n", buf, 8u);
  }
  return v8;
}

- (BOOL)shouldFilterStatusForSB:(unsigned int)a3
{
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 67109120;
    v11 = a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "shouldFilterStatusForSB: %d\n", (uint8_t *)&v10, 8u);
  }
  if (a3 - 63 > 1)
  {
    v7 = 0;
    if (a3 - 81 > 0xB || ((1 << (a3 - 81)) & 0x807) == 0)
      goto LABEL_15;
    if (*(_DWORD *)&self->_autoMatchStartedByHomeButton != a3)
    {
      v7 = 0;
      *(_DWORD *)&self->_autoMatchStartedByHomeButton = a3;
      goto LABEL_15;
    }
LABEL_13:
    v7 = 1;
    goto LABEL_15;
  }
  if (HIDWORD(self->_wakeGestureManager) == a3)
    goto LABEL_13;
  HIDWORD(self->_wakeGestureManager) = a3;
  v7 = 0;
  if (a3 == 64)
    *(_DWORD *)&self->_autoMatchStartedByHomeButton = 0;
LABEL_15:
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = v5;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 67109120;
    v11 = v7;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "shouldFilterStatusForSB: -> %d\n", (uint8_t *)&v10, 8u);
  }
  return v7;
}

- (int)cacheSensorInfo
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  NSObject *v8;
  MesaCoreAnalytics *v9;
  unsigned int v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "cacheSensorInfo\n", buf, 2u);
  }
  v10 = 0;
  v9 = 0;
  v5 = -[BiometricKitXPCServerMesa getDataFromDriverCommand:value:data:size:](self, "getDataFromDriverCommand:value:data:size:", 53, 0, &v9, 12);
  v6 = v5;
  if (v5)
  {
    if (__osLog)
      v8 = __osLog;
    else
      v8 = v3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "err == 0 ";
      v13 = 2048;
      v14 = v6;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v19 = 1024;
      v20 = 2877;
LABEL_20:
      _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (HIDWORD(v9) == 12)
    {
      self->_statistics = v9;
      self->_sensorInfo.version = v10;
      return v6;
    }
    if (__osLog)
      v8 = __osLog;
    else
      v8 = v3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "outData.sensorInfo.structSize == sizeof(_sensorInfo)";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v19 = 1024;
      v20 = 2880;
      goto LABEL_20;
    }
  }
  return v6;
}

- (unint64_t)getSensorType
{
  MesaCoreAnalytics **p_statistics;
  int v3;
  int v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_statistics = &self->_statistics;
  if (HIDWORD(self->_statistics) == 12)
    return *((unsigned int *)p_statistics + 2);
  v3 = -[BiometricKitXPCServerMesa cacheSensorInfo](self, "cacheSensorInfo");
  if (!v3)
    return *((unsigned int *)p_statistics + 2);
  v5 = v3;
  if (__osLog)
    v6 = __osLog;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136316162;
    v8 = "err == 0 ";
    v9 = 2048;
    v10 = v5;
    v11 = 2080;
    v12 = "";
    v13 = 2080;
    v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v15 = 1024;
    v16 = 2895;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
  }
  return 0;
}

- (void)checkDailyUpdate
{
  void *v3;
  char v4;
  int64_t v5;
  void *enrollmentCount;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDateInToday:", self->_enrollmentCount);

  if ((v4 & 1) == 0)
  {
    -[__IOHIDEventSystemClient resetMatchCounts](self->_hidClient, "resetMatchCounts");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = objc_claimAutoreleasedReturnValue();
    enrollmentCount = (void *)self->_enrollmentCount;
    self->_enrollmentCount = v5;

    -[BiometricKitXPCServer cachedIdentities](self, "cachedIdentities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[BiometricKitXPCServer cachedIdentities](self, "cachedIdentities", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setMatchCount:", 0);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }
}

- (void)setupDailyUpdateTimer
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *sigTERMDispatchSource;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_get_global_queue(-2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v3);
  sigTERMDispatchSource = self->_sigTERMDispatchSource;
  self->_sigTERMDispatchSource = v4;

  v6 = self->_sigTERMDispatchSource;
  if (v6)
    goto LABEL_2;
  v9 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v12 = "_dailyUpdateTimer";
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v19 = 1024;
    v20 = 2922;
    _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v6 = self->_sigTERMDispatchSource;
  if (v6)
  {
LABEL_2:
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __50__BiometricKitXPCServerMesa_setupDailyUpdateTimer__block_invoke;
    handler[3] = &unk_251CA06E0;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    v7 = self->_sigTERMDispatchSource;
    v8 = dispatch_walltime(0, 60000000000);
    dispatch_source_set_timer(v7, v8, 0x4E94914F0000uLL, 0xDF8475800uLL);
    dispatch_resume((dispatch_object_t)self->_sigTERMDispatchSource);
  }
}

uint64_t __50__BiometricKitXPCServerMesa_setupDailyUpdateTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkDailyUpdate");
}

- (void)resetContinuousCounters
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[BiometricKitXPCServer cachedIdentities](self, "cachedIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[BiometricKitXPCServer cachedIdentities](self, "cachedIdentities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setMatchCountContinuous:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (id)pullCalibrationDataWithClient:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13 = 184320;
  if (v5)
    -[NSMutableArray logCall:withParameters:fromClient:](self->_vibrationPatterns, "logCall:withParameters:fromClient:", a2, 0, v5);
  if (self->_log == (BioLogLegacy *)1)
  {
LABEL_15:
    v9 = 0;
    v8 = 86;
    if (!v5)
      goto LABEL_9;
    goto LABEL_8;
  }
  v6 = malloc_type_malloc(0x2D000uLL, 0x98F87B34uLL);
  if (!v6)
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v15 = "data";
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v22 = 1024;
      v23 = 2963;
      _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_15;
  }
  v7 = v6;
  v8 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 33, 0, 0, 0, v6, &v13);
  if ((_DWORD)v8)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 136316162;
    v15 = "err == 0 ";
    v16 = 2048;
    v17 = (int)v8;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v22 = 1024;
    v23 = 2966;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_7;
  if (__osLog)
    v12 = __osLog;
  else
    v12 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v15 = "calData";
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v22 = 1024;
    v23 = 2969;
LABEL_27:
    _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_28:
  v9 = 0;
LABEL_7:
  free(v7);
  if (v5)
LABEL_8:
    -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v8);
LABEL_9:

  return v9;
}

- (id)pullCaptureBufferWithClient:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v12 = 0x8000;
  v5 = a3;
  v6 = malloc_type_malloc(0x8000uLL, 0x2F266FE6uLL);
  -[NSMutableArray logCall:withParameters:fromClient:](self->_vibrationPatterns, "logCall:withParameters:fromClient:", a2, 0, v5);

  if (v6)
  {
    v7 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 9, 0, 0, 0, v6, &v12);
    if ((_DWORD)v7)
    {
      if (__osLog)
        v11 = __osLog;
      else
        v11 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_DWORD *)buf = 136316162;
      v14 = "err == 0 ";
      v15 = 2048;
      v16 = (int)v7;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v21 = 1024;
      v22 = 3001;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_4:
        free(v6);
        goto LABEL_5;
      }
      if (__osLog)
        v11 = __osLog;
      else
        v11 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_23:
        v8 = 0;
        goto LABEL_4;
      }
      *(_DWORD *)buf = 136316162;
      v14 = "captureData";
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v21 = 1024;
      v22 = 3004;
    }
    _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_23;
  }
  if (__osLog)
    v10 = __osLog;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v14 = "data";
    v15 = 2048;
    v16 = 0;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v21 = 1024;
    v22 = 2996;
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v8 = 0;
  v7 = 86;
LABEL_5:
  -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v7);
  return v8;
}

- (int)setDebugImages:(BOOL)a3 withClient:(id)a4
{
  _BOOL8 v4;
  NSMutableArray *vibrationPatterns;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v4 = a3;
  v14[1] = *MEMORY[0x24BDAC8D0];
  vibrationPatterns = self->_vibrationPatterns;
  v13 = CFSTR("show");
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a4;
  objc_msgSend(v8, "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray logCall:withParameters:fromClient:](vibrationPatterns, "logCall:withParameters:fromClient:", a2, v11, v9);

  LOBYTE(self->_cachedImageDB) = v4;
  return 0;
}

- (id)pullDebugImageData:(BOOL)a3 rotated:(BOOL)a4 hasWidth:(unsigned int *)a5 hasHeight:(unsigned int *)a6 withClient:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;
  id v14;
  const char *v15;
  NSMutableArray *vibrationPatterns;
  void *v17;
  void *v18;
  BiometricKitXPCServerMesa *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  NSObject *v31;
  NSObject *v33;
  NSObject *v34;
  unsigned int *v35;
  uint64_t v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  _QWORD v48[2];
  _QWORD v49[3];

  v8 = a4;
  v9 = a3;
  v49[2] = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  v37 = 21504;
  v13 = malloc_type_malloc(0x5400uLL, 0x39761548uLL);
  if (v12)
  {
    v35 = a6;
    v14 = v12;
    v15 = a2;
    vibrationPatterns = self->_vibrationPatterns;
    v48[0] = CFSTR("postImage");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = CFSTR("rotated");
    v49[0] = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v19 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = vibrationPatterns;
    a2 = v15;
    v12 = v14;
    a6 = v35;
    -[NSMutableArray logCall:withParameters:fromClient:](v21, "logCall:withParameters:fromClient:", a2, v20, v12);

    self = v19;
  }
  if (!v13)
  {
    if (__osLog)
      v33 = __osLog;
    else
      v33 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v39 = "data";
      v40 = 2048;
      v41 = 0;
      v42 = 2080;
      v43 = "";
      v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v46 = 1024;
      v47 = 3047;
      _os_log_impl(&dword_24B74E000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v29 = 0;
    v23 = 22;
    if (v12)
      goto LABEL_36;
    goto LABEL_37;
  }
  if (v9)
    v22 = 11;
  else
    v22 = 10;
  v23 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", v22, 0, 0, 0, v13, &v37);
  if (!(_DWORD)v23)
  {
    v24 = a2;
    v25 = 88;
    if (v37 > 15487)
    {
      v26 = 88;
      if (v37 == 15488)
        goto LABEL_15;
      v27 = 21504;
    }
    else
    {
      v26 = 88;
      if (v37 == 7744)
        goto LABEL_15;
      v27 = 10752;
    }
    if (v37 != v27)
    {
      if (__osLog)
        v31 = __osLog;
      else
        v31 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)buf = 136316162;
      v39 = "w && h";
      v40 = 2048;
      v41 = 0;
      v42 = 2080;
      v43 = "";
      v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v46 = 1024;
      v47 = 3062;
      goto LABEL_25;
    }
    v26 = 96;
    v25 = 112;
LABEL_15:
    if (v8)
    {
      if (v37 == 10752 || v37 == 7744)
      {
        rotateBitmap90Data8();
        v28 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        rotateBitmap90Data16();
        v28 = objc_claimAutoreleasedReturnValue();
      }
      v29 = (void *)v28;
      v30 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v25;
      v25 = v26;
    }
    if (v29)
    {
      if (a5)
        *a5 = v30;
      if (a6)
        *a6 = v25;
      goto LABEL_34;
    }
    if (__osLog)
      v31 = __osLog;
    else
      v31 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_26:
      v29 = 0;
LABEL_34:
      a2 = v24;
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136316162;
    v39 = "imgData";
    v40 = 2048;
    v41 = 0;
    v42 = 2080;
    v43 = "";
    v44 = 2080;
    v45 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v46 = 1024;
    v47 = 3084;
LABEL_25:
    _os_log_impl(&dword_24B74E000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_26;
  }
  if (__osLog)
    v34 = __osLog;
  else
    v34 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v39 = "err == 0 ";
    v40 = 2048;
    v41 = (int)v23;
    v42 = 2080;
    v43 = "";
    v44 = 2080;
    v45 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v46 = 1024;
    v47 = 3050;
    _os_log_impl(&dword_24B74E000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v29 = 0;
LABEL_35:
  free(v13);
  if (v12)
LABEL_36:
    -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v23);
LABEL_37:

  return v29;
}

- (void)cacheImageDB:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  if (LOBYTE(self->_cachedImageDB))
  {
    v12 = 0;
    -[BiometricKitXPCServerMesa pullDebugImageData:rotated:hasWidth:hasHeight:withClient:](self, "pullDebugImageData:rotated:hasWidth:hasHeight:withClient:", 1, 1, (char *)&v12 + 4, &v12, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(id *)&self->_status;
      objc_sync_enter(v6);
      if ((unint64_t)objc_msgSend(*(id *)&self->_status, "count") >= 0x33)
        objc_msgSend(*(id *)&self->_status, "removeAllObjects");
      v13[0] = v5;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", HIDWORD(v12));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)&self->_status;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)((char *)&a3->var14[4] + 3));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

      objc_sync_exit(v6);
    }

  }
}

- (void)updateImageDB:(id)a3 templateUpdateInfo:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id obj;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  _BYTE buf[22];
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    if (__osLog)
      v23 = __osLog;
    else
      v23 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "templateUpdateInfo";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 0;
    v33 = 2080;
    v34 = "";
    v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v37 = 1024;
    v38 = 3133;
LABEL_27:
    _os_log_impl(&dword_24B74E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_16;
  }
  if (a4->var2.var0 != 3080)
  {
    if (__osLog)
      v23 = __osLog;
    else
      v23 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "templateUpdateInfo->topology.structSize == sizeof(match_node_placement_t)";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 0;
    v33 = 2080;
    v34 = "";
    v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v37 = 1024;
    v38 = 3134;
    goto LABEL_27;
  }
  if (a4->var2.var4.var3 != -1)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    v25 = v6;
    v8 = *(void **)&self->_status;
    v9 = (_QWORD *)((char *)&a4->var3.var14[4] + 3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)((char *)&a4->var3.var14[4] + 3));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      *(_QWORD *)buf = (id)objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&buf[8] = objc_msgSend(v11, "unsignedIntValue");

      objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&buf[12] = objc_msgSend(v12, "unsignedIntValue");

      v13 = *(void **)&self->_status;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v14);

    }
    RIESUpdate();
    obj = *(id *)&self->_status;
    objc_sync_enter(obj);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = *(id *)&self->_status;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v16);
          v20 = *v9;
          v21 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "unsignedLongLongValue", obj);
          if (v20 - v21 > (unint64_t)nanosecondsToAbsolute())
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *v9);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v17);
    }

    objc_msgSend(*(id *)&self->_status, "removeObjectsForKeys:", v15);
    objc_sync_exit(obj);

    v7 = v25;
  }
LABEL_16:

}

- (id)getSerialisedTemplatesForUser:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  unsigned int size;
  int size_4;
  uint64_t v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v3 = *(_QWORD *)&a3;
  v40 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v31) = v3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "getSerialisedTemplatesForUser: %d\n", buf, 8u);
  }
  v29 = 0;
  if (self->_log == (BioLogLegacy *)1)
    goto LABEL_54;
  v7 = -[BiometricKitXPCServer checkCatacombForUser:](self, "checkCatacombForUser:", v3);
  if (v7)
  {
    v14 = v7;
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    *(_DWORD *)buf = 136316162;
    v31 = "err == 0 ";
    v32 = 2048;
    v33 = v14;
    v34 = 2080;
    v35 = "";
    v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v38 = 1024;
    v39 = 3187;
LABEL_30:
    _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_42;
  }
  size = 0;
  size_4 = v3;
  v29 = 4;
  v8 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 31, 0, &size_4, 4, &size, &v29);
  if (v8)
  {
    v14 = v8;
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    *(_DWORD *)buf = 136316162;
    v31 = "err == 0 ";
    v32 = 2048;
    v33 = v14;
    v34 = 2080;
    v35 = "";
    v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v38 = 1024;
    v39 = 3195;
    goto LABEL_30;
  }
  if (v29 != 4)
  {
    v14 = -536870212;
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    *(_DWORD *)buf = 136316162;
    v31 = "size == sizeof(prepOutData)";
    v32 = 2048;
    v33 = 0;
    v34 = 2080;
    v35 = "";
    v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v38 = 1024;
    v39 = 3196;
    goto LABEL_30;
  }
  if (!size)
    goto LABEL_54;
  v9 = malloc_type_malloc(size, 0x52E7D950uLL);
  if (!v9)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v5;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v31 = "data";
      v32 = 2048;
      v33 = 0;
      v34 = 2080;
      v35 = "";
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v38 = 1024;
      v39 = 3201;
      _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_54;
  }
  v10 = v9;
  v26 = v3;
  v29 = size;
  v11 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 27, 0, &v26, 4, v9, &v29);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, v29, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
LABEL_55:
      if (__osLogTrace)
        v23 = __osLogTrace;
      else
        v23 = v5;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = v23;
        v25 = objc_msgSend(v13, "length");
        *(_DWORD *)buf = 134218496;
        v31 = (const char *)v13;
        v32 = 2048;
        v33 = v25;
        v34 = 1024;
        LODWORD(v35) = 0;
        _os_log_impl(&dword_24B74E000, v24, OS_LOG_TYPE_DEBUG, "getSerialisedTemplatesForUser: -> %p[%ld] (%{errno}d)\n", buf, 0x1Cu);

      }
      return v13;
    }
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v5;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v31 = "result";
      v32 = 2048;
      v33 = 0;
      v34 = 2080;
      v35 = "";
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v38 = 1024;
      v39 = 3211;
      _os_log_impl(&dword_24B74E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v10);
LABEL_54:
    v13 = 0;
    goto LABEL_55;
  }
  v14 = v11;
  if (__osLog)
    v17 = __osLog;
  else
    v17 = v5;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v31 = "err == 0 ";
    v32 = 2048;
    v33 = v14;
    v34 = 2080;
    v35 = "";
    v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v38 = 1024;
    v39 = 3208;
    _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  free(v10);
LABEL_42:
  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v5;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = v18;
    v20 = objc_msgSend(0, "length");
    *(_DWORD *)buf = 134218496;
    v31 = 0;
    v32 = 2048;
    v33 = v20;
    v34 = 1024;
    LODWORD(v35) = v14;
    _os_log_impl(&dword_24B74E000, v19, OS_LOG_TYPE_ERROR, "getSerialisedTemplatesForUser: -> %p[%ld] (%{errno}d)\n", buf, 0x1Cu);

  }
  return 0;
}

- (int64_t)getSensorCalibrationStatusWithClient:(id)a3
{
  int v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v10 = 1;
  -[NSMutableArray logCall:withParameters:fromClient:](self->_vibrationPatterns, "logCall:withParameters:fromClient:", a2, 0, a3);
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 29, 0, 0, 0, &v11, &v10);
  v6 = v5;
  if (v5)
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136316162;
    v13 = "err == 0 ";
    v14 = 2048;
    v15 = v6;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v20 = 1024;
    v21 = 3240;
    goto LABEL_15;
  }
  if (v10 != 1)
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136316162;
    v13 = "size == sizeof(outData)";
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v20 = 1024;
    v21 = 3241;
LABEL_15:
    _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_16:
    v7 = -1;
    goto LABEL_4;
  }
  v7 = v11;
LABEL_4:
  -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v6);
  return v7;
}

- (id)getCalibrationDataInfoWithClient:(id)a3
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11 = 0;
  v12 = 0;
  LODWORD(v14) = 0;
  v13 = 0;
  if (v5)
    -[NSMutableArray logCall:withParameters:fromClient:](self->_vibrationPatterns, "logCall:withParameters:fromClient:", a2, 0, v5, v11, v12, v13, v14);
  v6 = -[BiometricKitXPCServerMesa getDataFromDriverCommand:value:data:size:](self, "getDataFromDriverCommand:value:data:size:", 26, 0, &v11, 28);
  v7 = v6;
  if (v6)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "err == 0 ";
      v17 = 2048;
      v18 = v7;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 3265;
      _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v8 = 0;
    if (v5)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v11, 28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
LABEL_5:
      -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v7, v11, v12, v13, v14);
  }

  return v8;
}

- (int64_t)getCalBlobVersion
{
  id v2;
  uint64_t v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[BiometricKitXPCServerMesa getCalibrationDataInfoWithClient:](self, "getCalibrationDataInfoWithClient:", 0);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "bytes");

  if (v3)
    return *(unsigned int *)(v3 + 16);
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 136316162;
    v7 = "calDataInfo";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = "";
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v14 = 1024;
    v15 = 3284;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
  }
  return -1;
}

- (int64_t)getCalibrationDataState
{
  id v2;
  unsigned int *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[BiometricKitXPCServerMesa getCalibrationDataInfoWithClient:](self, "getCalibrationDataInfoWithClient:", 0);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (unsigned int *)objc_msgSend(v2, "bytes");

  if (v3)
    return *v3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 136316162;
    v7 = "calDataInfo";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = "";
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v14 = 1024;
    v15 = 3301;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
  }
  return -1;
}

- (float)getModulationRatio
{
  id v2;
  uint64_t v3;
  float v4;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[BiometricKitXPCServerMesa getCalibrationDataInfoWithClient:](self, "getCalibrationDataInfoWithClient:", 0);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "bytes");

  if (v3)
    return *(float *)(v3 + 4);
  if (__osLog)
    v6 = __osLog;
  else
    v6 = MEMORY[0x24BDACB70];
  v4 = 0.0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136316162;
    v8 = "calDataInfo";
    v9 = 2048;
    v10 = 0;
    v11 = 2080;
    v12 = "";
    v13 = 2080;
    v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v15 = 1024;
    v16 = 3318;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
  }
  return v4;
}

- (id)getSensorInfoWithClient:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (HIDWORD(self->_statistics) != 12
    && (v6 = -[BiometricKitXPCServerMesa cacheSensorInfo](self, "cacheSensorInfo"), (_DWORD)v6))
  {
    v8 = v6;
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136316162;
      v12 = "err == 0 ";
      v13 = 2048;
      v14 = (int)v8;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v19 = 1024;
      v20 = 3338;
      _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    }
    v7 = 0;
    if (v5)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &self->_statistics, 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (v5)
LABEL_4:
      -[NSMutableArray logCall:withError:](self->_vibrationPatterns, "logCall:withError:", a2, v8);
  }

  return v7;
}

- (id)getLogs:(BOOL)a3 withDetails:(id *)a4
{
  int v6;
  NSMutableArray *vibrationPatterns;
  uint64_t v8;
  void *v9;
  int v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  if (a3)
  {
    if (a4)
      *a4 = 0;
    v6 = isInternalBuild();
    vibrationPatterns = self->_vibrationPatterns;
    if (v6)
    {
      -[NSMutableArray packAllLogs](vibrationPatterns, "packAllLogs");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    -[NSMutableArray attachmentsFromAllLogs](vibrationPatterns, "attachmentsFromAllLogs");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v13 = (void *)v14;
    v12 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    -[NSMutableArray details](self->_vibrationPatterns, "details");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v9, "copy");

  }
  v10 = isInternalBuild();
  v11 = self->_vibrationPatterns;
  if (!v10)
  {
    -[NSMutableArray attachmentsFromCurrentLog](v11, "attachmentsFromCurrentLog");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[NSMutableArray packCurrentLog](v11, "packCurrentLog");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v12 = (void *)v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_16:

  return v13;
}

- (BOOL)fileRadarWithLogs:(id)a3 withDescription:(id)a4
{
  NSMutableArray *vibrationPatterns;
  void *v6;
  const char *CStringPtr;

  vibrationPatterns = self->_vibrationPatterns;
  if (vibrationPatterns)
    return -[NSMutableArray fileRadarWithLogs:withDescription:](vibrationPatterns, "fileRadarWithLogs:withDescription:", a3, a4);
  objc_msgSend(MEMORY[0x24BE0CE58], "sharedInstance", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("debugLogEnabled"));

  CStringPtr = CFStringGetCStringPtr(CFSTR("com.apple.biometrickitd.debugLogEnabled"), 0x600u);
  notify_post(CStringPtr);
  objc_msgSend(MEMORY[0x24BE0CF28], "displayStopAlertWithHeader:andMessage:", CFSTR("Touch ID Logs Unavailable"), CFSTR("Touch ID logging (BioLog) has been enabled now. You can disable it later in Internal Settings / Mesa. Please try what you were just doing again and file a radar later."));
  return 0;
}

- (int)setIORegistryProperty:(id)a3 toValue:(id)a4 onService:(id)a5
{
  __CFString *v7;
  id v8;
  mach_port_t v9;
  const __CFDictionary *v10;
  io_service_t MatchingService;
  io_object_t v12;
  kern_return_t v13;
  NSObject *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a3;
  v8 = a4;
  v9 = *MEMORY[0x24BDD8B20];
  v10 = IOServiceMatching((const char *)objc_msgSend(objc_retainAutorelease(a5), "UTF8String"));
  MatchingService = IOServiceGetMatchingService(v9, v10);
  if (MatchingService)
  {
    v12 = MatchingService;
    v13 = IORegistryEntrySetCFProperty(MatchingService, v7, v8);
    if (v13)
    {
      if (__osLog)
        v16 = __osLog;
      else
        v16 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316162;
        v18 = "err == 0 ";
        v19 = 2048;
        v20 = v13;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v25 = 1024;
        v26 = 3436;
        _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
      }
    }
    IOObjectRelease(v12);
  }
  else
  {
    v13 = -536870208;
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "service";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 3433;
      _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
  }

  return v13;
}

- (void)enrollResult:(id)a3 withTimestamp:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218498;
    v17 = v6;
    v18 = 2114;
    v19 = v6;
    v20 = 2048;
    v21 = a4;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEFAULT, "enrollResult:withTimestamp: %p(%{public}@) %llu\n", (uint8_t *)&v16, 0x20u);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[BioLog y](_TtC5BKDM16BioLog, "y");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEnrollResultWithIdentity:", v6);

  -[NSMutableArray logEnrollResultIdentity:withTimestamp:forClients:](self->_vibrationPatterns, "logEnrollResultIdentity:withTimestamp:forClients:", v6, a4, v9);
  -[BiometricKitXPCServerMesa saveCatacomb](self, "saveCatacomb");
  if (v6)
  {
    -[BiometricKitXPCServer setGracePeriod:](self, "setGracePeriod:", 0);
    ++self->_templListCache;
    -[BiometricKitXPCServerMesa resetContinuousCounters](self, "resetContinuousCounters");
  }
  -[BiometricKitXPCServer updateEnrollmentChangedNotification:](self, "updateEnrollmentChangedNotification:", 1);
  -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v11);
  if (v14
    && objc_msgSend(v14, "delegateRegistered")
    && (objc_msgSend(v14, "clientAppIsBackground") & 1) == 0)
  {
    objc_msgSend(v14, "enrollResult:", v6);
    objc_msgSend(v9, "addObject:", v14);
  }
  BYTE1(self->_sensorInfo.structSize) = 0;
  -[BiometricKitXPCServerMesa disableHomeButton:](self, "disableHomeButton:", 0);
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = v7;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v14;
    _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_DEBUG, "enrollResult:withTimestamp: -> void (_ %@)\n", (uint8_t *)&v16, 0xCu);
  }

}

- (void)matchResult:(id)a3 timestamp:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  unsigned int *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t i;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  unint64_t v58;
  uint8_t buf[4];
  _BYTE v60[18];
  __int16 v61;
  const char *v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v60 = v5;
    *(_WORD *)&v60[8] = 2048;
    *(_QWORD *)&v60[10] = a4;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "matchResult:timestamp: %@ %llu\n", buf, 0x16u);
  }
  v58 = 0;
  if (!v5)
  {
    if (__osLog)
      v49 = __osLog;
    else
      v49 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_83;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v60 = "matchData";
    *(_WORD *)&v60[8] = 2048;
    *(_QWORD *)&v60[10] = 0;
    v61 = 2080;
    v62 = "";
    v63 = 2080;
    v64 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v65 = 1024;
    v66 = 3550;
    goto LABEL_82;
  }
  if ((unint64_t)objc_msgSend(v5, "length") <= 0xC6F)
  {
    if (__osLog)
      v49 = __osLog;
    else
      v49 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_83;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v60 = "[matchData length] >= sizeof(message_match_node_v1_t)";
    *(_WORD *)&v60[8] = 2048;
    *(_QWORD *)&v60[10] = 0;
    v61 = 2080;
    v62 = "";
    v63 = 2080;
    v64 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v65 = 1024;
    v66 = 3551;
LABEL_82:
    _os_log_impl(&dword_24B74E000, v49, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_83:
    v25 = 0;
    v22 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
LABEL_96:
    v14 = 0;
    goto LABEL_97;
  }
  -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "type");
  if (v10 == 2)
  {
    v56 = v9;
    objc_msgSend(v56, "client");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (__osLog)
      v50 = __osLog;
    else
      v50 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v60 = "bioOp.type == kBioOpTypeMatch";
      *(_WORD *)&v60[8] = 2048;
      *(_QWORD *)&v60[10] = 0;
      v61 = 2080;
      v62 = "";
      v63 = 2080;
      v64 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v65 = 1024;
      v66 = 3557;
      _os_log_impl(&dword_24B74E000, v50, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v56 = 0;
    v57 = 0;
  }

  objc_sync_exit(v7);
  if (v10 != 2)
    goto LABEL_95;
  v11 = objc_retainAutorelease(v5);
  v12 = (unsigned int *)objc_msgSend(v11, "bytes");
  if (objc_msgSend(v11, "length") < 4 * (unint64_t)v12[801] + 3208)
  {
    if (__osLog)
      v51 = __osLog;
    else
      v51 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v60 = "[matchData length] >= sizeof(match_result) + (matchResult->lotlItems * sizeof(matchResult->lotlUserIDs[0]))";
      *(_WORD *)&v60[8] = 2048;
      *(_QWORD *)&v60[10] = 0;
      v61 = 2080;
      v62 = "";
      v63 = 2080;
      v64 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v65 = 1024;
      v66 = 3563;
      _os_log_impl(&dword_24B74E000, v51, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
LABEL_95:
    v25 = 0;
    v22 = 0;
    v55 = 0;
    goto LABEL_96;
  }
  if (*v12 == -1)
  {
    if (__osLog)
      v21 = __osLog;
    else
      v21 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B74E000, v21, OS_LOG_TYPE_DEFAULT, "matchResult:timestamp: NO-MATCH\n", buf, 2u);
    }
    v14 = 0;
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v12 + 1);
    -[BiometricKitXPCServer getIdentityObjectByUserID:UUID:](self, "getIdentityObjectByUserID:UUID:", *v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userID");
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (v15 != *v12)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v60 = "[identity userID] == matchResult->identity.userID";
        *(_WORD *)&v60[8] = 2048;
        *(_QWORD *)&v60[10] = 0;
        v61 = 2080;
        v62 = "";
        v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v65 = 1024;
        v66 = 3570;
        _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      v25 = 0;
      v22 = 0;
      v55 = 0;
      goto LABEL_97;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_msgSend(v14, "userID");
      objc_msgSend(v14, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v60 = v18;
      *(_WORD *)&v60[4] = 2114;
      *(_QWORD *)&v60[6] = v20;
      _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_DEFAULT, "matchResult:timestamp: MATCH %d: %{public}@\n", buf, 0x12u);

    }
  }
  if (-[BiometricKitXPCServer ariadneSignposts](self, "ariadneSignposts", a4))
    kdebug_trace();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", (char *)v12 + 26, 98);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("BKMatchDetailImageMetadata"));

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12 + 31, 3080);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("BKMatchDetailTopologyData"));

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v12[801];
  if ((_DWORD)v26)
  {
    for (i = 0; i < v26; ++i)
    {
      if (v12[i + 802] != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v28);

        v26 = v12[801];
      }
    }
  }
  if (objc_msgSend(v25, "count"))
  {
    objc_msgSend(v25, "componentsJoinedByString:", CFSTR(","));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, CFSTR("BKMatchDetailLOTLUserIDs"));

  }
  v30 = v12[5];
  if ((v30 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v31, CFSTR("BKMatchDetailPreArm"));

    v30 = v12[5];
  }
  if ((v30 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("BKMatchDetailHomeButtonPressed"));

  }
  if (!v14)
  {
    if ((v12[5] & 0xF) - 1 > 2)
      v38 = 0;
    else
      v38 = dword_24B7F88B4[(v12[5] & 0xF) - 1];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v39, CFSTR("BKMatchDetailNoMatchReason"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (v12[5] & 0xD) == 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v40, CFSTR("BKMatchDetailNoMatchMatcher"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (v12[5] & 0xF) == 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v41, CFSTR("BKMatchDetailNoMatchImageQuality"));

    v42 = objc_msgSend(v56, "userID");
    if ((_DWORD)v42 == -1
      && (-[BiometricKitXPCServer hasMultipleUserAccounts](self, "hasMultipleUserAccounts")
       || (v42 = -[BiometricKitXPCServer currentAccountUserID](self, "currentAccountUserID"), (_DWORD)v42 == -1)))
    {
      -[BiometricKitXPCServer identities](self, "identities");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v47)
        goto LABEL_56;
      v48 = objc_msgSend(v47, "userID");

      if ((_DWORD)v48 == -1)
        goto LABEL_56;
      -[BiometricKitXPCServerMesa getBioLockoutState:forUser:withClient:](self, "getBioLockoutState:forUser:withClient:", &v58, v48, 0);
      if ((v58 & 0x40) != 0)
        goto LABEL_56;
      v43 = 8;
    }
    else
    {
      -[BiometricKitXPCServerMesa getBioLockoutState:forUser:withClient:](self, "getBioLockoutState:forUser:withClient:", &v58, v42, 0);
      if ((v58 & 0x40) == 0)
      {
LABEL_56:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v58);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v44, CFSTR("BKMatchDetailLockoutState"));

        goto LABEL_57;
      }
      v43 = v58 & 0xFFFFFFFFFFFFFFBBLL | 4;
    }
    v58 = v43;
    goto LABEL_56;
  }
  -[BiometricKitXPCServerMesa cacheImageDB:](self, "cacheImageDB:", (char *)v12 + 26);
  -[BiometricKitXPCServerMesa getBioLockoutState:forUser:withClient:](self, "getBioLockoutState:forUser:withClient:", &v58, objc_msgSend(v14, "userID"), 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v58);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v33, CFSTR("BKMatchDetailLockoutState"));

  v34 = v12[5];
  if ((v34 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v35, CFSTR("BKMatchDetailUnlocked"));

    v34 = v12[5];
  }
  if ((v34 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v36, CFSTR("BKMatchDetailCredentialAdded"));

    v34 = v12[5];
  }
  if ((v34 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v37, CFSTR("BKMatchDetailResultIgnored"));

  }
  if ((objc_msgSend(v56, "forExtendEnrollment") & 1) == 0 && (v12[5] & 0x10) == 0)
  {
    objc_msgSend(v14, "setMatchCount:", objc_msgSend(v14, "matchCount") + 1);
    objc_msgSend(v14, "setMatchCountContinuous:", objc_msgSend(v14, "matchCountContinuous") + 1);
  }
LABEL_57:
  if (v57
    && objc_msgSend(v57, "delegateRegistered")
    && (objc_msgSend(v57, "clientAppIsBackground") & 1) == 0)
  {
    objc_msgSend(v57, "matchResult:details:", v14, v22);
    objc_msgSend(v55, "addObject:", v57);
  }
  -[NSMutableArray logMatchResultIdentity:withDetails:timestamp:forClients:](self->_vibrationPatterns, "logMatchResultIdentity:withDetails:timestamp:forClients:", v14, v22, v54, v55);
  +[BioLog y](_TtC5BKDM16BioLog, "y");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "logMatchResultWithIdentity:details:", v14, v22);

  -[__IOHIDEventSystemClient matchResult:withDictionary:](self->_hidClient, "matchResult:withDictionary:", v14, v22);
  -[BiometricKitXPCServerMesa checkDailyUpdate](self, "checkDailyUpdate");
  if ((objc_msgSend(v56, "suppressHapticFeedback") & 1) == 0 && (v12[5] & 0x10) == 0)
  {
    if (v14)
    {
      -[BiometricKitXPCServerMesa vibrate:](self, "vibrate:", 1);
      goto LABEL_97;
    }
    -[BiometricKitXPCServerMesa vibrate:](self, "vibrate:", 2);
    goto LABEL_96;
  }
LABEL_97:
  if (__osLogTrace)
    v52 = __osLogTrace;
  else
    v52 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v60 = v57;
    _os_log_impl(&dword_24B74E000, v52, OS_LOG_TYPE_DEBUG, "matchResult:timestamp: -> void (_ %@)\n", buf, 0xCu);
  }

}

- (void)matchEventMessage:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  int var1;
  unint64_t var0;
  $8ABEDCC9344CF5353139E2863656A016 *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  $8ABEDCC9344CF5353139E2863656A016 *v29;
  __int16 v30;
  _BYTE v31[18];
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
    {
      var1 = a3->var1;
      var0 = a3->var0;
    }
    else
    {
      var1 = 0;
      var0 = 0;
    }
    *(_DWORD *)buf = 134218496;
    v29 = a3;
    v30 = 1024;
    *(_DWORD *)v31 = var1;
    *(_WORD *)&v31[4] = 2048;
    *(_QWORD *)&v31[6] = var0;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEFAULT, "matchEventMessage: %p (r=%u, ts=%llu)\n", buf, 0x1Cu);
  }
  if (a3)
  {
    v8 = a3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer allClients](self, "allClients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "clientInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("BKClientType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "integerValue") == 2)
          {
            v17 = objc_msgSend(v14, "delegateRegistered");

            if (v17)
            {
              -[BiometricKitXPCServer createMatchEventDictionary:](self, "createMatchEventDictionary:", v8);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "statusMessage:details:", 500, v18);

              objc_msgSend(v21, "addObject:", v14);
            }
          }
          else
          {

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }
    -[NSMutableArray logStatusMessage:withData:timestamp:forClients:](self->_vibrationPatterns, "logStatusMessage:withData:timestamp:forClients:", 500, 0, 0, v21);

    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = v4;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v29 = ($8ABEDCC9344CF5353139E2863656A016 *)"matchEvent";
      v30 = 2048;
      *(_QWORD *)v31 = 0;
      *(_WORD *)&v31[8] = 2080;
      *(_QWORD *)&v31[10] = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v34 = 1024;
      v35 = 3758;
      _os_log_impl(&dword_24B74E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (__osLogTrace)
    v19 = __osLogTrace;
  else
    v19 = v4;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v19, OS_LOG_TYPE_DEBUG, "matchEventMessage: -> void\n", buf, 2u);
  }
}

- (void)statisticsMessage:(id *)a3
{
  -[__IOHIDEventSystemClient statisticsMessage:](self->_hidClient, "statisticsMessage:", a3);
}

- (void)statusMessage:(unsigned int)a3 withData:(id)a4 timestamp:(unint64_t)a5
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  int v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  int v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  NSObject *v43;
  int v44;
  uint64_t v45;
  unsigned int v47;
  unsigned int v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  _BYTE v61[14];
  __int16 v62;
  unint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v51 = a4;
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v61 = a3;
    *(_WORD *)&v61[4] = 2048;
    *(_QWORD *)&v61[6] = objc_msgSend(v51, "length");
    v62 = 2048;
    v63 = a5;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEFAULT, "statusMessage:withData:timestamp: %d %lu %llu\n", buf, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BiometricKitXPCServer ariadneSignposts](self, "ariadneSignposts"))
    kdebug_trace();
  -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "client");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  v9 = a3;
  v48 = a3 - 65;
  if (a3 - 65 >= 0xFFFFFFFE)
  {
    v10 = a3 == 63;
    if (BYTE2(self->_wakeGestureManager) != v10)
      BYTE2(self->_wakeGestureManager) = v10;
  }
  v11 = a3 - 100;
  if (v48 < 4)
  {
    BYTE1(self->_sensorInfo.structSize) = 0;
    -[BiometricKitXPCServerMesa disableHomeButton:](self, "disableHomeButton:", 0);
    v9 = a3;
LABEL_13:
    if (!v49)
      goto LABEL_21;
    v12 = objc_msgSend(v49, "delegateRegistered", v9) ^ 1;
    if (v48 <= 3)
      LOBYTE(v12) = 0;
    v9 = a3;
    if ((v12 & 1) != 0)
    {
LABEL_21:
      if (v11 > 0xFF)
        goto LABEL_24;
      -[BiometricKitXPCServerMesa enrollContinue](self, "enrollContinue", v9);
    }
    else
    {
      v47 = 0;
      if (a3 == 66)
      {
        v45 = 0x100000000;
        v44 = 0;
        goto LABEL_92;
      }
      if (a3 == 80)
      {
        v13 = 0;
        goto LABEL_86;
      }
      v13 = 0;
      if (a3 == 99)
        goto LABEL_86;
      objc_msgSend(v49, "statusMessage:");
      objc_msgSend(v52, "addObject:", v49);
    }
    v9 = a3;
LABEL_24:
    HIDWORD(v45) = 1;
    if ((v9 - 67) < 2 || (_DWORD)v9 == 65)
    {
      v47 = 1;
      v13 = 1;
      goto LABEL_86;
    }
    v13 = 0;
    v47 = 0;
    v44 = 0;
    LODWORD(v45) = 0;
    if ((_DWORD)v9 == 66)
      goto LABEL_92;
    goto LABEL_82;
  }
  if (a3 == 57)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_DEFAULT, "kBiometricKitStatusTemplateListNotUpdated\n", buf, 2u);
    }
    if ((unint64_t)objc_msgSend(v51, "length") >= 0xC8E)
    {
      v16 = *(id *)&self->_status;
      objc_sync_enter(v16);
      if (objc_msgSend(*(id *)&self->_status, "count"))
      {
        v17 = *(void **)&self->_status;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(v51), "bytes") + 3175));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectForKey:", v18);

      }
      objc_sync_exit(v16);

    }
  }
  else
  {
    if (a3 != 73)
    {
      if (v11 <= 0xFF)
        goto LABEL_13;
      goto LABEL_53;
    }
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_DEFAULT, "kBiometricKitStatusTemplateListUpdated\n", buf, 2u);
    }
    if ((unint64_t)objc_msgSend(v51, "length") >= 0xC82)
      -[BiometricKitXPCServerMesa templateUpdateMessage:](self, "templateUpdateMessage:", objc_msgSend(objc_retainAutorelease(v51), "bytes"));
    if (objc_msgSend(v50, "type") != 2 && objc_msgSend(v50, "type") != 1)
      -[BiometricKitXPCServer saveCatacombIfDirtyWithInterval:andDelay:](self, "saveCatacombIfDirtyWithInterval:andDelay:", 900.0, 5.0);
  }
  v9 = a3;
  if (v11 < 0x100)
    goto LABEL_13;
LABEL_53:
  if ((int)v9 <= 79)
  {
    if ((_DWORD)v9 != 51 && (_DWORD)v9 != 58)
      goto LABEL_56;
    goto LABEL_66;
  }
  if ((_DWORD)v9 != 99)
  {
    if ((_DWORD)v9 != 80)
    {
LABEL_56:
      if (v49)
      {
        if (objc_msgSend(v49, "delegateRegistered"))
        {
          if ((objc_msgSend(v49, "clientAppIsBackground") & 1) == 0)
          {
            objc_msgSend(v49, "clientInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("BKClientBundleIdentifier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.springboard"));

            if (!v21 || !-[BiometricKitXPCServerMesa shouldFilterStatusForSB:](self, "shouldFilterStatusForSB:", a3))
            {
              objc_msgSend(v49, "statusMessage:", a3);
              objc_msgSend(v52, "addObject:", v49);
            }
          }
        }
      }
      v9 = a3;
      if (a3 == 64)
      {
        v45 = 0;
        v47 = 0;
        v44 = 0;
        HIDWORD(self->_wakeGestureManager) = 64;
        *(_DWORD *)&self->_autoMatchStartedByHomeButton = 0;
        goto LABEL_92;
      }
      v13 = 0;
      v47 = 0;
LABEL_82:
      if ((_DWORD)v9 == 79)
      {
        v44 = 0;
        LODWORD(v45) = 1;
        LOBYTE(self->_wakeGestureManager) = 1;
LABEL_91:
        HIDWORD(v45) = v47;
        v47 = v13;
        goto LABEL_92;
      }
LABEL_86:
      if ((_DWORD)v9 == 54)
      {
        v44 = 0;
        LODWORD(v45) = 0;
        BYTE1(self->_wakeGestureManager) = 1;
      }
      else if ((_DWORD)v9 == 76)
      {
        LOBYTE(self->_wakeGestureManager) = 0;
        v44 = 1;
        LODWORD(v45) = 0;
      }
      else
      {
        v44 = 0;
        LODWORD(v45) = 0;
      }
      goto LABEL_91;
    }
LABEL_66:
    if (v49 && objc_msgSend(v49, "delegateRegistered") && a3 != 66 && a3 != 80)
    {
      objc_msgSend(v49, "statusMessage:", a3);
      objc_msgSend(v52, "addObject:", v49);
    }
    if (objc_msgSend(v50, "type") == 2 && objc_msgSend(v50, "forExtendEnrollment"))
      -[BiometricKitXPCServer saveCatacombIfDirtyWithInterval:andDelay:](self, "saveCatacombIfDirtyWithInterval:andDelay:", 0.0, 0.0);
    else
      -[BiometricKitXPCServer saveCatacombIfDirtyWithInterval:andDelay:](self, "saveCatacombIfDirtyWithInterval:andDelay:", 900.0, 5.0);
    v13 = a3 == 58 || a3 == 51;
    BYTE1(self->_sensorInfo.structSize) = 0;
    -[BiometricKitXPCServerMesa disableHomeButton:](self, "disableHomeButton:", 0);
    v47 = 1;
    v9 = a3;
    goto LABEL_82;
  }
  v44 = 0;
  v45 = 0x100000000;
  v47 = 0;
LABEL_92:
  if (LOBYTE(self->_wakeGestureManager))
  {
    if (v48 < 0xFFFFFFFE)
      goto LABEL_112;
  }
  else if (v48 < 0xFFFFFFFE || !BYTE1(self->_wakeGestureManager))
  {
    goto LABEL_112;
  }
  if (!v49)
  {
LABEL_98:
    -[BiometricKitXPCServer allClients](self, "allClients");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v56 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v27, "clientInfo");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("BKClientBundleIdentifier"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.springboard"))
            && objc_msgSend(v27, "delegateRegistered"))
          {
            v30 = objc_msgSend(v27, "clientAppIsBackground");

            if ((v30 & 1) == 0
              && !-[BiometricKitXPCServerMesa shouldFilterStatusForSB:](self, "shouldFilterStatusForSB:", a3))
            {
              objc_msgSend(v27, "statusMessage:", a3);
              objc_msgSend(v52, "addObject:", v27);
            }
          }
          else
          {

          }
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v24);
    }

    v9 = a3;
    goto LABEL_115;
  }
LABEL_112:
  if ((_DWORD)v9 == 64)
  {
    if (HIDWORD(self->_wakeGestureManager) != 63)
      goto LABEL_120;
    goto LABEL_98;
  }
LABEL_115:
  if ((v9 - 81) <= 0xB && ((1 << (v9 - 81)) & 0x807) != 0)
  {
    v31 = objc_msgSend(v50, "type");
    v9 = a3;
    if (v31 == 2)
    {
      v32 = objc_msgSend(v50, "suppressHapticFeedback", a3);
      v9 = a3;
      if ((v32 & 1) == 0)
      {
        -[BiometricKitXPCServerMesa vibrate:](self, "vibrate:", 3);
        v9 = a3;
      }
    }
  }
LABEL_120:
  if (HIDWORD(v45))
  {
    -[BiometricKitXPCServer bioOpsQueue](self, "bioOpsQueue", v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v33);
    -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v34);
    if (a3 - 66 <= 0x21 && ((1 << (a3 - 66)) & 0x200004001) != 0)
    {
      -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "client");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "status");

      if (v37)
      {
        v41 = objc_msgSend(v37, "delegateRegistered") ^ 1;
        if (v48 <= 3)
          LOBYTE(v41) = 0;
        if ((v41 & 1) == 0 && v40 != 3)
        {
          objc_msgSend(v37, "statusMessage:", a3);
          objc_msgSend(v52, "addObject:", v37);
        }
      }
    }
    else
    {
      v37 = v49;
    }
    -[BiometricKitXPCServer switchToNextBioOperation:](self, "switchToNextBioOperation:", v47);
    objc_sync_exit(v34);

    objc_sync_exit(v33);
  }
  else
  {
    if ((_DWORD)v45)
    {
      -[BiometricKitXPCServer updateActiveOperationNotificationWithOverride:](self, "updateActiveOperationNotificationWithOverride:", 2);
    }
    else
    {
      if (!v44)
      {
        v37 = v49;
        goto LABEL_138;
      }
      -[BiometricKitXPCServer updateActiveOperationNotification](self, "updateActiveOperationNotification", v9);
    }
    v37 = v49;
  }
  v9 = a3;
LABEL_138:
  -[NSMutableArray logStatusMessage:withData:timestamp:forClients:](self->_vibrationPatterns, "logStatusMessage:withData:timestamp:forClients:", v9, v51, a5, v52);
  +[BioLog y](_TtC5BKDM16BioLog, "y");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "logStatusMessage:data:", a3, v51);

  -[__IOHIDEventSystemClient statusMessage:withData:](self->_hidClient, "statusMessage:withData:", a3, v51);
  if (__osLogTrace)
    v43 = __osLogTrace;
  else
    v43 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v61 = v37;
    _os_log_impl(&dword_24B74E000, v43, OS_LOG_TYPE_DEBUG, "statusMessage:withData:timestamp: -> void (_ %@)\n", buf, 0xCu);
  }

}

- (void)templateUpdateMessage:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  $1FDECCF39F600D9147443E9CFC76EB4D *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v29 = a3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "templateUpdateMessage: %p\n", buf, 0xCu);
  }
  if (a3)
  {
    -[BiometricKitXPCServer allClients](self, "allClients");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v6);
    -[BiometricKitXPCServer activeBioOpsQueue](self, "activeBioOpsQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v6);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->var0.var1);
    -[BiometricKitXPCServer getIdentityObjectByUserID:UUID:](self, "getIdentityObjectByUserID:UUID:", a3->var0.var0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSMutableArray updateIdentity:](self->_vibrationPatterns, "updateIdentity:", v10);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &a3->var2, 3080);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &a3->var3, 98);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = CFSTR("BKTemplateUpdateDetailTopologyData");
      v26[1] = CFSTR("BKTemplateUpdateDetailImageMetadata");
      v27[0] = v19;
      v27[1] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BiometricKitXPCServerMesa updateImageDB:templateUpdateInfo:](self, "updateImageDB:templateUpdateInfo:", v10, a3);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v20;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v16, "delegateRegistered")
              && (objc_msgSend(v16, "clientAppIsBackground") & 1) == 0)
            {
              objc_msgSend(v16, "templateUpdate:details:", v10, v11);
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v13);
      }

      if (objc_msgSend(v8, "type") != 2 || (objc_msgSend(v8, "forExtendEnrollment") & 1) == 0)
        objc_msgSend(v10, "setUpdateCount:", objc_msgSend(v10, "updateCount") + 1);
      -[__IOHIDEventSystemClient templateUpdate:withDictionary:](self->_hidClient, "templateUpdate:withDictionary:", v10, v11);

    }
  }
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_DEBUG, "templateUpdateMessage: -> void\n", buf, 2u);
  }
}

- (int)serviceMatchCommon
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  NSObject *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v18;
  int v19;
  int v20;
  int v21;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  int v37;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = -[BiometricKitXPCServerMesa getCommProtocolVersion](self, "getCommProtocolVersion");
  if (v3)
  {
    v23 = v3;
    v24 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v40 = "err == 0 ";
      v41 = 2048;
      v42 = v23;
      v43 = 2080;
      v44 = "";
      v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v47 = 1024;
      v48 = 4418;
      _os_log_impl(&dword_24B74E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  v4 = -[BiometricKitXPCServerMesa setAppleMesaSEPLoggingLevel](self, "setAppleMesaSEPLoggingLevel");
  if (v4)
  {
    v25 = v4;
    v26 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v40 = "err == 0 ";
      v41 = 2048;
      v42 = v25;
      v43 = 2080;
      v44 = "";
      v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v47 = 1024;
      v48 = 4422;
      _os_log_impl(&dword_24B74E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  v5 = -[BiometricKitXPCServer cacheCatacombInfo](self, "cacheCatacombInfo");
  if (v5)
  {
    v27 = v5;
    v28 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v40 = "err == 0 ";
      v41 = 2048;
      v42 = v27;
      v43 = 2080;
      v44 = "";
      v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v47 = 1024;
      v48 = 4431;
      _os_log_impl(&dword_24B74E000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  v6 = -[BiometricKitXPCServerMesa checkSensorReadiness](self, "checkSensorReadiness");
  if (v6)
  {
    v29 = v6;
    v30 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v40 = "err == 0 ";
      v41 = 2048;
      v42 = v29;
      v43 = 2080;
      v44 = "";
      v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v47 = 1024;
      v48 = 4435;
      _os_log_impl(&dword_24B74E000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (LOBYTE(self->_dailyUpdateTimer))
  {
    v7 = -[BiometricKitXPCServerMesa initSensor](self, "initSensor");
    if (v7)
    {
      v8 = v7;
      v9 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = "err == 0 ";
        v41 = 2048;
        v42 = v8;
        v43 = 2080;
        v44 = "";
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v47 = 1024;
        v48 = 4441;
        _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "Sensor not ready yet!\n", buf, 2u);
    }
    v11 = dispatch_time(0, 10000000000);
    dispatch_get_global_queue(21, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__BiometricKitXPCServerMesa_serviceMatchCommon__block_invoke;
    block[3] = &unk_251CA06E0;
    block[4] = self;
    dispatch_after(v11, v12, block);

  }
  v13 = -[BiometricKitXPCServerMesa performCancelCommand](self, "performCancelCommand");
  if (v13)
  {
    v31 = v13;
    v32 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v40 = "err == 0 ";
      v41 = 2048;
      v42 = v31;
      v43 = 2080;
      v44 = "";
      v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v47 = 1024;
      v48 = 4459;
      _os_log_impl(&dword_24B74E000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if ((isEphemeralMultiUser() & 1) != 0)
  {
    -[BiometricKitXPCServer syncTemplateListForUser:](self, "syncTemplateListForUser:", 0xFFFFFFFFLL);
    -[BiometricKitXPCServer setCatacombFileAccessed:](self, "setCatacombFileAccessed:", 1);
    goto LABEL_29;
  }
  if (-[BiometricKitXPCServer isClassCFileAccessible](self, "isClassCFileAccessible"))
  {
    -[BiometricKitXPCServer setCatacombFileAccessed:](self, "setCatacombFileAccessed:", 1);
    v14 = -[BiometricKitXPCServerMesa restoreAndSyncTemplates](self, "restoreAndSyncTemplates");
    if (v14)
    {
      v15 = v14;
      v16 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = "err == 0 ";
        v41 = 2048;
        v42 = v15;
        v43 = 2080;
        v44 = "";
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v47 = 1024;
        v48 = 4476;
LABEL_79:
        _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__firstUnlockCallback, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[BiometricKitXPCServer setTemplatesAtBoot:](self, "setTemplatesAtBoot:", -[BiometricKitXPCServerMesa templatesExistAtBoot](self, "templatesExistAtBoot"));
    v18 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 30, -[BiometricKitXPCServer templatesAtBoot](self, "templatesAtBoot"), 0, 0, 0, 0);
    if (v18)
    {
      v37 = v18;
      v16 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = "err == 0 ";
        v41 = 2048;
        v42 = v37;
        v43 = 2080;
        v44 = "";
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v47 = 1024;
        v48 = 4494;
        goto LABEL_79;
      }
    }
  }
LABEL_29:
  v19 = -[BiometricKitXPCServer displayStateChanged:](self, "displayStateChanged:", -[BiometricKitXPCServer isDisplayOn](self, "isDisplayOn"));
  if (v19)
  {
    v33 = v19;
    v34 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v40 = "err == 0 ";
      v41 = 2048;
      v42 = v33;
      v43 = 2080;
      v44 = "";
      v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v47 = 1024;
      v48 = 4506;
      _os_log_impl(&dword_24B74E000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  v20 = -[BiometricKitXPCServerMesa systemSleepStateChanged:](self, "systemSleepStateChanged:", 0);
  if (v20)
  {
    v35 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v40 = "err == 0 ";
      v41 = 2048;
      v42 = v20;
      v43 = 2080;
      v44 = "";
      v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v47 = 1024;
      v48 = 4510;
      _os_log_impl(&dword_24B74E000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  v21 = OSThermalNotificationCurrentLevel();
  if ((v21 & 0x80000000) == 0)
  {
    v20 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 24, (unsigned __int16)v21, 0, 0, 0, 0);
    if (v20)
    {
      if (__osLog)
        v36 = __osLog;
      else
        v36 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = "err == 0 ";
        v41 = 2048;
        v42 = v20;
        v43 = 2080;
        v44 = "";
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v47 = 1024;
        v48 = 4518;
        _os_log_impl(&dword_24B74E000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  self->_log = (BioLogLegacy *)-[BiometricKitXPCServerMesa loggingType](self, "loggingType");
  -[__IOHIDEventSystemClient serviceMatch](self->_hidClient, "serviceMatch");
  return v20;
}

uint64_t __47__BiometricKitXPCServerMesa_serviceMatchCommon__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 424))
  {
    v1 = result;
    if (__osLog)
      v2 = __osLog;
    else
      v2 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = 136316162;
      v4 = "self->_sensorReady";
      v5 = 2048;
      v6 = 0;
      v7 = 2080;
      v8 = "";
      v9 = 2080;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v11 = 1024;
      v12 = 4448;
      _os_log_impl(&dword_24B74E000, v2, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v3, 0x30u);
    }
    result = *(_QWORD *)(v1 + 32);
    if (!*(_BYTE *)(result + 424))
      return objc_msgSend((id)result, "reportMesaHardwarePass:", 0);
  }
  return result;
}

- (void)serviceMatchCommonFinale
{
  NSObject *v3;
  uint8_t v4[16];

  -[BiometricKitXPCServer postGeneralLockoutStateNotification](self, "postGeneralLockoutStateNotification");
  -[BiometricKitXPCServer updateEnrollmentChangedNotification:](self, "updateEnrollmentChangedNotification:", 1);
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEFAULT, "serviceMatch initialized\n", v4, 2u);
  }
}

- (void)serviceMatchWithIterator:(unsigned int)a3 context:(void *)a4
{
  io_object_t v7;
  io_service_t v8;
  task_port_t *v9;
  kern_return_t v10;
  kern_return_t v11;
  kern_return_t v12;
  NSObject *v13;
  kern_return_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *log;
  NSObject *loga;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = IOIteratorNext(a3);
    if (v7)
    {
      v8 = v7;
      v9 = (task_port_t *)MEMORY[0x24BDAEC58];
      do
      {
        v10 = IOServiceOpen(v8, *v9, 0, (io_connect_t *)&self->super._reporter + 1);
        if (v10)
        {
          v12 = v10;
          v13 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
          log = v13;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v20 = "err == 0 ";
            v21 = 2048;
            v22 = v12;
            v23 = 2080;
            v24 = "";
            v25 = 2080;
            v26 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
            v27 = 1024;
            v28 = 4647;
            _os_log_impl(&dword_24B74E000, log, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        self->_services = 0;
        v11 = IOServiceAddInterestNotification(-[BiometricKitXPCServer notifyport](self, "notifyport"), v8, "IOGeneralInterest", (IOServiceInterestCallback)__serviceStatus, a4, &self->_services);
        if (v11)
        {
          v14 = v11;
          v15 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
          loga = v15;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v20 = "err == 0 ";
            v21 = 2048;
            v22 = v14;
            v23 = 2080;
            v24 = "";
            v25 = 2080;
            v26 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
            v27 = 1024;
            v28 = 4656;
            _os_log_impl(&dword_24B74E000, loga, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        IOObjectRelease(v8);
        v8 = IOIteratorNext(a3);
      }
      while (v8);
    }
  }
  if (HIDWORD(self->super._reporter))
    goto LABEL_19;
  v16 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v20 = "_connect";
    v21 = 2048;
    v22 = 0;
    v23 = 2080;
    v24 = "";
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v27 = 1024;
    v28 = 4660;
    _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  if (HIDWORD(self->super._reporter))
  {
LABEL_19:
    -[BiometricKitXPCServerMesa serviceMatchCommon](self, "serviceMatchCommon");
    -[BiometricKitXPCServerMesa serviceMatchCommonFinale](self, "serviceMatchCommonFinale");
  }
  -[BiometricKitXPCServerMesa updateBioLogState](self, "updateBioLogState");
}

- (int)loadCalibrationData
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  uint64_t v25;
  unsigned int v26;
  NSObject *v27;
  void *v28;
  int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  NSObject *v37;
  const char *v38;
  NSObject *v40;
  BiometricKitXPCServerMesa *v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[3];
  uint8_t v49[128];
  uint8_t buf[4];
  _BYTE v51[20];
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEFAULT, "loadCalibrationData\n", buf, 2u);
  }
  memset(v48, 0, 23);
  v5 = -[BiometricKitXPCServerMesa performGetBiometrickitdInfoCommand:](self, "performGetBiometrickitdInfoCommand:", v48);
  if (!v5)
  {
    if (BYTE6(v48[2]))
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      goto LABEL_103;
    }
    getBootArgs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v41 = self;
      v42 = v9;
      objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(" "));
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 1;
        v14 = *(_QWORD *)v45;
        v15 = 1;
        v16 = 1;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v45 != v14)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v18, "rangeOfString:", CFSTR("mesa_syscfg"));
            if (v19 && objc_msgSend(v18, "hasSuffix:", CFSTR("0")))
              v16 = 0;
            objc_msgSend(v18, "rangeOfString:", CFSTR("mesa_fdr"));
            if (v20 && objc_msgSend(v18, "hasSuffix:", CFSTR("0")))
              v15 = 0;
            objc_msgSend(v18, "rangeOfString:", CFSTR("mesa_eeprom"));
            if (v21 && objc_msgSend(v18, "hasSuffix:", CFSTR("0")))
              v13 = 0;
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v12);
      }
      else
      {
        v13 = 1;
        v15 = 1;
        v16 = 1;
      }

      v22 = (v13 & 1) == 0;
      v23 = (v15 & 1) == 0;
      v24 = (v16 & 1) == 0;
      self = v41;
      v10 = v42;
    }
    else
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
    }
    v8 = -536870212;
    if (isInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", CFSTR("/var/root/mesa_calibration.bin"));
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v6 = (void *)v25;
        v7 = 5;
        v26 = -[BiometricKitXPCServerMesa setCalibrationData:source:](self, "setCalibrationData:source:", v25, 5);
        v8 = v26;
        if (v26 <= 0x3C && ((1 << v26) & 0x1200000000000010) != 0)
        {
          v3 = MEMORY[0x24BDACB70];
          if (__osLog)
            v27 = __osLog;
          else
            v27 = MEMORY[0x24BDACB70];
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_102;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v51 = "err != 4 && err != 57 && err != 60";
          *(_WORD *)&v51[8] = 2048;
          *(_QWORD *)&v51[10] = 0;
          *(_WORD *)&v51[18] = 2080;
          v52 = "";
          v53 = 2080;
          v54 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
          v55 = 1024;
          v56 = 4756;
          goto LABEL_101;
        }
        v28 = v6;
      }
      else
      {
        v28 = 0;
        v7 = 5;
      }
    }
    else
    {
      v28 = 0;
      v7 = 0;
    }
    if (v28 != 0 && v8 == 0)
      v29 = 0;
    else
      v29 = v8;
    if (v28 != 0 && v8 == 0 || v23)
    {
      v8 = v29;
    }
    else
    {
      -[BiometricKitXPCServerMesa getFDR3CalibrationData](self, "getFDR3CalibrationData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = 6;
        v30 = -[BiometricKitXPCServerMesa setCalibrationData:source:](self, "setCalibrationData:source:", v6, 6);
        v8 = v30;
        if (v30 <= 0x3C && ((1 << v30) & 0x1200000000000010) != 0)
        {
          v3 = MEMORY[0x24BDACB70];
          if (__osLog)
            v27 = __osLog;
          else
            v27 = MEMORY[0x24BDACB70];
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_102;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v51 = "err != 4 && err != 57 && err != 60";
          *(_WORD *)&v51[8] = 2048;
          *(_QWORD *)&v51[10] = 0;
          *(_WORD *)&v51[18] = 2080;
          v52 = "";
          v53 = 2080;
          v54 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
          v55 = 1024;
          v56 = 4772;
          goto LABEL_101;
        }
        v28 = v6;
      }
      else
      {
        v28 = 0;
        v7 = 6;
      }
    }
    if (v28 != 0 && v8 == 0)
      v31 = 0;
    else
      v31 = v8;
    if (v28 != 0 && v8 == 0 || v23)
    {
      v8 = v31;
    }
    else
    {
      -[BiometricKitXPCServerMesa getFDRCalibrationData](self, "getFDRCalibrationData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = 3;
        v32 = -[BiometricKitXPCServerMesa setCalibrationData:source:](self, "setCalibrationData:source:", v6, 3);
        v8 = v32;
        if (v32 <= 0x3C && ((1 << v32) & 0x1200000000000010) != 0)
        {
          v3 = MEMORY[0x24BDACB70];
          if (__osLog)
            v27 = __osLog;
          else
            v27 = MEMORY[0x24BDACB70];
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_102;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v51 = "err != 4 && err != 57 && err != 60";
          *(_WORD *)&v51[8] = 2048;
          *(_QWORD *)&v51[10] = 0;
          *(_WORD *)&v51[18] = 2080;
          v52 = "";
          v53 = 2080;
          v54 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
          v55 = 1024;
          v56 = 4786;
          goto LABEL_101;
        }
        v28 = v6;
      }
      else
      {
        v28 = 0;
        v7 = 3;
      }
    }
    if (v28 != 0 && v8 == 0)
      v33 = 0;
    else
      v33 = v8;
    if (v28 != 0 && v8 == 0 || v24)
    {
      v8 = v33;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "getSysCfgCalibrationData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = 1;
        v34 = -[BiometricKitXPCServerMesa setCalibrationData:source:](self, "setCalibrationData:source:", v6, 1);
        v8 = v34;
        if (v34 <= 0x3C && ((1 << v34) & 0x1200000000000010) != 0)
        {
          v3 = MEMORY[0x24BDACB70];
          if (__osLog)
            v27 = __osLog;
          else
            v27 = MEMORY[0x24BDACB70];
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_102;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v51 = "err != 4 && err != 57 && err != 60";
          *(_WORD *)&v51[8] = 2048;
          *(_QWORD *)&v51[10] = 0;
          *(_WORD *)&v51[18] = 2080;
          v52 = "";
          v53 = 2080;
          v54 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
          v55 = 1024;
          v56 = 4818;
          goto LABEL_101;
        }
        v28 = v6;
      }
      else
      {
        v28 = 0;
        v7 = 1;
      }
    }
    if (v28 != 0 && v8 == 0)
      v35 = 0;
    else
      v35 = v8;
    if (v28 != 0 && v8 == 0 || v22)
    {
      v6 = v28;
      v8 = v35;
      v3 = MEMORY[0x24BDACB70];
LABEL_102:

      goto LABEL_103;
    }
    -[BiometricKitXPCServerMesa getEEPROMCalibrationData](self, "getEEPROMCalibrationData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = MEMORY[0x24BDACB70];
    v7 = 2;
    if (!v6)
      goto LABEL_102;
    v36 = -[BiometricKitXPCServerMesa setCalibrationData:source:](self, "setCalibrationData:source:", v6, 2);
    v8 = v36;
    if (v36 > 0x3C || ((1 << v36) & 0x1200000000000010) == 0)
      goto LABEL_102;
    v27 = (__osLog ? __osLog : v3);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_102;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v51 = "err != 4 && err != 57 && err != 60";
    *(_WORD *)&v51[8] = 2048;
    *(_QWORD *)&v51[10] = 0;
    *(_WORD *)&v51[18] = 2080;
    v52 = "";
    v53 = 2080;
    v54 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v55 = 1024;
    v56 = 4834;
LABEL_101:
    _os_log_impl(&dword_24B74E000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_102;
  }
  v8 = v5;
  if (__osLog)
    v40 = __osLog;
  else
    v40 = v3;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v51 = "err == 0 ";
    *(_WORD *)&v51[8] = 2048;
    *(_QWORD *)&v51[10] = v8;
    *(_WORD *)&v51[18] = 2080;
    v52 = "";
    v53 = 2080;
    v54 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v55 = 1024;
    v56 = 4710;
    _os_log_impl(&dword_24B74E000, v40, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v6 = 0;
  v7 = 0;
LABEL_103:
  if (__osLogTrace)
    v37 = __osLogTrace;
  else
    v37 = v3;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = "No calibration data loaded.";
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v51 = v8;
    if (!v8)
      v38 = "";
    *(_WORD *)&v51[4] = 2080;
    *(_QWORD *)&v51[6] = v38;
    *(_WORD *)&v51[14] = 1024;
    *(_DWORD *)&v51[16] = v7;
    _os_log_impl(&dword_24B74E000, v37, OS_LOG_TYPE_DEFAULT, "loadCalibrationData -> %{errno}d %s (calBLOBSource: %d)\n", buf, 0x18u);
  }

  return v8;
}

- (int)loadMSRkData
{
  uint64_t v3;
  NSObject *v4;
  unsigned int v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEFAULT, "loadMSRkData\n", (uint8_t *)&v14, 2u);
  }
  v5 = -[BiometricKitXPCServerMesa provisioningState](self, "provisioningState");
  if (__osLog)
    v6 = __osLog;
  else
    v6 = v3;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 67109120;
    LODWORD(v15) = v5;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEFAULT, "loadMSRkData: provisioningState: %d\n", (uint8_t *)&v14, 8u);
  }
  v7 = 0;
  v8 = 0;
  if (v5 <= 0xB && ((1 << v5) & 0x803) != 0)
  {
    -[BiometricKitXPCServerMesa getFDRMSRkData](self, "getFDRMSRkData");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = (void *)v9;
      v7 = -[BiometricKitXPCServerMesa setMSRkData:](self, "setMSRkData:", v9);
      if (v7)
      {
        v10 = (__osLog ? __osLog : v3);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v14 = 136316162;
          v15 = "err == 0 ";
          v16 = 2048;
          v17 = v7;
          v18 = 2080;
          v19 = "";
          v20 = 2080;
          v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
          v22 = 1024;
          v23 = 4877;
          _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
        }
      }
    }
    else
    {
      if (__osLog)
        v11 = __osLog;
      else
        v11 = v3;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_DEFAULT, "loadMSRkData -> No MSRk data loaded.\n", (uint8_t *)&v14, 2u);
      }
      v8 = 0;
      v7 = 0;
    }
  }
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = v3;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 67109120;
    LODWORD(v15) = v7;
    _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_DEFAULT, "loadMSRkData -> %{errno}d\n", (uint8_t *)&v14, 8u);
  }

  return v7;
}

- (unint64_t)sizeOfLegacyCatacomb
{
  int v2;
  int v3;
  off_t st_size;
  NSObject *v5;
  stat v7;
  uint64_t v8;
  uint8_t buf[4];
  off_t v10;
  char v11[1024];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  bzero(v11, 0x400uLL);
  v8 = 1024;
  memset(&v7, 0, sizeof(v7));
  if (CatacombPathForFile("TemplateList.cat", &v8, v11)
    || (v2 = open_dprotected_np(v11, 0, 0, 1), v2 == -1))
  {
    st_size = 0;
  }
  else
  {
    v3 = v2;
    if (fstat(v2, &v7))
      st_size = 0;
    else
      st_size = v7.st_size;
    close(v3);
  }
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = st_size;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEFAULT, "sizeOfLegacyCatacomb -> %zu\n", buf, 0xCu);
  }
  return st_size;
}

- (BOOL)templatesExistAtBoot
{
  _BOOL4 v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)BiometricKitXPCServerMesa;
  v3 = -[BiometricKitXPCServer templatesExistAtBoot](&v6, sel_templatesExistAtBoot)
    || -[BiometricKitXPCServerMesa sizeOfLegacyCatacomb](self, "sizeOfLegacyCatacomb") > 0x400;
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v3;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEFAULT, "templatesExistAtBoot -> %d\n", buf, 8u);
  }
  return v3;
}

- (int)serviceStatus:(unsigned int)a3 version:(unsigned int)a4 ordinal:(unint64_t)a5 data:(id)a6 timestamp:(unint64_t)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL8 v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint8_t *v45;
  void *hidClient;
  void *v47;
  void *v48;
  unsigned int *v49;
  unsigned int *v50;
  unsigned int v51;
  void *v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  const char *v56;
  NSObject *v57;
  unsigned int v58;
  int v59;
  void *v60;
  int v61;
  NSObject *v62;
  unsigned int *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  BiometricKitXPCServerMesa *v85;
  unint64_t v86;
  NSObject *v87;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v95;
  objc_super v96;
  objc_super v97;
  uint8_t buf[4];
  _BYTE v99[10];
  _BYTE v100[10];
  _BYTE v101[10];
  _BYTE v102[10];
  int v103;
  uint64_t v104;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v104 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  v13 = MEMORY[0x24BDACB70];
  if (__osLog)
    v14 = __osLog;
  else
    v14 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v99 = v10;
    *(_WORD *)&v99[4] = 1024;
    *(_DWORD *)&v99[6] = v9;
    *(_WORD *)v100 = 2048;
    *(_QWORD *)&v100[2] = a5;
    *(_WORD *)v101 = 2112;
    *(_QWORD *)&v101[2] = v12;
    *(_WORD *)v102 = 2048;
    *(_QWORD *)&v102[2] = a7;
    _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_DEBUG, "serviceStatus:version:ordinal:data:timestamp: 0x%x 0x%x 0x%llx %@ %llu\n", buf, 0x2Cu);
  }
  switch(v10)
  {
    case 0xE3FF8001:
      if (a5 - 57 > 0x29)
        goto LABEL_131;
      if (((1 << (a5 - 57)) & 0x340F0000000) != 0)
      {
        if ((_DWORD)v9 == 1)
        {
          v17 = v12;
          if ((unint64_t)objc_msgSend(v17, "length") <= 0x70)
          {
            if (__osLog)
              v95 = __osLog;
            else
              v95 = v13;
            if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              goto LABEL_293;
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)v99 = "[msgDataV1 length] >= sizeof(*srcV1)";
            *(_WORD *)&v99[8] = 2048;
            *(_QWORD *)v100 = 0;
            *(_WORD *)&v100[8] = 2080;
            *(_QWORD *)v101 = "";
            *(_WORD *)&v101[8] = 2080;
            *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biom"
                              "etricKitXPCServerMesa.m";
            *(_WORD *)&v102[8] = 1024;
            v103 = 5138;
          }
          else
          {
            v18 = objc_retainAutorelease(v17);
            v19 = objc_msgSend(v18, "bytes");
            v20 = objc_msgSend(v18, "length");
            if (v20 - 113 == *(_DWORD *)(v19 + 109))
            {
              objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v20 + 24);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v12 = objc_retainAutorelease(v21);
                v22 = objc_msgSend(v12, "mutableBytes");
                v23 = *(_OWORD *)(v19 + 16);
                *(_OWORD *)v22 = *(_OWORD *)v19;
                *(_OWORD *)(v22 + 16) = v23;
                v25 = *(_OWORD *)(v19 + 48);
                v24 = *(_OWORD *)(v19 + 64);
                v26 = *(_OWORD *)(v19 + 32);
                *(_DWORD *)(v22 + 79) = *(_DWORD *)(v19 + 79);
                *(_OWORD *)(v22 + 48) = v25;
                *(_OWORD *)(v22 + 64) = v24;
                *(_OWORD *)(v22 + 32) = v26;
                v27 = *(_OWORD *)(v19 + 83);
                *(_OWORD *)(v22 + 121) = *(_OWORD *)(v19 + 97);
                *(_OWORD *)(v22 + 107) = v27;
                memcpy((void *)(v22 + 137), (const void *)(v19 + 113), *(unsigned int *)(v22 + 133));
LABEL_18:

LABEL_116:
                v85 = self;
                v86 = a5;
LABEL_117:
                -[BiometricKitXPCServerMesa statusMessage:withData:timestamp:](v85, "statusMessage:withData:timestamp:", v86, v12, a7);
                goto LABEL_118;
              }
              if (__osLog)
                v95 = __osLog;
              else
                v95 = v13;
              if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              {
LABEL_293:
                v12 = 0;
                goto LABEL_18;
              }
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)v99 = "result";
              *(_WORD *)&v99[8] = 2048;
              *(_QWORD *)v100 = 0;
              *(_WORD *)&v100[8] = 2080;
              *(_QWORD *)v101 = "";
              *(_WORD *)&v101[8] = 2080;
              *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Bi"
                                "ometricKitXPCServerMesa.m";
              *(_WORD *)&v102[8] = 1024;
              v103 = 5143;
            }
            else
            {
              if (__osLog)
                v95 = __osLog;
              else
                v95 = v13;
              if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
                goto LABEL_293;
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)v99 = "([msgDataV1 length] - sizeof(*srcV1)) == srcV1->imgDeblurringInfoSize";
              *(_WORD *)&v99[8] = 2048;
              *(_QWORD *)v100 = 0;
              *(_WORD *)&v100[8] = 2080;
              *(_QWORD *)v101 = "";
              *(_WORD *)&v101[8] = 2080;
              *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Bi"
                                "ometricKitXPCServerMesa.m";
              *(_WORD *)&v102[8] = 1024;
              v103 = 5140;
            }
          }
          _os_log_impl(&dword_24B74E000, v95, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          goto LABEL_293;
        }
        if ((_DWORD)v9 == 2)
          goto LABEL_116;
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          goto LABEL_276;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v99 = "msgVersion == 2";
        *(_WORD *)&v99[8] = 2048;
        *(_QWORD *)v100 = 0;
        *(_WORD *)&v100[8] = 2080;
        *(_QWORD *)v101 = "";
        *(_WORD *)&v101[8] = 2080;
        *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
        *(_WORD *)&v102[8] = 1024;
        v103 = 5425;
        goto LABEL_275;
      }
      if (a5 == 57)
      {
        if ((_DWORD)v9 == 1)
        {
          convertBgopsResultFromV1(v12);
          v90 = objc_claimAutoreleasedReturnValue();

          v12 = (id)v90;
        }
        else if ((_DWORD)v9 != 2)
        {
          if (__osLog)
            v92 = __osLog;
          else
            v92 = v13;
          if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            goto LABEL_276;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "msgVersion == 2";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5409;
          goto LABEL_275;
        }
        v85 = self;
        v86 = 57;
        goto LABEL_117;
      }
      if (a5 == 73)
      {
        if ((_DWORD)v9 == 1)
        {
          convertTemplateUpdateInfoFromV1(v12);
          v89 = objc_claimAutoreleasedReturnValue();

          v12 = (id)v89;
        }
        else if ((_DWORD)v9 != 2)
        {
          if (__osLog)
            v92 = __osLog;
          else
            v92 = v13;
          if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            goto LABEL_276;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "msgVersion == 2";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5399;
LABEL_275:
          _os_log_impl(&dword_24B74E000, v92, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_276:
          v61 = 263;
          goto LABEL_119;
        }
        v85 = self;
        v86 = 73;
        goto LABEL_117;
      }
LABEL_131:
      if (a5 - 100 <= 0xFF)
      {
        if ((_DWORD)v9 == 1)
        {
          convertEnrollmentInfoFromV1(v12);
          v91 = objc_claimAutoreleasedReturnValue();

          v12 = (id)v91;
          goto LABEL_116;
        }
        if ((_DWORD)v9 == 2)
          goto LABEL_116;
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          goto LABEL_276;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v99 = "msgVersion == 2";
        *(_WORD *)&v99[8] = 2048;
        *(_QWORD *)v100 = 0;
        *(_WORD *)&v100[8] = 2080;
        *(_QWORD *)v101 = "";
        *(_WORD *)&v101[8] = 2080;
        *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
        *(_WORD *)&v102[8] = 1024;
        v103 = 5436;
        goto LABEL_275;
      }
      v97.receiver = self;
      v97.super_class = (Class)BiometricKitXPCServerMesa;
      v61 = -[BiometricKitXPCServer serviceStatus:version:ordinal:data:timestamp:](&v97, sel_serviceStatus_version_ordinal_data_timestamp_, 3825172481, v9, a5, v12, a7);
      if (v61)
      {
        v62 = (__osLog ? __osLog : v13);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "err == 0 ";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = v61;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5443;
LABEL_269:
          _os_log_impl(&dword_24B74E000, v62, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
LABEL_119:
      if (__osLog)
        v87 = __osLog;
      else
        v87 = v13;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v99 = v61;
        _os_log_impl(&dword_24B74E000, v87, OS_LOG_TYPE_DEBUG, "serviceStatus:type:inValue: -> 0x%x\n", buf, 8u);
      }

      return v61;
    case 0xE3FF8002:
      if ((_DWORD)v9 != 1)
      {
        if ((_DWORD)v9 != 2)
        {
          if (__osLog)
            v92 = __osLog;
          else
            v92 = v13;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)v99 = "msgVersion == 2";
            *(_WORD *)&v99[8] = 2048;
            *(_QWORD *)v100 = 0;
            *(_WORD *)&v100[8] = 2080;
            *(_QWORD *)v101 = "";
            *(_WORD *)&v101[8] = 2080;
            *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biom"
                              "etricKitXPCServerMesa.m";
            *(_WORD *)&v102[8] = 1024;
            v103 = 5221;
            goto LABEL_275;
          }
          goto LABEL_276;
        }
LABEL_82:
        if ((unint64_t)objc_msgSend(v12, "length") > 0xC87)
        {
          -[BiometricKitXPCServerMesa matchResult:timestamp:](self, "matchResult:timestamp:", v12, a7);
          goto LABEL_118;
        }
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "[msgData length] >= sizeof(message_match_node_v2_t)";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5223;
          goto LABEL_275;
        }
        goto LABEL_276;
      }
      v28 = v12;
      if ((unint64_t)objc_msgSend(v28, "length") <= 0xC6F)
      {
        if (__osLog)
          v93 = __osLog;
        else
          v93 = v13;
        if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          goto LABEL_251;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v99 = "[msgDataV1 length] >= sizeof(*srcV1)";
        *(_WORD *)&v99[8] = 2048;
        *(_QWORD *)v100 = 0;
        *(_WORD *)&v100[8] = 2080;
        *(_QWORD *)v101 = "";
        *(_WORD *)&v101[8] = 2080;
        *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
        *(_WORD *)&v102[8] = 1024;
        v103 = 5008;
      }
      else
      {
        v29 = objc_retainAutorelease(v28);
        v30 = objc_msgSend(v29, "bytes");
        v31 = objc_msgSend(v29, "length");
        if (v31 - 3184 == 4 * *(unsigned int *)(v30 + 3180))
        {
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v31 + 24);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v12 = objc_retainAutorelease(v32);
            v33 = objc_msgSend(v12, "mutableBytes");
            v35 = *(_OWORD *)(v30 + 16);
            v34 = *(_OWORD *)(v30 + 32);
            *(_OWORD *)v33 = *(_OWORD *)v30;
            *(_OWORD *)(v33 + 16) = v35;
            *(_OWORD *)(v33 + 32) = v34;
            v37 = *(_OWORD *)(v30 + 64);
            v36 = *(_OWORD *)(v30 + 80);
            v38 = *(_OWORD *)(v30 + 48);
            *(_DWORD *)(v33 + 96) = *(_DWORD *)(v30 + 96);
            *(_OWORD *)(v33 + 64) = v37;
            *(_OWORD *)(v33 + 80) = v36;
            *(_OWORD *)(v33 + 48) = v38;
            memcpy((void *)(v33 + 124), (const void *)(v30 + 100), 0xC0CuLL);
            memcpy((void *)(v33 + 3208), (const void *)(v30 + 3184), 4 * *(unsigned int *)(v33 + 3204));
LABEL_24:

            goto LABEL_82;
          }
          if (__osLog)
            v93 = __osLog;
          else
            v93 = v13;
          if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
LABEL_251:
            v12 = 0;
            goto LABEL_24;
          }
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "result";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5013;
        }
        else
        {
          if (__osLog)
            v93 = __osLog;
          else
            v93 = v13;
          if (!os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
            goto LABEL_251;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "([msgDataV1 length] - sizeof(*srcV1)) == srcV1->lotlItems * sizeof(srcV1->lotlUserIDs[0])";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5010;
        }
      }
      _os_log_impl(&dword_24B74E000, v93, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_251;
    case 0xE3FF8003:
      if ((_DWORD)v9 != 1)
      {
        if ((_DWORD)v9 != 2)
        {
          if (__osLog)
            v92 = __osLog;
          else
            v92 = v13;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)v99 = "msgVersion == 2";
            *(_WORD *)&v99[8] = 2048;
            *(_QWORD *)v100 = 0;
            *(_WORD *)&v100[8] = 2080;
            *(_QWORD *)v101 = "";
            *(_WORD *)&v101[8] = 2080;
            *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biom"
                              "etricKitXPCServerMesa.m";
            *(_WORD *)&v102[8] = 1024;
            v103 = 5233;
            goto LABEL_275;
          }
          goto LABEL_276;
        }
LABEL_85:
        if ((unint64_t)objc_msgSend(v12, "length") > 0x27)
        {
          v12 = objc_retainAutorelease(v12);
          v63 = (unsigned int *)objc_msgSend(v12, "bytes");
          objc_msgSend(MEMORY[0x24BE0CE78], "biometricKitIdentity");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v63 + 1);
          objc_msgSend(v64, "setUuid:", v65);
          objc_msgSend(v64, "setType:", 1);
          objc_msgSend(v64, "setUserID:", *v63);
          objc_msgSend(v64, "setAttribute:", 0);
          objc_msgSend(v64, "setEntity:", 0);
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setCreationTime:", v66);

          -[BiometricKitXPCServer addIdentityObject:](self, "addIdentityObject:", v64);
          -[__IOHIDEventSystemClient addIdentitity:](self->_hidClient, "addIdentitity:", v64);
          -[BiometricKitXPCServerMesa enrollResult:withTimestamp:](self, "enrollResult:withTimestamp:", v64, a7);
          -[BiometricKitXPCServer switchToNextBioOperation:](self, "switchToNextBioOperation:", 1);

          goto LABEL_118;
        }
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "[msgData length] >= sizeof(message_enroll_node_v2_t)";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5235;
          goto LABEL_275;
        }
        goto LABEL_276;
      }
      v39 = v12;
      if (objc_msgSend(v39, "length") == 20)
      {
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 40);
        v40 = objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          v41 = (void *)v40;
          v42 = objc_msgSend(objc_retainAutorelease(v39), "bytes");
          v12 = objc_retainAutorelease(v41);
          v43 = objc_msgSend(v12, "mutableBytes");
          v44 = *(_DWORD *)(v42 + 16);
          *(_OWORD *)v43 = *(_OWORD *)v42;
          *(_DWORD *)(v43 + 16) = v44;
LABEL_29:

          goto LABEL_85;
        }
        if (__osLog)
          v94 = __osLog;
        else
          v94 = v13;
        if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
LABEL_263:
          v12 = 0;
          goto LABEL_29;
        }
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v99 = "result";
        *(_WORD *)&v99[8] = 2048;
        *(_QWORD *)v100 = 0;
        *(_WORD *)&v100[8] = 2080;
        *(_QWORD *)v101 = "";
        *(_WORD *)&v101[8] = 2080;
        *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
        *(_WORD *)&v102[8] = 1024;
        v103 = 5047;
      }
      else
      {
        if (__osLog)
          v94 = __osLog;
        else
          v94 = v13;
        if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          goto LABEL_263;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v99 = "[msgDataV1 length] == sizeof(*srcV1)";
        *(_WORD *)&v99[8] = 2048;
        *(_QWORD *)v100 = 0;
        *(_WORD *)&v100[8] = 2080;
        *(_QWORD *)v101 = "";
        *(_WORD *)&v101[8] = 2080;
        *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
        *(_WORD *)&v102[8] = 1024;
        v103 = 5044;
      }
      _os_log_impl(&dword_24B74E000, v94, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      goto LABEL_263;
    case 0xE3FF8004:
      if ((_DWORD)v9 == 1)
      {
        if ((unint64_t)objc_msgSend(v12, "length") > 0xB)
        {
          v12 = objc_retainAutorelease(v12);
          v45 = (uint8_t *)objc_msgSend(v12, "bytes");
          hidClient = self;
          goto LABEL_40;
        }
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "[msgData length] >= sizeof(message_statistics_v1_t)";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5260;
          goto LABEL_275;
        }
      }
      else
      {
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "msgVersion == 1";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5259;
          goto LABEL_275;
        }
      }
      goto LABEL_276;
    case 0xE3FF8005:
      if ((_DWORD)v9 == 1)
      {
        if ((unint64_t)objc_msgSend(v12, "length") > 0x10)
        {
          -[NSMutableArray logSensorStatus:](self->_vibrationPatterns, "logSensorStatus:", v12);
          +[BioLog y](_TtC5BKDM16BioLog, "y");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "logSensorStatus:", v12);

          goto LABEL_118;
        }
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "[msgData length] >= sizeof(message_sensor_status_v1_t)";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5267;
          goto LABEL_275;
        }
      }
      else
      {
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "msgVersion == 1";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5266;
          goto LABEL_275;
        }
      }
      goto LABEL_276;
    case 0xE3FF8006:
    case 0xE3FF8007:
      if ((_DWORD)v9 == 1)
      {
        if (-[BiometricKitXPCServer ariadneSignposts](self, "ariadneSignposts"))
          kdebug_trace();
        v15 = (_DWORD)v10 == -469794810;
        -[NSMutableArray logHomeButtonState:fromKernel:withTimestamp:](self->_vibrationPatterns, "logHomeButtonState:fromKernel:withTimestamp:", v15, 1, a5);
        +[BioLog y](_TtC5BKDM16BioLog, "y");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logButtonState:", v15);

        -[__IOHIDEventSystemClient homeButtonStateChanged:](self->_hidClient, "homeButtonStateChanged:", v15);
        goto LABEL_118;
      }
      if (__osLog)
        v92 = __osLog;
      else
        v92 = v13;
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v99 = "msgVersion == 1";
        *(_WORD *)&v99[8] = 2048;
        *(_QWORD *)v100 = 0;
        *(_WORD *)&v100[8] = 2080;
        *(_QWORD *)v101 = "";
        *(_WORD *)&v101[8] = 2080;
        *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
        *(_WORD *)&v102[8] = 1024;
        v103 = 5275;
        goto LABEL_275;
      }
      goto LABEL_276;
    case 0xE3FF8008:
      if ((_DWORD)v9 == 1)
      {
        -[NSMutableArray logKernelMessage:](self->_vibrationPatterns, "logKernelMessage:", v12);
        -[BiometricKitXPCServerMesa bioLogKernelMessage:](self, "bioLogKernelMessage:", v12);
        goto LABEL_118;
      }
      if (__osLog)
        v92 = __osLog;
      else
        v92 = v13;
      if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        goto LABEL_276;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v99 = "msgVersion == 1";
      *(_WORD *)&v99[8] = 2048;
      *(_QWORD *)v100 = 0;
      *(_WORD *)&v100[8] = 2080;
      *(_QWORD *)v101 = "";
      *(_WORD *)&v101[8] = 2080;
      *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricK"
                        "itXPCServerMesa.m";
      *(_WORD *)&v102[8] = 1024;
      v103 = 5287;
      goto LABEL_275;
    case 0xE3FF8009:
      if ((_DWORD)v9 == 1)
      {
        -[NSMutableArray logSensorRecoveryReason:withTimestamp:](self->_vibrationPatterns, "logSensorRecoveryReason:withTimestamp:", a5, a7);
        +[BioLog y](_TtC5BKDM16BioLog, "y");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "logSensorRecoveryReason:", a5);

        *(_DWORD *)buf = 19;
        *(_QWORD *)v99 = a5;
        hidClient = self->_hidClient;
        v45 = buf;
LABEL_40:
        objc_msgSend(hidClient, "statisticsMessage:", v45);
        goto LABEL_118;
      }
      if (__osLog)
        v92 = __osLog;
      else
        v92 = v13;
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v99 = "msgVersion == 1";
        *(_WORD *)&v99[8] = 2048;
        *(_QWORD *)v100 = 0;
        *(_WORD *)&v100[8] = 2080;
        *(_QWORD *)v101 = "";
        *(_WORD *)&v101[8] = 2080;
        *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
        *(_WORD *)&v102[8] = 1024;
        v103 = 5294;
        goto LABEL_275;
      }
      goto LABEL_276;
    case 0xE3FF800A:
      if ((_DWORD)v9 != 1)
      {
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "msgVersion == 1";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5308;
          goto LABEL_275;
        }
        goto LABEL_276;
      }
      if ((unint64_t)objc_msgSend(v12, "length") <= 5)
      {
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "[msgData length] >= sizeof(message_sks_state_v1_t)";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5309;
          goto LABEL_275;
        }
        goto LABEL_276;
      }
      v12 = objc_retainAutorelease(v12);
      v49 = (unsigned int *)objc_msgSend(v12, "bytes");
      v50 = v49;
      if ((v49[1] & 0x80) != 0)
        -[BiometricKitXPCServer syncTemplateListForUser:](self, "syncTemplateListForUser:", *v49);
      -[BiometricKitXPCServer postGeneralLockoutStateNotification](self, "postGeneralLockoutStateNotification");
      v51 = *v50;
      if (v51 == -[BiometricKitXPCServer currentAccountUserID](self, "currentAccountUserID"))
        -[BiometricKitXPCServer updateLockoutStateNotification:](self, "updateLockoutStateNotification:", *((unsigned __int16 *)v50 + 2));
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v52;
      v54 = *((_WORD *)v50 + 2);
      if ((v54 & 1) != 0)
      {
        v67 = objc_msgSend(v52, "length");
        v68 = ",";
        if (!v67)
          v68 = "";
        objc_msgSend(v53, "appendFormat:", CFSTR("%sDeviceLocked"), v68);
        v54 = *((_WORD *)v50 + 2);
        if ((v54 & 2) == 0)
        {
LABEL_49:
          if ((v54 & 4) == 0)
            goto LABEL_50;
          goto LABEL_93;
        }
      }
      else if ((v54 & 2) == 0)
      {
        goto LABEL_49;
      }
      v69 = objc_msgSend(v53, "length");
      v70 = ",";
      if (!v69)
        v70 = "";
      objc_msgSend(v53, "appendFormat:", CFSTR("%sPasscodeLockout"), v70);
      v54 = *((_WORD *)v50 + 2);
      if ((v54 & 4) == 0)
      {
LABEL_50:
        if ((v54 & 8) == 0)
          goto LABEL_51;
        goto LABEL_96;
      }
LABEL_93:
      v71 = objc_msgSend(v53, "length");
      v72 = ",";
      if (!v71)
        v72 = "";
      objc_msgSend(v53, "appendFormat:", CFSTR("%sBioLockout"), v72);
      v54 = *((_WORD *)v50 + 2);
      if ((v54 & 8) == 0)
      {
LABEL_51:
        if ((v54 & 0x200) == 0)
          goto LABEL_52;
        goto LABEL_99;
      }
LABEL_96:
      v73 = objc_msgSend(v53, "length");
      v74 = ",";
      if (!v73)
        v74 = "";
      objc_msgSend(v53, "appendFormat:", CFSTR("%sUnlockTokenPresent"), v74);
      v54 = *((_WORD *)v50 + 2);
      if ((v54 & 0x200) == 0)
      {
LABEL_52:
        if ((v54 & 0x10) == 0)
          goto LABEL_53;
        goto LABEL_102;
      }
LABEL_99:
      v75 = objc_msgSend(v53, "length");
      v76 = ",";
      if (!v75)
        v76 = "";
      objc_msgSend(v53, "appendFormat:", CFSTR("%sApplePayTokenPresent"), v76);
      v54 = *((_WORD *)v50 + 2);
      if ((v54 & 0x10) == 0)
      {
LABEL_53:
        if ((v54 & 0x20) == 0)
          goto LABEL_54;
        goto LABEL_105;
      }
LABEL_102:
      v77 = objc_msgSend(v53, "length");
      v78 = ",";
      if (!v77)
        v78 = "";
      objc_msgSend(v53, "appendFormat:", CFSTR("%sBeforeFirstUnlock"), v78);
      v54 = *((_WORD *)v50 + 2);
      if ((v54 & 0x20) == 0)
      {
LABEL_54:
        if ((v54 & 0x40) == 0)
          goto LABEL_55;
        goto LABEL_108;
      }
LABEL_105:
      v79 = objc_msgSend(v53, "length");
      v80 = ",";
      if (!v79)
        v80 = "";
      objc_msgSend(v53, "appendFormat:", CFSTR("%sPasscodeValidated"), v80);
      v54 = *((_WORD *)v50 + 2);
      if ((v54 & 0x40) == 0)
      {
LABEL_55:
        if ((v54 & 0x80) == 0)
          goto LABEL_56;
        goto LABEL_111;
      }
LABEL_108:
      v81 = objc_msgSend(v53, "length");
      v82 = ",";
      if (!v81)
        v82 = "";
      objc_msgSend(v53, "appendFormat:", CFSTR("%sIdentificationLockout"), v82);
      v54 = *((_WORD *)v50 + 2);
      if ((v54 & 0x80) == 0)
      {
LABEL_56:
        if ((v54 & 0x400) == 0)
        {
LABEL_60:
          if (__osLog)
            v57 = __osLog;
          else
            v57 = v13;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = *v50;
            v59 = *((unsigned __int16 *)v50 + 2);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v99 = v58;
            *(_WORD *)&v99[4] = 1024;
            *(_DWORD *)&v99[6] = v59;
            *(_WORD *)v100 = 2112;
            *(_QWORD *)&v100[2] = v53;
            _os_log_impl(&dword_24B74E000, v57, OS_LOG_TYPE_DEFAULT, "SKS state: %u: 0x%x (%@)\n", buf, 0x18u);
          }
          -[__IOHIDEventSystemClient lockStateUpdated:](self->_hidClient, "lockStateUpdated:", *((unsigned __int16 *)v50 + 2));
          -[NSMutableArray logSKSLockState:forUser:withTimestamp:](self->_vibrationPatterns, "logSKSLockState:forUser:withTimestamp:", *((unsigned __int16 *)v50 + 2), *v50, a7);
          +[BioLog y](_TtC5BKDM16BioLog, "y");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "logSKSLockState:userID:", *((unsigned __int16 *)v50 + 2), *v50);

          goto LABEL_118;
        }
LABEL_57:
        v55 = objc_msgSend(v53, "length");
        v56 = ",";
        if (!v55)
          v56 = "";
        objc_msgSend(v53, "appendFormat:", CFSTR("%sRemoteUnlocked"), v56);
        goto LABEL_60;
      }
LABEL_111:
      v83 = objc_msgSend(v53, "length");
      v84 = ",";
      if (!v83)
        v84 = "";
      objc_msgSend(v53, "appendFormat:", CFSTR("%sCatacombCorrupted"), v84);
      if ((v50[1] & 0x400) == 0)
        goto LABEL_60;
      goto LABEL_57;
    case 0xE3FF800B:
      if ((_DWORD)v9 == 1)
      {
        if ((unint64_t)objc_msgSend(v12, "length") > 0x1C)
        {
          v12 = objc_retainAutorelease(v12);
          -[BiometricKitXPCServerMesa matchEventMessage:](self, "matchEventMessage:", objc_msgSend(v12, "bytes"));
          goto LABEL_118;
        }
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "[msgData length] >= sizeof(message_match_event_v1_t)";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5355;
          goto LABEL_275;
        }
      }
      else
      {
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "msgVersion == 1";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5354;
          goto LABEL_275;
        }
      }
      goto LABEL_276;
    case 0xE3FF800D:
      if ((_DWORD)v9 != 1)
      {
        if (__osLog)
          v92 = __osLog;
        else
          v92 = v13;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v99 = "msgVersion == 1";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)v100 = 0;
          *(_WORD *)&v100[8] = 2080;
          *(_QWORD *)v101 = "";
          *(_WORD *)&v101[8] = 2080;
          *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biomet"
                            "ricKitXPCServerMesa.m";
          *(_WORD *)&v102[8] = 1024;
          v103 = 5383;
          goto LABEL_275;
        }
        goto LABEL_276;
      }
      if (LOBYTE(self->_dailyUpdateTimer))
        goto LABEL_118;
      LOBYTE(self->_dailyUpdateTimer) = 1;
      v61 = -[BiometricKitXPCServerMesa initSensor](self, "initSensor");
      if (!v61)
      {
        -[BiometricKitXPCServer syncTemplateListForUser:](self, "syncTemplateListForUser:", 0xFFFFFFFFLL);
        goto LABEL_119;
      }
      if (__osLog)
        v62 = __osLog;
      else
        v62 = v13;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v99 = "err == 0 ";
        *(_WORD *)&v99[8] = 2048;
        *(_QWORD *)v100 = v61;
        *(_WORD *)&v100[8] = 2080;
        *(_QWORD *)v101 = "";
        *(_WORD *)&v101[8] = 2080;
        *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
        *(_WORD *)&v102[8] = 1024;
        v103 = 5387;
        goto LABEL_269;
      }
      goto LABEL_119;
    case 0xE3FF8010:
      if ((_DWORD)v9 == 1)
      {
        -[BiometricKitXPCServerMesa reportMesaHardwarePass:](self, "reportMesaHardwarePass:", 0);
LABEL_118:
        v61 = 0;
        goto LABEL_119;
      }
      if (__osLog)
        v92 = __osLog;
      else
        v92 = v13;
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v99 = "msgVersion == 1";
        *(_WORD *)&v99[8] = 2048;
        *(_QWORD *)v100 = 0;
        *(_WORD *)&v100[8] = 2080;
        *(_QWORD *)v101 = "";
        *(_WORD *)&v101[8] = 2080;
        *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
        *(_WORD *)&v102[8] = 1024;
        v103 = 5450;
        goto LABEL_275;
      }
      goto LABEL_276;
    default:
      v96.receiver = self;
      v96.super_class = (Class)BiometricKitXPCServerMesa;
      v61 = -[BiometricKitXPCServer serviceStatus:version:ordinal:data:timestamp:](&v96, sel_serviceStatus_version_ordinal_data_timestamp_, v10, v9, a5, v12, a7);
      if (!v61)
        goto LABEL_119;
      v62 = (__osLog ? __osLog : v13);
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        goto LABEL_119;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v99 = "err == 0 ";
      *(_WORD *)&v99[8] = 2048;
      *(_QWORD *)v100 = v61;
      *(_WORD *)&v100[8] = 2080;
      *(_QWORD *)v101 = "";
      *(_WORD *)&v101[8] = 2080;
      *(_QWORD *)v102 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricK"
                        "itXPCServerMesa.m";
      *(_WORD *)&v102[8] = 1024;
      v103 = 5458;
      goto LABEL_269;
  }
}

- (int)performCommand:(unsigned __int16)a3 version:(unsigned __int16)a4 inValue:(unsigned __int16)a5 inData:(const void *)a6 inSize:(unint64_t)a7 outData:(char *)a8 outSize:(unint64_t *)a9
{
  int v12;
  int v13;
  int v14;
  NSObject *v16;
  size_t v17;
  _BOOL8 v18;
  _WORD *v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  kern_return_t v23;
  NSObject *v24;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _BYTE buf[14];
  uint64_t v31;
  _BYTE v32[10];
  _BYTE v33[10];
  char *v34;
  __int16 v35;
  unint64_t *v36;
  uint64_t v37;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  v37 = *MEMORY[0x24BDAC8D0];
  if (__osLog)
    v16 = __osLog;
  else
    v16 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110656;
    *(_DWORD *)&buf[4] = v14;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v13;
    LOWORD(v31) = 1024;
    *(_DWORD *)((char *)&v31 + 2) = v12;
    HIWORD(v31) = 2048;
    *(_QWORD *)v32 = a6;
    *(_WORD *)&v32[8] = 2048;
    *(_QWORD *)v33 = a7;
    *(_WORD *)&v33[8] = 2048;
    v34 = a8;
    v35 = 2048;
    v36 = a9;
    _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_DEBUG, "performCommand:version:inValue:inData:inSize:outData:outSize: %u %u %u %p %lu %p %p\n", buf, 0x3Cu);
  }
  v29 = (void *)os_transaction_create();
  v28 = (void *)MEMORY[0x24BD27898]();
  v17 = a7 + 8;
  v18 = a7 >= 0xFFFFFFFFFFFFFFF8;
  if (a7 >= 0xFFFFFFFFFFFFFFF8)
  {
    v22 = MEMORY[0x24BDACB70];
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      v31 = v18;
      *(_WORD *)v32 = 2080;
      *(_QWORD *)&v32[2] = "";
      *(_WORD *)v33 = 2080;
      *(_QWORD *)&v33[2] = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometr"
                           "icKitXPCServerMesa.m";
      LOWORD(v34) = 1024;
      *(_DWORD *)((char *)&v34 + 2) = 5495;
      _os_log_impl(&dword_24B74E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v23 = 1;
  }
  else
  {
    v19 = malloc_type_malloc(a7 + 8, 0x24297ABCuLL);
    if (v19)
    {
      v20 = v19;
      *v19 = 19778;
      v19[1] = v14;
      v19[2] = v13;
      v19[3] = v12;
      if (a7)
        memmove(v19 + 4, a6, a7);
      if (a9)
        v21 = *a9;
      else
        v21 = 0;
      v22 = MEMORY[0x24BDACB70];
      *(_QWORD *)buf = v21;
      v23 = IOConnectCallStructMethod(HIDWORD(self->super._reporter), 0, v20, v17, a8, (size_t *)buf);
      if (a9)
        *a9 = *(_QWORD *)buf;
      free(v20);
    }
    else
    {
      v22 = MEMORY[0x24BDACB70];
      if (__osLog)
        v27 = __osLog;
      else
        v27 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "cmd";
        *(_WORD *)&buf[12] = 2048;
        v31 = 0;
        *(_WORD *)v32 = 2080;
        *(_QWORD *)&v32[2] = "";
        *(_WORD *)v33 = 2080;
        *(_QWORD *)&v33[2] = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biome"
                             "tricKitXPCServerMesa.m";
        LOWORD(v34) = 1024;
        *(_DWORD *)((char *)&v34 + 2) = 5498;
        _os_log_impl(&dword_24B74E000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v23 = 12;
    }
  }
  objc_autoreleasePoolPop(v28);
  if (__osLog)
    v24 = __osLog;
  else
    v24 = v22;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v23;
    _os_log_impl(&dword_24B74E000, v24, OS_LOG_TYPE_DEBUG, "performCommand:version:inValue:inData:inSize:outData:outSize: -> %{errno}d\n", buf, 8u);
  }

  return v23;
}

- (int)performCommand:(unsigned __int16)a3 inValue:(unsigned __int16)a4 inData:(const void *)a5 inSize:(unint64_t)a6 outData:(char *)a7 outSize:(unint64_t *)a8
{
  uint64_t v12;
  uint64_t v13;
  NSObject *v15;
  uint8_t buf[16];

  v12 = a4;
  v13 = a3;
  if (__osLog)
    v15 = __osLog;
  else
    v15 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_DEBUG, "performCommand:inValue:inData:inSize:outData:outSize: --> performCommand:version:inValue:inData:inSize:outData:outSize:\n", buf, 2u);
  }
  return -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", v13, 1, v12, a5, a6, a7, a8);
}

- (int)restoreAndSyncTemplates
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  NSMutableArray *vibrationPatterns;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "restoreAndSyncTemplates\n", (uint8_t *)&v20, 2u);
  }
  v5 = -[BiometricKitXPCServerMesa loadCatacomb](self, "loadCatacomb");
  v6 = v5;
  if (__osLog)
    v7 = __osLog;
  else
    v7 = v3;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v20 = 136316162;
      v21 = "err == 0 ";
      v22 = 2048;
      v23 = (void *)v6;
      v24 = 2080;
      v25 = "";
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v28 = 1024;
      v29 = 5566;
      _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    if (__osLogTrace)
      v19 = __osLogTrace;
    else
      v19 = v3;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = 67109120;
      LODWORD(v21) = v6;
      v16 = v19;
      v17 = OS_LOG_TYPE_ERROR;
      goto LABEL_17;
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = -[BiometricKitXPCServer identitiesCount](self, "identitiesCount");
      -[BiometricKitXPCServer identities](self, "identities");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218242;
      v21 = (const char *)v9;
      v22 = 2114;
      v23 = v10;
      _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEFAULT, "restoreAndSyncTemplates identities %lu: %{public}@\n", (uint8_t *)&v20, 0x16u);

    }
    vibrationPatterns = self->_vibrationPatterns;
    -[BiometricKitXPCServer identities](self, "identities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray logUnlockedStateWithIdentities:](vibrationPatterns, "logUnlockedStateWithIdentities:", v12);

    +[BioLog y](_TtC5BKDM16BioLog, "y");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer identities](self, "identities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logUnlockedStateWithIdentities:", v14);

    if (__osLogTrace)
      v15 = __osLogTrace;
    else
      v15 = v3;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v20 = 67109120;
      LODWORD(v21) = 0;
      v16 = v15;
      v17 = OS_LOG_TYPE_DEBUG;
LABEL_17:
      _os_log_impl(&dword_24B74E000, v16, v17, "restoreAndSyncTemplates -> %d\n", (uint8_t *)&v20, 8u);
    }
  }
  return v6;
}

- (void)clearTemplateList
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = mach_absolute_time();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[BiometricKitXPCServer identities](self, "identities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableArray logRemoveIdentity:withOptions:fromClient:withTimestamp:](self->_vibrationPatterns, "logRemoveIdentity:withOptions:fromClient:withTimestamp:", v9, 0, 0, v3);
        -[NSMutableArray logRemoveIdentity:withError:](self->_vibrationPatterns, "logRemoveIdentity:withError:", v9, 0);
        +[BioLog y](_TtC5BKDM16BioLog, "y");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logRemoveIdentity:options:client:", v9, 0, 0);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[__IOHIDEventSystemClient removeAllIdentities](self->_hidClient, "removeAllIdentities");
  objc_msgSend(*(id *)&self->_showDebugImages, "setLength:", 0);
  v11.receiver = self;
  v11.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer clearTemplateList](&v11, sel_clearTemplateList);
}

- (void)clearTemplateListForUser:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[BiometricKitXPCServer identitiesOfUser:](self, "identitiesOfUser:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[NSMutableArray logRemoveIdentity:withOptions:fromClient:withTimestamp:](self->_vibrationPatterns, "logRemoveIdentity:withOptions:fromClient:withTimestamp:", v9, 0, 0, mach_absolute_time());
        -[NSMutableArray logRemoveIdentity:withError:](self->_vibrationPatterns, "logRemoveIdentity:withError:", v9, 0);
        +[BioLog y](_TtC5BKDM16BioLog, "y");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logRemoveIdentity:options:client:", v9, 0, 0);

        -[__IOHIDEventSystemClient removeIdentity:](self->_hidClient, "removeIdentity:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  v12.receiver = self;
  v12.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer clearTemplateListForUser:](&v12, sel_clearTemplateListForUser_, a3);

}

- (void)removeIdentityObject:(id)a3
{
  NSMutableArray *vibrationPatterns;
  id v5;
  void *v6;
  objc_super v7;

  vibrationPatterns = self->_vibrationPatterns;
  v5 = a3;
  -[NSMutableArray logRemoveIdentity:withOptions:fromClient:withTimestamp:](vibrationPatterns, "logRemoveIdentity:withOptions:fromClient:withTimestamp:", v5, 0, 0, 0);
  -[NSMutableArray logRemoveIdentity:withError:](self->_vibrationPatterns, "logRemoveIdentity:withError:", v5, 0);
  +[BioLog y](_TtC5BKDM16BioLog, "y");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logRemoveIdentity:options:client:", v5, 0, 0);

  -[__IOHIDEventSystemClient removeIdentity:](self->_hidClient, "removeIdentity:", v5);
  v7.receiver = self;
  v7.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer removeIdentityObject:](&v7, sel_removeIdentityObject_, v5);

}

- (void)addIdentityObjects:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BiometricKitXPCServerMesa;
  -[BiometricKitXPCServer addIdentityObjects:](&v14, sel_addIdentityObjects_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[__IOHIDEventSystemClient addIdentitity:](self->_hidClient, "addIdentitity:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (int)getCatacombSaveListForComponents:(id)a3 list:(id *)a4
{
  unsigned int v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *vibrationPatterns;
  int v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  const __CFString *v26;
  void *v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)BiometricKitXPCServerMesa;
  v6 = -[BiometricKitXPCServer getCatacombSaveListForComponents:list:](&v25, sel_getCatacombSaveListForComponents_list_, a3);
  if (!v6)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = *a4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "description", (_QWORD)v21);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
        }
        while (v10);
      }

      vibrationPatterns = self->_vibrationPatterns;
      v26 = CFSTR("components");
      if (v7)
      {
        v15 = 0;
        v16 = v7;
LABEL_14:
        v27 = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1, (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray logSaveTemplateListWithDetails:](vibrationPatterns, "logSaveTemplateListWithDetails:", v17);

        if (v15)
        v18 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      vibrationPatterns = self->_vibrationPatterns;
      v26 = CFSTR("components");
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", (_QWORD)v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v15 = 1;
    goto LABEL_14;
  }
  v18 = v6;
  if (__osLog)
    v20 = __osLog;
  else
    v20 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v30 = "err == 0 ";
    v31 = 2048;
    v32 = v18;
    v33 = 2080;
    v34 = "";
    v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v37 = 1024;
    v38 = 5669;
    _os_log_impl(&dword_24B74E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v7 = 0;
LABEL_17:

  return v18;
}

- (int)archiveCatacombDataForComponent:(id)a3 toArchiver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  int v10;
  NSObject *v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 136316162;
    v16 = "component";
    v17 = 2048;
    v18 = 0;
    v19 = 2080;
    v20 = "";
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v23 = 1024;
    v24 = 5694;
    goto LABEL_18;
  }
  if (!v7)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 136316162;
    v16 = "archiver";
    v17 = 2048;
    v18 = 0;
    v19 = 2080;
    v20 = "";
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v23 = 1024;
    v24 = 5695;
LABEL_18:
    _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_19:
    v10 = 258;
    goto LABEL_7;
  }
  v14.receiver = self;
  v14.super_class = (Class)BiometricKitXPCServerMesa;
  v9 = -[BiometricKitXPCServer archiveCatacombDataForComponent:toArchiver:](&v14, sel_archiveCatacombDataForComponent_toArchiver_, v6, v7);
  if (v9)
  {
    v10 = v9;
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "err == 0 ";
      v17 = 2048;
      v18 = v10;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 5698;
      _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (objc_msgSend(v6, "isMasterComponent"))
    {
      objc_msgSend(v8, "encodeInteger:forKey:", self->_templListCache, CFSTR("CatacombEnrollmentCount"));
      objc_msgSend(v8, "encodeObject:forKey:", self->_enrollmentCount, CFSTR("CatacombCurrentDate"));
    }
    v10 = 0;
  }
LABEL_7:

  return v10;
}

- (int)unarchiveCatacombDataForComponent:(id)a3 fromUnarchiver:(id)a4 secureData:(id *)a5 identities:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  int64_t v14;
  void *enrollmentCount;
  int64_t v16;
  void *v17;
  int v18;
  NSObject *v20;
  NSObject *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!v10)
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_DWORD *)buf = 136316162;
    v24 = "component";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = "";
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v31 = 1024;
    v32 = 5720;
    goto LABEL_19;
  }
  if (!v11)
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_DWORD *)buf = 136316162;
    v24 = "unarchiver";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = "";
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v31 = 1024;
    v32 = 5721;
LABEL_19:
    _os_log_impl(&dword_24B74E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_20:
    v18 = 258;
    goto LABEL_8;
  }
  v22.receiver = self;
  v22.super_class = (Class)BiometricKitXPCServerMesa;
  v13 = -[BiometricKitXPCServer unarchiveCatacombDataForComponent:fromUnarchiver:secureData:identities:](&v22, sel_unarchiveCatacombDataForComponent_fromUnarchiver_secureData_identities_, v10, v11, a5, a6);
  if (v13)
  {
    v18 = v13;
    if (__osLog)
      v21 = __osLog;
    else
      v21 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "err == 0 ";
      v25 = 2048;
      v26 = v18;
      v27 = 2080;
      v28 = "";
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v31 = 1024;
      v32 = 5724;
      _os_log_impl(&dword_24B74E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (objc_msgSend(v10, "isMasterComponent"))
    {
      self->_templListCache = (NSMutableData *)objc_msgSend(v12, "decodeIntegerForKey:", CFSTR("CatacombEnrollmentCount"));
      objc_msgSend(v12, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CatacombCurrentDate"));
      v14 = objc_claimAutoreleasedReturnValue();
      enrollmentCount = (void *)self->_enrollmentCount;
      self->_enrollmentCount = v14;

      if (!self->_enrollmentCount)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)self->_enrollmentCount;
        self->_enrollmentCount = v16;

      }
    }
    v18 = 0;
  }
LABEL_8:

  return v18;
}

- (int)decodeCatacombDataV1:(char *)a3 withSize:(unint64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  int v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  _BYTE v25[32];
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v25 = 134218240;
    *(_QWORD *)&v25[4] = a3;
    *(_WORD *)&v25[12] = 2048;
    *(_QWORD *)&v25[14] = a4;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "decodeCatacombDataV1:withSize: %p %lu\n", v25, 0x16u);
  }
  if (a4 <= 0xB)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v7;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    *(_DWORD *)v25 = 136316162;
    *(_QWORD *)&v25[4] = "size >= sizeof(*header)";
    *(_WORD *)&v25[12] = 2048;
    *(_QWORD *)&v25[14] = 0;
    *(_WORD *)&v25[22] = 2080;
    *(_QWORD *)&v25[24] = "";
    v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v28 = 1024;
    v29 = 5759;
    goto LABEL_52;
  }
  if (*(_DWORD *)a3 != 827605315)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v7;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    *(_DWORD *)v25 = 136316162;
    *(_QWORD *)&v25[4] = "header->magic == 0x31544143";
    *(_WORD *)&v25[12] = 2048;
    *(_QWORD *)&v25[14] = 0;
    *(_WORD *)&v25[22] = 2080;
    *(_QWORD *)&v25[24] = "";
    v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v28 = 1024;
    v29 = 5761;
    goto LABEL_52;
  }
  v10 = *((unsigned int *)a3 + 1);
  v9 = *((unsigned int *)a3 + 2);
  v11 = (28 * v10);
  if (v11 + v9 + 12 > a4)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v7;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    *(_DWORD *)v25 = 136316162;
    *(_QWORD *)&v25[4] = "size >= sizeof(*header) + identListSize + templListSize";
    *(_WORD *)&v25[12] = 2048;
    *(_QWORD *)&v25[14] = 0;
    *(_WORD *)&v25[22] = 2080;
    *(_QWORD *)&v25[24] = "";
    v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v28 = 1024;
    v29 = 5768;
    goto LABEL_52;
  }
  if (v9 | v10 && (!(_DWORD)v10 || !(_DWORD)v9))
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v7;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    *(_DWORD *)v25 = 136316162;
    *(_QWORD *)&v25[4] = "(identCount == 0 && templListSize == 0) || (identCount > 0 && templListSize > 0)";
    *(_WORD *)&v25[12] = 2048;
    *(_QWORD *)&v25[14] = 0;
    *(_WORD *)&v25[22] = 2080;
    *(_QWORD *)&v25[24] = "";
    v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v28 = 1024;
    v29 = 5769;
LABEL_52:
    _os_log_impl(&dword_24B74E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v25, 0x30u);
LABEL_53:
    v20 = 22;
    goto LABEL_54;
  }
  if (!(_DWORD)v10 || !(_DWORD)v9)
  {
    if (!(_DWORD)v10)
      goto LABEL_25;
    goto LABEL_22;
  }
  if (__osLog)
    v12 = __osLog;
  else
    v12 = v7;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_DEFAULT, "kReadCatacombSUCommand - may bump catacomb counter\n", v25, 2u);
  }
  v13 = &a3[v11 + 12];
  v14 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 5, 0, v13, v9, 0, 0);
  if (!v14)
  {
    objc_msgSend(*(id *)&self->_showDebugImages, "replaceBytesInRange:withBytes:", 0, v9, v13);
    objc_msgSend(*(id *)&self->_showDebugImages, "setLength:", v9);
LABEL_22:
    v15 = 0;
    v16 = a3 + 12;
    do
    {
      v17 = v15;
      *(_OWORD *)v25 = *(_OWORD *)v16;
      *(_OWORD *)&v25[12] = *(_OWORD *)(v16 + 12);
      objc_msgSend(MEMORY[0x24BE0CE78], "biometricKitIdentity", *(_OWORD *)v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v25);

      objc_msgSend(v18, "setUuid:", v15);
      objc_msgSend(v18, "setType:", *(unsigned int *)&v25[16]);
      objc_msgSend(v18, "setAttribute:", *(unsigned int *)&v25[20]);
      objc_msgSend(v18, "setEntity:", *(unsigned int *)&v25[24]);
      -[BiometricKitXPCServer addIdentityObject:](self, "addIdentityObject:", v18);
      -[__IOHIDEventSystemClient addIdentitity:](self->_hidClient, "addIdentitity:", v18);

      v16 += 28;
      --v10;
    }
    while (v10);

    v7 = MEMORY[0x24BDACB70];
LABEL_25:
    if (__osLogTrace)
      v19 = __osLogTrace;
    else
      v19 = v7;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_QWORD *)v25 = 67109120;
      _os_log_impl(&dword_24B74E000, v19, OS_LOG_TYPE_DEBUG, "decodeCatacombDataV1:withSize: -> %{errno}d\n", v25, 8u);
    }
    return 0;
  }
  v20 = v14;
  if (__osLog)
    v24 = __osLog;
  else
    v24 = v7;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v25 = 136316162;
    *(_QWORD *)&v25[4] = "err == 0 ";
    *(_WORD *)&v25[12] = 2048;
    *(_QWORD *)&v25[14] = v20;
    *(_WORD *)&v25[22] = 2080;
    *(_QWORD *)&v25[24] = "";
    v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v28 = 1024;
    v29 = 5776;
    _os_log_impl(&dword_24B74E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v25, 0x30u);
  }
LABEL_54:
  if (__osLogTrace)
    v23 = __osLogTrace;
  else
    v23 = v7;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v25 = 67109120;
    *(_DWORD *)&v25[4] = v20;
    _os_log_impl(&dword_24B74E000, v23, OS_LOG_TYPE_ERROR, "decodeCatacombDataV1:withSize: -> %{errno}d\n", v25, 8u);
  }
  return v20;
}

- (int)restoreTemplateListSU
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  char v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *enrollmentCount;
  int64_t v32;
  void *v33;
  int v34;
  BOOL v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  NSObject *v42;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[3];
  size_t v53;
  void *v54;
  _BYTE v55[128];
  _BYTE buf[12];
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "restoreTemplateListSU\n", buf, 2u);
  }
  v53 = 0;
  v54 = 0;
  -[BiometricKitXPCServer catacombLock](self, "catacombLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[BiometricKitXPCServerMesa clearTemplateList](self, "clearTemplateList");
  memset(v52, 0, 23);
  LODWORD(v6) = -[BiometricKitXPCServerMesa performGetBiometrickitdInfoCommand:](self, "performGetBiometrickitdInfoCommand:", v52);
  if ((_DWORD)v6)
  {
    if (__osLog)
      v44 = __osLog;
    else
      v44 = v3;
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "err == 0 ";
    v57 = 2048;
    v58 = (int)v6;
    v59 = 2080;
    v60 = "";
    v61 = 2080;
    v62 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v63 = 1024;
    v64 = 5830;
    goto LABEL_93;
  }
  if ((isEphemeralMultiUser() & 1) != 0)
    v6 = 0;
  else
    v6 = LoadDataFromCatacomb("TemplateList.cat", &v54, &v53);
  if (isInternalBuild())
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (BYTE5(v52[2]))
      v10 = "YES";
    else
      v10 = "NO";
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ - LoadDataFromCatacomb(), err = %d, already in SEP: %s"), v8, v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer writeStringToPersistentLog:](self, "writeStringToPersistentLog:", v11);

  }
  if ((v6 & 0xFFFFFFFD) != 0)
    goto LABEL_21;
  if (isInternalBuild())
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v54, v53, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitXPCServer logCatacombInfo:data:](self, "logCatacombInfo:data:", CFSTR("Loading Catacomb file"), v12);

  }
  if (v53 < 0xC)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
LABEL_23:
    LODWORD(v6) = 0;
    goto LABEL_24;
  }
  if (*(_DWORD *)v54 == 827605315)
  {
    LODWORD(v6) = -[BiometricKitXPCServerMesa decodeCatacombDataV1:withSize:](self, "decodeCatacombDataV1:withSize:");
    if (!(_DWORD)v6)
      goto LABEL_21;
    v44 = (__osLog ? __osLog : v3);
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "err == 0 ";
    v57 = 2048;
    v58 = (int)v6;
    v59 = 2080;
    v60 = "";
    v61 = 2080;
    v62 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v63 = 1024;
    v64 = 5852;
LABEL_93:
    _os_log_impl(&dword_24B74E000, v44, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_21:
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v15, 0);
  v14 = v21;
  if (!v21)
  {
    if (__osLog)
      v45 = __osLog;
    else
      v45 = v3;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "unarchiver";
      v57 = 2048;
      v58 = 0;
      v59 = 2080;
      v60 = "";
      v61 = 2080;
      v62 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v63 = 1024;
      v64 = 5861;
      _os_log_impl(&dword_24B74E000, v45, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v14 = 0;
    goto LABEL_110;
  }
  objc_msgSend(v21, "setDecodingFailurePolicy:", 0);
  if (objc_msgSend(v14, "decodeInt32ForKey:", CFSTR("CatacombVersion")) != 0x20000)
  {
    if (__osLog)
      v46 = __osLog;
    else
      v46 = v3;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "version == 0x00020000";
      v57 = 2048;
      v58 = 0;
      v59 = 2080;
      v60 = "";
      v61 = 2080;
      v62 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v63 = 1024;
      v64 = 5866;
      _os_log_impl(&dword_24B74E000, v46, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
LABEL_110:
    LODWORD(v6) = 22;
    v34 = 4;
    goto LABEL_46;
  }
  -[BiometricKitXPCServer cachedIdentities](self, "cachedIdentities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v22);
  -[BiometricKitXPCServer cachedIdentities](self, "cachedIdentities");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDBCF20];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "decodeObjectOfClasses:forKey:", v26, CFSTR("CatacombIdentityList"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setArray:", v27);

  objc_sync_exit(v22);
  v28 = *(void **)&self->_showDebugImages;
  objc_msgSend(v14, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CatacombTemplateList"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setData:", v29);

  self->_templListCache = (NSMutableData *)objc_msgSend(v14, "decodeIntegerForKey:", CFSTR("CatacombEnrollmentCount"));
  objc_msgSend(v14, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CatacombCurrentDate"));
  v30 = objc_claimAutoreleasedReturnValue();
  enrollmentCount = (void *)self->_enrollmentCount;
  self->_enrollmentCount = v30;

  if (!self->_enrollmentCount)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)self->_enrollmentCount;
    self->_enrollmentCount = v32;

  }
  v34 = 0;
LABEL_46:
  objc_msgSend(v14, "finishDecoding");
  if (v34 == 4)
  {
    v13 = 0;
  }
  else
  {
    if (objc_msgSend(*(id *)&self->_showDebugImages, "length"))
      v35 = BYTE5(v52[2]) == 0;
    else
      v35 = 0;
    v13 = v35;
    if (!v35)
      goto LABEL_63;
    if (isInternalBuild())
      -[BiometricKitXPCServer logCatacombInfo:data:](self, "logCatacombInfo:data:", CFSTR("Loading TemplateList"), *(_QWORD *)&self->_showDebugImages);
    if (__osLog)
      v36 = __osLog;
    else
      v36 = v3;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B74E000, v36, OS_LOG_TYPE_DEFAULT, "kReadCatacombSUCommand - may bump catacomb counter\n", buf, 2u);
    }
    LODWORD(v6) = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 5, 0, objc_msgSend(*(id *)&self->_showDebugImages, "bytes"), objc_msgSend(*(id *)&self->_showDebugImages, "length"), 0, 0);
    if (!(_DWORD)v6)
    {
LABEL_63:
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      -[BiometricKitXPCServer identities](self, "identities");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v49 != v39)
              objc_enumerationMutation(v37);
            -[__IOHIDEventSystemClient addIdentitity:](self->_hidClient, "addIdentitity:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        }
        while (v38);
      }

      goto LABEL_23;
    }
    if (__osLog)
      v47 = __osLog;
    else
      v47 = v3;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      v57 = 2048;
      v58 = (int)v6;
      v59 = 2080;
      v60 = "";
      v61 = 2080;
      v62 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v63 = 1024;
      v64 = 5914;
      _os_log_impl(&dword_24B74E000, v47, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v13 = 1;
  }
LABEL_24:
  v16 = isInternalBuild();
  if (BYTE5(v52[2]))
    v17 = 0;
  else
    v17 = v16;
  if (v17 == 1)
    -[BiometricKitXPCServerMesa dumpSyslog](self, "dumpSyslog");
  if ((_DWORD)v6)
  {
    -[BiometricKitXPCServerMesa clearTemplateList](self, "clearTemplateList");
    if ((v6 - 32770) >= 2 && (_DWORD)v6 != 402)
      goto LABEL_74;
    RemoveFileFromCatacomb("TemplateList.cat");
    switch((_DWORD)v6)
    {
      case 0x192:
        v18 = 18;
        goto LABEL_73;
      case 0x8003:
        v18 = 10;
        goto LABEL_73;
      case 0x8002:
        v18 = 6;
LABEL_73:
        -[__IOHIDEventSystemClient catacombCorrupted:](self->_hidClient, "catacombCorrupted:", v18);
        break;
    }
  }
  else
  {
    if (BYTE5(v52[2]))
      v19 = 1;
    else
      v19 = v13;
    if ((v19 & 1) != 0)
    {
      v20 = 0;
      goto LABEL_75;
    }
  }
LABEL_74:
  *(_DWORD *)buf = -1;
  v20 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 49, 0, buf, 4, 0, 0);
LABEL_75:
  if (v54)
    free(v54);
  -[BiometricKitXPCServer catacombLock](self, "catacombLock");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "unlock");

  if (__osLogTrace)
    v42 = __osLogTrace;
  else
    v42 = v3;
  if (v20)
  {
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v20;
      _os_log_impl(&dword_24B74E000, v42, OS_LOG_TYPE_ERROR, "restoreTemplateListSU -> %{errno}d\n", buf, 8u);
    }
  }
  else
  {
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_QWORD *)buf = 67109120;
      _os_log_impl(&dword_24B74E000, v42, OS_LOG_TYPE_DEBUG, "restoreTemplateListSU -> %{errno}d\n", buf, 8u);
    }
    v20 = 0;
  }

  return v20;
}

- (int)saveCatacombForComponents:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v15 = v4;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "saveCatacombForComponents: %p(%{public}@)\n", buf, 0x16u);
  }
  v13.receiver = self;
  v13.super_class = (Class)BiometricKitXPCServerMesa;
  v7 = -[BiometricKitXPCServer saveCatacombForComponents:](&v13, sel_saveCatacombForComponents_, v4);
  if ((_DWORD)v7)
  {
    v9 = v7;
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v15 = "err == 0 ";
      v16 = 2048;
      v17 = (char *)(int)v9;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v22 = 1024;
      v23 = 5975;
LABEL_36:
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (!LOBYTE(self->_sensorInfo.structSize))
    {
      v9 = 0;
      goto LABEL_16;
    }
    if (__osLog)
      v8 = __osLog;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEFAULT, "Removing legacy catacomb\n", buf, 2u);
    }
    v9 = RemoveFileFromCatacomb("TemplateList.cat");
    if (!(_DWORD)v9)
    {
      LOBYTE(self->_sensorInfo.structSize) = 0;
      goto LABEL_16;
    }
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v15 = "err == 0 ";
      v16 = 2048;
      v17 = (char *)(int)v9;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v22 = 1024;
      v23 = 5980;
      goto LABEL_36;
    }
  }
LABEL_16:
  -[NSMutableArray logSaveTemplateListError:](self->_vibrationPatterns, "logSaveTemplateListError:", v9);
  if (isInternalBuild())
    -[BiometricKitXPCServerMesa dumpSyslog](self, "dumpSyslog");
  if ((_DWORD)v9 == 269)
    -[__IOHIDEventSystemClient catacombCorrupted:](self->_hidClient, "catacombCorrupted:", 5);
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v9;
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "saveCatacombForComponents -> %d\n", buf, 8u);
  }

  return v9;
}

- (BOOL)isBaseSystem
{
  return 0;
}

- (int)saveCatacomb
{
  int v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[BiometricKitXPCServerMesa isBaseSystem](self, "isBaseSystem"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)BiometricKitXPCServerMesa;
  v3 = -[BiometricKitXPCServer saveCatacomb](&v6, sel_saveCatacomb);
  if (v3)
  {
    if (__osLog)
      v5 = __osLog;
    else
      v5 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "err == 0 ";
      v9 = 2048;
      v10 = v3;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v15 = 1024;
      v16 = 6036;
      _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v3;
}

- (int)loadCatacombForComponent:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  unsigned int v7;
  NSMutableArray *vibrationPatterns;
  void *v9;
  NSObject *v10;
  int v11;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v4;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "loadCatacombForComponent: %p\n", buf, 0xCu);
  }
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)BiometricKitXPCServerMesa;
    v7 = -[BiometricKitXPCServer loadCatacombForComponent:](&v16, sel_loadCatacombForComponent_, v4);
    if (!v7)
    {
      if (objc_msgSend(v4, "isUserComponent"))
      {
        vibrationPatterns = self->_vibrationPatterns;
        -[BiometricKitXPCServerMesa getProtectedConfigurationForUser:withClient:](self, "getProtectedConfigurationForUser:withClient:", objc_msgSend(v4, "userID"), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray logProtectedConfiguration:forUser:fromClient:](vibrationPatterns, "logProtectedConfiguration:forUser:fromClient:", v9, objc_msgSend(v4, "userID"), 0);

      }
      if (__osLogTrace)
        v10 = __osLogTrace;
      else
        v10 = v5;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = 0;
        _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "loadCatacombForComponent: -> %d\n", buf, 8u);
      }
      v11 = 0;
      goto LABEL_16;
    }
    v11 = v7;
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "err == 0 ";
      v19 = 2048;
      v20 = v11;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 6058;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "component";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 6055;
      _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 258;
  }
  if (isInternalBuild())
    -[BiometricKitXPCServerMesa dumpSyslog](self, "dumpSyslog");
  if (v11 == 269)
    -[__IOHIDEventSystemClient catacombCorrupted:](self->_hidClient, "catacombCorrupted:", 6);
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = v5;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v11;
    _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "loadCatacombForComponent: -> %d\n", buf, 8u);
  }
LABEL_16:

  return v11;
}

- (int)loadCatacomb
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[BiometricKitXPCServerMesa isBaseSystem](self, "isBaseSystem"))
  {
    -[BiometricKitXPCServerMesa clearTemplateList](self, "clearTemplateList");
    return 0;
  }
  if (-[BiometricKitXPCServerMesa sizeOfLegacyCatacomb](self, "sizeOfLegacyCatacomb"))
  {
    LOBYTE(self->_sensorInfo.structSize) = 1;
    v4 = MEMORY[0x24BDACB70];
    if (__osLog)
      v5 = __osLog;
    else
      v5 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEFAULT, "loadCatacomb --> restoreTemplateListSU:\n", buf, 2u);
    }
    v3 = -[BiometricKitXPCServerMesa restoreTemplateListSU](self, "restoreTemplateListSU");
    if (!v3)
    {
      -[BiometricKitXPCServer syncTemplateListForUser:](self, "syncTemplateListForUser:", 0xFFFFFFFFLL);
      return v3;
    }
    if (__osLog)
      v7 = __osLog;
    else
      v7 = v4;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 136316162;
    v10 = "err == 0 ";
    v11 = 2048;
    v12 = v3;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v17 = 1024;
    v18 = 6099;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BiometricKitXPCServerMesa;
    v3 = -[BiometricKitXPCServer loadCatacomb](&v8, sel_loadCatacomb);
    if (!v3)
      return v3;
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 136316162;
    v10 = "err == 0 ";
    v11 = 2048;
    v12 = v3;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v17 = 1024;
    v18 = 6105;
  }
  _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_24:
  if (v3 == 269)
  {
    -[__IOHIDEventSystemClient catacombCorrupted:](self->_hidClient, "catacombCorrupted:", 6);
    return 269;
  }
  return v3;
}

- (unsigned)catacombVersion
{
  return 196608;
}

- (int)performGetIdentitiesListCommand:(unsigned int)a3 outBuffer:(id)a4
{
  char *v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  int v10;
  NSObject *v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  unsigned int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a4;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v6;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performGetIdentitiesListCommand: %p\n", buf, 0xCu);
  }
  v19 = 0;
  v18 = 0;
  if (v6)
  {
    v19 = a3;
    v18 = objc_msgSend(v6, "length", v18);
    v9 = objc_retainAutorelease(v6);
    v10 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 66, 0, &v19, 4, objc_msgSend(v9, "bytes"), &v18);
    if (v10)
    {
      v12 = v10;
      if (__osLog)
        v15 = __osLog;
      else
        v15 = v7;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = "err == 0 ";
        v22 = 2048;
        v23 = v12;
        v24 = 2080;
        v25 = "";
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v28 = 1024;
        v29 = 6149;
        _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v18, 2) < 0xCCCCCCCCCCCCCCDuLL)
      {
        objc_msgSend(v9, "setLength:");
        if (__osLogTrace)
          v11 = __osLogTrace;
        else
          v11 = v7;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v21) = 0;
          _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_DEBUG, "performGetIdentitiesListCommand: -> %d\n", buf, 8u);
        }
        v12 = 0;
        goto LABEL_15;
      }
      if (__osLog)
        v16 = __osLog;
      else
        v16 = v7;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = "(size % sizeof(identity_v1_t)) == 0";
        v22 = 2048;
        v23 = 0;
        v24 = 2080;
        v25 = "";
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v28 = 1024;
        v29 = 6150;
        _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v12 = 261;
    }
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "outBuffer";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = "";
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v28 = 1024;
      v29 = 6144;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 258;
  }
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v7;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v12;
    _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "performGetIdentitiesListCommand: -> %d\n", buf, 8u);
  }
LABEL_15:

  return v12;
}

- (int)performGetCatacombStateCommand:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  int v8;
  NSObject *v9;
  int v10;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v4;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "performGetCatacombStateCommand: %p\n", buf, 0xCu);
  }
  v16 = 0;
  if (v4)
  {
    v16 = objc_msgSend(v4, "length");
    v7 = objc_retainAutorelease(v4);
    v8 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 60, 0, 0, 0, objc_msgSend(v7, "bytes"), &v16);
    if (v8)
    {
      v10 = v8;
      if (__osLog)
        v13 = __osLog;
      else
        v13 = v5;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v18 = "err == 0 ";
        v19 = 2048;
        v20 = v10;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v25 = 1024;
        v26 = 6177;
        _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if ((v16 & 7) == 0)
      {
        objc_msgSend(v7, "setLength:");
        if (__osLogTrace)
          v9 = __osLogTrace;
        else
          v9 = v5;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v18) = 0;
          _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_DEBUG, "performGetCatacombStateCommand: -> %d\n", buf, 8u);
        }
        v10 = 0;
        goto LABEL_15;
      }
      if (__osLog)
        v14 = __osLog;
      else
        v14 = v5;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v18 = "(size % sizeof(catacomb_state_v1_t)) == 0";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v25 = 1024;
        v26 = 6178;
        _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v10 = 261;
    }
  }
  else
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "outBuffer";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 6173;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v10 = 258;
  }
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = v5;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v10;
    _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "performGetCatacombStateCommand: -> %d\n", buf, 8u);
  }
LABEL_15:

  return v10;
}

- (int)performGetTemplatesValidityCommand:(unsigned int)a3 isValid:(BOOL *)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  char v18;
  unsigned int v19;
  uint8_t buf[4];
  _BYTE v21[18];
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v21 = a3;
    *(_WORD *)&v21[4] = 2048;
    *(_QWORD *)&v21[6] = a4;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performGetTemplatesValidityCommand: %d %p\n", buf, 0x12u);
  }
  v18 = 0;
  v17 = 1;
  v19 = a3;
  v9 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 50, 0, &v19, 4, &v18, &v17);
  if (v9)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(_QWORD *)&v21[10] = v9;
      v22 = 2080;
      v23 = "";
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v26 = 1024;
      v27 = 6569;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace)
      v15 = __osLogTrace;
    else
      v15 = v7;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v21 = v9;
      v11 = v15;
      v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (v17 == 1)
    {
      if (a4)
        *a4 = v18 != 0;
    }
    else
    {
      if (__osLog)
        v16 = __osLog;
      else
        v16 = v7;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v21 = "size == sizeof(outData)";
        *(_WORD *)&v21[8] = 2048;
        *(_QWORD *)&v21[10] = 0;
        v22 = 2080;
        v23 = "";
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v26 = 1024;
        v27 = 6570;
        _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    if (__osLogTrace)
      v10 = __osLogTrace;
    else
      v10 = v7;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v21 = 0;
      v11 = v10;
      v12 = OS_LOG_TYPE_DEBUG;
LABEL_15:
      _os_log_impl(&dword_24B74E000, v11, v12, "performGetTemplatesValidityCommand: -> %d\n", buf, 8u);
    }
  }
  return v9;
}

- (int)performRemoveIdentityCommand:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int128 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134217984;
    v15 = (const char *)a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "performRemoveIdentityCommand: %p\n", (uint8_t *)&v14, 0xCu);
  }
  v24 = 0uLL;
  v25 = 0;
  if (a3)
  {
    v24 = *(_OWORD *)&a3->var0;
    v25 = *(_DWORD *)&a3->var1[12];
    v7 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 13, 0, &v24, 20, 0, 0);
    if (!v7)
    {
      if (__osLogTrace)
        v8 = __osLogTrace;
      else
        v8 = v5;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v14 = 67109120;
        LODWORD(v15) = 0;
        _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performRemoveIdentityCommand: -> %d\n", (uint8_t *)&v14, 8u);
      }
      return 0;
    }
    v9 = v7;
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136316162;
      v15 = "err == 0 ";
      v16 = 2048;
      v17 = v9;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v22 = 1024;
      v23 = 6598;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136316162;
      v15 = "identity";
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v22 = 1024;
      v23 = 6594;
      _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    }
    v9 = 258;
  }
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v5;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = 67109120;
    LODWORD(v15) = v9;
    _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "performRemoveIdentityCommand: -> %d\n", (uint8_t *)&v14, 8u);
  }
  return v9;
}

- (int)performGetBiometrickitdInfoCommand:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  _BYTE v16[23];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v18 = (const char *)a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "performGetBiometrickitdInfoCommand: %p\n", buf, 0xCu);
  }
  memset(v16, 0, sizeof(v16));
  v15 = 23;
  if (a3)
  {
    v7 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 40, 0, 0, 0, v16, &v15);
    if (v7)
    {
      v9 = v7;
      if (__osLog)
        v12 = __osLog;
      else
        v12 = v5;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v18 = "err == 0 ";
        v19 = 2048;
        v20 = v9;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v25 = 1024;
        v26 = 6622;
        _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (v15 == 23)
      {
        *(_OWORD *)&a3->var0 = *(_OWORD *)v16;
        *(_QWORD *)((char *)&a3->var2 + 7) = *(_QWORD *)&v16[15];
        if (__osLogTrace)
          v8 = __osLogTrace;
        else
          v8 = v5;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v18) = 0;
          _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performGetBiometrickitdInfoCommand: -> %d\n", buf, 8u);
        }
        return 0;
      }
      if (__osLog)
        v13 = __osLog;
      else
        v13 = v5;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v18 = "size == sizeof(outData)";
        v19 = 2048;
        v20 = 0;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v25 = 1024;
        v26 = 6623;
        _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v9 = 261;
    }
  }
  else
  {
    if (__osLog)
      v11 = __osLog;
    else
      v11 = v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "info";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 6619;
      _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v9 = 258;
  }
  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = v5;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v9;
    _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "performGetBiometrickitdInfoCommand: -> %d\n", buf, 8u);
  }
  return v9;
}

- (int)performRemoveUserDataCommand:(unsigned int)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v12;
  NSObject *v13;
  unsigned int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "performRemoveUserDataCommand: %d\n", buf, 8u);
  }
  v14 = a3;
  v7 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 72, 0, &v14, 4, 0, 0);
  if (v7)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "err == 0 ";
      v17 = 2048;
      v18 = v7;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 6647;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace)
      v13 = __osLogTrace;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v7;
      v9 = v13;
      v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = 0;
      v9 = v8;
      v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_24B74E000, v9, v10, "performRemoveUserDataCommand: -> %d\n", buf, 8u);
    }
  }
  return v7;
}

- (int)performPrepareSaveCatacombCommand:(id)a3 outDataSize:(unsigned int *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  unsigned int v21;
  _BYTE buf[24];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a4;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performPrepareSaveCatacombCommand:outDataSize: %@, %p\n", buf, 0x16u);
  }
  v21 = 0;
  v20 = 4;
  if (!v6)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v7;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "component";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v23 = "";
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v26 = 1024;
      v27 = 6668;
      _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v13 = 258;
    goto LABEL_45;
  }
  v9 = -[BiometricKitXPCServerMesa getCommProtocolVersion](self, "getCommProtocolVersion");
  if (v9)
  {
    v13 = v9;
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v7;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "err == 0 ";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v26 = 1024;
    v27 = 6672;
LABEL_38:
    _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_45;
  }
  if (LOWORD(self->_connect) > 1u)
  {
    v11 = objc_msgSend(v6, "component");
    v12 = *(_QWORD *)(v11 + 16);
    *(_OWORD *)buf = *(_OWORD *)v11;
    *(_QWORD *)&buf[16] = v12;
    v10 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 61, 2, 0, buf, 24, &v21, &v20);
  }
  else
  {
    *(_DWORD *)buf = objc_msgSend(v6, "userID");
    v10 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 61, 1, 0, buf, 4, &v21, &v20);
  }
  v13 = v10;
  if (v10)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v7;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "err == 0 ";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v26 = 1024;
    v27 = 6686;
    goto LABEL_38;
  }
  if (v20 == 4)
  {
    if (a4)
      *a4 = v21;
    if (__osLogTrace)
      v14 = __osLogTrace;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 0;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_DEBUG, "performPrepareSaveCatacombCommand:outDataSize: -> %d\n", buf, 8u);
    }
    v13 = 0;
    goto LABEL_21;
  }
  if (__osLog)
    v18 = __osLog;
  else
    v18 = v7;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "size == sizeof(outData)";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v26 = 1024;
    v27 = 6687;
    _os_log_impl(&dword_24B74E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v13 = 261;
LABEL_45:
  if (__osLogTrace)
    v19 = __osLogTrace;
  else
    v19 = v7;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v13;
    _os_log_impl(&dword_24B74E000, v19, OS_LOG_TYPE_ERROR, "performPrepareSaveCatacombCommand:outDataSize: -> %d\n", buf, 8u);
  }
LABEL_21:

  return v13;
}

- (int)performCompleteSaveCatacombCommand:(id)a3 outBuffer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  _BYTE buf[24];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_DEBUG, "performCompleteSaveCatacombCommand:outBuffer: %@, %p\n", buf, 0x16u);
  }
  v20 = 0;
  if (!v6)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v8;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "component";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v25 = 1024;
    v26 = 6711;
    goto LABEL_30;
  }
  if (!v7)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v8;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "outBuffer";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v25 = 1024;
    v26 = 6712;
LABEL_30:
    _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_31:
    v14 = 258;
    goto LABEL_43;
  }
  v20 = objc_msgSend(v7, "length");
  v10 = -[BiometricKitXPCServerMesa getCommProtocolVersion](self, "getCommProtocolVersion");
  if (v10)
  {
    v14 = v10;
    if (__osLog)
      v18 = __osLog;
    else
      v18 = v8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 6717;
LABEL_42:
      _os_log_impl(&dword_24B74E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (LOWORD(self->_connect) > 1u)
    {
      v12 = objc_msgSend(v6, "component");
      v13 = *(_QWORD *)(v12 + 16);
      *(_OWORD *)buf = *(_OWORD *)v12;
      *(_QWORD *)&buf[16] = v13;
      v11 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 62, 2, 0, buf, 24, objc_msgSend(objc_retainAutorelease(v7), "bytes"), &v20);
    }
    else
    {
      *(_DWORD *)buf = objc_msgSend(v6, "userID");
      v11 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 62, 1, 0, buf, 4, objc_msgSend(objc_retainAutorelease(v7), "bytes"), &v20);
    }
    v14 = v11;
    if (!v11)
    {
      objc_msgSend(v7, "setLength:", v20);
      if (__osLogTrace)
        v15 = __osLogTrace;
      else
        v15 = v8;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 0;
        _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_DEBUG, "performCompleteSaveCatacombCommand:outBuffer: -> %d\n", buf, 8u);
      }
      v14 = 0;
      goto LABEL_19;
    }
    if (__osLog)
      v18 = __osLog;
    else
      v18 = v8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v25 = 1024;
      v26 = 6731;
      goto LABEL_42;
    }
  }
LABEL_43:
  if (__osLogTrace)
    v19 = __osLogTrace;
  else
    v19 = v8;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v14;
    _os_log_impl(&dword_24B74E000, v19, OS_LOG_TYPE_ERROR, "performCompleteSaveCatacombCommand:outBuffer: -> %d\n", buf, 8u);
  }
LABEL_19:

  return v14;
}

- (int)performConfirmSaveCatacombCommand:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _BYTE buf[24];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "performConfirmSaveCatacombCommand: %@\n", buf, 0xCu);
  }
  if (!v4)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "component";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v21 = 1024;
      v22 = 6753;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 258;
    goto LABEL_36;
  }
  v7 = -[BiometricKitXPCServerMesa getCommProtocolVersion](self, "getCommProtocolVersion");
  if (v7)
  {
    v11 = v7;
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v21 = 1024;
      v22 = 6757;
LABEL_35:
      _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (LOWORD(self->_connect) > 1u)
    {
      v9 = objc_msgSend(v4, "component");
      v10 = *(_QWORD *)(v9 + 16);
      *(_OWORD *)buf = *(_OWORD *)v9;
      *(_QWORD *)&buf[16] = v10;
      v8 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 63, 2, 0, buf, 24, 0, 0);
    }
    else
    {
      *(_DWORD *)buf = objc_msgSend(v4, "userID");
      v8 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 63, 1, 0, buf, 4, 0, 0);
    }
    v11 = v8;
    if (!v8)
    {
      if (__osLogTrace)
        v12 = __osLogTrace;
      else
        v12 = v5;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 0;
        _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_DEBUG, "performConfirmSaveCatacombCommand: -> %d\n", buf, 8u);
      }
      v11 = 0;
      goto LABEL_18;
    }
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "err == 0 ";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v21 = 1024;
      v22 = 6771;
      goto LABEL_35;
    }
  }
LABEL_36:
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v5;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v11;
    _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "performConfirmSaveCatacombCommand: -> %d\n", buf, 8u);
  }
LABEL_18:

  return v11;
}

- (int)performNoCatacombCommand:(unsigned int)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v12;
  NSObject *v13;
  unsigned int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "performNoCatacombCommand: %d\n", buf, 8u);
  }
  v14 = a3;
  v7 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 49, 0, &v14, 4, 0, 0);
  if (v7)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "err == 0 ";
      v17 = 2048;
      v18 = v7;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 6793;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace)
      v13 = __osLogTrace;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v7;
      v9 = v13;
      v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = 0;
      v9 = v8;
      v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_24B74E000, v9, v10, "performNoCatacombCommand: -> %d\n", buf, 8u);
    }
  }
  return v7;
}

- (int)performLoadCatacombCommand:(id)a3 inData:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  int v12;
  unsigned int v13;
  int v15;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v20;
  signed int v21;
  NSObject *v22;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  v7 = a4;
  v8 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = v9;
    v23 = 138412802;
    v24 = v6;
    v25 = 2048;
    v26 = v7;
    v27 = 2048;
    v28 = (const char *)objc_msgSend(v7, "length");
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "performLoadCatacombCommand:inData: %@, %p[%lu]\n", (uint8_t *)&v23, 0x20u);

  }
  if (v6)
  {
    v11 = objc_retainAutorelease(v7);
    v12 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 64, 0, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), 0, 0);
    v13 = 0;
    if (v12)
    {
      v21 = v12;
      if (__osLog)
        v22 = __osLog;
      else
        v22 = v8;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = 136316162;
        v24 = "err == 0 ";
        v25 = 2048;
        v26 = (id)v21;
        v27 = 2080;
        v28 = "";
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v31 = 1024;
        v32 = 6815;
        _os_log_impl(&dword_24B74E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
      }
      v13 = v21;
    }
  }
  else
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = v8;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = 136316162;
      v24 = "component";
      v25 = 2048;
      v26 = 0;
      v27 = 2080;
      v28 = "";
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v31 = 1024;
      v32 = 6812;
      _os_log_impl(&dword_24B74E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v23, 0x30u);
    }
    v13 = 258;
  }
  if (v13 >> 1 == 16385 || v13 == 402)
    v15 = 269;
  else
    v15 = v13;
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v8;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v23 = 67109120;
      LODWORD(v24) = v15;
      v17 = v16;
      v18 = OS_LOG_TYPE_ERROR;
LABEL_22:
      _os_log_impl(&dword_24B74E000, v17, v18, "performLoadCatacombCommand:inData: -> %d\n", (uint8_t *)&v23, 8u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v23 = 67109120;
    LODWORD(v24) = 0;
    v17 = v16;
    v18 = OS_LOG_TYPE_DEBUG;
    goto LABEL_22;
  }

  return v15;
}

- (int)performSaveBioLockoutRecordCommand:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  int v8;
  NSObject *v9;
  int v10;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v17 = v4;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "performSaveBioLockoutRecordCommand: %p\n", buf, 0xCu);
  }
  v15 = 0;
  if (v4)
  {
    v15 = objc_msgSend(v4, "length");
    v7 = objc_retainAutorelease(v4);
    v8 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 74, 0, 0, 0, objc_msgSend(v7, "bytes"), &v15);
    if (!v8)
    {
      objc_msgSend(v7, "setLength:", v15);
      if (__osLogTrace)
        v9 = __osLogTrace;
      else
        v9 = v5;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = 0;
        _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_DEBUG, "performSaveBioLockoutRecordCommand: -> %d\n", buf, 8u);
      }
      v10 = 0;
      goto LABEL_14;
    }
    v10 = v8;
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "err == 0 ";
      v18 = 2048;
      v19 = v10;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v24 = 1024;
      v25 = 6844;
      _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "outBuffer";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v24 = 1024;
      v25 = 6840;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v10 = 258;
  }
  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = v5;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v10;
    _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "performSaveBioLockoutRecordCommand: -> %d\n", buf, 8u);
  }
LABEL_14:

  return v10;
}

- (int)performLoadBioLockoutRecordCommand:(id)a3
{
  char *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  int v9;
  uint64_t v10;
  int v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = v6;
    v18 = 134218240;
    v19 = v4;
    v20 = 2048;
    v21 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEBUG, "performLoadBioLockoutRecordCommand: %p[%lu]\n", (uint8_t *)&v18, 0x16u);

  }
  v8 = objc_retainAutorelease(v4);
  v9 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 75, 0, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 0, 0);
  v10 = v9;
  if (v9)
  {
    v17 = (__osLog ? __osLog : v5);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      v19 = "err == 0 ";
      v20 = 2048;
      v21 = v10;
      v22 = 2080;
      v23 = "";
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v26 = 1024;
      v27 = 6867;
      _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
  }
  if (v10 >> 1 == 16385 || (_DWORD)v10 == 402)
    v12 = 269;
  else
    v12 = v10;
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v5;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      LODWORD(v19) = v12;
      v14 = v13;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_21:
      _os_log_impl(&dword_24B74E000, v14, v15, "performLoadBioLockoutRecordCommand -> %d\n", (uint8_t *)&v18, 8u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v18 = 67109120;
    LODWORD(v19) = 0;
    v14 = v13;
    v15 = OS_LOG_TYPE_DEBUG;
    goto LABEL_21;
  }

  return v12;
}

- (int)performRequestMaxIdentityCountCommand:(unsigned int *)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  unsigned int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v17 = (const char *)a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "performRequestMaxIdentityCountCommand: %p\n", buf, 0xCu);
  }
  v15 = 0;
  v14 = 4;
  v7 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 15, 0, 0, 0, &v15, &v14);
  if (v7)
  {
    v9 = v7;
    if (__osLog)
      v11 = __osLog;
    else
      v11 = v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "err == 0 ";
      v18 = 2048;
      v19 = v9;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v24 = 1024;
      v25 = 6894;
      _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v14 == 4)
    {
      if (a3)
        *a3 = v15;
      if (__osLogTrace)
        v8 = __osLogTrace;
      else
        v8 = v5;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = 0;
        _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performRequestMaxIdentityCountCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "size == sizeof(outData)";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v24 = 1024;
      v25 = 6895;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v9 = 261;
  }
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v5;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v9;
    _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "performRequestMaxIdentityCountCommand -> %d\n", buf, 8u);
  }
  return v9;
}

- (int)performGetFreeIdentityCountCommand:(unsigned int)a3 outCount:(unsigned int *)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint8_t buf[4];
  _BYTE v21[18];
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v21 = a3;
    *(_WORD *)&v21[4] = 2048;
    *(_QWORD *)&v21[6] = a4;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performRequestMaxIdentityCountCommand: %d, %p\n", buf, 0x12u);
  }
  v18 = 0;
  v19 = a3;
  v17 = 4;
  v9 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 65, 0, &v19, 4, &v18, &v17);
  if (v9)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(_QWORD *)&v21[10] = v9;
      v22 = 2080;
      v23 = "";
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v26 = 1024;
      v27 = 6923;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace)
      v15 = __osLogTrace;
    else
      v15 = v7;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v21 = v9;
      v11 = v15;
      v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (v17 == 4)
    {
      if (a4)
        *a4 = v18;
    }
    else
    {
      if (__osLog)
        v16 = __osLog;
      else
        v16 = v7;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v21 = "size == sizeof(outData)";
        *(_WORD *)&v21[8] = 2048;
        *(_QWORD *)&v21[10] = 0;
        v22 = 2080;
        v23 = "";
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v26 = 1024;
        v27 = 6924;
        _os_log_impl(&dword_24B74E000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v18 = 0;
    }
    if (__osLogTrace)
      v10 = __osLogTrace;
    else
      v10 = v7;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v21 = 0;
      v11 = v10;
      v12 = OS_LOG_TYPE_DEBUG;
LABEL_15:
      _os_log_impl(&dword_24B74E000, v11, v12, "performRequestMaxIdentityCountCommand -> %d\n", buf, 8u);
    }
  }
  return v9;
}

- (int)performGetCatacombUUIDCommand:(unsigned int)a3 outUUID:(id *)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  unsigned int v16;
  uint8_t buf[4];
  _BYTE v18[18];
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v18 = a3;
    *(_WORD *)&v18[4] = 2048;
    *(_QWORD *)&v18[6] = a4;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performGetCatacombUUIDCommand: %d, %p\n", buf, 0x12u);
  }
  v25[0] = 0;
  v25[1] = 0;
  v15 = 16;
  v16 = a3;
  v9 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 56, 0, &v16, 4, v25, &v15);
  if (v9)
  {
    v11 = v9;
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v7;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v18 = "err == 0 ";
      *(_WORD *)&v18[8] = 2048;
      *(_QWORD *)&v18[10] = v11;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 6952;
LABEL_27:
      _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v15 == 16)
    {
      if (a4)
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v25);
      if (__osLogTrace)
        v10 = __osLogTrace;
      else
        v10 = v7;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v18 = 0;
        _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "performGetCatacombUUIDCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    v11 = -536870212;
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v7;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v18 = "size == sizeof(outData)";
      *(_WORD *)&v18[8] = 2048;
      *(_QWORD *)&v18[10] = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 6953;
      goto LABEL_27;
    }
  }
  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = v7;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v18 = v11;
    _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "performGetCatacombUUIDCommand -> %d\n", buf, 8u);
  }
  return v11;
}

- (int)performGetCatacombHashCommand:(unsigned int)a3 outHash:(id *)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  NSObject *v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  unsigned int v17;
  uint8_t buf[4];
  _BYTE v19[18];
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  _OWORD v26[2];
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v19 = a3;
    *(_WORD *)&v19[4] = 2048;
    *(_QWORD *)&v19[6] = a4;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performGetCatacombHashCommand: %d, %p\n", buf, 0x12u);
  }
  v27 = 0;
  memset(v26, 0, sizeof(v26));
  v16 = 33;
  v17 = a3;
  v9 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 58, 0, &v17, 4, v26, &v16);
  if (v9)
  {
    v12 = v9;
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      *(_QWORD *)&v19[10] = v12;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v24 = 1024;
      v25 = 6981;
LABEL_30:
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v16 == 33)
    {
      if (a4)
      {
        if (LOBYTE(v26[0]))
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", (char *)v26 + 1, 32);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        *a4 = v10;
      }
      if (__osLogTrace)
        v11 = __osLogTrace;
      else
        v11 = v7;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v19 = 0;
        _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_DEBUG, "performGetCatacombHashCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    v12 = -536870212;
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v19 = "size == sizeof(outData)";
      *(_WORD *)&v19[8] = 2048;
      *(_QWORD *)&v19[10] = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v24 = 1024;
      v25 = 6982;
      goto LABEL_30;
    }
  }
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = v7;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v19 = v12;
    _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "performGetCatacombHashCommand -> %d\n", buf, 8u);
  }
  return v12;
}

- (int)performDropUnlockTokenCommand
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_DEBUG, "performDropUnlockTokenCommand:\n", (uint8_t *)&v12, 2u);
  }
  v5 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 57, 0, 0, 0, 0, 0);
  if (v5)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v3;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "err == 0 ";
      v14 = 2048;
      v15 = v5;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v20 = 1024;
      v21 = 7011;
      _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    if (__osLogTrace)
      v11 = __osLogTrace;
    else
      v11 = v3;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 67109120;
      LODWORD(v13) = v5;
      v7 = v11;
      v8 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace)
      v6 = __osLogTrace;
    else
      v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 67109120;
      LODWORD(v13) = 0;
      v7 = v6;
      v8 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_24B74E000, v7, v8, "performDropUnlockTokenCommand -> %d\n", (uint8_t *)&v12, 8u);
    }
  }
  return v5;
}

- (int)performForceBioLockoutCommand:(unsigned int)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v12;
  NSObject *v13;
  unsigned int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "performForceBioLockoutCommand: %d\n", buf, 8u);
  }
  v14 = a3;
  v7 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 73, 0, &v14, 4, 0, 0);
  if (v7)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "err == 0 ";
      v17 = 2048;
      v18 = v7;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 7033;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (__osLogTrace)
      v13 = __osLogTrace;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v7;
      v9 = v13;
      v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }
  }
  else
  {
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = 0;
      v9 = v8;
      v10 = OS_LOG_TYPE_DEBUG;
LABEL_12:
      _os_log_impl(&dword_24B74E000, v9, v10, "performForceBioLockoutCommand -> %d\n", buf, 8u);
    }
  }
  return v7;
}

- (int)performGetSKSLockStateCommand:(unsigned int)a3 outState:(unsigned int *)a4
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = a3;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performGetSKSLockStateCommand: %d\n", buf, 8u);
  }
  v17 = 0;
  v18 = a3;
  v16 = 4;
  v9 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 39, 0, &v18, 4, &v17, &v16);
  if (v9)
  {
    v11 = v9;
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v7;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "err == 0 ";
      v21 = 2048;
      v22 = v11;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v27 = 1024;
      v28 = 7057;
      _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v16 == 4)
    {
      if (a4)
        *a4 = v17;
      if (__osLogTrace)
        v10 = __osLogTrace;
      else
        v10 = v7;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v20) = 0;
        _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "performGetSKSLockStateCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "size == sizeof(outData)";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v27 = 1024;
      v28 = 7058;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11 = 261;
  }
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = v7;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = v11;
    _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "performGetSKSLockStateCommand -> %d\n", buf, 8u);
  }
  return v11;
}

- (int)performGetLastMatchEventCommand:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  _BYTE v25[29];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v16 = (const char *)a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "performGetLastMatchEventCommand: %p\n", buf, 0xCu);
  }
  *(_OWORD *)v25 = 0uLL;
  *(_QWORD *)&v25[21] = 0;
  *(_QWORD *)&v25[16] = 0;
  v14 = 29;
  v7 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 78, 0, 0, 0, v25, &v14);
  if (v7)
  {
    v9 = v7;
    if (__osLog)
      v11 = __osLog;
    else
      v11 = v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "err == 0 ";
      v17 = 2048;
      v18 = v9;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 7115;
      _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (v14 == 29)
    {
      if (a3)
      {
        *(_OWORD *)&a3->var0 = *(_OWORD *)v25;
        *(_OWORD *)((char *)&a3->var2.var0 + 1) = *(_OWORD *)&v25[13];
      }
      if (__osLogTrace)
        v8 = __osLogTrace;
      else
        v8 = v5;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = 0;
        _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "performGetLastMatchEventCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    if (__osLog)
      v12 = __osLog;
    else
      v12 = v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "size == sizeof(outData)";
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v23 = 1024;
      v24 = 7116;
      _os_log_impl(&dword_24B74E000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v9 = 261;
  }
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v5;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v9;
    _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "performGetLastMatchEventCommand -> %d\n", buf, 8u);
  }
  return v9;
}

- (int)performGetProtectedConfigCommand:(unsigned int)a3 outSetCfg:(id *)a4 outEffectiveCfg:(id *)a5
{
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  unsigned int v28;
  uint8_t buf[4];
  _BYTE v30[28];
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v30 = a3;
    *(_WORD *)&v30[4] = 2048;
    *(_QWORD *)&v30[6] = a4;
    *(_WORD *)&v30[14] = 2048;
    *(_QWORD *)&v30[16] = a5;
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "performGetProtectedConfigCommand: %d %p %p\n", buf, 0x1Cu);
  }
  v26 = 0u;
  v27 = 0u;
  v25 = 32;
  v28 = a3;
  v11 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 46, 0, &v28, 4, &v26, &v25);
  if (v11)
  {
    v19 = v11;
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v9;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v30 = "err == 0 ";
      *(_WORD *)&v30[8] = 2048;
      *(_QWORD *)&v30[10] = v19;
      *(_WORD *)&v30[18] = 2080;
      *(_QWORD *)&v30[20] = "";
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v33 = 1024;
      v34 = 7144;
      _os_log_impl(&dword_24B74E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_43;
  }
  if (v25 != 32)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v9;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v30 = "size == sizeof(outData)";
      *(_WORD *)&v30[8] = 2048;
      *(_QWORD *)&v30[10] = 0;
      *(_WORD *)&v30[18] = 2080;
      *(_QWORD *)&v30[20] = "";
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v33 = 1024;
      v34 = 7145;
      _os_log_impl(&dword_24B74E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_14;
  }
  if (!a4)
    goto LABEL_11;
  v12 = objc_alloc_init(MEMORY[0x24BE0CF38]);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "setUnlockEnabled:", v26);
    objc_msgSend(v13, "setIdentificationEnabled:", DWORD1(v26));
    objc_msgSend(v13, "setLoginEnabled:", DWORD2(v26));
    objc_msgSend(v13, "setApplePayEnabled:", HIDWORD(v26));
    v14 = objc_retainAutorelease(v13);
    *a4 = v14;

LABEL_11:
    if (!a5)
    {
LABEL_14:
      if (__osLogTrace)
        v18 = __osLogTrace;
      else
        v18 = v9;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v30 = 0;
        _os_log_impl(&dword_24B74E000, v18, OS_LOG_TYPE_DEBUG, "performGetProtectedConfigCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    v15 = objc_alloc_init(MEMORY[0x24BE0CF38]);
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, "setUnlockEnabled:", v27);
      objc_msgSend(v16, "setIdentificationEnabled:", DWORD1(v27));
      objc_msgSend(v16, "setLoginEnabled:", DWORD2(v27));
      objc_msgSend(v16, "setApplePayEnabled:", HIDWORD(v27));
      v17 = objc_retainAutorelease(v16);
      *a5 = v17;

      goto LABEL_14;
    }
    if (__osLog)
      v23 = __osLog;
    else
      v23 = v9;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v30 = "effectiveCfg";
    *(_WORD *)&v30[8] = 2048;
    *(_QWORD *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(_QWORD *)&v30[20] = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v33 = 1024;
    v34 = 7161;
    goto LABEL_41;
  }
  if (__osLog)
    v23 = __osLog;
  else
    v23 = v9;
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    goto LABEL_42;
  *(_DWORD *)buf = 136316162;
  *(_QWORD *)v30 = "setCfg";
  *(_WORD *)&v30[8] = 2048;
  *(_QWORD *)&v30[10] = 0;
  *(_WORD *)&v30[18] = 2080;
  *(_QWORD *)&v30[20] = "";
  v31 = 2080;
  v32 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
  v33 = 1024;
  v34 = 7149;
LABEL_41:
  _os_log_impl(&dword_24B74E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_42:
  v19 = 261;
LABEL_43:
  if (__osLogTrace)
    v24 = __osLogTrace;
  else
    v24 = v9;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = v19;
    _os_log_impl(&dword_24B74E000, v24, OS_LOG_TYPE_ERROR, "performGetProtectedConfigCommand -> %d\n", buf, 8u);
  }
  return v19;
}

- (int)performGetSystemProtectedConfigCommand:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  unsigned int v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v30 = (const char *)a3;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "performGetSystemProtectedConfigCommand: %p\n", buf, 0xCu);
  }
  v6 = -[BiometricKitXPCServerMesa getCommProtocolVersion](self, "getCommProtocolVersion");
  if (v6)
  {
    v7 = v6;
    if (__osLog)
      v20 = __osLog;
    else
      v20 = v4;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v30 = "err == 0 ";
      v31 = 2048;
      v32 = v7;
      v33 = 2080;
      v34 = "";
      v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v37 = 1024;
      v38 = 7191;
      _os_log_impl(&dword_24B74E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_59;
  }
  if (LOWORD(self->_connect) >= 3u)
  {
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    v25 = 36;
    v7 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 67, 2, 0, 0, 0, &v26, &v25);
    if (!v7)
    {
      if (v25 == 36)
      {
        v8 = v26;
        v10 = HIDWORD(v26);
        v9 = v27;
        v12 = DWORD1(v27);
        v11 = DWORD2(v27);
        v14 = HIDWORD(v27);
        v13 = v28;
        goto LABEL_14;
      }
      if (__osLog)
        v22 = __osLog;
      else
        v22 = v4;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v30 = "size == sizeof(outData)";
        v31 = 2048;
        v32 = 0;
        v33 = 2080;
        v34 = "";
        v35 = 2080;
        v36 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v37 = 1024;
        v38 = 7198;
        goto LABEL_57;
      }
LABEL_58:
      if (v7)
        goto LABEL_59;
LABEL_19:
      if (__osLogTrace)
        v18 = __osLogTrace;
      else
        v18 = v4;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = 0;
        _os_log_impl(&dword_24B74E000, v18, OS_LOG_TYPE_DEBUG, "performGetSystemProtectedConfigCommand -> %d\n", buf, 8u);
      }
      return 0;
    }
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v4;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_58;
    *(_DWORD *)buf = 136316162;
    v30 = "err == 0 ";
    v31 = 2048;
    v32 = v7;
    v33 = 2080;
    v34 = "";
    v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v37 = 1024;
    v38 = 7197;
LABEL_57:
    _os_log_impl(&dword_24B74E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_58;
  }
  v26 = 0uLL;
  DWORD2(v27) = 0;
  *(_QWORD *)&v27 = 0;
  v25 = 28;
  v7 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 67, 1, 0, 0, 0, &v26, &v25);
  if (v7)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v4;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_58;
    *(_DWORD *)buf = 136316162;
    v30 = "err == 0 ";
    v31 = 2048;
    v32 = v7;
    v33 = 2080;
    v34 = "";
    v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v37 = 1024;
    v38 = 7206;
    goto LABEL_57;
  }
  if (v25 != 28)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v4;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v30 = "size == sizeof(outData)";
      v31 = 2048;
      v32 = 0;
      v33 = 2080;
      v34 = "";
      v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v37 = 1024;
      v38 = 7207;
      goto LABEL_57;
    }
    goto LABEL_58;
  }
  v13 = 0;
  v14 = 0;
  v8 = v26;
  v10 = HIDWORD(v26);
  v9 = v27;
  v12 = DWORD1(v27);
  v11 = DWORD2(v27);
LABEL_14:
  if (!a3)
    goto LABEL_19;
  v15 = objc_alloc_init(MEMORY[0x24BE0CF30]);
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, "setUnlockTokenMaxLifetime:", v8);
    objc_msgSend(v16, "setBiometryEnabled:", v10);
    objc_msgSend(v16, "setUnlockEnabled:", v9);
    objc_msgSend(v16, "setIdentificationEnabled:", v12);
    objc_msgSend(v16, "setLoginEnabled:", v11);
    if (LOWORD(self->_connect) >= 3u)
    {
      objc_msgSend(v16, "setBioMatchLifespan:", v14);
      objc_msgSend(v16, "setPasscodeInputLifespan:", v13);
    }
    v17 = objc_retainAutorelease(v16);
    *a3 = v17;

    v4 = MEMORY[0x24BDACB70];
    goto LABEL_19;
  }
  if (__osLog)
    v21 = __osLog;
  else
    v21 = v4;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v30 = "cfg";
    v31 = 2048;
    v32 = 0;
    v33 = 2080;
    v34 = "";
    v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v37 = 1024;
    v38 = 7214;
    _os_log_impl(&dword_24B74E000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v7 = 261;
LABEL_59:
  if (__osLogTrace)
    v23 = __osLogTrace;
  else
    v23 = v4;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v7;
    _os_log_impl(&dword_24B74E000, v23, OS_LOG_TYPE_ERROR, "performGetSystemProtectedConfigCommand -> %d\n", buf, 8u);
  }
  return v7;
}

- (int)performSetProtectedConfigCommand:(unsigned int)a3 cfg:(id)a4 authData:(id *)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  __int128 v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint8_t buf[4];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    LODWORD(v30) = a3;
    WORD2(v30) = 2048;
    *(_QWORD *)((char *)&v30 + 6) = v8;
    HIWORD(v30) = 2048;
    *(_QWORD *)&v31 = a5;
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "performSetProtectedConfigCommand: %d %p %p\n", buf, 0x1Cu);
  }
  v33 = 0;
  v32 = 0u;
  v31 = 0u;
  *(_DWORD *)buf = a3;
  *(_QWORD *)&v30 = -1;
  *((_QWORD *)&v30 + 1) = -1;
  if (v8)
  {
    LODWORD(v30) = objc_msgSend(v8, "unlockEnabled");
    DWORD1(v30) = objc_msgSend(v8, "identificationEnabled");
    DWORD2(v30) = objc_msgSend(v8, "loginEnabled");
    HIDWORD(v30) = objc_msgSend(v8, "applePayEnabled");
  }
  if (a5)
  {
    v11 = *(_OWORD *)&a5->var2[8];
    v31 = *(_OWORD *)&a5->var0;
    v32 = v11;
    v33 = *(_QWORD *)&a5->var2[24];
  }
  v12 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 47, 0, buf, 60, 0, 0);
  if (v12)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v9;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      v20 = "err == 0 ";
      v21 = 2048;
      v22 = v12;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v27 = 1024;
      v28 = 7264;
      _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    if (__osLogTrace)
      v18 = __osLogTrace;
    else
      v18 = v9;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = 67109120;
      LODWORD(v20) = v12;
      v14 = v18;
      v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (__osLogTrace)
      v13 = __osLogTrace;
    else
      v13 = v9;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v19 = 67109120;
      LODWORD(v20) = 0;
      v14 = v13;
      v15 = OS_LOG_TYPE_DEBUG;
LABEL_16:
      _os_log_impl(&dword_24B74E000, v14, v15, "performSetProtectedConfigCommand -> %d\n", (uint8_t *)&v19, 8u);
    }
  }

  return v12;
}

- (int)performSetSystemProtectedConfigCommand:(id)a3 authData:(id *)a4
{
  id v6;
  __objc2_class *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int connect_low;
  int v16;
  int v17;
  int v18;
  int v19;
  __int128 v20;
  int v21;
  int v22;
  NSObject *v23;
  __int128 v24;
  int v25;
  NSObject *v26;
  uint8_t *v28;
  NSObject *v29;
  NSObject *superclass;
  int v31;
  uint8_t v32[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  uint8_t buf[4];
  uint64_t v43;
  _BYTE v44[12];
  _BYTE v45[44];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = MesaCoreAnalyticsWeeklyEvent;
  v8 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v43 = (uint64_t)v6;
    *(_WORD *)v44 = 2048;
    *(_QWORD *)&v44[2] = a4;
    _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_DEBUG, "performSetSystemProtectedConfigCommand: %p %p\n", buf, 0x16u);
  }
  v10 = -[BiometricKitXPCServerMesa getCommProtocolVersion](self, "getCommProtocolVersion");
  if (v10)
  {
    v22 = v10;
    if (__osLog)
      v23 = __osLog;
    else
      v23 = v8;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_DWORD *)buf = 136316162;
    v43 = (uint64_t)"err == 0 ";
    *(_WORD *)v44 = 2048;
    *(_QWORD *)&v44[2] = v22;
    *(_WORD *)&v44[10] = 2080;
    *(_QWORD *)v45 = "";
    *(_WORD *)&v45[8] = 2080;
    *(_QWORD *)&v45[10] = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Biometri"
                          "cKitXPCServerMesa.m";
    *(_WORD *)&v45[18] = 1024;
    *(_DWORD *)&v45[20] = 7288;
    v28 = buf;
    goto LABEL_51;
  }
  if (v6)
  {
    v11 = objc_msgSend(v6, "unlockTokenMaxLifetime");
    v12 = objc_msgSend(v6, "biometryEnabled");
    v13 = objc_msgSend(v6, "unlockEnabled");
    v31 = objc_msgSend(v6, "identificationEnabled");
    v14 = objc_msgSend(v6, "loginEnabled");
    connect_low = LOWORD(self->_connect);
    v16 = objc_msgSend(v6, "bioMatchLifespan");
    v17 = v16;
    if (connect_low < 3)
    {
      if (v16 != -1 || (v18 = objc_msgSend(v6, "passcodeInputLifespan"), v18 != -1))
      {
        v8 = MEMORY[0x24BDACB70];
        if (__osLog)
          v29 = __osLog;
        else
          v29 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v43 = (uint64_t)"(cfg.bioMatchLifespan == -1) && (cfg.passcodeInputLifespan == -1)";
          *(_WORD *)v44 = 2048;
          *(_QWORD *)&v44[2] = 0;
          *(_WORD *)&v44[10] = 2080;
          *(_QWORD *)v45 = "";
          *(_WORD *)&v45[8] = 2080;
          *(_QWORD *)&v45[10] = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/Bi"
                                "ometricKitXPCServerMesa.m";
          *(_WORD *)&v45[18] = 1024;
          *(_DWORD *)&v45[20] = 7304;
          _os_log_impl(&dword_24B74E000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v22 = 258;
        v7 = MesaCoreAnalyticsWeeklyEvent;
        goto LABEL_52;
      }
      v17 = -1;
    }
    else
    {
      v18 = objc_msgSend(v6, "passcodeInputLifespan");
    }
    v19 = v31;
  }
  else
  {
    v19 = -1;
    v14 = -1;
    v17 = -1;
    v18 = -1;
    v13 = -1;
    v12 = -1;
    v11 = -1;
  }
  if (LOWORD(self->_connect) < 3u)
  {
    memset(&v45[4], 0, 40);
    *(_DWORD *)buf = v11;
    v43 = -1;
    *(_DWORD *)v44 = v12;
    *(_DWORD *)&v44[4] = v13;
    *(_DWORD *)&v44[8] = v19;
    *(_DWORD *)v45 = v14;
    if (a4)
    {
      v24 = *(_OWORD *)&a4->var2[8];
      *(_OWORD *)&v45[4] = *(_OWORD *)&a4->var0;
      *(_OWORD *)&v45[20] = v24;
      *(_QWORD *)&v45[36] = *(_QWORD *)&a4->var2[24];
    }
    v25 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 68, 1, 0, buf, 68, 0, 0);
    v8 = MEMORY[0x24BDACB70];
    v7 = MesaCoreAnalyticsWeeklyEvent;
    if (v25)
    {
      v22 = v25;
      if (__osLog)
        v23 = __osLog;
      else
        v23 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_52;
      *(_DWORD *)v32 = 136316162;
      v33 = "err == 0 ";
      v34 = 2048;
      v35 = v22;
      v36 = 2080;
      v37 = "";
      v38 = 2080;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v40 = 1024;
      v41 = 7325;
LABEL_50:
      v28 = v32;
LABEL_51:
      _os_log_impl(&dword_24B74E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v28, 0x30u);
LABEL_52:
      if (v7[15].superclass)
        superclass = v7[15].superclass;
      else
        superclass = v8;
      if (os_log_type_enabled(superclass, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = v22;
        _os_log_impl(&dword_24B74E000, superclass, OS_LOG_TYPE_ERROR, "performSetSystemProtectedConfigCommand -> %d\n", buf, 8u);
      }
      goto LABEL_33;
    }
  }
  else
  {
    v46 = 0;
    memset(&v45[12], 0, 32);
    *(_DWORD *)buf = v11;
    v43 = -1;
    *(_DWORD *)v44 = v12;
    *(_DWORD *)&v44[4] = v13;
    *(_DWORD *)&v44[8] = v19;
    *(_DWORD *)v45 = v14;
    *(_DWORD *)&v45[4] = v17;
    *(_DWORD *)&v45[8] = v18;
    if (a4)
    {
      v20 = *(_OWORD *)&a4->var2[8];
      *(_OWORD *)&v45[12] = *(_OWORD *)&a4->var0;
      *(_OWORD *)&v45[28] = v20;
      v46 = *(_QWORD *)&a4->var2[24];
    }
    v21 = -[BiometricKitXPCServerMesa performCommand:version:inValue:inData:inSize:outData:outSize:](self, "performCommand:version:inValue:inData:inSize:outData:outSize:", 68, 2, 0, buf, 76, 0, 0);
    v8 = MEMORY[0x24BDACB70];
    v7 = MesaCoreAnalyticsWeeklyEvent;
    if (v21)
    {
      v22 = v21;
      if (__osLog)
        v23 = __osLog;
      else
        v23 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_52;
      *(_DWORD *)v32 = 136316162;
      v33 = "err == 0 ";
      v34 = 2048;
      v35 = v22;
      v36 = 2080;
      v37 = "";
      v38 = 2080;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v40 = 1024;
      v41 = 7315;
      goto LABEL_50;
    }
  }
  if (v7[15].superclass)
    v26 = v7[15].superclass;
  else
    v26 = v8;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v43) = 0;
    _os_log_impl(&dword_24B74E000, v26, OS_LOG_TYPE_DEBUG, "performSetSystemProtectedConfigCommand -> %d\n", buf, 8u);
  }
  v22 = 0;
LABEL_33:

  return v22;
}

- (int)performRequestMessageDataCommand:(unint64_t)a3 size:(unint64_t)a4 outData:(id *)a5
{
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  id *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v25 = (const char *)a3;
    v26 = 2048;
    v27 = a4;
    v28 = 2048;
    v29 = a5;
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "performRequestMessageDataCommand:size:outData: 0x%llx %zu %p\n", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a4, a4, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_retainAutorelease(v11);
    v14 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 43, 0, &v23, 8, objc_msgSend(v13, "mutableBytes"), &v22);
    if (v14)
    {
      v16 = v14;
      if (__osLog)
        v19 = __osLog;
      else
        v19 = v9;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v25 = "err == 0 ";
        v26 = 2048;
        v27 = v16;
        v28 = 2080;
        v29 = (id *)"";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v32 = 1024;
        v33 = 7352;
        _os_log_impl(&dword_24B74E000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (v22 == a4)
      {
        *a5 = objc_retainAutorelease(v13);
        if (__osLogTrace)
          v15 = __osLogTrace;
        else
          v15 = v9;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v25) = 0;
          _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_DEBUG, "performRequestMessageDataCommand -> %d\n", buf, 8u);
        }
        v16 = 0;
        goto LABEL_15;
      }
      if (__osLog)
        v20 = __osLog;
      else
        v20 = v9;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v25 = "messageDataSize == size";
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = (id *)"";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
        v32 = 1024;
        v33 = 7353;
        _os_log_impl(&dword_24B74E000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v16 = 258;
    }
  }
  else
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = v9;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v25 = "messageData";
      v26 = 2048;
      v27 = 0;
      v28 = 2080;
      v29 = (id *)"";
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v32 = 1024;
      v33 = 7349;
      _os_log_impl(&dword_24B74E000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v16 = 263;
  }
  if (__osLogTrace)
    v21 = __osLogTrace;
  else
    v21 = v9;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v16;
    _os_log_impl(&dword_24B74E000, v21, OS_LOG_TYPE_ERROR, "performRequestMessageDataCommand -> %d\n", buf, 8u);
  }
LABEL_15:

  return v16;
}

- (void)dumpSyslog
{
  -[BiometricKitXPCServerMesa dumpSyslogWithDelay:](self, "dumpSyslogWithDelay:", 0.0);
  -[BiometricKitXPCServerMesa dumpSyslogWithDelay:](self, "dumpSyslogWithDelay:", 1.0);
}

- (void)dumpSyslogWithDelay:(double)a3
{
  dispatch_time_t v5;
  _QWORD v6[6];

  v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__BiometricKitXPCServerMesa_dumpSyslogWithDelay___block_invoke;
  v6[3] = &unk_251CA0788;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v6);
}

void __49__BiometricKitXPCServerMesa_dumpSyslogWithDelay___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BD27898]();
  objc_msgSend(*(id *)(a1 + 32), "getSyslog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("There are no Mesa messages in syslog.\n");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-------- SysLog start (delay: %.0fs) --------\n%@-------- SysLog end (delay: %.0fs) -------- "), *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "writeStringToPersistentLog:", v5);

  objc_autoreleasePoolPop(v2);
}

- (id)getSyslog
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BiometricKitXPCServerMesa getSyslogArray](self, "getSyslogArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (!v5)
        {
          objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_251CA43A8);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v8);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getSyslogArray
{
  void *v2;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (__osLog)
      v4 = __osLog;
    else
      v4 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136316162;
      v6 = "messages";
      v7 = 2048;
      v8 = 0;
      v9 = 2080;
      v10 = "";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v13 = 1024;
      v14 = 7437;
      _os_log_impl(&dword_24B74E000, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v5, 0x30u);
    }
  }
  return v2;
}

- (id)getSyslogForQuery:(__asl_object_s *)a3 withFilter:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3, a4);
}

- (void)registerForLiftToWakeNotifications:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "registerForLiftToWakeNotifications: %d\n", (uint8_t *)v11, 8u);
  }
  if (v3 && objc_msgSend(MEMORY[0x24BDC1448], "isWakeGestureAvailable"))
  {
    objc_msgSend(MEMORY[0x24BDC1448], "sharedManager");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)&self->_sensorInfo.sensorType;
    *(_QWORD *)&self->_sensorInfo.sensorType = v7;

    objc_msgSend(*(id *)&self->_sensorInfo.sensorType, "setDelegate:", self);
    objc_msgSend(*(id *)&self->_sensorInfo.sensorType, "startWakeGestureUpdates");
  }
  else
  {
    objc_msgSend(*(id *)&self->_sensorInfo.sensorType, "stopWakeGestureUpdates");
    objc_msgSend(*(id *)&self->_sensorInfo.sensorType, "setDelegate:", 0);
    v9 = *(void **)&self->_sensorInfo.sensorType;
    *(_QWORD *)&self->_sensorInfo.sensorType = 0;

  }
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_24B74E000, v10, OS_LOG_TYPE_DEBUG, "registerForLiftToWakeNotifications: -> void\n", (uint8_t *)v11, 2u);
  }
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)MEMORY[0x24BD27898]();
  -[NSMutableArray logWakeGestureState:](self->_vibrationPatterns, "logWakeGestureState:", a4);
  -[__IOHIDEventSystemClient wakeGestureUpdate:](self->_hidClient, "wakeGestureUpdate:", a4);
  objc_autoreleasePoolPop(v6);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__BiometricKitXPCServerMesa_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __43__BiometricKitXPCServerMesa_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (int)loggingType
{
  int v2;
  int result;
  int v4;
  NSObject *v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v6 = 1;
  v2 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 42, 0, 0, 0, &v7, &v6);
  if (v2)
  {
    v4 = v2;
    if (__osLog)
      v5 = __osLog;
    else
      v5 = MEMORY[0x24BDACB70];
    result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136316162;
      v9 = "err == 0 ";
      v10 = 2048;
      v11 = v4;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v16 = 1024;
      v17 = 7828;
LABEL_15:
      _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      return 0;
    }
  }
  else
  {
    if (v6 == 1)
      return v7;
    if (__osLog)
      v5 = __osLog;
    else
      v5 = MEMORY[0x24BDACB70];
    result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136316162;
      v9 = "size == sizeof(outData)";
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v16 = 1024;
      v17 = 7829;
      goto LABEL_15;
    }
  }
  return result;
}

- (int)provisioningState
{
  int v2;
  int result;
  int v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v6 = 4;
  v2 = -[BiometricKitXPCServerMesa performCommand:inValue:inData:inSize:outData:outSize:](self, "performCommand:inValue:inData:inSize:outData:outSize:", 16, 0, 0, 0, &v7, &v6);
  if (v2)
  {
    v4 = v2;
    if (__osLog)
      v5 = __osLog;
    else
      v5 = MEMORY[0x24BDACB70];
    result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136316162;
      v9 = "err == 0 ";
      v10 = 2048;
      v11 = v4;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v16 = 1024;
      v17 = 7848;
LABEL_15:
      _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      return 0;
    }
  }
  else
  {
    if (v6 == 4)
      return v7;
    if (__osLog)
      v5 = __osLog;
    else
      v5 = MEMORY[0x24BDACB70];
    result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136316162;
      v9 = "size == sizeof(outData)";
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
      v16 = 1024;
      v17 = 7849;
      goto LABEL_15;
    }
  }
  return result;
}

- (void)bioLogKernelMessage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  _BYTE v22[10];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  +[BioLog y](_TtC5BKDM16BioLog, "y");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_28;
  if (objc_msgSend(v3, "length"))
  {
    switch(*(_DWORD *)v4)
    {
      case 0:
        if (__osLog)
          v6 = __osLog;
        else
          v6 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21) = 0;
          v7 = "bioLogKernelMessage: kBKM_AnyData unsupported!\n";
          v8 = v6;
          v9 = 2;
          goto LABEL_14;
        }
        goto LABEL_28;
      case 1:
        +[BioLog y](_TtC5BKDM16BioLog, "y");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v4 + 28, *(unsigned int *)(v4 + 24), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logCaptureWithData:id:", v14, *(_QWORD *)(v4 + 12));

        goto LABEL_22;
      case 2:
        v15 = *(_DWORD *)(v4 + 24);
        v16 = 96;
        v17 = 112;
        if (v15 > 19711)
        {
          if (v15 == 21504)
            goto LABEL_27;
          if (v15 != 19712)
          {
LABEL_26:
            v17 = 88;
            v16 = 88;
LABEL_27:
            +[BioLog y](_TtC5BKDM16BioLog, "y");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v4 + 28, *(unsigned int *)(v4 + 24), 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "logImageWithData:width:height:id:sourceUUID:", v19, v17, v16, *(_QWORD *)(v4 + 12), 0);

            goto LABEL_28;
          }
        }
        else if (v15 != 9856)
        {
          if (v15 == 10752)
            goto LABEL_27;
          goto LABEL_26;
        }
        v16 = 56;
        v17 = 176;
        goto LABEL_27;
      case 3:
        if (*(_DWORD *)(v4 + 24) == 8)
        {
          +[BioLog y](_TtC5BKDM16BioLog, "y");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "logSystemPowerWithState:", *(_QWORD *)(v4 + 28));
LABEL_22:

        }
        else
        {
          if (__osLog)
            v20 = __osLog;
          else
            v20 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = 136316162;
            *(_QWORD *)v22 = "message->dataLength == sizeof(unsigned long)";
            *(_WORD *)&v22[8] = 2048;
            v23 = 0;
            v24 = 2080;
            v25 = "";
            v26 = 2080;
            v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
            v28 = 1024;
            v29 = 7918;
            v7 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
            goto LABEL_34;
          }
        }
        goto LABEL_28;
      case 4:
        goto LABEL_28;
      default:
        if (__osLog)
          v10 = __osLog;
        else
          v10 = MEMORY[0x24BDACB70];
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          goto LABEL_28;
        v11 = *(_DWORD *)v4;
        v12 = *(_DWORD *)(v4 + 24);
        v21 = 67109376;
        *(_DWORD *)v22 = v11;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = v12;
        v7 = "bioLogKernelMessage: Unknown message: %d, length: %u\n";
        v8 = v10;
        v9 = 14;
        goto LABEL_14;
    }
  }
  if (__osLog)
    v20 = __osLog;
  else
    v20 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = 136316162;
    *(_QWORD *)v22 = "[messageData length] > 0";
    *(_WORD *)&v22[8] = 2048;
    v23 = 0;
    v24 = 2080;
    v25 = "";
    v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitXPCServerMesa.m";
    v28 = 1024;
    v29 = 7878;
    v7 = "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n";
LABEL_34:
    v8 = v20;
    v9 = 48;
LABEL_14:
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v21, v9);
  }
LABEL_28:

}

- (BOOL)sensorReady
{
  return (BOOL)self->_dailyUpdateTimer;
}

- (void)setSensorReady:(BOOL)a3
{
  LOBYTE(self->_dailyUpdateTimer) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigTERMDispatchSource, 0);
  objc_storeStrong((id *)&self->_loggingType, 0);
  objc_storeStrong((id *)&self->_vibrationPatterns, 0);
  objc_storeStrong((id *)&self->_lastSBLockMsg, 0);
  objc_storeStrong((id *)&self->_sensorInfo.sensorType, 0);
  objc_storeStrong((id *)&self->_hidClient, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_enrollmentCount, 0);
  objc_storeStrong((id *)&self->_showDebugImages, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
