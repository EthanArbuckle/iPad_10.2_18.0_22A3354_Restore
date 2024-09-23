@implementation RPCaptureManager

+ (id)sharedInstance
{
  if (qword_100095D50 != -1)
    dispatch_once(&qword_100095D50, &stru_1000821D8);
  return (id)qword_100095D48;
}

- (RPCaptureManager)init
{
  RPCaptureManager *v2;
  RPScreenCaptureManager *v3;
  RPScreenCaptureManager *screenCaptureManager;
  RPMicAudioCaptureManager *v5;
  RPMicAudioCaptureManager *micAudioCaptureManager;
  RPAppAudioCaptureManager *v7;
  RPAppAudioCaptureManager *appAudioCaptureManager;
  dispatch_queue_t v9;
  OS_dispatch_queue *captureProcessQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *captureErrorQueue;
  NSString *currentContextID;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  RPCaptureManager *v21;

  v15.receiver = self;
  v15.super_class = (Class)RPCaptureManager;
  v2 = -[RPDelegateBase init](&v15, "init");
  if (v2)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "-[RPCaptureManager init]";
      v18 = 1024;
      v19 = 61;
      v20 = 2048;
      v21 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    v3 = -[RPScreenCaptureManager initWithDelegate:]([RPScreenCaptureManager alloc], "initWithDelegate:", v2);
    screenCaptureManager = v2->_screenCaptureManager;
    v2->_screenCaptureManager = v3;

    v5 = objc_alloc_init(RPMicAudioCaptureManager);
    micAudioCaptureManager = v2->_micAudioCaptureManager;
    v2->_micAudioCaptureManager = v5;

    v7 = objc_alloc_init(RPAppAudioCaptureManager);
    appAudioCaptureManager = v2->_appAudioCaptureManager;
    v2->_appAudioCaptureManager = v7;

    v2->_captureState = 0;
    v9 = dispatch_queue_create("com.apple.ReplayKit.CaptureProcessQueue", 0);
    captureProcessQueue = v2->_captureProcessQueue;
    v2->_captureProcessQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.ReplayKit.CaptureErrorQueue", 0);
    captureErrorQueue = v2->_captureErrorQueue;
    v2->_captureErrorQueue = (OS_dispatch_queue *)v11;

    v2->_currentProcessID = 0;
    currentContextID = v2->_currentContextID;
    v2->_currentContextID = 0;

    v2->_isSystemRecording = 0;
    -[RPDelegateBase setProtocol:](v2, "setProtocol:", &OBJC_PROTOCOL___RPCaptureManagerProtocol);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  RPCaptureManager *v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPCaptureManager dealloc]";
    v6 = 1024;
    v7 = 79;
    v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPCaptureManager;
  -[RPDelegateBase dealloc](&v3, "dealloc");
}

- (void)setSystemBroadcastHostBundleId:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_systemBroadcastHostBundleId, a3);
  v5 = a3;
  -[RPScreenCaptureManager setSystemBroadcastHostBundleId:](self->_screenCaptureManager, "setSystemBroadcastHostBundleId:", v5);

}

- (void)startMicrophoneCaptureWithDispatchGroup:(id)a3
{
  NSObject *v4;
  RPMicAudioCaptureManager *micAudioCaptureManager;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[RPCaptureManager startMicrophoneCaptureWithDispatchGroup:]";
    v12 = 1024;
    v13 = 89;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  dispatch_group_enter(v4);
  micAudioCaptureManager = self->_micAudioCaptureManager;
  v8 = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100048700;
  v9[3] = &unk_100082220;
  v9[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100048778;
  v7[3] = &unk_100080E00;
  v6 = v4;
  -[RPMicAudioCaptureManager startMicrophoneCaptureWithOutput:didStartHandler:](micAudioCaptureManager, "startMicrophoneCaptureWithOutput:didStartHandler:", v9, v7);

}

- (void)startAppAudioCaptureForSystemRecording:(BOOL)a3 processID:(int)a4 contextIDs:(id)a5 outputHandler:(id)a6 didStartHandler:(id)a7
{
  uint64_t v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  RPAppAudioCaptureManager *appAudioCaptureManager;
  id v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;

  v9 = *(_QWORD *)&a4;
  v10 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136446722;
    v23 = "-[RPCaptureManager startAppAudioCaptureForSystemRecording:processID:contextIDs:outputHandler:didStartHandler:]";
    v24 = 1024;
    v25 = 106;
    v26 = 1024;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pid %d", (uint8_t *)&v22, 0x18u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  v16 = +[RPAppAudioCaptureManager audioCaptureConfigForSystemRecording:processID:contextID:](RPAppAudioCaptureManager, "audioCaptureConfigForSystemRecording:processID:contextID:", v10, v9, v15);
  v18 = v17;

  appAudioCaptureManager = self->_appAudioCaptureManager;
  v20 = v18;
  v21 = v20;
  if (appAudioCaptureManager)
    -[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:](appAudioCaptureManager, "startWithConfig:outputHandler:didStartHandler:", v16, v18, v13, v14);
  else

}

- (void)restartAppAudioCaptureForProcessID:(int)a3
{
  NSObject *captureProcessQueue;
  _QWORD v6[5];
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v9 = "-[RPCaptureManager restartAppAudioCaptureForProcessID:]";
    v10 = 1024;
    v11 = 120;
    v12 = 1024;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pid %d", buf, 0x18u);
  }
  captureProcessQueue = self->_captureProcessQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100048B0C;
  v6[3] = &unk_100081A28;
  v6[4] = self;
  v7 = a3;
  dispatch_async(captureProcessQueue, v6);
}

