@implementation MSDUIHelper

+ (id)sharedInstance
{
  if (qword_100175598 != -1)
    dispatch_once(&qword_100175598, &stru_10013FAF8);
  return (id)qword_100175590;
}

- (MSDUIHelper)init
{
  MSDUIHelper *v2;
  MSDUIHelper *v3;
  dispatch_queue_t v4;
  void *v5;
  MSDUIHelper *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDUIHelper;
  v2 = -[MSDUIHelper init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDUIHelper setFullScreenState:](v2, "setFullScreenState:", 0);
    v4 = dispatch_queue_create("com.apple.msduihelper", 0);
    -[MSDUIHelper setUiHelperQueue:](v3, "setUiHelperQueue:", v4);

    -[MSDUIHelper setCurrentProgress:](v3, "setCurrentProgress:", 0);
    -[MSDUIHelper setFullScreenUIAppId:](v3, "setFullScreenUIAppId:", CFSTR("com.apple.StoreDemoViewService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor sharedMonitorForDisplayType:](FBSDisplayLayoutMonitor, "sharedMonitorForDisplayType:", 0));
    -[MSDUIHelper setDisplayLayoutMonitor:](v3, "setDisplayLayoutMonitor:", v5);

    v6 = v3;
  }

  return v3;
}

- (void)setConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MSDUIHelper *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A0E98;
  v7[3] = &unk_10013FB20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_copyWeak(&v10, &location);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)startFullScreenUIWith:(id)a3 allowCancel:(BOOL)a4
{
  -[MSDUIHelper startFullScreenUIWith:allowCancel:disableIdleTimer:](self, "startFullScreenUIWith:allowCancel:disableIdleTimer:", a3, a4, 0);
}

- (void)startFullScreenUIWith:(id)a3 allowCancel:(BOOL)a4 disableIdleTimer:(BOOL)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  BOOL v15;
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  v9 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A1140;
  v11[3] = &unk_10013FB48;
  objc_copyWeak(&v13, &location);
  v14 = a4;
  v12 = v8;
  v15 = a5;
  v10 = v8;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)stopFullScreenUI:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MSDUIHelper *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A1380;
  v7[3] = &unk_10013FB98;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)fullScreenUICanceledByUser
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A1814;
  v4[3] = &unk_10013D840;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)requestFullScreenUI
{
  unsigned int v3;
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id buf;

  -[MSDUIHelper setFullScreenState:](self, "setFullScreenState:", 1);
  v3 = -[MSDUIHelper launchFullScreenUI](self, "launchFullScreenUI");
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Request to launch blocking UI: %d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  v6 = dispatch_time(0, 15000000000);
  v7 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A19EC;
  block[3] = &unk_10013D840;
  objc_copyWeak(&v9, &buf);
  dispatch_after(v6, v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&buf);
}

- (BOOL)launchFullScreenUI
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trying to start blocking UI...", v6, 2u);
  }

  return -[MSDUIHelper launchFullScreenUI_ios](self, "launchFullScreenUI_ios");
}

- (void)activateFullScreenUIAppMonitor
{
  void *v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(id *, void *);
  void *v8;
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper displayLayoutMonitor](self, "displayLayoutMonitor"));
  objc_msgSend(v3, "addObserver:", self);

  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_1000A1BE8;
  v8 = &unk_10013FBE8;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", &v5));
  -[MSDUIHelper setFullScreenUIAppMonitor:](self, "setFullScreenUIAppMonitor:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)deactivateFullScreenUIAppMonitor
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper displayLayoutMonitor](self, "displayLayoutMonitor"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper fullScreenUIAppMonitor](self, "fullScreenUIAppMonitor"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper fullScreenUIAppMonitor](self, "fullScreenUIAppMonitor"));
    objc_msgSend(v5, "invalidate");

    -[MSDUIHelper setFullScreenUIAppMonitor:](self, "setFullScreenUIAppMonitor:", 0);
  }
}

- (void)handleFullScreenUIAppStateChange:(unsigned __int8)a3 withVisibility:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v5;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  uint8_t v20[16];
  id buf;
  __int16 v22;
  _BOOL4 v23;

  v4 = a4;
  v5 = a3;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v5;
    v22 = 1024;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Full screen UI app state change to %d, visible:%d", (uint8_t *)&buf, 0xEu);
  }

  objc_initWeak(&buf, self);
  if (v5 <= 1)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "App is crashed or terminated.", v20, 2u);
    }

    v11 = dispatch_time(0, 1000000000);
    v12 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A2120;
    block[3] = &unk_10013D840;
    v13 = &v19;
    objc_copyWeak(&v19, &buf);
    dispatch_after(v11, v12, block);
