@implementation MLRTrialShadowExperimentTaskWorker

- (MLRTrialShadowExperimentTaskWorker)initWithTrialManager:(id)a3 plugin:(id)a4 alwaysRun:(BOOL)a5
{
  id v9;
  id v10;
  MLRTrialShadowExperimentTaskWorker *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  id v16;
  void *v17;
  DESDebugRecord *v18;
  DESDebugRecord *debugRecord;
  MLRTrialShadowExperimentTaskWorker *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v37;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    v21 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10000AA38(v21, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_10;
  }
  if (!v9)
  {
    v21 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10000AA6C(v21, v29, v30, v31, v32, v33, v34, v35);
LABEL_10:

    v20 = 0;
    goto LABEL_11;
  }
  v37.receiver = self;
  v37.super_class = (Class)MLRTrialShadowExperimentTaskWorker;
  v11 = -[MLRTrialShadowExperimentTaskWorker init](&v37, "init");
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("MLRTrialShadowExperimentTaskWorker", v13);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v11->_plugin, a4);
    objc_storeStrong((id *)&v11->_trialManager, a3);
    v11->_alwaysRun = a5;
    v16 = objc_alloc((Class)DESDebugRecord);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    v18 = (DESDebugRecord *)objc_msgSend(v16, "initWithPluginID:taskSource:", v17, 1);
    debugRecord = v11->_debugRecord;
    v11->_debugRecord = v18;

  }
  self = v11;
  v20 = self;
LABEL_11:

  return v20;
}

- (BOOL)canRunTask:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  MLRTaskSchedulingRecord *v7;
  void *v8;
  MLRTaskSchedulingRecord *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  DESDebugRecord *debugRecord;
  id v23;
  void *v24;
  DESDebugRecord *v25;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;

  v4 = a3;
  v5 = v4;
  if (!self->_alwaysRun)
  {
    if (!v4)
    {
      v9 = (MLRTaskSchedulingRecord *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Nil scheduling policy.")));
      v21 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100009200();

      debugRecord = self->_debugRecord;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "taskID"));
      -[DESDebugRecord addForTaskID:result:description:](debugRecord, "addForTaskID:result:description:", v10, 1, v9);
      goto LABEL_15;
    }
    v7 = [MLRTaskSchedulingRecord alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "taskID"));
    v9 = -[MLRTaskSchedulingRecord initWithTaskID:](v7, "initWithTaskID:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = -[MLRTaskSchedulingRecord performCount](v9, "performCount");
    if (v11 >= objc_msgSend(v5, "maxPerformCount"))
    {
      v23 = -[MLRTaskSchedulingRecord performCount](v9, "performCount");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[DESPluginManaging bundleIdentifier](self->_plugin, "bundleIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot run: too many times (%ld), plugin=%@, policy=%@"), v23, v24, v5));

      v20 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v19;
        goto LABEL_13;
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MLRTaskSchedulingRecord lastCompletionDate](v9, "lastCompletionDate"));
      objc_msgSend(v10, "timeIntervalSinceDate:", v12);
      v14 = v13;
      objc_msgSend(v5, "minInterval");
      v16 = v15;

      if (v14 >= v16)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startAfterDate"));
        v29 = objc_msgSend(v10, "compare:", v28);

        if (v29 == (id)-1)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[DESPluginManaging bundleIdentifier](self->_plugin, "bundleIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot run: too early to run, plugin=%@, policy=%@"), v33, v5));

          v20 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            goto LABEL_14;
          *(_DWORD *)buf = 138543362;
          v35 = v19;
        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endAtDate"));
          v31 = objc_msgSend(v10, "compare:", v30);

          if (v31 != (id)1)
          {
            v6 = 1;
            goto LABEL_16;
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[DESPluginManaging bundleIdentifier](self->_plugin, "bundleIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot run: too late to run, plugin=%@, policy=%@"), v32, v5));

          v20 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            goto LABEL_14;
          *(_DWORD *)buf = 138543362;
          v35 = v19;
        }
        goto LABEL_13;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MLRTaskSchedulingRecord lastCompletionDate](v9, "lastCompletionDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DESPluginManaging bundleIdentifier](self->_plugin, "bundleIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot run: too soon since last completion date (%@), plugin=%@, policy=%@"), v17, v18, v5));

      v20 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v19;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
LABEL_14:

    v25 = self->_debugRecord;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "taskID"));
    -[DESDebugRecord addForTaskID:result:description:](v25, "addForTaskID:result:description:", v26, 1, v19);

LABEL_15:
    v6 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v6 = 1;
LABEL_17:

  return v6;
}

