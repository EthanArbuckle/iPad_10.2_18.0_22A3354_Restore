@implementation MLRTaskScheduler

- (MLRTaskScheduler)initWithBaseURL:(id)a3 localeIdentifier:(id)a4 fromDesTool:(BOOL)a5
{
  return -[MLRTaskScheduler initWithBaseURL:localeIdentifier:fromDesTool:bundleRegistry:recordStoreManager:](self, "initWithBaseURL:localeIdentifier:fromDesTool:bundleRegistry:recordStoreManager:", a3, a4, a5, 0, 0);
}

- (MLRTaskScheduler)initWithBaseURL:(id)a3 localeIdentifier:(id)a4 fromDesTool:(BOOL)a5 bundleRegistry:(id)a6 recordStoreManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MLRTaskScheduler *v17;
  MLRTaskScheduler *v18;
  DESBundleRegistryManaging *v19;
  DESBundleRegistryManaging *bundleRegistry;
  DESRecordStoreManager *v21;
  DESRecordStoreManager *recordStoreManager;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *taskWorkerQueue;
  dispatch_queue_attr_t v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *taskStopQueue;
  NSString *v31;
  uint64_t v32;
  NSString *localeIdentifier;
  uint64_t v34;
  NSHashTable *workers;
  MLRPluginFactory *v36;
  MLRPluginFactory *pluginFactory;
  MLRTrialManager *v38;
  MLRTrialManager *trialManager;
  objc_super v41;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v41.receiver = self;
  v41.super_class = (Class)MLRTaskScheduler;
  v17 = -[MLRTaskScheduler init](&v41, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_baseURL, a3);
    if (v15)
      v19 = (DESBundleRegistryManaging *)v15;
    else
      v19 = (DESBundleRegistryManaging *)objc_claimAutoreleasedReturnValue(+[DESBundleRegistry sharedInstance](DESBundleRegistry, "sharedInstance"));
    bundleRegistry = v18->_bundleRegistry;
    v18->_bundleRegistry = v19;

    if (v16)
      v21 = (DESRecordStoreManager *)v16;
    else
      v21 = objc_opt_new(DESRecordStoreManager);
    recordStoreManager = v18->_recordStoreManager;
    v18->_recordStoreManager = v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = dispatch_queue_create("com.apple.MLRuntime.MLRTaskScheduler.TaskWorker", v24);
    taskWorkerQueue = v18->_taskWorkerQueue;
    v18->_taskWorkerQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = dispatch_queue_create("com.apple.MLRuntime.MLRTaskScheduler.TaskStop", v28);
    taskStopQueue = v18->_taskStopQueue;
    v18->_taskStopQueue = (OS_dispatch_queue *)v29;

    v18->_alwaysRun = DESShouldAlwaysParticipate() | a5;
    if (v14)
    {
      v31 = (NSString *)v14;
    }
    else
    {
      v32 = DESGetDeviceLocale();
      v31 = (NSString *)objc_claimAutoreleasedReturnValue(v32);
    }
    localeIdentifier = v18->_localeIdentifier;
    v18->_localeIdentifier = v31;

    v34 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    workers = v18->_workers;
    v18->_workers = (NSHashTable *)v34;

    v36 = -[MLRPluginFactory initWithBundleRegistry:]([MLRPluginFactory alloc], "initWithBundleRegistry:", v18->_bundleRegistry);
    pluginFactory = v18->_pluginFactory;
    v18->_pluginFactory = v36;

    v38 = objc_opt_new(MLRTrialManager);
    trialManager = v18->_trialManager;
    v18->_trialManager = v38;

  }
  return v18;
}

- (id)_requestedToStopError
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSErrorUserInfoKey v6;
  const __CFString *v7;

  v2 = kDESDistributedEvaluationErrorDomain;
  v6 = NSLocalizedDescriptionKey;
  v7 = CFSTR("Requested to defer by DAS.");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v2, 1902, v3));

  return v4;
}

- (void)_scheduleNextTask
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  MLRTaskScheduler *v9;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_taskWorkerQueue);
  v3 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10000E660((uint64_t)self, v3);

  if (self->_numOfCompletedTasks == self->_numOfExpectedTasks)
  {
    -[MLRTaskScheduler _completeTaskRunWithResult:error:](self, "_completeTaskRunWithResult:error:", 0, 0);
    return;
  }
  if (self->_requestedToStop)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Task scheduling deferred by DAS.", buf, 2u);
    }

    v5 = (id)objc_claimAutoreleasedReturnValue(-[MLRTaskScheduler _requestedToStopError](self, "_requestedToStopError"));
    -[MLRTaskScheduler _completeTaskRunWithResult:error:](self, "_completeTaskRunWithResult:error:", 0, v5);
  }
  else
  {
    if (!-[NSMutableArray count](self->_tasks, "count"))
      return;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_tasks, "lastObject"));
    -[NSMutableArray removeLastObject](self->_tasks, "removeLastObject");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D040;
    v7[3] = &unk_100018A70;
    v8 = v6;
    v9 = self;
    v5 = v6;
    -[MLRTaskScheduler createTaskWorkerForTask:completion:](self, "createTaskWorkerForTask:completion:", v5, v7);

  }
}

