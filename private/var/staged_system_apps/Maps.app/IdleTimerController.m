@implementation IdleTimerController

- (IdleTimerController)init
{
  IdleTimerController *v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSMutableDictionary *states;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  _QWORD block[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)IdleTimerController;
  v2 = -[IdleTimerController init](&v16, "init");
  if (v2)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v3 = +[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", UIWindowSceneSessionRoleApplication);
      *((_BYTE *)v13 + 24) = v3;
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1004F74D4;
      block[3] = &unk_1011AFF60;
      block[4] = &v12;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
      v3 = *((_BYTE *)v13 + 24);
    }
    v2->_isForeground = v3;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    states = v2->_states;
    v2->_states = (NSMutableDictionary *)v4;

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.Maps.IdleTimer", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    -[IdleTimerController _startObservingApplicationState](v2, "_startObservingApplicationState");
    _Block_object_dispose(&v12, 8);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self->_backgroundingObserverToken);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self->_foregroundingObserverToken);

  v5.receiver = self;
  v5.super_class = (Class)IdleTimerController;
  -[IdleTimerController dealloc](&v5, "dealloc");
}

- (void)setDesiredIdleTimerState:(unint64_t)a3 forReason:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v8[4];
  id v9[3];
  id location;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004F7644;
  v8[3] = &unk_1011AEE38;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  v9[2] = (id)a4;
  dispatch_async(queue, v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_setDesiredIdleTimerState:(unint64_t)a3 forReason:(unint64_t)a4
{
  NSMutableDictionary *states;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  states = self->_states;
  v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](states, "objectForKeyedSubscript:", v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  LOBYTE(v8) = objc_msgSend(v13, "isEqual:", v9);

  if ((v8 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v11 = self->_states;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

    -[IdleTimerController _updateApplicableStates](self, "_updateApplicableStates");
    -[IdleTimerController _updateBatteryMonitoring](self, "_updateBatteryMonitoring");
    -[IdleTimerController _updateIdleTimer](self, "_updateIdleTimer");
  }

}

- (NSString)description
{
  NSObject *queue;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1004F7898;
  v14 = sub_1004F78A8;
  v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004F78B0;
  block[3] = &unk_1011ADF48;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(queue, block);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p %@>"), v6, self, v11[5]));

  _Block_object_dispose(&v10, 8);
  return (NSString *)v7;
}

- (id)_summaryString
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  if (!-[NSMutableDictionary count](self->_states, "count"))
    return CFSTR("-");
  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableDictionary count](self->_states, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_states, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_states, "objectForKeyedSubscript:", v10));
        v12 = objc_msgSend(v10, "unsignedIntegerValue");
        v13 = CFSTR("Unknown");
        if ((unint64_t)v12 <= 4)
          v13 = *(&off_1011B9598 + (_QWORD)v12);
        v14 = objc_msgSend(v11, "unsignedIntegerValue");
        v15 = CFSTR("Unknown");
        if ((unint64_t)v14 <= 2)
          v15 = *(&off_1011B95C0 + (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v13, v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_applicableStates, "objectForKey:", v10));

        if (!v17)
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR("(Ignored)")));

          v16 = (void *)v18;
        }
        objc_msgSend(v3, "addObject:", v16);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
  return v19;
}

- (void)_updateApplicableStates
{
  NSMutableDictionary *states;
  NSMutableDictionary *v4;
  NSMutableDictionary *applicableStates;
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  IdleTimerController *v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  states = self->_states;
  if (self->_isForeground)
  {
    v4 = (NSMutableDictionary *)-[NSMutableDictionary copy](states, "copy");
    applicableStates = self->_applicableStates;
    self->_applicableStates = v4;
  }
  else
  {
    v6 = -[NSMutableDictionary mutableCopy](states, "mutableCopy");
    v7 = self->_states;
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1004F7C84;
    v16 = &unk_1011B9500;
    v17 = self;
    v18 = v6;
    applicableStates = (NSMutableDictionary *)v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", &v13);
    v8 = (NSMutableDictionary *)-[NSMutableDictionary copy](applicableStates, "copy", v13, v14, v15, v16, v17);
    v9 = self->_applicableStates;
    self->_applicableStates = v8;

  }
  v10 = sub_1004338EC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IdleTimerController _summaryString](self, "_summaryString"));
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updated applicable states: %@", buf, 0xCu);

  }
}