- (BOOL)updateTaskAfterCompletion:(id)a3 taskID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  MLRTaskSchedulingRecord *v11;
  uint64_t v12;
  void *v13;
  NSErrorUserInfoKey v15;
  const __CFString *v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = -[MLRTaskSchedulingRecord initWithTaskID:]([MLRTaskSchedulingRecord alloc], "initWithTaskID:", v9);
    -[MLRTaskSchedulingRecord setLastCompletionDate:](v11, "setLastCompletionDate:", v8);
    -[MLRTaskSchedulingRecord setPerformCount:](v11, "setPerformCount:", (char *)-[MLRTaskSchedulingRecord performCount](v11, "performCount") + 1);
    if (-[MLRTaskSchedulingRecord commitWithError:](v11, "commitWithError:", a5))
      LOBYTE(a5) = -[DESDebugRecord commitWithError:](self->_debugRecord, "commitWithError:", a5);
    else
      LOBYTE(a5) = 0;

  }
  else if (a5)
  {
    v12 = kDESDistributedEvaluationErrorDomain;
    v15 = NSLocalizedDescriptionKey;
    v16 = CFSTR("Nil TaskID or completionDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, 1400, v13));

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (void)_performAfterTask:(id)a3 duration:(double)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  DESDebugRecord *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  NSObject *v25;
  DESDebugRecord *debugRecord;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DESPluginManaging bundleIdentifier](self->_plugin, "bundleIdentifier"));
  *(float *)&a4 = a4;
  v11 = v8;
  v12 = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "evaluationID"));
  LODWORD(v14) = LODWORD(a4);
  +[DESCoreAnalyticsEventManager sendEventEvaluationForBundleID:evaluationID:duration:deferred:success:error:downloadedAttachmentCount:](DESCoreAnalyticsEventManager, "sendEventEvaluationForBundleID:evaluationID:duration:deferred:success:error:downloadedAttachmentCount:", v10, v13, 0, v9 == 0, v12, 0, v14);

  v15 = sub_10000A96C(v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  +[DESBitacoraEventManager sendEventTaskCompletedForBundleID:identifiers:error:](DESBitacoraEventManager, "sendEventTaskCompletedForBundleID:identifiers:error:", v10, v16, v12);
  if (v9)
  {
    if (self->_requestedToStop)
    {
LABEL_10:
      debugRecord = self->_debugRecord;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "policy"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "taskID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
      -[DESDebugRecord addForTaskID:result:description:](debugRecord, "addForTaskID:result:description:", v28, 2, v29);

      goto LABEL_11;
    }
  }
  else
  {
    v17 = self->_debugRecord;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "policy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "taskID"));
    -[DESDebugRecord addForTaskID:result:description:](v17, "addForTaskID:result:description:", v19, 0, 0);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "policy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "taskID"));
  v30 = 0;
  v23 = -[MLRTrialShadowExperimentTaskWorker updateTaskAfterCompletion:taskID:error:](self, "updateTaskAfterCompletion:taskID:error:", v20, v22, &v30);
  v24 = v30;

  if ((v23 & 1) == 0)
  {
    v25 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10000AAA0();

  }
  if (v9)
    goto LABEL_10;
LABEL_11:

}

- (BOOL)_pluginSupportTrialTask:(id *)a3
{
  DESPluginManaging **p_plugin;
  char v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  p_plugin = &self->_plugin;
  v5 = objc_opt_respondsToSelector(self->_plugin, "performTrialTask:outError:");
  if ((v5 & 1) == 0)
  {
    if (a3)
    {
      v6 = kDESDistributedEvaluationErrorDomain;
      v10 = NSLocalizedDescriptionKey;
      v11 = CFSTR("Plugin doesn't support trial task.");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, 5000, v7));

    }
    v8 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000AB1C((id *)p_plugin, v8);

  }
  return v5 & 1;
}

- (BOOL)_DASAllowTask:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 requestedToStop;
  NSObject *v8;
  DESDebugRecord *debugRecord;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSErrorUserInfoKey v15;
  const __CFString *v16;
  uint8_t buf[4];
  id v18;

  v6 = a3;
  requestedToStop = self->_requestedToStop;
  if (self->_requestedToStop)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAS requests to stop task = %@", buf, 0xCu);
    }

    debugRecord = self->_debugRecord;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "policy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "taskID"));
    -[DESDebugRecord addForTaskID:result:description:](debugRecord, "addForTaskID:result:description:", v11, 3, 0);

    if (a4)
    {
      v12 = kDESDistributedEvaluationErrorDomain;
      v15 = NSLocalizedDescriptionKey;
      v16 = CFSTR("Evaluation has been deferred");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, 2, v13));

    }
  }

  return !requestedToStop;
}

- (void)runWithCompletion:(id)a3
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
  v7[2] = sub_10000A494;
  v7[3] = &unk_100018890;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)stop
{
  self->_requestedToStop = 1;
  -[DESPluginManaging stopWithCompletion:](self->_plugin, "stopWithCompletion:", &stru_100018918);
}

- (id)telemetryResponse
{
  return 0;
}

- (BOOL)requestedToStop
{
  return self->_requestedToStop;
}

- (DESDebugRecord)debugRecord
{
  return self->_debugRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugRecord, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
