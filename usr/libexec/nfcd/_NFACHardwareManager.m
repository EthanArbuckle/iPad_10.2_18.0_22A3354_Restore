@implementation _NFACHardwareManager

+ (id)sharedHardwareManager
{
  if (qword_10032AC90 != -1)
    dispatch_once(&qword_10032AC90, &stru_1002EC488);
  return (id)qword_10032AC88;
}

- (_NFACHardwareManager)init
{
  _NFACHardwareManager *v2;
  _NFACHardwareManager *v3;
  NSMutableArray *v4;
  NSMutableArray *sessions;
  NSMutableArray *v6;
  NSMutableArray *xpcConnections;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *xpcConnectionQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *workQueue;
  dispatch_queue_global_t global_queue;
  uint64_t v17;
  OS_dispatch_queue *xpcEventNotificationQueue;
  NFPowerObserver *v19;
  NFPowerObserver *powerObserver;
  NFACDriverWrapper *v21;
  NFACDriverWrapper *driverWrapper;
  NFBasebandMonitor *v23;
  NFBasebandMonitor *basebandMonitor;
  NFSecureXPCEventPublisher *v25;
  NFSecureXPCEventPublisher *accessorydEventPublisher;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)_NFACHardwareManager;
  v2 = -[_NFACHardwareManager init](&v28, "init");
  v3 = v2;
  if (v2)
  {
    v2->_hardwareState = 0;
    v4 = objc_opt_new(NSMutableArray);
    sessions = v3->_sessions;
    v3->_sessions = v4;

    v6 = objc_opt_new(NSMutableArray);
    xpcConnections = v3->_xpcConnections;
    v3->_xpcConnections = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, -1);
    v11 = objc_claimAutoreleasedReturnValue(v10);

    v12 = dispatch_queue_create("com.apple.nfcacd.xpc", v11);
    xpcConnectionQueue = v3->_xpcConnectionQueue;
    v3->_xpcConnectionQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_set_specific((dispatch_queue_t)v3->_xpcConnectionQueue, kNFLOG_DISPATCH_SPECIFIC_KEY, (void *)3, 0);
    v14 = dispatch_queue_create("com.apple.nfcacd.workQueue", v11);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_set_specific((dispatch_queue_t)v3->_workQueue, kNFLOG_DISPATCH_SPECIFIC_KEY, (void *)3, 0);
    global_queue = dispatch_get_global_queue(25, 0);
    v17 = objc_claimAutoreleasedReturnValue(global_queue);
    xpcEventNotificationQueue = v3->_xpcEventNotificationQueue;
    v3->_xpcEventNotificationQueue = (OS_dispatch_queue *)v17;

    v19 = (NFPowerObserver *)objc_msgSend(objc_alloc((Class)NFPowerObserver), "initWithDelegate:", v3);
    powerObserver = v3->_powerObserver;
    v3->_powerObserver = v19;

    v21 = objc_opt_new(NFACDriverWrapper);
    driverWrapper = v3->_driverWrapper;
    v3->_driverWrapper = v21;

    -[NFACDriverWrapper setDelegate:](v3->_driverWrapper, "setDelegate:", v3);
    v23 = objc_alloc_init(NFBasebandMonitor);
    basebandMonitor = v3->_basebandMonitor;
    v3->_basebandMonitor = v23;

    v25 = (NFSecureXPCEventPublisher *)objc_msgSend(objc_alloc((Class)NFSecureXPCEventPublisher), "initWithMachPort:queue:", CFSTR("com.apple.accessoryd.nf-events"), v3->_xpcEventNotificationQueue);
    accessorydEventPublisher = v3->_accessorydEventPublisher;
    v3->_accessorydEventPublisher = v25;

  }
  return v3;
}

- (void)_probeHW
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *v8;
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  unint64_t v17;
  void *specific;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *ClassName;
  const char *v30;
  const char *Name;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  unint64_t v41;

  if (self->_isRunning)
  {
    v4 = -[NFACDriverWrapper openSession:](self->_driverWrapper, "openSession:", CFSTR("HW probe"));
    if (v4 == 1)
    {
      -[_NFACHardwareManager maybeStartNextSession](self, "maybeStartNextSession");
      -[NFACDriverWrapper closeSession:](self->_driverWrapper, "closeSession:", CFSTR("HW probe"));
    }
    else
    {
      v17 = v4;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v20 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v23 = 45;
        if (isMetaClass)
          v23 = 43;
        v20(3, "%c[%{public}s %{public}s]:%i Failed to open a driver session: %lu", v23, ClassName, Name, 144, v17);
      }
      v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v25 = NFSharedLogGetLogger(v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = object_getClass(self);
        if (class_isMetaClass(v27))
          v28 = 43;
        else
          v28 = 45;
        *(_DWORD *)buf = 67110146;
        v33 = v28;
        v34 = 2082;
        v35 = object_getClassName(self);
        v36 = 2082;
        v37 = sel_getName(a2);
        v38 = 1024;
        v39 = 144;
        v40 = 2048;
        v41 = v17;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open a driver session: %lu", buf, 0x2Cu);
      }

    }
  }
  else
  {
    v5 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v6 = NFLogGetLogger(v5);
    if (v6)
    {
      v7 = (void (*)(uint64_t, const char *, ...))v6;
      v8 = object_getClass(self);
      v9 = class_isMetaClass(v8);
      v10 = object_getClassName(self);
      v30 = sel_getName(a2);
      v11 = 45;
      if (v9)
        v11 = 43;
      v7(6, "%c[%{public}s %{public}s]:%i Not started yet?!", v11, v10, v30, 148);
    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      v33 = v16;
      v34 = 2082;
      v35 = object_getClassName(self);
      v36 = 2082;
      v37 = sel_getName(a2);
      v38 = 1024;
      v39 = 148;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not started yet?!", buf, 0x22u);
    }

  }
}

- (void)_startAfterRecovery:(BOOL)a3
{
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  _NFACHardwareManager *v18;
  NSObject *workQueue;
  const char *Name;
  _QWORD block[5];
  BOOL v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 154);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v24 = v17;
    v25 = 2082;
    v26 = object_getClassName(self);
    v27 = 2082;
    v28 = sel_getName(a2);
    v29 = 1024;
    v30 = 154;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v18 = self;
  objc_sync_enter(v18);
  if (v18->_isRunning)
  {
    objc_sync_exit(v18);

  }
  else
  {
    -[_NFACHardwareManager _loadService](v18, "_loadService");
    v18->_isRunning = 1;
    objc_sync_exit(v18);

    workQueue = v18->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100247530;
    block[3] = &unk_1002E5BB8;
    v22 = a3;
    block[4] = v18;
    dispatch_async(workQueue, block);
  }
}

- (void)start
{
  NSObject *v4;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v8;
  const char *ClassName;
  const char *Name;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _NFACHardwareManager *v21;
  uint64_t v22;
  id v23;
  void *v24;
  dispatch_queue_global_t global_queue;
  NSObject *v26;
  NFBackgroundActivityScheduler *v27;
  NFBackgroundActivityScheduler *schedulingDailyUpdating;
  NFBackgroundActivityScheduler *v29;
  void *v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  int v40;
  const char *v41;
  const char *v42;
  dispatch_queue_global_t v43;
  NSObject *v44;
  _QWORD v45[6];
  _QWORD handler[6];
  _QWORD v47[5];
  _BYTE state[18];
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;

  v4 = _os_activity_create((void *)&_mh_execute_header, "_NFACHardwareManager started", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v8 = 43;
    else
      v8 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i starting", v8, ClassName, Name, 174);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    v16 = object_getClassName(self);
    v17 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v15;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v16;
    v49 = 2082;
    v50 = v17;
    v51 = 1024;
    v52 = 174;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i starting", state, 0x22u);
  }

  v19 = NFSharedSignpostLog(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)state = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_STARTED", ", state, 2u);
  }

  v21 = self;
  v22 = objc_sync_enter(v21);
  if ((NFProductSupportsAC(v22) & 1) != 0)
  {
    v23 = sub_1001F419C((uint64_t)_NFFailForwardCoordinator);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    sub_1001F44FC(v24, v21);

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100247A28;
    v47[3] = &unk_1002E7ED8;
    v47[4] = v21;
    v21->_stateCaptureHandle = os_state_add_handler(&_dispatch_main_q, v47);
    global_queue = dispatch_get_global_queue(0, 0);
    v26 = objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100247AE8;
    handler[3] = &unk_1002EC4F0;
    handler[4] = v21;
    handler[5] = a2;
    xpc_set_event_stream_handler("com.apple.iokit.matching", v26, handler);

    objc_sync_exit(v21);
    v27 = (NFBackgroundActivityScheduler *)objc_msgSend(objc_alloc((Class)NFBackgroundActivityScheduler), "initWithQueue:", v21->_workQueue);
    schedulingDailyUpdating = v21->_schedulingDailyUpdating;
    v21->_schedulingDailyUpdating = v27;

    v29 = v21->_schedulingDailyUpdating;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100247F40;
    v45[3] = &unk_1002E5F60;
    v45[4] = v21;
    v45[5] = a2;
    -[NFBackgroundActivityScheduler schedulePreRegisteredActivity:callback:](v29, "schedulePreRegisteredActivity:callback:", CFSTR("com.apple.nfcacd.coreanalytics.event"), v45);
    -[_NFACHardwareManager _startAfterRecovery:](v21, "_startAfterRecovery:", 0);
    v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v30);
    if (v31)
    {
      v32 = object_getClass(v21);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      v34 = object_getClassName(v21);
      v35 = sel_getName(a2);
      v31(6, "%c[%{public}s %{public}s]:%i started", v33, v34, v35, 227);
    }
    v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v37 = NFSharedLogGetLogger(v36);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = object_getClass(v21);
      if (class_isMetaClass(v39))
        v40 = 43;
      else
        v40 = 45;
      v41 = object_getClassName(v21);
      v42 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v40;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v41;
      v49 = 2082;
      v50 = v42;
      v51 = 1024;
      v52 = 227;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i started", state, 0x22u);
    }

  }
  else
  {
    v21->_hardwareState = 2;
    v43 = dispatch_get_global_queue(0, 0);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    xpc_set_event_stream_handler("com.apple.iokit.matching", v44, &stru_1002EC4C8);

    objc_sync_exit(v21);
  }
}

