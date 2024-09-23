@implementation CloudXPCService

+ (id)sharedInstance
{
  if (qword_100212608 != -1)
    dispatch_once(&qword_100212608, &stru_1001E4C88);
  return (id)qword_100212600;
}

- (CloudXPCService)init
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  void *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  dispatch_source_t v24;
  void *v25;
  NSObject *v26;
  _QWORD handler[4];
  id v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;

  v30.receiver = self;
  v30.super_class = (Class)CloudXPCService;
  v2 = -[CloudXPCService init](&v30, "init");
  if (!v2)
    return (CloudXPCService *)v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("XPC_SERVICE_NAME")));

  v6 = sub_1000681B8("XPC");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v32 = v5;
      v9 = "Cloudpaird is launched by (%@)";
      v10 = v7;
      v11 = 12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    v9 = "Cloudpaird is launched";
    v10 = v7;
    v11 = 2;
    goto LABEL_7;
  }

  v12 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 0));
  v13 = (void *)*((_QWORD *)v2 + 14);
  *((_QWORD *)v2 + 14) = v12;

  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = dispatch_queue_create("com.apple.cloudpaird.xpcservice", v15);
  v17 = (void *)*((_QWORD *)v2 + 4);
  *((_QWORD *)v2 + 4) = v16;

  v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = dispatch_queue_create("com.apple.cloudpaird.xpcservice.transactions", v19);
  v21 = (void *)*((_QWORD *)v2 + 10);
  *((_QWORD *)v2 + 10) = v20;

  v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v23 = (void *)*((_QWORD *)v2 + 11);
  *((_QWORD *)v2 + 11) = v22;

  *((_DWORD *)v2 + 2) = -1;
  if (!*((_QWORD *)v2 + 2))
  {
    v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, *((dispatch_queue_t *)v2 + 4));
    v25 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v24;

    v26 = *((_QWORD *)v2 + 2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10007B798;
    handler[3] = &unk_1001E20E8;
    v29 = v2;
    dispatch_source_set_event_handler(v26, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 2));

  }
  return (CloudXPCService *)v2;
}

