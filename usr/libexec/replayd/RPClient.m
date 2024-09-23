@implementation RPClient

- (RPClient)initWithConnection:(id)a3 clientProxy:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  RPClient *v11;
  void *v12;
  RPRecordSession *recordSession;
  RPCaptureSession *captureSession;
  RPBroadcastSession *broadcastSession;
  RPClipSession *clipSession;
  RPSystemRecordSession *systemRecordSession;
  RPSystemBroadcastSession *systemBroadcastSession;
  __int128 v19;
  PAAccessInterval *accessInterval;
  dispatch_queue_t v21;
  OS_dispatch_queue *alertQueue;
  objc_super v24[2];
  objc_super v25;
  uint8_t buf[40];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)RPClient;
  v11 = -[RPClient init](&v25, "init");
  if (v11)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[RPClient initWithConnection:clientProxy:bundleIdentifier:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 118;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    -[RPClient setClientProxy:](v11, "setClientProxy:", v9);
    -[RPClient setClientBundleID:](v11, "setClientBundleID:", v10);
    -[RPClient setClientPID:](v11, "setClientPID:", objc_msgSend(v8, "processIdentifier"));
    if (v8)
      objc_msgSend(v8, "auditToken");
    else
      memset(v24, 0, sizeof(v24));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SCProcessUtility hostApplicationWithAuditToken:bundleID:](SCProcessUtility, "hostApplicationWithAuditToken:bundleID:", v24, v10));
    -[RPClient setClientMainBundleID:](v11, "setClientMainBundleID:", v12);

    recordSession = v11->_recordSession;
    v11->_recordSession = 0;

    captureSession = v11->_captureSession;
    v11->_captureSession = 0;

    broadcastSession = v11->_broadcastSession;
    v11->_broadcastSession = 0;

    clipSession = v11->_clipSession;
    v11->_clipSession = 0;

    systemRecordSession = v11->_systemRecordSession;
    v11->_systemRecordSession = 0;

    systemBroadcastSession = v11->_systemBroadcastSession;
    v11->_systemBroadcastSession = 0;

    v11->_currentActiveSession = 0;
    if (v8)
      objc_msgSend(v8, "auditToken");
    else
      memset(buf, 0, 32);
    v19 = *(_OWORD *)&buf[16];
    *(_OWORD *)v11->_clientConnectionAuditToken.val = *(_OWORD *)buf;
    *(_OWORD *)&v11->_clientConnectionAuditToken.val[4] = v19;
    accessInterval = v11->_accessInterval;
    v11->_accessInterval = 0;

    v21 = dispatch_queue_create("com.apple.replaykit.AlertDispatchQueue", 0);
    alertQueue = v11->_alertQueue;
    v11->_alertQueue = (OS_dispatch_queue *)v21;

  }
  return v11;
}

- (void)invalidate
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  RPClient *v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446722;
    v4 = "-[RPClient invalidate]";
    v5 = 1024;
    v6 = 157;
    v7 = 2048;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v3, 0x1Cu);
  }
  -[RPSession invalidate](self->_recordSession, "invalidate");
  -[RPSession invalidate](self->_captureSession, "invalidate");
  -[RPSession invalidate](self->_broadcastSession, "invalidate");
  -[RPSession invalidate](self->_clipSession, "invalidate");
  -[RPSession invalidate](self->_systemRecordSession, "invalidate");
  -[RPSession invalidate](self->_systemBroadcastSession, "invalidate");
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  RPClient *v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPClient dealloc]";
    v6 = 1024;
    v7 = 178;
    v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPClient;
  -[RPClient dealloc](&v3, "dealloc");
}

- (void)setClientPID:(int)a3
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPClient setClientPID:]";
    v7 = 1024;
    v8 = 182;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  self->_clientPID = a3;
}

- (void)pauseCurrentActiveSession
{
  int currentActiveSession;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    currentActiveSession = self->_currentActiveSession;
    v6 = 136446722;
    v7 = "-[RPClient pauseCurrentActiveSession]";
    v8 = 1024;
    v9 = 206;
    v10 = 1024;
    v11 = currentActiveSession;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pausing session type %d", (uint8_t *)&v6, 0x18u);
  }
  v4 = 8;
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136446466;
        v7 = "-[RPClient pauseCurrentActiveSession]";
        v8 = 1024;
        v9 = 237;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d We don't have a current active session to pause, returning", (uint8_t *)&v6, 0x12u);
      }
      return;
    case 1:
      v4 = 16;
      goto LABEL_15;
    case 2:
      goto LABEL_15;
    case 3:
      v4 = 24;
      goto LABEL_15;
    case 4:
      v4 = 32;
      goto LABEL_15;
    case 5:
      v4 = 40;
