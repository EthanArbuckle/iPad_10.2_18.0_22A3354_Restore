@implementation BTAppInteraction

- (void)unregisterApplication:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006AE340;
  v7[3] = &unk_100918340;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)cancelAppLaunchAlert:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005AB0;
  v7[3] = &unk_100918340;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)registerApplication:(id)a3 pid:(int)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067224;
  block[3] = &unk_1009195D0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (BOOL)isBackgroundingSupported:(id)a3 central:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000670BC;
  v10[3] = &unk_100940180;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)applicationStateChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BTAppInteraction *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018F58;
  v7[3] = &unk_100918340;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

+ (id)instance
{
  void *v2;

  v2 = (void *)qword_100994158;
  if (!qword_100994158)
  {
    if (qword_100994160 != -1)
      dispatch_once(&qword_100994160, &stru_100940078);
    v2 = (void *)qword_100994158;
  }
  return v2;
}

- (unsigned)applicationStateForProcess:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000110A0;
  block[3] = &unk_100940158;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return queue;
}

- (void)updateApplicationState:(int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  int v5;

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100067524;
  v4[3] = &unk_1009173A0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (unsigned)translateApplicationState:(unsigned int)a3
{
  char v3;

  if (a3 - 1 >= 8)
    v3 = 1;
  else
    v3 = 0x1001010108010402uLL >> (8 * (a3 - 1));
  return v3 & 0x1F;
}

- (BTAppInteraction)init
{
  BTAppInteraction *v2;
  BKSApplicationStateMonitor *v3;
  BKSApplicationStateMonitor *monitor;
  UninstallObserver *v5;
  UninstallObserver *uninstallObserver;
  NSMutableDictionary *v7;
  NSMutableDictionary *applicationMap;
  NSMutableArray *v9;
  NSMutableArray *launchNotifications;
  NSMutableArray *v11;
  NSMutableArray *pairingNotifications;
  NSMutableDictionary *v13;
  NSMutableDictionary *processAssertions;
  NSMutableDictionary *v15;
  NSMutableDictionary *urgentAssertions;
  uint64_t v17;
  NSMutableDictionary *pendingResurrection;
  NSDate *lastAirWaveNotificationDate;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)BTAppInteraction;
  v2 = -[BTAppInteraction init](&v21, "init");
  if (v2)
  {
    v2->_queue = (dispatch_queue_s *)dispatch_queue_create("com.apple.MobileBluetooth.AppFramework", 0);
    v2->_loggingQueue = (dispatch_queue_s *)dispatch_queue_create("com.apple.MobileBluetooth.AppFramework.loggingAlerts", 0);
    v3 = (BKSApplicationStateMonitor *)objc_msgSend(objc_alloc((Class)BKSApplicationStateMonitor), "initWithBundleIDs:states:", &__NSArray0__struct, 0);
    monitor = v2->_monitor;
    v2->_monitor = v3;

    -[BKSApplicationStateMonitor setHandler:](v2->_monitor, "setHandler:", &stru_100940098);
    v5 = objc_opt_new(UninstallObserver);
    uninstallObserver = v2->_uninstallObserver;
    v2->_uninstallObserver = v5;

    -[UninstallObserver setDelegate:](v2->_uninstallObserver, "setDelegate:", v2);
    v7 = objc_opt_new(NSMutableDictionary);
    applicationMap = v2->_applicationMap;
    v2->_applicationMap = v7;

    v9 = objc_opt_new(NSMutableArray);
    launchNotifications = v2->_launchNotifications;
    v2->_launchNotifications = v9;

    v11 = objc_opt_new(NSMutableArray);
    pairingNotifications = v2->_pairingNotifications;
    v2->_pairingNotifications = v11;

    v13 = objc_opt_new(NSMutableDictionary);
    processAssertions = v2->_processAssertions;
    v2->_processAssertions = v13;

    v15 = objc_opt_new(NSMutableDictionary);
    urgentAssertions = v2->_urgentAssertions;
    v2->_urgentAssertions = v15;

    v2->_assertionTimer = 0;
    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    pendingResurrection = v2->_pendingResurrection;
    v2->_pendingResurrection = (NSMutableDictionary *)v17;

    lastAirWaveNotificationDate = v2->_lastAirWaveNotificationDate;
    v2->_lastAirWaveNotificationDate = 0;

  }
  return v2;
}