- (void)stop
{
  NSObject *v4;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v8;
  const char *ClassName;
  const char *Name;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _NFACHardwareManager *v21;
  NFPowerObserver *powerObserver;
  NFPreferenceObserver *preferenceObserver;
  void *v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  NSObject *p_super;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  _BYTE state[18];
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;

  v4 = _os_activity_create((void *)&_mh_execute_header, "_NFACHardwareManager stopped", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class))
      v8 = 43;
    else
      v8 = 45;
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Nfcacd stopping", v8, ClassName, Name, 234);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    v16 = object_getClassName(self);
    v17 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v15;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v16;
    v38 = 2082;
    v39 = v17;
    v40 = 1024;
    v41 = 234;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nfcacd stopping", state, 0x22u);
  }

  v19 = NFSharedSignpostLog(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)state = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_STOPPING", ", state, 2u);
  }

  v21 = self;
  objc_sync_enter(v21);
  if (v21->_isRunning)
  {
    -[NFPowerObserver unregisterForEvents](v21->_powerObserver, "unregisterForEvents");
    powerObserver = v21->_powerObserver;
    v21->_powerObserver = 0;

    -[NFPreferenceObserver stop](v21->_preferenceObserver, "stop");
    preferenceObserver = v21->_preferenceObserver;
    v21->_preferenceObserver = 0;

    -[_NFACHardwareManager _unloadService](v21, "_unloadService");
    v21->_isRunning = 0;
    -[NFACDriverWrapper stopNowAndLeveHWEnabled:](v21->_driverWrapper, "stopNowAndLeveHWEnabled:", 0);
    -[NSMutableArray removeAllObjects](v21->_sessions, "removeAllObjects");
    objc_sync_exit(v21);

    v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v24);
    if (v25)
    {
      v26 = object_getClass(v21);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      v28 = object_getClassName(v21);
      v29 = sel_getName(a2);
      v25(6, "%c[%{public}s %{public}s]:%i nfcacd stopped", v27, v28, v29, 252);
    }
    v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = NFSharedLogGetLogger(v30);
    p_super = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v33 = object_getClass(v21);
      if (class_isMetaClass(v33))
        v34 = 43;
      else
        v34 = 45;
      v35 = object_getClassName(v21);
      v36 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v34;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v35;
      v38 = 2082;
      v39 = v36;
      v40 = 1024;
      v41 = 252;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i nfcacd stopped", state, 0x22u);
    }
  }
  else
  {
    objc_sync_exit(v21);
    p_super = &v21->super;
  }

}

- (void)_loadService
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t, const char *, ...);
  objc_class *v35;
  _BOOL4 v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  const char *v45;
  const char *Name;
  const char *v47;
  const char *v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Trying to create service", v10, ClassName, Name, 259);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v50 = v15;
    v51 = 2082;
    v52 = object_getClassName(self);
    v53 = 2082;
    v54 = sel_getName(a2);
    v55 = 1024;
    v56 = 259;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Trying to create service", buf, 0x22u);
  }

  v16 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.nfcacd.hwmanager"));
  v17 = (void *)qword_10032AC80;
  qword_10032AC80 = (uint64_t)v16;

  objc_msgSend((id)qword_10032AC80, "setDelegate:", self);
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFLogGetLogger(v18);
  if (v19)
  {
    v20 = (void (*)(uint64_t, const char *, ...))v19;
    v21 = object_getClass(self);
    v22 = class_isMetaClass(v21);
    v23 = object_getClassName(self);
    v47 = sel_getName(a2);
    v24 = 45;
    if (v22)
      v24 = 43;
    v20(6, "%c[%{public}s %{public}s]:%i mach service created", v24, v23, v47, 263);
  }
  v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v26 = NFSharedLogGetLogger(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = object_getClass(self);
    if (class_isMetaClass(v28))
      v29 = 43;
    else
      v29 = 45;
    v30 = object_getClassName(self);
    v31 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v50 = v29;
    v51 = 2082;
    v52 = v30;
    v53 = 2082;
    v54 = v31;
    v55 = 1024;
    v56 = 263;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i mach service created", buf, 0x22u);
  }

  objc_msgSend((id)qword_10032AC80, "_setQueue:", self->_xpcConnectionQueue);
  v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v33 = NFLogGetLogger(v32);
  if (v33)
  {
    v34 = (void (*)(uint64_t, const char *, ...))v33;
    v35 = object_getClass(self);
    v36 = class_isMetaClass(v35);
    v37 = object_getClassName(self);
    v48 = sel_getName(a2);
    v38 = 45;
    if (v36)
      v38 = 43;
    v34(6, "%c[%{public}s %{public}s]:%i Resuming service", v38, v37, v48, 267);
  }
  v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v40 = NFSharedLogGetLogger(v39);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = object_getClass(self);
    if (class_isMetaClass(v42))
      v43 = 43;
    else
      v43 = 45;
    v44 = object_getClassName(self);
    v45 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v50 = v43;
    v51 = 2082;
    v52 = v44;
    v53 = 2082;
    v54 = v45;
    v55 = 1024;
    v56 = 267;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resuming service", buf, 0x22u);
  }

  objc_msgSend((id)qword_10032AC80, "resume");
}

- (void)_unloadService
{
  void *v2;

  objc_msgSend((id)qword_10032AC80, "invalidate");
  objc_msgSend((id)qword_10032AC80, "setDelegate:", 0);
  v2 = (void *)qword_10032AC80;
  qword_10032AC80 = 0;

}

- (void)primaryDelegateRegistered:(id)a3
{
  void *specific;
  id v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v7 = a3;
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v13 = 45;
    if (isMetaClass)
      v13 = 43;
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 280);
  }
  v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = object_getClass(self);
    if (class_isMetaClass(v17))
      v18 = 43;
    else
      v18 = 45;
    *(_DWORD *)buf = 67109890;
    v21 = v18;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 280;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  -[NFACDriverWrapper setFailForwardDelegate:](self->_driverWrapper, "setFailForwardDelegate:", v7);
}

- (void)stopFury
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  _NFACHardwareManager *v16;
  void *v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  const char *Name;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 286);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v32 = v15;
    v33 = 2082;
    v34 = object_getClassName(self);
    v35 = 2082;
    v36 = sel_getName(a2);
    v37 = 1024;
    v38 = 286;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = self;
  objc_sync_enter(v16);
  if (v16->_isRunning)
  {
    v16->_stoppedForFailForward = 1;
    objc_sync_exit(v16);

    -[_NFACHardwareManager stop](v16, "stop");
  }
  else
  {
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v17);
    if (v18)
    {
      v19 = object_getClass(v16);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      v21 = object_getClassName(v16);
      v22 = sel_getName(a2);
      v18(6, "%c[%{public}s %{public}s]:%i Not started yet?!", v20, v21, v22, 289);
    }
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = NFSharedLogGetLogger(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = object_getClass(v16);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      v28 = object_getClassName(v16);
      v29 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v32 = v27;
      v33 = 2082;
      v34 = v28;
      v35 = 2082;
      v36 = v29;
      v37 = 1024;
      v38 = 289;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not started yet?!", buf, 0x22u);
    }

    objc_sync_exit(v16);
  }
}

- (void)handleFailForwardCompleted
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  _NFACHardwareManager *v16;
  NSObject *workQueue;
  const char *Name;
  _QWORD block[5];
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 300);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v21 = v15;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 300;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = self;
  objc_sync_enter(v16);
  if (v16->_stoppedForFailForward)
  {
    v16->_stoppedForFailForward = 0;
    -[_NFACHardwareManager _startAfterRecovery:](v16, "_startAfterRecovery:", 1);
  }
  else
  {
    workQueue = v16->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100248F34;
    block[3] = &unk_1002E5C58;
    block[4] = v16;
    dispatch_async(workQueue, block);
  }
  objc_sync_exit(v16);

}

- (id)_getDefaults
{
  return +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
}

- (void)powerObserverSystemWillSleep:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSMutableArray *v21;
  NSObject *workQueue;
  id v23;
  const char *Name;
  _QWORD block[5];
  id v26;
  SEL v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  v5 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 322);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v29 = v17;
    v30 = 2082;
    v31 = object_getClassName(self);
    v32 = 2082;
    v33 = sel_getName(a2);
    v34 = 1024;
    v35 = 322;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v19 = NFSharedSignpostLog(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_WILL_SLEEP", ", buf, 2u);
  }

  v21 = self->_sessions;
  objc_sync_enter(v21);
  self->_systemWillSleep = 1;
  objc_sync_exit(v21);

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002491A8;
  block[3] = &unk_1002E5C80;
  v26 = v5;
  v27 = a2;
  block[4] = self;
  v23 = v5;
  dispatch_sync(workQueue, block);

}

