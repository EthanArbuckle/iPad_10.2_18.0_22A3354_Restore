@implementation _DASNetworkEvaluationMonitor

- (void)stopMonitoringActivity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkEvaluationMonitor evaluationGroupForActivityID:](self, "evaluationGroupForActivityID:", v4));
  if (v5)
  {
    os_unfair_recursive_lock_lock_with_options(&self->_lock, 0);
    if (objc_msgSend(v5, "stopMonitoringForActivityID:", v4))
      -[NSMutableArray removeObject:](self->_networkEvaluationGroups, "removeObject:", v5);
    os_unfair_recursive_lock_unlock(&self->_lock);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000EB5E4();
  }

}

- (BOOL)isNetworkPathAvailableForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:](self, "requiresNetworkPathMonitoring:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkEvaluationMonitor evaluationGroupForActivityID:](self, "evaluationGroupForActivityID:", v5));
    if (v6)
      v7 = objc_msgSend(v6, "isNetworkPathAvailable");
    else
      v7 = 1;

  }
  else
  {
    v8 = objc_msgSend(v4, "requiresInexpensiveNetworking");

    v9 = (void *)objc_opt_class(self);
    if (v8)
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultInexpensivePathEvaluator"));
    else
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultPathEvaluator"));
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v13 = objc_msgSend(v12, "status");

    return v13 != (id)2;
  }
  return v7;
}

- (BOOL)requiresNetworkPathMonitoring:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kNWEndpointKey));
  v5 = v4 != 0;

  return v5;
}

+ (id)defaultPathEvaluator
{
  if (qword_1001ABDB8 != -1)
    dispatch_once(&qword_1001ABDB8, &stru_100160260);
  return (id)qword_1001ABDC0;
}

+ (id)defaultInexpensivePathEvaluator
{
  if (qword_1001ABDC8 != -1)
    dispatch_once(&qword_1001ABDC8, &stru_100160280);
  return (id)qword_1001ABDD0;
}

- (void)startMonitoringActivity:(id)a3 withNetworkParameters:(id)a4 withEndpoint:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[_DASNetworkEvaluationMonitor evaluationGroupForParameters:endpoint:](self, "evaluationGroupForParameters:endpoint:", v9, v10));
  if (v11)
  {
    v12 = (void *)v11;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      sub_1000EB580();
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkEvaluationMonitor setupNetworkMonitoringWithNetworkParameters:endpoint:withActivityID:](self, "setupNetworkMonitoringWithNetworkParameters:endpoint:withActivityID:", v9, v10, v8));
  }
  objc_msgSend(v12, "startMonitoringForActivityID:", v8);

}

+ (id)nwParametersForActivity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kNWParametersKey));

  if (!v5)
  {
    if (objc_msgSend(v3, "requiresInexpensiveNetworking"))
    {
      if (qword_1001ABDE8 != -1)
        dispatch_once(&qword_1001ABDE8, &stru_1001602C0);
      v6 = &qword_1001ABDF0;
    }
    else
    {
      if (qword_1001ABDF8 != -1)
        dispatch_once(&qword_1001ABDF8, &stru_1001602E0);
      v6 = &qword_1001ABE00;
    }
    v5 = (id)*v6;
  }

  return v5;
}

- (_DASNetworkEvaluationMonitor)init
{
  _DASNetworkEvaluationMonitor *v2;
  uint64_t v3;
  NSMutableArray *networkEvaluationGroups;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  os_log_t v9;
  OS_os_log *log;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DASNetworkEvaluationMonitor;
  v2 = -[_DASNetworkEvaluationMonitor init](&v12, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    networkEvaluationGroups = v2->_networkEvaluationGroups;
    v2->_networkEvaluationGroups = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.NetworkEvaluationMonitor.serial", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    v9 = os_log_create("com.apple.duetactivityscheduler", "NetworkEvaluationMonitor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v9;

    v2->_lock = 0;
  }
  return v2;
}

+ (_DASNetworkEvaluationMonitor)sharedInstance
{
  if (qword_1001ABDA8 != -1)
    dispatch_once(&qword_1001ABDA8, &stru_100160240);
  return (_DASNetworkEvaluationMonitor *)(id)qword_1001ABDB0;
}

