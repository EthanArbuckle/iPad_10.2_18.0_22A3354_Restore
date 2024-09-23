@implementation RPBroadcastSession

- (RPBroadcastSession)initWithClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5 delegate:(id)a6
{
  RPBroadcastSession *v6;
  NSURL *broadcastURL;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  RPBroadcastSession *v15;

  v9.receiver = self;
  v9.super_class = (Class)RPBroadcastSession;
  v6 = -[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:](&v9, "initWithClientProxy:sessionType:callingPID:bundleID:delegate:", a3, 3, *(_QWORD *)&a4, a5, a6);
  if (v6)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "-[RPBroadcastSession initWithClientProxy:callingPID:bundleID:delegate:]";
      v12 = 1024;
      v13 = 66;
      v14 = 2048;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    broadcastURL = v6->_broadcastURL;
    v6->_broadcastURL = 0;

  }
  return v6;
}

- (void)startBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 listenerEndpoint:(id)a7 handler:(id)a8
{
  double height;
  double width;
  _BOOL8 v12;
  _BOOL8 v13;
  id v15;
  id v16;
  void (**v17)(id, void *);
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  RPBroadcastSession *v25;
  __int16 v26;
  unsigned int v27;

  height = a6.height;
  width = a6.width;
  v12 = a4;
  v13 = a3;
  v15 = a5;
  v16 = a7;
  v17 = (void (**)(id, void *))a8;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v21 = "-[RPBroadcastSession startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:]";
    v22 = 1024;
    v23 = 74;
    v24 = 2048;
    v25 = self;
    v26 = 1024;
    v27 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p starting in session state %d", buf, 0x22u);
  }
  if (-[RPSession sessionState](self, "sessionState") != 3)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[RPBroadcastSession startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:]";
      v22 = 1024;
      v23 = 97;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempting to start broadcast session when session was not in stopped state", buf, 0x12u);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5830, 0));
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v18);
    if (!v17)
      goto LABEL_17;
LABEL_15:
    v17[2](v17, v18);
    goto LABEL_17;
  }
  v19.receiver = self;
  v19.super_class = (Class)RPBroadcastSession;
  -[RPSession startWithContextID:windowSize:](&v19, "startWithContextID:windowSize:", v15, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v13, v12, width, height));
  if (!v18)
  {
    -[RPBroadcastSession processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpoint:withHandler:](self, "processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v13, v12, v16, v17);
    goto LABEL_17;
  }
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000510A4();
  -[RPSession setSessionState:](self, "setSessionState:", 3);
  if (v17)
    goto LABEL_15;
LABEL_17:

}

- (void)stopBroadcastWithHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  _QWORD v6[5];
  void (**v7)(id, void *);
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  RPBroadcastSession *v13;
  __int16 v14;
  unsigned int v15;

  v4 = (void (**)(id, void *))a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v9 = "-[RPBroadcastSession stopBroadcastWithHandler:]";
    v10 = 1024;
    v11 = 109;
    v12 = 2048;
    v13 = self;
    v14 = 1024;
    v15 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", buf, 0x22u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 3
    || !-[RPSession sessionState](self, "sessionState")
    || -[RPSession sessionState](self, "sessionState") == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5829, 0));
    -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v5);
    if (v4)
      v4[2](v4, v5);

  }
  else
  {
    -[RPSession setSessionState:](self, "setSessionState:", 2);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003B300;
    v6[3] = &unk_100080E90;
    v6[4] = self;
    v7 = v4;
    -[RPBroadcastSession notifyExtensionOfAction:completion:](self, "notifyExtensionOfAction:completion:", 4, v6);

  }
}

- (void)disableBroadcast
{
  NSExtension *broadcastExtension;
  NSDictionary *broadcastUserInfo;
  RPBroadcastConfiguration *broadcastConfiguration;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPBroadcastSession disableBroadcast]";
    v8 = 1024;
    v9 = 142;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d disableBroadcast", (uint8_t *)&v6, 0x12u);
  }
  -[RPSession setSessionState:](self, "setSessionState:", 3);
  broadcastExtension = self->_broadcastExtension;
  self->_broadcastExtension = 0;

  broadcastUserInfo = self->_broadcastUserInfo;
  self->_broadcastUserInfo = 0;

  broadcastConfiguration = self->_broadcastConfiguration;
  self->_broadcastConfiguration = 0;

}