LABEL_15:
      objc_msgSend(*(id *)((char *)&self->super.isa + v4), "pauseSession");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
      objc_msgSend(v5, "recordingDidPause");

      break;
    default:
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004FCFC(&self->_currentActiveSession);
      break;
  }
}

- (void)reportCameraUsage:(int64_t)a3
{
  void *captureSession;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136446466;
        v5 = "-[RPClient reportCameraUsage:]";
        v6 = 1024;
        v7 = 268;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d We don't have a current active session to report camera usage, returning", (uint8_t *)&v4, 0x12u);
      }
      return;
    case 1:
      captureSession = self->_captureSession;
      goto LABEL_12;
    case 2:
      captureSession = self->_recordSession;
      goto LABEL_12;
    case 3:
      captureSession = self->_broadcastSession;
      goto LABEL_12;
    case 4:
      captureSession = self->_clipSession;
      goto LABEL_12;
    case 5:
      captureSession = self->_systemRecordSession;
      goto LABEL_12;
    case 6:
      captureSession = self->_systemBroadcastSession;
LABEL_12:
      objc_msgSend(captureSession, "sessionReportCameraUsage:", a3);
      break;
    default:
      return;
  }
}

- (void)resumeCurrentActiveSessionWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  int currentActiveSession;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    currentActiveSession = self->_currentActiveSession;
    v10 = 136446722;
    v11 = "-[RPClient resumeCurrentActiveSessionWithContextID:completionHandler:]";
    v12 = 1024;
    v13 = 306;
    v14 = 1024;
    v15 = currentActiveSession;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resuming session type %d", (uint8_t *)&v10, 0x18u);
  }
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136446466;
        v11 = "-[RPClient resumeCurrentActiveSessionWithContextID:completionHandler:]";
        v12 = 1024;
        v13 = 326;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d We don't have a current active session to resume, returning", (uint8_t *)&v10, 0x12u);
      }
      if (v7)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5832, 0));
        (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v9, 0, 0);

      }
      break;
    case 1:
      -[RPClient resumeInAppCaptureWithContextID:completionHandler:](self, "resumeInAppCaptureWithContextID:completionHandler:", v6, v7);
      break;
    case 2:
      -[RPClient resumeInAppRecordingWithContextID:completionHandler:](self, "resumeInAppRecordingWithContextID:completionHandler:", v6, v7);
      break;
    case 3:
      -[RPClient resumeInAppBroadcastWithContextID:completionHandler:](self, "resumeInAppBroadcastWithContextID:completionHandler:", v6, v7);
      break;
    case 4:
      -[RPClient resumeInAppClipWithContextID:completionHandler:](self, "resumeInAppClipWithContextID:completionHandler:", v6, v7);
      break;
    default:
      break;
  }

}

- (void)notifyClientWithOutputURL:(id)a3 error:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, BOOL);
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, BOOL))a5;
  if (v9)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004FD98();
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136446466;
      v14 = "-[RPClient notifyClientWithOutputURL:error:withHandler:]";
      v15 = 1024;
      v16 = 343;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop session success, notifying client of session stoppped", (uint8_t *)&v13, 0x12u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5806, 0));
    objc_msgSend(v11, "recordingDidStopWithError:movieURL:", v12, v8);

    self->_currentActiveSession = 0;
  }
  if (v10)
    v10[2](v10, v9 == 0);

}

- (void)stopCurrentActiveSessionWithHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void (**v5)(id, uint64_t);
  _QWORD v6[5];
  void (**v7)(id, uint64_t);
  _QWORD v8[5];
  void (**v9)(id, uint64_t);
  _QWORD v10[5];
  void (**v11)(id, uint64_t);
  _QWORD v12[5];
  void (**v13)(id, uint64_t);
  _QWORD v14[5];
  void (**v15)(id, uint64_t);
  _QWORD v16[5];
  void (**v17)(id, uint64_t);
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  RPClient *v23;

  v4 = (void (**)(id, uint64_t))a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v19 = "-[RPClient stopCurrentActiveSessionWithHandler:]";
    v20 = 1024;
    v21 = 357;
    v22 = 2048;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[RPClient stopCurrentActiveSessionWithHandler:]";
        v20 = 1024;
        v21 = 410;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d We don't have a current active session to stop", buf, 0x12u);
      }
      if (v4)
        v4[2](v4, 1);
      break;
    case 1:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100031BD8;
      v14[3] = &unk_100081390;
      v14[4] = self;
      v15 = v4;
      -[RPClient stopInAppCaptureSessionWithHandler:](self, "stopInAppCaptureSessionWithHandler:", v14);
      v5 = v15;
      goto LABEL_19;
    case 2:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100031BC4;
      v16[3] = &unk_1000813B8;
      v16[4] = self;
      v17 = v4;
      -[RPClient stopInAppRecordingSessionWithHandler:](self, "stopInAppRecordingSessionWithHandler:", v16);
      v5 = v17;
      goto LABEL_19;
    case 3:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100031BEC;
      v12[3] = &unk_100081390;
      v12[4] = self;
      v13 = v4;
      -[RPClient stopInAppBroadcastSessionWithHandler:](self, "stopInAppBroadcastSessionWithHandler:", v12);
      v5 = v13;
      goto LABEL_19;
    case 4:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100031C00;
      v10[3] = &unk_100081390;
      v10[4] = self;
      v11 = v4;
      -[RPClient stopInAppClipSessionWithHandler:](self, "stopInAppClipSessionWithHandler:", v10);
      v5 = v11;
      goto LABEL_19;
    case 5:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100031C14;
      v8[3] = &unk_100081390;
      v8[4] = self;
      v9 = v4;
      -[RPClient stopSystemRecordingSessionWithHandler:](self, "stopSystemRecordingSessionWithHandler:", v8);
      v5 = v9;
      goto LABEL_19;
    case 6:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100031C28;
      v6[3] = &unk_100081390;
      v6[4] = self;
      v7 = v4;
      -[RPClient stopSystemBroadcastSessionWithHandler:](self, "stopSystemBroadcastSessionWithHandler:", v6);
      v5 = v7;
LABEL_19:

      break;
    default:
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004FE14();
      break;
  }

}

- (void)setCurrentActiveSessionMicrophoneEnabled:(BOOL)a3
{
  _BOOL8 v3;
  int currentActiveSession;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v3 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[RPClient setCurrentActiveSessionMicrophoneEnabled:]";
    v9 = 1024;
    v10 = 420;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  currentActiveSession = self->_currentActiveSession;
  if (currentActiveSession == 5)
  {
    v6 = 40;
  }
  else
  {
    if (currentActiveSession != 6)
      return;
    v6 = 48;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v6), "setCaptureMicrophoneEnabled:", v3);
}

- (void)startInAppRecordingSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v13;
  id v14;
  RPRecordSession *recordSession;
  void *v16;
  uint64_t clientPID;
  void *v18;
  RPRecordSession *v19;
  uint64_t v20;
  RPRecordSession *v21;
  RPRecordSession *v22;
  RPRecordSession *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;

  v8 = a6;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPClient startInAppRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    v29 = 1024;
    v30 = 442;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting in-app recording", buf, 0x12u);
  }
  recordSession = self->_recordSession;
  if (recordSession)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    clientPID = self->_clientPID;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:](recordSession, "updateClientProxy:callingPID:bundleID:", v16, clientPID, v18);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[RPClient startInAppRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      v29 = 1024;
      v30 = 445;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a record session, creating a new one", buf, 0x12u);
    }
    v19 = [RPRecordSession alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    v20 = self->_clientPID;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    v21 = -[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:](v19, "initWithClientProxy:sessionType:callingPID:bundleID:delegate:", v16, 2, v20, v18, self);
    v22 = self->_recordSession;
    self->_recordSession = v21;

  }
  v23 = self->_recordSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100031FCC;
  v25[3] = &unk_100081390;
  v25[4] = self;
  v26 = v14;
  v24 = v14;
  -[RPRecordSession startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:](v23, "startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:", v9, v8, v13, v25, width, height);

}

- (void)stopInAppRecordingSessionWithHandler:(id)a3
{
  id v4;
  RPRecordSession *recordSession;
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
    v10 = "-[RPClient stopInAppRecordingSessionWithHandler:]";
    v11 = 1024;
    v12 = 473;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping in-app recording", buf, 0x12u);
  }
  recordSession = self->_recordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000321EC;
  v7[3] = &unk_1000813B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RPRecordSession stopRecordingWithHandler:](recordSession, "stopRecordingWithHandler:", v7);

}