- (void)powerObserverSystemHasPoweredOn:(id)a3
{
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *workQueue;
  const char *Name;
  _QWORD block[5];
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 351);
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67109890;
    v24 = v16;
    v25 = 2082;
    v26 = object_getClassName(self);
    v27 = 2082;
    v28 = sel_getName(a2);
    v29 = 1024;
    v30 = 351;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v18 = NFSharedSignpostLog(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_POWERED_ON", ", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100249714;
  block[3] = &unk_1002E5C58;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_getInfo
{
  NSMutableDictionary *v3;
  NFHardwareControllerInfo *controllerInfo;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = objc_opt_new(NSMutableDictionary);
  controllerInfo = self->_controllerInfo;
  if (controllerInfo)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFHardwareControllerInfo asDictionary](controllerInfo, "asDictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("Controller"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACHardwareManager _getDefaults](self, "_getDefaults"));
  objc_msgSend(v6, "synchronize");
  v7 = objc_opt_new(NSMutableDictionary);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(&off_100305FF8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(&off_100305FF8);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v12));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v12));
          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v14, v12);

        }
      }
      v9 = objc_msgSend(&off_100305FF8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("Preferences"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assertionHolders"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, CFSTR("PowerAssertions"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper owners](self->_driverWrapper, "owners"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, CFSTR("DriverOwners"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_stoppedForFailForward));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v18, CFSTR("stoppedForFailForward"));

  return v3;
}

- (id)_executeWithDriverSessionSync:(id)a3 block:(id)a4
{
  id v7;
  uint64_t (**v8)(_QWORD);
  unint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  const char *Name;
  NSErrorUserInfoKey v31;
  void *v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  id v42;
  __int16 v43;
  unint64_t v44;

  v7 = a3;
  v8 = (uint64_t (**)(_QWORD))a4;
  v9 = -[NFACDriverWrapper openSession:](self->_driverWrapper, "openSession:", v7);
  if (v9 == 1)
  {
    v10 = v8[2](v8);
    v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    -[NFACDriverWrapper closeSession:](self->_driverWrapper, "closeSession:", v7);
  }
  else
  {
    v12 = v9;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v15 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v19 = 45;
      if (isMetaClass)
        v19 = 43;
      v15(4, "%c[%{public}s %{public}s]:%i Failed to open session; %@ hwState=%lu",
        v19,
        ClassName,
        Name,
        404,
        v7,
        v12);
    }
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFSharedLogGetLogger(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = object_getClass(self);
      if (class_isMetaClass(v23))
        v24 = 43;
      else
        v24 = 45;
      *(_DWORD *)buf = 67110402;
      v34 = v24;
      v35 = 2082;
      v36 = object_getClassName(self);
      v37 = 2082;
      v38 = sel_getName(a2);
      v39 = 1024;
      v40 = 404;
      v41 = 2112;
      v42 = v7;
      v43 = 2048;
      v44 = v12;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session; %@ hwState=%lu",
        buf,
        0x36u);
    }

    v25 = objc_alloc((Class)NSError);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v31 = NSLocalizedDescriptionKey;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v32 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v11 = objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 15, v28);

  }
  return v11;
}

- (void)getInfo:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100249CD8;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)getDieId:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100249E50;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)getPowerCounters:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024A1B0;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)getRfSettings:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024A418;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)enableMultiTag:(BOOL)a3 callback:(id)a4
{
  _BOOL4 v4;
  void (**v7)(id, id);
  void *v8;
  unsigned __int8 v9;
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  NSObject *workQueue;
  void *specific;
  uint64_t Logger;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  const char *v39;
  const char *v40;
  const char *Name;
  _QWORD block[5];
  void (**v43)(id, id);
  SEL v44;
  BOOL v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  _BOOL4 v55;
  NSErrorUserInfoKey v56;
  void *v57;

  v4 = a3;
  v7 = (void (**)(id, id))a4;
  if (NFProductIsDevBoard()
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACHardwareManager _getDefaults](self, "_getDefaults")),
        v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("forceMultiTagEnabled")),
        v8,
        (v9 & 1) == 0))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v28 = 45;
      if (isMetaClass)
        v28 = 43;
      v24(4, "%c[%{public}s %{public}s]:%i <MultiTag Detection is disabled on dev boards", v28, ClassName, Name, 495);
    }
    v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFSharedLogGetLogger(v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = object_getClass(self);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      *(_DWORD *)buf = 67109890;
      v47 = v33;
      v48 = 2082;
      v49 = object_getClassName(self);
      v50 = 2082;
      v51 = sel_getName(a2);
      v52 = 1024;
      v53 = 495;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i <MultiTag Detection is disabled on dev boards", buf, 0x22u);
    }

    v34 = objc_alloc((Class)NSError);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v56 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v57 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
    v38 = objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 14, v37);
    v7[2](v7, v38);

  }
  else
  {
    v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v11 = NFLogGetLogger(v10);
    if (v11)
    {
      v12 = (void (*)(uint64_t, const char *, ...))v11;
      v13 = object_getClass(self);
      v14 = class_isMetaClass(v13);
      v39 = object_getClassName(self);
      v40 = sel_getName(a2);
      v15 = 45;
      if (v14)
        v15 = 43;
      v12(6, "%c[%{public}s %{public}s]:%i enable: %d", v15, v39, v40, 500, v4);
    }
    v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = object_getClass(self);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      *(_DWORD *)buf = 67110146;
      v47 = v20;
      v48 = 2082;
      v49 = object_getClassName(self);
      v50 = 2082;
      v51 = sel_getName(a2);
      v52 = 1024;
      v53 = 500;
      v54 = 1024;
      v55 = v4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i enable: %d", buf, 0x28u);
    }

    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10024AAF4;
    block[3] = &unk_1002E7E90;
    v45 = v4;
    block[4] = self;
    v44 = a2;
    v43 = v7;
    dispatch_async(workQueue, block);

  }
}

- (void)enableLPCD:(BOOL)a3 callback:(id)a4
{
  id v7;
  NSObject *workQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  BOOL v13;

  v7 = a4;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10024B380;
  v10[3] = &unk_1002E7E90;
  v13 = a3;
  v11 = v7;
  v12 = a2;
  v10[4] = self;
  v9 = v7;
  dispatch_async(workQueue, v10);

}

- (void)getLastDetectedTags:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024BA28;
  block[3] = &unk_1002E5D28;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (void)getMultiTagState:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024BFD4;
  block[3] = &unk_1002E5D28;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (void)setClientName:(id)a3
{
  id v5;
  void *v6;
  NSMutableSet *v7;
  void *v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  id v34;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v7 = objc_opt_new(NSMutableSet);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v7, CFSTR("ProxyObjects")));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("ClientName"));
  objc_msgSend(v6, "setUserInfo:", v8);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v22 = objc_msgSend(v6, "processIdentifier");
    v16 = 45;
    if (isMetaClass)
      v16 = 43;
    v11(6, "%c[%{public}s %{public}s]:%i new XPC connection from pid=%d, name=%{public}@", v16, ClassName, Name, 657, v22, v5);
  }
  v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = object_getClass(self);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    *(_DWORD *)buf = 67110402;
    v24 = v21;
    v25 = 2082;
    v26 = object_getClassName(self);
    v27 = 2082;
    v28 = sel_getName(a2);
    v29 = 1024;
    v30 = 657;
    v31 = 1024;
    v32 = objc_msgSend(v6, "processIdentifier");
    v33 = 2114;
    v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i new XPC connection from pid=%d, name=%{public}@", buf, 0x32u);
  }

}

- (void)clearMultiTagState:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024C48C;
  v7[3] = &unk_1002E6380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (BOOL)_validateSessionRequest:(id)a3 withConnection:(id)a4
{
  return 1;
}

- (BOOL)_queueNewSession:(id)a3 onConnection:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  void *specific;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *Name;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  v7 = a3;
  v8 = a4;
  v9 = -[_NFACHardwareManager _validateSessionRequest:withConnection:](self, "_validateSessionRequest:withConnection:", v7, v8);
  if (v9)
  {
    objc_msgSend(v7, "setConnection:", v8);
    objc_msgSend(v7, "setQueue:", self);
    objc_msgSend(v7, "setDriverWrapper:", self->_driverWrapper);
    ++self->_sessionCounter;
    objc_msgSend(v7, "setSessionID:");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "NF_userInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProxyObjects")));
    objc_msgSend(v11, "addObject:", v7);

    v12 = self->_sessions;
    objc_sync_enter(v12);
    -[NSMutableArray addObject:](self->_sessions, "addObject:", v7);
    if (-[NSMutableArray count](self->_sessions, "count") == (id)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
      objc_msgSend(v13, "holdPowerAssertion:", CFSTR("NfcacdSessions"));

    }
    objc_sync_exit(v12);

  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v20 = 45;
      if (isMetaClass)
        v20 = 43;
      v16(3, "%c[%{public}s %{public}s]:%i New session failed validation", v20, ClassName, Name, 694);
    }
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFSharedLogGetLogger(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      *(_DWORD *)buf = 67109890;
      v29 = v25;
      v30 = 2082;
      v31 = object_getClassName(self);
      v32 = 2082;
      v33 = sel_getName(a2);
      v34 = 1024;
      v35 = 694;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i New session failed validation", buf, 0x22u);
    }

  }
  return v9;
}

