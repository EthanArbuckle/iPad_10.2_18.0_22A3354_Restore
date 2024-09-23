@implementation RPConnectionManager

- (void)finishStartup
{
  -[NSXPCListener resume](self->_publicListener, "resume");
}

+ (RPConnectionManager)sharedInstance
{
  if (qword_100095C10 != -1)
    dispatch_once(&qword_100095C10, &stru_100081968);
  return (RPConnectionManager *)(id)qword_100095C08;
}

- (RPConnectionManager)init
{
  RPConnectionManager *v2;
  NSXPCListener *v3;
  NSXPCListener *publicListener;
  RPRecordingManager *v5;
  RPRecordingManager *recordingManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RPConnectionManager;
  v2 = -[RPConnectionManager init](&v8, "init");
  if (v2)
  {
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.replayd"));
    publicListener = v2->_publicListener;
    v2->_publicListener = v3;

    -[NSXPCListener setDelegate:](v2->_publicListener, "setDelegate:", v2);
    v5 = -[RPRecordingManager initWithConnectionManager:]([RPRecordingManager alloc], "initWithConnectionManager:", v2);
    recordingManager = v2->_recordingManager;
    v2->_recordingManager = v5;

  }
  return v2;
}

- (BOOL)hasSystemRecordingEntitlements
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.private.replay-kit")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)hasBroadcastEntitlements
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.private.replay-kit.can-setup-broadcast")));
  v5 = objc_msgSend(v4, "BOOLValue");

  LOBYTE(self) = v5 | -[RPConnectionManager hasSystemRecordingEntitlements](self, "hasSystemRecordingEntitlements");
  return (char)self;
}

+ (id)uniqueClientIdentifierWithPID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPID:](NSBundle, "bundleWithPID:"));
  v5 = v4;
  if (v4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier")), v6, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v7));

    if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "+[RPConnectionManager uniqueClientIdentifierWithPID:]";
      v14 = 1024;
      v15 = 125;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d using identifier from bundle", buf, 0x12u);
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle executablePathWithPID:](NSBundle, "executablePathWithPID:", v3));
    if (objc_msgSend(v9, "length"))
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v13 = "+[RPConnectionManager uniqueClientIdentifierWithPID:]";
        v14 = 1024;
        v15 = 133;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d using identifier from executablePath", buf, 0x12u);
      }
      v10 = v9;
    }
    else
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v13 = "+[RPConnectionManager uniqueClientIdentifierWithPID:]";
        v14 = 1024;
        v15 = 143;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d using identifier from processIdentifier", buf, 0x12u);
      }
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.replaykit.client-with-pid.%d"), v3));
    }
    v8 = v10;

  }
  return v8;
}

+ (BOOL)hasUnitTestEntitlement
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  unsigned __int8 v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  unsigned int v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPConnectionManager sharedInstance](RPConnectionManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.internal.test.replaykit")));

  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class(a1);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v11 = 136447234;
    v12 = "+[RPConnectionManager hasUnitTestEntitlement]";
    v13 = 1024;
    v14 = 153;
    v15 = 2112;
    v16 = v8;
    v17 = 2048;
    v18 = a1;
    v19 = 1024;
    v20 = objc_msgSend(v5, "BOOLValue");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %@ %p %d", (uint8_t *)&v11, 0x2Cu);

  }
  v9 = objc_msgSend(v5, "BOOLValue");

  return v9;
}

- (id)connectionManagerQueue
{
  if (qword_100095C20 != -1)
    dispatch_once(&qword_100095C20, &stru_100081988);
  return (id)qword_100095C18;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSSet *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136446466;
    v14 = "-[RPConnectionManager listener:shouldAcceptNewConnection:]";
    v15 = 1024;
    v16 = 169;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v13, 0x12u);
  }
  objc_msgSend(v7, "setExportedObject:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPDaemonProtocol));
  v9 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSXPCListenerEndpoint));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v10, "startInAppRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", 4, 0);

  objc_msgSend(v7, "setExportedInterface:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPClientProtocol));
  objc_msgSend(v7, "setRemoteObjectInterface:", v11);

  -[RPConnectionManager processNewConnection:](self, "processNewConnection:", v7);
  objc_msgSend(v7, "resume");

  return 1;
}