- (void)setListener:(AppFrameworkListener *)a3
{
  self->_listener = a3;
}

- (int)pidForIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006AE750;
  block[3] = &unk_100934100;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)queue;
}

- (void)updateApplicationAliveStatus:(id)a3 isAlive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_applicationMap, "objectForKey:", v6));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setIsAlive:", v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_1009998F0, OS_LOG_TYPE_ERROR))
  {
    sub_10071AC44();
  }

}

- (void)launchApplication:(id)a3 restoringCentrals:(id)a4 peripherals:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1006AE924;
  v15[3] = &unk_100923270;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)openBundle:(id)a3 options:(id)a4
{
  -[BTAppInteraction openBundle:options:attempt:](self, "openBundle:options:attempt:", a3, a4, 0);
}

- (void)openBundle:(id)a3 options:(id)a4 attempt:(int)a5
{
  id v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  uint64_t v12;
  id *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[2];
  id v19;
  dispatch_time_t v20;
  int v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;

  v8 = a3;
  v9 = a4;
  v10 = qword_1009998F0;
  if (os_log_type_enabled((os_log_t)qword_1009998F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 1024;
    v29 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting To Launch Bundle: %{public}@ Options: %@ Attempt: %d", buf, 0x1Cu);
  }
  v11 = dispatch_time(0, 3000000000);
  if (a5 < 3)
  {
    v14 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v9));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1006AEF1C;
    v17[3] = &unk_100940110;
    v20 = v14;
    v18[0] = v8;
    v18[1] = self;
    v19 = v9;
    v21 = a5;
    objc_msgSend(v15, "openApplication:withOptions:completion:", v18[0], v16, v17);

    v13 = (id *)v18;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1009998F0, OS_LOG_TYPE_ERROR))
      sub_10071AD00();
    v12 = sub_1000419F4();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1006AEECC;
    v22[3] = &unk_1009172A0;
    v23 = v8;
    sub_100041A34(v12, v22);
    v13 = &v23;
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BTAppInteraction *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006AF208;
  v7[3] = &unk_100918340;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setCentralBackgroundingSupported:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006AF5D0;
  block[3] = &unk_100918340;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)setPeripheralBackgroundingSupported:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006AF72C;
  block[3] = &unk_100918340;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)takeAssertionForProcess:(id)a3 duration:(unint64_t)a4 isUrgent:(BOOL)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v8 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006AF9A8;
  v11[3] = &unk_1009197F0;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)createAssertionForBundleID:(id)a3 duration:(unint64_t)a4 isUrgent:(BOOL)a5 withPid:(int)a6
{
  uint64_t v6;
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  ProcessAssertion *v14;
  ProcessAssertion *v15;
  NSObject *v16;
  id v17;
  id *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _BYTE buf[24];

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v10 = a3;
  if (v7)
  {
    v11 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "(EE) Creating URGENT Process Assertion", buf, 2u);
    }
    v12 = 3;
  }
  else
  {
    v12 = 1;
  }
  v13 = sub_10003BE44();
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v13 + 344))(v13))
    v14 = -[ProcessAssertion initWithPID:flags:reason:name:]([ProcessAssertion alloc], "initWithPID:flags:reason:name:", v6, v12, 5, v10);
  else
    v14 = -[ProcessAssertion initWithBundleIdentifier:flags:reason:name:]([ProcessAssertion alloc], "initWithBundleIdentifier:flags:reason:name:", v10, v12, 5, v10);
  v15 = v14;
  if (v14 && -[ProcessAssertion acquire](v14, "acquire"))
  {
    v16 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Acquired process assertion for application \"%{public}s\", buf, 0xCu);
    }
    -[ProcessAssertion setSecondsLeft:](v15, "setSecondsLeft:", a4);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v15);
    if (v7)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1006B003C;
      v24[3] = &unk_100920120;
      v18 = &v25;
      objc_copyWeak(&v25, (id *)buf);
      -[ProcessAssertion setInvalidationHandler:](v15, "setInvalidationHandler:", v24);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_urgentAssertions, "setObject:forKeyedSubscript:", v15, v10);
    }
    else
    {
      v19 = _NSConcreteStackBlock;
      v20 = 3221225472;
      v21 = sub_1006B00AC;
      v22 = &unk_100920120;
      v18 = &v23;
      objc_copyWeak(&v23, (id *)buf);
      -[ProcessAssertion setInvalidationHandler:](v15, "setInvalidationHandler:", &v19);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processAssertions, "setObject:forKeyedSubscript:", v15, v10, v19, v20, v21, v22);
    }
    objc_destroyWeak(v18);
    if ((-[NSMutableDictionary count](self->_processAssertions, "count")
       || -[NSMutableDictionary count](self->_urgentAssertions, "count"))
      && !self->_assertionTimer)
    {
      -[BTAppInteraction startAssertionTimer](self, "startAssertionTimer");
    }
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_ERROR))
      sub_10071AEE8((uint64_t)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), (uint64_t)buf);
    -[ProcessAssertion invalidate](v15, "invalidate");
  }

}