- (void)activate
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  NSObject *v14;
  os_log_t v15;
  NSObject *v16;
  NSObject *v17;
  OS_xpc_object *mach_service;
  OS_xpc_object *xpcServer;
  OS_xpc_object *v20;
  BTNetworkMonitor *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD handler[4];
  id v28;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  v3 = sub_1000681B8("XPC");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activate Bluetooth Cloud User Daemon", buf, 2u);
  }

  -[CloudXPCService establishBluetoothdXPCWithCompletion:](self, "establishBluetoothdXPCWithCompletion:", 0);
  if (+[CBPreferencesManager isDeviceClass:](CBPreferencesManager, "isDeviceClass:", CFSTR("AudioAccessory")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DarwinNotificationManager shared](_TtC15audioaccessoryd25DarwinNotificationManager, "shared"));
    objc_msgSend(v5, "setUp");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceManager singleton](_TtC15audioaccessoryd13DeviceManager, "singleton"));
    -[CloudXPCService setDeviceManager:](self, "setDeviceManager:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService xpcQueue](self, "xpcQueue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
    objc_msgSend(v8, "setClientQueue:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
    objc_msgSend(v9, "setDeviceDelegate:", self);

    v10 = +[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance");
    v11 = +[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudPushService shared](_TtC15audioaccessoryd16CloudPushService, "shared"));
    objc_msgSend(v5, "start");
  }

  v12 = +[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance");
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(kAXSAirPodSpatialAudioLockToDeviceChangedNotification), "UTF8String");
  v14 = objc_claimAutoreleasedReturnValue(-[CloudXPCService xpcQueue](self, "xpcQueue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10007BB78;
  handler[3] = &unk_1001E4CB0;
  objc_copyWeak(&v28, &location);
  notify_register_dispatch(v13, &self->_axHeadTrackingChangedNotifyToken, v14, handler);

  -[CloudXPCService axHeadTrackingSettingChanged](self, "axHeadTrackingSettingChanged");
  v15 = sub_1000681B8("XPC");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Create the XPC server", buf, 2u);
  }

  v17 = objc_claimAutoreleasedReturnValue(-[CloudXPCService xpcQueue](self, "xpcQueue"));
  mach_service = xpc_connection_create_mach_service("com.apple.BTServer.cloudpairing", v17, 1uLL);
  xpcServer = self->_xpcServer;
  self->_xpcServer = mach_service;

  v20 = self->_xpcServer;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10007BBA4;
  v25[3] = &unk_1001E4CD8;
  objc_copyWeak(&v26, &location);
  xpc_connection_set_event_handler(v20, v25);
  xpc_connection_resume(self->_xpcServer);
  v21 = objc_alloc_init(BTNetworkMonitor);
  -[CloudXPCService setNetworkMonitor:](self, "setNetworkMonitor:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService networkMonitor](self, "networkMonitor"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10007BBEC;
  v23[3] = &unk_1001E4D00;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v22, "startMonitoringWithCallback:", v23);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_sigTermReceived
{
  os_log_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_1000681B8("XPC");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SIGTERM received", buf, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[CloudXPCService transactionQueue](self, "transactionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BD78;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_sync(v5, block);

  xpc_transaction_exit_clean(v6);
}

- (void)axHeadTrackingSettingChanged
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CloudXPCService xpcQueue](self, "xpcQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BE14;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)bundleIdentifierForConnection:(id)a3
{
  __SecTask *v3;
  __SecTask *v4;
  CFStringRef v5;
  __CFString *v6;
  os_log_t v7;
  NSObject *v8;
  os_log_t v9;
  NSObject *v10;
  os_log_t v12;
  NSObject *v13;
  audit_token_t cf;
  audit_token_t v15;

  memset(&v15, 0, sizeof(v15));
  xpc_connection_get_audit_token(a3, &v15);
  cf = v15;
  v3 = SecTaskCreateWithAuditToken(0, &cf);
  if (v3)
  {
    v4 = v3;
    *(_QWORD *)cf.val = 0;
    v5 = SecTaskCopySigningIdentifier(v3, (CFErrorRef *)&cf);
    v6 = (__CFString *)v5;
    if (*(_QWORD *)cf.val)
    {
      v7 = sub_1000681B8("XPC");
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10016DE68();

      CFRelease(*(CFTypeRef *)cf.val);
      if (!v6)
        goto LABEL_15;
      CFRelease(v6);
    }
    else
    {
      if (v5)
      {
LABEL_15:
        CFRelease(v4);
        return v6;
      }
      v12 = sub_1000681B8("XPC");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10016DE3C();

    }
    v6 = 0;
    goto LABEL_15;
  }
  v9 = sub_1000681B8("XPC");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10016DE10();

  return 0;
}

- (void)dealloc
{
  os_log_t v3;
  NSObject *v4;
  OS_xpc_object *xpcServer;
  void *v6;
  void *v7;
  int axHeadTrackingChangedNotifyToken;
  objc_super v9;
  uint8_t buf[16];

  v3 = sub_1000681B8("XPC");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dealloc called", buf, 2u);
  }

  xpcServer = self->_xpcServer;
  if (xpcServer)
  {
    self->_xpcServer = 0;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection"));

  if (v6)
    -[CloudXPCService setServerConnection:](self, "setServerConnection:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService networkMonitor](self, "networkMonitor"));
  objc_msgSend(v7, "stopMonitoring");

  axHeadTrackingChangedNotifyToken = self->_axHeadTrackingChangedNotifyToken;
  if (axHeadTrackingChangedNotifyToken != -1)
  {
    notify_cancel(axHeadTrackingChangedNotifyToken);
    self->_axHeadTrackingChangedNotifyToken = -1;
  }
  -[CloudXPCService setNetworkMonitor:](self, "setNetworkMonitor:", 0);
  v9.receiver = self;
  v9.super_class = (Class)CloudXPCService;
  -[CloudXPCService dealloc](&v9, "dealloc");
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  OS_dispatch_source *sigTermSource;
  NSObject *v11;
  OS_dispatch_source *v12;
  os_log_t v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection"));
    objc_msgSend(v9, "sendMsg:args:", v6, v7);

    sigTermSource = self->_sigTermSource;
    if (sigTermSource)
    {
      v11 = sigTermSource;
      dispatch_source_cancel(v11);
      v12 = self->_sigTermSource;
      self->_sigTermSource = 0;

    }
  }
  else
  {
    v13 = sub_1000681B8("XPC");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to Send message: %@, args: %@", (uint8_t *)&v15, 0x16u);
    }

  }
}

- (void)establishBluetoothdXPCWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007C37C;
  v4[3] = &unk_1001E1FF8;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)sendCloudKitMsg:(id)a3 argsObject:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007C6BC;
  v10[3] = &unk_1001E4D68;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[CloudXPCService establishBluetoothdXPCWithCompletion:](self, "establishBluetoothdXPCWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)sendCloudKitMsg:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  CloudXPCService *v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007C93C;
  v10[3] = &unk_1001E4D90;
  objc_copyWeak(&v14, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  v13 = self;
  -[CloudXPCService establishBluetoothdXPCWithCompletion:](self, "establishBluetoothdXPCWithCompletion:", v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)sendCloudKitMsg:(id)a3 args:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007CC9C;
  v14[3] = &unk_1001E4DE0;
  objc_copyWeak(&v18, &location);
  v11 = v8;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v13 = v10;
  v17 = v13;
  -[CloudXPCService establishBluetoothdXPCWithCompletion:](self, "establishBluetoothdXPCWithCompletion:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)sendCloudKitMsgSync:(id)a3 args:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007D31C;
  v14[3] = &unk_1001E4DE0;
  objc_copyWeak(&v18, &location);
  v11 = v8;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v13 = v10;
  v17 = v13;
  -[CloudXPCService establishBluetoothdXPCWithCompletion:](self, "establishBluetoothdXPCWithCompletion:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)handleEvent:(id)a3
{
  id v4;
  xpc_type_t type;
  xpc_type_t v6;
  os_log_t v7;
  NSObject *v8;
  _BOOL4 v9;

  v4 = a3;
  type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    -[CloudXPCService handleConnection:](self, "handleConnection:", v4);
  }
  else
  {
    v6 = type;
    v7 = sub_1000681B8("XPC");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6 == (xpc_type_t)&_xpc_type_error)
    {
      if (v9)
        sub_10016E238();
    }
    else if (v9)
    {
      sub_10016E298();
    }

  }
}

- (void)handleConnection:(id)a3
{
  id v4;
  BTXPCConnection *v5;
  BTXPCConnection *v6;
  void *v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  BTXPCConnection *v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  int v18;
  BTXPCConnection *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  BTXPCConnection *v23;

  v4 = a3;
  v5 = -[BTXPCConnection initWithConnection:]([BTXPCConnection alloc], "initWithConnection:", v4);
  v6 = (BTXPCConnection *)xpc_connection_copy_entitlement_value(v4, "com.apple.bluetooth.internal");
  v7 = (void *)xpc_connection_copy_entitlement_value(v4, "com.apple.bluetooth.user.services");

  v8 = sub_1000681B8("XPC");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412802;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Check entitlement: %@:%@:[%@]", (uint8_t *)&v18, 0x20u);
  }

  if (v6
    && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_BOOL
    && v6 == (BTXPCConnection *)&_xpc_BOOL_true
    && v7
    && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_BOOL
    && v7 == &_xpc_BOOL_true
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection")),
        v10,
        !v10))
  {
    v16 = sub_1000681B8("XPC");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Connected to bluetoothd: %@", (uint8_t *)&v18, 0xCu);
    }

    -[CloudXPCService setServerConnection:](self, "setServerConnection:", v5);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection"));

    if (v11)
    {
      v12 = sub_1000681B8("XPC");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (BTXPCConnection *)objc_claimAutoreleasedReturnValue(-[CloudXPCService serverConnection](self, "serverConnection"));
        v18 = 138412290;
        v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Already connected to bluetoothd: %@", (uint8_t *)&v18, 0xCu);

      }
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService clients](self, "clients"));
  objc_msgSend(v15, "addObject:", v5);

}

- (void)devicesRemovedWithRecords:(id)a3
{
  id v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = sub_1000681B8("XPC");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "devicesRemovedWithDevices: %@", buf, 0xCu);
  }

  v12 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v12));
  v9 = v12;
  if (v9)
  {
    v10 = sub_1000681B8("XPC");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10016E2F8();
  }
  else
  {
    v13 = CFSTR("devices");
    v14 = v8;
    v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("DevicesRemovedWithRecords"), v11);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)devicesUpdatedWithRecords:(id)a3
{
  id v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = sub_1000681B8("XPC");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "devicesUpdatedWithDevices: %@", buf, 0xCu);
  }

  v12 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v12));
  v9 = v12;
  if (v9)
  {
    v10 = sub_1000681B8("XPC");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10016E358();
  }
  else
  {
    v13 = CFSTR("devices");
    v14 = v8;
    v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("DevicesUpdatedWithRecords"), v11);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)allDevicesRemovedWithRecords:(id)a3
{
  id v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = sub_1000681B8("XPC");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "allDevicesRemoved: %@", buf, 0xCu);
  }

  v12 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v12));
  v9 = v12;
  if (v9)
  {
    v10 = sub_1000681B8("XPC");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10016E3B8();
  }
  else
  {
    v13 = CFSTR("devices");
    v14 = v8;
    v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("AllDevicesRemovedWithRecords"), v11);
  }

  objc_autoreleasePoolPop(v5);
}

