@implementation CCDShieldUILifeCycleManager

+ (id)sharedInstance
{
  if (qword_10001D848 != -1)
    dispatch_once(&qword_10001D848, &stru_1000186D8);
  return (id)qword_10001D850;
}

- (CCDShieldUILifeCycleManager)init
{
  uint64_t v2;
  CCDShieldUILifeCycleManager *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;
  uint8_t buf[4];
  CCDShieldUILifeCycleManager *v13;
  __int16 v14;
  const char *v15;

  v11.receiver = self;
  v11.super_class = (Class)CCDShieldUILifeCycleManager;
  v3 = -[CCDShieldUILifeCycleManager init](&v11, "init");
  if (v3)
  {
    v4 = CMContinuityCaptureLog(0, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = v3;
      v14 = 2080;
      v15 = "-[CCDShieldUILifeCycleManager init]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
    }

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.shieldui.lifecyclemanager", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[CCDShieldUILifeCycleManager _releaseLockScreenAssertion](self, "_releaseLockScreenAssertion");
  -[CCDShieldUILifeCycleManager _releaseAppSwitcherAssertion](self, "_releaseAppSwitcherAssertion");
  -[CCDShieldUILifeCycleManager _releaseAlwaysOnDisplayAssertion](self, "_releaseAlwaysOnDisplayAssertion");
  v3.receiver = self;
  v3.super_class = (Class)CCDShieldUILifeCycleManager;
  -[CCDShieldUILifeCycleManager dealloc](&v3, "dealloc");
}

- (CCDShieldUISession)activeSession
{
  CCDShieldUILifeCycleManager *v2;
  CCDShieldUISession *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeSession;
  objc_sync_exit(v2);

  return v3;
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v3 = a3;
  v5 = CMContinuityCaptureLog(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CCDShieldUILifeCycleManager assertionTargetProcessDidExit:]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s assertion %@ ", (uint8_t *)&v7, 0x16u);
  }

}

- (void)shieldDidConnect
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  CCDShieldUILifeCycleManager *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDShieldUILifeCycleManager activeSession](self, "activeSession"));
    *(_DWORD *)buf = 138543874;
    v10 = self;
    v11 = 2080;
    v12 = "-[CCDShieldUILifeCycleManager shieldDidConnect]";
    v13 = 2114;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s activeSession %{public}@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000044A4;
  block[3] = &unk_100018670;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)shieldDidDisconnect
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  CCDShieldUILifeCycleManager *v6;
  __int16 v7;
  const char *v8;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543618;
    v6 = self;
    v7 = 2080;
    v8 = "-[CCDShieldUILifeCycleManager shieldDidDisconnect]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
  }

  -[CCDShieldUILifeCycleManager forceShieldUITerminationIfApplicable](self, "forceShieldUITerminationIfApplicable");
}

- (void)prepareForPullConversation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  CCDShieldUILifeCycleManager *v13;
  __int16 v14;
  const char *v15;

  v4 = a3;
  v6 = CMContinuityCaptureLog(0, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2080;
    v15 = "-[CCDShieldUILifeCycleManager prepareForPullConversation:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000470C;
  v10[3] = &unk_100018700;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(queue, v10);

}

- (void)notifyShieldStatus:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  CCDShieldUILifeCycleManager *v8;
  void (**v9)(id, void *, int64_t);
  void *v10;
  int v11;
  CCDShieldUILifeCycleManager *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;

  v5 = CMContinuityCaptureLog(0, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDShieldUILifeCycleManager activeSession](self, "activeSession"));
    v11 = 138544130;
    v12 = self;
    v13 = 2080;
    v14 = "-[CCDShieldUILifeCycleManager notifyShieldStatus:]";
    v15 = 1024;
    v16 = a3;
    v17 = 2114;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s error %d for session %{public}@", (uint8_t *)&v11, 0x26u);

  }
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void (**)(id, void *, int64_t))objc_retainBlock(v8->_statusHandler);
  objc_sync_exit(v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CCDShieldUILifeCycleManager activeSession](v8, "activeSession"));
    v9[2](v9, v10, a3);

  }
}