- (void)queueReaderSession:(id)a3 callback:(id)a4
{
  void (**v7)(id, _NFACReaderSession *, _QWORD);
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _NFACReaderSession *v12;
  id v13;
  void *v14;
  NSObject *workQueue;
  void *specific;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  const char *Name;
  _QWORD block[5];
  NSErrorUserInfoKey v37;
  void *v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;

  v7 = (void (**)(id, _NFACReaderSession *, _QWORD))a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v10 = NFSharedSignpostLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_QUEUE_READER_SESSION", ", buf, 2u);
  }

  v12 = -[_NFACReaderSession initWithRemoteObject:workQueue:]([_NFACReaderSession alloc], "initWithRemoteObject:workQueue:", v8, self->_workQueue);
  if (-[_NFACHardwareManager _queueNewSession:onConnection:](self, "_queueNewSession:onConnection:", v12, v9))
  {
    v13 = sub_10019C2FC((uint64_t)NFSystemPowerConsumptionMonitor);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[_NFACReaderSession setPowerConsumptionReporter:](v12, "setPowerConsumptionReporter:", v14);

    v7[2](v7, v12, 0);
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10024CD0C;
    block[3] = &unk_1002E5C58;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v22 = 45;
      if (isMetaClass)
        v22 = 43;
      v18(3, "%c[%{public}s %{public}s]:%i Failed to queue session", v22, ClassName, Name, 728);
    }
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = NFSharedLogGetLogger(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = object_getClass(self);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      v28 = object_getClassName(self);
      v29 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v40 = v27;
      v41 = 2082;
      v42 = v28;
      v43 = 2082;
      v44 = v29;
      v45 = 1024;
      v46 = 728;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to queue session", buf, 0x22u);
    }

    v30 = objc_alloc((Class)NSError);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v37 = NSLocalizedDescriptionKey;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Security Violation"));
    v38 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    v34 = objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 8, v33);
    ((void (**)(id, _NFACReaderSession *, id))v7)[2](v7, 0, v34);

  }
}

- (void)maybeStartNextSession
{
  _NFACHardwareManager *v3;
  _BOOL4 isRunning;
  NSObject *v5;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v9;
  const char *ClassName;
  const char *Name;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  uint64_t v17;
  _NFACSession *currentSession;
  uint64_t v19;
  _NFACSession *v20;
  void *v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  NFACDriverWrapper *driverWrapper;
  id v33;
  unsigned int v34;
  _NFACSession *v35;
  NFBasebandMonitor *basebandMonitor;
  void *v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  objc_class *v46;
  int v47;
  const char *v48;
  const char *v49;
  NFACDriverWrapper *v50;
  void *v51;
  id v52;
  void *v53;
  unsigned __int8 v54;
  NFACDriverWrapper *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  _NFACSession *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  NFACDriverWrapper *v68;
  id v69;
  void *v70;
  void (*v71)(uint64_t, const char *, ...);
  objc_class *v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  objc_class *v79;
  int v80;
  const char *v81;
  const char *v82;
  NFACDriverWrapper *v83;
  id v84;
  void *v85;
  void (*v86)(uint64_t, const char *, ...);
  objc_class *v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  void *v91;
  uint64_t v92;
  objc_class *v93;
  int v94;
  const char *v95;
  const char *v96;
  NSErrorUserInfoKey v97;
  void *v98;
  NSErrorUserInfoKey v99;
  void *v100;
  uint8_t buf[4];
  int v102;
  __int16 v103;
  const char *v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  int v108;

  v3 = self;
  objc_sync_enter(v3);
  isRunning = v3->_isRunning;
  objc_sync_exit(v3);

  if (!isRunning)
    return;
  v5 = v3->_sessions;
  objc_sync_enter(v5);
  if (v3->_systemWillSleep)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
    if (Logger)
    {
      Class = object_getClass(v3);
      if (class_isMetaClass(Class))
        v9 = 43;
      else
        v9 = 45;
      ClassName = object_getClassName(v3);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i System is going to sleep - delaying start of new session", v9, ClassName, Name, 760);
    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = object_getClass(v3);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      v102 = v16;
      v103 = 2082;
      v104 = object_getClassName(v3);
      v105 = 2082;
      v106 = sel_getName(a2);
      v107 = 1024;
      v108 = 760;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i System is going to sleep - delaying start of new session", buf, 0x22u);
    }

    objc_sync_exit(v5);
LABEL_14:

    return;
  }
  if (v3->_currentSession || !-[NSMutableArray count](v3->_sessions, "count"))
    goto LABEL_16;
  v17 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v3->_sessions, "objectAtIndex:", 0));
  currentSession = v3->_currentSession;
  v3->_currentSession = (_NFACSession *)v17;

  v19 = objc_opt_class(v3->_currentSession);
  if (v19 == objc_opt_class(_NFACReaderSession)
    && -[NFACDriverWrapper readerModeProtectionActive](v3->_driverWrapper, "readerModeProtectionActive"))
  {
    v20 = v3->_currentSession;
    v3->_currentSession = 0;

    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v21);
    if (v22)
    {
      v23 = object_getClass(v3);
      if (class_isMetaClass(v23))
        v24 = 43;
      else
        v24 = 45;
      v25 = object_getClassName(v3);
      v26 = sel_getName(a2);
      v22(6, "%c[%{public}s %{public}s]:%i Reader session not dequeued : reader mode protection active", v24, v25, v26, 771);
    }
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = object_getClass(v3);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      *(_DWORD *)buf = 67109890;
      v102 = v31;
      v103 = 2082;
      v104 = object_getClassName(v3);
      v105 = 2082;
      v106 = sel_getName(a2);
      v107 = 1024;
      v108 = 771;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reader session not dequeued : reader mode protection active", buf, 0x22u);
    }

LABEL_16:
    objc_sync_exit(v5);

    goto LABEL_17;
  }
  -[NSMutableArray removeObjectAtIndex:](v3->_sessions, "removeObjectAtIndex:", 0);
  objc_sync_exit(v5);

  v34 = -[_NFACSession willStartSession](v3->_currentSession, "willStartSession");
  v35 = v3->_currentSession;
  if (v34)
  {
    -[_NFACSession didStartSession:](v3->_currentSession, "didStartSession:", 0);
  }
  else
  {
    v57 = objc_alloc((Class)NSError);
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v99 = NSLocalizedDescriptionKey;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v100 = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1));
    v61 = objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 15, v60);
    -[_NFACSession didStartSession:](v35, "didStartSession:", v61);

    v62 = v3->_currentSession;
    v63 = objc_alloc((Class)NSError);
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v97 = NSLocalizedDescriptionKey;
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Stack Error"));
    v98 = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1));
    v67 = objc_msgSend(v63, "initWithDomain:code:userInfo:", v64, 15, v66);
    -[_NFACSession didEndSession:](v62, "didEndSession:", v67);

  }
LABEL_17:
  if (!v3->_currentSession)
  {
    if (v3->_runLPCD)
    {
      driverWrapper = v3->_driverWrapper;
      v5 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig accessoryReaderWithLPCD](NFRoutingConfig, "accessoryReaderWithLPCD"));
      v33 = -[NFACDriverWrapper setRouting:](driverWrapper, "setRouting:", v5);
    }
    else if (v3->_runMultiTagDetection)
    {
      basebandMonitor = v3->_basebandMonitor;
      if (basebandMonitor && sub_100191E28(basebandMonitor))
      {
        if (v3->_needsMultiTagRestart)
        {
          v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v38 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v37);
          if (v38)
          {
            v39 = object_getClass(v3);
            if (class_isMetaClass(v39))
              v40 = 43;
            else
              v40 = 45;
            v41 = object_getClassName(v3);
            v42 = sel_getName(a2);
            v38(6, "%c[%{public}s %{public}s]:%i Restarting multitag detection", v40, v41, v42, 805);
          }
          v43 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v44 = NFSharedLogGetLogger(v43);
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = object_getClass(v3);
            if (class_isMetaClass(v46))
              v47 = 43;
            else
              v47 = 45;
            v48 = object_getClassName(v3);
            v49 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v102 = v47;
            v103 = 2082;
            v104 = v48;
            v105 = 2082;
            v106 = v49;
            v107 = 1024;
            v108 = 805;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Restarting multitag detection", buf, 0x22u);
          }

          v50 = v3->_driverWrapper;
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig none](NFRoutingConfig, "none"));
          v52 = -[NFACDriverWrapper setRouting:](v50, "setRouting:", v51);

          v3->_needsMultiTagRestart = 0;
        }
        if (NFProductIsDevBoard()
          && (v53 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACHardwareManager _getDefaults](v3, "_getDefaults")),
              v54 = objc_msgSend(v53, "BOOLForKey:", CFSTR("forceMultiTagEnabled")),
              v53,
              (v54 & 1) == 0))
        {
          v85 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v86 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v85);
          if (v86)
          {
            v87 = object_getClass(v3);
            if (class_isMetaClass(v87))
              v88 = 43;
            else
              v88 = 45;
            v89 = object_getClassName(v3);
            v90 = sel_getName(a2);
            v86(6, "%c[%{public}s %{public}s]:%i Multitag detection is suppressed on dev boards", v88, v89, v90, 811);
          }
          v91 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v92 = NFSharedLogGetLogger(v91);
          v5 = objc_claimAutoreleasedReturnValue(v92);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            v93 = object_getClass(v3);
            if (class_isMetaClass(v93))
              v94 = 43;
            else
              v94 = 45;
            v95 = object_getClassName(v3);
            v96 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            v102 = v94;
            v103 = 2082;
            v104 = v95;
            v105 = 2082;
            v106 = v96;
            v107 = 1024;
            v108 = 811;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Multitag detection is suppressed on dev boards", buf, 0x22u);
          }
        }
        else
        {
          v55 = v3->_driverWrapper;
          v5 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig accessoryMultiTag](NFRoutingConfig, "accessoryMultiTag"));
          v56 = -[NFACDriverWrapper setRouting:](v55, "setRouting:", v5);
        }
      }
      else
      {
        v70 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v71 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v70);
        if (v71)
        {
          v72 = object_getClass(v3);
          if (class_isMetaClass(v72))
            v73 = 43;
          else
            v73 = 45;
          v74 = object_getClassName(v3);
          v75 = sel_getName(a2);
          v71(6, "%c[%{public}s %{public}s]:%i Baseband not ready", v73, v74, v75, 799);
        }
        v76 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v77 = NFSharedLogGetLogger(v76);
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          v79 = object_getClass(v3);
          if (class_isMetaClass(v79))
            v80 = 43;
          else
            v80 = 45;
          v81 = object_getClassName(v3);
          v82 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v102 = v80;
          v103 = 2082;
          v104 = v81;
          v105 = 2082;
          v106 = v82;
          v107 = 1024;
          v108 = 799;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Baseband not ready", buf, 0x22u);
        }

        v83 = v3->_driverWrapper;
        v5 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig none](NFRoutingConfig, "none"));
        v84 = -[NFACDriverWrapper setRouting:](v83, "setRouting:", v5);
      }
    }
    else
    {
      v68 = v3->_driverWrapper;
      v5 = objc_claimAutoreleasedReturnValue(+[NFRoutingConfig none](NFRoutingConfig, "none"));
      v69 = -[NFACDriverWrapper setRouting:](v68, "setRouting:", v5);
    }
    goto LABEL_14;
  }
}