- (void)createTaskWorkerForShadowEvaluationTask:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, MLRTrialShadowExperimentTaskWorker *, _QWORD);
  MLRPluginFactory *pluginFactory;
  void *v9;
  void *v10;
  id v11;
  MLRTrialShadowExperimentTaskWorker *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  MLRTrialShadowExperimentTaskWorker *v18;
  __int16 v19;
  void *v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;

  v6 = a3;
  v7 = (void (**)(id, MLRTrialShadowExperimentTaskWorker *, _QWORD))a4;
  if (self->_trialManager)
  {
    pluginFactory = self->_pluginFactory;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    v16 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MLRPluginFactory pluginWithBundleIdentifier:errorOut:](pluginFactory, "pluginWithBundleIdentifier:errorOut:", v9, &v16));
    v11 = v16;

    if (v10)
    {
      v12 = -[MLRTrialShadowExperimentTaskWorker initWithTrialManager:plugin:alwaysRun:]([MLRTrialShadowExperimentTaskWorker alloc], "initWithTrialManager:plugin:alwaysRun:", self->_trialManager, v10, self->_alwaysRun);
      v13 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
        *(_DWORD *)buf = 138412546;
        v18 = v12;
        v19 = 2112;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Created worker=%@ for plugin=%@.", buf, 0x16u);

      }
      v7[2](v7, v12, 0);

    }
    else
    {
      ((void (**)(id, MLRTrialShadowExperimentTaskWorker *, id))v7)[2](v7, 0, v11);
    }
  }
  else
  {
    v15 = kDESDistributedEvaluationErrorDomain;
    v21 = NSLocalizedDescriptionKey;
    v22 = CFSTR("Nil _trialManager. Please make sure Trial Framework is present.");
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, 1903, v11));
    ((void (**)(id, MLRTrialShadowExperimentTaskWorker *, void *))v7)[2](v7, 0, v10);
  }

}

- (void)createTaskWorkerForTask:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_autoreleasePoolPush();
  if (objc_msgSend(v8, "source") == (id)1)
    -[MLRTaskScheduler createTaskWorkerForShadowEvaluationTask:completion:](self, "createTaskWorkerForShadowEvaluationTask:completion:", v8, v6);
  objc_autoreleasePoolPop(v7);

}

- (void)_completeTaskRunWithResult:(id)a3 error:(id)a4
{
  id v6;
  void (**completionAfterTaskRun)(id, id, id);
  id v8;
  NSMutableArray *tasks;
  id v10;

  v10 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_taskWorkerQueue);
  -[MLRTaskScheduler updateInterval](self, "updateInterval");
  completionAfterTaskRun = (void (**)(id, id, id))self->_completionAfterTaskRun;
  if (completionAfterTaskRun)
  {
    completionAfterTaskRun[2](completionAfterTaskRun, v10, v6);
    v8 = self->_completionAfterTaskRun;
  }
  else
  {
    v8 = 0;
  }
  self->_completionAfterTaskRun = 0;

  self->_numOfCompletedTasks = 0;
  self->_numOfExpectedTasks = 0;
  tasks = self->_tasks;
  self->_tasks = 0;

  self->_busy = 0;
}

- (void)updateInterval
{
  MLRSchedulerRecord *v2;

  v2 = objc_opt_new(MLRSchedulerRecord);
  -[MLRSchedulerRecord updateWakeUpPeriodInSeconds](v2, "updateWakeUpPeriodInSeconds");

}

- (double)_maxTimeLimitForBundle:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = 5.0;
  if ((objc_msgSend(v3, "isEqualToString:", MLRuntimePluginID_DPMLRuntimePluginClassB) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", MLRuntimePluginID_FedStatsPluginClassB))
      v4 = 5.0;
    else
      v4 = 0.0;
  }

  return v4;
}

- (BOOL)allowBypassDiagnosticsUsage:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", MLRuntimePluginID_DPMeadPlugin) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", MLRuntimePluginID_FedStatsPluginNonDnU) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", MLRuntimePluginID_MediaMLPluginApp) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", MLRuntimePluginID_RepackagingPlugin) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", MLRuntimePluginID_SiriCoreMetricsPlugin);
  }

  return v4;
}