- (void)launchShieldForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7 statusHandler:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *queue;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  int64_t v29;
  BOOL v30;
  BOOL v31;
  uint8_t buf[4];
  CCDShieldUILifeCycleManager *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a8;
  v18 = CMContinuityCaptureLog(0, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CCDShieldUILifeCycleManager activeSession](self, "activeSession"));
    *(_DWORD *)buf = 138545154;
    v33 = self;
    v34 = 2080;
    v35 = "-[CCDShieldUILifeCycleManager launchShieldForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:statusHandler:]";
    v36 = 1024;
    v37 = v10;
    v38 = 1024;
    v39 = v9;
    v40 = 2114;
    v41 = v14;
    v42 = 2114;
    v43 = v15;
    v44 = 1024;
    v45 = a5;
    v46 = 2114;
    v47 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %s skipPlacementStep:%d isDedicated:%d identifier:%{public}@ name:%{public}@ model:%d activeSession:%{public}@", buf, 0x46u);

  }
  queue = self->_queue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100004A6C;
  v25[3] = &unk_100018728;
  v25[4] = self;
  v26 = v14;
  v28 = v16;
  v29 = a5;
  v30 = v10;
  v31 = v9;
  v27 = v15;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  dispatch_async(queue, v25);

}

- (void)_launchShieldForDeviceIdentifier:(id)a3 name:(id)a4 model:(int64_t)a5 skipPlacementStep:(BOOL)a6 isDedicated:(BOOL)a7 statusHandler:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  char *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  CCDShieldUISession *activeSession;
  CCDShieldUISession *v21;
  CCDShieldUISession **p_activeSession;
  void *v23;
  unsigned __int8 v24;
  CCDShieldUILifeCycleManager *v25;
  id v26;
  id statusHandler;
  dispatch_queue_global_t global_queue;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  CCDShieldUISession *v33;
  void *v34;
  CCDShieldUISession *v35;
  CCDShieldUILifeCycleManager *v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  CCDShieldUILifeCycleManager *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  int v52;
  __int16 v53;
  CCDShieldUISession *v54;

  v9 = a7;
  v10 = a6;
  v14 = (char *)a3;
  v15 = a4;
  v16 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v18 = CMContinuityCaptureLog(0, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    activeSession = self->_activeSession;
    *(_DWORD *)buf = 138545154;
    v40 = self;
    v41 = 2080;
    v42 = "-[CCDShieldUILifeCycleManager _launchShieldForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:statusHandler:]";
    v43 = 1024;
    v44 = v10;
    v45 = 1024;
    v46 = v9;
    v47 = 2114;
    v48 = v14;
    v49 = 2114;
    v50 = v15;
    v51 = 1024;
    v52 = a5;
    v53 = 2114;
    v54 = activeSession;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %s skipPlacementStep:%d isDedicated:%d identifier:%{public}@ name:%{public}@ model:%d activeSession:%{public}@", buf, 0x46u);
  }

  p_activeSession = &self->_activeSession;
  v21 = self->_activeSession;
  if (!v21)
    goto LABEL_7;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CCDShieldUISession deviceIdentifier](v21, "deviceIdentifier"));
  v24 = objc_msgSend(v23, "isEqualToString:", v14);

  if ((v24 & 1) == 0)
  {
    -[CCDShieldUILifeCycleManager notifyShieldStatus:](self, "notifyShieldStatus:", -2003);
    goto LABEL_11;
  }
  if (*p_activeSession)
  {
    -[CCDShieldUILifeCycleManager notifyShieldStatus:](self, "notifyShieldStatus:", 0);
  }
  else
  {
LABEL_7:
    v25 = self;
    objc_sync_enter(v25);
    v26 = objc_retainBlock(v16);
    statusHandler = v25->_statusHandler;
    v25->_statusHandler = v26;

    objc_sync_exit(v25);
    global_queue = dispatch_get_global_queue(2, 0);
    v29 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v29, &stru_100018748);

    v31 = CMContinuityCaptureLog(0, v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v40 = v25;
      v41 = 2114;
      v42 = v14;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating CCDShieldUISession for device %{public}@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, v25);
    v33 = [CCDShieldUISession alloc];
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100004E74;
    v37[3] = &unk_100018670;
    objc_copyWeak(&v38, (id *)buf);
    v35 = -[CCDShieldUISession initWithDeviceIdentifier:name:model:placementStepSkipped:isDedicated:sessionInterruptionBlock:](v33, "initWithDeviceIdentifier:name:model:placementStepSkipped:isDedicated:sessionInterruptionBlock:", v14, v15, a5, v34, v9, v37);

    -[CCDShieldUILifeCycleManager willChangeValueForKey:](v25, "willChangeValueForKey:", CFSTR("activeSession"));
    v36 = v25;
    objc_sync_enter(v36);
    objc_storeStrong((id *)p_activeSession, v35);
    objc_sync_exit(v36);

    -[CCDShieldUILifeCycleManager didChangeValueForKey:](v36, "didChangeValueForKey:", CFSTR("activeSession"));
    -[CCDShieldUILifeCycleManager _acquireLockScreenAssertion](v36, "_acquireLockScreenAssertion");
    -[CCDShieldUILifeCycleManager _acquireAppSwitcherAssertion](v36, "_acquireAppSwitcherAssertion");
    -[CCDShieldUILifeCycleManager _launchShieldUIProcess](v36, "_launchShieldUIProcess");

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }
LABEL_11:

}