LABEL_14:

    objc_destroyWeak(v13);
    goto LABEL_15;
  }
  if ((v5 == 3 || v5 == 4 && !v4) && -[MSDUIHelper backlightStatus](self, "backlightStatus"))
  {
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "App is no longer in foreground.", v20, 2u);
    }

    v12 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A21A8;
    v16[3] = &unk_10013D840;
    v13 = &v17;
    objc_copyWeak(&v17, &buf);
    dispatch_async(v12, v16);
    goto LABEL_14;
  }
LABEL_15:
  objc_destroyWeak(&buf);
}

- (BOOL)launchFullScreenUI_ios
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  int v36;
  const char *v37;
  __int16 v38;
  void *v39;
  _QWORD v40[3];
  _QWORD v41[3];

  -[MSDUIHelper setFullScreenUILaunchError_iOS:](self, "setFullScreenUILaunchError_iOS:", 0);
  v40[0] = CFSTR("DisplayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper message](self, "message"));
  v41[0] = v3;
  v40[1] = CFSTR("CancelButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MSDUIHelper allowCancel](self, "allowCancel")));
  v41[1] = v4;
  v40[2] = CFSTR("DisableIdleTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MSDUIHelper disableIdleTimer](self, "disableIdleTimer")));
  v41[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper remoteAlertHandle](self, "remoteAlertHandle"));
  if (v7)
    goto LABEL_2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v10 = objc_msgSend(v9, "mode");

  if (v10 == 4)
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1000CA9FC();

    +[MSDAppLauncherTerminator launchApp:withOptions:outError:](MSDAppLauncherTerminator, "launchApp:withOptions:outError:", CFSTR("com.apple.StoreDemoViewService"), 0, 0);
  }
  v13 = objc_alloc((Class)SBSRemoteAlertDefinition);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentity identityForApplicationJobLabel:](RBSProcessIdentity, "identityForApplicationJobLabel:", CFSTR("com.apple.StoreDemoViewService")));
  v15 = objc_msgSend(v13, "initWithSceneProvidingProcess:configurationIdentifier:", v14, CFSTR("BlockingUIRemoteAlert"));

  v16 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  objc_msgSend(v16, "setUserInfo:", v6);
  v17 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v15, v16);
  -[MSDUIHelper setRemoteAlertHandle:](self, "setRemoteAlertHandle:", v17);

  v18 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper remoteAlertHandle](self, "remoteAlertHandle"));
  objc_msgSend(v19, "addObserver:", self);

  v20 = objc_msgSend(objc_alloc((Class)NSConditionLock), "initWithCondition:", 0);
  -[MSDUIHelper setConditionLock:](self, "setConditionLock:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper remoteAlertHandle](self, "remoteAlertHandle"));
  objc_msgSend(v21, "activateWithContext:", v18);

  v22 = sub_1000604F0();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v36 = 136315138;
    v37 = "-[MSDUIHelper launchFullScreenUI_ios]";
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: Full screen UI was launched.", (uint8_t *)&v36, 0xCu);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 10.0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper conditionLock](self, "conditionLock"));
  v26 = objc_msgSend(v25, "lockWhenCondition:beforeDate:", 1, v24);

  v27 = sub_1000604F0();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v36 = 136315138;
    v37 = "-[MSDUIHelper launchFullScreenUI_ios]";
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s: Full screen UI launch completed.", (uint8_t *)&v36, 0xCu);
  }

  if (!v26)
  {

LABEL_13:
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper fullScreenUILaunchError_iOS](self, "fullScreenUILaunchError_iOS"));

    if (v30)
    {
      v31 = sub_1000604F0();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper fullScreenUILaunchError_iOS](self, "fullScreenUILaunchError_iOS"));
        v36 = 136315394;
        v37 = "-[MSDUIHelper launchFullScreenUI_ios]";
        v38 = 2114;
        v39 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: Error = %{public}@", (uint8_t *)&v36, 0x16u);

      }
    }
    else
    {
      if ((v26 & 1) != 0)
      {
LABEL_20:
        v8 = 0;
        goto LABEL_21;
      }
      v34 = sub_1000604F0();
      v32 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v36 = 136315138;
        v37 = "-[MSDUIHelper launchFullScreenUI_ios]";
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: Error = Timeout launching full screen UI.", (uint8_t *)&v36, 0xCu);
      }
    }

    goto LABEL_20;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper fullScreenUILaunchError_iOS](self, "fullScreenUILaunchError_iOS"));

  if (v29)
    goto LABEL_13;
