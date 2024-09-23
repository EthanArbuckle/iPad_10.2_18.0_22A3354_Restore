@implementation RPRecordingManager

- (RPRecordingManager)initWithConnectionManager:(id)a3
{
  id v4;
  RPRecordingManager *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  RPRecordingManager *v17;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPRecordingManager;
  v5 = -[RPRecordingManager init](&v11, "init");
  if (v5)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "-[RPRecordingManager initWithConnectionManager:]";
      v14 = 1024;
      v15 = 159;
      v16 = 2048;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    -[RPRecordingManager setConnectionManager:](v5, "setConnectionManager:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[RPRecordingManager setCurrentAvailableExtensions:](v5, "setCurrentAvailableExtensions:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[RPRecordingManager setStreamUpdateFilterTimers:](v5, "setStreamUpdateFilterTimers:", v7);

    v8 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.ReplayKitNotifications"));
    -[RPRecordingManager setUserNotificationCenter:](v5, "setUserNotificationCenter:", v8);

    -[UNUserNotificationCenter setDelegate:](v5->_userNotificationCenter, "setDelegate:", v5);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v5->_userNotificationCenter, "setWantsNotificationResponsesDelivered");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v9, "_srSetupTempDirectory");

    -[RPRecordingManager setUpMemoryPressureNotification](v5, "setUpMemoryPressureNotification");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  RPRecordingManager *v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPRecordingManager dealloc]";
    v6 = 1024;
    v7 = 196;
    v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPRecordingManager;
  -[RPRecordingManager dealloc](&v3, "dealloc");
}

- (void)setUpMemoryPressureNotification
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  RPRecordingManager *v14;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v10 = "-[RPRecordingManager setUpMemoryPressureNotification]";
    v11 = 1024;
    v12 = 207;
    v13 = 2048;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100012E70;
  v8[3] = &unk_1000812A8;
  v8[4] = self;
  v3 = objc_retainBlock(v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012F58;
  v7[3] = &unk_1000812A8;
  v7[4] = self;
  v4 = objc_retainBlock(v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000130FC;
  v6[3] = &unk_1000812A8;
  v6[4] = self;
  v5 = objc_retainBlock(v6);
  CacheDeleteRegisterInfoCallbacks(CFSTR("com.apple.replayd-cache-delete"), v3, v4, &stru_1000812C8, v5);

}

- (BOOL)volumeMatchesCachePath:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("/private/var/mobile"));
}

- (id)purgeable:(id)a3 urgency:(int)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"), *(_QWORD *)&a4));
  if (-[RPRecordingManager volumeMatchesCachePath:](self, "volumeMatchesCachePath:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = objc_msgSend(v6, "_srSizeOfTempDir:", 0);

  }
  else
  {
    v7 = 0;
  }
  v11[0] = CFSTR("CACHE_DELETE_VOLUME");
  v11[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v12[0] = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v7));
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));

  return v9;
}

- (id)purge:(id)a3 urgency:(int)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME")));
  if (-[RPRecordingManager volumeMatchesCachePath:](self, "volumeMatchesCachePath:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = objc_msgSend(v7, "_srSizeOfTempDir:", 0);

    if (a4 >= 3)
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v18 = "-[RPRecordingManager purge:urgency:]";
        v19 = 1024;
        v20 = 255;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d cacheDeleteUrgencyHigh", buf, 0x12u);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
      objc_msgSend(v9, "handleMemoryWarningForCurrentActiveSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _scUserErrorForCode:userInfo:](NSError, "_scUserErrorForCode:userInfo:", -3805, 0));
      objc_msgSend(v10, "stopAllClientStreamsWithError:", v11);

    }
  }
  else
  {
    v8 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v8, CFSTR("CACHE_DELETE_VOLUME"), CFSTR("CACHE_DELETE_AMOUNT"), v6));
  v16[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, &v15, 2));

  return v13;
}