- (void)shutdownAndLeaveHWEnabled:(BOOL)a3 callback:(id)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  NSObject *workQueue;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  const char *Name;
  _QWORD block[5];
  id v33;
  SEL v34;
  BOOL v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  NSErrorUserInfoKey v44;
  void *v45;

  v7 = a4;
  v8 = NFSharedSignpostLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_SHUTDOWN", ", buf, 2u);
  }

  if ((NFIsInternalBuild(v10) & 1) != 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i ", v17, ClassName, Name, 833);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      v23 = object_getClassName(self);
      v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v37 = v22;
      v38 = 2082;
      v39 = v23;
      v40 = 2082;
      v41 = v24;
      v42 = 1024;
      v43 = 833;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10024D9B0;
    block[3] = &unk_1002E7E90;
    block[4] = self;
    v34 = a2;
    v33 = v7;
    v35 = a3;
    dispatch_async(workQueue, block);

  }
  else
  {
    v26 = objc_alloc((Class)NSError);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v44 = NSLocalizedDescriptionKey;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v45 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    v30 = objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 14, v29);
    (*((void (**)(id, id))v7 + 2))(v7, v30);

  }
}

- (void)dequeueSession:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024DF5C;
  v7[3] = &unk_1002E5CA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)_dequeueSession:(id)a3 startNextSession:(BOOL)a4
{
  _BOOL4 v4;
  _NFACSession *v7;
  uint64_t v8;
  NSObject *v9;
  _NFACHardwareManager *v10;
  BOOL v11;
  NSMutableArray *v12;
  _NFACSession *currentSession;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _NFACSession *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v32;
  const char *ClassName;
  const char *Name;
  void *v35;
  uint64_t v36;
  objc_class *v37;
  int v38;
  const char *v39;
  const char *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  _NFACSession *v56;
  NSErrorUserInfoKey v57;
  void *v58;
  NSErrorUserInfoKey v59;
  void *v60;

  v4 = a4;
  v7 = (_NFACSession *)a3;
  v8 = NFSharedSignpostLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_DEQUEUE_SESSION", ", buf, 2u);
  }

  v10 = self;
  objc_sync_enter(v10);
  v11 = !v10->_isRunning;
  objc_sync_exit(v10);

  if (!v11)
  {
    v12 = v10->_sessions;
    objc_sync_enter(v12);
    currentSession = v10->_currentSession;
    if (currentSession)
    {
      v14 = 1;
    }
    else
    {
      v14 = -[NSMutableArray count](v10->_sessions, "count") != 0;
      currentSession = v10->_currentSession;
    }
    if (currentSession == v7)
    {
      v20 = objc_alloc((Class)NSError);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v59 = NSLocalizedDescriptionKey;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Aborted"));
      v60 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
      v24 = objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 3, v23);
      -[_NFACSession didEndSession:](v7, "didEndSession:", v24);

      v25 = v10->_currentSession;
      v10->_currentSession = 0;

      if (v10->_systemWillSleep)
      {
        v27 = NFSharedSignpostLog(v26);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_dequeueSession: allowing to sleep", ", buf, 2u);
        }

        -[NFPowerObserver allowSleep](v10->_powerObserver, "allowSleep");
      }
    }
    else
    {
      if (-[NSMutableArray containsObject:](v10->_sessions, "containsObject:", v7))
      {
        -[NSMutableArray removeObject:](v10->_sessions, "removeObject:", v7);
        v15 = objc_alloc((Class)NSError);
        v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
        v57 = NSLocalizedDescriptionKey;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Aborted"));
        v58 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
        v19 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 3, v18);
        -[_NFACSession didEndSession:](v7, "didEndSession:", v19);

      }
      else
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
        if (Logger)
        {
          Class = object_getClass(v10);
          if (class_isMetaClass(Class))
            v32 = 43;
          else
            v32 = 45;
          ClassName = object_getClassName(v10);
          Name = sel_getName(a2);
          Logger(5, "%c[%{public}s %{public}s]:%i Session not found in queue %@", v32, ClassName, Name, 891, v7);
        }
        v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v36 = NFSharedLogGetLogger(v35);
        v16 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v37 = object_getClass(v10);
          if (class_isMetaClass(v37))
            v38 = 43;
          else
            v38 = 45;
          v39 = object_getClassName(v10);
          v40 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          v48 = v38;
          v49 = 2082;
          v50 = v39;
          v51 = 2082;
          v52 = v40;
          v53 = 1024;
          v54 = 891;
          v55 = 2112;
          v56 = v7;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session not found in queue %@", buf, 0x2Cu);
        }
      }

    }
    -[_NFACSession releaseRemoteObject](v7, "releaseRemoteObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACSession connection](v7, "connection"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "NF_userInfo"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ProxyObjects")));
    objc_msgSend(v43, "removeObject:", v7);

    if (v14 && !v10->_currentSession && !-[NSMutableArray count](v10->_sessions, "count"))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NFPowerAssertion sharedPowerAssertion](NFPowerAssertion, "sharedPowerAssertion"));
      objc_msgSend(v44, "releasePowerAssertion:", CFSTR("NfcacdSessions"));

    }
    objc_sync_exit(v12);

    if (v4)
    {
      workQueue = v10->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10024E4B4;
      block[3] = &unk_1002E5C58;
      block[4] = v10;
      dispatch_async(workQueue, block);
    }
  }

}

- (BOOL)_loadHWInfo
{
  void *v4;
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  const char *ClassName;
  const char *Name;
  _QWORD v21[6];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10024E6AC;
  v21[3] = &unk_1002EC590;
  v21[4] = self;
  v21[5] = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACHardwareManager _executeWithDriverSessionSync:block:](self, "_executeWithDriverSessionSync:block:", CFSTR("Load HW Info"), v21));
  if (v4)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 934, v4);
    }
    v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      v16 = object_getClassName(self);
      v17 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v23 = v15;
      v24 = 2082;
      v25 = v16;
      v26 = 2082;
      v27 = v17;
      v28 = 1024;
      v29 = 934;
      v30 = 2114;
      v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  return v4 == 0;
}