- (void)pauseInAppRecording
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPClient pauseInAppRecording]";
    v5 = 1024;
    v6 = 489;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Pausing in-app recording", (uint8_t *)&v3, 0x12u);
  }
  -[RPRecordSession pauseSession](self->_recordSession, "pauseSession");
}

- (void)resumeInAppRecordingWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  RPRecordSession *recordSession;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPClient resumeInAppRecordingWithContextID:completionHandler:]";
    v14 = 1024;
    v15 = 494;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Resuming in-app recording", buf, 0x12u);
  }
  recordSession = self->_recordSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003249C;
  v10[3] = &unk_100081390;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[RPSession resumeSessionWithWindowLayerContextID:completionHandler:](recordSession, "resumeSessionWithWindowLayerContextID:completionHandler:", v6, v10);

}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4;
  RPRecordSession *recordSession;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPClient discardInAppRecordingWithHandler:]";
    v11 = 1024;
    v12 = 512;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Disarding in-app recording", buf, 0x12u);
  }
  recordSession = self->_recordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032774;
  v7[3] = &unk_100081A00;
  v8 = v4;
  v6 = v4;
  -[RPRecordSession discardInAppRecordingWithHandler:](recordSession, "discardInAppRecordingWithHandler:", v7);

}

- (void)startInAppCaptureSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v13;
  id v14;
  RPCaptureSession *captureSession;
  void *v16;
  uint64_t clientPID;
  void *v18;
  RPCaptureSession *v19;
  uint64_t v20;
  RPCaptureSession *v21;
  RPCaptureSession *v22;
  RPCaptureSession *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;

  v8 = a6;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPClient startInAppCaptureSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    v29 = 1024;
    v30 = 523;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting in-app capture", buf, 0x12u);
  }
  captureSession = self->_captureSession;
  if (captureSession)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    clientPID = self->_clientPID;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:](captureSession, "updateClientProxy:callingPID:bundleID:", v16, clientPID, v18);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[RPClient startInAppCaptureSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      v29 = 1024;
      v30 = 526;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a capture session, creating a new one", buf, 0x12u);
    }
    v19 = [RPCaptureSession alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    v20 = self->_clientPID;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    v21 = -[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:](v19, "initWithClientProxy:sessionType:callingPID:bundleID:delegate:", v16, 1, v20, v18, self);
    v22 = self->_captureSession;
    self->_captureSession = v21;

  }
  v23 = self->_captureSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100032AE4;
  v25[3] = &unk_100081390;
  v25[4] = self;
  v26 = v14;
  v24 = v14;
  -[RPCaptureSession startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:](v23, "startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:", v9, v8, v13, v25, width, height);

}

- (void)stopInAppCaptureSessionWithHandler:(id)a3
{
  id v4;
  RPCaptureSession *captureSession;
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
    v10 = "-[RPClient stopInAppCaptureSessionWithHandler:]";
    v11 = 1024;
    v12 = 555;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping in-app capture", buf, 0x12u);
  }
  captureSession = self->_captureSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032D04;
  v7[3] = &unk_100081390;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RPCaptureSession stopCaptureWithHandler:](captureSession, "stopCaptureWithHandler:", v7);

}

- (void)pauseInAppCapture
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPClient pauseInAppCapture]";
    v5 = 1024;
    v6 = 571;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Pausing in-app capture", (uint8_t *)&v3, 0x12u);
  }
  -[RPCaptureSession pauseSession](self->_captureSession, "pauseSession");
}

- (void)resumeInAppCaptureWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  RPCaptureSession *captureSession;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPClient resumeInAppCaptureWithContextID:completionHandler:]";
    v14 = 1024;
    v15 = 576;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Resuming in-app capture", buf, 0x12u);
  }
  captureSession = self->_captureSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100032F98;
  v10[3] = &unk_100081390;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[RPSession resumeSessionWithWindowLayerContextID:completionHandler:](captureSession, "resumeSessionWithWindowLayerContextID:completionHandler:", v6, v10);

}