- (void)_launchShieldUIProcess
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  const __CFString *v26;
  void *v27;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v3, "setObject:forKey:", SBSOpenApplicationEnvironmentSecureOnLockScreen, SBSOpenApplicationOptionKeyLaunchEnvironment);
  objc_msgSend(v3, "setObject:forKey:", &__kCFBooleanTrue, FBSOpenApplicationOptionKeyPromptUnlockDevice);
  objc_msgSend(v3, "setObject:forKey:", &__kCFBooleanTrue, FBSOpenApplicationOptionKeyUnlockDevice);
  if (!self->_shieldConnected)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("ContinuityCaptureShieldUILaunch://")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDShieldUILifeCycleManager activeSession](self, "activeSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));

    v24 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v24));
    v9 = v24;
    if (v9 || !v7)
    {
      v11 = CMContinuityCaptureLog(0, v8);
      v10 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100010098((uint64_t)v9, v10, v12, v13, v14, v15, v16, v17);
    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", v4, FBSOpenApplicationOptionKeyPayloadURL);
      v26 = CFSTR("kContinuityCaptureLaunchUIConfigurationKey");
      v27 = v7;
      v10 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      objc_msgSend(v3, "setObject:forKey:", v10, FBSOpenApplicationOptionKeyPayloadAnnotation);
    }

  }
  v18 = objc_msgSend(v3, "copy");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v18));

  v20 = SBSCreateOpenApplicationService();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000052F8;
  v22[3] = &unk_100018770;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v21, "openApplication:withOptions:completion:", CFSTR("com.apple.ContinuityCaptureShieldUI"), v19, v22);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