- (id)_legacyNicknameMessage:(id)a3 withNewFormatDevices:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  CloudXPCService *v21;
  id v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const __CFString *v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];

  v21 = self;
  v22 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v31[0] = CFSTR("bluetoothAddress");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bluetoothAddress", v21));
        v31[1] = CFSTR("nickname");
        v32[0] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nickname"));
        v32[1] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
        objc_msgSend(v6, "addObject:", v14);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v8);
  }

  v24 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v6, 0, &v24));
  v16 = v24;
  if (v16)
  {
    v17 = sub_1000681B8("XPC");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v22;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10016E418();
  }
  else
  {
    v29 = CFSTR("devices");
    v30 = v15;
    v18 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v19 = v22;
    -[CloudXPCService sendCloudKitMsg:args:](v21, "sendCloudKitMsg:args:", v22, v18);
  }

  return v15;
}

- (void)accountStatusUpdateWithAvailable:(BOOL)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  os_log_t v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;

  v4 = a4;
  v5 = a3;
  v7 = sub_1000681B8("XPC");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v4;
    v10 = 1024;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Force(%d) Account status changed: %d", (uint8_t *)v9, 0xEu);
  }

  -[CloudXPCService accountStatusAvailable:force:](self, "accountStatusAvailable:force:", v5, v4);
}

- (void)allDeviceSupportInformationRecordsRemovedWithRecords:(id)a3
{
  id v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = sub_1000681B8("XPC");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "allDeviceSupportInformationRecordsRemovedWithRecords: %{private}@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0));
  v9 = (void *)v8;
  if (v8)
  {
    v11 = CFSTR("records");
    v12 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("AllDeviceSupportInformationRecordsRemoved"), v10);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)allMagicPairingRecordsRemovedWithRecords:(id)a3
{
  id v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = sub_1000681B8("XPC");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "allMagicPairingRecordsRemovedWithRecords: %{private}@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0));
  v9 = (void *)v8;
  if (v8)
  {
    v11 = CFSTR("records");
    v12 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("AllMagicPairingRecordsRemoved"), v10);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)deviceSupportInformationRecordsRemovedWithRecords:(id)a3
{
  id v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = sub_1000681B8("XPC");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "deviceSupportInformationRecordsRemovedWithRecords: %{private}@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0));
  v9 = (void *)v8;
  if (v8)
  {
    v11 = CFSTR("records");
    v12 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("DeviceSupportInformationRecordsRemoved"), v10);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)deviceSupportInformationRecordsUpdatedWithRecords:(id)a3
{
  id v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = sub_1000681B8("XPC");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "deviceSupportInformationRecordsUpdatedWithRecords: %{private}@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0));
  v9 = (void *)v8;
  if (v8)
  {
    v11 = CFSTR("records");
    v12 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("DeviceSupportInformationRecordsUpdated"), v10);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)magicPairingRecordsRemovedWithRecords:(id)a3
{
  id v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = sub_1000681B8("XPC");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "magicPairingRecordsRemovedWithRecords: %{private}@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0));
  v9 = (void *)v8;
  if (v8)
  {
    v11 = CFSTR("records");
    v12 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("MagicPairingRecordsRemoved"), v10);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)magicPairingRecordsUpdatedWithRecords:(id)a3
{
  __objc2_class **p_superclass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  unsigned __int8 v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CloudXPCService *v25;
  int v26;
  void *v27;
  id v28;
  os_log_t v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  int v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __objc2_class **v50;
  void *v51;
  void *v52;
  unsigned __int8 v53;
  int v54;
  void *v55;
  const __CFString *v56;
  uint64_t v57;
  uint8_t buf[4];
  id v59;

  v9 = a3;
  v55 = objc_autoreleasePoolPush();
  v10 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
  if ((v10 & 1) != 0)
  {
    v54 = 0;
  }
  else
  {
    p_superclass = &OBJC_METACLASS___BTSmartRoutingWxDevice.superclass;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "pauseErrorReason"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if (objc_msgSend(v4, "isEqualToString:", CKErrorDomain))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pauseErrorReason"));
      if (objc_msgSend(v7, "code") == (id)26)
      {

        v11 = 1;
LABEL_42:

        goto LABEL_43;
      }
      v54 = 1;
    }
    else
    {
      v54 = 0;
    }
  }
  v53 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
  if ((v53 & 1) != 0)
  {
    v52 = v7;
    v12 = 0;
  }
  else
  {
    p_superclass = &OBJC_METACLASS___BTSmartRoutingWxDevice.superclass;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "pauseErrorReason"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "domain"));
    if (objc_msgSend(v47, "isEqualToString:", CKErrorDomain))
    {
      p_superclass = (__objc2_class **)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass, "pauseErrorReason"));
      if (objc_msgSend(v13, "code") == (id)11)
      {

        v11 = 1;
        goto LABEL_39;
      }
      v39 = v13;
      v52 = v7;
      v12 = 1;
    }
    else
    {
      v52 = v7;
      v12 = 0;
    }
  }
  v14 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
  v50 = p_superclass;
  if (v14
    && (v46 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance")),
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "pauseErrorReason")),
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "domain")),
        objc_msgSend(v44, "isEqualToString:", CKErrorDomain)))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pauseErrorReason"));
    if (objc_msgSend(v16, "code") == (id)11)
    {

      v11 = 1;
      v17 = v51;
      if ((v12 & 1) == 0)
        goto LABEL_35;
LABEL_34:

      goto LABEL_35;
    }
    if (!-[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded"))
    {

      v11 = 0;
      v17 = v51;
      goto LABEL_33;
    }
    v36 = v16;
    v37 = v15;
    v19 = 1;
  }
  else
  {
    v18 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
    v19 = 0;
    v11 = 0;
    if ((v18 & 1) == 0)
      goto LABEL_23;
  }
  v40 = v19;
  v41 = v6;
  v42 = v10;
  v43 = v4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pauseErrorReason"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "domain"));
  if (!objc_msgSend(v22, "isEqualToString:", CKErrorDomain))
  {

    v11 = 0;
    if (!v40)
      goto LABEL_22;
LABEL_26:

    v4 = v43;
    v10 = v42;
    v6 = v41;
    v17 = v51;
    if ((v14 & 1) != 0)
      goto LABEL_33;
    goto LABEL_27;
  }
  v38 = v9;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
  v24 = v5;
  v25 = self;
  v26 = v12;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "pauseErrorReason"));
  v11 = objc_msgSend(v27, "code") == (id)26;

  v12 = v26;
  self = v25;
  v5 = v24;

  v9 = v38;
  if ((v40 & 1) != 0)
    goto LABEL_26;
