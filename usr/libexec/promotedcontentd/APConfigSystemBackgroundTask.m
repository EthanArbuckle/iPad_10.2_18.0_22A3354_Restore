@implementation APConfigSystemBackgroundTask

- (APConfigSystemBackgroundTask)initWithConfigurationStorage:(id)a3
{
  id v5;
  APConfigSystemBackgroundTask *v6;
  APConfigSystemBackgroundTask *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *requestQueue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)APConfigSystemBackgroundTask;
  v6 = -[APConfigSystemBackgroundTask init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configurationStorage, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.ap.configurationsystem.request", v11);
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = (OS_dispatch_queue *)v12;

  }
  return v7;
}

- (void)registerTask
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = APLogForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Register Config System Background Task.", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APConfigSystemBackgroundTask requestQueue](self, "requestQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APConfigSystemBackgroundTask _launchHandler](self, "_launchHandler"));
  objc_msgSend(v5, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.ap.promotedcontentd.configsystemrequest"), v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskRequestForIdentifier:", CFSTR("com.apple.ap.promotedcontentd.configsystemrequest")));

  if (v9)
  {
    v10 = APLogForCategory(8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Config System Background Task Already Exists.", v12, 2u);
    }

  }
  else
  {
    -[APConfigSystemBackgroundTask _submitNewTask](self, "_submitNewTask");
  }
}

- (int64_t)_configurationPollValue
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(APCSConfiguration));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "poll"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "poll"));
    v6 = objc_msgSend(v5, "integerValue");

  }
  else
  {
    v6 = (id)kDefaultConfigSystemPollValue;
  }
  if ((uint64_t)v6 >= kConfigSystemMaxCappingPollValue)
    v6 = (id)kConfigSystemMaxCappingPollValue;

  return (int64_t)v6;
}

- (id)_launchHandler
{
  _QWORD *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003C2A4;
  v4[3] = &unk_10020E128;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)_submitNewTask
{
  id v3;
  double v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;

  v3 = objc_msgSend(objc_alloc((Class)BGRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.ap.promotedcontentd.configsystemrequest"));
  objc_msgSend(v3, "setRequiresNetworkConnectivity:", 1);
  objc_msgSend(v3, "setRequiresExternalPower:", 0);
  objc_msgSend(v3, "setPriority:", 1);
  objc_msgSend(v3, "setRequiresProtectionClass:", 3);
  v4 = (double)-[APConfigSystemBackgroundTask _configurationPollValue](self, "_configurationPollValue");
  objc_msgSend(v3, "setInterval:", v4);
  objc_msgSend(v3, "setMinDurationBetweenInstances:", v4 * 0.8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v14 = 0;
  v6 = objc_msgSend(v5, "submitTaskRequest:error:", v3, &v14);
  v7 = v14;

  v8 = APLogForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Config System Background Task Registered Correctly.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    v12 = (void *)v11;
    v13 = CFSTR("Unknown");
    if (v11)
      v13 = (const __CFString *)v11;
    *(_DWORD *)buf = 138543362;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to submit Config System Background Task with error: %{public}@", buf, 0xCu);

  }
}

- (id)_storefront
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storefront"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-")));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  }
  else
  {
    v6 = APLogForCategory(8);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error creating storefront.", v9, 2u);
    }

    v5 = CFSTR("NONE");
  }

  return v5;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (APConfigurationStorage)configurationStorage
{
  return self->_configurationStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationStorage, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end