- (void)_setMonitoringBattery:(BOOL)a3
{
  _BOOL4 v3;
  BatteryMonitorToken *batteryToken;
  id v6;
  NSObject *v7;
  void *v8;
  BatteryMonitorToken *v9;
  BatteryMonitorToken *v10;
  id v11;
  NSObject *v12;
  BatteryMonitorToken *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_monitoringBattery != v3)
  {
    self->_monitoringBattery = v3;
    batteryToken = self->_batteryToken;
    if (v3)
    {
      if (!batteryToken)
      {
        v6 = sub_1004338EC();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Start monitoring battery", buf, 2u);
        }

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[BatteryMonitorController sharedInstance](BatteryMonitorController, "sharedInstance"));
        v9 = (BatteryMonitorToken *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "beginMonitoringBattery"));
        v10 = self->_batteryToken;
        self->_batteryToken = v9;

        -[BatteryMonitorToken setDelegate:](self->_batteryToken, "setDelegate:", self);
      }
    }
    else if (batteryToken)
    {
      v11 = sub_1004338EC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Stop monitoring battery", v14, 2u);
      }

      v13 = self->_batteryToken;
      self->_batteryToken = 0;

    }
  }
}

- (void)_updateBatteryMonitoring
{
  NSMutableDictionary *applicableStates;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  applicableStates = self->_applicableStates;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1004F7EA8;
  v4[3] = &unk_1011B9528;
  v4[4] = &v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](applicableStates, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[IdleTimerController _setMonitoringBattery:](self, "_setMonitoringBattery:", *((unsigned __int8 *)v6 + 24));
  _Block_object_dispose(&v5, 8);
}

- (void)_updateIdleTimer
{
  NSMutableDictionary *applicableStates;
  uint64_t v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  applicableStates = self->_applicableStates;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004F7FF4;
  v5[3] = &unk_1011B9550;
  v5[4] = &v10;
  v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](applicableStates, "enumerateKeysAndObjectsUsingBlock:", v5);
  if (*((_BYTE *)v11 + 24))
  {
    v4 = 1;
  }
  else if (*((_BYTE *)v7 + 24))
  {
    v4 = (uint64_t)-[BatteryMonitorToken batteryIsChargingOrFull](self->_batteryToken, "batteryIsChargingOrFull");
  }
  else
  {
    v4 = 0;
  }
  -[IdleTimerController _setIdleTimerDisabled:](self, "_setIdleTimerDisabled:", v4);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)_setIdleTimerDisabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v3)
    -[IdleTimerController _takeIdleTimerAssertion](self, "_takeIdleTimerAssertion");
  else
    -[IdleTimerController _releaseIdleTimerAssertion](self, "_releaseIdleTimerAssertion");
}

- (void)_takeIdleTimerAssertion
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  BSInvalidatable *v7;
  id v8;
  BSInvalidatable *idleTimerAssertion;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_idleTimerAssertion)
  {
    v3 = sub_1004338EC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Taking assertion to disable idle timer", buf, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ITIdleTimerState sharedInstance](ITIdleTimerState, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdleTimerController _assertionReasonString](self, "_assertionReasonString"));
    v12 = 0;
    v7 = (BSInvalidatable *)objc_msgSend(v5, "newAssertionToDisableIdleTimerForReason:error:", v6, &v12);
    v8 = v12;
    idleTimerAssertion = self->_idleTimerAssertion;
    self->_idleTimerAssertion = v7;

    if (!self->_idleTimerAssertion)
    {
      v10 = sub_1004338EC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error acquiring idle timer assertion: %@", buf, 0xCu);
      }

    }
  }
}