- (BOOL)isBroadcastSetup
{
  return self->_broadcastExtension && self->_broadcastUserInfo != 0;
}

- (void)updateBroadcastURL:(id)a3
{
  NSURL *v4;
  NSURL *broadcastURL;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  v4 = (NSURL *)a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPBroadcastSession updateBroadcastURL:]";
    v8 = 1024;
    v9 = 158;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  broadcastURL = self->_broadcastURL;
  self->_broadcastURL = v4;

}

- (void)processAcknowledgementSetupBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 listenerEndpoint:(id)a5 withHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136446466;
    v15 = "-[RPBroadcastSession processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpoint:withHandler:]";
    v16 = 1024;
    v17 = 163;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v14, 0x12u);
  }
  if (-[RPSession getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:](self, "getAcknowledgementAlertResultsWithMicrophone:cameraEnabled:", v8, v7))
  {
    if (-[RPBroadcastSession isBroadcastSetup](self, "isBroadcastSetup"))
    {
      -[RPBroadcastSession enableBroadcastStartCaptureWithListenerEndpoint:withHandler:](self, "enableBroadcastStartCaptureWithListenerEndpoint:withHandler:", v10, v11);
    }
    else
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136446466;
        v15 = "-[RPBroadcastSession processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpo"
              "int:withHandler:]";
        v16 = 1024;
        v17 = 177;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempted to start broadcast without a session, bailing out", (uint8_t *)&v14, 0x12u);
      }
      -[RPSession setSessionState:](self, "setSessionState:", 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5808, 0));
      -[RPSession reportSessionEndReason:](self, "reportSessionEndReason:", v13);
      if (v11)
        v11[2](v11, v13);

    }
  }
  else
  {
    -[RPBroadcastSession disableBroadcast](self, "disableBroadcast");
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5801, 0));
      v11[2](v11, v12);

    }
  }

}

- (void)enableBroadcastStartCaptureWithListenerEndpoint:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, void *);
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPBroadcastSession enableBroadcastStartCaptureWithListenerEndpoint:withHandler:]";
    v13 = 1024;
    v14 = 203;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d found broadcast info, enabling for session", buf, 0x12u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPBroadcastSession enableBroadcastWithListenerEndpoint:](self, "enableBroadcastWithListenerEndpoint:", v6));
  if (v8)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100051120();
    -[RPSession setSessionState:](self, "setSessionState:", 3);
    if (v7)
      v7[2](v7, v8);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[RPBroadcastSession enableBroadcastStartCaptureWithListenerEndpoint:withHandler:]";
      v13 = 1024;
      v14 = 216;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d broadcast started without error", buf, 0x12u);
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003BA04;
    v9[3] = &unk_100080E90;
    v9[4] = self;
    v10 = v7;
    -[RPBroadcastSession notifyExtensionOfAction:completion:](self, "notifyExtensionOfAction:completion:", 1, v9);

  }
}

- (void)startCaptureWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t callingPID;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[RPBroadcastSession startCaptureWithHandler:]";
    v19 = 1024;
    v20 = 233;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
  callingPID = self->super._callingPID;
  v7 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
  -[RPSession windowSize](self, "windowSize");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v12));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003BBE4;
  v15[3] = &unk_100081390;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  objc_msgSend(v5, "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:", self, callingPID, v7, 0, v13, v15, v9, v11);

}

- (void)pauseSession
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  RPBroadcastSession *v11;
  __int16 v12;
  unsigned int v13;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v7 = "-[RPBroadcastSession pauseSession]";
    v8 = 1024;
    v9 = 255;
    v10 = 2048;
    v11 = self;
    v12 = 1024;
    v13 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p pausing in session state %d", buf, 0x22u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
    objc_msgSend(v3, "stopCaptureForDelegate:", self);

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003BE94;
    v5[3] = &unk_100080E00;
    v5[4] = self;
    -[RPBroadcastSession notifyExtensionOfAction:completion:](self, "notifyExtensionOfAction:completion:", 2, v5);
    v4.receiver = self;
    v4.super_class = (Class)RPBroadcastSession;
    -[RPSession pauseSession](&v4, "pauseSession");
  }
}