- (unint64_t)_loadHW
{
  uint64_t v4;
  NSObject *v5;
  NFACDriverWrapper *driverWrapper;
  void *v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  NFPreferenceObserver *v22;
  NFPreferenceObserver *preferenceObserver;
  NFPreferenceObserver *v24;
  unint64_t v25;
  NFPowerTrackingConsumer *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  OS_os_transaction *v31;
  OS_os_transaction *lpcdTransaction;
  void *v33;
  uint64_t v34;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *v36;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  int v42;
  const char *v43;
  const char *v44;
  OS_os_transaction *v45;
  OS_os_transaction *multiTagTransaction;
  NFACDriverWrapper *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, ...);
  objc_class *v53;
  _BOOL4 v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  objc_class *v59;
  int v60;
  const char *v61;
  const char *v62;
  const char *v64;
  const char *v65;
  const char *Name;
  const char *v67;
  const char *v68;
  id v69;
  char v70;
  _QWORD v71[5];
  uint8_t buf[4];
  int v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  __int16 v80;
  unint64_t v81;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_LOAD_HW", ", buf, 2u);
  }

  driverWrapper = self->_driverWrapper;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACHardwareManager _readDriverSettings](self, "_readDriverSettings"));
  -[NFACDriverWrapper configureDriverSettings:](driverWrapper, "configureDriverSettings:", v7);

  if ((-[NFPowerObserver registerForEvents](self->_powerObserver, "registerForEvents") & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Failed to register for power events", v14, ClassName, Name, 952);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v73 = v19;
      v74 = 2082;
      v75 = v20;
      v76 = 2082;
      v77 = v21;
      v78 = 1024;
      v79 = 952;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register for power events", buf, 0x22u);
    }

  }
  if (!self->_preferenceObserver)
  {
    v22 = objc_opt_new(NFPreferenceObserver);
    preferenceObserver = self->_preferenceObserver;
    self->_preferenceObserver = v22;

    v24 = self->_preferenceObserver;
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_10024EF4C;
    v71[3] = &unk_1002E5C58;
    v71[4] = self;
    -[NFPreferenceObserver start:](v24, "start:", v71);
  }
  v25 = -[NFACDriverWrapper openSession:](self->_driverWrapper, "openSession:", CFSTR("Load HW"));
  if (v25 != 1)
  {
    v33 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v34 = NFLogGetLogger(v33);
    if (v34)
    {
      v35 = (void (*)(uint64_t, const char *, ...))v34;
      v36 = object_getClass(self);
      v37 = class_isMetaClass(v36);
      v64 = object_getClassName(self);
      v67 = sel_getName(a2);
      v38 = 45;
      if (v37)
        v38 = 43;
      v35(4, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu", v38, v64, v67, 964, v25);
    }
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFSharedLogGetLogger(v39);
    v28 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v41 = object_getClass(self);
      if (class_isMetaClass(v41))
        v42 = 43;
      else
        v42 = 45;
      v43 = object_getClassName(self);
      v44 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v73 = v42;
      v74 = 2082;
      v75 = v43;
      v76 = 2082;
      v77 = v44;
      v78 = 1024;
      v79 = 964;
      v80 = 2048;
      v81 = v25;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu",
        buf,
        0x2Cu);
    }
    goto LABEL_48;
  }
  if (-[_NFACHardwareManager _loadHWInfo](self, "_loadHWInfo"))
  {
    v26 = sub_100199368((uint64_t)NFPowerTrackingConsumer, -[NFHardwareControllerInfo siliconName](self->_controllerInfo, "siliconName"));
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = v27;
    if (v27)
      *(_BYTE *)(v27 + 16) = 0;
    v29 = sub_10019C2FC((uint64_t)NFSystemPowerConsumptionMonitor);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    sub_10019C070((uint64_t)v30, v28);

    if (self->_runLPCD)
    {
      if ((id)-[NFACDriverWrapper openSession:](self->_driverWrapper, "openSession:", CFSTR("LpcdSession")) == (id)1)
      {
        v31 = (OS_os_transaction *)os_transaction_create("com.apple.nfcacd.lpcd");
        lpcdTransaction = self->_lpcdTransaction;
        self->_lpcdTransaction = v31;

        -[_NFACHardwareManager maybeStartNextSession](self, "maybeStartNextSession");
      }
    }
    else if (self->_runMultiTagDetection
           && (id)-[NFACDriverWrapper openSession:](self->_driverWrapper, "openSession:", CFSTR("MultiTagSession")) == (id)1)
    {
      v45 = (OS_os_transaction *)os_transaction_create("com.apple.nfcacd.multitag");
      multiTagTransaction = self->_multiTagTransaction;
      self->_multiTagTransaction = v45;

      v70 = 0;
      v47 = self->_driverWrapper;
      v69 = 0;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper queryMultiTagState:error:](v47, "queryMultiTagState:error:", &v70, &v69));
      v49 = v69;
      v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v51 = NFLogGetLogger(v50);
      if (v51)
      {
        v52 = (void (*)(uint64_t, const char *, ...))v51;
        v53 = object_getClass(self);
        v54 = class_isMetaClass(v53);
        v65 = object_getClassName(self);
        v68 = sel_getName(a2);
        v55 = 45;
        if (v54)
          v55 = 43;
        v52(6, "%c[%{public}s %{public}s]:%i detectedTags; %{public}@", v55, v65, v68, 994, v48);
      }
      v56 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v57 = NFSharedLogGetLogger(v56);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = object_getClass(self);
        if (class_isMetaClass(v59))
          v60 = 43;
        else
          v60 = 45;
        v61 = object_getClassName(self);
        v62 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v73 = v60;
        v74 = 2082;
        v75 = v61;
        v76 = 2082;
        v77 = v62;
        v78 = 1024;
        v79 = 994;
        v80 = 2114;
        v81 = (unint64_t)v48;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i detectedTags; %{public}@",
          buf,
          0x2Cu);
      }

      if (v70)
        objc_storeStrong((id *)&self->_lastDetectedTags, v48);
      -[_NFACHardwareManager maybeStartNextSession](self, "maybeStartNextSession");

    }
    sub_1001917E0(self->_basebandMonitor, self);
    -[NFACDriverWrapper closeSession:](self->_driverWrapper, "closeSession:", CFSTR("Load HW"));
LABEL_48:

    return v25;
  }
  return 2;
}

- (void)didCloseXPCConnection:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *workQueue;
  id v29;
  _QWORD block[5];
  id v31;
  SEL v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;

  v5 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ClientName")));
    v15 = 45;
    if (isMetaClass)
      v15 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i Removing XPC connection for %{public}@ - %{public}@", v15, ClassName, Name, 1012, v14, v5);

  }
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = object_getClass(self);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    v21 = object_getClassName(self);
    v22 = sel_getName(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NF_userInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ClientName")));
    *(_DWORD *)buf = 67110402;
    v34 = v20;
    v35 = 2082;
    v36 = v21;
    v37 = 2082;
    v38 = v22;
    v39 = 1024;
    v40 = 1012;
    v41 = 2114;
    v42 = v24;
    v43 = 2114;
    v44 = v5;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing XPC connection for %{public}@ - %{public}@", buf, 0x36u);

  }
  v26 = NFSharedSignpostLog(v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_XPC_CONNECTION_CLOSE", ", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024F20C;
  block[3] = &unk_1002E5C80;
  v31 = v5;
  v32 = a2;
  block[4] = self;
  v29 = v5;
  dispatch_async(workQueue, block);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  _NFACHardwareManager *v24;
  NSObject *workQueue;
  void *v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  unint64_t hardwareState;
  _NFACHardwareManager *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  NSMutableArray *v45;
  void *v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  objc_class *v55;
  int v56;
  const char *v57;
  const char *v58;
  unsigned int v59;
  const char *Name;
  id v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[5];
  id v66;
  _QWORD block[6];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  id buf;
  __int16 v73;
  const char *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  int v78;
  __int16 v79;
  _BYTE v80[14];

  v62 = a3;
  v7 = a4;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 1033);
  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    LODWORD(buf) = 67109890;
    HIDWORD(buf) = v19;
    v73 = 2082;
    v74 = object_getClassName(self);
    v75 = 2082;
    v76 = sel_getName(a2);
    v77 = 1024;
    v78 = 1033;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", (uint8_t *)&buf, 0x22u);
  }

  v21 = NFSharedSignpostLog(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_signpost_enabled(v22))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_XPC_CONNECT", ", (uint8_t *)&buf, 2u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.nfcacd.hwmanager")));
  if (v23)
  {
    v68 = 0;
    v69 = &v68;
    v70 = 0x2020000000;
    v71 = 0;
    v24 = self;
    objc_sync_enter(v24);
    v69[3] = v24->_hardwareState;
    objc_sync_exit(v24);

    if ((v69[3] | 2) == 2)
    {
      workQueue = v24->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10024FCCC;
      block[3] = &unk_1002E5EA8;
      block[4] = v24;
      block[5] = &v68;
      dispatch_sync(workQueue, block);
      if (v69[3] != 1)
      {
        v26 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v26);
        if (v27)
        {
          v28 = object_getClass(v24);
          if (class_isMetaClass(v28))
            v29 = 43;
          else
            v29 = 45;
          v30 = object_getClassName(v24);
          v31 = sel_getName(a2);
          v27(4, "%c[%{public}s %{public}s]:%i Hardware not available : %lu", v29, v30, v31, 1056, v24->_hardwareState);
        }
        v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v33 = NFSharedLogGetLogger(v32);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = object_getClass(v24);
          if (class_isMetaClass(v35))
            v36 = 43;
          else
            v36 = 45;
          v37 = object_getClassName(v24);
          v38 = sel_getName(a2);
          hardwareState = v24->_hardwareState;
          LODWORD(buf) = 67110146;
          HIDWORD(buf) = v36;
          v73 = 2082;
          v74 = v37;
          v75 = 2082;
          v76 = v38;
          v77 = 1024;
          v78 = 1056;
          v79 = 2048;
          *(_QWORD *)v80 = hardwareState;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Hardware not available : %lu", (uint8_t *)&buf, 0x2Cu);
        }

      }
      v40 = v24;
      objc_sync_enter(v40);
      v24->_hardwareState = v69[3];
      objc_sync_exit(v40);

    }
    v41 = sub_100174B78((uint64_t)NFHardwareManagerAccessoryCallbacks);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    objc_msgSend(v7, "setRemoteObjectInterface:", v42);

    v43 = sub_1001749F8((uint64_t)NFHardwareManagerAccessoryInterface);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    objc_msgSend(v7, "setExportedInterface:", v44);

    objc_msgSend(v7, "setExportedObject:", v24);
    objc_initWeak(&buf, v7);
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10024FDAC;
    v65[3] = &unk_1002EC5B8;
    v65[4] = v24;
    objc_copyWeak(&v66, &buf);
    objc_msgSend(v7, "setInvalidationHandler:", v65);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10024FDEC;
    v63[3] = &unk_1002EC5B8;
    v63[4] = v24;
    objc_copyWeak(&v64, &buf);
    objc_msgSend(v7, "setInterruptionHandler:", v63);
    objc_msgSend(v7, "_setQueue:", v24->_xpcConnectionQueue);
    v45 = v24->_xpcConnections;
    objc_sync_enter(v45);
    -[NSMutableArray addObject:](v24->_xpcConnections, "addObject:", v7);
    objc_sync_exit(v45);

    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v64);
    objc_destroyWeak(&v66);
    objc_destroyWeak(&buf);
    _Block_object_dispose(&v68, 8);
  }
  else
  {
    v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v47 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(v46);
    if (v47)
    {
      v48 = object_getClass(self);
      if (class_isMetaClass(v48))
        v49 = 43;
      else
        v49 = 45;
      v50 = object_getClassName(self);
      v51 = sel_getName(a2);
      v47(3, "%c[%{public}s %{public}s]:%i client; pid=%d is missing entitlement :%{public}@",
        v49,
        v50,
        v51,
        1037,
        objc_msgSend(v7, "processIdentifier"),
        CFSTR("com.apple.nfcacd.hwmanager"));
    }
    v52 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v53 = NFSharedLogGetLogger(v52);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = object_getClass(self);
      if (class_isMetaClass(v55))
        v56 = 43;
      else
        v56 = 45;
      v57 = object_getClassName(self);
      v58 = sel_getName(a2);
      v59 = objc_msgSend(v7, "processIdentifier");
      LODWORD(buf) = 67110402;
      HIDWORD(buf) = v56;
      v73 = 2082;
      v74 = v57;
      v75 = 2082;
      v76 = v58;
      v77 = 1024;
      v78 = 1037;
      v79 = 1024;
      *(_DWORD *)v80 = v59;
      *(_WORD *)&v80[4] = 2114;
      *(_QWORD *)&v80[6] = CFSTR("com.apple.nfcacd.hwmanager");
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i client; pid=%d is missing entitlement :%{public}@",
        (uint8_t *)&buf,
        0x32u);
    }

  }
  return v23 != 0;
}