LABEL_22:
  v4 = v43;
  v10 = v42;
  v6 = v41;
LABEL_23:
  v17 = v51;
  if (v14)
  {
LABEL_33:

    if ((v12 & 1) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_27:
  if (v12)
    goto LABEL_34;
LABEL_35:
  v7 = v52;
  if ((v53 & 1) == 0)
  {

LABEL_39:
    if ((v54 & 1) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
  if (v54)
  {
LABEL_40:

  }
LABEL_41:
  if ((v10 & 1) == 0)
    goto LABEL_42;
LABEL_43:
  v28 = objc_msgSend(v9, "count");
  v29 = sub_1000681B8("MagicPairing");
  v30 = objc_claimAutoreleasedReturnValue(v29);
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (!v28 && v11)
  {
    if (v31)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Inform bluetoothd again no data on cloud", buf, 2u);
    }

    *(_WORD *)buf = 0;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 2));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v33, CFSTR("kDeviceInfoBlob"), 0));
    objc_msgSend(v32, "sendCloudKitMsg:args:", CFSTR("DeviceInfoAvailable"), v34);

    goto LABEL_52;
  }
  if (v31)
  {
    *(_DWORD *)buf = 138477827;
    v59 = v9;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "magicPairingRecordsUpdatedWithRecords: %{private}@", buf, 0xCu);
  }

  v35 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0));
  v32 = (void *)v35;
  if (v35)
  {
    v56 = CFSTR("records");
    v57 = v35;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
    -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("MagicPairingRecordsUpdated"), v33);
LABEL_52:

  }
  objc_autoreleasePoolPop(v55);

}

- (void)allLegacyMagicPairingRecordsWithRecordsData:(id)a3
{
  id v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  id v9;

  v3 = a3;
  v4 = sub_1000681B8("MagicPairing");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Inform bluetoothd with cloud data: %@", buf, 0xCu);
  }

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v3, CFSTR("kDeviceInfoBlob"), 0));
    objc_msgSend(v6, "sendCloudKitMsg:args:", CFSTR("DeviceInfoAvailable"), v7);

  }
}

- (void)accountStatusAvailable:(BOOL)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  BOOL v22;
  const __CFString *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  _QWORD v28[2];

  v4 = a4;
  v5 = a3;
  v7 = sub_1000681B8("XPC");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v28[0]) = v5;
    WORD2(v28[0]) = 1024;
    *(_DWORD *)((char *)v28 + 6) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Account status changed: %d, Forced: %d", buf, 0xEu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007F30C;
  v21[3] = &unk_1001E4E20;
  v22 = v5;
  objc_msgSend(v9, "fetchAccountMagicKeysBlobWithCompletion:", v21);

  v10 = -[CloudXPCService accountAvailable](self, "accountAvailable") ^ v5;
  if (v4 || v10)
  {
    -[CloudXPCService setAccountAvailable:](self, "setAccountAvailable:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cloudAccountInfo"));

    if (v12)
    {
      v13 = sub_1000681B8("XPC");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v28[0] = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cloud Account Info: %{private}@", buf, 0xCu);
      }

      v25[0] = CFSTR("kSignInStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CloudXPCService accountAvailable](self, "accountAvailable")));
      v25[1] = CFSTR("kSignInAppleID");
      v26[0] = v15;
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "loginID"));
      v17 = (void *)v16;
      v18 = &stru_1001ED4C0;
      if (v16)
        v18 = (const __CFString *)v16;
      v26[1] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
      -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("SignInStatusChanged"), v19);

    }
    else
    {
      v23 = CFSTR("kSignInStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CloudXPCService accountAvailable](self, "accountAvailable")));
      v24 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      -[CloudXPCService sendCloudKitMsg:args:](self, "sendCloudKitMsg:args:", CFSTR("SignInStatusChanged"), v17);
    }

    if (v10 && v5)
    {
      if (-[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded"))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance"));
        objc_msgSend(v20, "markLegacyNonManateeContainerMigrated");

      }
    }

  }
}

- (void)removeConnection:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = sub_1000681B8("XPC");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remove connection: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService clients](self, "clients"));
  objc_msgSend(v7, "removeObject:", v4);

}

- (BOOL)manateeZoneUpgraded
{
  void *v2;
  os_log_t v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService readUserPreference:](self, "readUserPreference:", CFSTR("MagicCloudPairingManateeUpgradedAccount")));

  if (v2)
  {
    v3 = sub_1000681B8("MagicPairing");
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: Master zone has been upgraded. Dont generate keys", v6, 2u);
    }

  }
  return v2 != 0;
}

