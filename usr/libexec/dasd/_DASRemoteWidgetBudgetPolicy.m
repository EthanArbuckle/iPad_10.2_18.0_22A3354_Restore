@implementation _DASRemoteWidgetBudgetPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  id v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "schedulingPriority");
  if ((unint64_t)v4 <= _DASSchedulingPriorityUtility && objc_msgSend(v3, "targetDevice") == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widgetID"));
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  const __CFString *v10;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBudgetManager sharedInstance](_DASBudgetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "budgetKeyPathForBudgetName:", CFSTR("com.apple.dasd.remoteWidget")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v3));

  v11[0] = CFSTR("identifier");
  v11[1] = CFSTR("predicate");
  v12[0] = CFSTR("com.apple.das.remoteWidgetBudget");
  v12[1] = v4;
  v11[2] = CFSTR("deviceSet");
  v11[3] = CFSTR("mustWake");
  v12[2] = &off_10016EC18;
  v12[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
  v13[0] = v5;
  v9 = CFSTR("identifier");
  v10 = CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));

  return v7;
}

- (_DASRemoteWidgetBudgetPolicy)init
{
  _DASRemoteWidgetBudgetPolicy *v2;
  os_log_t v3;
  OS_os_log *log;
  NSString *policyName;
  NSString *policyDescription;
  uint64_t v7;
  NSArray *triggers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASRemoteWidgetBudgetPolicy;
  v2 = -[_DASRemoteWidgetBudgetPolicy init](&v10, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.duetactivityscheduler", "remotewidgetbudget");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Remote Widget Budget Policy");

    policyDescription = v2->_policyDescription;
    v2->_policyDescription = (NSString *)CFSTR("Blocks remote widget activities based on remaining budget.");

    v7 = objc_claimAutoreleasedReturnValue(-[_DASRemoteWidgetBudgetPolicy initializeTriggers](v2, "initializeTriggers"));
    triggers = v2->_triggers;
    v2->_triggers = (NSArray *)v7;

    -[_DASRemoteWidgetBudgetPolicy loadUnavailable](v2, "loadUnavailable");
    -[_DASRemoteWidgetBudgetPolicy registerDailyTimer](v2, "registerDailyTimer");
  }
  return v2;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100090680;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABC20 != -1)
    dispatch_once(&qword_1001ABC20, block);
  return (id)qword_1001ABC28;
}

+ (BOOL)isBudgetAvailable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
    v7 = 1;
  else
    v7 = +[_DASRemoteWidgetBudgetPolicy budgetIsPositive:](_DASRemoteWidgetBudgetPolicy, "budgetIsPositive:", v3);

  return v7;
}

+ (BOOL)budgetIsPositive:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBudgetManager sharedInstance](_DASBudgetManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "budgetKeyPathForBudgetName:", CFSTR("com.apple.dasd.remoteWidget")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));

  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 1;

  return v7;
}

- (void)registerDailyTimer
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("remoteWidgetLoggingInterval")));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v9 = v8;
  global_queue = dispatch_get_global_queue(-32768, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);

  if (v9 >= v7)
  {
    v16 = dispatch_walltime(0, 86400000000000);
    dispatch_source_set_timer(v12, v16, 0x4E94914F0000uLL, 0x3B9ACA00uLL);
    v14 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9 + 86400.0));
    -[NSObject setObject:forKey:](v14, "setObject:forKey:", v15, CFSTR("remoteWidgetLoggingInterval"));
    goto LABEL_5;
  }
  v13 = dispatch_walltime(0, (uint64_t)((v7 - v9) * 1000000000.0));
  dispatch_source_set_timer(v12, v13, 0x4E94914F0000uLL, 0x3B9ACA00uLL);
  v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteWidgetBudget")));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v7));
    *(_DWORD *)buf = 138412290;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Analytics will fire at %@", buf, 0xCu);
LABEL_5:

  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100090A50;
  handler[3] = &unk_10015D4E0;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_activate(v12);

}