- (void)handleReaderBurnoutTimer
{
  uint64_t v4;
  NSObject *v5;
  NSObject *workQueue;
  _QWORD v7[6];
  uint8_t buf[16];

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_READER_TIMER", ", buf, 2u);
  }

  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024FEEC;
  v7[3] = &unk_1002E5C30;
  v7[4] = self;
  v7[5] = a2;
  dispatch_async(workQueue, v7);
}

- (void)handleReaderBurnoutCleared
{
  uint64_t v4;
  NSObject *v5;
  NSObject *workQueue;
  _QWORD v7[6];
  uint8_t buf[16];

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_READER_TIMER_CLEARED", ", buf, 2u);
  }

  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10025017C;
  v7[3] = &unk_1002E5C30;
  v7[4] = self;
  v7[5] = a2;
  dispatch_sync(workQueue, v7);
}

- (void)handleRestartDiscovery
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 1117);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v18 = v15;
    v19 = 2082;
    v20 = object_getClassName(self);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 1117;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

}

- (void)handleHardwareReset:(const char *)a3
{
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = NFSharedSignpostLog(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_HW_RESET", ", v7, 2u);
  }

  -[NFACDriverWrapper simulateCrash:reason:](self->_driverWrapper, "simulateCrash:reason:", 57005, a3);
}

- (void)handlePLLUnlock
{
  uint64_t v4;
  NSObject *v5;
  NSObject *workQueue;
  _QWORD v7[6];
  uint8_t buf[16];

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_PLL_UNLOCK", ", buf, 2u);
  }

  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002505F4;
  v7[3] = &unk_1002E5C30;
  v7[4] = self;
  v7[5] = a2;
  dispatch_async(workQueue, v7);
}

- (void)handleStackUnload
{
  uint64_t v4;
  NSObject *v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_STACK_UNLOAD", ", buf, 2u);
  }

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 1166);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    v18 = object_getClassName(self);
    v19 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v22 = v17;
    v23 = 2082;
    v24 = v18;
    v25 = 2082;
    v26 = v19;
    v27 = 1024;
    v28 = 1166;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

}

- (void)handleStackLoad
{
  uint64_t v4;
  NSObject *v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_STACK_LOAD", ", buf, 2u);
  }

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 1172);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    v18 = object_getClassName(self);
    v19 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v22 = v17;
    v23 = 2082;
    v24 = v18;
    v25 = 2082;
    v26 = v19;
    v27 = 1024;
    v28 = 1172;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

}

- (void)handleRemoteTagsDetected:(id)a3
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100250E08;
  block[3] = &unk_1002E5C80;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(workQueue, block);

}

- (void)handleMultiTagStateChanged:(id)a3 rfError:(BOOL)a4
{
  id v7;
  NSObject *workQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  BOOL v13;

  v7 = a3;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10025166C;
  v10[3] = &unk_1002E8690;
  v11 = v7;
  v12 = a2;
  v10[4] = self;
  v13 = a4;
  v9 = v7;
  dispatch_async(workQueue, v10);

}

