@implementation _DASCustomSystemConstraintsPolicy

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
  return 0.1;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v5 = CFSTR("identifier");
  v6 = CFSTR("com.apple.duetactivityscheduler.customsystemconstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return v3;
}

- (_DASCustomSystemConstraintsPolicy)init
{
  _DASCustomSystemConstraintsPolicy *v2;
  _DASCustomSystemConstraintsPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSMutableDictionary *workloadDates;
  OS_dispatch_source *resetTimer;
  uint64_t v8;
  NSArray *triggers;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_DASCustomSystemConstraintsPolicy;
  v2 = -[_DASCustomSystemConstraintsPolicy init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Custom System Constraints Policy");

    v3->_heavyDiskUsage = 0;
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    workloadDates = v3->_workloadDates;
    v3->_workloadDates = (NSMutableDictionary *)v5;

    resetTimer = v3->_resetTimer;
    v3->_gpWorkloadCounts = 0;
    v3->_resetTimer = 0;

    v8 = objc_claimAutoreleasedReturnValue(-[_DASCustomSystemConstraintsPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.dasd.sysConstraint", v11);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v12;

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CC570;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABD98 != -1)
    dispatch_once(&qword_1001ABD98, block);
  return (id)qword_1001ABDA0;
}

- (void)reevaluateAllActivitiesWithDaemon:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _DASDaemon *daemon;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  const __CFString *v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_workloadDates, "objectForKeyedSubscript:", kDASSystemContextMCWorkloadRunningState));
  if (v5)
  {

LABEL_4:
    v7 = 0;
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_workloadDates, "objectForKeyedSubscript:", kDASSystemContextGPWorkloadRunningState));

  if (v6)
    goto LABEL_4;
  v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("customsysconstraints")));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Reevaluate to unblock activities from system constraint policy!", v14, 2u);
  }

  v7 = 1;
LABEL_5:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_workloadDates, "objectForKeyedSubscript:", kDASSystemContextGPWorkloadRunningState));
  if (v8)
  {

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_workloadDates, "objectForKeyedSubscript:", kDASSystemContextMCWorkloadRunningState));

    if (!v9)
    {
      if (!v7)
        return;
      goto LABEL_11;
    }
  }
  v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("customsysconstraints")));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Reevaluate to block activities from system constraint policy!", v14, 2u);
  }

LABEL_11:
  if (a3)
  {
    daemon = self->_daemon;
    v15 = CFSTR("com.apple.duetactivityscheduler.customsystemconstraint");
    v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    -[_DASDaemon handleTriggersBatched:](daemon, "handleTriggersBatched:", v12);
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("customsysconstraints")));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000EB3E8(v12);
  }

}

- (void)armResetTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *resetTimer;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD handler[5];
  uint8_t buf[4];
  _UNKNOWN **v11;

  if (!self->_resetTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    resetTimer = self->_resetTimer;
    self->_resetTimer = v3;

    v5 = self->_resetTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000CC910;
    handler[3] = &unk_10015D4E0;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    v6 = self->_resetTimer;
    v7 = dispatch_walltime(0, 300000000000);
    dispatch_source_set_timer(v6, v7, 0x45D964B800uLL, 0xDF8475800uLL);
    dispatch_activate((dispatch_object_t)self->_resetTimer);
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("customsysconstraints")));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = &off_10016EE58;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Armed timer to fire in %@", buf, 0xCu);
    }

  }
}

- (void)cancelResetTimer
{
  NSObject *v3;
  NSObject *resetTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  uint8_t v7[16];

  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("customsysconstraints")));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000EB428(v3);

  resetTimer = self->_resetTimer;
  if (resetTimer && !dispatch_source_testcancel(resetTimer))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("customsysconstraints")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceled timer", v7, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_resetTimer);
    v6 = self->_resetTimer;
    self->_resetTimer = 0;

  }
}