- (void)setupInAppBroadcastExtensionBundleID:(id)a3 broadcastConfigurationData:(id)a4 userInfo:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RPBroadcastSession *broadcastSession;
  void *v15;
  uint64_t clientPID;
  void *v17;
  RPBroadcastSession *v18;
  uint64_t v19;
  RPBroadcastSession *v20;
  RPBroadcastSession *v21;
  RPBroadcastSession *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136446466;
    v25 = "-[RPClient setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    v26 = 1024;
    v27 = 595;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v24, 0x12u);
  }
  broadcastSession = self->_broadcastSession;
  if (broadcastSession)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    clientPID = self->_clientPID;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:](broadcastSession, "updateClientProxy:callingPID:bundleID:", v15, clientPID, v17);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136446466;
      v25 = "-[RPClient setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
      v26 = 1024;
      v27 = 598;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a broadcast session, creating a new one", (uint8_t *)&v24, 0x12u);
    }
    v18 = [RPBroadcastSession alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    v19 = self->_clientPID;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    v20 = -[RPBroadcastSession initWithClientProxy:callingPID:bundleID:delegate:](v18, "initWithClientProxy:callingPID:bundleID:delegate:", v15, v19, v17, self);
    v21 = self->_broadcastSession;
    self->_broadcastSession = v20;

  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136446466;
    v25 = "-[RPClient setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    v26 = 1024;
    v27 = 605;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setting up broadcast session", (uint8_t *)&v24, 0x12u);
  }
  v22 = self->_broadcastSession;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
  -[RPBroadcastSession setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:](v22, "setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:", v23, v10, v11, v12, v13);

}

- (void)startInAppBroadcastSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  RPBroadcastSession *broadcastSession;
  void *v19;
  uint64_t clientPID;
  void *v21;
  RPBroadcastSession *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;

  v10 = a6;
  v11 = a5;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v26 = "-[RPClient startInAppBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:]";
    v27 = 1024;
    v28 = 610;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting in-app broadcast", buf, 0x12u);
  }
  broadcastSession = self->_broadcastSession;
  if (broadcastSession)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    clientPID = self->_clientPID;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:](broadcastSession, "updateClientProxy:callingPID:bundleID:", v19, clientPID, v21);

    v22 = self->_broadcastSession;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100033630;
    v23[3] = &unk_100081390;
    v23[4] = self;
    v24 = v17;
    -[RPBroadcastSession startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:](v22, "startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:", v11, v10, v15, v16, v23, width, height);

  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100050080();
  }

}

- (void)stopInAppBroadcastSessionWithHandler:(id)a3
{
  id v4;
  RPBroadcastSession *broadcastSession;
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
    v10 = "-[RPClient stopInAppBroadcastSessionWithHandler:]";
    v11 = 1024;
    v12 = 638;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping in-app broadcast", buf, 0x12u);
  }
  broadcastSession = self->_broadcastSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033850;
  v7[3] = &unk_100081390;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RPBroadcastSession stopBroadcastWithHandler:](broadcastSession, "stopBroadcastWithHandler:", v7);

}

- (void)pauseInAppBroadcast
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPClient pauseInAppBroadcast]";
    v5 = 1024;
    v6 = 654;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Pausing in-app broadcast", (uint8_t *)&v3, 0x12u);
  }
  -[RPBroadcastSession pauseSession](self->_broadcastSession, "pauseSession");
}

- (void)updateBroadcastURL:(id)a3
{
  id v4;
  void *broadcastSession;
  id v6;

  v4 = a3;
  broadcastSession = self->_broadcastSession;
  if (broadcastSession || (broadcastSession = self->_systemBroadcastSession) != 0)
  {
    v6 = v4;
    objc_msgSend(broadcastSession, "updateBroadcastURL:", v4);
    v4 = v6;
  }

}

- (void)resumeInAppBroadcastWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  RPBroadcastSession *broadcastSession;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPClient resumeInAppBroadcastWithContextID:completionHandler:]";
    v14 = 1024;
    v15 = 669;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Resuming in-app broadcast", buf, 0x12u);
  }
  broadcastSession = self->_broadcastSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100033B30;
  v10[3] = &unk_100081390;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[RPBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:](broadcastSession, "resumeSessionWithWindowLayerContextID:completionHandler:", v6, v10);

}

- (void)startInAppClipSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v13;
  id v14;
  RPClipSession *clipSession;
  void *v16;
  uint64_t clientPID;
  void *v18;
  RPClipSession *v19;
  uint64_t v20;
  RPClipSession *v21;
  RPClipSession *v22;
  RPClipSession *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;

  v8 = a6;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPClient startInAppClipSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    v29 = 1024;
    v30 = 688;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting in-app clip buffering", buf, 0x12u);
  }
  clipSession = self->_clipSession;
  if (clipSession)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    clientPID = self->_clientPID;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:](clipSession, "updateClientProxy:callingPID:bundleID:", v16, clientPID, v18);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[RPClient startInAppClipSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      v29 = 1024;
      v30 = 691;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a clip session, creating a new one", buf, 0x12u);
    }
    v19 = [RPClipSession alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    v20 = self->_clientPID;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    v21 = -[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:](v19, "initWithClientProxy:sessionType:callingPID:bundleID:delegate:", v16, 4, v20, v18, self);
    v22 = self->_clipSession;
    self->_clipSession = v21;

  }
  v23 = self->_clipSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100033F7C;
  v25[3] = &unk_100081390;
  v25[4] = self;
  v26 = v14;
  v24 = v14;
  -[RPClipSession startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:](v23, "startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:", v9, v8, v13, v25, width, height);

}