- (id)readUserPreference:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (void)handleConnection:(id)a3 XPCMessage:(id)a4 userID:(unsigned int)a5 processID:(int)a6
{
  id v8;
  id v9;
  xpc_type_t type;
  os_log_t v11;
  NSObject *v12;
  const char *string;
  os_log_t v14;
  NSObject *v15;
  NSObject *v16;
  xpc_object_t value;
  NSObject *v18;
  uint64_t v19;
  id v20;
  int v21;
  id v22;
  int v23;
  id v24;
  int v25;
  id v26;
  int v27;
  id v28;
  int v29;
  char *v30;
  os_log_t v31;
  NSObject *v32;
  os_log_t v33;
  NSObject *v34;
  __objc2_class *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  unsigned __int8 v40;
  os_log_t v41;
  NSObject *v42;
  _BOOL4 v43;
  __objc2_class **v44;
  unsigned __int8 v45;
  os_log_t v46;
  NSObject *v47;
  _BOOL4 v48;
  __objc2_class *v49;
  void *v50;
  unsigned __int8 v51;
  xpc_object_t v52;
  void *v53;
  NSData *v54;
  void *v55;
  os_log_t v56;
  NSObject *v57;
  __objc2_class *v58;
  unsigned __int8 v59;
  xpc_object_t v60;
  uint64_t v61;
  char *v62;
  size_t length;
  size_t bytes;
  NSData *v65;
  void *v66;
  os_log_t v67;
  NSObject *v68;
  __objc2_class *v69;
  unsigned __int8 v70;
  os_log_t v71;
  NSObject *v72;
  _BOOL4 v73;
  __objc2_class *v74;
  NSData *v75;
  os_log_t v76;
  NSObject *v77;
  NSObject *v78;
  os_log_t v79;
  NSData *v80;
  os_log_t v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  os_log_t v89;
  NSObject *v90;
  NSObject *v91;
  uint64_t v92;
  void *v93;
  os_log_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  os_log_t v100;
  NSObject *v101;
  void *v102;
  os_log_t v103;
  NSObject *v104;
  uint64_t v105;
  void *v106;
  unsigned int v107;
  void *v108;
  void *v109;
  os_log_t v110;
  NSObject *v111;
  uint64_t v112;
  os_log_t v113;
  void *v114;
  void *v115;
  void *v116;
  os_log_t v117;
  NSObject *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  os_log_t v128;
  NSObject *v129;
  _UNKNOWN **v130;
  os_log_t v131;
  NSObject *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  void *v137;
  os_log_t v138;
  NSObject *v139;
  os_log_t v140;
  NSObject *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  os_log_t v152;
  NSObject *v153;
  void *v154;
  void *v155;
  _UNKNOWN **v156;
  os_log_t v157;
  NSObject *v158;
  uint64_t v159;
  _QWORD v160[4];
  id v161;
  _QWORD v162[4];
  id v163;
  _QWORD v164[4];
  id v165;
  _QWORD v166[4];
  id v167;
  _QWORD v168[4];
  id v169;
  _QWORD v170[4];
  id v171;
  _QWORD v172[5];
  _QWORD v173[5];
  _QWORD v174[5];
  const __CFString *v175;
  uint64_t v176;
  uint8_t v177[4];
  void *v178;
  __int16 v179;
  void *v180;
  _OWORD buf[2];

  v8 = a3;
  v9 = a4;
  type = xpc_get_type(v9);
  v11 = sub_1000681B8("XPC");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received _handleXPCMessage", (uint8_t *)buf, 2u);
  }

  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v9, "kMsgId");
    v14 = sub_1000681B8("XPC");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (!string)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_10016E484();
      goto LABEL_56;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 136315138;
      *(_QWORD *)((char *)buf + 4) = string;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "received msg: %s", (uint8_t *)buf, 0xCu);
    }

    value = xpc_dictionary_get_value(v9, "kMsgArgs");
    v18 = objc_claimAutoreleasedReturnValue(value);
    v16 = v18;
    if (v18)
      xpc_get_type(v18);
    if (!strcmp(string, "MasterKeysAvailable"))
      goto LABEL_56;
    if (!strcmp(string, "Start"))
    {
      v33 = sub_1000681B8("XPC");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Received Start", (uint8_t *)buf, 2u);
      }

      if (-[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded"))
        v35 = MPCloudKit_Manatee;
      else
        v35 = MPCloudKit;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](v35, "sharedInstance"));
      objc_msgSend(v36, "getAccountStatus");
      goto LABEL_49;
    }
    if (!strcmp(string, "DeviceInfoAvailable") || !strcmp(string, "OnlineStatusChanged"))
      goto LABEL_56;
    if (!strcmp(string, "SignInStatusChanged"))
    {
      -[CloudXPCService beginTransaction:](self, "beginTransaction:", CFSTR("SignInStatusChanged"));
      if (-[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded"))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
        v38 = v37;
        v173[0] = _NSConcreteStackBlock;
        v173[1] = 3221225472;
        v173[2] = sub_100080EB4;
        v173[3] = &unk_1001E4E48;
        v173[4] = self;
        v39 = v173;
      }
      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance"));
        v38 = v37;
        v174[0] = _NSConcreteStackBlock;
        v174[1] = 3221225472;
        v174[2] = sub_100080E24;
        v174[3] = &unk_1001E4E48;
        v174[4] = self;
        v39 = v174;
      }
      objc_msgSend(v37, "fetchAccountStatusWithCompletion:", v39);
      goto LABEL_55;
    }
    if (!strcmp(string, "getMasterKey"))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
      v172[0] = _NSConcreteStackBlock;
      v172[1] = 3221225472;
      v172[2] = sub_100080F5C;
      v172[3] = &unk_1001E4E70;
      v172[4] = self;
      objc_msgSend(v38, "fetchAccountMagicKeysBlobWithCompletion:", v172);
      goto LABEL_55;
    }
    if (!strcmp(string, "getAccessoryKey"))
    {
      v40 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
      v41 = sub_1000681B8("XPC");
      v42 = objc_claimAutoreleasedReturnValue(v41);
      v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
      if ((v40 & 1) != 0)
      {
        if (v43)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Manatee getAccessoryKey", (uint8_t *)buf, 2u);
        }
        v44 = &off_1001E13B8;
      }
      else
      {
        if (v43)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "getAccessoryKey", (uint8_t *)buf, 2u);
        }
        v44 = off_1001E13B0;
      }

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v44, "sharedInstance"));
      objc_msgSend(v50, "fetchAccessoryKeyBlob:", 0);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
      objc_msgSend(v36, "fetchCached");
      goto LABEL_49;
    }
    if (!strcmp(string, "getSignInStatus"))
    {
      v45 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
      v46 = sub_1000681B8("XPC");
      v47 = objc_claimAutoreleasedReturnValue(v46);
      v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
      if ((v45 & 1) != 0)
      {
        if (v48)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Manatee getSignInStatus", (uint8_t *)buf, 2u);
        }

        v49 = MPCloudKit_Manatee;
      }
      else
      {
        if (v48)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "getSignInStatus", (uint8_t *)buf, 2u);
        }

        v49 = MPCloudKit;
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](v49, "sharedInstance"));
      objc_msgSend(v36, "forceAccountStatus");
      goto LABEL_49;
    }
    if (!strcmp(string, "getOnlineStatus"))
    {
LABEL_56:

      goto LABEL_57;
    }
    if (strcmp(string, "writeMasterKey"))
    {
      if (strcmp(string, "writeAccessoryKey"))
      {
        if (!strcmp(string, "deleteAllAccessories"))
        {
          v70 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
          v71 = sub_1000681B8("XPC");
          v72 = objc_claimAutoreleasedReturnValue(v71);
          v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
          if ((v70 & 1) != 0)
          {
            if (v73)
            {
              LOWORD(buf[0]) = 0;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Manatee deleteAllAccessories", (uint8_t *)buf, 2u);
            }

            v74 = MPCloudKit_Manatee;
          }
          else
          {
            if (v73)
            {
              LOWORD(buf[0]) = 0;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "deleteAllAccessories", (uint8_t *)buf, 2u);
            }

            v74 = MPCloudKit;
          }
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](v74, "sharedInstance"));
          objc_msgSend(v36, "updateCloudKitAccessoryZone:delete:", 0, 1);
          goto LABEL_49;
        }
        if (!strcmp(string, "checkIn"))
        {
          if (!v16)
            goto LABEL_56;
          v36 = (void *)_CFXPCCreateCFObjectFromXPCMessage(v16);
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("kCheckInVersion")));
          v79 = sub_1000681B8("XPC");
          v78 = objc_claimAutoreleasedReturnValue(v79);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf[0]) = 138412290;
            *(_QWORD *)((char *)buf + 4) = v55;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "received checkIn message version: %@", (uint8_t *)buf, 0xCu);
          }
        }
        else
        {
          if (!strcmp(string, "manateeZoneAvailabe"))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
            objc_msgSend(v36, "manateeZoneAvailable");
            goto LABEL_49;
          }
          if (!strcmp(string, "deleteOldContainer"))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance"));
            objc_msgSend(v36, "markLegacyNonManateeContainerMigrated");
            goto LABEL_49;
          }
          v19 = strcmp(string, "nukeOldContainer");
          if (!(_DWORD)v19 && IsAppleInternalBuild(v19) || !strcmp(string, "resetOldContainer"))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance"));
            objc_msgSend(v36, "resetOldZones");
            goto LABEL_49;
          }
          if (!strcmp(string, "upgradeToManatee"))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance"));
            objc_msgSend(v36, "upgradeLegacyNonManateeContainerToManatee");
            goto LABEL_49;
          }
          if (!strcmp(string, "CachedLocalIDSIdentifiers"))
          {
            if (v16)
            {
              v84 = objc_autoreleasePoolPush();
              v85 = (void *)_CFXPCCreateCFObjectFromXPCMessage(v16);
              v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKey:", CFSTR("kIDSIdentifiers")));
              if (v85
                && (v87 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v85, v87) & 1) != 0)
                && v86
                && (v88 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v86, v88) & 1) != 0))
              {
                v89 = sub_1000681B8("XPC");
                v90 = objc_claimAutoreleasedReturnValue(v89);
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf[0]) = 138412290;
                  *(_QWORD *)((char *)buf + 4) = v85;
                  _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Update CachedLocalIDSIdentifiers: %@", (uint8_t *)buf, 0xCu);
                }

                v91 = objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
                -[NSObject xpcUpdateCloudPairings:](v91, "xpcUpdateCloudPairings:", v86);
              }
              else
              {
                v94 = sub_1000681B8("XPC");
                v91 = objc_claimAutoreleasedReturnValue(v94);
                if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                  sub_10016E4BC();
              }

              objc_autoreleasePoolPop(v84);
            }
            goto LABEL_56;
          }
          if (strcmp(string, "cloudpairingRetry"))
          {
            if (!strcmp(string, "sendCloudKitPush"))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
              objc_msgSend(v36, "sendCloudKitPush");
              goto LABEL_49;
            }
            if (!strcmp(string, "printDebug"))
            {
              v95 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
              v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "deviceManager"));
              v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "printDebug"));
              v98 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
              v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "statedumpAndRecordDailyMetric"));
              v159 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v97, v99));

              v100 = sub_1000681B8("XPC");
              v101 = objc_claimAutoreleasedReturnValue(v100);
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf[0]) = 138412290;
                *(_QWORD *)((char *)buf + 4) = v159;
                _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Statedump:\n%@", (uint8_t *)buf, 0xCu);
              }

              if (v159)
              {
                v175 = CFSTR("printDebug");
                v176 = v159;
                v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1));
                sub_10008112C(v9, v102);

              }
              else
              {
                sub_10008112C(v9, &off_1001F42A0);
              }
              v116 = (void *)v159;
              goto LABEL_155;
            }
            if (!strcmp(string, "nukeCloud"))
            {
              v103 = sub_1000681B8("XPC");
              v104 = objc_claimAutoreleasedReturnValue(v103);
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf[0]) = 0;
                _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "nuking cloud", (uint8_t *)buf, 2u);
              }

              v38 = (void *)_CFXPCCreateCFObjectFromXPCObject(v16);
              v105 = objc_opt_class(NSDictionary);
              if ((objc_opt_isKindOfClass(v38, v105) & 1) != 0)
              {
                v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("nuke")));
                v107 = objc_msgSend(v106, "isEqualToString:", CFSTR("nukeMe"));

                if (v107)
                {
                  v108 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit sharedInstance](MPCloudKit, "sharedInstance"));
                  objc_msgSend(v108, "resetOldZones");

                  v109 = (void *)objc_claimAutoreleasedReturnValue(-[CloudXPCService deviceManager](self, "deviceManager"));
                  v170[0] = _NSConcreteStackBlock;
                  v170[1] = 3221225472;
                  v170[2] = sub_1000811C8;
                  v170[3] = &unk_1001E2110;
                  v171 = v9;
                  objc_msgSend(v109, "resetCloudDataWithCompletion:", v170);

                }
              }
              goto LABEL_55;
            }
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[XPCMessages fetchDeviceList](_TtC15audioaccessoryd11XPCMessages, "fetchDeviceList")));
            v21 = strcmp(string, (const char *)objc_msgSend(v20, "UTF8String"));

            if (!v21)
            {
              v114 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
              v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "deviceManager"));
              v168[0] = _NSConcreteStackBlock;
              v168[1] = 3221225472;
              v168[2] = sub_1000812D0;
              v168[3] = &unk_1001E4E98;
              v169 = v9;
              objc_msgSend(v115, "fetchDeviceRecordsWithCompletion:", v168);

              v116 = v169;
              goto LABEL_155;
            }
            v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[XPCMessages nicknameDevice](_TtC15audioaccessoryd11XPCMessages, "nicknameDevice")));
            v23 = strcmp(string, (const char *)objc_msgSend(v22, "UTF8String"));

            if (v23)
            {
              v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[XPCMessages removeDeviceNickname](_TtC15audioaccessoryd11XPCMessages, "removeDeviceNickname")));
              v25 = strcmp(string, (const char *)objc_msgSend(v24, "UTF8String"));

              if (v25)
              {
                v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[XPCMessages resetCachedData](_TtC15audioaccessoryd11XPCMessages, "resetCachedData")));
                v27 = strcmp(string, (const char *)objc_msgSend(v26, "UTF8String"));

                if (v27)
                {
                  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[XPCMessages fetchNicknameDevice](_TtC15audioaccessoryd11XPCMessages, "fetchNicknameDevice")));
                  v29 = strcmp(string, (const char *)objc_msgSend(v28, "UTF8String"));

                  if (v29)
                  {
                    if (!strcmp(string, "headTrackingAvailable"))
                    {
                      -[CloudXPCService axHeadTrackingSettingChanged](self, "axHeadTrackingSettingChanged");
                    }
                    else
                    {
                      v30 = xpc_copy_description(v9);
                      v31 = sub_1000681B8("XPC");
                      v32 = objc_claimAutoreleasedReturnValue(v31);
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                      {
                        LODWORD(buf[0]) = 136315138;
                        *(_QWORD *)((char *)buf + 4) = v30;
                        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Ignoring unhandled incoming XPC message: %s", (uint8_t *)buf, 0xCu);
                      }

                      free(v30);
                    }
                    goto LABEL_56;
                  }
                  v36 = (void *)_CFXPCCreateCFObjectFromXPCObject(v16);
                  if (v36)
                  {
                    v144 = objc_opt_class(NSDictionary);
                    if ((objc_opt_isKindOfClass(v36, v144) & 1) != 0)
                    {
                      v145 = (void *)objc_claimAutoreleasedReturnValue(+[XPCArguments CloudDeviceAddress](_TtC15audioaccessoryd12XPCArguments, "CloudDeviceAddress"));
                      v146 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v145));
                      if (v146)
                      {
                        v147 = (void *)v146;
                        v148 = (void *)objc_claimAutoreleasedReturnValue(+[XPCArguments CloudDeviceAddress](_TtC15audioaccessoryd12XPCArguments, "CloudDeviceAddress"));
                        v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v148));
                        v150 = objc_opt_class(NSString);
                        LODWORD(v159) = objc_opt_isKindOfClass(v149, v150);

                        if ((v159 & 1) != 0)
                        {
                          v151 = (void *)objc_claimAutoreleasedReturnValue(+[XPCArguments CloudDeviceAddress](_TtC15audioaccessoryd12XPCArguments, "CloudDeviceAddress"));
                          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v151));

                          v152 = sub_1000681B8("XPC");
                          v153 = objc_claimAutoreleasedReturnValue(v152);
                          if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
                          {
                            LODWORD(buf[0]) = 138412290;
                            *(_QWORD *)((char *)buf + 4) = v55;
                            _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_DEFAULT, "Fetch Cloud Data for device: %@", (uint8_t *)buf, 0xCu);
                          }

                          v154 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
                          v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "deviceManager"));
                          v160[0] = _NSConcreteStackBlock;
                          v160[1] = 3221225472;
                          v160[2] = sub_10008163C;
                          v160[3] = &unk_1001E4EC0;
                          v161 = v9;
                          objc_msgSend(v155, "fetchDeviceWithAddress:completion:", v55, v160);

                          goto LABEL_102;
                        }
                      }
                      else
                      {

                      }
                    }
                  }
                  v157 = sub_1000681B8("XPC");
                  v158 = objc_claimAutoreleasedReturnValue(v157);
                  if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
                    sub_10016E630();

                  sub_10008112C(v9, &__NSDictionary0__struct);
                  goto LABEL_49;
                }
                v140 = sub_1000681B8("XPC");
                v141 = objc_claimAutoreleasedReturnValue(v140);
                if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf[0]) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "Reset Cached Data XPC message", (uint8_t *)buf, 2u);
                }

                v142 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
                v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "deviceManager"));
                v162[0] = _NSConcreteStackBlock;
                v162[1] = 3221225472;
                v162[2] = sub_100081560;
                v162[3] = &unk_1001E2110;
                v163 = v9;
                objc_msgSend(v143, "resetCachedDataWithCompletion:", v162);

                v116 = v163;