- (void)_startTasks:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *tasks;
  id v14;
  id completionAfterTaskRun;
  id v16;
  NSObject *v17;
  unint64_t numOfExpectedTasks;
  int v19;
  unint64_t v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (objc_msgSend(v6, "count"))
  {
    if (self->_busy)
    {
      v8 = kDESDistributedEvaluationErrorDomain;
      v21 = NSLocalizedDescriptionKey;
      v22 = CFSTR("Task Scheduler busy.");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, 1901, v9));
      v7[2](v7, 0, v10);

    }
    else if (self->_requestedToStop)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MLRTaskScheduler _requestedToStopError](self, "_requestedToStopError"));
      v7[2](v7, 0, v11);

    }
    else
    {
      self->_busy = 1;
      v12 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
      tasks = self->_tasks;
      self->_tasks = v12;

      v14 = objc_msgSend(v7, "copy");
      completionAfterTaskRun = self->_completionAfterTaskRun;
      self->_completionAfterTaskRun = v14;

      v16 = -[NSMutableArray count](self->_tasks, "count");
      self->_numOfCompletedTasks = 0;
      self->_numOfExpectedTasks = (unint64_t)v16;
      v17 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        numOfExpectedTasks = self->_numOfExpectedTasks;
        v19 = 134217984;
        v20 = numOfExpectedTasks;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Starting scheduling %ld tasks.", (uint8_t *)&v19, 0xCu);
      }

      +[DESBitacoraEventManager sendEventActivityScheduled](DESBitacoraEventManager, "sendEventActivityScheduled");
      -[MLRTaskScheduler _scheduleNextTask](self, "_scheduleNextTask");
    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

- (void)startTasks:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *taskWorkerQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    taskWorkerQueue = self->_taskWorkerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DE7C;
    block[3] = &unk_100018A98;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(taskWorkerQueue, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (id)tasksForPluginIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  char *v12;
  MLRSchedulingTask *v13;
  MLRSchedulingTask *v14;
  MLRSchedulingTask *v15;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  NSErrorUserInfoKey v25;
  void *v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = (char *)-[DESBundleRegistryManaging pluginTypeForBundleId:](self->_bundleRegistry, "pluginTypeForBundleId:", v11);
        if ((unint64_t)(v12 - 2) >= 2)
        {
          if (v12 != (char *)4)
          {
            v17 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              sub_10000E838(v11, v17);

            v25 = NSLocalizedDescriptionKey;
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bundleID=%@"), v11));
            v26 = v18;
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
            v20 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Invalid pluginType"), v19));

            objc_exception_throw(v20);
          }
          v14 = [MLRSchedulingTask alloc];
          -[MLRTaskScheduler _maxTimeLimitForBundle:](self, "_maxTimeLimitForBundle:", v11);
          v13 = -[MLRSchedulingTask initWithBundleIdentifier:taskSource:maxTimeLimit:](v14, "initWithBundleIdentifier:taskSource:maxTimeLimit:", v11, 1);
        }
        else
        {
          v13 = -[MLRSchedulingTask initWithBundleIdentifier:taskSource:]([MLRSchedulingTask alloc], "initWithBundleIdentifier:taskSource:", v11, 1);
        }
        v15 = v13;
        objc_msgSend(v5, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)filterPluginIDs:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = -[MLRTaskScheduler diagnosticsUsageAllowed](self, "diagnosticsUsageAllowed");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v21;
    *(_QWORD *)&v9 = 138412290;
    v19 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12);
        if ((-[DESBundleRegistryManaging containsBundleId:](self->_bundleRegistry, "containsBundleId:", v13, v19, (_QWORD)v20) & 1) != 0)
        {
          if ((v6 & 1) != 0
            || -[MLRTaskScheduler allowBypassDiagnosticsUsage:](self, "allowBypassDiagnosticsUsage:", v13))
          {
            objc_msgSend(v5, "addObject:", v13);
            v14 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              goto LABEL_13;
            *(_DWORD *)buf = v19;
            v25 = v13;
            v15 = v14;
            v16 = "Found plugin %@";
          }
          else
          {
            v14 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              goto LABEL_13;
            *(_DWORD *)buf = v19;
            v25 = v13;
            v15 = v14;
            v16 = "Cannot schedule plugin=%@ because D&U is not enabled";
          }
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0xCu);
        }
        else
        {
          v14 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v25 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Cannot schedule plugin=%@ because it is missing", buf, 0xCu);
          }
        }
LABEL_13:

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      v10 = v17;
    }
    while (v17);
  }

  return v5;
}

- (void)startTasksForPluginIDs:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MLRTaskScheduler filterPluginIDs:](self, "filterPluginIDs:", a3));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_fides_shuffledArray"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MLRTaskScheduler tasksForPluginIDs:](self, "tasksForPluginIDs:", v9));
  -[MLRTaskScheduler startTasks:completion:](self, "startTasks:completion:", v8, v6);

}

- (void)stop
{
  NSObject *taskWorkerQueue;
  _QWORD block[5];

  self->_requestedToStop = 1;
  taskWorkerQueue = self->_taskWorkerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E428;
  block[3] = &unk_100018710;
  block[4] = self;
  dispatch_async(taskWorkerQueue, block);
}

- (BOOL)taskIsDeferred
{
  return self->_requestedToStop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginFactory, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong(&self->_completionAfterTaskRun, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_workers, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_taskStopQueue, 0);
  objc_storeStrong((id *)&self->_taskWorkerQueue, 0);
  objc_storeStrong((id *)&self->_recordStoreManager, 0);
  objc_storeStrong((id *)&self->factory, 0);
  objc_storeStrong((id *)&self->_bundleRegistry, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