- (void)resumeSessionWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  RPBroadcastSession *v17;
  __int16 v18;
  unsigned int v19;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v13 = "-[RPBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:]";
    v14 = 1024;
    v15 = 270;
    v16 = 2048;
    v17 = self;
    v18 = 1024;
    v19 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  v10[1] = 3221225472;
  v10[2] = sub_10003C030;
  v10[3] = &unk_100080E68;
  v11 = v7;
  v9.receiver = self;
  v9.super_class = (Class)RPBroadcastSession;
  v10[0] = _NSConcreteStackBlock;
  v8 = v7;
  -[RPSession resumeSessionWithWindowLayerContextID:completionHandler:](&v9, "resumeSessionWithWindowLayerContextID:completionHandler:", v6, v10);
  -[RPBroadcastSession notifyExtensionOfAction:completion:](self, "notifyExtensionOfAction:completion:", 3, &stru_100081F18);

}

- (id)enableBroadcastWithListenerEndpoint:(id)a3
{
  id v4;
  RPBroadcastExtensionProxy *v5;
  RPBroadcastExtensionProxy *broadcastUploadExtensionProxy;
  RPBroadcastExtensionProxy *v7;
  RPBroadcastExtensionProxy *v8;
  dispatch_semaphore_t v9;
  RPBroadcastExtensionProxy *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  RPBroadcastExtensionProxy *v19;
  RPBroadcastSession *v20;
  id location;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v23 = "-[RPBroadcastSession enableBroadcastWithListenerEndpoint:]";
    v24 = 1024;
    v25 = 281;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d enableBroadcastWithExtension", buf, 0x12u);
  }
  objc_initWeak(&location, self);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v23 = "-[RPBroadcastSession enableBroadcastWithListenerEndpoint:]";
    v24 = 1024;
    v25 = 288;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setting up extension proxy", buf, 0x12u);
  }
  if (v4)
  {
    v5 = -[RPBroadcastExtensionProxy initWithBroadcastUploadListenerEndpoint:]([RPBroadcastExtensionProxy alloc], "initWithBroadcastUploadListenerEndpoint:", v4);
    broadcastUploadExtensionProxy = self->_broadcastUploadExtensionProxy;
    self->_broadcastUploadExtensionProxy = v5;
  }
  else
  {
    v7 = -[RPBroadcastExtensionProxy initWithBroadcastUploadExtension:]([RPBroadcastExtensionProxy alloc], "initWithBroadcastUploadExtension:", self->_broadcastExtension);
    v8 = self->_broadcastUploadExtensionProxy;
    self->_broadcastUploadExtensionProxy = v7;

    v9 = dispatch_semaphore_create(0);
    v10 = self->_broadcastUploadExtensionProxy;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003C460;
    v18[3] = &unk_100080FF0;
    broadcastUploadExtensionProxy = v9;
    v19 = broadcastUploadExtensionProxy;
    v20 = self;
    -[RPBroadcastExtensionProxy establishConnectionWithHandler:](v10, "establishConnectionWithHandler:", v18);
    dispatch_semaphore_wait(&broadcastUploadExtensionProxy->super, 0xFFFFFFFFFFFFFFFFLL);

  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003C54C;
  v16[3] = &unk_100081600;
  objc_copyWeak(&v17, &location);
  -[RPBroadcastExtensionProxy setServiceInfoHandler:](self->_broadcastUploadExtensionProxy, "setServiceInfoHandler:", v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003C594;
  v14[3] = &unk_100081BF8;
  objc_copyWeak(&v15, &location);
  -[RPBroadcastExtensionProxy setBroadcastURLHandler:](self->_broadcastUploadExtensionProxy, "setBroadcastURLHandler:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003C5DC;
  v12[3] = &unk_1000811D0;
  objc_copyWeak(&v13, &location);
  -[RPBroadcastExtensionProxy setErrorHandler:](self->_broadcastUploadExtensionProxy, "setErrorHandler:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return 0;
}

- (void)handleBroadcastServiceInfo:(id)a3
{
  -[RPClientProtocol updateBroadcastServiceInfo:](self->super._clientProxy, "updateBroadcastServiceInfo:", a3);
}

- (void)handleBroadcastURL:(id)a3
{
  -[RPClientProtocol updateBroadcastURL:](self->super._clientProxy, "updateBroadcastURL:", a3);
}

- (void)handleBroadcastError:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPBroadcastSession handleBroadcastError:]";
    v9 = 1024;
    v10 = 335;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d error %@", buf, 0x1Cu);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003C798;
    v5[3] = &unk_100080FF0;
    v5[4] = self;
    v6 = v4;
    -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v5);

  }
}

- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  RPBroadcastSession *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "-[RPBroadcastSession setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    v28 = 1024;
    v29 = 346;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle baseIdentifier:](NSBundle, "baseIdentifier:", v13));
  -[RPBroadcastSession setBroadcastHostBundleId:](self, "setBroadcastHostBundleId:", v17);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003C998;
  v21[3] = &unk_100081C20;
  v22 = v14;
  v23 = self;
  v24 = v15;
  v25 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  -[RPBroadcastSession loadBroadcastUploadExtensionWithBaseIdentifier:withHandler:](self, "loadBroadcastUploadExtensionWithBaseIdentifier:withHandler:", v17, v21);

}

- (void)loadBroadcastUploadExtensionWithBaseIdentifier:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;

  v5 = a3;
  v6 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPBroadcastSession loadBroadcastUploadExtensionWithBaseIdentifier:withHandler:]";
    v14 = 1024;
    v15 = 378;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d looking for upload extension", buf, 0x12u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003CC3C;
  v9[3] = &unk_100081F40;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  +[NSExtension extensionsWithMatchingPointName:baseIdentifier:completion:](NSExtension, "extensionsWithMatchingPointName:baseIdentifier:completion:", CFSTR("com.apple.broadcast-services-upload"), v7, v9);

}

- (id)dispatchCaptureQueue
{
  if (qword_100095CD8 != -1)
    dispatch_once(&qword_100095CD8, &stru_100081F60);
  return (id)qword_100095CD0;
}

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  uint64_t v7;
  RPBroadcastSession *v9;
  opaqueCMSampleBuffer *v10;
  uint64_t v11;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;

  v7 = *(_QWORD *)&a3;
  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
    -[RPSession updateReportingSampleCount:](self, "updateReportingSampleCount:", v7);
    if ((_DWORD)v7 == 2)
    {
      if (!-[RPSession microphoneEnabled](self, "microphoneEnabled"))
      {
        DataBuffer = CMSampleBufferGetDataBuffer(a4);
        DataLength = CMBlockBufferGetDataLength(DataBuffer);
        CMBlockBufferFillDataBytes(0, DataBuffer, 0, DataLength);
      }
      v9 = self;
      v10 = a4;
      v11 = 3;
    }
    else
    {
      if ((_DWORD)v7 != 1)
      {
        if (!(_DWORD)v7)
          -[RPBroadcastSession processSampleBuffer:transformFlags:](self, "processSampleBuffer:transformFlags:", a4, a5);
        return;
      }
      v9 = self;
      v10 = a4;
      v11 = 2;
    }
    -[RPBroadcastSession notifyExtensionOfAudioSampleBuffer:withType:](v9, "notifyExtensionOfAudioSampleBuffer:withType:", v10, v11);
  }
}

- (void)captureDidFailWithError:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  RPBroadcastSession *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003CF5C;
  v5[3] = &unk_100080FF0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v5);

}

- (BOOL)showAlertForBroadcastSessionWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __CFUserNotification *v19;
  __CFUserNotification *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v51;
  _QWORD v52[4];
  _QWORD v53[4];
  _BYTE buf[12];
  __int16 v55;
  int v56;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain")), v6, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedFailureReason"));

    if (v7)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedFailureReason"));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
    v10 = (void *)v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_FAILED_ALERT_MESSAGE_FORMAT")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension infoDictionary](self->_broadcastExtension, "infoDictionary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", _kCFBundleDisplayNameKey));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v13, v10));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_STATUSBAR_TAPPED_ALERT_TITLE")));
    v16 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_FAILED_ALERT_OK_BUTTON")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_FAILED_ALERT_GO_TO_APP_BUTTON")));
    v52[0] = kCFUserNotificationAlertHeaderKey;
    v52[1] = kCFUserNotificationAlertMessageKey;
    v53[0] = v15;
    v53[1] = v16;
    v52[2] = kCFUserNotificationOtherButtonTitleKey;
    v52[3] = kCFUserNotificationDefaultButtonTitleKey;
    v53[2] = v17;
    v53[3] = v18;
    v19 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 4));
    if (v19)
    {
      v20 = v19;
      *(_QWORD *)buf = 0;
      CFUserNotificationReceiveResponse(v19, 0.0, (CFOptionFlags *)buf);
      if (*(_QWORD *)buf == 2)
      {
        v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v42)
          sub_1000513A8(v42, v43, v44, v45, v46, v47, v48, v49);
      }
      else if (!*(_QWORD *)buf)
      {
        v51 = v10;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension identifier](self->_broadcastExtension, "identifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[LSPlugInKitProxy pluginKitProxyForIdentifier:](LSPlugInKitProxy, "pluginKitProxyForIdentifier:", v21));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "containingBundle"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bundleIdentifier"));

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        objc_msgSend(v25, "openApplicationWithBundleID:", v24);

        v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v26)
          sub_100051334(v26, v27, v28, v29, v30, v31, v32, v33);

        v10 = v51;
      }
      CFRelease(v20);
    }
    else
    {
      v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v34)
        sub_1000512C0(v34, v35, v36, v37, v38, v39, v40, v41);
    }

    v9 = 0;
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[RPBroadcastSession showAlertForBroadcastSessionWithError:]";
      v55 = 1024;
      v56 = 456;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not showing the alert, as there is no error or the error domain is nil", buf, 0x12u);
    }
    v9 = 1;
  }

  return v9;
}

- (BOOL)showResumeBroadcastAlert
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __CFUserNotification *v12;
  __CFUserNotification *v13;
  const char *v14;
  CFOptionFlags responseFlags;
  _QWORD v17[4];
  _QWORD v18[4];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[RPBroadcastSession showResumeBroadcastAlert]";
    v21 = 1024;
    v22 = 521;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!-[RPSession shouldBypassAlertForTest](self, "shouldBypassAlertForTest"))
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "-[RPBroadcastSession showResumeBroadcastAlert]";
      v21 = 1024;
      v22 = 527;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_RESUME_ALERT_MESSAGE_FORMAT")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension infoDictionary](self->_broadcastExtension, "infoDictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", _kCFBundleDisplayNameKey));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_STATUSBAR_TAPPED_ALERT_TITLE")));
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_STATUSBAR_TAPPED_ALERT_DECLINE_BUTTON")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_ACTIVITIES_PREFERRED_ACCEPT_BUTTON")));
    v17[0] = kCFUserNotificationAlertHeaderKey;
    v17[1] = kCFUserNotificationAlertMessageKey;
    v18[0] = v8;
    v18[1] = v9;
    v17[2] = kCFUserNotificationOtherButtonTitleKey;
    v17[3] = kCFUserNotificationDefaultButtonTitleKey;
    v18[2] = v10;
    v18[3] = v11;
    v12 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
    if (!v12)
    {
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10005141C();
      v3 = 0;
      goto LABEL_24;
    }
    v13 = v12;
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v12, 0.0, &responseFlags);
    v3 = responseFlags == 0;
    if (responseFlags)
    {
      if (responseFlags != 2
        || dword_100095B40 > 1
        || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136446466;
      v20 = "-[RPBroadcastSession showResumeBroadcastAlert]";
      v21 = 1024;
      v22 = 560;
      v14 = " [INFO] %{public}s:%d declined resume broadcast";
    }
    else
    {
      if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_DWORD *)buf = 136446466;
      v20 = "-[RPBroadcastSession showResumeBroadcastAlert]";
      v21 = 1024;
      v22 = 558;
      v14 = " [INFO] %{public}s:%d accepted resume broadcast";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, 0x12u);