- (id)periodic:(id)a3 urgency:(int)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"), *(_QWORD *)&a4));
  if (-[RPRecordingManager volumeMatchesCachePath:](self, "volumeMatchesCachePath:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = objc_msgSend(v6, "_srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:", 1, 86400.0);

  }
  else
  {
    v7 = 0;
  }
  v11[0] = CFSTR("CACHE_DELETE_VOLUME");
  v11[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v12[0] = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v7));
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));

  return v9;
}

- (void)connectionManagerDidAcceptNewConnection:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  RPClientProxy *v9;
  id v10;
  RPClient *v11;
  RPClientProxy *v12;
  RPClient *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getClientWithBundleID:", v5));

  if (v8)
  {
    v9 = -[RPClientProxy initWithConnection:]([RPClientProxy alloc], "initWithConnection:", v6);
    objc_msgSend(v8, "setClientProxy:", v9);

    v10 = objc_msgSend(v6, "processIdentifier");
    objc_msgSend(v8, "setClientPID:", v10);
  }
  else
  {
    v11 = [RPClient alloc];
    v12 = -[RPClientProxy initWithConnection:]([RPClientProxy alloc], "initWithConnection:", v6);
    v13 = -[RPClient initWithConnection:clientProxy:bundleIdentifier:](v11, "initWithConnection:clientProxy:bundleIdentifier:", v6, v12, v5);

    if (v13)
    {
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136446466;
        v16 = "-[RPRecordingManager connectionManagerDidAcceptNewConnection:bundleIdentifier:]";
        v17 = 1024;
        v18 = 317;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d client created and adding to client manager", (uint8_t *)&v15, 0x12u);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
      objc_msgSend(v14, "addClient:", v13);

    }
    else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004D460();
    }

  }
}

- (void)applicationDisconnectedWithBundleID:(id)a3 withProcessIdentifier:(int)a4
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordingManager: applicationDisconnected", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getClientWithBundleID:", v4));

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100013988;
    v7[3] = &unk_1000812F0;
    v8 = v6;
    objc_msgSend(v8, "stopCurrentActiveSessionWithHandler:", v7);

  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPRecordingManager applicationDisconnectedWithBundleID:withProcessIdentifier:]";
    v11 = 1024;
    v12 = 352;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d client disconnected, RPClient representation not found or removed", buf, 0x12u);
  }

}

- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  BOOL v24;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100013B88;
  v18[3] = &unk_100081340;
  v18[4] = self;
  v19 = v13;
  v21 = width;
  v22 = height;
  v23 = a5;
  v24 = a6;
  v20 = v14;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v15, "stopAllClientsWithHandler:", v18);

}

- (void)stopInAppRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013D38;
  v7[3] = &unk_100081368;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopInAppRecordingSessionWithHandler:", v7);

}

- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPRecordingManager stopInAppRecordingWithUrl:handler:]";
    v16 = 1024;
    v17 = 510;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013EA8;
  v11[3] = &unk_1000813B8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "stopInAppRecordingSessionWithHandler:", v11);

}

- (void)pauseInAppRecording
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  objc_msgSend(v2, "pauseInAppRecording");

}

- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001417C;
  v10[3] = &unk_100081318;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "resumeInAppRecordingWithContextID:completionHandler:", v7, v10);

}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  objc_msgSend(v5, "discardInAppRecordingWithHandler:", v4);

}

- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  BOOL v24;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000142C8;
  v18[3] = &unk_100081340;
  v18[4] = self;
  v19 = v13;
  v21 = width;
  v22 = height;
  v23 = a5;
  v24 = a6;
  v20 = v14;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v15, "stopAllClientsWithHandler:", v18);

}

- (void)stopInAppCaptureWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014478;
  v7[3] = &unk_100080E68;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopInAppCaptureSessionWithHandler:", v7);

}

- (void)pauseInAppCapture
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  objc_msgSend(v2, "pauseInAppCapture");

}

- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014564;
  v10[3] = &unk_100081318;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "resumeInAppCaptureWithContextID:completionHandler:", v7, v10);

}

- (void)createNewBroadcastClientWithBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 isSystemBroadcast:(BOOL)a7 handler:(id)a8
{
  _BOOL8 v9;
  RPClient *v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *);
  RPClient *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  RPClient *v28;

  v9 = a7;
  v14 = (RPClient *)a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, void *))a8;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v24 = "-[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationDat"
          "a:userInfo:isSystemBroadcast:handler:]";
    v25 = 1024;
    v26 = 625;
    v27 = 2112;
    v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Calling client doesn't not exist, we need to create a new client with bundleID: %@", buf, 0x1Cu);
  }
  v19 = -[RPClient initWithConnection:clientProxy:bundleIdentifier:]([RPClient alloc], "initWithConnection:clientProxy:bundleIdentifier:", 0, 0, v14);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v24 = "-[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationDat"
          "a:userInfo:isSystemBroadcast:handler:]";
    v25 = 1024;
    v26 = 629;
    v27 = 2112;
    v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d client created: %@", buf, 0x1Cu);
  }
  if (v19)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v24 = "-[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationD"
            "ata:userInfo:isSystemBroadcast:handler:]";
      v25 = 1024;
      v26 = 631;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d client created and adding to client manager", buf, 0x12u);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
    objc_msgSend(v20, "addClient:", v19);

    -[RPRecordingManager updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:](self, "updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:", v19, v14, v15, v16, v17, v9, v18);
  }
  else
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004D5D4();
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5808, 0));
    if (v9)
      v22 = CFSTR("SystemBroadcast");
    else
      v22 = CFSTR("InAppBroadcast");
    +[RPReportingAgent reportSessionEnded:endReason:withServiceName:clientBundleId:](RPReportingAgent, "reportSessionEnded:endReason:withServiceName:clientBundleId:", 2, v21, v22, v14);
    if (v18)
      v18[2](v18, v21);

  }
}

- (void)updateClient:(id)a3 withHostBundleID:(id)a4 broadcastExtensionBundleID:(id)a5 broadcastConfigurationData:(id)a6 userInfo:(id)a7 isSystemBroadcast:(BOOL)a8 handler:(id)a9
{
  _BOOL4 v9;
  id v15;
  void *v16;
  id *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a8;
  v15 = a9;
  v16 = v15;
  if (v9)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000149B4;
    v20[3] = &unk_100080E68;
    v17 = &v21;
    v21 = v15;
    objc_msgSend(a3, "setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:", a4, a5, a6, a7, v20);
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100014A28;
    v18[3] = &unk_100080E68;
    v17 = &v19;
    v19 = v15;
    objc_msgSend(a3, "setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:", a5, a6, a7, v18);
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
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[RPRecordingManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    v21 = 1024;
    v22 = 686;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Getting client and setting up broadcast", buf, 0x12u);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getClientForBroadcastWithHostBundleID:", v12));

  if (v18)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "-[RPRecordingManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:us"
            "erInfo:handler:]";
      v21 = 1024;
      v22 = 695;
      v23 = 2112;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Calling set up in app broadcast on client: %@", buf, 0x1Cu);
    }
    -[RPRecordingManager updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:](self, "updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:", v18, v12, v13, v14, v15, 0, v16);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "-[RPRecordingManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:us"
            "erInfo:handler:]";
      v21 = 1024;
      v22 = 691;
      v23 = 2112;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Calling client doesn't not exist, we need to create a new client with bundleID: %@", buf, 0x1Cu);
    }
    -[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:](self, "createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:", v12, v13, v14, v15, 0, v16);
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
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  CGFloat v26;
  CGFloat v27;
  BOOL v28;
  BOOL v29;

  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100014E4C;
  v22[3] = &unk_1000813E0;
  v22[4] = self;
  v23 = v15;
  v26 = width;
  v27 = height;
  v28 = a5;
  v29 = a6;
  v24 = v16;
  v25 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  objc_msgSend(v18, "stopAllClientsWithHandler:", v22);

}

- (void)stopInAppBroadcastWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001511C;
  v7[3] = &unk_100080E68;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopInAppBroadcastSessionWithHandler:", v7);

}