- (void)urgentAssertionInvalidationCallback:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006B0198;
  v7[3] = &unk_100918340;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)assertionInvalidationCallback:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006B02D0;
  v7[3] = &unk_100918340;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)startAssertionTimer
{
  NSObject *v3;
  dispatch_source_s *v4;
  NSObject *assertionTimer;
  dispatch_time_t v6;
  _QWORD handler[5];
  uint8_t buf[16];

  -[BTAppInteraction invalidateAssertionTimer](self, "invalidateAssertionTimer");
  v3 = qword_1009997E8;
  if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating Assertion Timer", buf, 2u);
  }
  v4 = (dispatch_source_s *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  self->_assertionTimer = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1006B0514;
  handler[3] = &unk_1009172A0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
  assertionTimer = self->_assertionTimer;
  v6 = dispatch_time(0, 0);
  dispatch_source_set_timer(assertionTimer, v6, 0x3B9ACA00uLL, 0);
  dispatch_resume((dispatch_object_t)self->_assertionTimer);
}

- (void)invalidateAssertionTimer
{
  NSObject *v3;
  NSObject *assertionTimer;
  uint8_t v5[16];

  v3 = qword_1009997E8;
  if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating Assertion Timer", v5, 2u);
  }
  assertionTimer = self->_assertionTimer;
  if (assertionTimer)
  {
    dispatch_source_cancel(assertionTimer);
    dispatch_release((dispatch_object_t)self->_assertionTimer);
    self->_assertionTimer = 0;
  }
}

- (void)assertionTimerFired
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006B05F4;
  block[3] = &unk_1009172A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isPrivilegedBundleID:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.teslamotors.TeslaApp")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.teslamotors.enterpriseapp")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.rivian.ios.consumer"));
  }

  return v4;
}

- (void)disableHIP
{
  double v2;
  double v3;
  BOOL v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  objc_msgSend((id)qword_100994168, "timeIntervalSinceNow");
  v3 = fabs(v2);
  if (qword_100994168)
    v4 = v3 < 2.0;
  else
    v4 = 0;
  if (!v4)
  {
    v5 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(EE) Disabling HIP", v8, 2u);
    }
    notify_post("com.apple.request.hipuncap");
    v6 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = (void *)qword_100994168;
    qword_100994168 = v6;

  }
}

- (void)showPowerAlert:(id)a3 forDenylistMode:(BOOL)a4 validateBundle:(BOOL)a5
{
  id v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  BOOL v12;
  BOOL v13;

  v8 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) == 0)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006B0AF4;
    block[3] = &unk_100940208;
    block[4] = self;
    v11 = v8;
    v12 = a5;
    v13 = a4;
    dispatch_async(queue, block);

  }
}

