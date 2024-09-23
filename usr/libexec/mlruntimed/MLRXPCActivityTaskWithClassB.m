@implementation MLRXPCActivityTaskWithClassB

- (BOOL)bypassDiagnosticsUsage
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.mlruntimed.xpc_activity-classb");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithClassB identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithClassB activity](self, "activity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithClassB criteria](self, "criteria"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("identifier=%@, activity=%@, criteria=%@"), v3, v4, v5));

  return (NSString *)v6;
}

- (id)criteria
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_CPU_INTENSIVE, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 0);
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
  MLRTaskScheduler *v6;
  MLRTaskScheduler *taskScheduler;
  MLRTaskScheduler *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v4 = a3;
  v12[0] = MLRuntimePluginID_DPMLRuntimePluginClassB;
  v12[1] = MLRuntimePluginID_FedStatsPluginClassB;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  v6 = (MLRTaskScheduler *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithClassB createTaskScheduler](self, "createTaskScheduler"));
  taskScheduler = self->_taskScheduler;
  self->_taskScheduler = v6;

  v8 = self->_taskScheduler;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006558;
  v10[3] = &unk_100018618;
  v11 = v4;
  v9 = v4;
  -[MLRTaskScheduler startTasksForPluginIDs:completion:](v8, "startTasksForPluginIDs:completion:", v5, v10);

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