- (void)pauseInAppBroadcast
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  objc_msgSend(v2, "pauseInAppBroadcast");

}

- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100015308;
  v10[3] = &unk_100081318;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "resumeInAppBroadcastWithContextID:completionHandler:", v7, v10);

}

- (void)setBroadcastURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  objc_msgSend(v5, "updateBroadcastURL:", v4);

}

- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
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
    v26 = "-[RPRecordingManager startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    v27 = 1024;
    v28 = 779;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000154F8;
  v18[3] = &unk_100081340;
  v18[4] = self;
  v19 = v13;
  v21 = width;
  v22 = height;
  v23 = a5;
  v24 = a6;
  v20 = v14;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v15, "stopAllClientsWithHandler:", v18);

}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001572C;
  v7[3] = &unk_100080E68;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopSystemRecordingSessionWithHandler:", v7);

}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000157D0;
  v7[3] = &unk_100081368;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopSystemRecordingSessionWithURLHandler:", v7);

}

- (void)resumeSystemRecordingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015874;
  v7[3] = &unk_100081408;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "resumeSystemRecordingWithCompletionHandler:", v7);

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
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[RPRecordingManager setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationDat"
          "a:userInfo:handler:]";
    v21 = 1024;
    v22 = 854;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Getting client and setting up broadcast", buf, 0x12u);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getClientWithBundleID:", v12));

  if (v18)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "-[RPRecordingManager setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationD"
            "ata:userInfo:handler:]";
      v21 = 1024;
      v22 = 863;
      v23 = 2112;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Calling set up system broadcast on client: %@", buf, 0x1Cu);
    }
    -[RPRecordingManager updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:](self, "updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:", v18, v12, v13, v14, v15, 1, v16);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "-[RPRecordingManager setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationD"
            "ata:userInfo:handler:]";
      v21 = 1024;
      v22 = 859;
      v23 = 2112;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Calling client doesn't not exist, we need to create a new client with bundleID: %@", buf, 0x1Cu);
    }
    -[RPRecordingManager createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:](self, "createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:", v12, v13, v14, v15, 1, v16);
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
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  CGFloat v26;
  CGFloat v27;
  BOOL v28;
  BOOL v29;

  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100015C38;
  v22[3] = &unk_1000813E0;
  v22[4] = self;
  v23 = v15;
  v26 = width;
  v27 = height;
  v28 = a5;
  v29 = a6;
  v24 = v16;
  v25 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  objc_msgSend(v18, "stopAllClientsWithHandler:", v22);

}

- (void)stopSystemBroadcastWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015DE8;
  v7[3] = &unk_100080E68;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopSystemBroadcastSessionWithHandler:", v7);

}

- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015E8C;
  v7[3] = &unk_100081408;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "resumeSystemBroadcastWithCompletionHandler:", v7);

}

- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
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
    v26 = "-[RPRecordingManager startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:]";
    v27 = 1024;
    v28 = 925;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100016030;
  v18[3] = &unk_100081340;
  v18[4] = self;
  v19 = v13;
  v21 = width;
  v22 = height;
  v23 = a5;
  v24 = a6;
  v20 = v14;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v15, "stopAllClientsWithHandler:", v18);

}

- (void)stopClipBufferingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
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
    v10 = "-[RPRecordingManager stopClipBufferingWithCompletionHandler:]";
    v11 = 1024;
    v12 = 952;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016284;
  v7[3] = &unk_100080E68;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopInAppClipSessionWithHandler:", v7);

}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
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
    v15 = "-[RPRecordingManager exportClipToURL:duration:completionHandler:]";
    v16 = 1024;
    v17 = 966;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000163F8;
  v12[3] = &unk_100080E68;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "exportClipToURL:duration:completionHandler:", v8, v12, a4);

}

- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000164B8;
  v10[3] = &unk_100081318;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "resumeInAppClipWithContextID:completionHandler:", v7, v10);

}