LABEL_155:

                goto LABEL_56;
              }
              v38 = (void *)_CFXPCCreateCFObjectFromXPCObject(v16);
              v131 = sub_1000681B8("XPC");
              v132 = objc_claimAutoreleasedReturnValue(v131);
              if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf[0]) = 138477827;
                *(_QWORD *)((char *)buf + 4) = v38;
                _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "Remove nickname device incoming XPC message: %{private}@", (uint8_t *)buf, 0xCu);
              }

              if (-[CloudXPCService accountAvailable](self, "accountAvailable"))
              {
                if (v38)
                {
                  v133 = objc_opt_class(NSDictionary);
                  if ((objc_opt_isKindOfClass(v38, v133) & 1) != 0)
                  {
                    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("bluetoothAddress")));
                    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("nickname")));
                    if (v120)
                    {
                      v134 = objc_opt_class(NSString);
                      if ((objc_opt_isKindOfClass(v120, v134) & 1) != 0)
                      {
                        if (v121)
                        {
                          v135 = objc_opt_class(NSString);
                          if ((objc_opt_isKindOfClass(v121, v135) & 1) != 0)
                          {
                            v124 = objc_msgSend(objc_alloc((Class)BTCloudDevice), "initWithBluetoothAddress:", v120);
                            objc_msgSend(v124, "setNickname:", v121);
                            v136 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
                            v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "deviceManager"));
                            v164[0] = _NSConcreteStackBlock;
                            v164[1] = 3221225472;
                            v164[2] = sub_100081484;
                            v164[3] = &unk_1001E2110;
                            v165 = v9;
                            objc_msgSend(v137, "removeDeviceWithRecord:completion:", v124, v164);

                            v127 = v165;
                            goto LABEL_179;
                          }
                        }
                      }
                    }
                    v156 = &off_1001F4408;
                    goto LABEL_197;
                  }
                }
              }
              v138 = sub_1000681B8("XPC");
              v139 = objc_claimAutoreleasedReturnValue(v138);
              if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
                sub_10016E5BC(self);

              v130 = &off_1001F4430;
            }
            else
            {
              v38 = (void *)_CFXPCCreateCFObjectFromXPCObject(v16);
              v117 = sub_1000681B8("XPC");
              v118 = objc_claimAutoreleasedReturnValue(v117);
              if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf[0]) = 138477827;
                *(_QWORD *)((char *)buf + 4) = v38;
                _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "Nickname device incoming XPC message: %{private}@", (uint8_t *)buf, 0xCu);
              }

              if (-[CloudXPCService accountAvailable](self, "accountAvailable"))
              {
                if (v38)
                {
                  v119 = objc_opt_class(NSDictionary);
                  if ((objc_opt_isKindOfClass(v38, v119) & 1) != 0)
                  {
                    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("bluetoothAddress")));
                    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("nickname")));
                    if (v120)
                    {
                      v122 = objc_opt_class(NSString);
                      if ((objc_opt_isKindOfClass(v120, v122) & 1) != 0)
                      {
                        if (v121)
                        {
                          v123 = objc_opt_class(NSString);
                          if ((objc_opt_isKindOfClass(v121, v123) & 1) != 0)
                          {
                            v124 = objc_msgSend(objc_alloc((Class)BTCloudDevice), "initWithBluetoothAddress:", v120);
                            objc_msgSend(v124, "setNickname:", v121);
                            v125 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
                            v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "deviceManager"));
                            v166[0] = _NSConcreteStackBlock;
                            v166[1] = 3221225472;
                            v166[2] = sub_1000813A8;
                            v166[3] = &unk_1001E2110;
                            v167 = v9;
                            objc_msgSend(v126, "addDeviceWithRecord:completion:", v124, v166);

                            v127 = v167;
LABEL_179:

LABEL_198:
                            goto LABEL_55;
                          }
                        }
                      }
                    }
                    v156 = &off_1001F4368;