- (void)powerAlertCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006B1108;
  v5[3] = &unk_100918868;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)showAppLaunchAlert:(id)a3 device:(id)a4 type:(int)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1006B134C;
  v13[3] = &unk_1009400E8;
  v13[4] = self;
  v14 = v8;
  v16 = a5;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)appLaunchCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006B1B3C;
  block[3] = &unk_1009183A0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)showPairingAlert:(id)a3 type:(int)a4 passkey:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[7];
  int v12;
  _QWORD v13[5];
  id v14;

  v8 = a3;
  if (a4 == 5 && os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_FAULT))
    sub_10071B158();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_1000627E4;
  v13[4] = sub_100062454;
  v14 = v8;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006B21FC;
  v11[3] = &unk_1009402A0;
  v11[4] = self;
  v11[5] = v13;
  v12 = a4;
  v11[6] = a5;
  v10 = v8;
  dispatch_async(queue, v11);
  _Block_object_dispose(v13, 8);

}

- (void)cancelPairingAlert:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BTAppInteraction *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006B3194;
  v7[3] = &unk_100918340;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)pairingAlertCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006B3428;
  block[3] = &unk_1009183A0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)printDebug
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v3 = qword_1009997E8;
  if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Active process assertions:", buf, 2u);
  }
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_processAssertions, "enumerateKeysAndObjectsUsingBlock:", &stru_1009402E0);
  v4 = qword_1009997E8;
  if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Active (URGENT) process assertions:", v5, 2u);
  }
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_urgentAssertions, "enumerateKeysAndObjectsUsingBlock:", &stru_100940300);
}

- (void)displayAirWaveLaunchNotification:(id *)a3 forProduct:(unsigned int)a4 reason:(unsigned __int8)a5 findMySerialNumber:(id)a6
{
  int v6;
  id v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  NSObject *loggingQueue;
  NSDate *v24;
  NSDate *lastAirWaveNotificationDate;
  _QWORD block[5];
  id v27;
  unsigned int v28;
  char v29;
  void *__p[2];
  char v31;
  char v32;
  uint8_t buf[8];
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;

  v6 = a5;
  v9 = a6;
  v32 = 0;
  v10 = sub_10003BE44();
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v10 + 424))(v10))
  {
    v11 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "displayAirWaveLaunchNotification: Unsupported source platform. Ignoring new request";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v14 = objc_msgSend(v13, "applicationIsInstalled:", CFSTR("com.apple.internal.WayFinder"));

  if ((v14 & 1) == 0)
  {
    v11 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "displayAirWaveLaunchNotification: AirWave isn't installed on this device. Ignoring new request.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (self->_isPopupInQueue)
  {
    v11 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "displayAirWaveLaunchNotification: Popup already in queue. Ignoring new request.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v15 = sub_100027F68();
  sub_100091AE8(buf, "AccessoryLogging");
  sub_100091AE8(__p, "SuppressAllPopups");
  v16 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(_QWORD *)v15 + 72))(v15, buf, __p, &v32);
  if (v32)
    v17 = v16;
  else
    v17 = 0;
  if (v31 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v37) < 0)
  {
    operator delete(*(void **)buf);
    if (v17)
      goto LABEL_19;
  }
  else if (v17)
  {
LABEL_19:
    v11 = qword_1009997E8;
    if (!os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v12 = "displayAirWaveLaunchNotification: \"Suppress all popups\" defaults write is set to true. Ignoring new request.";
    goto LABEL_10;
  }
  if ((a4 & 0xFFFFE000) == 0x2000)
  {
    if (self->_lastAirWaveNotificationDate)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "components:fromDate:toDate:options:", 16, self->_lastAirWaveNotificationDate, v18, 0));

      if ((uint64_t)objc_msgSend(v20, "day") <= 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_ERROR))
          sub_10071B440();

        goto LABEL_11;
      }

    }
    v21 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      v22 = "Invalid";
      if (v6 == 1)
        v22 = "Case Issue";
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = a4;
      if (!v6)
        v22 = "Unknown";
      v34 = 1024;
      v35 = v6;
      v36 = 2080;
      v37 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "displayAirWaveLaunchNotification: productID: 0x%04X, reason: %u (%s)", buf, 0x18u);
    }
    loggingQueue = self->_loggingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006B406C;
    block[3] = &unk_100940368;
    block[4] = self;
    v28 = a4;
    v29 = v6;
    v27 = v9;
    dispatch_async(loggingQueue, block);
    v24 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    lastAirWaveNotificationDate = self->_lastAirWaveNotificationDate;
    self->_lastAirWaveNotificationDate = v24;

    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_ERROR))
    sub_10071B46C();