- (void)stopAppAudioCapture
{
  -[RPAppAudioCaptureManager stop](self->_appAudioCaptureManager, "stop");
}

- (void)stopAllCapture
{
  OS_os_transaction *transaction;
  NSString *currentContextID;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPCaptureManager stopAllCapture]";
    v7 = 1024;
    v8 = 165;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  transaction = self->_transaction;
  self->_transaction = 0;

  self->_captureState = 0;
  self->_currentProcessID = 0;
  currentContextID = self->_currentContextID;
  self->_currentContextID = 0;

  self->_isSystemRecording = 0;
  -[RPScreenCaptureManager stop](self->_screenCaptureManager, "stop");
  -[RPMicAudioCaptureManager stopAllCapture](self->_micAudioCaptureManager, "stopAllCapture");
  -[RPCaptureManager stopAppAudioCapture](self, "stopAppAudioCapture");
  -[RPDelegateBase removeAllDelegates](self, "removeAllDelegates");
}

- (void)stopCaptureForDelegate:(id)a3
{
  id v4;
  NSString *systemBroadcastHostBundleId;
  NSObject *captureProcessQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v11 = "-[RPCaptureManager stopCaptureForDelegate:]";
    v12 = 1024;
    v13 = 179;
    v14 = 2048;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d delegate %p", buf, 0x1Cu);
  }
  systemBroadcastHostBundleId = self->_systemBroadcastHostBundleId;
  self->_systemBroadcastHostBundleId = 0;

  captureProcessQueue = self->_captureProcessQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100048E80;
  v8[3] = &unk_100080DB0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(captureProcessQueue, v8);

}

- (void)startCaptureForDelegate:(id)a3 forProcessID:(int)a4 shouldStartMicrophoneCapture:(BOOL)a5 windowSize:(CGSize)a6 systemRecording:(BOOL)a7 contextIDs:(id)a8 didStartHandler:(id)a9
{
  -[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:mixedRealityCamera:didStartHandler:](self, "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:mixedRealityCamera:didStartHandler:", a3, *(_QWORD *)&a4, a5, a7, a8, 0, a6.width, a6.height, a9);
}

- (void)startCaptureForDelegate:(id)a3 forProcessID:(int)a4 shouldStartMicrophoneCapture:(BOOL)a5 windowSize:(CGSize)a6 systemRecording:(BOOL)a7 contextIDs:(id)a8 mixedRealityCamera:(BOOL)a9 didStartHandler:(id)a10
{
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  void (**v19)(id, _QWORD);
  NSError *failedToStartError;
  NSObject *captureProcessQueue;
  id v22;
  id v23;
  void *v24;
  _QWORD block[5];
  id v27;
  id v28;
  _BYTE *v29;
  CGFloat v30;
  CGFloat v31;
  int v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;
  _BYTE buf[28];

  height = a6.height;
  width = a6.width;
  v17 = a3;
  v18 = a8;
  v19 = (void (**)(id, _QWORD))a10;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize"
                         ":systemRecording:contextIDs:mixedRealityCamera:didStartHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 204;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d delegate %p", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  buf[24] = 0;
  failedToStartError = self->_failedToStartError;
  self->_failedToStartError = 0;

  captureProcessQueue = self->_captureProcessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000492D0;
  block[3] = &unk_100082248;
  block[4] = self;
  v22 = v18;
  v27 = v22;
  v32 = a4;
  v33 = a7;
  v23 = v17;
  v30 = width;
  v31 = height;
  v34 = a9;
  v35 = a5;
  v28 = v23;
  v29 = buf;
  dispatch_sync(captureProcessQueue, block);
  if (v19)
  {
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v19[2](v19, 0);
    }
    else if (self->_failedToStartError)
    {
      ((void (*)(void (**)(id, _QWORD)))v19[2])(v19);
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5833, 0));
      ((void (**)(id, void *))v19)[2](v19, v24);

    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)startCaptureManagersForProcessID:(int)a3 windowSize:(CGSize)a4 systemRecording:(BOOL)a5 contextIDs:(id)a6 mixedRealityCamera:(BOOL)a7 dispatchGroup:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  double height;
  double width;
  uint64_t v13;
  NSObject *v15;
  id v16;
  RPScreenCaptureManager *screenCaptureManager;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  NSObject *v24;
  _QWORD v25[5];

  v8 = a7;
  v10 = a5;
  height = a4.height;
  width = a4.width;
  v13 = *(_QWORD *)&a3;
  v15 = a8;
  v16 = a6;
  dispatch_group_enter(v15);
  self->_mixedRealityCamera = v8;
  screenCaptureManager = self->_screenCaptureManager;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000497C0;
  v25[3] = &unk_100082290;
  v25[4] = self;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100049834;
  v23[3] = &unk_100081698;
  v18 = v15;
  v24 = v18;
  -[RPScreenCaptureManager startSessionWithPID:windowSize:systemRecording:contextIDs:mixedRealityCamera:outputHandler:didStartHandler:](screenCaptureManager, "startSessionWithPID:windowSize:systemRecording:contextIDs:mixedRealityCamera:outputHandler:didStartHandler:", v13, v10, v16, v8, v25, v23, width, height);
  -[RPCaptureManager setAVAudioSessionCategory](self, "setAVAudioSessionCategory");
  dispatch_group_enter(v18);
  v21 = v18;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100049910;
  v22[3] = &unk_100082220;
  v22[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100049988;
  v20[3] = &unk_100081698;
  v19 = v18;
  -[RPCaptureManager startAppAudioCaptureForSystemRecording:processID:contextIDs:outputHandler:didStartHandler:](self, "startAppAudioCaptureForSystemRecording:processID:contextIDs:outputHandler:didStartHandler:", v10, v13, v16, v22, v20);

}