- (id)getCallingConnectionBundleID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager connectionManager](self, "connectionManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentConnection"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPConnectionManager uniqueClientIdentifierWithPID:](RPConnectionManager, "uniqueClientIdentifierWithPID:", objc_msgSend(v3, "processIdentifier")));
  return v4;
}

- (id)getCallingConnectionClient
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionBundleID](self, "getCallingConnectionBundleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getClientWithBundleID:", v2));

  if (v4)
    v5 = 1;
  else
    v5 = dword_100095B40 > 2;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004D840();

  return v4;
}

- (void)macApplicationDidResignActive
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPRecordingManager macApplicationDidResignActive]";
    v6 = 1024;
    v7 = 1013;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  objc_msgSend(v3, "pauseCurrentActiveSession");

}

- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446466;
    v10 = "-[RPRecordingManager macApplicationDidBecomeActiveWithContextID:completionHandler:]";
    v11 = 1024;
    v12 = 1020;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  objc_msgSend(v8, "resumeCurrentActiveSessionWithContextID:completionHandler:", v6, v7);

}

- (void)stopCurrentActiveSessionWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  objc_msgSend(v5, "stopCurrentActiveSessionWithHandler:", v4);

}

- (void)stopAllActiveClients
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  objc_msgSend(v2, "stopAllClientsWithHandler:", &stru_100081448);

}

- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPRecordingManager saveVideoToCameraRoll:handler:]";
    v10 = 1024;
    v11 = 1045;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  -[RPRecordingManager saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:](self, "saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:", v6, 1, 0, 0, v7);

}

- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPRecordingManager saveClipToCameraRoll:handler:]";
    v10 = 1024;
    v11 = 1050;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  -[RPRecordingManager saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:](self, "saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:", v6, 1, 0, 1, v7);

}

- (void)saveVideo:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  v6 = a3;
  v7 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPRecordingManager saveVideo:handler:]";
    v10 = 1024;
    v11 = 1055;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  -[RPRecordingManager saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:](self, "saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:", v6, 0, 1, 0, v7);

}

- (void)saveToCameraRoll:(id)a3 mixAudioTracks:(BOOL)a4 ignoreDoNotDisturb:(BOOL)a5 isClip:(BOOL)a6 handler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  unsigned __int8 v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = (void (**)(id, void *))a7;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136446466;
    v18 = "-[RPRecordingManager saveToCameraRoll:mixAudioTracks:ignoreDoNotDisturb:isClip:handler:]";
    v19 = 1024;
    v20 = 1060;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v17, 0x12u);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager connectionManager](self, "connectionManager"));
  v15 = objc_msgSend(v14, "hasSystemRecordingEntitlements");

  if ((v15 & 1) == 0)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004D938();
      if (!v13)
        goto LABEL_11;
    }
    else if (!v13)
    {
      goto LABEL_11;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5810, 0));
    v13[2](v13, v16);

    goto LABEL_11;
  }
  -[RPRecordingManager processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:](self, "processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:", v12, v10, v9, v8);
  if (v13)
    v13[2](v13, 0);
LABEL_11:

}

- (void)processSaveToPhotos:(id)a3 mixAudioTracks:(BOOL)a4 ignoreDoNotDisturb:(BOOL)a5 isClip:(BOOL)a6
{
  _BOOL8 v8;
  id v10;
  _QWORD v11[5];
  BOOL v12;
  BOOL v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v8 = a4;
  v10 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPRecordingManager processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:]";
    v16 = 1024;
    v17 = 1078;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Start Save to Photos", buf, 0x12u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100016F30;
  v11[3] = &unk_100081470;
  v11[4] = self;
  v12 = a5;
  v13 = a6;
  +[RPPhotosUtility exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:](RPPhotosUtility, "exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:", v10, v8, v11);

}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3;
  void *v5;
  unsigned int v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;

  v3 = *(_QWORD *)&a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446722;
    v9 = "-[RPRecordingManager updateProcessIDForAudioCaptureWithPID:]";
    v10 = 1024;
    v11 = 1117;
    v12 = 1024;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pid :%d", (uint8_t *)&v8, 0x18u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager connectionManager](self, "connectionManager"));
  v6 = objc_msgSend(v5, "hasSystemRecordingEntitlements");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
    objc_msgSend(v7, "updateProcessIDForAudioCaptureWithPID:", v3);

  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004DA30();
  }
}