LABEL_11:

}

- (void)showFoundAccessoryCrashAlert:(id)a3 productID:(unint64_t)a4 accessoryName:(id)a5 firmwareVersion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  __CFString *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *loggingQueue;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  int v32;
  __int16 v33;
  void *__p[2];
  char v35;
  uint8_t buf[8];
  char v37;
  char v38;

  v8 = *(_QWORD *)a3.var0;
  v10 = a5;
  v11 = a6;
  v38 = 0;
  if (self->_isPopupInQueue)
  {
    v12 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Warning: showFoundAccessoryCrashAlert: Suppressing duplicate popup";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  v14 = sub_100027F68();
  sub_100091AE8(buf, "AccessoryLogging");
  sub_100091AE8(__p, "SuppressAllPopups");
  v15 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(_QWORD *)v14 + 72))(v14, buf, __p, &v38);
  if (v38)
    v16 = v15;
  else
    v16 = 0;
  if (v35 < 0)
    operator delete(__p[0]);
  if ((v37 & 0x80000000) == 0)
  {
    if (v16)
      goto LABEL_11;
LABEL_15:
    if ((a4 - 8194) <= 0xE && ((1 << (a4 - 2)) & 0x409B) != 0 || (a4 & 0xFFFFFFFFFFFFE000) != 0x2000)
    {
      if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_ERROR))
        sub_10071B4CC();
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CBAccessoryLogging getProductNameFromProductID:](CBAccessoryLogging, "getProductNameFromProductID:", a4));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Crash Detected"), v17));
      v19 = sub_100355F10(CFSTR("TITLE"), v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if (objc_msgSend(v11, "length"))
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (FW %@)"), v11));
      else
        v21 = &stru_100941758;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Do you want to retrieve the crash log from %@%@, then open Tap-to-Radar to report the crash?  Audio quality may be poor during retrieval (~30 sec)."), v10, v21));
      v23 = sub_100355F10(CFSTR("CONTENT"), v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

      loggingQueue = self->_loggingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1006B496C;
      block[3] = &unk_100940390;
      block[4] = self;
      v29 = v20;
      v30 = v24;
      v32 = v8;
      v33 = WORD2(v8);
      v31 = v10;
      v26 = v24;
      v27 = v20;
      dispatch_async(loggingQueue, block);

    }
    goto LABEL_19;
  }
  operator delete(*(void **)buf);
  if (!v16)
    goto LABEL_15;
LABEL_11:
  v12 = qword_1009997E8;
  if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v13 = "Warning: showFoundAccessoryCrashAlert: Suppressing popup for automation";
    goto LABEL_13;
  }
LABEL_19:

}