- (void)updateContextIDs:(id)a3 forProcessID:(int)a4 systemRecording:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  int currentProcessID;
  BOOL v12;
  int v13;
  NSString *currentContextID;
  NSString *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  void *v28;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  }
  else
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005261C();
    v10 = 0;
  }
  currentProcessID = self->_currentProcessID;
  if (currentProcessID)
    v12 = currentProcessID == a4;
  else
    v12 = 1;
  if (!v12 || self->_currentContextID && (objc_msgSend(v10, "isEqualToString:") & 1) == 0)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_currentProcessID;
      currentContextID = self->_currentContextID;
      *(_DWORD *)buf = 136447490;
      v18 = "-[RPCaptureManager updateContextIDs:forProcessID:systemRecording:]";
      v19 = 1024;
      v20 = 328;
      v21 = 1024;
      v22 = v13;
      v23 = 1024;
      v24 = a4;
      v25 = 2112;
      v26 = currentContextID;
      v27 = 2112;
      v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d current capture stopped by interruption process changed %d to %d context changed %@ to %@", buf, 0x32u);
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100049C6C;
    v16[3] = &unk_1000822B8;
    v16[4] = self;
    -[RPDelegateBase callDelegate:](self, "callDelegate:", v16);
    -[RPCaptureManager stopAllCapture](self, "stopAllCapture");
  }
  self->_currentProcessID = a4;
  v15 = self->_currentContextID;
  self->_currentContextID = (NSString *)v10;

  self->_isSystemRecording = a5;
}

- (void)enableMicrophone
{
  NSObject *captureProcessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v6 = "-[RPCaptureManager enableMicrophone]";
    v7 = 1024;
    v8 = 344;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  captureProcessQueue = self->_captureProcessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049E50;
  block[3] = &unk_100080E00;
  block[4] = self;
  dispatch_async(captureProcessQueue, block);
}

- (void)setAVAudioSessionCategory
{
  void *v2;
  id v3;
  BOOL v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v5 = 0;
  objc_msgSend(v2, "setCategory:withOptions:error:", AVAudioSessionCategoryPlayAndRecord, 5, &v5);
  v3 = v5;

  if (v3)
    v4 = dword_100095B40 > 2;
  else
    v4 = 1;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000526B0(v3);

}

- (void)screenCaptureDidFailWithError:(id)a3
{
  id v4;
  id v5;
  NSObject *captureProcessQueue;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v11 = "-[RPCaptureManager screenCaptureDidFailWithError:]";
    v12 = 1024;
    v13 = 364;
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d error %@", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004A098;
  v8[3] = &unk_1000822B8;
  v9 = v4;
  v5 = v4;
  -[RPDelegateBase callDelegate:](self, "callDelegate:", v8);
  captureProcessQueue = self->_captureProcessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004A0A4;
  v7[3] = &unk_100080E00;
  v7[4] = self;
  dispatch_async(captureProcessQueue, v7);

}

- (NSString)systemBroadcastHostBundleId
{
  return self->_systemBroadcastHostBundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBroadcastHostBundleId, 0);
  objc_storeStrong((id *)&self->_failedToStartError, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_currentContextID, 0);
  objc_storeStrong((id *)&self->_captureErrorQueue, 0);
  objc_storeStrong((id *)&self->_captureProcessQueue, 0);
  objc_storeStrong((id *)&self->_appAudioCaptureManager, 0);
  objc_storeStrong((id *)&self->_micAudioCaptureManager, 0);
  objc_storeStrong((id *)&self->_screenCaptureManager, 0);
}

@end