- (void)displayScreenRecorderNotificationWithURL:(id)a3 ignoreDoNotDisturb:(BOOL)a4 isClip:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  RPRecordingManager *v16;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136446722;
    v12 = "-[RPRecordingManager displayScreenRecorderNotificationWithURL:ignoreDoNotDisturb:isClip:]";
    v13 = 1024;
    v14 = 1130;
    v15 = 2048;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v11, 0x1Cu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager createNotificationRequestWithAssetURL:ignoreDoNotDisturb:isClip:](self, "createNotificationRequestWithAssetURL:ignoreDoNotDisturb:isClip:", v8, v6, v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager userNotificationCenter](self, "userNotificationCenter"));
  objc_msgSend(v10, "addNotificationRequest:withCompletionHandler:", v9, &stru_100081490);

}

- (id)createNotificationRequestWithAssetURL:(id)a3 ignoreDoNotDisturb:(BOOL)a4 isClip:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v31;
  _QWORD v32[2];
  const __CFString *v33;
  id v34;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://asset?uuid=%@&albumname=camera-roll"), v8));
  v10 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));

  if (v5)
    v11 = CFSTR("CONTROL_CENTER_CLIPS_TITLE");
  else
    v11 = CFSTR("CONTROL_CENTER_TITLE");
  if (v5)
    v12 = CFSTR("RECORDING_CLIPS_BULLETIN_MESSAGE");
  else
    v12 = CFSTR("RECORDING_BULLETIN_MESSAGE");
  v13 = objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v11));
  v14 = objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", v12));
  v15 = objc_alloc_init((Class)UNMutableNotificationContent);
  v31 = (void *)v13;
  objc_msgSend(v15, "setTitle:", v13);
  v29 = (void *)v14;
  objc_msgSend(v15, "setBody:", v14);
  objc_msgSend(v15, "setThreadIdentifier:", CFSTR("orginalRecordID"));
  objc_msgSend(v15, "setShouldIgnoreDoNotDisturb:", v6);
  if (v7)
  {
    v33 = CFSTR("photoAssetIdKey");
    v34 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    objc_msgSend(v15, "setUserInfo:", v16);

  }
  objc_msgSend(v15, "setDefaultActionURL:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("photo.fill")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("SYSTEM_RECORDING_LONG_PRESS_VIEW")));
  v28 = (void *)v10;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:url:options:icon:](UNNotificationAction, "actionWithIdentifier:title:url:options:icon:", CFSTR("viewAction"), v18, v10, 0, v17));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("xmark.circle")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("SYSTEM_RECORDING_LONG_PRESS_DELETE")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("deleteAction"), v21, 3, v20));

  v32[0] = v19;
  v32[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("orginalRecordID"), v23, &__NSArray0__struct, 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v24));
  -[UNUserNotificationCenter setNotificationCategories:](self->_userNotificationCenter, "setNotificationCategories:", v25);

  objc_msgSend(v15, "setCategoryIdentifier:", CFSTR("orginalRecordID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", CFSTR("orginalRecordID"), v15, 0));

  return v26;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;

  v6 = a4;
  v7 = (void (**)(_QWORD))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[RPRecordingManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]"));
  NSLog(CFSTR("%@"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionIdentifier"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("deleteAction"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notification"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "request"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));

    if (!v14)
      goto LABEL_15;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("photoAssetIdKey")));
    if (!v15)
      goto LABEL_15;
    v16 = (void *)v15;
    v26 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v17, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100017984;
      v24[3] = &unk_100080E00;
      v21 = v19;
      v25 = v21;
      v23 = 0;
      objc_msgSend(v20, "performChangesAndWait:error:", v24, &v23);
      v22 = v23;

      if (v22)
        NSLog(CFSTR("RPRecordingManager: didReceiveNotificationResponse: Error deleting photo asset: %@"), v22);
      v7[2](v7);

    }
    else
    {
LABEL_15:
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004DAAC();
    }

  }
}