LABEL_23:
    CFRelease(v13);
LABEL_24:

    return v3;
  }
  return 1;
}

- (void)processSampleBufferForStreaming:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4
{
  -[RPBroadcastSession processSampleBuffer:transformFlags:](self, "processSampleBuffer:transformFlags:", a3, a4);
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4
{
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[RPBroadcastSession processSampleBuffer:transformFlags:]";
    v9 = 1024;
    v10 = 590;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d processing sample buffer for streaming", (uint8_t *)&v7, 0x12u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 4)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136446466;
      v8 = "-[RPBroadcastSession processSampleBuffer:transformFlags:]";
      v9 = 1024;
      v10 = 593;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session is paused discard sample", (uint8_t *)&v7, 0x12u);
    }
  }
  else
  {
    -[RPBroadcastSession notifyExtensionOfVideoSampleBuffer:withType:sampleOrientation:](self, "notifyExtensionOfVideoSampleBuffer:withType:sampleOrientation:", a3, 1, -[RPBroadcastSession orientationFromFigTransform:](self, "orientationFromFigTransform:", a4));
  }
}

- (void)notifyExtensionOfAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  opaqueCMSampleBuffer *v14;

  if (self->_broadcastExtension)
  {
    if (self->_broadcastUploadExtensionProxy)
    {
      if (!-[RPSession dispatchLimitReached:](self, "dispatchLimitReached:", a4))
      {
        if (a3)
          CFRetain(a3);
        v7 = sub_100046C34(a3, a4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v9 = objc_claimAutoreleasedReturnValue(-[RPBroadcastSession broadcastSessionAudioQueue](self, "broadcastSessionAudioQueue"));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10003DA64;
        v11[3] = &unk_100081CE0;
        v11[4] = self;
        v12 = v8;
        v13 = a4;
        v14 = a3;
        v10 = v8;
        dispatch_async(v9, v11);

      }
    }
    else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100051514();
    }
  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100051498();
  }
}

- (void)notifyExtensionOfVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4 sampleOrientation:(unsigned int)a5
{
  uint64_t v6;
  void *v9;
  void *v10;
  void *v11;
  CVImageBufferRef ImageBuffer;
  IOSurfaceRef IOSurface;
  RPIOSurfaceObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  const char *v18;
  _QWORD v19[5];
  id v20;
  opaqueCMSampleBuffer *v21;
  int64_t v22;
  CMSampleTimingInfo timingInfoOut;

  if (!self->_broadcastExtension)
  {
    if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      return;
    LODWORD(timingInfoOut.duration.value) = 136446466;
    *(CMTimeValue *)((char *)&timingInfoOut.duration.value + 4) = (CMTimeValue)"-[RPBroadcastSession notifyExtensionOfVid"
                                                                               "eoSampleBuffer:withType:sampleOrientation:]";
    LOWORD(timingInfoOut.duration.flags) = 1024;
    *(CMTimeFlags *)((char *)&timingInfoOut.duration.flags + 2) = 640;
    v18 = " [INFO] %{public}s:%d no broadcast extension found!";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&timingInfoOut, 0x12u);
    return;
  }
  if (!self->_broadcastUploadExtensionProxy)
  {
    if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      return;
    LODWORD(timingInfoOut.duration.value) = 136446466;
    *(CMTimeValue *)((char *)&timingInfoOut.duration.value + 4) = (CMTimeValue)"-[RPBroadcastSession notifyExtensionOfVid"
                                                                               "eoSampleBuffer:withType:sampleOrientation:]";
    LOWORD(timingInfoOut.duration.flags) = 1024;
    *(CMTimeFlags *)((char *)&timingInfoOut.duration.flags + 2) = 645;
    v18 = " [INFO] %{public}s:%d broadcast extension not ready";
    goto LABEL_13;
  }
  v6 = *(_QWORD *)&a5;
  if (!-[RPSession dispatchLimitReached:](self, "dispatchLimitReached:", a4))
  {
    if (a3)
      CFRetain(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("RPSampleBufferVideoOrientation"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("RPBroadcastProcessExtensionPayloadKeySampleType"));

    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    CFRetain(ImageBuffer);
    IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    v14 = objc_alloc_init(RPIOSurfaceObject);
    -[RPIOSurfaceObject setIOSurface:](v14, "setIOSurface:", IOSurface);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("RPBroadcastProcessExtensionPayloadKeyIOSurface"));
    memset(&timingInfoOut, 0, sizeof(timingInfoOut));
    CMSampleBufferGetSampleTimingInfo(a3, 0, &timingInfoOut);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &timingInfoOut, 72));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("RPBroadcastProcessExtensionPayloadKeyTimingInfo"));
    v16 = objc_claimAutoreleasedReturnValue(-[RPBroadcastSession broadcastSessionVideoQueue](self, "broadcastSessionVideoQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003DED4;
    v19[3] = &unk_100081CE0;
    v19[4] = self;
    v20 = v9;
    v21 = a3;
    v22 = a4;
    v17 = v9;
    dispatch_async(v16, v19);

    CFRelease(ImageBuffer);
  }
}