- (void)preferencesDidChange
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_7;
  block[3] = &unk_1002E5C58;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_readDriverSettings
{
  NSMutableDictionary *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *specific;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *v32;
  _BOOL4 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  uint64_t v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  unsigned int v61;
  void *v62;
  uint64_t v63;
  void (*v64)(uint64_t, const char *, ...);
  objc_class *v65;
  _BOOL4 v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  objc_class *v71;
  int v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  unsigned int v78;
  void *v79;
  uint64_t v80;
  void (*v81)(uint64_t, const char *, ...);
  objc_class *v82;
  _BOOL4 v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  objc_class *v88;
  int v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  void (*v98)(uint64_t, const char *, ...);
  objc_class *v99;
  _BOOL4 v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  objc_class *v105;
  int v106;
  const char *v107;
  const char *v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  const char *v125;
  const char *v126;
  const char *v127;
  const char *v128;
  const char *v129;
  const char *Name;
  const char *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  const char *v135;
  uint8_t buf[4];
  int v137;
  __int16 v138;
  const char *v139;
  __int16 v140;
  const char *v141;
  __int16 v142;
  int v143;
  __int16 v144;
  unsigned int v145;

  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACHardwareManager _getDefaults](self, "_getDefaults"));
  objc_msgSend(v5, "synchronize");
  self->_runLPCD = objc_msgSend(v5, "BOOLForKey:", CFSTR("LpcdAlwaysOn"));
  self->_runMultiTagDetection = objc_msgSend(v5, "BOOLForKey:", CFSTR("MultiTagDetectionOn"));
  if (objc_msgSend(v5, "BOOLForKey:", CFSTR("LogNCI")))
    v6 = 4;
  else
    v6 = 0;
  if (objc_msgSend(v5, "BOOLForKey:", CFSTR("LogAPI")))
    v6 |= 8uLL;
  if (objc_msgSend(v5, "BOOLForKey:", CFSTR("LogAPDU")))
    v6 |= 0x10uLL;
  if (objc_msgSend(v5, "BOOLForKey:", CFSTR("LogLPCD")))
    v6 |= 0x2000uLL;
  if (objc_msgSend(v5, "BOOLForKey:", CFSTR("MultiTagDebug")))
    v6 |= 0x800000uLL;
  v7 = objc_msgSend(v5, "integerForKey:", CFSTR("LogRF"));
  v8 = v6 | 1;
  v9 = v6 | 2;
  if (v7 != (id)1)
    v9 = v6;
  if (v7 != (id)2)
    v8 = v9;
  if (v7 == (id)4)
    v10 = v6 | 3;
  else
    v10 = v8;
  v11 = objc_alloc((Class)NSDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Preferences/Logging/Subsystems/com.apple.nfcac.plist"));
  v13 = objc_msgSend(v11, "initWithContentsOfFile:", v12);

  if (v13)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v20 = 45;
      if (isMetaClass)
        v20 = 43;
      v16(6, "%c[%{public}s %{public}s]:%i Loading managed profile settings", v20, ClassName, Name, 1304);
    }
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v22 = NFSharedLogGetLogger(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      *(_DWORD *)buf = 67109890;
      v137 = v25;
      v138 = 2082;
      v139 = object_getClassName(self);
      v140 = 2082;
      v141 = sel_getName(a2);
      v142 = 1024;
      v143 = 1304;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Loading managed profile settings", buf, 0x22u);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("LpcdAlwaysOn")));
    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("LpcdAlwaysOn")));
      v28 = objc_msgSend(v27, "BOOLValue");

      v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v30 = NFLogGetLogger(v29);
      if (v30)
      {
        v31 = (void (*)(uint64_t, const char *, ...))v30;
        v32 = object_getClass(self);
        v33 = class_isMetaClass(v32);
        v125 = object_getClassName(self);
        v131 = sel_getName(a2);
        v34 = 45;
        if (v33)
          v34 = 43;
        v31(5, "%c[%{public}s %{public}s]:%i Overriding pref settings for LpcdAlwaysOn with managed profile: %d", v34, v125, v131, 1308, v28);
      }
      v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v36 = NFSharedLogGetLogger(v35);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = object_getClass(self);
        if (class_isMetaClass(v38))
          v39 = 43;
        else
          v39 = 45;
        v40 = object_getClassName(self);
        v41 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v137 = v39;
        v138 = 2082;
        v139 = v40;
        v140 = 2082;
        v141 = v41;
        v142 = 1024;
        v143 = 1308;
        v144 = 1024;
        v145 = v28;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding pref settings for LpcdAlwaysOn with managed profile: %d", buf, 0x28u);
      }

      self->_runLPCD = v28;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("LogAPDU")));

    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("LogAPDU")));
      v44 = objc_msgSend(v43, "BOOLValue");

      v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v46 = NFLogGetLogger(v45);
      if (v46)
      {
        v47 = (void (*)(uint64_t, const char *, ...))v46;
        v48 = object_getClass(self);
        v49 = class_isMetaClass(v48);
        v126 = object_getClassName(self);
        v132 = sel_getName(a2);
        v50 = 45;
        if (v49)
          v50 = 43;
        v47(5, "%c[%{public}s %{public}s]:%i Overriding pref settings for LogAPDU with managed profile: %d", v50, v126, v132, 1313, v44);
      }
      v51 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v52 = NFSharedLogGetLogger(v51);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = object_getClass(self);
        if (class_isMetaClass(v54))
          v55 = 43;
        else
          v55 = 45;
        v56 = object_getClassName(self);
        v57 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v137 = v55;
        v138 = 2082;
        v139 = v56;
        v140 = 2082;
        v141 = v57;
        v142 = 1024;
        v143 = 1313;
        v144 = 1024;
        v145 = v44;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding pref settings for LogAPDU with managed profile: %d", buf, 0x28u);
      }

      v58 = 16;
      if (!v44)
        v58 = 0;
      v10 = v58 | v10 & 0xFFFFFFFFFFFFFFEFLL;
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("LogAPI")));

    if (v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("LogAPI")));
      v61 = objc_msgSend(v60, "BOOLValue");

      v62 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v63 = NFLogGetLogger(v62);
      if (v63)
      {
        v64 = (void (*)(uint64_t, const char *, ...))v63;
        v65 = object_getClass(self);
        v66 = class_isMetaClass(v65);
        v127 = object_getClassName(self);
        v133 = sel_getName(a2);
        v67 = 45;
        if (v66)
          v67 = 43;
        v64(5, "%c[%{public}s %{public}s]:%i Overriding pref settings for LogAPI with managed profile: %d", v67, v127, v133, 1319, v61);
      }
      v68 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v69 = NFSharedLogGetLogger(v68);
      v70 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        v71 = object_getClass(self);
        if (class_isMetaClass(v71))
          v72 = 43;
        else
          v72 = 45;
        v73 = object_getClassName(self);
        v74 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v137 = v72;
        v138 = 2082;
        v139 = v73;
        v140 = 2082;
        v141 = v74;
        v142 = 1024;
        v143 = 1319;
        v144 = 1024;
        v145 = v61;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding pref settings for LogAPI with managed profile: %d", buf, 0x28u);
      }

      v75 = 8;
      if (!v61)
        v75 = 0;
      v10 = v75 | v10 & 0xFFFFFFFFFFFFFFF7;
    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("LogNCI")));

    if (v76)
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("LogNCI")));
      v78 = objc_msgSend(v77, "BOOLValue");

      v79 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v80 = NFLogGetLogger(v79);
      if (v80)
      {
        v81 = (void (*)(uint64_t, const char *, ...))v80;
        v82 = object_getClass(self);
        v83 = class_isMetaClass(v82);
        v128 = object_getClassName(self);
        v134 = sel_getName(a2);
        v84 = 45;
        if (v83)
          v84 = 43;
        v81(5, "%c[%{public}s %{public}s]:%i Overriding pref settings with LogNCI managed profile: %d", v84, v128, v134, 1325, v78);
      }
      v85 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v86 = NFSharedLogGetLogger(v85);
      v87 = objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        v88 = object_getClass(self);
        if (class_isMetaClass(v88))
          v89 = 43;
        else
          v89 = 45;
        v90 = object_getClassName(self);
        v91 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v137 = v89;
        v138 = 2082;
        v139 = v90;
        v140 = 2082;
        v141 = v91;
        v142 = 1024;
        v143 = 1325;
        v144 = 1024;
        v145 = v78;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding pref settings with LogNCI managed profile: %d", buf, 0x28u);
      }

      v92 = 4;
      if (!v78)
        v92 = 0;
      v10 = v92 | v10 & 0xFFFFFFFFFFFFFFFBLL;
    }
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("LogRF")));

    if (v93)
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("LogRF")));
      v95 = objc_msgSend(v94, "intValue");

      v96 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v97 = NFLogGetLogger(v96);
      if (v97)
      {
        v98 = (void (*)(uint64_t, const char *, ...))v97;
        v99 = object_getClass(self);
        v100 = class_isMetaClass(v99);
        v129 = object_getClassName(self);
        v135 = sel_getName(a2);
        v101 = 45;
        if (v100)
          v101 = 43;
        v98(5, "%c[%{public}s %{public}s]:%i Overriding pref settings with LogRF managed profile: 0x%04x", v101, v129, v135, 1331, v95);
      }
      v102 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v103 = NFSharedLogGetLogger(v102);
      v104 = objc_claimAutoreleasedReturnValue(v103);
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        v105 = object_getClass(self);
        if (class_isMetaClass(v105))
          v106 = 43;
        else
          v106 = 45;
        v107 = object_getClassName(self);
        v108 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v137 = v106;
        v138 = 2082;
        v139 = v107;
        v140 = 2082;
        v141 = v108;
        v142 = 1024;
        v143 = 1331;
        v144 = 1024;
        v145 = v95;
        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding pref settings with LogRF managed profile: 0x%04x", buf, 0x28u);
      }

      v109 = v10 & 0xFFFFFFFFFFFFFFFCLL;
      if ((_DWORD)v95 == 1)
        v109 = v10 & 0xFFFFFFFFFFFFFFFCLL | 2;
      if ((_DWORD)v95 == 2)
        v109 = v10 & 0xFFFFFFFFFFFFFFFCLL | 1;
      if ((_DWORD)v95 == 4)
        v10 |= 3uLL;
      else
        v10 = v109;
    }
  }
  v110 = (uint64_t)objc_msgSend(v5, "integerForKey:", CFSTR("PollingPeriod"));
  v111 = v110 & ~(v110 >> 63);
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v112, CFSTR("flags"));

  v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v111));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v113, CFSTR("pollPeriod"));

  v114 = (uint64_t)objc_msgSend(v5, "integerForKey:", CFSTR("MultiTagPollingPeriod"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v114 & ~(v114 >> 63)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v115, CFSTR("multiTagPollPeriod"));

  v116 = (uint64_t)objc_msgSend(v5, "integerForKey:", CFSTR("MultiTagPollingRetries"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v116 & ~(v116 >> 63)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v117, CFSTR("multiTagPollRetries"));

  v118 = (uint64_t)objc_msgSend(v5, "integerForKey:", CFSTR("NTAG5DataRate"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v118 & ~(v118 >> 63)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v119, CFSTR("ntag5DataRate"));

  v120 = (uint64_t)objc_msgSend(v5, "integerForKey:", CFSTR("TypeATagDataRate"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v120 & ~(v120 >> 63)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v121, CFSTR("typeATagDataRate"));

  v122 = (uint64_t)objc_msgSend(v5, "integerForKey:", CFSTR("NTAG5T1"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v122 & ~(v122 >> 63)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v123, CFSTR("ntag5T1"));

  return v4;
}

- (void)isHWSupported:(id)a3
{
  unint64_t hardwareState;
  uint64_t v4;

  hardwareState = self->_hardwareState;
  if (hardwareState < 4)
    v4 = (hardwareState + 1);
  else
    v4 = 0;
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
}

- (void)triggerDelayedWake:(unsigned __int8)a3 callback:(id)a4
{
  id v7;
  NSObject *workQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  unsigned __int8 v13;

  v7 = a4;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002528A8;
  v10[3] = &unk_1002E7E90;
  v11 = v7;
  v12 = a2;
  v10[4] = self;
  v13 = a3;
  v9 = v7;
  dispatch_async(workQueue, v10);

}

- (void)pushSignedRF:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100252E40;
  block[3] = &unk_1002E8258;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)_sync_pushSignedRF:(id)a3 callback:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100252F0C;
  v10[3] = &unk_1002EC5E0;
  v11 = a3;
  v12 = a2;
  v10[4] = self;
  v7 = v11;
  v8 = (void (**)(id, void *))a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACHardwareManager _executeWithDriverSessionSync:block:](self, "_executeWithDriverSessionSync:block:", CFSTR("Push RF"), v10));
  v8[2](v8, v9);

}

- (void)basebandStateChanged:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD block[6];
  BOOL v5;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100253248;
  block[3] = &unk_1002EC608;
  block[4] = self;
  block[5] = a2;
  v5 = a3;
  dispatch_async(workQueue, block);
}

- (os_state_data_s)dumpState
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  id v23;
  os_state_data_s *v24;
  id v25;
  const char *ClassName;
  const char *Name;
  id v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;

  v4 = objc_alloc((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFACHardwareManager _getInfo](self, "_getInfo"));
  v6 = objc_msgSend(v4, "initWithDictionary:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFACDriverWrapper state](self->_driverWrapper, "state"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("driverwrapperState"));

  v29 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v6, 200, 0, &v29));
  v9 = v29;
  if (v9)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i Failed to serialize state dump: %{public}@", v15, ClassName, Name, 1484, v9);
    }
    v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(self);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      v21 = object_getClassName(self);
      v22 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v31 = v20;
      v32 = 2082;
      v33 = v21;
      v34 = 2082;
      v35 = v22;
      v36 = 1024;
      v37 = 1484;
      v38 = 2114;
      v39 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to serialize state dump: %{public}@", buf, 0x2Cu);
    }

  }
  v23 = objc_msgSend(v8, "length");
  v24 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v23 + 200, 0x7747207EuLL);
  v24->var0 = 1;
  v24->var1.var1 = v23;
  __strlcpy_chk(v24->var3, "nfcacd state", 64, 64);
  v25 = objc_retainAutorelease(v8);
  memcpy(v24->var4, objc_msgSend(v25, "bytes"), (size_t)v23);

  return v24;
}

- (BOOL)isWalletAttached
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  id v7;
  unsigned __int8 *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_lastDetectedTags;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "silentType", (_QWORD)v10) == 3)
        {
          v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tagID")));
          v8 = (unsigned __int8 *)objc_msgSend(v7, "bytes");

          if (v8)
          {
            if (*v8 - 87 < 2)
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulingDailyUpdating, 0);
  objc_storeStrong((id *)&self->_accessorydEventPublisher, 0);
  objc_storeStrong((id *)&self->_basebandMonitor, 0);
  objc_storeStrong((id *)&self->_lastDetectedTags, 0);
  objc_storeStrong((id *)&self->_controllerInfo, 0);
  objc_storeStrong((id *)&self->_multiTagTransaction, 0);
  objc_storeStrong((id *)&self->_lpcdTransaction, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_preferenceObserver, 0);
  objc_storeStrong((id *)&self->_powerObserver, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcEventNotificationQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