- (void)getSystemBroadcastExtensionInfo:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017A90;
  v4[3] = &unk_1000814B8;
  v5 = a3;
  v3 = v5;
  +[NSExtension extensionsWithMatchingPointName:completion:](NSExtension, "extensionsWithMatchingPointName:completion:", CFSTR("com.apple.broadcast-services-upload"), v4);

}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  _BOOL4 v11;

  v3 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPRecordingManager setMicrophoneEnabled:]";
    v8 = 1024;
    v9 = 1291;
    v10 = 1024;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d microphone set:%d ", (uint8_t *)&v6, 0x18u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  objc_msgSend(v5, "setCurrentActiveSessionMicrophoneEnabled:", v3);

}

- (void)getSystemBroadcastPickerInfo:(id)a3
{
  void (**v4)(id, NSString *, BOOL);
  NSString *currentPreferredBroadcastExt;
  _BOOL4 showsBroadcastPickerMicButton;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  _BOOL4 v14;

  v4 = (void (**)(id, NSString *, BOOL))a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    currentPreferredBroadcastExt = self->_currentPreferredBroadcastExt;
    showsBroadcastPickerMicButton = self->_showsBroadcastPickerMicButton;
    v7 = 136446978;
    v8 = "-[RPRecordingManager getSystemBroadcastPickerInfo:]";
    v9 = 1024;
    v10 = 1297;
    v11 = 2112;
    v12 = currentPreferredBroadcastExt;
    v13 = 1024;
    v14 = showsBroadcastPickerMicButton;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preferredExtension: %@ showsMic: %d", (uint8_t *)&v7, 0x22u);
  }
  v4[2](v4, self->_currentPreferredBroadcastExt, self->_showsBroadcastPickerMicButton);

}

- (void)setBroadcastPickerPreferredExt:(id)a3 showsMicButton:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v6;
  NSString *currentPreferredBroadcastExt;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  _BOOL4 v15;

  v4 = a4;
  v6 = (NSString *)a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446978;
    v9 = "-[RPRecordingManager setBroadcastPickerPreferredExt:showsMicButton:]";
    v10 = 1024;
    v11 = 1302;
    v12 = 2112;
    v13 = v6;
    v14 = 1024;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preferredExtension: %@ showsMic: %d", (uint8_t *)&v8, 0x22u);
  }
  currentPreferredBroadcastExt = self->_currentPreferredBroadcastExt;
  self->_currentPreferredBroadcastExt = v6;

  self->_showsBroadcastPickerMicButton = v4;
}

- (void)openControlCenterSystemRecordingView
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446466;
    v3 = "-[RPRecordingManager openControlCenterSystemRecordingView]";
    v4 = 1024;
    v5 = 1308;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v2, 0x12u);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000814D8);
}

- (void)reportCameraUsage:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RPRecordingManager getCallingConnectionClient](self, "getCallingConnectionClient"));
  objc_msgSend(v4, "reportCameraUsage:", a3);

}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenter, a3);
}

- (BOOL)isMicrophoneRecording
{
  return self->_microphoneRecording;
}

- (void)setMicrophoneRecording:(BOOL)a3
{
  self->_microphoneRecording = a3;
}

- (RPConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_connectionManager, a3);
}

- (NSMutableDictionary)currentAvailableExtensions
{
  return self->_currentAvailableExtensions;
}

- (void)setCurrentAvailableExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_currentAvailableExtensions, a3);
}

- (NSMutableDictionary)streamUpdateFilterTimers
{
  return self->_streamUpdateFilterTimers;
}

- (void)setStreamUpdateFilterTimers:(id)a3
{
  objc_storeStrong((id *)&self->_streamUpdateFilterTimers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamUpdateFilterTimers, 0);
  objc_storeStrong((id *)&self->_currentAvailableExtensions, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_currentPreferredBroadcastExt, 0);
}

@end