- (void)notifyExtensionOfAction:(int64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  RPBroadcastExtensionProxy *broadcastUploadExtensionProxy;
  NSObject *v11;
  dispatch_time_t v12;
  const char *v13;
  RPBroadcastExtensionProxy *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;

  v6 = (void (**)(_QWORD))a4;
  if (!self->_broadcastExtension)
  {
    if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136446466;
    v20 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
    v21 = 1024;
    v22 = 691;
    v13 = " [INFO] %{public}s:%d no broadcast extension found!";
    goto LABEL_15;
  }
  if (!self->_broadcastUploadExtensionProxy)
  {
    if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136446466;
    v20 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
    v21 = 1024;
    v22 = 697;
    v13 = " [INFO] %{public}s:%d broadcast extension not ready";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, 0x12u);
LABEL_16:
    v6[2](v6);
    goto LABEL_19;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("RPBroadcastProcessExtensionPayloadKeyActionType"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_broadcastUserInfo, CFSTR("RPBroadcastExtensionKeyExtensionUserInfo"));
  if (a3 == 4)
  {
    v9 = dispatch_semaphore_create(0);
    broadcastUploadExtensionProxy = self->_broadcastUploadExtensionProxy;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003E32C;
    v15[3] = &unk_100080E00;
    v11 = v9;
    v16 = v11;
    -[RPBroadcastExtensionProxy processPayload:completion:](broadcastUploadExtensionProxy, "processPayload:completion:", v7, v15);
    v12 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v11, v12)
      && dword_100095B40 <= 2
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100051590();
    }
    v6[2](v6);

  }
  else
  {
    v14 = self->_broadcastUploadExtensionProxy;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003E320;
    v17[3] = &unk_100081A00;
    v18 = v6;
    -[RPBroadcastExtensionProxy processPayload:completion:](v14, "processPayload:completion:", v7, v17);
    v11 = v18;
  }

LABEL_19:
}

- (id)broadcastSessionAudioQueue
{
  if (qword_100095CE8 != -1)
    dispatch_once(&qword_100095CE8, &stru_100081F80);
  return (id)qword_100095CE0;
}

- (id)broadcastSessionVideoQueue
{
  if (qword_100095CF8 != -1)
    dispatch_once(&qword_100095CF8, &stru_100081FA0);
  return (id)qword_100095CF0;
}