LABEL_197:
                    sub_10008112C(v9, v156);
                    goto LABEL_198;
                  }
                }
              }
              v128 = sub_1000681B8("XPC");
              v129 = objc_claimAutoreleasedReturnValue(v128);
              if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                sub_10016E548(self);

              v130 = &off_1001F4390;
            }
            sub_10008112C(v9, v130);
LABEL_55:

            goto LABEL_56;
          }
          if (!v16)
            goto LABEL_56;
          memset(buf, 0, sizeof(buf));
          xpc_connection_get_audit_token(v8, buf);
          v92 = xpc_copy_code_signing_identity_for_token(buf);
          if (v92)
          {
            v93 = (void *)v92;
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v92));
            free(v93);
          }
          else
          {
            v36 = 0;
          }
          v55 = (void *)_CFXPCCreateCFObjectFromXPCObject(v16);
          v110 = sub_1000681B8("XPC");
          v111 = objc_claimAutoreleasedReturnValue(v110);
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v177 = 138412546;
            v178 = v36;
            v179 = 2112;
            v180 = v55;
            _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "cloudpairingRetry incoming (%@) XPC message: %@", v177, 0x16u);
          }

          if (v55 && (v112 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v55, v112) & 1) != 0))
          {
            v78 = objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](CBIDSManager, "sharedInstance"));
            -[NSObject sendRePairRequest:forBundleID:](v78, "sendRePairRequest:forBundleID:", v55, v36);
          }
          else
          {
            v113 = sub_1000681B8("XPC");
            v78 = objc_claimAutoreleasedReturnValue(v113);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              sub_10016E51C();
          }
        }
