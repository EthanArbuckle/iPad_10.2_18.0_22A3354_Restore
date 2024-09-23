@implementation MLRXPCActivityTaskWithLockedDevice

- (BOOL)bypassDiagnosticsUsage
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.mlruntimed.xpc_activity-orchestra");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithLockedDevice identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithLockedDevice activity](self, "activity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithLockedDevice criteria](self, "criteria"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("identifier=%@, activity=%@, criteria=%@"), v3, v4, v5));

  return (NSString *)v6;
}

- (id)criteria
{
  xpc_object_t v2;
  MLRSchedulerRecord *v3;
  int64_t v4;

  v2 = xpc_dictionary_create(0, 0, 0);
  if (allowCustomWakeUpPeriod())
  {
    v3 = objc_opt_new(MLRSchedulerRecord);
    v4 = -[MLRSchedulerRecord wakeUpPeriodInSeconds](v3, "wakeUpPeriodInSeconds");

  }
  else
  {
    v4 = XPC_ACTIVITY_INTERVAL_1_DAY;
  }
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, v4);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION, XPC_ACTIVITY_NETWORK_TRANSFER_BIDIRECTIONAL);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_CPU_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
  return v2;
}

- (id)createTaskScheduler
{
  return -[MLRTaskScheduler initWithBaseURL:localeIdentifier:fromDesTool:]([MLRTaskScheduler alloc], "initWithBaseURL:localeIdentifier:fromDesTool:", 0, 0, 0);
}

- (void)startTaskWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MLRTaskScheduler *v7;
  MLRTaskScheduler *taskScheduler;
  MLRTaskScheduler *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DESBundleRegistry sharedInstance](DESBundleRegistry, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allNonFedStatsUnrestrictedBundleIds"));

  v7 = (MLRTaskScheduler *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithLockedDevice createTaskScheduler](self, "createTaskScheduler"));
  taskScheduler = self->_taskScheduler;
  self->_taskScheduler = v7;

  v9 = self->_taskScheduler;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006198;
  v11[3] = &unk_100018670;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[MLRTaskScheduler startTasksForPluginIDs:completion:](v9, "startTasksForPluginIDs:completion:", v6, v11);

}

- (void)stop
{
  -[MLRTaskScheduler stop](self->_taskScheduler, "stop");
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (BOOL)activityDeferred
{
  return self->_activityDeferred;
}

- (void)setActivityDeferred:(BOOL)a3
{
  self->_activityDeferred = a3;
}

- (BOOL)dynamicallyRegistered
{
  return self->_dynamicallyRegistered;
}

- (_xpc_activity_eligibility_changed_handler_s)eligibilityHandler
{
  return self->_eligibilityHandler;
}

- (void)setEligibilityHandler:(_xpc_activity_eligibility_changed_handler_s *)a3
{
  self->_eligibilityHandler = a3;
}

- (MLRTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