- (void)logExhaustedDuration:(double)a3 withPluginConsideration:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  _BOOL4 v7;
  id (*v8)(uint64_t);
  void ***v9;
  void **v10;
  void **v11;

  v4 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteWidgetBudget")));
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
      sub_1000E768C(a3);

    v11 = _NSConcreteStackBlock;
    v8 = sub_100090C44;
    v9 = &v11;
  }
  else
  {
    if (v7)
      sub_1000E771C(a3);

    v10 = _NSConcreteStackBlock;
    v8 = sub_100090CF0;
    v9 = &v10;
  }
  v9[1] = (void **)3221225472;
  v9[2] = (void **)v8;
  v9[3] = (void **)&unk_10015F480;
  *((double *)v9 + 4) = a3;
  AnalyticsSendEventLazy(CFSTR("com.apple.dasd.budget"), v9);
}

- (void)logUnavailableDurationWithState:(id)a3
{
  id v4;
  unsigned __int8 v5;
  NSDate *unavailableDate;
  NSDate **p_unavailableDate;
  double v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSDate *v16;
  NSDate *v17;
  NSDate *v18;

  v4 = a3;
  v5 = +[_DASRemoteWidgetBudgetPolicy budgetIsPositive:](_DASRemoteWidgetBudgetPolicy, "budgetIsPositive:", v4);
  p_unavailableDate = &self->_unavailableDate;
  unavailableDate = self->_unavailableDate;
  if ((v5 & 1) != 0)
  {
    if (unavailableDate)
    {
      -[NSDate timeIntervalSinceNow](unavailableDate, "timeIntervalSinceNow");
      if (v8 >= -86400.0)
      {
        -[_DASRemoteWidgetBudgetPolicy logExhaustedDuration:withPluginConsideration:](self, "logExhaustedDuration:withPluginConsideration:", 0, -v8);
      }
      else
      {
        v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteWidgetBudget")));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_1000E77AC((uint64_t)&self->_unavailableDate, v9, v10, v11, v12, v13, v14, v15);

      }
      v18 = *p_unavailableDate;
      if (*p_unavailableDate || self->_unavailableToday)
      {
        self->_unavailableDate = 0;

        self->_unavailableToday = 0;
        goto LABEL_13;
      }
    }
  }
  else if (!unavailableDate)
  {
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v17 = self->_unavailableDate;
    self->_unavailableDate = v16;

LABEL_13:
    -[_DASRemoteWidgetBudgetPolicy saveUnavailableDate:](self, "saveUnavailableDate:", self->_unavailableDate);
  }
  -[_DASRemoteWidgetBudgetPolicy logActualUnavailableDurationWithState:](self, "logActualUnavailableDurationWithState:", v4);

}

- (void)logActualUnavailableDurationWithState:(id)a3
{
  unsigned __int8 v4;
  NSDate *actualUnavailableDate;
  NSDate **p_actualUnavailableDate;
  double v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSDate *v15;
  NSDate *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSDate *v24;

  v4 = +[_DASRemoteWidgetBudgetPolicy isBudgetAvailable:](_DASRemoteWidgetBudgetPolicy, "isBudgetAvailable:", a3);
  p_actualUnavailableDate = &self->_actualUnavailableDate;
  actualUnavailableDate = self->_actualUnavailableDate;
  if ((v4 & 1) != 0)
  {
    if (actualUnavailableDate)
    {
      -[NSDate timeIntervalSinceNow](actualUnavailableDate, "timeIntervalSinceNow");
      if (v7 >= -86400.0)
      {
        -[_DASRemoteWidgetBudgetPolicy logExhaustedDuration:withPluginConsideration:](self, "logExhaustedDuration:withPluginConsideration:", 1, -v7);
LABEL_12:
        v24 = *p_actualUnavailableDate;
        if (*p_actualUnavailableDate)
        {
          self->_actualUnavailableDate = 0;

          -[_DASRemoteWidgetBudgetPolicy saveActualUnavailableDate:](self, "saveActualUnavailableDate:", self->_actualUnavailableDate);
        }
        return;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteWidgetBudget")));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000E784C((uint64_t)&self->_actualUnavailableDate, v8, v9, v10, v11, v12, v13, v14);
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("remoteWidgetBudget")));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000E7818(v8, v17, v18, v19, v20, v21, v22, v23);
    }

    goto LABEL_12;
  }
  if (!actualUnavailableDate)
  {
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v16 = self->_actualUnavailableDate;
    self->_actualUnavailableDate = v15;

    -[_DASRemoteWidgetBudgetPolicy saveActualUnavailableDate:](self, "saveActualUnavailableDate:", self->_actualUnavailableDate);
  }
}