- (void)stopInAppClipSessionWithHandler:(id)a3
{
  id v4;
  RPClipSession *clipSession;
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
    v10 = "-[RPClient stopInAppClipSessionWithHandler:]";
    v11 = 1024;
    v12 = 719;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping in-app clip buffering", buf, 0x12u);
  }
  clipSession = self->_clipSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003419C;
  v7[3] = &unk_100081390;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RPClipSession stopClipWithHandler:](clipSession, "stopClipWithHandler:", v7);

}

- (void)pauseInAppClip
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPClient pauseInAppClip]";
    v5 = 1024;
    v6 = 735;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Pausing in-app clip buffering", (uint8_t *)&v3, 0x12u);
  }
  -[RPClipSession pauseSession](self->_clipSession, "pauseSession");
}

- (void)resumeInAppClipWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  RPClipSession *clipSession;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPClient resumeInAppClipWithContextID:completionHandler:]";
    v14 = 1024;
    v15 = 740;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Resuming in-app clip buffering", buf, 0x12u);
  }
  clipSession = self->_clipSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100034430;
  v10[3] = &unk_100081390;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[RPSession resumeSessionWithWindowLayerContextID:completionHandler:](clipSession, "resumeSessionWithWindowLayerContextID:completionHandler:", v6, v10);

}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  RPClipSession *clipSession;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v8 = a3;
  v9 = a5;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPClient exportClipToURL:duration:completionHandler:]";
    v16 = 1024;
    v17 = 758;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  clipSession = self->_clipSession;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100034734;
  v12[3] = &unk_100080E68;
  v13 = v9;
  v11 = v9;
  -[RPClipSession exportClipToURL:duration:completionHandler:](clipSession, "exportClipToURL:duration:completionHandler:", v8, v12, a4);

}

- (void)sessionDidStop
{
  self->_currentActiveSession = 0;
}

- (void)startSystemRecordingSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v13;
  id v14;
  RPSystemRecordSession *systemRecordSession;
  void *v16;
  uint64_t clientPID;
  void *v18;
  RPSystemRecordSession *v19;
  uint64_t v20;
  RPSystemRecordSession *v21;
  RPSystemRecordSession *v22;
  RPSystemRecordSession *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;

  v8 = a6;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPClient startSystemRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    v29 = 1024;
    v30 = 783;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting system recording", buf, 0x12u);
  }
  systemRecordSession = self->_systemRecordSession;
  if (systemRecordSession)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    clientPID = self->_clientPID;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:](systemRecordSession, "updateClientProxy:callingPID:bundleID:", v16, clientPID, v18);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[RPClient startSystemRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      v29 = 1024;
      v30 = 786;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a system record session, creating a new one", buf, 0x12u);
    }
    v19 = [RPSystemRecordSession alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    v20 = self->_clientPID;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    v21 = -[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:](v19, "initWithClientProxy:sessionType:callingPID:bundleID:delegate:", v16, 5, v20, v18, self);
    v22 = self->_systemRecordSession;
    self->_systemRecordSession = v21;

  }
  v23 = self->_systemRecordSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100034B48;
  v25[3] = &unk_100081390;
  v25[4] = self;
  v26 = v14;
  v24 = v14;
  -[RPSystemRecordSession startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:](v23, "startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:", v9, v8, v13, v25, width, height);

}

- (void)stopSystemRecordingSessionWithHandler:(id)a3
{
  id v4;
  RPSystemRecordSession *systemRecordSession;
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
    v10 = "-[RPClient stopSystemRecordingSessionWithHandler:]";
    v11 = 1024;
    v12 = 815;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping System Recording", buf, 0x12u);
  }
  systemRecordSession = self->_systemRecordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100034D40;
  v7[3] = &unk_100081390;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RPSystemRecordSession stopSystemRecordingWithHandler:](systemRecordSession, "stopSystemRecordingWithHandler:", v7);

}