+ (id)defaultUnconstrainedPathEvaluator
{
  if (qword_1001ABDD8 != -1)
    dispatch_once(&qword_1001ABDD8, &stru_1001602A0);
  return (id)qword_1001ABDE0;
}

+ (BOOL)inexpensivePathAvailable
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_msgSend((id)objc_opt_class(a1), "defaultInexpensivePathEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v5 = objc_msgSend(v4, "status");

  return v5 != (id)2;
}

- (void)registerForNetworkEvaluationWithCallback:(id)a3
{
  id v4;
  id callback;

  v4 = objc_retainBlock(a3);
  callback = self->_callback;
  self->_callback = v4;

}

- (id)evaluationGroupForParameters:(id)a3 endpoint:(id)a4
{
  id v6;
  id v7;
  os_unfair_recursive_lock_s *p_lock;
  NSMutableArray *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_recursive_lock_lock_with_options(&self->_lock, 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_networkEvaluationGroups;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isMonitoringWithParameters:endpoint:", v6, v7, (_QWORD)v15))
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock(p_lock);
  return v10;
}

- (id)setupNetworkMonitoringWithNetworkParameters:(id)a3 endpoint:(id)a4 withActivityID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _DASNetworkMonitorEvaluationGroup *v11;
  _DASNetworkMonitorEvaluationGroup *v12;
  NSObject *log;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[_DASNetworkMonitorEvaluationGroup initWithEndpoint:parameters:activityID:callback:onQueue:]([_DASNetworkMonitorEvaluationGroup alloc], "initWithEndpoint:parameters:activityID:callback:onQueue:", v9, v8, v10, self->_callback, self->_callbackQueue);
  if (v11)
  {
    os_unfair_recursive_lock_lock_with_options(&self->_lock, 0);
    -[NSMutableArray addObject:](self->_networkEvaluationGroups, "addObject:", v11);
    os_unfair_recursive_lock_unlock(&self->_lock);
    v12 = v11;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412802;
      v16 = v10;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to instantiate evaluationGroup for %@ (%@, %@", (uint8_t *)&v15, 0x20u);
    }
  }

  return v11;
}

- (id)evaluationGroupForActivityID:(id)a3
{
  id v4;
  os_unfair_recursive_lock_s *p_lock;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_recursive_lock_lock_with_options(&self->_lock, 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_networkEvaluationGroups;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isMonitoringActivityID:", v4, (_QWORD)v12))
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock(p_lock);
  return v7;
}

- (BOOL)isUnconstrainedPathAvailableForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *evaluator_for_endpoint;
  id v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v15;
  BOOL v16;

  v4 = a3;
  if (!-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:](self, "requiresNetworkPathMonitoring:", v4))
  {
    v12 = objc_msgSend((id)objc_opt_class(self), "defaultUnconstrainedPathEvaluator");
    evaluator_for_endpoint = (void *)objc_claimAutoreleasedReturnValue(v12);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(evaluator_for_endpoint, "path"));
    v14 = -[NSObject status](v13, "status") == (id)2;
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kNWEndpointKey));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkEvaluationMonitor nwParametersForActivity:](_DASNetworkEvaluationMonitor, "nwParametersForActivity:", v4));
    v9 = objc_msgSend(v7, "copyCEndpoint");
    v10 = objc_msgSend(v8, "copyCParameters");
    evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint(v9, v10);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkEvaluationMonitor evaluationGroupForActivityID:](self, "evaluationGroupForActivityID:", v7));
    evaluator_for_endpoint = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "evaluator"));
  }

  if (evaluator_for_endpoint)
  {
    v13 = nw_path_evaluator_copy_path(evaluator_for_endpoint, v15);
    if (nw_path_is_constrained(v13))
    {
      v16 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v14 = nw_path_get_status(v13) == nw_path_status_unsatisfied;
LABEL_11:
    v16 = !v14;
    goto LABEL_14;
  }
  v16 = 1;
LABEL_15:

  return v16;
}

- (NSMutableArray)networkEvaluationGroups
{
  return self->_networkEvaluationGroups;
}

- (void)setNetworkEvaluationGroups:(id)a3
{
  objc_storeStrong((id *)&self->_networkEvaluationGroups, a3);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (os_unfair_recursive_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_recursive_lock_s)a3
{
  self->_lock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_networkEvaluationGroups, 0);
}

@end