LABEL_2:
  v8 = 1;
LABEL_21:

  return v8;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[MSDUIHelper remoteAlertHandleDidActivate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s is called.", (uint8_t *)&v8, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper conditionLock](self, "conditionLock"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper conditionLock](self, "conditionLock"));
    objc_msgSend(v7, "unlockWithCondition:", 1);

  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[MSDUIHelper remoteAlertHandleDidDeactivate:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called.", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper conditionLock](self, "conditionLock"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper conditionLock](self, "conditionLock"));
    objc_msgSend(v8, "unlockWithCondition:", 1);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper remoteAlertHandle](self, "remoteAlertHandle"));
  objc_msgSend(v9, "removeObserver:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper remoteAlertHandle](self, "remoteAlertHandle"));
  objc_msgSend(v10, "invalidate");

  -[MSDUIHelper setRemoteAlertHandle:](self, "setRemoteAlertHandle:", 0);
  objc_initWeak((id *)buf, self);
  v11 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A29BC;
  v12[3] = &unk_10013F740;
  v12[4] = self;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_async(v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;

  v5 = a4;
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
    v11 = 136315394;
    v12 = "-[MSDUIHelper remoteAlertHandle:didInvalidateWithError:]";
    v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s is called with error - %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[MSDUIHelper setFullScreenUILaunchError_iOS:](self, "setFullScreenUILaunchError_iOS:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper conditionLock](self, "conditionLock"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDUIHelper conditionLock](self, "conditionLock"));
    objc_msgSend(v10, "unlockWithCondition:", 1);

  }
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A2C5C;
  block[3] = &unk_10013DDB8;
  objc_copyWeak(&v12, &location);
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)demoUpdateFailed:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A2F04;
  block[3] = &unk_10013F740;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)demoUpdateProgress:(int64_t)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3380;
  block[3] = &unk_10013FC38;
  v7[1] = (id)a3;
  objc_copyWeak(v7, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)demoUpdateAllowCancel:(BOOL)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[MSDUIHelper uiHelperQueue](self, "uiHelperQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A35B0;
  block[3] = &unk_10013FC60;
  v8 = a3;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)demoUpdateCompleted:(id)a3
{
  -[MSDUIHelper stopFullScreenUI:](self, "stopFullScreenUI:", 0);
}

- (NSString)fullScreenUIAppId
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFullScreenUIAppId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)uiHelperQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUiHelperQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)allowCancel
{
  return self->_allowCancel;
}

- (void)setAllowCancel:(BOOL)a3
{
  self->_allowCancel = a3;
}

- (BOOL)disableIdleTimer
{
  return self->_disableIdleTimer;
}

- (void)setDisableIdleTimer:(BOOL)a3
{
  self->_disableIdleTimer = a3;
}

- (int)fullScreenState
{
  return self->_fullScreenState;
}

- (void)setFullScreenState:(int)a3
{
  self->_fullScreenState = a3;
}

- (OS_xpc_object)pendingMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPendingMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(int64_t)a3
{
  self->_currentProgress = a3;
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return (SBSRemoteAlertHandle *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRemoteAlertHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSConditionLock)conditionLock
{
  return (NSConditionLock *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConditionLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSError)fullScreenUILaunchError_iOS
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFullScreenUILaunchError_iOS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)backlightStatus
{
  return self->_backlightStatus;
}

- (void)setBacklightStatus:(int64_t)a3
{
  self->_backlightStatus = a3;
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayLayoutMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (RBSProcessMonitor)fullScreenUIAppMonitor
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFullScreenUIAppMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenUIAppMonitor, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_fullScreenUILaunchError_iOS, 0);
  objc_storeStrong((id *)&self->_conditionLock, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_pendingMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_uiHelperQueue, 0);
  objc_storeStrong((id *)&self->_fullScreenUIAppId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