- (void)_releaseIdleTimerAssertion
{
  id v3;
  NSObject *v4;
  BSInvalidatable *idleTimerAssertion;
  uint8_t v6[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_idleTimerAssertion)
  {
    v3 = sub_1004338EC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Releasing idle timer assertion", v6, 2u);
    }

    -[BSInvalidatable invalidate](self->_idleTimerAssertion, "invalidate");
    idleTimerAssertion = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0;

  }
}

- (BOOL)_idleTimerReasonPermittedInBackground:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_startObservingApplicationState
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  id backgroundingObserverToken;
  void *v9;
  void *v10;
  void *v11;
  id foregroundingObserverToken;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  id location;

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004F8460;
  v15[3] = &unk_1011B9578;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  v3 = objc_retainBlock(v15);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004F84E4;
  v13[3] = &unk_1011B9578;
  v13[4] = self;
  objc_copyWeak(&v14, &location);
  v4 = objc_retainBlock(v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", UISceneDidEnterBackgroundNotification, 0, v6, v4));
  backgroundingObserverToken = self->_backgroundingObserverToken;
  self->_backgroundingObserverToken = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", UISceneWillEnterForegroundNotification, 0, v10, v3));
  foregroundingObserverToken = self->_foregroundingObserverToken;
  self->_foregroundingObserverToken = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldIgnoreScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "role"));
  if (objc_msgSend(v5, "isEqualToString:", UIWindowSceneSessionRoleApplication))
    v6 = +[UIApplication _maps_shouldIgnoreActivationStateForScene:](UIApplication, "_maps_shouldIgnoreActivationStateForScene:", v3);
  else
    v6 = 1;

  return v6;
}

- (void)_syncUpdateForApplicationState:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *queue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  const char *v12;

  v3 = a3;
  v5 = sub_1004338EC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = "background";
    if (v3)
      v7 = "foreground";
    *(_DWORD *)buf = 136315138;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Update timer (sync), main scenes are now %s", buf, 0xCu);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004F8710;
  v9[3] = &unk_1011ACE58;
  v9[4] = self;
  v10 = v3;
  dispatch_sync(queue, v9);
}

- (void)_asyncUpdateForApplicationState:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *queue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  const char *v12;

  v3 = a3;
  v5 = sub_1004338EC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = "background";
    if (v3)
      v7 = "foreground";
    *(_DWORD *)buf = 136315138;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Update timer (async), main scenes are now %s", buf, 0xCu);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004F882C;
  v9[3] = &unk_1011ACE58;
  v9[4] = self;
  v10 = v3;
  dispatch_async(queue, v9);
}

- (void)_updateForApplicationState:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_isForeground = a3;
  -[IdleTimerController _updateApplicableStates](self, "_updateApplicableStates");
  -[IdleTimerController _updateBatteryMonitoring](self, "_updateBatteryMonitoring");
  -[IdleTimerController _updateIdleTimer](self, "_updateIdleTimer");
}

- (id)_assertionReasonString
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IdleTimerController _reasonString](self, "_reasonString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Maps {%@}"), v3));

  return v4;
}

- (id)_reasonString
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[NSMutableDictionary count](self->_applicableStates, "count"))
    return CFSTR("-");
  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableDictionary count](self->_states, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_applicableStates, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_applicableStates, "objectForKeyedSubscript:", v10));
        v12 = objc_msgSend(v10, "unsignedIntegerValue");
        v13 = CFSTR("Unknown");
        if ((unint64_t)v12 <= 4)
          v13 = *(&off_1011B9598 + (_QWORD)v12);
        v14 = objc_msgSend(v11, "unsignedIntegerValue");
        v15 = CFSTR("Unknown");
        if ((unint64_t)v14 <= 2)
          v15 = *(&off_1011B95C0 + (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v13, v15));
        objc_msgSend(v3, "addObject:", v16);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
  return v17;
}

- (void)batteryMonitorTokenWitnessedChangeInBatteryState:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004F8B5C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundingObserverToken, 0);
  objc_storeStrong(&self->_foregroundingObserverToken, 0);
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_batteryToken, 0);
  objc_storeStrong((id *)&self->_applicableStates, 0);
  objc_storeStrong((id *)&self->_states, 0);
}

@end