- (void)saveUnavailableDate:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (!v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("remoteWidgetUnavailableInterval"));

    v6 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("remoteWidgetUnavailableToday"));

    v4 = 0;
  }
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("remoteWidgetUnavailableInterval"));

  v11 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  objc_msgSend(v11, "setBool:forKey:", self->_unavailableToday, CFSTR("remoteWidgetUnavailableToday"));

}

- (void)saveActualUnavailableDate:(id)a3
{
  id v3;
  id v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  id v9;

  v3 = a3;
  v9 = v3;
  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("remoteWidgetActualUnavailableInterval"));

    v3 = 0;
  }
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v6 = v5;
  v7 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("remoteWidgetActualUnavailableInterval"));

}

- (void)loadUnavailable
{
  NSDate *actualUnavailableDate;
  NSDate *unavailableDate;
  id v5;
  id v6;
  void *v7;
  double v8;
  NSDate *v9;
  NSDate *v10;
  id v11;
  double v12;
  NSDate *v13;
  NSDate *v14;
  void *v15;
  void *v16;

  actualUnavailableDate = self->_actualUnavailableDate;
  self->_actualUnavailableDate = 0;

  unavailableDate = self->_unavailableDate;
  self->_unavailableDate = 0;

  v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  self->_unavailableToday = objc_msgSend(v5, "BOOLForKey:", CFSTR("remoteWidgetUnavailableToday"));

  v6 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("remoteWidgetUnavailableInterval")));

  objc_msgSend(v7, "doubleValue");
  if (v8 == 0.0)
  {
    v15 = v7;
  }
  else
  {
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    v10 = self->_unavailableDate;
    self->_unavailableDate = v9;

    v11 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("remoteWidgetActualUnavailableInterval")));

    objc_msgSend(v16, "doubleValue");
    if (v12 != 0.0)
    {
      v13 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      v14 = self->_actualUnavailableDate;
      self->_actualUnavailableDate = v13;

    }
    v15 = v16;
  }

}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.das.remoteWidgetBudget")) & 1) == 0
    && !objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin")))
  {
    goto LABEL_5;
  }
  v8 = +[_DASRemoteWidgetBudgetPolicy budgetIsPositive:](_DASRemoteWidgetBudgetPolicy, "budgetIsPositive:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));
  v11 = objc_msgSend(v10, "BOOLValue");

  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.das.remoteWidgetBudget")))
  {
    -[_DASRemoteWidgetBudgetPolicy logActualUnavailableDurationWithState:](self, "logActualUnavailableDurationWithState:", v7);
    if ((v11 ^ 1 | v8) != 1)
      goto LABEL_5;
LABEL_7:
    v12 = 1;
    goto LABEL_8;
  }
  -[_DASRemoteWidgetBudgetPolicy logUnavailableDurationWithState:](self, "logUnavailableDurationWithState:", v7);
  if (((v8 ^ 1 | v11) & 1) != 0)
    goto LABEL_7;
LABEL_5:
  v12 = 0;
LABEL_8:

  return v12;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5;
  _DASPolicyResponseRationale *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  v7 = +[_DASRemoteWidgetBudgetPolicy isBudgetAvailable:](_DASRemoteWidgetBudgetPolicy, "isBudgetAvailable:", v5);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v6, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("remoteWidgetBudget"), 1.0, 0.0);
    v8 = 100;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v8, v6, (double)0x384uLL));

  return v9;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_storeStrong((id *)&self->_policyName, a3);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (NSDate)unavailableDate
{
  return self->_unavailableDate;
}

- (void)setUnavailableDate:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableDate, a3);
}

- (NSDate)actualUnavailableDate
{
  return self->_actualUnavailableDate;
}

- (void)setActualUnavailableDate:(id)a3
{
  objc_storeStrong((id *)&self->_actualUnavailableDate, a3);
}

- (BOOL)unavailableToday
{
  return self->_unavailableToday;
}

- (void)setUnavailableToday:(BOOL)a3
{
  self->_unavailableToday = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualUnavailableDate, 0);
  objc_storeStrong((id *)&self->_unavailableDate, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