- (unsigned)orientationFromFigTransform:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return 1;
  else
    return dword_10005E220[a3 - 1];
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t callingPID;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  RPBroadcastSession *v22;
  __int16 v23;
  unsigned int v24;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPBroadcastSession handleResumeCaptureWithCompletionHandler:]";
    v19 = 1024;
    v20 = 804;
    v21 = 2048;
    v22 = self;
    v23 = 1024;
    v24 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  self->super._sessionIsResuming = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](RPCaptureManager, "sharedInstance"));
  callingPID = self->super._callingPID;
  v7 = -[RPSession microphoneEnabled](self, "microphoneEnabled");
  -[RPSession windowSize](self, "windowSize");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession contextID](self, "contextID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v12));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003E684;
  v15[3] = &unk_100081390;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  objc_msgSend(v5, "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:", self, callingPID, v7, 0, v13, v15, v9, v11);

}

- (void)handleClientApplicationDidEnterBackground
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  unsigned int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446722;
    v4 = "-[RPBroadcastSession handleClientApplicationDidEnterBackground]";
    v5 = 1024;
    v6 = 824;
    v7 = 1024;
    v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  -[RPBroadcastSession pauseSession](self, "pauseSession");
}

- (void)handleClientApplicationDidEnterForeground
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  unsigned int v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]";
    v6 = 1024;
    v7 = 831;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 4)
  {
    if (-[RPBroadcastSession showResumeBroadcastAlert](self, "showResumeBroadcastAlert"))
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v5 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]";
        v6 = 1024;
        v7 = 835;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume", buf, 0x12u);
      }
      -[RPClientProtocol shouldResumeSessionType:](self->super._clientProxy, "shouldResumeSessionType:", CFSTR("RPInAppBroadcast"));
    }
    else
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v5 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]";
        v6 = 1024;
        v7 = 838;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop", buf, 0x12u);
      }
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_10003EA94;
      v3[3] = &unk_100081698;
      v3[4] = self;
      -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v3);
    }
  }
}

- (void)handleDisplayWarning
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  unsigned int v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPBroadcastSession handleDisplayWarning]";
    v6 = 1024;
    v7 = 850;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003EC98;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v3);
  }
}

- (void)handleDeviceLockedWarning
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  unsigned int v8;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446722;
    v4 = "-[RPBroadcastSession handleDeviceLockedWarning]";
    v5 = 1024;
    v6 = 861;
    v7 = 1024;
    v8 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
}

- (void)handleDeviceRestrictionWarning
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  unsigned int v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPBroadcastSession handleDeviceRestrictionWarning]";
    v6 = 1024;
    v7 = 879;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003EF74;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v3);
  }
}

- (void)handleResumeContextIDFailure
{
  _QWORD v3[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  unsigned int v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPBroadcastSession handleResumeContextIDFailure]";
    v6 = 1024;
    v7 = 891;
    v8 = 1024;
    v9 = -[RPSession sessionState](self, "sessionState");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if (-[RPSession sessionState](self, "sessionState") == 1 || -[RPSession sessionState](self, "sessionState") == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003F178;
    v3[3] = &unk_100081698;
    v3[4] = self;
    -[RPBroadcastSession stopBroadcastWithHandler:](self, "stopBroadcastWithHandler:", v3);
  }
}

- (NSDictionary)extensionInfo
{
  return self->_extensionInfo;
}

- (void)setExtensionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_extensionInfo, a3);
}

- (RPBroadcastConfiguration)broadcastConfiguration
{
  return self->_broadcastConfiguration;
}

- (void)setBroadcastConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastConfiguration, a3);
}

- (NSString)broadcastHostBundleId
{
  return self->_broadcastHostBundleId;
}

- (void)setBroadcastHostBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastHostBundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcastHostBundleId, 0);
  objc_storeStrong((id *)&self->_broadcastConfiguration, 0);
  objc_storeStrong((id *)&self->_extensionInfo, 0);
  objc_storeStrong((id *)&self->_broadcastUploadExtensionProxy, 0);
  objc_storeStrong((id *)&self->_broadcastUserInfo, 0);
  objc_storeStrong((id *)&self->_broadcastExtension, 0);
  objc_storeStrong((id *)&self->_broadcastURL, 0);
}

@end