- (void)showFoundAccessoryLogAlert:(id)a3 isCrash:(BOOL)a4 pid:(unint64_t)a5 accessoryName:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *loggingQueue;
  _QWORD block[4];
  id v27;
  id v28;
  BTAppInteraction *v29;
  id v30;
  unint64_t v31;
  BOOL v32;
  void *__p[2];
  char v34;
  uint8_t buf[8];
  char v36;
  char v37;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v37 = 0;
  if (!objc_msgSend(v10, "count"))
  {
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_ERROR))
      sub_10071B558();
    goto LABEL_13;
  }
  v12 = sub_100027F68();
  sub_100091AE8(buf, "AccessoryLogging");
  sub_100091AE8(__p, "SuppressAllPopups");
  v13 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(_QWORD *)v12 + 72))(v12, buf, __p, &v37);
  if (v37)
    v14 = v13;
  else
    v14 = 0;
  if (v34 < 0)
    operator delete(__p[0]);
  if (v36 < 0)
  {
    operator delete(*(void **)buf);
    if (v14)
    {
LABEL_9:
      v15 = qword_1009997E8;
      if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Warning: showFoundAccessoryLogAlert: Suppressing popup for automation", buf, 2u);
      }
LABEL_13:
      v16 = 0;
      v17 = 0;
      v18 = 0;
      goto LABEL_22;
    }
  }
  else if (v14)
  {
    goto LABEL_9;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBAccessoryLogging getProductNameFromProductID:](CBAccessoryLogging, "getProductNameFromProductID:", a5));
  if (v8)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Crash Detected"), v16));
    v20 = sub_100355F10(CFSTR("TITLE"), v19);
    v17 = (id)objc_claimAutoreleasedReturnValue(v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Do you want to use Tap-to-Radar to report the failure found on %@?"), v11));
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Log Collection Done"), v16));
    v24 = sub_100355F10(CFSTR("TITLE"), v23);
    v17 = (id)objc_claimAutoreleasedReturnValue(v24);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Do you want to use Tap-to-Radar and attach the log from %@?"), v11));
  }
  v22 = sub_100355F10(CFSTR("CONTENT"), v21);
  v18 = (id)objc_claimAutoreleasedReturnValue(v22);

  if ((_DWORD)a5)
  {
    loggingQueue = self->_loggingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006B5048;
    block[3] = &unk_1009403B8;
    v17 = v17;
    v27 = v17;
    v18 = v18;
    v28 = v18;
    v29 = self;
    v32 = v8;
    v30 = v10;
    v31 = a5;
    dispatch_async(loggingQueue, block);

  }
  else if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_ERROR))
  {
    sub_10071B584();
  }
LABEL_22:

}

- (void)showFileRadarNotification:(id)a3 reason:(int)a4 pid:(unint64_t)a5
{
  NSObject *v5;
  const char *v6;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *loggingQueue;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  int v34;
  int v35;
  __int16 v36;
  void *__p[2];
  char v38;
  uint8_t buf[8];
  char v40;
  char v41;

  v41 = 0;
  if (self->_isPopupInQueue)
  {
    v5 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Warning: showFileRadarNotification: Suppressing duplicate popup";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v9 = *(_QWORD *)a3.var0;
  v11 = sub_100027F68();
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11) & 1) == 0)
  {
    v5 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Warning: showFileRadarNotification: Suppressing popup on external build";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (qword_100977A88 != -1)
    dispatch_once(&qword_100977A88, &stru_1009404E8);
  if (!sub_10029AD9C((uint64_t)off_100977A80, v9 & 0xFFFFFFFFFFFFLL))
  {
    v5 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Warning: showFileRadarNotification: No AACP connection";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v12 = sub_100027F68();
  sub_100091AE8(buf, "AccessoryLogging");
  sub_100091AE8(__p, "SuppressAllPopups");
  v13 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(_QWORD *)v12 + 72))(v12, buf, __p, &v41);
  if (v41)
    v14 = v13;
  else
    v14 = 0;
  if (v38 < 0)
    operator delete(__p[0]);
  if (v40 < 0)
  {
    operator delete(*(void **)buf);
    if (v14)
    {
LABEL_15:
      v5 = qword_1009997E8;
      if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v6 = "showFileRadarNotification: Suppressing popup for automation";
        goto LABEL_21;
      }
LABEL_22:
      v15 = 0;
      goto LABEL_23;
    }
  }
  else if (v14)
  {
    goto LABEL_15;
  }
  v15 = (id)objc_claimAutoreleasedReturnValue(+[CBAccessoryLogging getProductNameFromProductID:](CBAccessoryLogging, "getProductNameFromProductID:", a5));
  if (a4 == 5)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ In-Ear Anomaly"), v15));
    v23 = sub_100355F10(CFSTR("TITLE"), v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("An in-ear detection anomaly has been detected on your %@.  Would you like to file a radar?  (If you do, please keep the buds in their current state while filing.)"), v15));
    v24 = sub_100355F10(CFSTR("CONTENT"), v19);
    v21 = objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_29;
  }
  if (a4 == 4)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Audio Stream Failure"), v15));
    v17 = sub_100355F10(CFSTR("TITLE"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The audio stream to your %@ failed to properly start.  Would you like to file a radar?"), v15));
    v20 = sub_100355F10(CFSTR("CONTENT"), v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
LABEL_29:
    v25 = (void *)v21;

    loggingQueue = self->_loggingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006B55B0;
    block[3] = &unk_1009403E0;
    block[4] = self;
    v30 = v18;
    v31 = v25;
    v35 = v9;
    v36 = WORD2(v9);
    v15 = v15;
    v34 = a4;
    v32 = v15;
    v33 = a5;
    v27 = v25;
    v28 = v18;
    dispatch_async(loggingQueue, block);

    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_ERROR))
    sub_10071B5E8();
LABEL_23:

}

