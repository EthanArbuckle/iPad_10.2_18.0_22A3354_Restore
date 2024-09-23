@implementation _DASConsoleModePolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "schedulingPriority");
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (_DASConsoleModePolicy)init
{
  _DASConsoleModePolicy *v2;
  _DASConsoleModePolicy *v3;
  NSString *policyName;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *consoleModeQueue;
  const char *v9;
  NSObject *v10;
  _DASConsoleModePolicy *v11;
  _QWORD handler[4];
  _DASConsoleModePolicy *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_DASConsoleModePolicy;
  v2 = -[_DASConsoleModePolicy init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Console Mode Policy");

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.dasd.consoleModeQueue", v6);
    consoleModeQueue = v3->_consoleModeQueue;
    v3->_consoleModeQueue = (OS_dispatch_queue *)v7;

    v9 = (const char *)objc_msgSend(CFSTR("com.apple.system.console_mode_changed"), "UTF8String");
    v10 = v3->_consoleModeQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003F8D4;
    handler[3] = &unk_10015D9B8;
    v11 = v3;
    v14 = v11;
    notify_register_dispatch(v9, &v3->_notifyToken, v10, handler);
    -[_DASConsoleModePolicy consoleModeNotificationHandler](v11, "consoleModeNotificationHandler");

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F950;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB568 != -1)
    dispatch_once(&qword_1001AB568, block);
  return (id)qword_1001AB570;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = a4;
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Console Mode Policy"));
  if (self->_isConsoleModeActive)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
    objc_msgSend(v11, "timeIntervalSinceNow");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASApplicationPolicy focalApplicationsWithContext:](_DASApplicationPolicy, "focalApplicationsWithContext:", v7));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          if ((objc_msgSend(v12, "containsObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i)) & 1) != 0)
          {

            -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("app foreground."), 1.0, 1.0);
            v20 = 0;
            goto LABEL_12;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v15)
          continue;
        break;
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isConsoleModeActive));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("consoleModeStatus = %@"), v18));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v19);

    v20 = 33;
LABEL_12:

  }
  else
  {
    v20 = 0;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v20, v8, (double)0x384uLL));

  return v21;
}

- (void)consoleModeNotificationHandler
{
  int notifyToken;
  uint32_t state;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v10;

  state64 = 0;
  notifyToken = self->_notifyToken;
  if (notifyToken == -1)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("consoleModePolicy")));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Invalid notify token", buf, 2u);
    }

  }
  else
  {
    state = notify_get_state(notifyToken, &state64);
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("consoleModePolicy")));
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (state)
    {
      if (v6)
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v10) = state;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notify_get_state() failed with error %u", buf, 8u);
      }

    }
    else
    {
      if (v6)
      {
        *(_DWORD *)buf = 134217984;
        v10 = state64;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Console Mode Status is now %llu", buf, 0xCu);
      }

      self->_isConsoleModeActive = state64 != 0;
    }
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (OS_dispatch_queue)consoleModeQueue
{
  return self->_consoleModeQueue;
}

- (void)setConsoleModeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_consoleModeQueue, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (BOOL)isConsoleModeActive
{
  return self->_isConsoleModeActive;
}

- (void)setIsConsoleModeActive:(BOOL)a3
{
  self->_isConsoleModeActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consoleModeQueue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