- (void)stopSystemRecordingSessionWithURLHandler:(id)a3
{
  id v4;
  RPSystemRecordSession *systemRecordSession;
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
    v10 = "-[RPClient stopSystemRecordingSessionWithURLHandler:]";
    v11 = 1024;
    v12 = 831;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping System Recording with URL handler", buf, 0x12u);
  }
  systemRecordSession = self->_systemRecordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100034EF0;
  v7[3] = &unk_1000813B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RPSystemRecordSession stopSystemRecordingWithURLHandler:](systemRecordSession, "stopSystemRecordingWithURLHandler:", v7);

}

- (void)resumeSystemRecordingWithCompletionHandler:(id)a3
{
  id v4;
  RPSystemRecordSession *systemRecordSession;
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
    v10 = "-[RPClient resumeSystemRecordingWithCompletionHandler:]";
    v11 = 1024;
    v12 = 849;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  systemRecordSession = self->_systemRecordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000350C4;
  v7[3] = &unk_100081390;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RPSession resumeSessionWithWindowLayerContextID:completionHandler:](systemRecordSession, "resumeSessionWithWindowLayerContextID:completionHandler:", CFSTR("-1"), v7);

}

- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  RPSystemBroadcastSession *systemBroadcastSession;
  void *v17;
  uint64_t clientPID;
  void *v19;
  RPSystemBroadcastSession *v20;
  uint64_t v21;
  RPSystemBroadcastSession *v22;
  RPSystemBroadcastSession *v23;
  RPSystemBroadcastSession *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;

  v26 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPClient setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    v29 = 1024;
    v30 = 866;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  systemBroadcastSession = self->_systemBroadcastSession;
  if (systemBroadcastSession)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    clientPID = self->_clientPID;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:](systemBroadcastSession, "updateClientProxy:callingPID:bundleID:", v17, clientPID, v19);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[RPClient setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
      v29 = 1024;
      v30 = 869;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a system broadcast session, creating a new one", buf, 0x12u);
    }
    v20 = [RPSystemBroadcastSession alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    v21 = self->_clientPID;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    v22 = -[RPSystemBroadcastSession initWithClientProxy:callingPID:bundleID:delegate:](v20, "initWithClientProxy:callingPID:bundleID:delegate:", v17, v21, v19, self);
    v23 = self->_systemBroadcastSession;
    self->_systemBroadcastSession = v22;

  }
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPClient setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    v29 = 1024;
    v30 = 876;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setting up system broadcast session", buf, 0x12u);
  }
  v24 = self->_systemBroadcastSession;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
  -[RPSystemBroadcastSession setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:](v24, "setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:", v25, v12, v13, v14, v15);

}

- (void)startSystemBroadcastSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  RPSystemBroadcastSession *systemBroadcastSession;
  void *v19;
  uint64_t clientPID;
  void *v21;
  RPSystemBroadcastSession *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;

  v10 = a6;
  v11 = a5;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v26 = "-[RPClient startSystemBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:]";
    v27 = 1024;
    v28 = 881;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting system broadcast", buf, 0x12u);
  }
  systemBroadcastSession = self->_systemBroadcastSession;
  if (systemBroadcastSession)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientProxy](self, "clientProxy"));
    clientPID = self->_clientPID;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPClient clientBundleID](self, "clientBundleID"));
    -[RPSession updateClientProxy:callingPID:bundleID:](systemBroadcastSession, "updateClientProxy:callingPID:bundleID:", v19, clientPID, v21);

    v22 = self->_systemBroadcastSession;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000356B4;
    v23[3] = &unk_100081390;
    v23[4] = self;
    v24 = v17;
    -[RPSystemBroadcastSession startSystemBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:withHandler:](v22, "startSystemBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:withHandler:", v11, v10, v15, v16, v23, width, height);

  }
}

- (void)stopSystemBroadcastSessionWithHandler:(id)a3
{
  id v4;
  RPSystemBroadcastSession *systemBroadcastSession;
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
    v10 = "-[RPClient stopSystemBroadcastSessionWithHandler:]";
    v11 = 1024;
    v12 = 909;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping system broadcast", buf, 0x12u);
  }
  systemBroadcastSession = self->_systemBroadcastSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000358C8;
  v7[3] = &unk_100081390;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RPSystemBroadcastSession stopSystemBroadcastWithHandler:](systemBroadcastSession, "stopSystemBroadcastWithHandler:", v7);

}

- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3
{
  id v4;
  RPSystemBroadcastSession *systemBroadcastSession;
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
    v10 = "-[RPClient resumeSystemBroadcastWithCompletionHandler:]";
    v11 = 1024;
    v12 = 925;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  systemBroadcastSession = self->_systemBroadcastSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035A80;
  v7[3] = &unk_100081390;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RPSystemBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:](systemBroadcastSession, "resumeSessionWithWindowLayerContextID:completionHandler:", CFSTR("-1"), v7);

}

- (void)handleMemoryWarningForCurrentActiveSession
{
  void *captureSession;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPClient handleMemoryWarningForCurrentActiveSession]";
    v6 = 1024;
    v7 = 943;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136446466;
        v5 = "-[RPClient handleMemoryWarningForCurrentActiveSession]";
        v6 = 1024;
        v7 = 968;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d We don't have a current active session.", (uint8_t *)&v4, 0x12u);
      }
      return;
    case 1:
      captureSession = self->_captureSession;
      goto LABEL_13;
    case 2:
      captureSession = self->_recordSession;
      goto LABEL_13;
    case 3:
      captureSession = self->_broadcastSession;
      goto LABEL_13;
    case 5:
      captureSession = self->_systemRecordSession;
      goto LABEL_13;
    case 6:
      captureSession = self->_systemBroadcastSession;
LABEL_13:
      objc_msgSend(captureSession, "handleMemoryWarning");
      break;
    default:
      return;
  }
}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3;
  void *captureSession;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;

  v3 = *(_QWORD *)&a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPClient updateProcessIDForAudioCaptureWithPID:]";
    v8 = 1024;
    v9 = 973;
    v10 = 1024;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pid: %d", (uint8_t *)&v6, 0x18u);
  }
  switch(self->_currentActiveSession)
  {
    case 0:
      return;
    case 1:
      captureSession = self->_captureSession;
      goto LABEL_11;
    case 2:
      captureSession = self->_recordSession;
      goto LABEL_11;
    case 3:
      captureSession = self->_broadcastSession;
LABEL_11:
      objc_msgSend(captureSession, "updateProcessIDForAudioCaptureWithPID:", v3);
      break;
    default:
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100050650();
      break;
  }
}

- (void)beginPrivacyAccountingIntervalwithSource:(id)a3 withDestination:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PAAccessInterval *v12;
  PAAccessInterval *accessInterval;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PAApplication applicationWithType:identifier:](PAApplication, "applicationWithType:identifier:", 0, v7));
    if (v6)
    {
LABEL_3:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[PAApplication applicationWithType:identifier:](PAApplication, "applicationWithType:identifier:", 0, v6));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[PAAccessLogger sharedInstance](PAAccessLogger, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PAReplayKitAccess accessWithAccessor:fromBroadcaster:](PAReplayKitAccess, "accessWithAccessor:fromBroadcaster:", v9, v8));
      v12 = (PAAccessInterval *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "beginIntervalForAccess:", v11));
      accessInterval = self->_accessInterval;
      self->_accessInterval = v12;

      goto LABEL_8;
    }
  }
  else
  {
    v8 = 0;
    if (v6)
      goto LABEL_3;
  }
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000506CC();
LABEL_8:

}

- (void)endPrivacyAccountingInterval
{
  PAAccessInterval *accessInterval;
  PAAccessInterval *v4;

  accessInterval = self->_accessInterval;
  if (accessInterval)
  {
    -[PAAccessInterval end](accessInterval, "end");
    v4 = self->_accessInterval;
    self->_accessInterval = 0;

  }
}

+ (id)controlCenterManagerClient
{
  return 0;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleID, a3);
}

- (NSString)clientMainBundleID
{
  return self->_clientMainBundleID;
}

- (void)setClientMainBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clientMainBundleID, a3);
}

- (RPClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (int)clientPID
{
  return self->_clientPID;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientConnectionAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[4].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[3].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setClientConnectionAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientConnectionAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientConnectionAuditToken.val[4] = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_clientMainBundleID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
  objc_storeStrong((id *)&self->_accessInterval, 0);
  objc_storeStrong((id *)&self->_systemBroadcastSession, 0);
  objc_storeStrong((id *)&self->_systemRecordSession, 0);
  objc_storeStrong((id *)&self->_clipSession, 0);
  objc_storeStrong((id *)&self->_broadcastSession, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_recordSession, 0);
}

@end