LABEL_101:

LABEL_102:
        goto LABEL_49;
      }
      if (!v16)
        goto LABEL_56;
      v59 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
      v60 = xpc_dictionary_get_value(v16, "kDeviceInfoBlob");
      v36 = (void *)objc_claimAutoreleasedReturnValue(v60);
      xpc_data_get_length(v36);
      __chkstk_darwin();
      v62 = (char *)&v160[-1] - v61;
      length = xpc_data_get_length(v36);
      bytes = xpc_data_get_bytes(v36, v62, 0, length);
      if ((v59 & 1) != 0)
      {
        if (!bytes)
          goto LABEL_49;
        v65 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v62, xpc_data_get_length(v36));
        v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
        v67 = sub_1000681B8("XPC");
        v68 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf[0]) = 138412290;
          *(_QWORD *)((char *)buf + 4) = v66;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Manatee Accessory blob %@", (uint8_t *)buf, 0xCu);
        }

        if (v66)
        {
          v69 = MPCloudKit_Manatee;
LABEL_108:
          v83 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](v69, "sharedInstance"));
          objc_msgSend(v83, "updateCloudKitAccessoryZone:delete:", v66, 0);

        }
      }
      else
      {
        if (!bytes)
          goto LABEL_49;
        v80 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v62, xpc_data_get_length(v36));
        v66 = (void *)objc_claimAutoreleasedReturnValue(v80);
        v81 = sub_1000681B8("XPC");
        v82 = objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf[0]) = 138412290;
          *(_QWORD *)((char *)buf + 4) = v66;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, " Accessory blob %@", (uint8_t *)buf, 0xCu);
        }

        if (v66)
        {
          v69 = MPCloudKit;
          goto LABEL_108;
        }
      }

      goto LABEL_49;
    }
    if (!v16)
      goto LABEL_56;
    v51 = -[CloudXPCService manateeZoneUpgraded](self, "manateeZoneUpgraded");
    v52 = xpc_dictionary_get_value(v16, "kMasterKeyBlob");
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    v36 = v53;
    if ((v51 & 1) != 0)
    {
      if (xpc_data_get_bytes(v53, buf, 0, 0x21uLL))
      {
        v54 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, xpc_data_get_length(v36));
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        v56 = sub_1000681B8("XPC");
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v177 = 138412290;
          v178 = v55;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Manatee Data blob %@", v177, 0xCu);
        }

        if (!v55)
          goto LABEL_102;
        v58 = MPCloudKit_Manatee;
        goto LABEL_97;
      }
    }
    else if (xpc_data_get_bytes(v53, buf, 0, 0x21uLL))
    {
      v75 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, xpc_data_get_length(v36));
      v55 = (void *)objc_claimAutoreleasedReturnValue(v75);
      v76 = sub_1000681B8("XPC");
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v177 = 138412290;
        v178 = v55;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, " Data blob %@", v177, 0xCu);
      }

      if (!v55)
        goto LABEL_102;
      v58 = MPCloudKit;
LABEL_97:
      v78 = objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](v58, "sharedInstance"));
      -[NSObject updateCloudKitBlobZone:](v78, "updateCloudKitBlobZone:", v55);
      goto LABEL_101;
    }
LABEL_49:

    goto LABEL_56;
  }
LABEL_57:

}

- (id)transactionIdentifierForActionIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.bluetooth.user.transaction"), a3);
}

- (void)beginTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CloudXPCService transactionQueue](self, "transactionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000818A4;
  block[3] = &unk_1001E23E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)endTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CloudXPCService transactionQueue](self, "transactionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100081B20;
  block[3] = &unk_1001E23E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcQueue, a3);
}

- (OS_xpc_object)xpcServer
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 40, 1);
}

- (void)setXpcServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BTXPCConnection)serverConnection
{
  return (BTXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServerConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_xpc_object)cloudKitConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCloudKitConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (_TtC15audioaccessoryd13DeviceManager)deviceManager
{
  return (_TtC15audioaccessoryd13DeviceManager *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDeviceManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BTNetworkMonitor)networkMonitor
{
  return (BTNetworkMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNetworkMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_queue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transactionQueue, a3);
}

- (NSMutableDictionary)activeTransactions
{
  return self->_activeTransactions;
}

- (void)setActiveTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransactions, a3);
}

- (NSUserDefaults)bluetoothDefaults
{
  return self->_bluetoothDefaults;
}

- (void)setBluetoothDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothDefaults, a3);
}

- (_TtC15audioaccessoryd16DefaultsObserver)bluetoothDefaultsObserver
{
  return self->_bluetoothDefaultsObserver;
}

- (void)setBluetoothDefaultsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothDefaultsObserver, a3);
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (BOOL)accountAvailable
{
  return self->_accountAvailable;
}

- (void)setAccountAvailable:(BOOL)a3
{
  self->_accountAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_bluetoothDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_bluetoothDefaults, 0);
  objc_storeStrong((id *)&self->_activeTransactions, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_cloudKitConnection, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_sigTermSource, 0);
}

@end