- (void)bringShieldUIProcessToForegroundIfApplicable
{
  uint64_t v3;
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  CCDShieldUILifeCycleManager *v8;
  __int16 v9;
  const char *v10;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2080;
    v10 = "-[CCDShieldUILifeCycleManager bringShieldUIProcessToForegroundIfApplicable]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000054D8;
  block[3] = &unk_100018798;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_forceTerminateShieldIfApplicable:(id)a3 completionTimeoutInSec:(unint64_t)a4
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  id v8;
  dispatch_queue_t v9;
  NSObject *v10;
  void (**v11)(_QWORD);
  id v12;
  id v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  dispatch_time_t v19;
  _QWORD block[4];
  void (**v22)(_QWORD);
  _QWORD *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  _QWORD *v29;
  id v30;
  id v31;
  _QWORD v32[3];
  char v33;
  id location;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  unsigned int v42;

  v5 = (void (**)(_QWORD))a3;
  objc_initWeak(&location, self);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", CFSTR("com.apple.ContinuityCaptureShieldUI")));
  v31 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v6, &v31));
  v8 = v31;
  if (v7)
  {
    v9 = dispatch_queue_create("com.apple.forceTerminateShield", 0);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100005860;
    v26[3] = &unk_1000187E8;
    objc_copyWeak(&v30, &location);
    v10 = v9;
    v27 = v10;
    v29 = v32;
    v11 = v5;
    v28 = v11;
    objc_msgSend(v7, "monitorForDeath:", v26);
    v12 = objc_msgSend(objc_alloc((Class)RBSTerminateContext), "initWithExplanation:", CFSTR("Terminated by ccd due to timeout"));
    v13 = objc_msgSend(objc_alloc((Class)RBSTerminateRequest), "initWithPredicate:context:", v6, v12);
    v25 = 0;
    v14 = objc_msgSend(v13, "execute:", &v25);
    v15 = v25;

    v17 = CMContinuityCaptureLog(0, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "-[CCDShieldUILifeCycleManager _forceTerminateShieldIfApplicable:completionTimeoutInSec:]";
      v37 = 2112;
      v38 = v13;
      v39 = 2114;
      v40 = v15;
      v41 = 1024;
      v42 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s request %@ error %{public}@ status %d", buf, 0x26u);
    }

    v19 = dispatch_time(0, 1000000000 * a4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005A04;
    block[3] = &unk_100018810;
    v23 = v32;
    objc_copyWeak(&v24, &location);
    v22 = v11;
    dispatch_after(v19, v10, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v30);

    v8 = v15;
  }
  else
  {
    v5[2](v5);
  }

  _Block_object_dispose(v32, 8);
  objc_destroyWeak(&location);

}

- (void)forceShieldUITerminationIfApplicable
{
  uint64_t v3;
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  CCDShieldUILifeCycleManager *v8;
  __int16 v9;
  const char *v10;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2080;
    v10 = "-[CCDShieldUILifeCycleManager forceShieldUITerminationIfApplicable]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005BE8;
  block[3] = &unk_100018798;
  block[4] = self;
  dispatch_async_and_wait(queue, block);
}

- (void)tearDownShield
{
  uint64_t v3;
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  CCDShieldUILifeCycleManager *v8;
  __int16 v9;
  const char *v10;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2080;
    v10 = "-[CCDShieldUILifeCycleManager tearDownShield]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005E08;
  block[3] = &unk_100018798;
  block[4] = self;
  dispatch_async_and_wait(queue, block);
}