- (void)processNewConnection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  int v15;
  _QWORD v16[5];
  id v17;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "processIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPConnectionManager uniqueClientIdentifierWithPID:](RPConnectionManager, "uniqueClientIdentifierWithPID:", v5));
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v20 = "-[RPConnectionManager processNewConnection:]";
    v21 = 1024;
    v22 = 195;
    v23 = 1024;
    v24 = (int)v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d accepted client connection PID: %d", buf, 0x18u);
  }
  if ((objc_msgSend(off_1000958F0, "isEqualToString:", v6) & 1) == 0
    && (objc_msgSend(off_1000958F8, "isEqualToString:", v6) & 1) == 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002521C;
    v16[3] = &unk_1000819B0;
    v16[4] = self;
    v7 = v6;
    v17 = v7;
    v18 = (int)v5;
    objc_msgSend(v4, "setInterruptionHandler:", v16);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100025364;
    v13[3] = &unk_1000819B0;
    v13[4] = self;
    v8 = v7;
    v14 = v8;
    v15 = (int)v5;
    objc_msgSend(v4, "setInvalidationHandler:", v13);
    v9 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000254AC;
    block[3] = &unk_1000819D8;
    block[4] = self;
    v11 = v4;
    v12 = v8;
    dispatch_sync(v9, block);

  }
}

- (void)setCurrentConnection:(id)a3
{
  NSXPCConnection **p_currentConnection;
  id v4;
  id v5;
  void *v6;
  id v7;

  p_currentConnection = &self->_currentConnection;
  v7 = a3;
  v4 = objc_storeWeak((id *)p_currentConnection, v7);
  v5 = objc_msgSend(v7, "processIdentifier");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPMultipleClientProxy clientProxy](RPMultipleClientProxy, "clientProxy"));
  objc_msgSend(v6, "setCurrentConnectionProcessIdentifier:", v5);

}

- (id)getCurrentConnection
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v4 = v3;
  if (v3)
    WeakRetained = v3;
  else
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentConnection);
  v6 = WeakRetained;

  return v6;
}

- (void)stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:(id)a3
{
  id v4;
  RPRecordingManager *recordingManager;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPConnectionManager stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:]";
    v11 = 1024;
    v12 = 234;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  recordingManager = self->_recordingManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000256B4;
  v7[3] = &unk_1000813B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RPRecordingManager stopInAppRecordingWithHandler:](recordingManager, "stopInAppRecordingWithHandler:", v7);

}

- (void)stopCurrentActiveSessionWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopCurrentActiveSessionWithHandler", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000259E8;
  v8[3] = &unk_100080E90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)stopAllActiveClients
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopAllActiveClients", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v3);

  v4 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025B20;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)getSystemBroadcastExtensionInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: getSystemBroadcastExtensionInfo", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025C80;
  v8[3] = &unk_100080E90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)setBroadcastURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: setBroadcastURL", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025DE0;
  v8[3] = &unk_100080DB0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  int v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPConnectionManager updateProcessIDForAudioCaptureWithPID:]";
    v11 = 1024;
    v12 = 284;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025F8C;
  v7[3] = &unk_100081A28;
  v7[4] = self;
  v8 = a3;
  dispatch_sync(v6, v7);

}

- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  CGFloat v22;
  CGFloat v23;
  BOOL v24;
  BOOL v25;
  uint8_t buf[16];

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppRecordingWithContextID", buf, 2u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v15);

  v16 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000261A8;
  v19[3] = &unk_100081A50;
  v19[4] = self;
  v20 = v13;
  v22 = width;
  v23 = height;
  v24 = a5;
  v25 = a6;
  v21 = v14;
  v17 = v14;
  v18 = v13;
  dispatch_sync(v16, v19);

}

- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "-[RPConnectionManager resumeInAppRecordingWithWindowLayerContextID:completionHandler:]";
    v17 = 1024;
    v18 = 307;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v8);

  v9 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026468;
  block[3] = &unk_100080D60;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

- (void)stopInAppRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppRecordingWithHandler", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000266DC;
  v8[3] = &unk_100080E90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004ED84();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v8);

  v9 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000268E8;
  v11[3] = &unk_100080E90;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  dispatch_sync(v9, v11);

}

- (void)stopInAppRecordingWithUrl:(id)a3 extensionToken:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPConnectionManager stopInAppRecordingWithUrl:extensionToken:handler:]";
    v22 = 1024;
    v23 = 341;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v11);

  v12 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100026AA0;
  v16[3] = &unk_100081AA0;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  dispatch_sync(v12, v16);

}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: discardInAppRecordingWithHandler", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026DF0;
  v8[3] = &unk_100080E90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)pauseInAppRecording
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppRecording", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v3);

  v4 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026F28;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  CGFloat v22;
  CGFloat v23;
  BOOL v24;
  BOOL v25;
  uint8_t buf[16];

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppCaptureWithContextID", buf, 2u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v15);

  v16 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000270D8;
  v19[3] = &unk_100081A50;
  v19[4] = self;
  v20 = v13;
  v22 = width;
  v23 = height;
  v24 = a5;
  v25 = a6;
  v21 = v14;
  v17 = v14;
  v18 = v13;
  dispatch_sync(v16, v19);

}

- (void)stopInAppCaptureWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppCaptureWithHandler", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027310;
  v8[3] = &unk_100080E90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)pauseInAppCapture
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppCapture", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v3);

  v4 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000274D8;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "-[RPConnectionManager resumeInAppCaptureWithWindowLayerContextID:completionHandler:]";
    v17 = 1024;
    v18 = 416;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v8);

  v9 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000276C0;
  block[3] = &unk_100080D60;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v26 = "-[RPConnectionManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    v27 = 1024;
    v28 = 430;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPConnectionManager hasBroadcastEntitlements](self, "hasBroadcastEntitlements"))
  {
    v17 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100027A7C;
    v19[3] = &unk_100081AC8;
    v19[4] = self;
    v20 = v12;
    v21 = v13;
    v22 = v14;
    v23 = v15;
    v24 = v16;
    dispatch_sync(v17, v19);

  }
  else
  {
    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ReplayKit.RPRecordingErrorDomain"), -5819, 0));
      (*((void (**)(id, void *))v16 + 2))(v16, v18);

    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004EEEC();
  }

}

- (void)startInAppBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  CGFloat v27;
  CGFloat v28;
  BOOL v29;
  BOOL v30;
  uint8_t buf[16];

  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppBroadcastWithContextID", buf, 2u);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v18);

  v19 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027CC4;
  block[3] = &unk_100081AF0;
  block[4] = self;
  v24 = v15;
  v27 = width;
  v28 = height;
  v29 = a5;
  v30 = a6;
  v25 = v16;
  v26 = v17;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  dispatch_sync(v19, block);

}