- (void)updateHeavyDiskUsage:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  dispatch_time_t v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v11;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("customsysconstraints")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting _heavyDiskUsage = %d", buf, 8u);
  }

  self->_heavyDiskUsage = v3;
  if (v3)
  {
    v6 = dispatch_time(0, 15000000000);
    global_queue = dispatch_get_global_queue(9, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CCE40;
    block[3] = &unk_10015D4E0;
    block[4] = self;
    dispatch_after(v6, v8, block);

  }
}

- (void)updateSystemConstraint:(id)a3 withState:(BOOL)a4 withDaemon:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  OS_dispatch_queue *queue;
  void *v13;
  OS_dispatch_queue *v14;
  _DASDaemon **p_daemon;
  _DASDaemon *daemon;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  _QWORD block[4];
  id v22;
  _DASCustomSystemConstraintsPolicy *v23;
  id v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  _BOOL4 v30;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("customsysconstraints")));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v29 = 1024;
    v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting %s running state = %d", buf, 0x12u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_workloadDates, "objectForKeyedSubscript:", v8));
  if (objc_msgSend(v8, "isEqualToString:", kDASSystemContextKeyHeavyDiskUsage))
  {
    -[_DASCustomSystemConstraintsPolicy updateHeavyDiskUsage:](self, "updateHeavyDiskUsage:", v6);
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isEqualToString:", kDASSystemContextMCWorkloadRunningState))
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CD11C;
    block[3] = &unk_1001601D0;
    v26 = v6;
    v22 = v11;
    v23 = self;
    v24 = v8;
    v25 = v9;
    dispatch_sync((dispatch_queue_t)queue, block);

    v13 = v22;
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", kDASSystemContextGPWorkloadRunningState))
      goto LABEL_10;
    v14 = self->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000CD29C;
    v17[3] = &unk_1001601F8;
    v20 = v6;
    v17[4] = self;
    v18 = v8;
    v19 = v9;
    dispatch_sync((dispatch_queue_t)v14, v17);

    v13 = v18;
  }

LABEL_10:
  daemon = self->_daemon;
  p_daemon = &self->_daemon;
  if (!daemon)
    objc_storeStrong((id *)p_daemon, a5);

}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.customsystemconstraint"), a4) ^ 1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _DASPolicyResponseRationale *v8;
  _DASCustomSystemConstraintsPolicy *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Custom System Constraints Policy"));
  v9 = self;
  objc_sync_enter(v9);
  if (v9->_heavyDiskUsage)
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("heavyDiskUsage"), 0.0, 1.0);
    v10 = 100;
  }
  else
  {
    v10 = 0;
  }
  if (!+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v6))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9->_workloadDates, "objectForKeyedSubscript:", kDASSystemContextGPWorkloadRunningState));

    if (v11)
    {
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("gpRunning"), 0.0, 1.0);
      v10 = 100;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9->_workloadDates, "objectForKeyedSubscript:", kDASSystemContextMCWorkloadRunningState));

    if (v12)
    {
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v8, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("mcRunning"), 0.0, 1.0);
      v10 = 100;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v10, v8, 15.0));
  objc_sync_exit(v9);

  return v13;
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

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (BOOL)heavyDiskUsage
{
  return self->_heavyDiskUsage;
}

- (void)setHeavyDiskUsage:(BOOL)a3
{
  self->_heavyDiskUsage = a3;
}

- (NSMutableDictionary)workloadDates
{
  return self->_workloadDates;
}

- (void)setWorkloadDates:(id)a3
{
  objc_storeStrong((id *)&self->_workloadDates, a3);
}

- (int64_t)gpWorkloadCounts
{
  return self->_gpWorkloadCounts;
}

- (void)setGpWorkloadCounts:(int64_t)a3
{
  self->_gpWorkloadCounts = a3;
}

- (OS_dispatch_source)resetTimer
{
  return self->_resetTimer;
}

- (void)setResetTimer:(id)a3
{
  objc_storeStrong((id *)&self->_resetTimer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_workloadDates, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