- (void)_acquireLockScreenAssertion
{
  SBSLockScreenContentAssertion *lockScreenAssertion;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  SBSLockScreenContentAssertion *v8;
  SBSLockScreenContentAssertion *v9;
  _QWORD v10[4];
  id v11;
  id buf[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  lockScreenAssertion = self->_lockScreenAssertion;
  v5 = CMContinuityCaptureLog(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (lockScreenAssertion)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100010160(v7);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Acquiring SBSSecureAppAssertion for lock screen", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000627C;
    v10[3] = &unk_100018838;
    objc_copyWeak(&v11, buf);
    v8 = (SBSLockScreenContentAssertion *)objc_claimAutoreleasedReturnValue(+[SBSSecureAppAssertion acquireSecureAppAssertionWithType:errorHandler:](SBSSecureAppAssertion, "acquireSecureAppAssertionWithType:errorHandler:", 7, v10));
    v9 = self->_lockScreenAssertion;
    self->_lockScreenAssertion = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

- (void)_releaseLockScreenAssertion
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  SBSLockScreenContentAssertion *lockScreenAssertion;
  SBSLockScreenContentAssertion *v7;
  uint8_t v8[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = CMContinuityCaptureLog(0, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Releasing SBSSecureAppAssertion for lock screen", v8, 2u);
  }

  lockScreenAssertion = self->_lockScreenAssertion;
  if (lockScreenAssertion)
  {
    -[SBSLockScreenContentAssertion invalidate](lockScreenAssertion, "invalidate");
    v7 = self->_lockScreenAssertion;
    self->_lockScreenAssertion = 0;

  }
}

- (void)_acquireAppSwitcherAssertion
{
  SBSAssertion *appSwitcherAssertion;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  _QWORD *v8;
  id appSwitcherAssertionCompletion;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id buf[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  appSwitcherAssertion = self->_appSwitcherAssertion;
  v5 = CMContinuityCaptureLog(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (appSwitcherAssertion)
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempted to acquire AppSwitcherAssertion even though we already have one", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Acquiring SBSRequestAppSwitcherAppearanceForHiddenApplication", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006588;
    v12[3] = &unk_100018860;
    objc_copyWeak(&v13, buf);
    v8 = objc_retainBlock(v12);
    appSwitcherAssertionCompletion = self->_appSwitcherAssertionCompletion;
    self->_appSwitcherAssertionCompletion = v8;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000065DC;
    v10[3] = &unk_100018860;
    objc_copyWeak(&v11, buf);
    SBSRequestAppSwitcherAppearanceForHiddenApplication(CFSTR("com.apple.ContinuityCaptureShieldUI"), v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
}

- (void)_releaseAppSwitcherAssertion
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id appSwitcherAssertionCompletion;
  SBSAssertion *appSwitcherAssertion;
  SBSAssertion *v8;
  uint8_t v9[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = CMContinuityCaptureLog(0, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Releasing AppSwitcherAssertion", v9, 2u);
  }

  appSwitcherAssertionCompletion = self->_appSwitcherAssertionCompletion;
  self->_appSwitcherAssertionCompletion = 0;

  appSwitcherAssertion = self->_appSwitcherAssertion;
  if (appSwitcherAssertion)
  {
    -[SBSAssertion invalidate](appSwitcherAssertion, "invalidate");
    v8 = self->_appSwitcherAssertion;
    self->_appSwitcherAssertion = 0;

  }
}

- (void)_acquireAlwaysOnDisplayAssertion
{
  BSInvalidatable *alwaysOnDisplayAssertionToken;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  alwaysOnDisplayAssertionToken = self->_alwaysOnDisplayAssertionToken;
  v5 = CMContinuityCaptureLog(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (alwaysOnDisplayAssertionToken)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempted to acquire always on display assertion even though we already have one", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Acquiring always on display assertion", v10, 2u);
    }

    v6 = objc_alloc_init((Class)SBSLockScreenService);
    v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue(-[NSObject preventSpuriousScreenUndimWithReason:](v6, "preventSpuriousScreenUndimWithReason:", CFSTR("Continuity Capture Enabled")));
    v9 = self->_alwaysOnDisplayAssertionToken;
    self->_alwaysOnDisplayAssertionToken = v8;

    -[NSObject invalidate](v6, "invalidate");
  }

}

- (void)_releaseAlwaysOnDisplayAssertion
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  BSInvalidatable *alwaysOnDisplayAssertionToken;
  BSInvalidatable *v7;
  uint8_t v8[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = CMContinuityCaptureLog(0, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Releasing always on display assertion", v8, 2u);
  }

  alwaysOnDisplayAssertionToken = self->_alwaysOnDisplayAssertionToken;
  if (alwaysOnDisplayAssertionToken)
  {
    -[BSInvalidatable invalidate](alwaysOnDisplayAssertionToken, "invalidate");
    v7 = self->_alwaysOnDisplayAssertionToken;
    self->_alwaysOnDisplayAssertionToken = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminationSemaphore, 0);
  objc_storeStrong(&self->_statusHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong(&self->_appSwitcherAssertionCompletion, 0);
  objc_storeStrong((id *)&self->_alwaysOnDisplayAssertionToken, 0);
  objc_storeStrong((id *)&self->_appSwitcherAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenAssertion, 0);
}

@end