- (void)openTapToRadarWithAccessoryLogs:(id)a3 reason:(int)a4 pid:(unint64_t)a5
{
  id v7;
  NSURLComponents *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSMutableString *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *i;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];

  v7 = a3;
  v8 = objc_opt_new(NSURLComponents);
  v9 = objc_opt_new(NSMutableArray);
  -[NSURLComponents setScheme:](v8, "setScheme:", CFSTR("tap-to-radar"));
  -[NSURLComponents setHost:](v8, "setHost:", CFSTR("new"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[CBAccessoryLogging getProductNameFromProductID:](CBAccessoryLogging, "getProductNameFromProductID:", a5));
  if ((a4 - 2) < 4)
  {
    if (objc_msgSend(v7, "count"))
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("sysdiagnose-only")));
    else
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ExtensionIdentifiers"), CFSTR("com.apple.DiagnosticExtensions.BluetoothHeadset")));
    -[NSMutableArray addObject:](v9, "addObject:", v10);

    switch(a4)
    {
      case 2:
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Title"), CFSTR("Please enter your title here")));
        -[NSMutableArray addObject:](v9, "addObject:", v13);
        break;
      case 4:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug")));
        -[NSMutableArray addObject:](v9, "addObject:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] A2DP Stream Start Failure: "), v48));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Title"), v21));
        -[NSMutableArray addObject:](v9, "addObject:", v22);

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Please describe what you were doing with your %@ here"), v48));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Description"), v23));
        -[NSMutableArray addObject:](v9, "addObject:", v24);

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Keywords"), CFSTR("1474196")));
        -[NSMutableArray addObject:](v9, "addObject:", v13);
        break;
      case 5:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug")));
        -[NSMutableArray addObject:](v9, "addObject:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] IED anomaly: "), v48));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Title"), v16));
        -[NSMutableArray addObject:](v9, "addObject:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Please describe the current bud state of your %@ (Are the buds in-ear, in-case, in hand, in pocket, sitting on a table, something else):\n\nPlease describe what you are doing with the buds (including body movement like exercising, or mouth movement like talking):"), v48));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Description"), v18));
        -[NSMutableArray addObject:](v9, "addObject:", v19);

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Keywords"), CFSTR("1521114")));
        -[NSMutableArray addObject:](v9, "addObject:", v13);
        break;
      default:
        goto LABEL_33;
    }
    goto LABEL_15;
  }
  if (a4 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ExtensionIdentifiers"), CFSTR("com.apple.DiagnosticExtensions.BluetoothHeadset")));
    -[NSMutableArray addObject:](v9, "addObject:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Crash/Hang/Data Loss")));
    -[NSMutableArray addObject:](v9, "addObject:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Crash: "), v48));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Title"), v13));
    -[NSMutableArray addObject:](v9, "addObject:", v14);