- (void)stopInAppBroadcastWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppBroadcastWithHandler", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027F00;
  v8[3] = &unk_100080E90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)pauseInAppBroadcast
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppBroadcast", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v3);

  v4 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000280C8;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "-[RPConnectionManager resumeInAppBroadcastWithWindowLayerContextID:completionHandler:]";
    v17 = 1024;
    v18 = 481;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v8);

  v9 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000282B0;
  block[3] = &unk_100080D60;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  BOOL v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v26 = "-[RPConnectionManager startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    v27 = 1024;
    v28 = 496;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPConnectionManager hasSystemRecordingEntitlements](self, "hasSystemRecordingEntitlements"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v15);

    v16 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002864C;
    v18[3] = &unk_100081A50;
    v18[4] = self;
    v19 = v13;
    v21 = width;
    v22 = height;
    v23 = a5;
    v24 = a6;
    v20 = v14;
    dispatch_sync(v16, v18);

  }
  else
  {
    if (v14)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ReplayKit.RPRecordingErrorDomain"), -5810, 0));
      (*((void (**)(id, void *))v14 + 2))(v14, v17);

    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004EF64();
  }

}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[RPConnectionManager stopSystemRecordingWithHandler:]";
    v12 = 1024;
    v13 = 516;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPConnectionManager hasSystemRecordingEntitlements](self, "hasSystemRecordingEntitlements"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

    v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100028948;
    v8[3] = &unk_100080E90;
    v8[4] = self;
    v9 = v4;
    dispatch_sync(v6, v8);

  }
  else
  {
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ReplayKit.RPRecordingErrorDomain"), -5810, 0));
      (*((void (**)(id, void *))v4 + 2))(v4, v7);

    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004EFDC();
  }

}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[RPConnectionManager stopSystemRecordingWithURLHandler:]";
    v12 = 1024;
    v13 = 536;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPConnectionManager hasSystemRecordingEntitlements](self, "hasSystemRecordingEntitlements"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

    v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100028C18;
    v8[3] = &unk_100080E90;
    v8[4] = self;
    v9 = v4;
    dispatch_sync(v6, v8);

  }
  else
  {
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ReplayKit.RPRecordingErrorDomain"), -5810, 0));
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);

    }
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004F054();
  }

}

- (void)resumeSystemRecordingWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  void (**v8)(id, _QWORD);
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;

  v4 = (void (**)(id, _QWORD))a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPConnectionManager resumeSystemRecordingWithCompletionHandler:]";
    v11 = 1024;
    v12 = 558;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!-[RPConnectionManager hasSystemRecordingEntitlements](self, "hasSystemRecordingEntitlements"))
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004F0CC();
      if (!v4)
        goto LABEL_10;
    }
    else if (!v4)
    {
      goto LABEL_10;
    }
    v4[2](v4, 0);
    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028ED8;
  v7[3] = &unk_100080E90;
  v7[4] = self;
  v8 = v4;
  dispatch_sync(v6, v7);

LABEL_10:
}

- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned int v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: setupSystemBroadcastWithHostBundleID", buf, 2u);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForEntitlement:", CFSTR("com.apple.private.replay-kit.can-setup-broadcast")));
  v19 = objc_msgSend(v18, "BOOLValue");

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForEntitlement:", CFSTR("com.apple.private.replay-kit")));
  v21 = objc_msgSend(v20, "BOOLValue");

  if ((v19 & 1) != 0 || v21)
  {
    v23 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100029288;
    v24[3] = &unk_100081AC8;
    v24[4] = self;
    v25 = v12;
    v26 = v13;
    v27 = v14;
    v28 = v15;
    v29 = v16;
    dispatch_sync(v23, v24);

  }
  else
  {
    if (v16)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ReplayKit.RPRecordingErrorDomain"), -5819, 0));
      (*((void (**)(id, void *))v16 + 2))(v16, v22);

    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: setupBroadcastWithHostBundleID failed because client doesn't have entitlements to setup broadcast", buf, 2u);
    }
  }

}

- (void)startSystemBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  CGFloat v27;
  CGFloat v28;
  BOOL v29;
  BOOL v30;
  uint8_t buf[16];

  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startSystemBroadcastWithContextID", buf, 2u);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v18);

  v19 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029518;
  block[3] = &unk_100081AF0;
  block[4] = self;
  v24 = v15;
  v27 = width;
  v28 = height;
  v29 = a5;
  v30 = a6;
  v25 = v16;
  v26 = v17;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  dispatch_sync(v19, block);

}