LABEL_15:
    v25 = sub_10003BE44();
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v25 + 424))(v25))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("1336450")));
      -[NSMutableArray addObject:](v9, "addObject:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("ULLA (New Bugs)")));
      -[NSMutableArray addObject:](v9, "addObject:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("N301 Non-UI")));
      -[NSMutableArray addObject:](v9, "addObject:", v28);
    }
    else
    {
      if (a4 == 5)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), +[CBAccessoryLogging getComponentIDFromRadarReason:](CBAccessoryLogging, "getComponentIDFromRadarReason:", 5)));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentID"), v29));
        -[NSMutableArray addObject:](v9, "addObject:", v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[CBAccessoryLogging getComponentNameFromRadarReason:](CBAccessoryLogging, "getComponentNameFromRadarReason:", 5));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentName"), v31));
        -[NSMutableArray addObject:](v9, "addObject:", v32);

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[CBAccessoryLogging getComponentVersionFromRadarReason:](CBAccessoryLogging, "getComponentVersionFromRadarReason:", 5));
      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), +[CBAccessoryLogging getComponentIDFromProductID:](CBAccessoryLogging, "getComponentIDFromProductID:", a5)));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentID"), v34));
        -[NSMutableArray addObject:](v9, "addObject:", v35);

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[CBAccessoryLogging getComponentNameFromProductID:](CBAccessoryLogging, "getComponentNameFromProductID:", a5));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentName"), v36));
        -[NSMutableArray addObject:](v9, "addObject:", v37);

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[CBAccessoryLogging getComponentVersionFromProductID:](CBAccessoryLogging, "getComponentVersionFromProductID:", a5));
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("ComponentVersion"), v28));
      -[NSMutableArray addObject:](v9, "addObject:", v33);

    }
    if (objc_msgSend(v7, "count"))
    {
      v38 = objc_opt_new(NSMutableString);
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v39 = v7;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v41)
              objc_enumerationMutation(v39);
            -[NSMutableString appendString:](v38, "appendString:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i));
            -[NSMutableString appendString:](v38, "appendString:", CFSTR(","));
          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        }
        while (v40);
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("Attachments"), v38));
      -[NSMutableArray addObject:](v9, "addObject:", v43);

    }
    -[NSURLComponents setQueryItems:](v8, "setQueryItems:", v9);
    v44 = qword_1009997E8;
    if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_DEFAULT))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents string](v8, "string"));
      *(_DWORD *)buf = 138543362;
      v54 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "openTapToRadarWithAccessoryLogs: Launch Tap-to-Radar, URL = %{public}@", buf, 0xCu);

    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v8, "URL"));
    objc_msgSend(v46, "openURL:configuration:completionHandler:", v47, 0, &stru_100940400);

    goto LABEL_33;
  }
  if (os_log_type_enabled((os_log_t)qword_1009997E8, OS_LOG_TYPE_ERROR))
    sub_10071B648();
LABEL_33:

}

- (void)btControllerTapToRadar:(int)a3 reason:(id)a4 cid:(id)a5 cname:(id)a6 cvers:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *loggingQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  loggingQueue = self->_loggingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006B6310;
  block[3] = &unk_100940448;
  v26 = a3;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(loggingQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAirWaveNotificationDate, 0);
  objc_storeStrong((id *)&self->_pendingResurrection, 0);
  objc_storeStrong((id *)&self->_urgentAssertions, 0);
  objc_storeStrong((id *)&self->_processAssertions, 0);
  objc_storeStrong((id *)&self->_pairingNotifications, 0);
  objc_storeStrong((id *)&self->_launchNotifications, 0);
  objc_storeStrong((id *)&self->_powerNotification, 0);
  objc_storeStrong((id *)&self->_uninstallObserver, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_applicationMap, 0);
}

@end