- (void)stopSystemBroadcastWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopSystemBroadcastWithHandler", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002973C;
  v8[3] = &unk_100080E90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  void (**v8)(id, _QWORD);
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;

  v4 = (void (**)(id, _QWORD))a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPConnectionManager resumeSystemBroadcastWithCompletionHandler:]";
    v11 = 1024;
    v12 = 627;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!-[RPConnectionManager hasBroadcastEntitlements](self, "hasBroadcastEntitlements"))
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004F144();
      if (!v4)
        goto LABEL_10;
    }
    else if (!v4)
    {
      goto LABEL_10;
    }
    v4[2](v4, 0);
    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000299E0;
  v7[3] = &unk_100080E90;
  v7[4] = self;
  v8 = v4;
  dispatch_sync(v6, v7);

LABEL_10:
}

- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  CGFloat v22;
  CGFloat v23;
  BOOL v24;
  BOOL v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "-[RPConnectionManager startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:]";
    v28 = 1024;
    v29 = 649;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v15);

  v16 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100029CE8;
  v19[3] = &unk_100081A50;
  v19[4] = self;
  v20 = v13;
  v22 = width;
  v23 = height;
  v24 = a5;
  v25 = a6;
  v21 = v14;
  v17 = v14;
  v18 = v13;
  dispatch_sync(v16, v19);

}

- (void)stopClipBufferingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[RPConnectionManager stopClipBufferingWithCompletionHandler:]";
    v12 = 1024;
    v13 = 662;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100029FE8;
  v8[3] = &unk_100080E90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, void *);
  void *v8;

  v6 = a3;
  v7 = (void (**)(id, void *))a5;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004F1BC();
    if (!v7)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v7)
  {
LABEL_4:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5835, 0));
    v7[2](v7, v8);

  }
LABEL_5:

}

- (void)exportClipToURL:(id)a3 duration:(double)a4 extensionToken:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  double v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "-[RPConnectionManager exportClipToURL:duration:extensionToken:completionHandler:]";
    v25 = 1024;
    v26 = 682;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v13);

  v14 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A3A0;
  block[3] = &unk_100081B18;
  block[4] = self;
  v19 = v11;
  v20 = v10;
  v21 = v12;
  v22 = a4;
  v15 = v10;
  v16 = v12;
  v17 = v11;
  dispatch_sync(v14, block);

}

- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "-[RPConnectionManager resumeInAppClipWithWindowLayerContextID:completionHandler:]";
    v17 = 1024;
    v18 = 707;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v8);

  v9 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A7B8;
  block[3] = &unk_100080D60;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

- (void)macApplicationDidResignActive
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: macApplicationDidResignActive", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v3);

  v4 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AA04;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "-[RPConnectionManager macApplicationDidBecomeActiveWithContextID:completionHandler:]";
    v17 = 1024;
    v18 = 730;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v8);

  v9 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002ABEC;
  block[3] = &unk_100080D60;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

- (void)saveVideo:(id)a3 handler:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;

  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004F324();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5835, 0));
  v6[2](v6, v7);

}

- (void)saveVideo:(id)a3 extensionToken:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, void *);
  _BYTE *v17;
  _BYTE buf[24];
  int64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[RPConnectionManager saveVideo:extensionToken:handler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 745;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v11);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v19 = 0;
  v19 = -[RPConnectionManager consumeSandboxExtensionToken:](self, "consumeSandboxExtensionToken:", v9);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) == -1)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004F39C();
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5835, 0));
    v10[2](v10, v13);

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002AFC8;
    v14[3] = &unk_100081B40;
    v14[4] = self;
    v15 = v8;
    v17 = buf;
    v16 = v10;
    dispatch_sync(v12, v14);

  }
  _Block_object_dispose(buf, 8);

}

- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: saveVideoToCameraRoll", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v8);

  v9 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B29C;
  block[3] = &unk_100080D60;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: saveClipToCameraRoll", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v8);

  v9 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B428;
  block[3] = &unk_100080D60;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

- (void)saveClipToCameraRoll:(id)a3 extensionToken:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, void *);
  _BYTE *v17;
  _BYTE buf[24];
  int64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[RPConnectionManager saveClipToCameraRoll:extensionToken:handler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 785;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v11);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v19 = 0;
  v19 = -[RPConnectionManager consumeSandboxExtensionToken:](self, "consumeSandboxExtensionToken:", v9);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) == -1)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004F48C();
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5835, 0));
    v10[2](v10, v13);

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002B704;
    v14[3] = &unk_100081B40;
    v14[4] = self;
    v15 = v8;
    v17 = buf;
    v16 = v10;
    dispatch_sync(v12, v14);

  }
  _Block_object_dispose(buf, 8);

}

- (void)reportCameraUsage:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: reportCameraUsage", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B998;
  v7[3] = &unk_100080EE0;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(v6, v7);

}

- (int64_t)consumeSandboxExtensionToken:(id)a3
{
  return sandbox_extension_consume(objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (BOOL)releaseSandboxExtensionHandle:(int64_t)a3
{
  return sandbox_extension_release(a3, a2) != -1;
}

- (void)consumeSandboxExtension:(id)a3 processNewConnection:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;

  v4 = a4;
  v6 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136446466;
    v11 = "-[RPConnectionManager consumeSandboxExtension:processNewConnection:]";
    v12 = 1024;
    v13 = 837;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v10, 0x12u);
  }
  if (!v6)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136446466;
      v11 = "-[RPConnectionManager consumeSandboxExtension:processNewConnection:]";
      v12 = 1024;
      v13 = 839;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not consuming extension token", (uint8_t *)&v10, 0x12u);
    }
    v8 = -1;
    if (!v4)
      goto LABEL_11;
LABEL_10:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    -[RPConnectionManager processNewConnection:](self, "processNewConnection:", v9);

LABEL_11:
    -[RPConnectionManager releaseSandboxExtensionHandle:](self, "releaseSandboxExtensionHandle:", v8);
    goto LABEL_15;
  }
  v7 = -[RPConnectionManager consumeSandboxExtensionToken:](self, "consumeSandboxExtensionToken:", v6);
  if (v7 != -1)
  {
    v8 = v7;
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136446466;
      v11 = "-[RPConnectionManager consumeSandboxExtension:processNewConnection:]";
      v12 = 1024;
      v13 = 846;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Did consume extension token", (uint8_t *)&v10, 0x12u);
    }
    if (!v4)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004F57C();
LABEL_15:

}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  _BOOL4 v14;

  v3 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v10 = "-[RPConnectionManager setMicrophoneEnabled:]";
    v11 = 1024;
    v12 = 862;
    v13 = 1024;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d microphone set:%d ", buf, 0x18u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BDD4;
  v7[3] = &unk_100081B68;
  v7[4] = self;
  v8 = v3;
  dispatch_sync(v6, v7);

}

- (void)getSystemBroadcastPickerInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[RPConnectionManager getSystemBroadcastPickerInfo:]";
    v12 = 1024;
    v13 = 870;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002BF48;
  v8[3] = &unk_100080E90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

- (void)setBroadcastPickerPreferredExt:(id)a3 showsMicButton:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;

  v4 = a4;
  v6 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v14 = "-[RPConnectionManager setBroadcastPickerPreferredExt:showsMicButton:]";
    v15 = 1024;
    v16 = 879;
    v17 = 2112;
    v18 = v6;
    v19 = 1024;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preferred ext:%@  shows mic button:%i", buf, 0x22u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v7);

  v8 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C168;
  block[3] = &unk_100081B90;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v9 = v6;
  dispatch_sync(v8, block);

}

- (void)openControlCenterSystemRecordingView
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v7 = "-[RPConnectionManager openControlCenterSystemRecordingView]";
    v8 = 1024;
    v9 = 888;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  -[RPConnectionManager setCurrentConnection:](self, "setCurrentConnection:", v3);

  v4 = objc_claimAutoreleasedReturnValue(-[RPConnectionManager connectionManagerQueue](self, "connectionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C34C;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (NSXPCConnection)currentConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_currentConnection);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentConnection);
  objc_storeStrong((id *)&self->_recordingManager, 0);
  objc_storeStrong((id *)&self->_publicListener, 0);
}

@end
