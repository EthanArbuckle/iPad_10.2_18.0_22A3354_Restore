@implementation _DASDaemon

- (void)cancelTaskRequestWithIdentifier:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  void *v19;
  _DASDaemon *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
  v19 = v7;
  v20 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_applicationLaunchRequests, "objectForKeyedSubscript:", v7));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "isBackgroundTaskActivity"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "clientProvidedIdentifier"));
          v17 = objc_msgSend(v16, "isEqualToString:", v6);

          if (v17)
            objc_msgSend(v8, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v12);
  }

  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  v18 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v6;
    v27 = 2112;
    v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Canceling task request %{public}@ for %@", buf, 0x16u);
  }

  -[_DASDaemon cancelActivities:](v20, "cancelActivities:", v8);
}

- (void)evaluateScoreAndRunAllActivitiesForReason:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *evaluationQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  _DASDaemon *v11;
  id v12;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.evaluateScoreAndRunAll");
  evaluationQueue = self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000044D0;
  block[3] = &unk_10015D530;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_sync((dispatch_queue_t)evaluationQueue, block);

}

- (void)cancelAllTaskRequestsForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_applicationLaunchRequests, "objectForKeyedSubscript:", v4));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isBackgroundTaskActivity"))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  os_unfair_recursive_lock_unlock(&self->_applicationLaunchRequestsLock);
  -[_DASDaemon cancelActivities:](self, "cancelActivities:", v5);

}

- (void)scheduleTimerOnBehalfOf:(id)a3 between:(double)a4 and:(double)a5 waking:(BOOL)a6
{
  id v10;
  OS_dispatch_queue *timerSchedulingQueue;
  id v12;
  _QWORD block[5];
  id v14;
  double v15;
  double v16;
  BOOL v17;

  v10 = a3;
  timerSchedulingQueue = self->_timerSchedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007940;
  block[3] = &unk_10015FA78;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  block[4] = self;
  v14 = v10;
  v12 = v10;
  dispatch_sync((dispatch_queue_t)timerSchedulingQueue, block);

}

- (void)schedulingTimerFired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)os_transaction_create("com.apple.dasd.schedulingTimerFired");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "descriptionWithLocale:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Periodic timer fired (%@)"), v5));

  -[_DASDaemon evaluateScoreAndRunAllActivitiesForReason:](self, "evaluateScoreAndRunAllActivitiesForReason:", v6);
  -[_DASDaemon determineNextTimerFireDateAndSchedule](self, "determineNextTimerFireDateAndSchedule");

}

- (void)getPendingTaskRequestsForApplication:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
  v16 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_applicationLaunchRequests, "objectForKeyedSubscript:", v6));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "isBackgroundTaskActivity")
          && (-[NSMutableSet containsObject:](self->_runningTasks, "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  os_unfair_recursive_lock_unlock(&self->_applicationLaunchRequestsLock);
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  v15 = objc_msgSend(v8, "copy");
  v7[2](v7, v15);

}

- (void)activityCompleted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  os_unfair_recursive_lock_s *p_activityStateLock;
  void *v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;

  v4 = a3;
  v23 = (void *)os_transaction_create("com.apple.dasd.activityCompleted");
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortDescription"));
    *(_DWORD *)buf = 138543362;
    v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "COMPLETED %{public}@", buf, 0xCu);

  }
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = self->_runningTasks;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid", p_activityStateLock));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (v15)
        {
          objc_msgSend(v4, "reconcileWithActivity:", v12);
          goto LABEL_13;
        }
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
  objc_msgSend(v16, "recordActivityLifeCycleEnd:", v4);

  -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:](self, "recordToTaskRegistry:lifeCycleStateName:", v4, CFSTR("completed"));
  -[_DASDaemon cleanupForActivity:wasCompleted:](self, "cleanupForActivity:wasCompleted:", v4, 1);
  if (objc_msgSend(v4, "isIntensive"))
    -[_DASFairScheduleManager activityCompleted:](self->_fairScheduleManager, "activityCompleted:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityDurationTracker sharedInstance](_DASActivityDurationTracker, "sharedInstance", p_activityStateLock));
  objc_msgSend(v17, "activityCompleted:", v4);

  -[_DASActivityDependencyManager reportActivityDidFinishRunning:](self->_dependencyManager, "reportActivityDidFinishRunning:", v4);
  if (-[_DASSleepWakeMonitor inADarkWake](self->_sleepWakeMonitor, "inADarkWake"))
    -[_DASSleepWakeMonitor recordNoLongerRunningActivity:](self->_sleepWakeMonitor, "recordNoLongerRunningActivity:", v4);
  if (objc_msgSend(v4, "userRequestedBackupTask"))
    -[_DASUserRequestedBackupTaskManager reportActivityNoLongerRunning:](self->_backupTaskManager, "reportActivityNoLongerRunning:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v4, "setEndTime:", v18);

  if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:](_DASCheckpointRecorder, "shouldLogCheckpointForActivity:", v4))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
    objc_msgSend(v19, "reportTaskCheckpoint:forTask:error:", 30, v4, 0);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
  v21 = objc_msgSend(v20, "hasPrefix:", _DASLaunchReasonContinuedProcessing);

  if (v21)
    -[_DASDaemon updateCompletionStatus:forOngoingTask:](self, "updateCompletionStatus:forOngoingTask:", 1, v4);
  -[_DASFeatureDurationTracker updateFeatureDurationActivityCompleted:](self->_featureDurationTracker, "updateFeatureDurationActivityCompleted:", v4);
  if (arc4random_uniform(0x64u) == 1)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000B75A8;
    v24[3] = &unk_10015FD60;
    v24[4] = self;
    v25 = v4;
    AnalyticsSendEventLazy(CFSTR("com.apple.dasd.taskmetrics"), v24);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _DASDaemon *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSMutableArray *v14;
  int v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (objc_msgSend(v6, "isEqual:", v8->_listener))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.duet.activityscheduler.allow")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("application-identifier")));
    if (+[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild")
      && (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0
      || v9 && (-[NSObject BOOLValue](v9, "BOOLValue") & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Creating restricted client for connection %@", (uint8_t *)&v16, 0xCu);
      }

      v11 = 1;
    }

  }
  else
  {
    if (!objc_msgSend(v6, "isEqual:", v8->_bgstListener))
    {
      v11 = 0;
      goto LABEL_17;
    }
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating unrestricted client connection for BGSTHelper %@", (uint8_t *)&v16, 0xCu);
    }
    v11 = 0;
  }

LABEL_17:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemonClient clientForDaemon:withConnection:isRestricted:](_DASDaemonClient, "clientForDaemon:withConnection:isRestricted:", v8, v7, v11));
  v14 = v8->_clients;
  objc_sync_enter(v14);
  -[NSMutableArray addObject:](v8->_clients, "addObject:", v13);
  objc_sync_exit(v14);

  objc_sync_exit(v8);
  return 1;
}

- (BOOL)shouldRunActivityNow:(id)a3
{
  _DASDaemon *v3;
  os_unfair_recursive_lock_s *p_activityStateLock;
  id v5;
  void *v6;

  v3 = self;
  p_activityStateLock = &self->_activityStateLock;
  v5 = a3;
  os_unfair_recursive_lock_lock_with_options(p_activityStateLock, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjectsFrom:](NSArray, "arrayWithObjectsFrom:", v3->_prerunningTasks, v3->_runningTasks, 0));
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  LOBYTE(v3) = -[_DASDaemon shouldRunActivityNow:withOtherActivities:](v3, "shouldRunActivityNow:withOtherActivities:", v5, v6);

  return (char)v3;
}

- (_DASENManager)enManager
{
  return self->_enManager;
}

- (void)activityCanceled:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSMutableSet *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  os_unfair_recursive_lock_s *p_activityStateLock;
  uint64_t v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;

  v4 = a3;
  v42 = (void *)os_transaction_create("com.apple.dasd.activityCanceled");
  v5 = +[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild");
  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortDescription"));
    *(_DWORD *)buf = 138412290;
    v51 = v8;
    v9 = "CANCELED: %@";
    v10 = v6;
    v11 = 12;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "schedulingPriority")));
    *(_DWORD *)buf = 138543618;
    v51 = v4;
    v52 = 2114;
    v53 = v8;
    v9 = "CANCELED: %{public}@ at priority %{public}@";
    v10 = v6;
    v11 = 22;
  }
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);

LABEL_7:
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = self->_runningTasks;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uuid", p_activityStateLock));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (v20)
        {
          objc_msgSend(v4, "reconcileWithActivity:", v17);
          goto LABEL_17;
        }
      }
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_17:

  if (-[NSMutableSet containsObject:](self->_runningTasks, "containsObject:", v4))
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suspendRequestDate"));
    if (v21
      || (v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"))) == 0
      || (objc_msgSend(v4, "requestsApplicationLaunch") & 1) != 0)
    {
LABEL_19:

      goto LABEL_20;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientName"));
    v38 = objc_msgSend(v37, "isEqualToString:", _DASClientNameBGST);

    if ((v38 & 1) == 0)
    {
      v21 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("misuse")));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        *(_DWORD *)buf = 138412290;
        v51 = v39;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Please file a bug for %@ – the activity deferred without being asked to defer", buf, 0xCu);

      }
      goto LABEL_19;
    }
  }
LABEL_20:
  if (!-[NSMutableSet containsObject:](self->_runningTasks, "containsObject:", v4, p_activityStateLock))
  {
    if (!+[_DASCheckpointRecorder shouldLogCheckpointForActivity:](_DASCheckpointRecorder, "shouldLogCheckpointForActivity:", v4))
    {
      v23 = 0;
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suspendRequestDate"));
  v23 = v22 != 0;

  if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:](_DASCheckpointRecorder, "shouldLogCheckpointForActivity:", v4))
  {
    if (v22)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
      objc_msgSend(v24, "reportTaskCheckpoint:forTask:error:", 40, v4, 0);
      v23 = 1;
LABEL_26:

      goto LABEL_28;
    }
LABEL_25:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
    objc_msgSend(v24, "reportTaskCheckpoint:forTask:error:", 50, v4, 0);
    v23 = 0;
    goto LABEL_26;
  }
LABEL_28:
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fastPass"));
  if (v25)
  {
    v26 = (void *)v25;
    v27 = -[_DASRuntimeLimiter featureHasNoRemainingRuntimeForActivity:](self->_runtimeLimiter, "featureHasNoRemainingRuntimeForActivity:", v4);

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPostRestoreBUILogger sharedInstance](_DASPostRestoreBUILogger, "sharedInstance"));
      objc_msgSend(v28, "reportState:forActivity:", 30, v4);

    }
  }
  os_unfair_recursive_lock_unlock(v41);
  if (v23)
    -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:](self, "recordToTaskRegistry:lifeCycleStateName:", v4, CFSTR("suspended"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
  objc_msgSend(v29, "recordActivityLifeCycleEnd:", v4);

  -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:](self, "recordToTaskRegistry:lifeCycleStateName:", v4, CFSTR("canceled"));
  -[_DASDaemon cleanupForActivity:wasCompleted:](self, "cleanupForActivity:wasCompleted:", v4, 0);
  if (objc_msgSend(v4, "isIntensive"))
    -[_DASFairScheduleManager activityCanceled:](self->_fairScheduleManager, "activityCanceled:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
  v31 = objc_msgSend(v30, "hasPrefix:", _DASLaunchReasonContinuedProcessing);

  if (v31)
    -[_DASDaemon updateCompletionStatus:forOngoingTask:](self, "updateCompletionStatus:forOngoingTask:", 0, v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityDurationTracker sharedInstance](_DASActivityDurationTracker, "sharedInstance"));
  objc_msgSend(v32, "activityCanceled:", v4);

  if (objc_msgSend(v4, "userRequestedBackupTask"))
  {
    objc_msgSend(v4, "setCompletionStatus:", 3);
    -[_DASUserRequestedBackupTaskManager reportActivityNoLongerRunning:](self->_backupTaskManager, "reportActivityNoLongerRunning:", v4);
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v4, "setEndTime:", v33);

  -[_DASFeatureDurationTracker updateFeatureDurationActivityCompleted:](self->_featureDurationTracker, "updateFeatureDurationActivityCompleted:", v4);
  if (arc4random_uniform(0xFA0u) == 1)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000B75B8;
    v43[3] = &unk_10015FD60;
    v43[4] = self;
    v44 = v4;
    AnalyticsSendEventLazy(CFSTR("com.apple.dasd.taskmetrics"), v43);

  }
  if (+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v4))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suspendRequestDate"));

    if (!v34)
    {
      v35 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_photosIsBlocked));
        *(_DWORD *)buf = 138543618;
        v51 = v4;
        v52 = 2112;
        v53 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Reporting photos activity no longer blocked: %{public}@ (was %@)", buf, 0x16u);

      }
      -[_DASDaemon updateiCPLTasksBlocked:](self, "updateiCPLTasksBlocked:", 0);
      if (_os_feature_enabled_impl("DAS", "photos_intent_sync")
        && +[_DASPhotosPolicy isPhotosSyncActivity:](_DASPhotosPolicy, "isPhotosSyncActivity:", v4)
        && -[_DASRemoteDeviceActivityMonitor isRegistered](self->_remoteDeviceActivityMonitor, "isRegistered"))
      {
        -[_DASRemoteDeviceActivityMonitor unregisterForRemoteDeviceActiveNotifications](self->_remoteDeviceActivityMonitor, "unregisterForRemoteDeviceActiveNotifications");
      }
    }
  }

}

- (void)submitActivity:(id)a3
{
  -[_DASDaemon submitActivity:inGroup:withHandler:](self, "submitActivity:inGroup:withHandler:", a3, 0, &stru_10015FD10);
}

- (void)recordToTaskRegistry:(id)a3 lifeCycleStateName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceName"));
  if (!self->_taskRegistryMode || !-[NSSet containsObject:](self->_taskRegistryProcesses, "containsObject:", v9))
    goto LABEL_29;
  v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("taskregistry")));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1000EA1C8();

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_testingDefaults, "objectForKey:", CFSTR("taskRegistry")));
  v12 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");

  if (!v12)
    v12 = objc_opt_new(NSMutableDictionary);
  v13 = objc_opt_new(NSMutableDictionary);
  v36 = v9;
  v32 = v8;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("submitted")))
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "submitDate"));
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("started")))
    {
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startConditions"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "policyResponseMetadata"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("scoreWhenRun")));
      objc_msgSend(v16, "score");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

      +[_DASConditionScore thresholdScoreForActivity:](_DASConditionScore, "thresholdScoreForActivity:", v6);
      v18 = v34;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v19, "doubleValue");
      v21 = v37;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20 * 0.9));
      goto LABEL_15;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("suspended")))
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suspendRequestDate"));
      v21 = objc_claimAutoreleasedReturnValue(-[_DASDaemon currentReportingConditions](self, "currentReportingConditions"));
      v17 = 0;
      v19 = 0;
      v22 = 0;
      goto LABEL_15;
    }
    v14 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  }
  v18 = v14;
  v17 = 0;
  v19 = 0;
  v22 = 0;
  v21 = 0;
LABEL_15:
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("started")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("suspended")))
  {
    v35 = v18;
    v23 = v12;
    v24 = v22;
    v25 = v19;
    if (objc_msgSend(v6, "wasForceRun"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "wasForceRun")));
      -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v26, CFSTR("wasForceRun"));

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "lastDenialValue")));
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v27, CFSTR("lastDenialValue"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastScored"));
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v28, CFSTR("lastScored"));

    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v21, CFSTR("conditions"));
    v19 = v25;
    v22 = v24;
    v12 = v23;
    v18 = v35;
  }
  if (v17)
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v17, CFSTR("scoreWhenRun"));
  if (v19)
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v19, CFSTR("thresholdScore"));
  v33 = v19;
  v38 = (void *)v21;
  if (v22)
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v22, CFSTR("relaxedThresholdScore"));
  -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v18, CFSTR("timestamp"));
  -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v7, CFSTR("state"));
  v29 = (void *)v18;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v32));
  v31 = (NSMutableArray *)objc_msgSend(v30, "mutableCopy");

  if (!v31)
    v31 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v31, "addObject:", v13);
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v31, v32);
  -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", v12, CFSTR("taskRegistry"));

  v8 = v32;
  v9 = v36;
LABEL_29:

}

- (BOOL)shouldEvaluateTask:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *activityToIncompatibleActivitiesMap;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  double v15;

  v6 = a3;
  v7 = a4;
  v8 = self->_activityToIncompatibleActivitiesMap;
  objc_sync_enter(v8);
  activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](activityToIncompatibleActivitiesMap, "objectForKeyedSubscript:", v10));

  v12 = objc_msgSend(v11, "count");
  objc_sync_exit(v8);

  if (v12)
  {
    v13 = 0;
  }
  else if ((objc_msgSend(v6, "hasManyConstraints") & 1) != 0
         || (objc_msgSend(v6, "bypassesPredictions") & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
    objc_msgSend(v14, "timeIntervalSinceDate:", v7);
    v13 = v15 < 1800.0;

  }
  return v13;
}

- (void)clearActivityFromPrerunning:(id)a3
{
  id v4;
  NSMutableSet *prerunningTasks;
  id v6;
  os_unfair_lock_s *p_groupLock;
  NSMutableDictionary *groupToPrerunningTasks;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1000B383C;
  v21 = sub_1000B384C;
  v22 = 0;
  prerunningTasks = self->_prerunningTasks;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000B3854;
  v14 = &unk_10015FCD0;
  v6 = v4;
  v15 = v6;
  v16 = &v17;
  -[NSMutableSet enumerateObjectsUsingBlock:](prerunningTasks, "enumerateObjectsUsingBlock:", &v11);
  if (v18[5])
    -[NSMutableSet removeObject:](self->_prerunningTasks, "removeObject:", v11, v12, v13, v14);
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  groupToPrerunningTasks = self->_groupToPrerunningTasks;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v18[5], "groupName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groupToPrerunningTasks, "objectForKeyedSubscript:", v9));
  objc_msgSend(v10, "removeObject:", v18[5]);

  os_unfair_lock_unlock(p_groupLock);
  _Block_object_dispose(&v17, 8);

}

- (void)addTriggersToActivity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _UNKNOWN **v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  id v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  _DASDaemon *v29;
  uint64_t v30;
  id v31;
  id obj;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v29 = self;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    v8 = CFSTR("com.apple.das.fileprotectionpolicy.statuschanged");
    v30 = *(_QWORD *)v42;
    do
    {
      v9 = 0;
      v31 = v6;
      do
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v9);
        if (objc_msgSend(v10, "appliesToActivity:", v3, v29))
        {
          v33 = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "triggers"));
          v12 = &AnalyticsSendEvent_ptr;
          v36 = v11;
          if (v11)
          {
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v38;
              v34 = *(_QWORD *)v38;
              do
              {
                v16 = 0;
                v35 = v14;
                do
                {
                  if (*(_QWORD *)v38 != v15)
                    objc_enumerationMutation(v36);
                  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v16), "objectForKeyedSubscript:", CFSTR("identifier")));
                  v18 = v17;
                  if (v17)
                  {
                    if (!objc_msgSend(v17, "isEqualToString:", v8))
                      goto LABEL_35;
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileProtection"));
                    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[202], "none"));
                    if (objc_msgSend(v19, "isEqual:", v20))
                    {

                      v15 = v34;
                      v14 = v35;
                      goto LABEL_25;
                    }
                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileProtection"));
                    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12[202], "completeUntilFirstUserAuthentication"));
                    v23 = v8;
                    v24 = v3;
                    v25 = v4;
                    v26 = (void *)v22;
                    v27 = objc_msgSend(v21, "isEqual:", v22);

                    v4 = v25;
                    v3 = v24;
                    v8 = v23;
                    v12 = &AnalyticsSendEvent_ptr;

                    v15 = v34;
                    v14 = v35;
                    if ((v27 & 1) == 0)
                    {
LABEL_35:
                      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.cpuusagepolicy.cpuusagelevelchange")) & 1) == 0&& !objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.thermalpolicypolicy.thermalpressurechange"))|| (objc_msgSend(v3, "bypassesPredictions") & 1) != 0|| (v28 = objc_msgSend(v3, "schedulingPriority"), (unint64_t)v28 >= _DASSchedulingPriorityUtility)|| (objc_msgSend(v3, "isIntensive") & 1) != 0|| objc_msgSend(v3, "triggersRestart"))
                      {
                        objc_msgSend(v4, "addObject:", v18);
                      }
                    }
                  }
LABEL_25:

                  v16 = (char *)v16 + 1;
                }
                while (v14 != v16);
                v14 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              }
              while (v14);
            }
          }

          v7 = v30;
          v6 = v31;
          v9 = v33;
        }
        v9 = (char *)v9 + 1;
      }
      while (v9 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v4, "count"))
    -[_DASDaemon associateActivity:withTriggerKeys:](v29, "associateActivity:withTriggerKeys:", v3, v4);

}

- (void)associateActivity:(id)a3 withTriggerKeys:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = self->_triggerToActivitiesMap;
  objc_sync_enter(v8);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerToActivitiesMap, "objectForKeyedSubscript:", v13, (_QWORD)v18));
        v15 = v14 == 0;

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_triggerToActivitiesMap, "setObject:forKeyedSubscript:", v16, v13);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerToActivitiesMap, "objectForKeyedSubscript:", v13));
        objc_msgSend(v17, "_DAS_addOrReplaceObject:", v6);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)addPendingActivity:(id)a3 toGroupWithName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_groupLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToPendingTasks, "objectForKeyedSubscript:", v6));
  if (!v7)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupToPendingTasks, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "_DAS_addOrReplaceObject:", v8);
  os_unfair_lock_unlock(&self->_groupLock);

}

- (void)reportOversizeLoadSymptomForActivity:(id)a3 atStart:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  size_t v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "uploadSize");
  v8 = objc_msgSend(v6, "downloadSize");
  if (objc_msgSend(v6, "noTransferSizeSpecified"))
    v8 = (id)_DASActivityTransferSizeSmall;
  if (+[_DASNetworkQualityPolicy shouldReportOversizeLoadForTransferSize:withContext:](_DASNetworkQualityPolicy, "shouldReportOversizeLoadForTransferSize:withContext:", (char *)v7 + (_QWORD)v8, self->_context))
  {
    if (v4)
      v9 = 1;
    else
      v9 = 2;
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name")));
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    v12 = symptom_create("com.apple.das.oversize.load");
    symptom_set_qualifier(v12, (_QWORD)v8 << 10, 2);
    symptom_set_qualifier(v12, (_QWORD)v7 << 10, 1);
    symptom_set_qualifier(v12, v9, 0);
    v13 = strlen(v11);
    symptom_set_additional_qualifier(v12, 1, v13, v11);
    v14 = symptom_send(v12);
    v15 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("networkbudgeting")));
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1000EA62C(v6, v16);
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
      v19 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
      v20 = (void *)v19;
      v21 = CFSTR("end");
      v22 = 138413058;
      v23 = v17;
      v24 = 2112;
      if (v4)
        v21 = CFSTR("start");
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      v28 = 2112;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Reported to symptoms %@ with upload %@ and download %@ at %@", (uint8_t *)&v22, 0x2Au);

    }
  }

}

- (void)removeLaunchRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  unsigned int v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
    os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
    v10 = objc_msgSend(v4, "requestsExtensionLaunch");
    v11 = 136;
    if (v10)
      v11 = 152;
    v12 = *(id *)((char *)&self->super.isa + v11);
    v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removing a launch request for application %@ by activity %@", (uint8_t *)&v17, 0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));
    objc_msgSend(v14, "removeObject:", v4);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));
    v16 = objc_msgSend(v15, "count");

    if (!v16)
      objc_msgSend(v12, "removeObjectForKey:", v8);

    os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  }

}

- (void)removeActivityFromTriggerMap:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *triggerToActivitiesMap;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = self->_triggerToActivitiesMap;
  objc_sync_enter(v5);
  triggerToActivitiesMap = self->_triggerToActivitiesMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017518;
  v8[3] = &unk_10015FAC8;
  v7 = v4;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](triggerToActivitiesMap, "enumerateKeysAndObjectsUsingBlock:", v8);

  objc_sync_exit(v5);
}

- (void)releaseAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IOPMAssertionID v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  IOPMAssertionID v17;

  v4 = a3;
  if (_os_feature_enabled_impl("DAS", "activity_prevent_sleep"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      v9 = objc_msgSend(v8, "unsignedIntValue");
      if (objc_msgSend(v4, "preventDeviceSleep"))
      {
        v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
          v14 = 138412546;
          v15 = v11;
          v16 = 1024;
          v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Releasing assertion for %@ %u", (uint8_t *)&v14, 0x12u);

        }
      }
      IOPMAssertionRelease(v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
      objc_msgSend(v12, "removeObjectForKey:", v13);

    }
    objc_sync_exit(v5);

  }
}

- (NSMutableDictionary)powerAssertions
{
  return self->_powerAssertions;
}

- (BOOL)canSubmitValidatedTaskRequest:(id)a3 withError:(id *)a4
{
  _DASDaemon *v6;
  void *v7;
  unsigned __int8 v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  unsigned int v29;
  NSObject *v30;
  NSObject *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *i;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  NSObject *v47;
  id v48;
  void *v49;
  unsigned __int8 v50;
  BOOL v51;
  id *v52;
  int v53;
  void *v54;
  unsigned int v55;
  _DASDaemon *v57;
  void *v58;
  id *v59;
  uint64_t v60;
  void *v61;
  unint64_t v62;
  _DASDaemon *v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];

  v6 = (_DASDaemon *)a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon launchReason](v6, "launchReason"));
  v8 = objc_msgSend(v7, "hasPrefix:", _DASLaunchReasonContinuedProcessing);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
    goto LABEL_77;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon relatedApplications](v6, "relatedApplications"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  if ((-[_DASDaemon isContactTracingBackgroundActivity](v6, "isContactTracingBackgroundActivity") & 1) == 0
    && !-[_DASBARScheduler backgroundLaunchAllowedForApp:](self->_barScheduler, "backgroundLaunchAllowedForApp:", v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon launchReason](v6, "launchReason"));
    v13 = objc_msgSend(v12, "isEqualToString:", _DASLaunchReasonHealthResearch);

    if ((v13 & 1) == 0)
    {
      if (a4)
      {
        v18 = _DASActivitySchedulerErrorDomain;
        v19 = 0;
        goto LABEL_64;
      }
LABEL_65:
      v9 = 0;
      goto LABEL_76;
    }
  }
  if (!-[_DASBARScheduler backgroundLaunchAllowedForBGTaskActivity:](self->_barScheduler, "backgroundLaunchAllowedForBGTaskActivity:", v6))
  {
    if (a4)
    {
      v18 = _DASActivitySchedulerErrorDomain;
      v19 = 2;
LABEL_64:
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, v19, 0));
      goto LABEL_76;
    }
    goto LABEL_65;
  }
  v59 = a4;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
  v58 = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_applicationLaunchRequests, "objectForKeyedSubscript:", v11));
  v15 = objc_msgSend(v14, "mutableCopy");
  v16 = v15;
  v63 = v6;
  v57 = self;
  if (v15)
    v17 = v15;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v20 = v17;

  os_unfair_recursive_lock_unlock(&self->_applicationLaunchRequestsLock);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v70;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v70 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v25);
        if (objc_msgSend(v26, "isBackgroundTaskActivity", v57))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clientProvidedIdentifier"));
          self = (_DASDaemon *)objc_claimAutoreleasedReturnValue(-[_DASDaemon clientProvidedIdentifier](v63, "clientProvidedIdentifier"));
          v28 = objc_msgSend(v27, "isEqualToString:", self);

          v29 = -[_DASDaemon isContactTracingBackgroundActivity](v63, "isContactTracingBackgroundActivity");
          if (v28)
          {
            if (v29 && objc_msgSend(v26, "isContactTracingBackgroundActivity"))
            {
              v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clientProvidedStartDate"));
              if (v30)
                goto LABEL_24;
              v30 = objc_claimAutoreleasedReturnValue(-[_DASDaemon clientProvidedStartDate](v63, "clientProvidedStartDate"));
              if (v30)
                goto LABEL_24;
              self = (_DASDaemon *)objc_msgSend(v26, "requiresPlugin");
              if ((_DWORD)self != -[_DASDaemon requiresPlugin](v63, "requiresPlugin"))
                goto LABEL_24;
              v32 = objc_msgSend(v26, "requiresNetwork");
              if (v32 == -[_DASDaemon requiresNetwork](v63, "requiresNetwork"))
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startAfter"));
                self = v63;
                -[_DASDaemon setStartAfter:](v63, "setStartAfter:", v33);

                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startBefore"));
                -[_DASDaemon setStartBefore:](v63, "setStartBefore:", v34);

                v30 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Pending identical task", buf, 2u);
                }
LABEL_24:

              }
            }
            objc_msgSend(v61, "addObject:", v26);
            goto LABEL_31;
          }
          if (v29 && objc_msgSend(v26, "isContactTracingBackgroundActivity"))
          {
            objc_msgSend(v61, "addObject:", v26);
            v31 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("exposure-notification")));
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Replacing similar task", buf, 2u);
            }

          }
        }
LABEL_31:
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      v35 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
      v23 = v35;
    }
    while (v35);
  }

  objc_msgSend(v21, "minusSet:", v61);
  objc_msgSend(v21, "addObject:", v63);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v21;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (!v36)
  {
    v38 = 0;
    v62 = 0;
    goto LABEL_51;
  }
  v37 = v36;
  v38 = 0;
  v62 = 0;
  v39 = *(_QWORD *)v66;
  v40 = _DASLaunchReasonBackgroundProcessing;
  v41 = _DASLaunchReasonHealthResearch;
  v60 = _DASLaunchReasonBackgroundRefresh;
  do
  {
    for (i = 0; i != v37; i = (char *)i + 1)
    {
      if (*(_QWORD *)v66 != v39)
        objc_enumerationMutation(obj);
      v43 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "launchReason", v57));
      if (objc_msgSend(v44, "isEqualToString:", v40))
      {

LABEL_45:
        ++v38;
        continue;
      }
      self = (_DASDaemon *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "launchReason"));
      v45 = -[_DASDaemon isEqualToString:](self, "isEqualToString:", v41);

      if (v45)
        goto LABEL_45;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "launchReason"));
      self = (_DASDaemon *)objc_msgSend(v46, "isEqualToString:", v60);

      v62 += self;
    }
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  }
  while (v37);
LABEL_51:

  v6 = v63;
  if (objc_msgSend(v61, "count"))
  {
    v47 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v61;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Removing pending tasks: %@", buf, 0xCu);
    }

    v48 = objc_msgSend(v61, "copy");
    -[_DASDaemon cancelActivities:](v57, "cancelActivities:", v48);

  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon launchReason](v63, "launchReason", v57));
  v50 = objc_msgSend(v49, "isEqualToString:", _DASLaunchReasonBackgroundProcessing);
  if ((v50 & 1) != 0)
  {
    v51 = v38 > 0xA;
    v11 = v58;
    v52 = v59;
    if (v51)
    {
      v53 = 1;
    }
    else
    {
LABEL_67:
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon launchReason](v63, "launchReason"));
      v55 = objc_msgSend(v54, "isEqualToString:", _DASLaunchReasonBackgroundRefresh);
      if (v62 > 1)
        v53 = v55;
      else
        v53 = 0;

      if ((v50 & 1) == 0)
        goto LABEL_71;
    }
  }
  else
  {
    self = (_DASDaemon *)objc_claimAutoreleasedReturnValue(-[_DASDaemon launchReason](v63, "launchReason"));
    if (!-[_DASDaemon isEqualToString:](self, "isEqualToString:", _DASLaunchReasonHealthResearch)
      || v38 <= 0xA)
    {
      v11 = v58;
      v52 = v59;
      goto LABEL_67;
    }
    v53 = 1;
    v11 = v58;
    v52 = v59;
LABEL_71:

  }
  v9 = v53 ^ 1;
  if (v52 && v53)
    *v52 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", _DASActivitySchedulerErrorDomain, 4, 0));

LABEL_76:
LABEL_77:

  return v9;
}

- (void)cancelActivities:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Daemon Canceling Activities: %{public}@", buf, 0xCu);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[_DASDaemon activityCanceled:](self, "activityCanceled:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10));
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000EE14;
    v11[3] = &unk_10015FAF0;
    v12 = v6;
    -[_DASDaemon allClientsDo:](self, "allClientsDo:", v11);

  }
}

- (void)allClientsDo:(id)a3
{
  void (**v4)(id, _QWORD);
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_clients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)advanceAppLaunchDateIfNecessaryForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  _BOOL4 v23;
  double v24;
  void *v25;
  double v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  double v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", _DASNonRateLimitedLaunchKey));
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
    if (objc_msgSend(v8, "count")
      && (v9 = objc_msgSend(v4, "schedulingPriority"), (unint64_t)v9 <= _DASSchedulingPriorityUtility))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widgetID"));

      if (!v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASApplicationPolicy focalApplicationsWithContext:](_DASApplicationPolicy, "focalApplicationsWithContext:", self->_context));
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications", 0));
        v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v36;
LABEL_8:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(v12);
            if ((objc_msgSend(v11, "containsObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15)) & 1) != 0)
              break;
            if (v13 == (id)++v15)
            {
              v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
              if (v13)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          v12 = self->_recentlyLaunchedApps;
          objc_sync_enter(v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_recentlyLaunchedApps, "objectForKeyedSubscript:", v17));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startAfter"));
          if (-[NSCountedSet countForObject:](self->_launchesPerApp, "countForObject:", v17) > 9
            || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason")),
                v21 = v20 == (void *)_DASLaunchReasonBackgroundProcessing,
                v20,
                v21))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
            v23 = v22 == (void *)_DASLaunchReasonBackgroundProcessing;

            v24 = v23 ? *(double *)&qword_1001AAAB8 : 450.0;
            if (v18)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startAfter"));
              objc_msgSend(v25, "timeIntervalSinceDate:", v18);
              v27 = v26 < v24;

              if (v27)
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateByAddingTimeInterval:", v24));
                objc_msgSend(v4, "setStartAfter:", v28);

                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startAfter"));
                objc_msgSend(v4, "setStartBefore:", v29);

                v30 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startAfter"));
                  objc_msgSend(v31, "timeIntervalSinceDate:", v19);
                  v33 = v32;
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startAfter"));
                  *(_DWORD *)buf = 138412802;
                  v40 = v4;
                  v41 = 2048;
                  v42 = v33 / 60.0;
                  v43 = 2112;
                  v44 = v34;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Advancing start date for %@ by %3.1lf minutes to %@", buf, 0x20u);

                }
              }
            }
          }

          objc_sync_exit(v12);
        }

      }
    }
    else
    {

    }
  }

}

- (BOOL)addLaunchRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  unsigned int v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _DASDaemon *v21;
  id v22;
  os_unfair_recursive_lock_s *v23;
  void *j;
  void *v25;
  unsigned int v26;
  BOOL v27;
  BOOL v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  os_unfair_recursive_lock_s *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v28 = 1;
    goto LABEL_49;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
  v10 = objc_msgSend(v4, "requestsExtensionLaunch");
  v11 = 136;
  if (v10)
    v11 = 152;
  v12 = *(id *)((char *)&self->super.isa + v11);
  v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchReason"));
    *(_DWORD *)buf = 138412802;
    v51 = v14;
    v52 = 2112;
    v53 = v8;
    v54 = 2112;
    v55 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding a launch request (%@) for application %@ by activity %@", buf, 0x20u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));
  v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v51 = v8;
    v52 = 2112;
    v53 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Launch requests for %@: %@", buf, 0x16u);
  }

  if (!v15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v8);
  }
  buf[0] = 1;
  if (!objc_msgSend(v4, "isBackgroundTaskActivity"))
  {
    v42 = 0uLL;
    v43 = 0uLL;
    v40 = 0uLL;
    v41 = 0uLL;
    v29 = v15;
    v35 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (!v35)
      goto LABEL_38;
    v38 = &self->_applicationLaunchRequestsLock;
    v30 = *(_QWORD *)v41;
    while (1)
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(v29);
        v32 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v32, "isIdenticalLaunchTo:", v4, v38))
        {
          if (!objc_msgSend(v4, "overwritesPrevious"))
          {
            os_unfair_recursive_lock_unlock(v38);

            v35 = 0;
            v28 = 0;
            goto LABEL_48;
          }
          v35 = v32;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "startAfter"));
          objc_msgSend(v4, "setStartAfter:", v33);

          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "startBefore"));
          objc_msgSend(v4, "setStartBefore:", v34);

LABEL_37:
          p_applicationLaunchRequestsLock = v38;
LABEL_38:

          goto LABEL_44;
        }
      }
      v35 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (!v35)
        goto LABEL_37;
    }
  }
  v46 = 0uLL;
  v47 = 0uLL;
  v44 = 0uLL;
  v45 = 0uLL;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (!v18)
  {
    v35 = 0;
    goto LABEL_43;
  }
  v19 = v18;
  v20 = *(_QWORD *)v45;
  v39 = v8;
  while (2)
  {
    v21 = self;
    v22 = v12;
    v23 = p_applicationLaunchRequestsLock;
    for (j = 0; j != v19; j = (char *)j + 1)
    {
      if (*(_QWORD *)v45 != v20)
        objc_enumerationMutation(v17);
      v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
      v26 = objc_msgSend(v4, "shouldReplaceActivity:andKeepsSubmitted:", v25, buf);
      if (buf[0])
        v27 = v26 == 0;
      else
        v27 = 1;
      if (!v27)
      {
        v35 = v25;
LABEL_42:
        p_applicationLaunchRequestsLock = v23;
        v12 = v22;
        self = v21;
        v8 = v39;
        goto LABEL_43;
      }
      if (!buf[0])
      {
        v35 = 0;
        goto LABEL_42;
      }
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    v35 = 0;
    p_applicationLaunchRequestsLock = v23;
    v12 = v22;
    self = v21;
    v8 = v39;
    if (v19)
      continue;
    break;
  }
LABEL_43:

  if (buf[0])
LABEL_44:
    objc_msgSend(v15, "_DAS_addOrReplaceObject:", v4);
  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v35));
    -[_DASDaemon cancelActivities:](self, "cancelActivities:", v36);

  }
  v28 = buf[0] != 0;
LABEL_48:

LABEL_49:
  return v28;
}

- (void)establishConnectionFromClient:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  BOOL v27;
  id v28;
  void (**v29)(void);
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;

  v6 = a3;
  v29 = (void (**)(void))a4;
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
    *(_DWORD *)buf = 138412546;
    v36 = v6;
    v37 = 1024;
    LODWORD(v38) = objc_msgSend(v8, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Establishing connection from client %@ with pid %d", buf, 0x12u);

  }
  v9 = self->_connectedBGTaskClients;
  objc_sync_enter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
  v11 = objc_msgSend(v10, "processIdentifier");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon connectedBGTaskClients](self, "connectedBGTaskClients"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon activitiesWaitingForBGTaskClients](self, "activitiesWaitingForBGTaskClients"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon activitiesWaitingForBGTaskClients](self, "activitiesWaitingForBGTaskClients"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
  objc_msgSend(v17, "removeObjectForKey:", v18);

  objc_sync_exit(v9);
  if (objc_msgSend(v16, "count"))
  {
    v19 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v16;
      v37 = 2112;
      v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Delivering pending activities %@ to client %@", buf, 0x16u);
    }

    objc_msgSend(v6, "handleLaunchFromDaemonForActivities:", v16);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = v16;
    v21 = 0;
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "suspendRequestDate"));
          v27 = v26 == 0;

          if (!v27)
          {
            if (!v21)
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
            objc_msgSend(v21, "addObject:", v25);
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v22);
    }

    if (objc_msgSend(v21, "count"))
    {
      v28 = objc_msgSend(v21, "copy");
      objc_msgSend(v6, "willExpireBGTaskActivities:", v28);

    }
  }
  v29[2]();

}

- (NSMutableDictionary)activitiesWaitingForBGTaskClients
{
  return self->_activitiesWaitingForBGTaskClients;
}

- (void)chooseActivitiesToRunFromCandidateActivities:(id)a3 toBeRunActivities:(id)a4 toLaunchApplications:(id)a5 toLaunchExtension:(id)a6
{
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  const __CFDictionary *v27;
  IOReturn v28;
  NSObject *v29;
  dispatch_time_t v30;
  unsigned __int8 v31;
  void *v32;
  id v33;
  id v34;
  int v35;
  id v36;
  void *v37;
  id obj;
  void *v39;
  _QWORD block[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[4];
  IOReturn v46;
  _QWORD v47[3];
  _QWORD v48[3];
  __int128 buf;
  uint64_t v50;
  int v51;
  _BYTE v52[128];

  v33 = a4;
  v36 = a5;
  v34 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon sortCandidateActivities:](self, "sortCandidateActivities:", a3));
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjectsFrom:](NSMutableArray, "arrayWithObjectsFrom:", self->_prerunningTasks, self->_runningTasks, 0));
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (!v11)
  {
    LOBYTE(v35) = 0;
    goto LABEL_38;
  }
  v35 = 0;
  v12 = *(_QWORD *)v42;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v42 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v13);
      if (+[_DASPhotosPolicy isActivity:consideredNonDiscretionary:](_DASPhotosPolicy, "isActivity:consideredNonDiscretionary:", v14, self->_context)|| (objc_msgSend(v14, "isIntensive") & 1) != 0)
      {
        goto LABEL_13;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fastPass"));
      if (v15
        || (objc_msgSend(v14, "triggersRestart") & 1) != 0
        || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupName"))) == 0
        || (v16 = objc_msgSend(v14, "schedulingPriority"), (unint64_t)v16 > _DASSchedulingPriorityDefault))
      {

LABEL_13:
        os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
        if ((-[NSMutableSet containsObject:](self->_pendingTasks, "containsObject:", v14) & 1) != 0)
        {
          os_unfair_recursive_lock_unlock(&self->_activityStateLock);
          if (-[_DASDaemon shouldRunActivityNow:withOtherActivities:](self, "shouldRunActivityNow:withOtherActivities:", v14, v39))
          {
            if (-[_DASActivityRateLimitManager executeActivity:](self->_rateLimiter, "executeActivity:", v14))
            {
              objc_msgSend(v39, "addObject:", v14);
              if (objc_msgSend(v14, "requestsApplicationLaunch"))
              {
                objc_msgSend(v36, "addObject:", v14);
              }
              else if (objc_msgSend(v14, "requestsExtensionLaunch"))
              {
                objc_msgSend(v34, "addObject:", v14);
              }
              else
              {
                objc_msgSend(v33, "addObject:", v14);
                v35 |= objc_msgSend(v14, "triggersRestart");
              }
              -[_DASDaemon moveActivityToPrerunning:](self, "moveActivityToPrerunning:", v14);
            }
            else
            {
              objc_msgSend(v37, "addObject:", v14);
            }
          }
        }
        else
        {
          v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ previously run or canceled", (uint8_t *)&buf, 0xCu);
          }

          os_unfair_recursive_lock_unlock(&self->_activityStateLock);
        }
        goto LABEL_21;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupName"));
      v19 = -[_DASDaemon additionalCapacityForActivity:inGroupWithName:shouldTryToSuspend:](self, "additionalCapacityForActivity:inGroupWithName:shouldTryToSuspend:", v14, v18, 0) == 0;

      if (!v19)
        goto LABEL_13;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupName"));
      if (objc_msgSend(v20, "isEqualToString:", _DASDefaultGroupName))
      {

      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupName"));
        if (objc_msgSend(v21, "isEqualToString:", _DASDefaultNetworkGroupName))
        {

        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupName"));
          v31 = objc_msgSend(v22, "isEqualToString:", _DASDefaultRemoteGroupName);

          if ((v31 & 1) == 0)
            objc_msgSend(v32, "addObject:", v14);
        }
      }
LABEL_21:
      v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    v11 = v23;
  }
  while (v23);
LABEL_38:

  if (objc_msgSend(v32, "count"))
  {
    v24 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v32;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Skipping processing for %@ since their group is full", (uint8_t *)&buf, 0xCu);
    }

  }
  if (objc_msgSend(v37, "count"))
  {
    v25 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v37;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Skipping processing for %@ due to rate limiting", (uint8_t *)&buf, 0xCu);
    }

  }
  if ((v35 & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v50 = 0x2020000000;
    v51 = 0;
    v26 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Taking an assertion", v45, 2u);
    }

    v47[0] = CFSTR("AssertType");
    v47[1] = CFSTR("AssertName");
    v48[0] = CFSTR("PreventUserIdleSystemSleep");
    v48[1] = CFSTR("com.apple.duetactivityscheduler.triggersRestart");
    v47[2] = CFSTR("AllowsDeviceRestart");
    v48[2] = kCFBooleanTrue;
    v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 3));
    v28 = IOPMAssertionCreateWithProperties(v27, (IOPMAssertionID *)(*((_QWORD *)&buf + 1) + 24));
    if (v28)
    {
      v29 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 67109120;
        v46 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed to create SystemActive assertion. ret:0x%x", v45, 8u);
      }
    }
    else
    {
      v30 = dispatch_time(0, 30000000000);
      v29 = dispatch_queue_create("com.apple.duetactivityscheduler.assertion", 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000163F8;
      block[3] = &unk_10015D610;
      block[4] = &buf;
      dispatch_after(v30, v29, block);
    }

    _Block_object_dispose(&buf, 8);
  }

}

- (BOOL)shouldRunActivityNow:(id)a3 withOtherActivities:(id)a4
{
  unsigned int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  NSObject *v19;
  double v20;
  double v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  NSObject *v30;
  id v31;
  id v32;
  int v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  void *v38;
  double v39;
  double v40;
  id v41;
  id v42;
  NSObject *v43;
  double v44;
  double v45;
  unsigned int v46;
  NSObject *v47;
  _BOOL4 v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  id v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  unsigned int v60;
  void *v61;
  NSMutableDictionary *v62;
  NSMutableDictionary *activityToIncompatibleActivitiesMap;
  void *v64;
  void *v65;
  void *v66;
  NSMutableDictionary *v67;
  void *v68;
  void *v69;
  void *v70;
  unsigned int v71;
  NSObject *v72;
  id v73;
  void *v74;
  uint64_t v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  id v87;
  __int16 v88;
  double v89;
  __int16 v90;
  double v91;
  __int16 v92;
  const __CFString *v93;
  _BYTE v94[128];
  _BYTE v95[128];

  v76 = a3;
  v73 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_evaluationQueue);
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObjectsFrom:](NSMutableSet, "setWithObjectsFrom:", self->_prerunningTasks, self->_runningTasks, 0));
  v6 = objc_msgSend(v74, "containsObject:", v76);
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v87 = v76;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is already running. Should not be run again.", buf, 0xCu);
    }
    goto LABEL_15;
  }
  v75 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = v75;
  if (-[_DASDaemon activityIsTimewiseEligible:atDate:](self, "activityIsTimewiseEligible:atDate:", v76, v75))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "lastScored"));
    if (!v8)
    {
      if (!+[_DASCheckpointRecorder shouldLogCheckpointForActivity:](_DASCheckpointRecorder, "shouldLogCheckpointForActivity:", v76))
      {
LABEL_9:
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));

        if (v9 && -[_DASDaemon pausedParametersApplyToActivity:](self, "pausedParametersApplyToActivity:", v76))
        {
          v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v87 = v76;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Scheduling Paused: Skipping activity: %{public}@", buf, 0xCu);
          }

          goto LABEL_14;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "fastPass"));

        if (v13)
        {
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v14 = v73;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(_QWORD *)v83 != v16)
                  objc_enumerationMutation(v14);
                v18 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
                if (-[_DASDaemon shouldPreemptActivity:forFastPassActivity:](self, "shouldPreemptActivity:forFastPassActivity:", v18, v76))
                {
                  v19 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v87 = v18;
                    v88 = 2114;
                    v89 = *(double *)&v76;
                    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Preempting %{public}@ to unblock the associated fast pass %{public}@", buf, 0x16u);
                  }

                  -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:](self, "updateSuspendRequestDate:forActivity:withReason:", v75, v18, CFSTR("Preemption"));
                  -[_DASDaemon suspendActivity:](self, "suspendActivity:", v18);
                }
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
            }
            while (v15);
          }

        }
        v81 = 0;
        +[_DASConditionScore scoreForActivity:withState:response:](_DASConditionScore, "scoreForActivity:withState:response:", v76, self->_context, &v81);
        v21 = v20;
        if (v20 <= 0.0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyDataCollection sharedInstance](_DASPolicyDataCollection, "sharedInstance"));
          v23 = objc_msgSend(v22, "shouldReportBlockingReasonsForActivity:", v76);

          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyDataCollection sharedInstance](_DASPolicyDataCollection, "sharedInstance"));
            objc_msgSend(v24, "reportBlockingReason:forActivity:", objc_msgSend(v76, "lastDenialValue"), v76);

          }
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));

        if (v25
          && (v81 == 100 || v81 == 33)
          && -[_DASDaemon testModeConstraintsApplyToActivity:](self, "testModeConstraintsApplyToActivity:", v76))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "policyScores"));
          v29 = -[_DASDaemon testModeConstraintsRequireOverridingDecisionWithScores:ignoredPolicies:honoredPolicies:](self, "testModeConstraintsRequireOverridingDecisionWithScores:ignoredPolicies:honoredPolicies:", v28, v26, v27);

          if (v26)
            -[_DASDaemon activity:runWithoutHonoringPolicies:](self, "activity:runWithoutHonoringPolicies:", v76, v26);
          if (v27)
            -[_DASDaemon activity:blockedOnPolicies:](self, "activity:blockedOnPolicies:", v76, v27);
          if (v29)
          {
            v30 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v87 = v76;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Test Mode: Proceeding with activity: %@", buf, 0xCu);
            }

            goto LABEL_87;
          }

        }
        -[_DASDaemon reportActivity:isBlockedWithDecision:](self, "reportActivity:isBlockedWithDecision:", v76, v81);
        if (_os_feature_enabled_impl("DAS", "photos_intent_sync")
          && +[_DASPhotosPolicy isPhotosSyncActivity:](_DASPhotosPolicy, "isPhotosSyncActivity:", v76)
          && !+[_DASPhotosPolicy shouldOverrideForIntentSync:activity:](_DASPhotosPolicy, "shouldOverrideForIntentSync:activity:", self->_photosIsBlocked, v76)&& -[_DASRemoteDeviceActivityMonitor isRegistered](self->_remoteDeviceActivityMonitor, "isRegistered")&& -[_DASRemoteDeviceActivityMonitor pendingUnregistration](self->_remoteDeviceActivityMonitor, "pendingUnregistration"))
        {
          -[_DASRemoteDeviceActivityMonitor unregisterForRemoteDeviceActiveNotifications](self->_remoteDeviceActivityMonitor, "unregisterForRemoteDeviceActiveNotifications");
        }
        v11 = 0;
        if (v81 == 33)
          goto LABEL_88;
        v7 = v75;
        if (v81 == 100)
          goto LABEL_16;
        if (v81 == 67)
        {
          v11 = 1;
          goto LABEL_16;
        }
        v31 = objc_msgSend(v76, "schedulingPriority");
        if ((unint64_t)v31 >= _DASSchedulingPriorityUserInitiated)
        {
          v33 = 0;
        }
        else
        {
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v32 = v73;
          v33 = 0;
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v78;
            while (2)
            {
              for (j = 0; j != v34; j = (char *)j + 1)
              {
                if (*(_QWORD *)v78 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
                v38 = objc_autoreleasePoolPush();
                objc_msgSend(v76, "compatibilityWith:", v37);
                v40 = v39;
                if (+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v76))
                {
                  if (+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v37))
                  {
                    v41 = objc_msgSend(v76, "transferSizeType");
                    v42 = objc_msgSend(v37, "transferSizeType");
                    if ((unint64_t)v41 >= 0xB && (unint64_t)v42 > 0xA)
                    {
                      v40 = -1.0;
LABEL_90:
                      v55 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
                      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                      {
                        v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
                        v57 = (void *)v56;
                        v58 = CFSTR("<Not yet started>");
                        *(_DWORD *)buf = 138544130;
                        if (v56)
                          v58 = (const __CFString *)v56;
                        v87 = v76;
                        v88 = 2048;
                        v89 = v40;
                        v90 = 2114;
                        v91 = *(double *)&v37;
                        v92 = 2112;
                        v93 = v58;
                        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "'%{public}@' has compatibility score of %lf with %{public}@ (Started at %@). Bailing out.", buf, 0x2Au);

                      }
                      v59 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyDataCollection sharedInstance](_DASPolicyDataCollection, "sharedInstance"));
                      v60 = objc_msgSend(v59, "shouldReportBlockingReasonsForActivity:", v76);

                      if (v60)
                      {
                        v61 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyDataCollection sharedInstance](_DASPolicyDataCollection, "sharedInstance"));
                        objc_msgSend(v61, "reportBlockingReason:forActivity:", +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", CFSTR("Incompatibility")), v76);

                      }
                      v62 = self->_activityToIncompatibleActivitiesMap;
                      objc_sync_enter(v62);
                      activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
                      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
                      v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](activityToIncompatibleActivitiesMap, "objectForKeyedSubscript:", v64));

                      if (v65)
                      {
                        objc_msgSend(v65, "_DAS_addOrReplaceObject:", v76);
                      }
                      else
                      {
                        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v76));
                        v67 = self->_activityToIncompatibleActivitiesMap;
                        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
                        -[NSMutableDictionary setObject:forKeyedSubscript:](v67, "setObject:forKeyedSubscript:", v66, v68);

                      }
                      objc_sync_exit(v62);

                      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
                      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
                      v71 = -[_DASDaemon shouldSuspendLongRunningActivity:withStartDate:whileBlockingOtherTasks:atDate:](self, "shouldSuspendLongRunningActivity:withStartDate:whileBlockingOtherTasks:atDate:", v37, v69, 1, v70);

                      if (v71)
                      {
                        v72 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
                        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138543362;
                          v87 = v37;
                          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Another intensive activity! Found long running activity %{public}@ to suspend", buf, 0xCu);
                        }

                        -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:](self, "updateSuspendRequestDate:forActivity:withReason:", v75, v37, CFSTR("Limitations"));
                        -[_DASDaemon suspendActivity:](self, "suspendActivity:", v37);
                      }
                      objc_autoreleasePoolPop(v38);

                      goto LABEL_14;
                    }
                  }
                }
                if (v40 < 0.0)
                  goto LABEL_90;
                if (!v33 && v40 > 0.0)
                {
                  v43 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543874;
                    v87 = v76;
                    v88 = 2048;
                    v89 = v40;
                    v90 = 2114;
                    v91 = *(double *)&v37;
                    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "'%{public}@' has compatibility score of %lf with '%{public}@'. Relaxing scores.", buf, 0x20u);
                  }

                  v33 = 1;
                }
                objc_autoreleasePoolPop(v38);
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
              if (v34)
                continue;
              break;
            }
          }

        }
        +[_DASConditionScore thresholdScoreForActivity:](_DASConditionScore, "thresholdScoreForActivity:", v76);
        if (v33)
          v45 = v44 * 0.9;
        else
          v45 = v44;
        v46 = objc_msgSend(v76, "bypassesPredictions");
        v47 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("scoring")));
        v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
        if (v46)
        {
          if (v48)
          {
            *(_DWORD *)buf = 138543618;
            v87 = v76;
            v88 = 1024;
            LODWORD(v89) = v21 > v45;
            v49 = "'%{public}@' DecisionToRun: %d (Bypasses Predictions)";
            v50 = v47;
            v51 = 18;
LABEL_84:
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
          }
        }
        else if (v48)
        {
          *(_DWORD *)buf = 138544130;
          v87 = v76;
          v88 = 2048;
          v89 = v21;
          v90 = 2048;
          v91 = v45;
          v92 = 1024;
          LODWORD(v93) = v21 > v45;
          v49 = "'%{public}@' CurrentScore: %lf, ThresholdScore: %lf DecisionToRun:%d";
          v50 = v47;
          v51 = 38;
          goto LABEL_84;
        }

        if (v21 <= v45)
        {
LABEL_14:
          v11 = 0;
LABEL_88:
          v7 = v75;
          goto LABEL_16;
        }
        v52 = v76;
        objc_sync_enter(v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[_DASInternalPolicyEvaluationMetadata metadataWithScore:](_DASInternalPolicyEvaluationMetadata, "metadataWithScore:", v21));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "policyResponseMetadata"));
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, CFSTR("scoreWhenRun"));

        objc_sync_exit(v52);
LABEL_87:
        v11 = 1;
        goto LABEL_88;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
      objc_msgSend(v8, "reportTaskCheckpoint:forTask:error:", 15, v76, 0);
    }

    goto LABEL_9;
  }
LABEL_15:
  v11 = 0;
LABEL_16:

  return v11;
}

- (BOOL)pausedParametersApplyToActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  unsigned int v51;
  void *v52;
  unsigned int v53;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  id v75;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));

  if (!v5)
  {
    v11 = 0;
    goto LABEL_82;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("validUntil")));
  objc_msgSend(v7, "doubleValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  objc_msgSend(v8, "timeIntervalSinceNow");
  if (v9 < 0.0)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No longer pausing activities!", buf, 2u);
    }

    -[NSUserDefaults removeObjectForKey:](self->_testingDefaults, "removeObjectForKey:", CFSTR("pausedParameters"));
    -[_DASDaemon setPausedParameters:](self, "setPausedParameters:", 0);
    v11 = 0;
    goto LABEL_81;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("activities")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Scheduling paused for activity: %@", buf, 0xCu);
    }
    v11 = 1;
    goto LABEL_80;
  }
  v56 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("anyTypes")));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("allTypes")));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("exceptTypes")));

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v16 = v18;
  v22 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  v58 = v20;
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v68 != v24)
          objc_enumerationMutation(v16);
        v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v26, "isEqualToString:", CFSTR("network"))
          || (objc_msgSend(v4, "requiresNetwork") & 1) == 0)
        {
          if (!objc_msgSend(v26, "isEqualToString:", CFSTR("userinitiated"))
            || (v27 = objc_msgSend(v4, "schedulingPriority"),
                (unint64_t)v27 > _DASSchedulingPriorityUserInitiatedOvercommit))
          {
            if (!objc_msgSend(v26, "isEqualToString:", CFSTR("utility"))
              || (v28 = objc_msgSend(v4, "schedulingPriority"), (unint64_t)v28 > _DASSchedulingPriorityDefault))
            {
              if (!objc_msgSend(v26, "isEqualToString:", CFSTR("maintenance"))
                || (v29 = objc_msgSend(v4, "schedulingPriority"),
                    (unint64_t)v29 > _DASSchedulingPriorityMaintenance))
              {
                if (!objc_msgSend(v26, "isEqualToString:", CFSTR("background"))
                  || (v30 = objc_msgSend(v4, "schedulingPriority"),
                      (unint64_t)v30 > _DASSchedulingPriorityBackground))
                {
                  if ((!objc_msgSend(v26, "isEqualToString:", CFSTR("intensive"))
                     || (objc_msgSend(v4, "isIntensive") & 1) == 0)
                    && (!objc_msgSend(v26, "isEqualToString:", CFSTR("icpl"))
                     || !+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v4))
                    && (!objc_msgSend(v26, "isEqualToString:", CFSTR("plugin"))
                     || (objc_msgSend(v4, "requiresPlugin") & 1) == 0)
                    && (!objc_msgSend(v26, "isEqualToString:", CFSTR("inactivity"))
                     || (objc_msgSend(v4, "requiresDeviceInactivity") & 1) == 0))
                  {
                    if (!objc_msgSend(v26, "isEqualToString:", CFSTR("fastpass")))
                      continue;
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fastPass"));

                    if (!v31)
                      continue;
                  }
                }
              }
            }
          }
        }

        v11 = 1;
LABEL_78:
        v43 = v57;
        v20 = v58;
        goto LABEL_79;
      }
      v23 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      v20 = v58;
    }
    while (v23);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v32 = v20;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (!v33)
    goto LABEL_65;
  v34 = v33;
  v35 = *(_QWORD *)v64;
  do
  {
    for (j = 0; j != v34; j = (char *)j + 1)
    {
      if (*(_QWORD *)v64 != v35)
        objc_enumerationMutation(v32);
      v37 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j);
      if (!objc_msgSend(v37, "isEqualToString:", CFSTR("network"))
        || objc_msgSend(v4, "requiresNetwork"))
      {
        if (!objc_msgSend(v37, "isEqualToString:", CFSTR("userinitiated"))
          || (v38 = objc_msgSend(v4, "schedulingPriority"),
              (unint64_t)v38 <= _DASSchedulingPriorityUserInitiatedOvercommit))
        {
          if (!objc_msgSend(v37, "isEqualToString:", CFSTR("utility"))
            || (v39 = objc_msgSend(v4, "schedulingPriority"), (unint64_t)v39 <= _DASSchedulingPriorityDefault))
          {
            if (!objc_msgSend(v37, "isEqualToString:", CFSTR("maintenance"))
              || (v40 = objc_msgSend(v4, "schedulingPriority"),
                  (unint64_t)v40 <= _DASSchedulingPriorityMaintenance))
            {
              if (!objc_msgSend(v37, "isEqualToString:", CFSTR("background"))
                || (v41 = objc_msgSend(v4, "schedulingPriority"),
                    (unint64_t)v41 <= _DASSchedulingPriorityBackground))
              {
                if ((!objc_msgSend(v37, "isEqualToString:", CFSTR("intensive"))
                   || objc_msgSend(v4, "isIntensive"))
                  && (!objc_msgSend(v37, "isEqualToString:", CFSTR("icpl"))
                   || !+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v4))
                  && (!objc_msgSend(v37, "isEqualToString:", CFSTR("plugin"))
                   || objc_msgSend(v4, "requiresPlugin"))
                  && (!objc_msgSend(v37, "isEqualToString:", CFSTR("inactivity"))
                   || objc_msgSend(v4, "requiresDeviceInactivity")))
                {
                  if (!objc_msgSend(v37, "isEqualToString:", CFSTR("fastpass")))
                    continue;
                  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fastPass"));

                  if (v42)
                    continue;
                }
              }
            }
          }
        }
      }

      v11 = 0;
      goto LABEL_78;
    }
    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    v20 = v58;
  }
  while (v34);
LABEL_65:

  v43 = v57;
  if (!objc_msgSend(v57, "count"))
  {
    v11 = objc_msgSend(v32, "count") != 0;
    goto LABEL_79;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v44 = v57;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (!v45)
  {
    v11 = 1;
    goto LABEL_91;
  }
  v46 = v45;
  v47 = *(_QWORD *)v60;
  while (2)
  {
    v48 = 0;
    while (2)
    {
      if (*(_QWORD *)v60 != v47)
        objc_enumerationMutation(v44);
      v49 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityType"));
      v51 = objc_msgSend(v50, "isEqualToString:", v49);

      if (v51)
      {
        v55 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v4;
LABEL_89:
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Not pausing for: %@", buf, 0xCu);
        }
LABEL_90:
        v43 = v57;

        v11 = 0;
        goto LABEL_91;
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v53 = objc_msgSend(v52, "containsString:", v49);

      if (v53)
      {
        v55 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v4;
          goto LABEL_89;
        }
        goto LABEL_90;
      }
      if (v46 != (id)++v48)
        continue;
      break;
    }
    v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    v11 = 1;
    v43 = v57;
    if (v46)
      continue;
    break;
  }
LABEL_91:

  v20 = v58;
LABEL_79:

  v13 = v56;
LABEL_80:

LABEL_81:
LABEL_82:

  return v11;
}

- (NSDictionary)pausedParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 560, 1);
}

- (int64_t)additionalCapacityForActivity:(id)a3 inGroupWithName:(id)a4 shouldTryToSuspend:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  int64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  char v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  unsigned int v50;
  NSObject *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v58;
  int64_t v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  id v73;
  __int16 v74;
  int64_t v75;
  __int16 v76;
  id v77;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    os_unfair_lock_lock(&self->_groupLock);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groups, "objectForKeyedSubscript:", v9));
    v11 = v10;
    v65 = v5;
    if (v10)
      v12 = (int64_t)objc_msgSend(v10, "maxConcurrent");
    else
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    os_unfair_lock_unlock(&self->_groupLock);
    os_unfair_lock_lock(&self->_groupLock);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToPrerunningTasks, "objectForKeyedSubscript:", v9));
    v15 = objc_msgSend(v14, "copy");
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToRunningTasks, "objectForKeyedSubscript:", v9));
    v20 = objc_msgSend(v19, "copy");
    v21 = v20;
    if (v20)
      v22 = v20;
    else
      v22 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v23 = v22;

    v63 = v23;
    v64 = v18;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "setByAddingObjectsFromSet:", v18));
    v25 = objc_msgSend(v24, "containsObject:", v8);
    v26 = -[_DASDaemon currentLoadFromActivities:inGroupWithName:](self, "currentLoadFromActivities:inGroupWithName:", v24, v9);
    v27 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle(activityGroup)")));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v73 = v9;
      v74 = 2048;
      v75 = v26;
      v76 = 2048;
      v77 = objc_msgSend(v64, "count");
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@: Current Load=%lld (Pre-running=%lld)", buf, 0x20u);
    }

    os_unfair_lock_unlock(&self->_groupLock);
    if ((v25 & 1) != 0)
    {
      v13 = 1;
      v29 = v63;
      v28 = v64;
    }
    else
    {
      if (objc_msgSend(v8, "requiresNetwork"))
      {
        v30 = (uint64_t)+[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", self->_context);
        v31 = +[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", self->_context);
        v32 = +[_CDNetworkContext cellInterfaceClass:](_CDNetworkContext, "cellInterfaceClass:", self->_context);
        v35 = v30 < 1 && (uint64_t)v31 > 0 && v32 == (id)3;
        v12 <<= v35;
      }
      if (objc_msgSend(v8, "requiresNetwork")
        && ((uint64_t)+[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", self->_context) > 50
         || (uint64_t)+[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", self->_context) > 50
         || (uint64_t)+[_CDNetworkContext wiredQuality:](_CDNetworkContext, "wiredQuality:", self->_context) >= 51))
      {
        v12 = -[_DASDaemon capacityFromGroupMax:forPriority:](self, "capacityFromGroupMax:forPriority:", v12, objc_msgSend(v8, "schedulingPriority"));
      }
      v13 = v12 - v26;
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v36 = objc_msgSend(v24, "mutableCopy");
      v29 = v63;
      v28 = v64;
      if (v65 && v13 <= 0)
      {
        v61 = v9;
        v62 = v36;
        v59 = v13;
        v60 = v11;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v58 = v24;
        v37 = v24;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v68;
          do
          {
            v41 = 0;
            do
            {
              if (*(_QWORD *)v68 != v40)
                objc_enumerationMutation(v37);
              v42 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v41);
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "suspendRequestDate"));

              if (!v43)
              {
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "startDate"));
                v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
                v46 = -[_DASDaemon shouldSuspendLongRunningActivity:withStartDate:whileBlockingOtherTasks:atDate:](self, "shouldSuspendLongRunningActivity:withStartDate:whileBlockingOtherTasks:atDate:", v42, v44, 1, v45);

                if (v46)
                {
                  v47 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v73 = v42;
                    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Group full! Found long running activity %{public}@ to suspend", buf, 0xCu);
                  }

                  -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:](self, "updateSuspendRequestDate:forActivity:withReason:", v66, v42, CFSTR("Limitations"));
                  -[_DASDaemon suspendActivity:](self, "suspendActivity:", v42);
                }
                v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fastPass"));
                if (v48)
                {
                  v49 = (void *)v48;
                  v50 = -[_DASDaemon shouldPreemptActivity:forFastPassActivity:](self, "shouldPreemptActivity:forFastPassActivity:", v42, v8);

                  if (v50)
                  {
                    v51 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v73 = v42;
                      v74 = 2114;
                      v75 = (int64_t)v8;
                      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Preempting %{public}@ to unblock the associated fast pass %{public}@", buf, 0x16u);
                    }

                    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
                    -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:](self, "updateSuspendRequestDate:forActivity:withReason:", v52, v42, CFSTR("Preemption"));

                    -[_DASDaemon suspendActivity:](self, "suspendActivity:", v42);
                  }
                }
              }
              v41 = (char *)v41 + 1;
            }
            while (v39 != v41);
            v53 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
            v39 = v53;
          }
          while (v53);
        }

        v54 = objc_msgSend(v8, "schedulingPriority");
        if ((unint64_t)v54 <= _DASSchedulingPriorityDefault)
        {
          v55 = 0;
          v11 = v60;
          v9 = v61;
          v29 = v63;
          v28 = v64;
          v24 = v58;
          v13 = v59;
        }
        else
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon candidateGroupActivityForPreemption:](self, "candidateGroupActivityForPreemption:", v37));
          v11 = v60;
          v9 = v61;
          v29 = v63;
          v28 = v64;
          v13 = v59;
          if (v55)
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suspendRequestDate"));

            v24 = v58;
            if (!v56)
            {
              -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:](self, "updateSuspendRequestDate:forActivity:withReason:", v66, v55, CFSTR("Preemption"));
              -[_DASDaemon suspendActivity:](self, "suspendActivity:", v55);
            }
          }
          else
          {
            v24 = v58;
          }
        }

        v36 = v62;
      }

    }
  }
  else
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (int64_t)currentLoadFromActivities:(id)a3 inGroupWithName:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  void *i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  double v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v5 = a3;
  if ((objc_msgSend(a4, "hasPrefix:", CFSTR("com.apple.dasd")) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v28 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
          objc_msgSend(v14, "timeIntervalSinceDate:", v6);
          v16 = v15;

          if (v16 > 0.0)
          {
            v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle(activityGroup)")));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
              *(_DWORD *)buf = 138412546;
              v34 = v13;
              v35 = 2112;
              v36 = v23;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Adjusting start date for %@ to %@", buf, 0x16u);

            }
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", -300.0));
            objc_msgSend(v13, "setStartDate:", v18);

          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
            objc_msgSend(v6, "timeIntervalSinceDate:", v20);
            v22 = v21;

          }
          else
          {
            v22 = 0.0;
          }

          v11 = v11 + exp(v22 * -0.6931472 / 2700.0);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

    v25 = objc_msgSend(v7, "count");
    v26 = ceil(v11);
    if (v26 > (double)(unint64_t)v25)
      v26 = (double)(unint64_t)v25;
    v24 = (id)(uint64_t)v26;

    v5 = v28;
  }
  else
  {
    v24 = objc_msgSend(v5, "count");
  }

  return (int64_t)v24;
}

- (unint64_t)requestCountForApplication:(id)a3
{
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  id v5;
  void *v6;
  id v7;

  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  v5 = a3;
  os_unfair_recursive_lock_lock_with_options(p_applicationLaunchRequestsLock, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_applicationLaunchRequests, "objectForKeyedSubscript:", v5));

  v7 = objc_msgSend(v6, "count");
  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  return (unint64_t)v7;
}

- (int64_t)capacityFromGroupMax:(int64_t)a3 forPriority:(unint64_t)a4
{
  if (_DASSchedulingPriorityUserInitiatedOvercommit <= a4)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return a3 << (_DASSchedulingPriorityUserInitiated <= a4);
}

- (void)unprotectedEvaluateScoreAndRunActivities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _CDLocalContext *context;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  void *v23;
  double v24;
  double v25;
  unsigned __int8 v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  double v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  unsigned int v41;
  unsigned __int8 v42;
  void *v43;
  double v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  unsigned int v56;
  void *v57;
  _DASDaemon *v58;
  unsigned __int8 v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  if (!objc_msgSend(v4, "count"))
    goto LABEL_49;
  v53 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v59 = +[_DASSystemContext isPluggedIn:](_DASSystemContext, "isPluggedIn:", self->_context);
  context = self->_context;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath](_DASUserRequestedBackupTaskManager, "userRequestedBackupKeyPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v8));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = -[_DASSleepWakeMonitor inADarkWake](self->_sleepWakeMonitor, "inADarkWake");
  IOPMAllowsBackgroundTask(-[_DASSleepWakeMonitor wakeState](self->_sleepWakeMonitor, "wakeState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLowPowerModePolicy policyInstance](_DASLowPowerModePolicy, "policyInstance"));
  v58 = self;
  v56 = objc_msgSend(v12, "isLowPowerModePolicyEnforced:", self->_context);

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v54 = v4;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (!v14)
    goto LABEL_40;
  v15 = v14;
  v16 = *(_QWORD *)v62;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v62 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v17);
      if (v11)
      {
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v17), "darkWakeEligible");
        v20 = v6;
        if ((v19 & 1) != 0)
          goto LABEL_13;
        v21 = objc_msgSend(v18, "triggersRestart");
        v20 = v6;
        if ((v21 & 1) != 0)
          goto LABEL_13;
      }
      else
      {
        if (v10)
        {
          v22 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v17), "userRequestedBackupTask");
          v20 = v6;
          if ((v22 & 1) != 0)
            goto LABEL_13;
        }
        if ((objc_msgSend(v18, "userRequestedBackupTask") & 1) == 0
          && ((v59 & 1) != 0 || (objc_msgSend(v18, "skipEvaluationIfUnplugged") & 1) == 0)
          && -[_DASDaemon activityIsTimewiseEligible:atDate:](v58, "activityIsTimewiseEligible:atDate:", v18, v60))
        {
          if (objc_msgSend(v18, "cancelAfterDeadline"))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startBefore"));
            objc_msgSend(v60, "timeIntervalSinceDate:", v23);
            v25 = v24;

            v20 = v57;
            if (v25 > 0.0)
              goto LABEL_13;
          }
          v26 = objc_msgSend(v18, "bypassesPredictions");
          v20 = v6;
          if ((v26 & 1) != 0)
            goto LABEL_13;
          if (!v56)
            goto LABEL_52;
          v27 = objc_msgSend(v18, "schedulingPriority");
          if ((unint64_t)v27 >= _DASSchedulingPriorityUserInitiated
            || +[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v18))
          {
            goto LABEL_52;
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startBefore"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startAfter"));
          objc_msgSend(v28, "timeIntervalSinceDate:", v29);
          v31 = v30;

          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startAfter"));
          objc_msgSend(v32, "timeIntervalSinceNow");
          v34 = v33;

          v35 = objc_msgSend(v18, "schedulingPriority");
          if ((unint64_t)v35 >= _DASSchedulingPriorityUtility)
          {
            v36 = v31 >= 1.0 ? v31 : 1.0;
            if (-v34 / v36 >= 0.9)
            {
LABEL_52:
              v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remoteDevice"));
              if (!v37
                || (v38 = (void *)v37, v39 = objc_msgSend(v18, "targetDevice"), v38, v39 != (id)3)
                || (v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remoteDevice")),
                    v41 = -[_DASRemoteDeviceNearbyMonitor isRemoteDeviceNearby:](v58->_remoteDeviceNearbyMonitor, "isRemoteDeviceNearby:", v40), v40, v41))
              {
                v42 = objc_msgSend(v18, "hasManyConstraints");
                v20 = v6;
                if ((v42 & 1) != 0)
                  goto LABEL_13;
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startBefore"));
                objc_msgSend(v43, "timeIntervalSinceDate:", v60);
                if (v44 <= 1800.0 || (v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastScored"))) == 0)
                {

                  v20 = v6;
LABEL_13:
                  objc_msgSend(v20, "addObject:", v18);
                  goto LABEL_36;
                }
                v46 = (void *)v45;
                v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastScored"));
                objc_msgSend(v60, "timeIntervalSinceDate:", v55);
                v48 = v47;

                v20 = v6;
                if (v48 >= 300.0)
                  goto LABEL_13;
              }
            }
          }
        }
      }
LABEL_36:
      v17 = (char *)v17 + 1;
    }
    while (v15 != v17);
    v49 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    v15 = v49;
  }
  while (v49);
LABEL_40:

  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.evaluationCount"), objc_msgSend(v6, "count"));
  -[_DASDaemon chooseActivitiesToRunFromCandidateActivities:toBeRunActivities:toLaunchApplications:toLaunchExtension:](v58, "chooseActivitiesToRunFromCandidateActivities:toBeRunActivities:toLaunchApplications:toLaunchExtension:", v6, v50, v52, v51);
  if (objc_msgSend(v50, "count"))
    -[_DASDaemon runActivitiesAndRemoveUnknown:](v58, "runActivitiesAndRemoveUnknown:", v50);
  v5 = v53;
  v4 = v54;
  if (objc_msgSend(v52, "count"))
    -[_DASDaemon runApplicationLaunchActivities:](v58, "runApplicationLaunchActivities:", v52);
  if (objc_msgSend(v51, "count"))
    -[_DASDaemon runExtensionLaunchActivities:](v58, "runExtensionLaunchActivities:", v51);
  if (objc_msgSend(v57, "count"))
    -[_DASDaemon cancelActivities:](v58, "cancelActivities:", v57);

LABEL_49:
  objc_autoreleasePoolPop(v5);

}

- (BOOL)activityIsTimewiseEligible:(id)a3 atDate:(id)a4
{
  return objc_msgSend(a3, "timewiseEligibleAtDate:", a4);
}

- (void)determineNextTimerFireDateAndSchedule
{
  void *v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  unsigned int v13;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  _DASDaemon *v63;
  void *v64;
  double v65;
  unint64_t v66;
  unint64_t v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSMutableSet count](self->_pendingTasks, "count")));
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v4 = self->_pendingTasks;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
  if (!v5)
  {
    v69 = 0;
    goto LABEL_32;
  }
  v6 = v5;
  v69 = 0;
  v7 = *(_QWORD *)v75;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v75 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)v8);
      if ((objc_msgSend(v9, "triggersRestart") & 1) != 0
        || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startBefore")),
            objc_msgSend(v10, "timeIntervalSinceDate:", v3),
            v12 = v11,
            v10,
            v12 > 0.0))
      {
        if (!objc_msgSend(v9, "requiresNetwork")
          || -[_DASNetworkEvaluationMonitor isNetworkPathAvailableForActivity:](self->_networkEvaluationMonitor, "isNetworkPathAvailableForActivity:", v9))
        {
          v13 = +[_DASSystemContext isPluggedIn:](_DASSystemContext, "isPluggedIn:", self->_context);
          if (!objc_msgSend(v9, "requiresPlugin") || v13 != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSmartPowerNapPolicy policyInstance](_DASSmartPowerNapPolicy, "policyInstance"));
            v16 = objc_msgSend(v15, "appliesToActivity:", v9);

            if (v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSmartPowerNapPolicy policyInstance](_DASSmartPowerNapPolicy, "policyInstance"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "responseForActivity:withState:", v9, self->_context));

              if (objc_msgSend(v18, "policyDecision") == (id)33 || objc_msgSend(v18, "policyDecision") == (id)100)
              {
LABEL_21:

                goto LABEL_22;
              }

            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLowPowerModePolicy policyInstance](_DASLowPowerModePolicy, "policyInstance"));
            v20 = objc_msgSend(v19, "appliesToActivity:", v9);

            if (v20)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLowPowerModePolicy policyInstance](_DASLowPowerModePolicy, "policyInstance"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "responseForActivity:withState:", v9, self->_context));

              if (objc_msgSend(v18, "policyDecision") == (id)33 || objc_msgSend(v18, "policyDecision") == (id)100)
                goto LABEL_21;

            }
            objc_msgSend(v68, "addObject:", v9);
            if (v69)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "startBefore"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startBefore"));
              objc_msgSend(v22, "timeIntervalSinceDate:", v23);
              v25 = v24;

              if (v25 >= 0.0)
              {
                v26 = v9;

                v69 = v26;
              }
            }
            else
            {
              v69 = v9;
            }
          }
        }
      }
LABEL_22:
      v8 = (char *)v8 + 1;
    }
    while (v6 != v8);
    v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    v6 = v27;
  }
  while (v27);
LABEL_32:

  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  if (objc_msgSend(v68, "count"))
  {
    v28 = objc_msgSend(v69, "schedulingPriority");
    v29 = _DASSchedulingPriorityUtility;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "startBefore"));
    objc_msgSend(v30, "timeIntervalSinceDate:", v3);
    v32 = v31;

    if (v32 <= 0.0)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "name"));
      -[_DASDaemon scheduleTimerOnBehalfOf:between:and:waking:](self, "scheduleTimerOnBehalfOf:between:and:waking:", v39, (unint64_t)v28 > v29, 600.0, 900.0);
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "startBefore"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "predictedOptimalStartDate"));
      objc_msgSend(v33, "timeIntervalSinceDate:", v34);
      if (v35 >= 90.0)
      {

      }
      else
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "predictedOptimalStartDate"));
        objc_msgSend(v36, "timeIntervalSinceDate:", v3);
        v38 = v37;

        if (v38 > 0.0)
        {
          -[_DASDaemon scheduleTimerForActivity:](self, "scheduleTimerForActivity:", v69);
          goto LABEL_56;
        }
      }
      v67 = (unint64_t)v28;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "predictedOptimalStartDate"));
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v40 = v68;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      v66 = v29;
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(_QWORD *)v71 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "predictedOptimalStartDate", v66));
            v47 = v46;
            if (v46)
            {
              objc_msgSend(v46, "timeIntervalSinceDate:", v3);
              if (v48 >= 0.0)
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "startBefore"));
                objc_msgSend(v47, "timeIntervalSinceDate:", v49);
                v51 = v50;

                if (v51 <= 0.0)
                {
                  objc_msgSend(v47, "timeIntervalSinceDate:", v39);
                  if (v52 > 0.0)
                  {
                    v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "predictedOptimalStartDate"));

                    v39 = (void *)v53;
                  }
                }
              }
            }

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        }
        while (v42);
      }

      objc_msgSend(v39, "timeIntervalSinceDate:", v3);
      v55 = v54;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "startBefore"));
      objc_msgSend(v56, "timeIntervalSinceDate:", v3);
      v58 = v57;

      objc_msgSend(v39, "timeIntervalSinceDate:", v3);
      v60 = v59;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "name"));
      if (v60 >= 0.0)
      {
        v63 = self;
        v64 = v61;
        v65 = v55;
        v62 = v58;
      }
      else
      {
        v62 = v58 + 90.0;
        v63 = self;
        v64 = v61;
        v65 = v58;
      }
      -[_DASDaemon scheduleTimerOnBehalfOf:between:and:waking:](v63, "scheduleTimerOnBehalfOf:between:and:waking:", v64, v67 > v66, v65, v62, v66);

    }
  }
LABEL_56:

}

+ (_DASDaemon)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A67E0;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABD10 != -1)
    dispatch_once(&qword_1001ABD10, block);
  return (_DASDaemon *)(id)qword_1001ABD18;
}

- (void)submitActivity:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v10 = 138412802;
    v11 = v6;
    v12 = 2112;
    v13 = v9;
    v14 = 2048;
    v15 = objc_msgSend(v7, "maxConcurrent");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Submit activity: %@ in group: %@ with capacity: %ld", (uint8_t *)&v10, 0x20u);

  }
  -[_DASDaemon submitActivity:inGroup:withHandler:](self, "submitActivity:inGroup:withHandler:", v6, v7, &stru_10015FD80);

}

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
  -[_DASBARScheduler setMinimumBackgroundFetchInterval:forApp:](self->_barScheduler, "setMinimumBackgroundFetchInterval:forApp:", a4, a3);
}

- (void)createActivityGroup:(id)a3
{
  NSMutableDictionary *groups;
  void *v5;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  os_unfair_lock_lock(&self->_groupLock);
  groups = self->_groups;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groups, "objectForKeyedSubscript:", v5));

  if (!v6 || (v7 = objc_msgSend(v6, "maxConcurrent"), v7 != objc_msgSend(v10, "maxConcurrent")))
  {
    v8 = self->_groups;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, v9);

    -[_DASDataStore saveGroup:](self->_store, "saveGroup:", v10);
  }
  os_unfair_lock_unlock(&self->_groupLock);

}

- (NSMutableDictionary)connectedBGTaskClients
{
  return self->_connectedBGTaskClients;
}

- (id)initAsAnonymous:(BOOL)a3 withContext:(id)a4
{
  _BOOL4 v4;
  id v6;
  _DASDaemon *v7;
  _DASDaemon *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *evaluationQueue;
  uint64_t v13;
  NSMutableArray *clients;
  uint64_t v15;
  NSMutableDictionary *connectedBGTaskClients;
  uint64_t v17;
  NSMutableDictionary *activitiesWaitingForBGTaskClients;
  uint64_t v19;
  NSMutableSet *pendingTasks;
  uint64_t v21;
  NSMutableSet *prerunningTasks;
  uint64_t v23;
  NSMutableSet *runningTasks;
  uint64_t v25;
  NSMutableDictionary *groups;
  uint64_t v27;
  NSMutableDictionary *groupToPendingTasks;
  uint64_t v29;
  NSMutableDictionary *groupToRunningTasks;
  uint64_t v31;
  NSMutableDictionary *groupToPrerunningTasks;
  uint64_t v33;
  NSMutableDictionary *applicationLaunchRequests;
  uint64_t v35;
  NSMutableDictionary *applicationsLaunched;
  uint64_t v37;
  NSMutableDictionary *extensionLaunchRequests;
  uint64_t v39;
  NSMutableDictionary *recentlyLaunchedApps;
  NSUserDefaults *v41;
  NSUserDefaults *testingDefaults;
  uint64_t v43;
  NSMutableDictionary *powerAssertions;
  uint64_t v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  NSMutableSet *signpostActivitiesRunningDeviceActive;
  uint64_t v50;
  NSMutableSet *signpostActivitiesRunningScreenOff;
  uint64_t v52;
  NSCountedSet *launchesPerApp;
  dispatch_queue_global_t global_queue;
  NSObject *v55;
  dispatch_source_t v56;
  OS_dispatch_source *launchTimeResetTimer;
  NSObject *v58;
  dispatch_time_t v59;
  NSObject *v60;
  _DASDaemon *v61;
  OS_dispatch_queue *v62;
  _DASDaemon *v63;
  uint64_t v64;
  _DASBatchingQueue *triggerBatchingQueue;
  uint64_t v66;
  _DASBatchingQueue *triggerRecorderBatchingQueue;
  OS_dispatch_queue *v68;
  _DASDaemon *v69;
  uint64_t v70;
  _DASBatchingQueue *activityCompletedBatchingQueue;
  OS_dispatch_queue *v72;
  _DASDaemon *v73;
  uint64_t v74;
  _DASBatchingQueue *networkActivitiesQueue;
  _CDLocalContext *v76;
  _CDLocalContext *context;
  NSObject *v78;
  uint64_t v79;
  _DASUserRequestedBackupTaskManager *backupTaskManager;
  uint64_t v81;
  _DASNetworkEvaluationMonitor *networkEvaluationMonitor;
  uint64_t v83;
  _DASSleepWakeMonitor *sleepWakeMonitor;
  void *v85;
  uint64_t v86;
  NSMutableDictionary *triggerToActivitiesMap;
  uint64_t v88;
  NSMutableDictionary *activityToIncompatibleActivitiesMap;
  dispatch_queue_attr_t v90;
  NSObject *v91;
  dispatch_queue_t v92;
  OS_dispatch_queue *timerSchedulingQueue;
  uint64_t v94;
  NSDate *timerEarliestFireDate;
  uint64_t v96;
  NSDate *timerLatestFireDate;
  uint64_t v98;
  _DASTrialManager *trialManager;
  id v100;
  unsigned __int8 v101;
  _DASControlEngine *v102;
  _DASControlEngine *controlEnginge;
  id *v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  id v113;
  dispatch_queue_attr_t v114;
  NSObject *v115;
  dispatch_queue_t v116;
  id v117;
  _CDLocalContext *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  id v132;
  _DASFairScheduleManager *v133;
  id v134;
  void *v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  id v143;
  void *v144;
  _BOOL4 v146;
  id v147;
  _QWORD v148[4];
  id *v149;
  _QWORD v150[4];
  _DASDaemon *v151;
  _QWORD v152[4];
  _DASDaemon *v153;
  _QWORD v154[4];
  _DASDaemon *v155;
  _QWORD handler[4];
  _DASDaemon *v157;
  uint8_t buf[8];
  objc_super v159;

  v4 = a3;
  v6 = a4;
  v159.receiver = self;
  v159.super_class = (Class)_DASDaemon;
  v7 = -[_DASDaemon init](&v159, "init");
  v8 = v7;
  if (v7)
  {
    v146 = v4;
    -[_DASDaemon setupPrewarmSuspendListener](v7, "setupPrewarmSuspendListener");
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.dasscheduler.batchingqueue.taskevaluation", v10);
    evaluationQueue = v8->_evaluationQueue;
    v8->_evaluationQueue = (OS_dispatch_queue *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    clients = v8->_clients;
    v8->_clients = (NSMutableArray *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    connectedBGTaskClients = v8->_connectedBGTaskClients;
    v8->_connectedBGTaskClients = (NSMutableDictionary *)v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    activitiesWaitingForBGTaskClients = v8->_activitiesWaitingForBGTaskClients;
    v8->_activitiesWaitingForBGTaskClients = (NSMutableDictionary *)v17;

    v8->_activityStateLock = 0;
    v19 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    pendingTasks = v8->_pendingTasks;
    v8->_pendingTasks = (NSMutableSet *)v19;

    v21 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    prerunningTasks = v8->_prerunningTasks;
    v8->_prerunningTasks = (NSMutableSet *)v21;

    v23 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    runningTasks = v8->_runningTasks;
    v8->_runningTasks = (NSMutableSet *)v23;

    v8->_recomEngineDisabled = 0;
    v8->_groupLock._os_unfair_lock_opaque = 0;
    v25 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    groups = v8->_groups;
    v8->_groups = (NSMutableDictionary *)v25;

    v27 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    groupToPendingTasks = v8->_groupToPendingTasks;
    v8->_groupToPendingTasks = (NSMutableDictionary *)v27;

    v29 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    groupToRunningTasks = v8->_groupToRunningTasks;
    v8->_groupToRunningTasks = (NSMutableDictionary *)v29;

    v31 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    groupToPrerunningTasks = v8->_groupToPrerunningTasks;
    v8->_groupToPrerunningTasks = (NSMutableDictionary *)v31;

    v8->_applicationLaunchRequestsLock = 0;
    v33 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    applicationLaunchRequests = v8->_applicationLaunchRequests;
    v8->_applicationLaunchRequests = (NSMutableDictionary *)v33;

    v35 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    applicationsLaunched = v8->_applicationsLaunched;
    v8->_applicationsLaunched = (NSMutableDictionary *)v35;

    v37 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    extensionLaunchRequests = v8->_extensionLaunchRequests;
    v8->_extensionLaunchRequests = (NSMutableDictionary *)v37;

    v39 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    recentlyLaunchedApps = v8->_recentlyLaunchedApps;
    v8->_recentlyLaunchedApps = (NSMutableDictionary *)v39;

    v41 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.testingDefaults"));
    testingDefaults = v8->_testingDefaults;
    v8->_testingDefaults = v41;

    v43 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    powerAssertions = v8->_powerAssertions;
    v8->_powerAssertions = (NSMutableDictionary *)v43;

    -[_DASDaemon loadTestingDefaults](v8, "loadTestingDefaults");
    v147 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    v45 = (uint64_t)objc_msgSend(v147, "integerForKey:", CFSTR("enRelaunchInterval"));
    if (v45 >= 1 && *(double *)&qword_1001AAAB8 > (double)v45)
      *(double *)&qword_1001AAAB8 = (double)((unint64_t)v45 >> 2);
    if ((_set_user_dir_suffix("com.apple.dasd") & 1) == 0)
    {
      v46 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Unable to set temporary file directory", buf, 2u);
      }

    }
    v47 = NSTemporaryDirectory();
    v8->_signpostLock._os_unfair_lock_opaque = 0;
    v48 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    signpostActivitiesRunningDeviceActive = v8->_signpostActivitiesRunningDeviceActive;
    v8->_signpostActivitiesRunningDeviceActive = (NSMutableSet *)v48;

    v50 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    signpostActivitiesRunningScreenOff = v8->_signpostActivitiesRunningScreenOff;
    v8->_signpostActivitiesRunningScreenOff = (NSMutableSet *)v50;

    v52 = objc_claimAutoreleasedReturnValue(+[NSCountedSet set](NSCountedSet, "set"));
    launchesPerApp = v8->_launchesPerApp;
    v8->_launchesPerApp = (NSCountedSet *)v52;

    global_queue = dispatch_get_global_queue(-32768, 0);
    v55 = objc_claimAutoreleasedReturnValue(global_queue);
    v56 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v55);
    launchTimeResetTimer = v8->_launchTimeResetTimer;
    v8->_launchTimeResetTimer = (OS_dispatch_source *)v56;

    v58 = v8->_launchTimeResetTimer;
    v59 = dispatch_walltime(0, 3600000000000);
    dispatch_source_set_timer(v58, v59, 0x34630B8A000uLL, 0xDF8475800uLL);
    dispatch_set_qos_class_fallback(v8->_launchTimeResetTimer, 9);
    v60 = v8->_launchTimeResetTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000A7304;
    handler[3] = &unk_10015D4E0;
    v61 = v8;
    v157 = v61;
    dispatch_source_set_event_handler(v60, handler);
    dispatch_resume((dispatch_object_t)v8->_launchTimeResetTimer);
    v62 = v8->_evaluationQueue;
    v154[0] = _NSConcreteStackBlock;
    v154[1] = 3221225472;
    v154[2] = sub_1000A7374;
    v154[3] = &unk_10015EC30;
    v63 = v61;
    v155 = v63;
    v64 = objc_claimAutoreleasedReturnValue(+[_DASBatchingQueue queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:](_DASBatchingQueue, "queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:", CFSTR("com.apple.dasscheduler.triggerbatchingqueue"), 10, v62, v154, 2.0));
    triggerBatchingQueue = v63->_triggerBatchingQueue;
    v63->_triggerBatchingQueue = (_DASBatchingQueue *)v64;

    v66 = objc_claimAutoreleasedReturnValue(+[_DASBatchingQueue queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:](_DASBatchingQueue, "queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:", CFSTR("com.apple.dasscheduler.triggerRecorder"), 30, v8->_evaluationQueue, &stru_10015FA50, 5.0));
    triggerRecorderBatchingQueue = v63->_triggerRecorderBatchingQueue;
    v63->_triggerRecorderBatchingQueue = (_DASBatchingQueue *)v66;

    v68 = v8->_evaluationQueue;
    v152[0] = _NSConcreteStackBlock;
    v152[1] = 3221225472;
    v152[2] = sub_1000A73D0;
    v152[3] = &unk_10015EC30;
    v69 = v63;
    v153 = v69;
    v70 = objc_claimAutoreleasedReturnValue(+[_DASBatchingQueue queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:](_DASBatchingQueue, "queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:", CFSTR("com.apple.dasscheduler.activitycompletionbatchingqueue"), 15, v68, v152, 15.0));
    activityCompletedBatchingQueue = v69->_activityCompletedBatchingQueue;
    v69->_activityCompletedBatchingQueue = (_DASBatchingQueue *)v70;

    v72 = v8->_evaluationQueue;
    v150[0] = _NSConcreteStackBlock;
    v150[1] = 3221225472;
    v150[2] = sub_1000A73DC;
    v150[3] = &unk_10015EC30;
    v73 = v69;
    v151 = v73;
    v74 = objc_claimAutoreleasedReturnValue(+[_DASBatchingQueue queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:](_DASBatchingQueue, "queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:", CFSTR("com.apple.das.networkActivitiesQueue"), 256, v72, v150, 1.0));
    networkActivitiesQueue = v73->_networkActivitiesQueue;
    v73->_networkActivitiesQueue = (_DASBatchingQueue *)v74;

    if (v6)
      v76 = (_CDLocalContext *)v6;
    else
      v76 = (_CDLocalContext *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    context = v73->_context;
    v73->_context = v76;

    v78 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Initializing DASDaemon...", buf, 2u);
    }

    v79 = objc_claimAutoreleasedReturnValue(+[_DASUserRequestedBackupTaskManager managerWithContext:](_DASUserRequestedBackupTaskManager, "managerWithContext:", v73->_context));
    backupTaskManager = v73->_backupTaskManager;
    v73->_backupTaskManager = (_DASUserRequestedBackupTaskManager *)v79;

    v81 = objc_claimAutoreleasedReturnValue(+[_DASNetworkEvaluationMonitor sharedInstance](_DASNetworkEvaluationMonitor, "sharedInstance"));
    networkEvaluationMonitor = v73->_networkEvaluationMonitor;
    v73->_networkEvaluationMonitor = (_DASNetworkEvaluationMonitor *)v81;

    v83 = objc_claimAutoreleasedReturnValue(+[_DASSleepWakeMonitor sharedMonitorWithDaemon:](_DASSleepWakeMonitor, "sharedMonitorWithDaemon:", v73));
    sleepWakeMonitor = v73->_sleepWakeMonitor;
    v73->_sleepWakeMonitor = (_DASSleepWakeMonitor *)v83;

    -[_DASDaemon registerForNetworkPathEvaluation](v73, "registerForNetworkPathEvaluation");
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
    -[_DASDaemon registerTriggersWithContextStoreForPolicies:](v73, "registerTriggersWithContextStoreForPolicies:", v85);
    v86 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    triggerToActivitiesMap = v73->_triggerToActivitiesMap;
    v73->_triggerToActivitiesMap = (NSMutableDictionary *)v86;

    v88 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    activityToIncompatibleActivitiesMap = v73->_activityToIncompatibleActivitiesMap;
    v73->_activityToIncompatibleActivitiesMap = (NSMutableDictionary *)v88;

    v90 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v91 = objc_claimAutoreleasedReturnValue(v90);
    v92 = dispatch_queue_create("com.apple.duetactivityscheduler.timeschedulingqueue", v91);
    timerSchedulingQueue = v73->_timerSchedulingQueue;
    v73->_timerSchedulingQueue = (OS_dispatch_queue *)v92;

    v94 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    timerEarliestFireDate = v73->_timerEarliestFireDate;
    v73->_timerEarliestFireDate = (NSDate *)v94;

    v96 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    timerLatestFireDate = v73->_timerLatestFireDate;
    v73->_timerLatestFireDate = (NSDate *)v96;

    v98 = objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
    trialManager = v73->_trialManager;
    v73->_trialManager = (_DASTrialManager *)v98;

    -[_DASTrialManager addDelegate:](v73->_trialManager, "addDelegate:", v73);
    v100 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    v101 = objc_msgSend(v100, "BOOLForKey:", CFSTR("clasDisabled"));

    if ((v101 & 1) == 0)
    {
      v102 = objc_opt_new(_DASControlEngine);
      controlEnginge = v73->_controlEnginge;
      v73->_controlEnginge = v102;

    }
    v148[0] = _NSConcreteStackBlock;
    v148[1] = 3221225472;
    v148[2] = sub_1000A74C4;
    v148[3] = &unk_10015D4E0;
    v104 = v73;
    v149 = v104;
    v105 = objc_claimAutoreleasedReturnValue(+[_DASTimer timerWithCallback:](_DASTimer, "timerWithCallback:", v148));
    v106 = v104[24];
    v104[24] = (id)v105;

    objc_msgSend(v104, "setupTimers");
    v107 = objc_claimAutoreleasedReturnValue(+[_DASCoreDataStore storageWithDirectory:readOnly:](_DASCoreDataStore, "storageWithDirectory:readOnly:", CFSTR("/var/mobile/Library/DuetActivityScheduler"), 0));
    v108 = v104[37];
    v104[37] = (id)v107;

    if (v146)
    {
      v109 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
    }
    else
    {
      v110 = objc_alloc((Class)NSXPCListener);
      v109 = objc_msgSend(v110, "initWithMachServiceName:", _DASDaemonServiceName);
    }
    v111 = v104[21];
    v104[21] = v109;

    objc_msgSend(v104[21], "setDelegate:", v104);
    v112 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
    v113 = v104[22];
    v104[22] = (id)v112;

    objc_msgSend(v104[22], "setDelegate:", v104);
    +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.startup"), 1);
    v114 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v115 = objc_claimAutoreleasedReturnValue(v114);
    v116 = dispatch_queue_create("com.apple.duetactivityscheduler.backgroundLaunchQueue", v115);
    v117 = v104[55];
    v104[55] = v116;

    v118 = v73->_context;
    v119 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosIsBlocked](_DASPhotosPolicy, "keyPathForPhotosIsBlocked"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v118, "objectForKeyedSubscript:", v119));

    if (v120)
      v104[64] = objc_msgSend(v120, "unsignedIntegerValue");
    else
      objc_msgSend(v104, "updateiCPLTasksBlocked:", 0);
    *((_DWORD *)v104 + 4) = 0;
    v121 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/das/utilityConstraints")));
    v122 = v104[65];
    v104[65] = (id)v121;

    v123 = objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/das/maintenanceConstraints")));
    v124 = v104[66];
    v104[66] = (id)v123;

    v125 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v73->_context, "objectForKeyedSubscript:", v104[65]));
    v126 = v125;
    if (v125)
      v104[67] = objc_msgSend(v125, "unsignedIntegerValue");
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v73->_context, "objectForKeyedSubscript:", v104[66]));
    v128 = v127;
    if (v127)
      v104[68] = objc_msgSend(v127, "unsignedIntegerValue");
    v129 = objc_claimAutoreleasedReturnValue(+[_DASBudgetManager sharedInstance](_DASBudgetManager, "sharedInstance"));
    v130 = v104[62];
    v104[62] = (id)v129;

    v131 = objc_claimAutoreleasedReturnValue(+[_DASActivityDependencyManager sharedInstance](_DASActivityDependencyManager, "sharedInstance"));
    v132 = v104[63];
    v104[63] = (id)v131;

    v133 = objc_opt_new(_DASFairScheduleManager);
    v134 = v104[46];
    v104[46] = v133;

    v135 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBatteryTemperatureRecorder sharedInstance](_DASBatteryTemperatureRecorder, "sharedInstance"));
    v136 = objc_claimAutoreleasedReturnValue(+[_DASDock dockManager](_DASDock, "dockManager"));
    v137 = v104[86];
    v104[86] = (id)v136;

    v138 = objc_claimAutoreleasedReturnValue(+[_DASBackgroundAppKillDemo sharedInstance](_DASBackgroundAppKillDemo, "sharedInstance"));
    v139 = v104[77];
    v104[77] = (id)v138;

    v140 = objc_claimAutoreleasedReturnValue(+[_DASNotificationManager sharedManager](_DASNotificationManager, "sharedManager"));
    v141 = v104[82];
    v104[82] = (id)v140;

    v142 = objc_claimAutoreleasedReturnValue(+[_DASFeatureDurationTracker sharedInstance](_DASFeatureDurationTracker, "sharedInstance"));
    v143 = v104[51];
    v104[51] = (id)v142;

    v144 = (void *)objc_claimAutoreleasedReturnValue(+[_DASIssueDetector sharedInstance](_DASIssueDetector, "sharedInstance"));
    objc_msgSend(v144, "schedule");

  }
  return v8;
}

- (void)solicitActivityResubmission
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Soliciting activities for resubmission.", v3, 2u);
  }

  notify_post((const char *)objc_msgSend(CFSTR("com.appple.duet.activityscheduler.requestActivityResubmission"), "UTF8String"));
}

- (void)registerForTrial
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  objc_msgSend(v3, "addDelegate:", self);

}

- (void)updateTrialParameters
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _DWORD v13[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("APRS_Disabled")));
  v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v13[0] = 67109120;
      v13[1] = objc_msgSend(v3, "BOOLeanValue");
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trial: recomEngineDisabled set to %d", (uint8_t *)v13, 8u);
    }

    self->_recomEngineDisabled = objc_msgSend(v3, "BOOLeanValue");
  }
  else
  {
    if (v5)
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load recomEngineDisabled", (uint8_t *)v13, 2u);
    }

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("Sched_MaxAllowableDurationSeconds")));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "doubleValue");
  v8 = qword_1001AAAC0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("Sched_DefaultGroupMax")));

  if (v9)
    qword_1001AAAC0 = (uint64_t)objc_msgSend(v9, "longValue");
  v10 = qword_1001AAAC8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", CFSTR("Sched_NetworkDefaultGroupMax")));

  if (v11)
  {
    v12 = objc_msgSend(v11, "longValue");
    qword_1001AAAC8 = (uint64_t)v12;
  }
  else
  {
    v12 = (id)qword_1001AAAC8;
  }
  if (qword_1001AAAC0 != v8 || v12 != (id)v10)
    -[_DASDaemon createDefaultActivityGroups](self, "createDefaultActivityGroups");

}

- (void)createAssertion:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  IOReturn v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  IOPMAssertionID AssertionID;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  _BYTE v36[10];

  v4 = a3;
  if (_os_feature_enabled_impl("DAS", "activity_prevent_sleep"))
  {
    if ((objc_msgSend(v4, "requestsApplicationLaunch") & 1) == 0)
    {
      v5 = +[_DASSystemContext isPluggedIn:](_DASSystemContext, "isPluggedIn:", self->_context);
      if ((v5 & 1) != 0 || objc_msgSend(v4, "preventDeviceSleep"))
      {
        v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
          *(_DWORD *)buf = 138412802;
          v34 = v7;
          v35 = 1024;
          *(_DWORD *)v36 = objc_msgSend(v4, "preventDeviceSleep");
          *(_WORD *)&v36[4] = 1024;
          *(_DWORD *)&v36[6] = v5;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Activity %@ has preventDeviceSleep %d. PluggedIn state: %d", buf, 0x18u);

        }
        if (objc_msgSend(v4, "preventDeviceSleep"))
          v8 = CFSTR("-ClientRequested");
        else
          v8 = &stru_1001617C8;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DASActivity%@:%@"), v8, v9));

        v11 = objc_alloc((Class)NSMutableDictionary);
        v31[0] = CFSTR("AssertType");
        v31[1] = CFSTR("AssertName");
        v32[0] = CFSTR("PreventUserIdleSystemSleep");
        v32[1] = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
        v13 = objc_msgSend(v11, "initWithDictionary:", v12);

        if (objc_msgSend(v4, "pid"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "pid")));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("AssertionOnBehalfOfPID"));

        }
        objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("AllowsDeviceRestart"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
        objc_sync_enter(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));

        if (v18)
        {
          v19 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v22));
            *(_DWORD *)buf = 138412546;
            v34 = v20;
            v35 = 2112;
            *(_QWORD *)v36 = v23;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Assertion already exists for UUID %@ %@", buf, 0x16u);

          }
          goto LABEL_23;
        }
        AssertionID = 0;
        v24 = IOPMAssertionCreateWithProperties((CFDictionaryRef)v13, &AssertionID);
        if (v24)
        {
          v25 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v34) = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to create an assertion 0x%x", buf, 8u);
          }
        }
        else
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", AssertionID));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

          if (!objc_msgSend(v4, "preventDeviceSleep"))
          {
LABEL_23:
            objc_sync_exit(v15);

            goto LABEL_24;
          }
          v25 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
            *(_DWORD *)buf = 138412546;
            v34 = v29;
            v35 = 1024;
            *(_DWORD *)v36 = AssertionID;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Creating assertion for  %@ %u", buf, 0x12u);

          }
        }

        goto LABEL_23;
      }
    }
  }
LABEL_24:

}

- (void)releaseAssertions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IOPMAssertionID v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  IOPMAssertionID v27;
  _BYTE v28[128];

  v4 = a3;
  if (_os_feature_enabled_impl("DAS", "activity_prevent_sleep"))
  {
    v18 = v4;
    obj = (id)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
    objc_sync_enter(obj);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

          if (v12)
          {
            v13 = objc_msgSend(v12, "unsignedIntValue");
            v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
              *(_DWORD *)buf = 138412546;
              v25 = v15;
              v26 = 1024;
              v27 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Releasing assertion for %@ %u", buf, 0x12u);

            }
            IOPMAssertionRelease(v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
            objc_msgSend(v16, "removeObjectForKey:", v17);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v6);
    }

    objc_sync_exit(obj);
    v4 = v18;
  }

}

- (void)evaluateAssertions
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];
  _BYTE v26[128];

  if (_os_feature_enabled_impl("DAS", "activity_prevent_sleep")
    && (+[_DASSystemContext isPluggedIn:](_DASSystemContext, "isPluggedIn:", self->_context) & 1) == 0)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Evaluating assertions on pluggedIn state change", buf, 2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
    objc_sync_enter(v5);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon getActivityRunningWithUUID:](self, "getActivityRunningWithUUID:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v9)));
          v11 = v10;
          if (v10 && (objc_msgSend(v10, "preventDeviceSleep") & 1) == 0)
            objc_msgSend(v4, "addObject:", v11);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v7);
    }

    objc_sync_exit(v5);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v12);
          -[_DASDaemon releaseAssertion:](self, "releaseAssertion:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), (_QWORD)v16);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
      }
      while (v13);
    }

  }
}

- (void)setupTimers
{
  OS_dispatch_source *v3;
  OS_dispatch_source *optimalScoringTimer;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *groupMonitoringQueue;
  OS_dispatch_source *v10;
  OS_dispatch_source *groupMonitoringTimer;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD handler[5];

  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_evaluationQueue);
  optimalScoringTimer = self->_optimalScoringTimer;
  self->_optimalScoringTimer = v3;

  dispatch_set_qos_class_fallback(self->_optimalScoringTimer, 17);
  v5 = self->_optimalScoringTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000A8360;
  handler[3] = &unk_10015D4E0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  v6 = self->_optimalScoringTimer;
  v7 = dispatch_walltime(0, 21600000000000);
  dispatch_source_set_timer(v6, v7, 0x13A52453C000uLL, 0x34630B8A000uLL);
  dispatch_resume((dispatch_object_t)self->_optimalScoringTimer);
  -[_DASDaemon setupDatabaseMaintenance](self, "setupDatabaseMaintenance");
  v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.dasd.groupsqueue", 0);
  groupMonitoringQueue = self->_groupMonitoringQueue;
  self->_groupMonitoringQueue = v8;

  v10 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_groupMonitoringQueue);
  groupMonitoringTimer = self->_groupMonitoringTimer;
  self->_groupMonitoringTimer = v10;

  dispatch_set_qos_class_fallback(self->_groupMonitoringTimer, 17);
  v12 = self->_groupMonitoringTimer;
  v13 = dispatch_walltime(0, 180000000000);
  dispatch_source_set_timer(v12, v13, 0x29E8D60800uLL, 0x3B9ACA00uLL);
  v14 = self->_groupMonitoringTimer;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A8368;
  v15[3] = &unk_10015D4E0;
  v15[4] = self;
  dispatch_source_set_event_handler(v14, v15);
  dispatch_activate((dispatch_object_t)self->_groupMonitoringTimer);
}

- (void)scheduleTimerForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  id v13;

  v4 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "predictedOptimalStartDate"));
  objc_msgSend(v6, "timeIntervalSinceDate:", v13);
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startBefore"));
  objc_msgSend(v9, "timeIntervalSinceDate:", v13);
  v11 = v10;
  v12 = objc_msgSend(v4, "schedulingPriority");

  -[_DASDaemon scheduleTimerOnBehalfOf:between:and:waking:](self, "scheduleTimerOnBehalfOf:between:and:waking:", v5, (unint64_t)v12 > _DASSchedulingPriorityUtility, v8, v11);
}

- (void)setupDatabaseMaintenance
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *databaseMaintenanceTimer;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD handler[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  databaseMaintenanceTimer = self->_databaseMaintenanceTimer;
  self->_databaseMaintenanceTimer = v5;

  dispatch_set_qos_class_fallback(self->_databaseMaintenanceTimer, 5);
  v7 = self->_databaseMaintenanceTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000A89B4;
  handler[3] = &unk_10015D4E0;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  v8 = self->_databaseMaintenanceTimer;
  v9 = dispatch_walltime(0, 86400000000000);
  dispatch_source_set_timer(v8, v9, 0x4E94914F0000uLL, 0x4E94914F0000uLL);
  dispatch_resume((dispatch_object_t)self->_databaseMaintenanceTimer);

}

- (void)removeDuplicateLaunchTasks:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  id obj;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unsigned __int8 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v3;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v44;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v44 != v29)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v5);
        if ((objc_msgSend(v6, "isBackgroundTaskActivity") & 1) != 0)
          v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientProvidedIdentifier"));
        else
          v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
        v32 = (void *)v7;
        v33 = v5;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v7));
        if (!v8)
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v40 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v6, "isBackgroundTaskActivity"))
              {
                if (objc_msgSend(v14, "isBackgroundTaskActivity"))
                {
                  v38 = 0;
                  if (objc_msgSend(v6, "shouldReplaceActivity:andKeepsSubmitted:", v14, &v38))
                  {
                    v15 = v38;
                    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "submitDate"));
                    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "submitDate"));
                    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
                    if (v15)
                      v19 = -v18;
                    else
                      v19 = v18;

                    if (v19 <= 0.0)
                      v20 = v6;
                    else
                      v20 = v14;
                    objc_msgSend(v4, "addObject:", v20);
                  }
                }
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          }
          while (v11);
        }

        v5 = v33 + 1;
      }
      while ((id)(v33 + 1) != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v31);
  }

  objc_msgSend(obj, "minusSet:", v4);
  v21 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("persistence")));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    sub_1000E9998();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v4;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        -[_DASDataStore deleteActivity:](self->_store, "deleteActivity:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v24);
  }

}

- (void)loadState
{
  _DASDataProtectionStateMonitor *v3;
  void *v4;
  unsigned __int8 v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[7];
  uint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = objc_alloc_init(_DASDataProtectionStateMonitor);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9 = 0;
  v10 = (os_unfair_lock_s *)&v9;
  v11 = 0x2810000000;
  v12 = &unk_10014130A;
  v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A8EFC;
  v8[3] = &unk_10015FAA0;
  v8[5] = &v9;
  v8[6] = &v14;
  v8[4] = self;
  -[_DASDataProtectionStateMonitor setChangeHandler:](v3, "setChangeHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
  v5 = -[_DASDataProtectionStateMonitor isDataAvailableFor:](v3, "isDataAvailableFor:", v4);

  if ((v5 & 1) != 0)
  {
    os_unfair_lock_lock(v10 + 8);
    if (!*((_BYTE *)v15 + 24))
    {
      -[_DASDaemon loadStateWhenAvailable](self, "loadStateWhenAvailable");
      *((_BYTE *)v15 + 24) = 1;
    }
    os_unfair_lock_unlock(v10 + 8);
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Class C not yet available. Not loading activities", v7, 2u);
    }

  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v14, 8);

}

- (void)loadStateWhenAvailable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSMutableDictionary *groups;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];

  v3 = (void *)os_transaction_create("com.apple.dasd.loadState");
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Loading saved activities.", buf, 2u);
  }

  -[_DASDataStore deleteActivitiesIfRequired](self->_store, "deleteActivitiesIfRequired");
  -[_DASDataStore loadPendingLaunchTasks:](self->_store, "loadPendingLaunchTasks:", v5);
  -[_DASDataStore loadAllGroups:](self->_store, "loadAllGroups:", v6);
  -[_DASDaemon removeDuplicateLaunchTasks:](self, "removeDuplicateLaunchTasks:", v5);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (!v9)
  {

LABEL_20:
    -[_DASDaemon createDefaultActivityGroups](self, "createDefaultActivityGroups");
    goto LABEL_21;
  }
  v10 = v9;
  v25 = v5;
  v26 = v4;
  v27 = v3;
  v28 = 0;
  v29 = 0;
  v11 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v31 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
      v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory", v25, v26, v27));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
        v16 = objc_msgSend(v13, "maxConcurrent");
        *(_DWORD *)buf = 138412546;
        v35 = v15;
        v36 = 2048;
        v37 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Loading group %@ (capacity=%lld).", buf, 0x16u);

      }
      os_unfair_lock_lock(&self->_groupLock);
      groups = self->_groups;
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](groups, "setObject:forKeyedSubscript:", v13, v18);

      os_unfair_lock_unlock(&self->_groupLock);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      LOBYTE(v18) = objc_msgSend(v19, "isEqualToString:", _DASDefaultNetworkGroupName);

      if ((v18 & 1) != 0)
      {
        LODWORD(v29) = 1;
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
        v21 = objc_msgSend(v20, "isEqualToString:", _DASDefaultGroupName);

        if ((v21 & 1) != 0)
        {
          v28 = 1;
        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
          v23 = objc_msgSend(v22, "isEqualToString:", _DASDefaultRemoteGroupName);

          HIDWORD(v29) |= v23;
        }
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  }
  while (v10);

  v4 = v26;
  v3 = v27;
  v5 = v25;
  if ((v29 & v28 & HIDWORD(v29) & 1) == 0)
    goto LABEL_20;
LABEL_21:
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  -[_DASDaemon submitActivities:](self, "submitActivities:", v24);

  objc_autoreleasePoolPop(v4);
}

- (void)loadTestingDefaults
{
  NSDictionary *v3;
  NSDictionary *testModeParameters;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  double v9;
  NSDictionary *v10;
  NSObject *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSDictionary *pausedParameters;
  NSObject *v15;
  NSDictionary *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 taskRegistryMode;
  NSSet *v20;
  NSSet *taskRegistryProcesses;
  NSObject *v22;
  NSSet *v23;
  int v24;
  void *v25;

  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_testingDefaults, "objectForKey:", CFSTR("testModeParameters")));
  testModeParameters = self->_testModeParameters;
  self->_testModeParameters = v3;

  v5 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_testingDefaults, "objectForKey:", CFSTR("testModeLastUpdated")));
  v6 = (void *)v5;
  if (self->_testModeParameters)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v8, "timeIntervalSinceDate:", v6);
    if (v9 > 86400.0)
    {
      v10 = self->_testModeParameters;
      self->_testModeParameters = 0;

      -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", 0, CFSTR("testModeParameters"));
    }
    v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_testModeParameters;
      v24 = 138412290;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Test mode parameters: %@", (uint8_t *)&v24, 0xCu);
    }

  }
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_testingDefaults, "objectForKey:", CFSTR("pausedParameters")));
  pausedParameters = self->_pausedParameters;
  self->_pausedParameters = v13;

  if (self->_pausedParameters)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_pausedParameters;
      v24 = 138412290;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Paused parameters: %@", (uint8_t *)&v24, 0xCu);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_testingDefaults, "objectForKey:", CFSTR("taskRegistryMode")));
  self->_taskRegistryMode = v17 != 0;

  if (self->_taskRegistryMode)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      taskRegistryMode = self->_taskRegistryMode;
      v24 = 67109120;
      LODWORD(v25) = taskRegistryMode;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Task Registry Mode: %i", (uint8_t *)&v24, 8u);
    }

  }
  v20 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_testingDefaults, "objectForKey:", CFSTR("taskRegistryProcesses")));
  taskRegistryProcesses = self->_taskRegistryProcesses;
  self->_taskRegistryProcesses = v20;

  if (self->_taskRegistryProcesses)
  {
    v22 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_taskRegistryProcesses;
      v24 = 138412290;
      v25 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Task Registry Processes: %@", (uint8_t *)&v24, 0xCu);
    }

  }
}

- (void)cancelLaunchesOfTypes:(id)a3 forApps:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  unsigned int v18;
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  id obj;
  uint64_t v21;
  _DASDaemon *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v22 = self;
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v7;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v22->_applicationLaunchRequests, "objectForKeyedSubscript:", v10));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
              if ((objc_msgSend(v16, "isContactTracingBackgroundActivity") & 1) == 0)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "launchReason"));
                v18 = objc_msgSend(v6, "containsObject:", v17);

                if (v18)
                  objc_msgSend(v8, "addObject:", v16);
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v13);
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  -[_DASDaemon cancelActivities:](v22, "cancelActivities:", v8);

}

- (void)cancelPushLaunchTasksForApps:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = _DASLaunchReasonBackgroundRemoteNotification;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  -[_DASDaemon cancelLaunchesOfTypes:forApps:](self, "cancelLaunchesOfTypes:forApps:", v6, v5);

}

- (void)cancelAppRefreshTasksForApps:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = _DASLaunchReasonBackgroundRefresh;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  -[_DASDaemon cancelLaunchesOfTypes:forApps:](self, "cancelLaunchesOfTypes:forApps:", v6, v5);

}

- (void)cancelBackgroundTasksForApps:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = _DASLaunchReasonBackgroundRefresh;
  v5 = _DASLaunchReasonBackgroundProcessing;
  v6 = _DASLaunchReasonHealthResearch;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, 0));
  -[_DASDaemon cancelLaunchesOfTypes:forApps:](self, "cancelLaunchesOfTypes:forApps:", v8, v7);

}

- (void)cancelContactTracingTasksForApps:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_applicationLaunchRequests, "objectForKeyedSubscript:", v10, p_applicationLaunchRequestsLock));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v16, "isContactTracingBackgroundActivity"))
                objc_msgSend(v5, "addObject:", v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  -[_DASDaemon cancelActivities:](self, "cancelActivities:", v5);

}

- (void)cancelAllBackgroundTasks
{
  void *v3;
  NSMutableDictionary *applicationLaunchRequests;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
  applicationLaunchRequests = self->_applicationLaunchRequests;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A9CD8;
  v6[3] = &unk_10015FAC8;
  v7 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](applicationLaunchRequests, "enumerateKeysAndObjectsUsingBlock:", v6);

  os_unfair_recursive_lock_unlock(&self->_applicationLaunchRequestsLock);
  -[_DASDaemon cancelActivities:](self, "cancelActivities:", v5);

}

- (void)delayLaunchesOfType:(id)a3 forApps:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  os_unfair_recursive_lock_s *v31;
  uint64_t v32;
  _DASDaemon *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v33 = self;
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  v10 = (void *)v8;
  v31 = p_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(p_applicationLaunchRequestsLock, 0);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v7;
  v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v34)
  {
    v32 = *(_QWORD *)v44;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(v11);
        v35 = v12;
        v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v33->_applicationLaunchRequests, "objectForKeyedSubscript:", v13, v31));
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v38 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v38)
        {
          v15 = *(_QWORD *)v40;
          v36 = v14;
          v37 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v38; i = (char *)i + 1)
            {
              if (*(_QWORD *)v40 != v15)
                objc_enumerationMutation(v14);
              v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "launchReason"));
              v19 = objc_msgSend(v18, "isEqualToString:", v6);

              if (v19)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startAfter"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v13));
                objc_msgSend(v21, "doubleValue");
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:"));

                objc_msgSend(v22, "timeIntervalSinceDate:", v20);
                if (v23 > 0.0)
                {
                  v24 = v23;
                  objc_msgSend(v17, "setStartAfter:", v22);
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startBefore"));
                  v26 = v13;
                  v27 = v6;
                  v28 = v11;
                  v29 = v10;
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dateByAddingTimeInterval:", v24));
                  objc_msgSend(v17, "setStartBefore:", v30);

                  v10 = v29;
                  v11 = v28;
                  v6 = v27;
                  v13 = v26;
                  v14 = v36;

                }
                v15 = v37;
              }
            }
            v38 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v38);
        }

        v12 = v35 + 1;
      }
      while ((id)(v35 + 1) != v34);
      v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v34);
  }

  os_unfair_recursive_lock_unlock(v31);
}

- (void)start
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _DASSmartPowerNapMonitor *v6;
  _DASSmartPowerNapMonitor *smartPowerNapMonitor;
  _DASCPMModeMonitor *v8;
  _DASCPMModeMonitor *cpmModeMonitor;
  _DASRemoteDeviceNearbyMonitor *v10;
  _DASRemoteDeviceNearbyMonitor *remoteDeviceNearbyMonitor;
  _DASRemoteDeviceWakeMonitor *v12;
  _DASRemoteDeviceWakeMonitor *remoteDeviceWakeMonitor;
  _DASDiskSpaceMonitor *v14;
  _DASDiskSpaceMonitor *diskSpaceMonitor;
  _DASRemoteDeviceActivityMonitor *v16;
  _DASRemoteDeviceActivityMonitor *remoteDeviceActivityMonitor;
  _DASBacklightStateMonitor *v18;
  _DASBacklightStateMonitor *backlightStateMonitor;
  _DASActivityRateLimitManager *v20;
  _DASActivityRateLimitManager *rateLimiter;
  _DASRuntimeLimiter *v22;
  _DASRuntimeLimiter *runtimeLimiter;
  _DASConfigurationLimiter *v24;
  _DASConfigurationLimiter *configurationLimiter;
  OS_dispatch_queue *evaluationQueue;
  _BOOL4 v27;
  _DASBlueListManager *v28;
  _DASBlueListManager *blueListManager;
  dispatch_queue_attr_t v30;
  NSObject *v31;
  OS_dispatch_queue *v32;
  OS_dispatch_queue *activityLaunchQueue;
  _DASBARScheduler *v34;
  _DASBARScheduler *barScheduler;
  NSObject *v36;
  _DASSwapPredictionManager *v37;
  _DASSwapPredictionManager *swapManager;
  _APRSManager *v39;
  _APRSManager *appResumeManager;
  _DASClosureManager *v41;
  _DASClosureManager *closureManager;
  _DASENManager *v43;
  _DASENManager *enManager;
  void *v45;
  void *v46;
  uint8_t v47[8];
  _QWORD handler[5];
  uint8_t buf[4];

  -[_DASDaemon loadState](self, "loadState");
  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating _DASBGSystemTaskHelper", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](_DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend(v4, "startWithListener:", self->_bgstListener);

  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activating listener", buf, 2u);
  }

  -[NSXPCListener activate](self->_listener, "activate");
  -[_DASDaemon solicitActivityResubmission](self, "solicitActivityResubmission");
  +[_DASDataCollectionTasks schedule](_DASDataCollectionTasks, "schedule");
  +[_DASAutoBugCaptureHelper schedule](_DASAutoBugCaptureHelper, "schedule");
  v6 = (_DASSmartPowerNapMonitor *)objc_claimAutoreleasedReturnValue(+[_DASSmartPowerNapMonitor sharedMonitorWithDaemon:](_DASSmartPowerNapMonitor, "sharedMonitorWithDaemon:", self));
  smartPowerNapMonitor = self->_smartPowerNapMonitor;
  self->_smartPowerNapMonitor = v6;

  if (+[_DASConfig isiPhone](_DASConfig, "isiPhone"))
  {
    v8 = (_DASCPMModeMonitor *)objc_claimAutoreleasedReturnValue(+[_DASCPMModeMonitor sharedMonitor](_DASCPMModeMonitor, "sharedMonitor"));
    cpmModeMonitor = self->_cpmModeMonitor;
    self->_cpmModeMonitor = v8;

  }
  v10 = (_DASRemoteDeviceNearbyMonitor *)objc_claimAutoreleasedReturnValue(+[_DASRemoteDeviceNearbyMonitor sharedMonitorWithDaemon:](_DASRemoteDeviceNearbyMonitor, "sharedMonitorWithDaemon:", self));
  remoteDeviceNearbyMonitor = self->_remoteDeviceNearbyMonitor;
  self->_remoteDeviceNearbyMonitor = v10;

  v12 = (_DASRemoteDeviceWakeMonitor *)objc_claimAutoreleasedReturnValue(+[_DASRemoteDeviceWakeMonitor sharedMonitorWithDaemon:](_DASRemoteDeviceWakeMonitor, "sharedMonitorWithDaemon:", self));
  remoteDeviceWakeMonitor = self->_remoteDeviceWakeMonitor;
  self->_remoteDeviceWakeMonitor = v12;

  v14 = (_DASDiskSpaceMonitor *)objc_claimAutoreleasedReturnValue(+[_DASDiskSpaceMonitor sharedMonitorWithDaemon:](_DASDiskSpaceMonitor, "sharedMonitorWithDaemon:", self));
  diskSpaceMonitor = self->_diskSpaceMonitor;
  self->_diskSpaceMonitor = v14;

  v16 = (_DASRemoteDeviceActivityMonitor *)objc_claimAutoreleasedReturnValue(+[_DASRemoteDeviceActivityMonitor sharedMonitorWithDaemon:](_DASRemoteDeviceActivityMonitor, "sharedMonitorWithDaemon:", self));
  remoteDeviceActivityMonitor = self->_remoteDeviceActivityMonitor;
  self->_remoteDeviceActivityMonitor = v16;

  v18 = (_DASBacklightStateMonitor *)objc_claimAutoreleasedReturnValue(+[_DASBacklightStateMonitor sharedInstance](_DASBacklightStateMonitor, "sharedInstance"));
  backlightStateMonitor = self->_backlightStateMonitor;
  self->_backlightStateMonitor = v18;

  v20 = (_DASActivityRateLimitManager *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimitManager sharedLimiter](_DASActivityRateLimitManager, "sharedLimiter"));
  rateLimiter = self->_rateLimiter;
  self->_rateLimiter = v20;

  v22 = (_DASRuntimeLimiter *)objc_claimAutoreleasedReturnValue(+[_DASRuntimeLimiter sharedLimiter](_DASRuntimeLimiter, "sharedLimiter"));
  runtimeLimiter = self->_runtimeLimiter;
  self->_runtimeLimiter = v22;

  v24 = (_DASConfigurationLimiter *)objc_claimAutoreleasedReturnValue(+[_DASConfigurationLimiter sharedLimiter](_DASConfigurationLimiter, "sharedLimiter"));
  configurationLimiter = self->_configurationLimiter;
  self->_configurationLimiter = v24;

  *(_DWORD *)buf = 0;
  evaluationQueue = self->_evaluationQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000AA528;
  handler[3] = &unk_10015D9B8;
  handler[4] = self;
  notify_register_dispatch("com.apple.sysdiagnose.sysdiagnoseStarted", (int *)buf, (dispatch_queue_t)evaluationQueue, handler);
  v27 = dlopen_preflight("/System/Library/Frameworks/UIKit.framework/UIKit");
  byte_1001ABD20 = v27;
  if (v27)
  {
    v28 = (_DASBlueListManager *)objc_claimAutoreleasedReturnValue(+[_DASBlueListManager managerWithContext:](_DASBlueListManager, "managerWithContext:", self->_context));
    blueListManager = self->_blueListManager;
    self->_blueListManager = v28;

    v30 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.duetactivityscheduler.activityLaunchQueue", v31);
    activityLaunchQueue = self->_activityLaunchQueue;
    self->_activityLaunchQueue = v32;

    v34 = (_DASBARScheduler *)objc_claimAutoreleasedReturnValue(+[_DASBARScheduler barSchedulerWithScheduler:](_DASBARScheduler, "barSchedulerWithScheduler:", self));
    barScheduler = self->_barScheduler;
    self->_barScheduler = v34;

    v36 = os_transaction_create("com.apple.dasd.barTransactionCreate");
    -[_DASBARScheduler start](self->_barScheduler, "start");
    -[_DASDaemon registerForTrial](self, "registerForTrial");
    -[_DASDaemon updateTrialParameters](self, "updateTrialParameters");
    if (self->_recomEngineDisabled)
    {
      v37 = (_DASSwapPredictionManager *)objc_claimAutoreleasedReturnValue(+[_DASSwapPredictionManager sharedInstance](_DASSwapPredictionManager, "sharedInstance"));
      swapManager = self->_swapManager;
      self->_swapManager = v37;

      -[_DASSwapPredictionManager start](self->_swapManager, "start");
    }
    else
    {
      v39 = (_APRSManager *)objc_claimAutoreleasedReturnValue(+[_APRSManager sharedInstance](_APRSManager, "sharedInstance"));
      appResumeManager = self->_appResumeManager;
      self->_appResumeManager = v39;

    }
    v41 = objc_alloc_init(_DASClosureManager);
    closureManager = self->_closureManager;
    self->_closureManager = v41;

  }
  else
  {
    v36 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "UIKit framework not found...", v47, 2u);
    }
  }

  v43 = (_DASENManager *)objc_claimAutoreleasedReturnValue(+[_DASENManager manager](_DASENManager, "manager"));
  enManager = self->_enManager;
  self->_enManager = v43;

  +[_DASENManager schedulePeriodicRelaunchTask](_DASENManager, "schedulePeriodicRelaunchTask");
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
  objc_msgSend(v45, "registerReportTaskInfoTask");

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
  objc_msgSend(v46, "registerFeatureStatusTask");

}

- (void)handleSysdiagnoseStartEvent
{
  NSObject *v3;
  void *v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[16];
  _BYTE v19[128];

  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Sysdiagnose started, suspending running tasks if any", buf, 2u);
  }

  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_runningTasks;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suspendRequestDate"));
        if (v11)
        {

        }
        else
        {
          v12 = objc_msgSend(v10, "schedulingPriority");
          if ((unint64_t)v12 < _DASSchedulingPriorityUserInitiated
            || objc_msgSend(v10, "isIntensive"))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:](self, "updateSuspendRequestDate:forActivity:withReason:", v13, v10, CFSTR("Sysdiagnose"));

            objc_msgSend(v4, "addObject:", v10);
          }
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    -[_DASDaemon suspendActivities:](self, "suspendActivities:", v4);
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);

}

- (unint64_t)submittedTaskCount
{
  os_unfair_recursive_lock_s *p_activityStateLock;
  id v4;

  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v4 = -[NSMutableSet count](self->_pendingTasks, "count");
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return (unint64_t)v4;
}

- (id)allPendingTasks
{
  os_unfair_recursive_lock_s *p_activityStateLock;
  id v4;

  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v4 = -[NSMutableSet copy](self->_pendingTasks, "copy");
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v4;
}

- (id)allPendingRestartTasks
{
  void *v3;
  NSMutableDictionary *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = self->_triggerToActivitiesMap;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerToActivitiesMap, "objectForKeyedSubscript:", CFSTR("com.apple.duetactivityscheduler.restartpolicy.assertionsheld")));
  if (v5)
    objc_msgSend(v3, "unionSet:", v5);

  objc_sync_exit(v4);
  return v3;
}

- (id)allPendingPushLaunchTasks
{
  void *v3;
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  NSMutableDictionary *applicationLaunchRequests;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
  applicationLaunchRequests = self->_applicationLaunchRequests;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AA910;
  v8[3] = &unk_10015FAC8;
  v6 = v3;
  v9 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](applicationLaunchRequests, "enumerateKeysAndObjectsUsingBlock:", v8);

  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  return v6;
}

- (id)allPendingBackgroundTasks
{
  void *v3;
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  NSMutableDictionary *applicationLaunchRequests;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0);
  applicationLaunchRequests = self->_applicationLaunchRequests;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AAAEC;
  v8[3] = &unk_10015FAC8;
  v6 = v3;
  v9 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](applicationLaunchRequests, "enumerateKeysAndObjectsUsingBlock:", v8);

  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  return v6;
}

- (id)allPendingSyncOnBackupTasks
{
  void *v3;
  os_unfair_recursive_lock_s *p_activityStateLock;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_pendingTasks;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "userRequestedBackupTask", (_QWORD)v12))
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v3;
}

- (id)allTimewiseEligibleNetworkTasksAllowingCell:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = self->_triggerToActivitiesMap;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerToActivitiesMap, "objectForKeyedSubscript:", CFSTR("com.apple.duetactivityscheduler.nwstatus.wifi")));
  v9 = v8;
  if (v8)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v14, "timewiseEligibleAtDate:", v6, (_QWORD)v16) & v3) == 1
            && (objc_msgSend(v14, "requiresInexpensiveNetworking") & 1) == 0)
          {
            objc_msgSend(v5, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  objc_sync_exit(v7);

  return v5;
}

- (id)startedTasks
{
  os_unfair_recursive_lock_s *p_activityStateLock;
  id v4;

  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v4 = -[NSMutableSet copy](self->_runningTasks, "copy");
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v4;
}

- (id)allPrerunningTasks
{
  os_unfair_recursive_lock_s *p_activityStateLock;
  id v4;

  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v4 = -[NSMutableSet copy](self->_prerunningTasks, "copy");
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v4;
}

- (id)allTasks
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  objc_msgSend(v3, "unionSet:", self->_prerunningTasks);
  objc_msgSend(v3, "unionSet:", self->_runningTasks);
  objc_msgSend(v3, "unionSet:", self->_pendingTasks);
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (void)createDefaultActivityGroups
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = _DASDefaultNetworkGroupName;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v9, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityGroup groupWithName:maxConcurrent:](_DASActivityGroup, "groupWithName:maxConcurrent:", _DASDefaultNetworkGroupName, qword_1001AAAC8));
  -[_DASDaemon createActivityGroup:](self, "createActivityGroup:", v4);
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = _DASDefaultGroupName;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityGroup groupWithName:maxConcurrent:](_DASActivityGroup, "groupWithName:maxConcurrent:", _DASDefaultGroupName, qword_1001AAAC0));
  -[_DASDaemon createActivityGroup:](self, "createActivityGroup:", v6);
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = _DASDefaultRemoteGroupName;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityGroup groupWithName:maxConcurrent:](_DASActivityGroup, "groupWithName:maxConcurrent:", _DASDefaultRemoteGroupName, 10));
  -[_DASDaemon createActivityGroup:](self, "createActivityGroup:", v8);

}

- (NSString)description
{
  os_unfair_recursive_lock_s *p_activityStateLock;
  void *v4;
  NSString *v5;
  void *v6;

  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet description](self->_runningTasks, "description"));
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: Listener: %@, Clients: %@, Started Tasks: %@"), objc_opt_class(self), self->_listener, self->_clients, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (void)removeClient:(id)a3
{
  NSMutableArray *v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;
  NSMutableDictionary *connectedBGTaskClients;
  void *v9;
  NSMutableDictionary *activitiesWaitingForBGTaskClients;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self->_clients;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](self->_clients, "removeObject:", v12);
  objc_sync_exit(v4);

  v5 = self->_connectedBGTaskClients;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "connection"));
  v7 = objc_msgSend(v6, "processIdentifier");

  connectedBGTaskClients = self->_connectedBGTaskClients;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
  -[NSMutableDictionary removeObjectForKey:](connectedBGTaskClients, "removeObjectForKey:", v9);

  activitiesWaitingForBGTaskClients = self->_activitiesWaitingForBGTaskClients;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
  -[NSMutableDictionary removeObjectForKey:](activitiesWaitingForBGTaskClients, "removeObjectForKey:", v11);

  objc_sync_exit(v5);
}

- (id)clientForActivity:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_clients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startedTasks", (_QWORD)v15));
        objc_sync_enter(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startedTasks"));
        v13 = objc_msgSend(v12, "containsObject:", v4);

        if (v13)
        {
          v7 = v10;
          objc_sync_exit(v11);

          goto LABEL_11;
        }
        objc_sync_exit(v11);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (void)runLocalActivity:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *launchQueue;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  -[_DASDaemon handleRunningActivities:](self, "handleRunningActivities:", v5);

  v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handlerQueue"));
  launchQueue = v6;
  if (!v6)
    launchQueue = self->_launchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB620;
  block[3] = &unk_10015D4E0;
  v10 = v4;
  v8 = v4;
  dispatch_async((dispatch_queue_t)launchQueue, block);

}

- (void)runActivities:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  id v21;
  id v22;
  uint64_t v23;
  __objc2_class_ro **p_info;
  _UNKNOWN **v25;
  __objc2_class_ro **v26;
  void *k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _UNKNOWN **v40;
  void *v41;
  void *v42;
  void *context;
  uint64_t v44;
  void *v45;
  id obj;
  void *v47;
  void *v48;
  void *v49;
  _DASDaemon *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Running activities : %@", buf, 0xCu);
  }

  context = objc_autoreleasePoolPush();
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  v50 = self;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
        -[_DASDaemon reportActivityTiming:](self, "reportActivityTiming:", v11);
        -[_DASDaemon reportOversizeLoadSymptomForActivity:atStart:](self, "reportOversizeLoadSymptomForActivity:atStart:", v11, 1);
        v12 = objc_msgSend(v11, "delayedStart");
        v13 = v51;
        if (v12)
        {
          v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v69 = v11;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Activity %@ has delayed start", buf, 0xCu);
          }

          v13 = v45;
          self = v50;
        }
        objc_msgSend(v13, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v51, "count"))
  {
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1000ABE04;
    v62[3] = &unk_10015FAF0;
    v15 = v51;
    v63 = v15;
    -[_DASDaemon allClientsDo:](self, "allClientsDo:", v62);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v59 != v19)
            objc_enumerationMutation(v16);
          -[_DASDaemon createAssertion:](self, "createAssertion:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
      }
      while (v18);
    }

  }
  if (objc_msgSend(v45, "count"))
  {
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_1000ABE10;
    v56[3] = &unk_10015FAF0;
    v57 = v45;
    -[_DASDaemon allClientsDo:](self, "allClientsDo:", v56);

  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v6;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v53;
    p_info = &OBJC_METACLASS___AppKillsInfo.info;
    v25 = &AnalyticsSendEvent_ptr;
    v26 = (__objc2_class_ro **)(&OBJC_METACLASS___AppKillsInfo + 32);
    v44 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v22; k = (char *)k + 1)
      {
        if (*(_QWORD *)v53 != v23)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)k);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startHandler"));

        if (v29)
        {
          -[_DASDaemon runLocalActivity:](self, "runLocalActivity:", v28);
        }
        else if ((objc_msgSend(v28, "requestsApplicationLaunch") & 1) == 0)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "widgetID"));
          if (v30)
          {

          }
          else if ((objc_msgSend(v28, "delayedStart") & 1) == 0)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
            objc_msgSend(v31, "recordActivityLifeCycleStart:", v28);

            -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:](self, "recordToTaskRegistry:lifeCycleStateName:", v28, CFSTR("started"));
          }
        }
        if (objc_msgSend(p_info + 131, "isiCPLActivity:", v28))
        {
          v32 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_photosIsBlocked));
            *(_DWORD *)buf = 138543618;
            v69 = v28;
            v70 = 2112;
            v71 = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Reporting photos activity no longer blocked: %{public}@ (was %@)", buf, 0x16u);

          }
          -[_DASDaemon updateiCPLTasksBlocked:](self, "updateiCPLTasksBlocked:", 0);
          if (_os_feature_enabled_impl("DAS", "photos_intent_sync")
            && objc_msgSend(p_info + 131, "isPhotosSyncActivity:", v28)
            && -[_DASRemoteDeviceActivityMonitor isRegistered](self->_remoteDeviceActivityMonitor, "isRegistered"))
          {
            -[_DASRemoteDeviceActivityMonitor unregisterForRemoteDeviceActiveNotifications](self->_remoteDeviceActivityMonitor, "unregisterForRemoteDeviceActiveNotifications");
          }
        }
        if (objc_msgSend(v28, "isContinuedProcessingTask"))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[_DASContinuedProcessingTaskUIClient sharedClient](_DASContinuedProcessingTaskUIClient, "sharedClient"));
          v49 = k;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uuid"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "relatedApplications"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "firstObject"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "clientProvidedIconBundleIdentifier"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "clientProvidedTitle"));
          v38 = v22;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "clientProvidedReason"));
          v40 = v25;
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "progress"));
          objc_msgSend(v47, "startActivityForIdentifier:bundleIdentifier:imageUTI:activityName:activityDescription:progress:", v34, v35, v36, v37, v39, v41);

          v25 = v40;
          v22 = v38;

          self = v50;
          p_info = (__objc2_class_ro **)(&OBJC_METACLASS___AppKillsInfo + 32);

          v23 = v44;
          v26 = &OBJC_METACLASS___AppKillsInfo.info;

          k = v49;
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25[108], "date"));
        if (objc_msgSend(v28, "overdueAtDate:", v42))
        {
          if ((objc_msgSend(v28, "requiresPlugin") & 1) == 0)
            objc_msgSend(v26 + 476, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.missedDeadlineCount.nonPlugin"), 1);
          if ((objc_msgSend(v28, "requiresNetwork") & 1) == 0)
            objc_msgSend(v26 + 476, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.missedDeadlineCount.nonNetwork"), 1);
          if ((objc_msgSend(v28, "requiresNetwork") & 1) == 0
            && (objc_msgSend(v28, "requiresPlugin") & 1) == 0)
          {
            objc_msgSend(v26 + 476, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.missedDeadlineCount.nonPluginNetwork"), 1);
          }
          objc_msgSend(v26 + 476, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.missedDeadlineCount"), 1);
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
    }
    while (v22);
  }

  objc_autoreleasePoolPop(context);
}

- (void)runActivitiesAndRemoveUnknown:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  NSObject *v13;
  NSMutableSet *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  void *v31;
  void *context;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;
  _BYTE v54[128];

  v4 = a3;
  context = objc_autoreleasePoolPush();
  -[_DASDaemon runActivities:](self, "runActivities:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v11, "delayedStart") & 1) == 0)
        {
          if (objc_msgSend(v11, "requestsApplicationLaunch"))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon clientForActivity:](self, "clientForActivity:", v11));

            if (!v12)
            {
              v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v53 = v11;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Launch Task %@ has no known client", buf, 0xCu);
              }

              -[_DASDaemon activityCompleted:](self, "activityCompleted:", v11);
              objc_msgSend(v5, "addObject:", v11);
            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "minusSet:", v5);
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v14 = self->_runningTasks;
  v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v42;
LABEL_16:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v17)
        objc_enumerationMutation(v14);
      objc_msgSend(v6, "removeObject:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v18));
      if (!objc_msgSend(v6, "count"))
        break;
      if (v16 == (id)++v18)
      {
        v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v16)
          goto LABEL_16;
        break;
      }
    }
  }

  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = objc_msgSend(v6, "copy");
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v24, "delayedStart"))
          objc_msgSend(v6, "removeObject:", v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v6, "count"))
  {
    v25 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v6;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No XPC Connection to client for activities: %@", buf, 0xCu);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v6;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v28; k = (char *)k + 1)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)k);
          if (objc_msgSend(v31, "requestsApplicationLaunch"))
          {
            -[_DASDaemon activityCompleted:](self, "activityCompleted:", v31);
          }
          else if ((objc_msgSend(v31, "requestsExtensionLaunch") & 1) == 0)
          {
            -[_DASDaemon activityCanceled:](self, "activityCanceled:", v31);
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      }
      while (v28);
    }

  }
  objc_autoreleasePoolPop(context);

}

- (void)clearRecentlyLaunchedApps
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *j;
  uint64_t v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  void *v24;
  void *context;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  context = objc_autoreleasePoolPush();
  v3 = self->_recentlyLaunchedApps;
  objc_sync_enter(v3);
  if ((unint64_t)-[NSMutableDictionary count](self->_recentlyLaunchedApps, "count") >= 0x1A)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_recentlyLaunchedApps, "allKeys"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_recentlyLaunchedApps, "objectForKeyedSubscript:", v10));
          objc_msgSend(v5, "timeIntervalSinceDate:", v11);
          v13 = v12 > 450.0;

          if (v13)
          {
            -[NSMutableDictionary removeObjectForKey:](self->_recentlyLaunchedApps, "removeObjectForKey:", v10);
            -[NSCountedSet removeObject:](self->_launchesPerApp, "removeObject:", v10);
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);
    }

    if ((unint64_t)-[NSMutableDictionary count](self->_recentlyLaunchedApps, "count") >= 0x1A)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_recentlyLaunchedApps, "allKeys"));

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v6 = v14;
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v27;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v6);
            v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_recentlyLaunchedApps, "objectForKeyedSubscript:", v18));
            objc_msgSend(v5, "timeIntervalSinceDate:", v19);
            v21 = v20 > 225.0;

            if (v21)
            {
              -[NSMutableDictionary removeObjectForKey:](self->_recentlyLaunchedApps, "removeObjectForKey:", v18);
              -[NSCountedSet removeObject:](self->_launchesPerApp, "removeObject:", v18);
            }
          }
          v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v15);
      }

      while ((unint64_t)-[NSMutableDictionary count](self->_recentlyLaunchedApps, "count") >= 0x1A)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_recentlyLaunchedApps, "allKeys"));

        v23 = objc_msgSend(v22, "objectAtIndex:", arc4random_uniform((uint32_t)objc_msgSend(v22, "count")));
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        -[NSMutableDictionary removeObjectForKey:](self->_recentlyLaunchedApps, "removeObjectForKey:", v24);
        -[NSCountedSet removeObject:](self->_launchesPerApp, "removeObject:", v24);

        v6 = v22;
      }
    }

  }
  objc_sync_exit(v3);

  objc_autoreleasePoolPop(context);
}

- (void)runLaunchTasks:(id)a3 forApplication:(id)a4 forApplicationURL:(id)a5 onLaunch:(id)a6 onCompletion:(id)a7 onFailure:(id)a8
{
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  id v18;
  NSObject *v19;
  id v20;
  __int128 v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  unsigned int v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  NSObject *v45;
  void *v46;
  int v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  unsigned __int8 v51;
  void *v52;
  unsigned __int8 v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  OS_dispatch_queue *activityLaunchQueue;
  NSObject *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *i;
  __int128 v64;
  void *v65;
  void (**v66)(_QWORD);
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
  id obj;
  uint64_t v85;
  void *v86;
  dispatch_group_t v87;
  id v88;
  id v89;
  _QWORD block[4];
  id v91;
  NSObject *v92;
  _DASDaemon *v93;
  id v94;
  id v95;
  id v96;
  NSObject *v97;
  id v98;
  id v99;
  id v100;
  id v101;
  void (**v102)(_QWORD);
  _QWORD v103[4];
  NSObject *v104;
  id v105;
  void *v106;
  NSObject *v107;
  _DASDaemon *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  uint8_t v118[128];
  uint8_t buf[4];
  id v120;
  __int16 v121;
  id v122;

  v14 = a3;
  v88 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(_QWORD))a7;
  v18 = a8;
  v70 = (void *)os_transaction_create("com.apple.dasd.activateLaunchTasks");
  v19 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v120 = v14;
    v121 = 2112;
    v122 = v88;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Running launch tasks: %@ for application: %@", buf, 0x16u);
  }
  v87 = dispatch_group_create();
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v82 = v19;
  if (byte_1001ABD20)
  {
    v65 = v18;
    v66 = v17;
    v67 = v16;
    v68 = v15;
    v89 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v69 = v14;
    obj = v14;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
    if (!v20)
      goto LABEL_30;
    v22 = v20;
    v85 = *(_QWORD *)v110;
    v23 = _DASLaunchReasonBackgroundFetch;
    v83 = _DASLaunchReasonBackgroundRemoteNotification;
    v81 = _DASLaunchReasonNSURLSessionComplete;
    v76 = _DASLaunchReasonHealthKit;
    v77 = _DASLaunchReasonSignificantLocationChange;
    v73 = _DASLaunchReasonBackgroundProcessing;
    v74 = _DASLaunchReasonBackgroundRefresh;
    v72 = _DASLaunchReasonHealthResearch;
    v75 = _DASLaunchOptionsSignificantLocationChange;
    v79 = _DASLaunchOptionsNSURLSession;
    v80 = _DASRemoteNotificationPayloadKey;
    *(_QWORD *)&v21 = 138412546;
    v64 = v21;
    v24 = (void *)_DASLaunchOptionsNSURLSession;
    while (1)
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v110 != v85)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)v25);
        -[_DASDaemon moveActivityToPrerunning:](self, "moveActivityToPrerunning:", v26, v64);
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472;
        v103[2] = sub_1000ACF30;
        v103[3] = &unk_10015FB18;
        v104 = v19;
        v105 = v88;
        v106 = v26;
        v107 = v87;
        v108 = self;
        v27 = objc_retainBlock(v103);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchReason"));
        v29 = objc_msgSend(v28, "isEqualToString:", v23);

        if (v29)
        {
          v30 = objc_msgSend(objc_alloc((Class)UISFetchContentInBackgroundAction), "initWithHandler:", v27);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "uuid"));
          v32 = v89;
          v33 = v30;
          v34 = v31;
          goto LABEL_11;
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchReason"));
        v36 = objc_msgSend(v35, "isEqualToString:", v83);

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userInfo"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v80));

          v30 = objc_msgSend(objc_alloc((Class)UISHandleRemoteNotificationAction), "initWithRemoteNotificationPayload:withHandler:", v31, v27);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "uuid"));
          objc_msgSend(v89, "setObject:forKeyedSubscript:", v30, v38);

          v19 = v82;
          goto LABEL_19;
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchReason"));
        v40 = objc_msgSend(v39, "isEqualToString:", v81);

        if (v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userInfo"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", v79));

          if (v42)
          {
            v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userInfo"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v24));
            v32 = v78;
            v33 = v31;
            v34 = v24;
LABEL_11:
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, v34);
LABEL_19:

          }
LABEL_20:
          v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchReason"));
          objc_msgSend(v86, "addObject:", v45);
          goto LABEL_21;
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchReason"));
        v44 = objc_msgSend(v43, "isEqualToString:", v77);

        if (v44)
        {
          v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userInfo"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v75));
          objc_msgSend(v78, "addEntriesFromDictionary:", v31);
          goto LABEL_19;
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchReason"));
        v47 = objc_msgSend(v46, "isEqualToString:", v76);

        if ((v47 & 1) != 0)
          goto LABEL_20;
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchReason"));
        v49 = objc_msgSend(v48, "isEqualToString:", v74);

        if ((v49 & 1) != 0)
          goto LABEL_20;
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchReason"));
        v51 = objc_msgSend(v50, "isEqualToString:", v73);

        if ((v51 & 1) != 0)
          goto LABEL_20;
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchReason"));
        v53 = objc_msgSend(v52, "isEqualToString:", v72);

        if ((v53 & 1) != 0)
          goto LABEL_20;
        v45 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchReason"));
          *(_DWORD *)buf = v64;
          v120 = v54;
          v121 = 2112;
          v122 = v88;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Encountered unexpected launch reason %@ for %@", buf, 0x16u);

        }
LABEL_21:

        v25 = (char *)v25 + 1;
      }
      while (v22 != v25);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
      v22 = v55;
      if (!v55)
      {
LABEL_30:

        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "allValues"));
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v56, FBSOpenApplicationOptionKeyActions);

        if (!-[_DASBARScheduler applicationStateRequiresImmediateDelivery:](self->_barScheduler, "applicationStateRequiresImmediateDelivery:", v88))objc_msgSend(v71, "setObject:forKeyedSubscript:", &off_10016ED68, FBSOpenApplicationOptionKeyLaunchIntent);
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v78, FBSOpenApplicationOptionKeyPayloadOptions);
        v16 = v67;
        v15 = v68;
        v18 = v65;
        v17 = v66;
        v57 = v70;
        if (objc_msgSend(v86, "count"))
        {
          activityLaunchQueue = self->_activityLaunchQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000AD1A0;
          block[3] = &unk_10015FBE0;
          v91 = v70;
          v92 = v87;
          v93 = self;
          v94 = v88;
          v95 = v68;
          v96 = v71;
          v97 = v19;
          v100 = v65;
          v101 = v67;
          v98 = obj;
          v99 = v89;
          v102 = v66;
          dispatch_async((dispatch_queue_t)activityLaunchQueue, block);

        }
        else
        {
          v66[2](v66);
        }
        v14 = v69;

        goto LABEL_46;
      }
    }
  }
  v59 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "UIKit is not enabled!", buf, 2u);
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v89 = v14;
  v60 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v113, v118, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v114;
    do
    {
      for (i = 0; i != v61; i = (char *)i + 1)
      {
        if (*(_QWORD *)v114 != v62)
          objc_enumerationMutation(v89);
        -[_DASDaemon activityCanceled:](self, "activityCanceled:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)i));
      }
      v61 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v113, v118, 16);
    }
    while (v61);
    v57 = v70;
  }
  else
  {
    v57 = v70;
  }
LABEL_46:

}

- (void)launchApplication:(id)a3 applicationURL:(id)a4 additionalOptions:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;
  void *v26;

  v8 = a3;
  v9 = a6;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10));

  v25 = FBSOpenApplicationOptionKeyActivateSuspended;
  v26 = &__kCFBooleanTrue;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  objc_msgSend(v12, "addEntriesFromDictionary:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Launching with FBSOpenApplicationService for application %@", buf, 0xCu);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000AE270;
  v19[3] = &unk_10015FC08;
  v20 = v11;
  v21 = v8;
  v22 = v9;
  v16 = v9;
  v17 = v8;
  v18 = v11;
  objc_msgSend(v15, "openApplication:withOptions:completion:", v17, v14, v19);

}

- (id)assertionForActivity:(id)a3 pid:(int)a4
{
  uint64_t v4;
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  unsigned int v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _DASAssertion *v31;
  uint64_t v32;
  id v34;
  void *v35;
  void *v36;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "isBackgroundTaskActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason"));
  v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend(v7, "isEqualToString:", _DASLaunchReasonBackgroundRefresh);

    if ((v9 & 1) != 0)
    {
      v10 = CFSTR("BGAppRefreshTask");
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason"));
      v19 = objc_msgSend(v18, "isEqualToString:", _DASLaunchReasonBackgroundProcessing);

      if (v19)
      {
        if (objc_msgSend(v5, "isContactTracingBackgroundActivity")
          && !objc_msgSend(v5, "requiresPlugin"))
        {
          v10 = CFSTR("BGProcessingTask-ExposureNotification");
        }
        else if (objc_msgSend(v5, "requiresPlugin"))
        {
          v10 = CFSTR("BGProcessingTask-Unrestricted");
        }
        else
        {
          v10 = CFSTR("BGProcessingTask-Restricted");
        }
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason"));
        v21 = objc_msgSend(v20, "isEqualToString:", _DASLaunchReasonHealthResearch);

        if (!v21)
          goto LABEL_27;
        v10 = CFSTR("BGProcessingTask-Unrestricted");
      }
    }
    v32 = objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.dasd"), v10));
    if (v32)
    {
      v13 = (void *)v32;
      v14 = objc_alloc((Class)RBSAssertion);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", v4));
      v36 = v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
      v17 = CFSTR("com.apple.das.backgroundTasks");
      goto LABEL_25;
    }
LABEL_27:
    v31 = 0;
    goto LABEL_28;
  }
  if ((objc_msgSend(v7, "isEqualToString:", _DASLaunchReasonBackgroundFetch) & 1) != 0)
    goto LABEL_9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason"));
  if ((objc_msgSend(v11, "isEqualToString:", _DASLaunchReasonBackgroundRemoteNotification) & 1) != 0)
  {
LABEL_8:

LABEL_9:
LABEL_10:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.dasd"), CFSTR("BackgroundDownload")));
    v14 = objc_alloc((Class)RBSAssertion);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", v4));
    v35 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
    v17 = CFSTR("com.apple.das.backgroundFetch");
LABEL_25:
    v26 = objc_msgSend(v14, "initWithExplanation:target:attributes:", v17, v15, v16);

    v31 = -[_DASAssertion initWithRBSAssertion:forPid:]([_DASAssertion alloc], "initWithRBSAssertion:forPid:", v26, v4);
    goto LABEL_26;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason"));
  if (objc_msgSend(v12, "isEqualToString:", _DASLaunchReasonNSURLSessionComplete))
  {

    goto LABEL_8;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason"));
  v23 = objc_msgSend(v22, "isEqualToString:", _DASLaunchReasonNSURLSessionAuthorizationRequired);

  if ((v23 & 1) != 0)
    goto LABEL_10;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason"));
  v25 = objc_msgSend(v24, "isEqualToString:", _DASLaunchReasonHealthKit);

  if (!v25)
    goto LABEL_27;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason"));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.dasd"), CFSTR("HealthLaunch")));
  v27 = objc_alloc((Class)RBSAssertion);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", v4));
  v34 = v26;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
  v30 = objc_msgSend(v27, "initWithExplanation:target:attributes:", v13, v28, v29);

  v31 = -[_DASAssertion initWithRBSAssertion:forPid:]([_DASAssertion alloc], "initWithRBSAssertion:forPid:", v30, v4);
LABEL_26:

LABEL_28:
  return v31;
}

- (void)runExtensionLaunchActivities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  double v18;
  dispatch_time_t v19;
  OS_dispatch_queue *evaluationQueue;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  _QWORD block[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];

  v4 = a3;
  v23 = (void *)os_transaction_create("com.apple.dasd.runExtensionLaunchActivities");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    v10 = _DASExtensionLaunchReasonMLCompute;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        -[_DASDaemon prepareActivityForStart:atTime:](self, "prepareActivityForStart:atTime:", v12, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "launchReason"));
        v14 = objc_msgSend(v13, "isEqualToString:", v10);

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "extensionIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlugin pluginForIdentifier:ofType:](_DASPlugin, "pluginForIdentifier:ofType:", v15, CFSTR("com.apple.ml-extension")));

          if (v16)
          {
            objc_msgSend(v16, "setPluginDelegate:", self);
            v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v12;
              v31 = 2112;
              v32 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Activity: %@ requesting launch of extension: %@", buf, 0x16u);
            }

            objc_msgSend(v16, "performActivity:", v12);
            if ((int)objc_msgSend(v12, "pid") > 0)
            {
              v18 = (double)(unint64_t)objc_msgSend(v12, "duration") * 1.5;
              if (v18 >= (double)_DASActivityDurationLong)
                v18 = (double)_DASActivityDurationLong;
              v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
              evaluationQueue = self->_evaluationQueue;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000AEBE0;
              block[3] = &unk_10015D558;
              block[4] = v12;
              block[5] = self;
              dispatch_after(v19, (dispatch_queue_t)evaluationQueue, block);
              goto LABEL_21;
            }
            v22 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Extension failed to launch for activity %@", buf, 0xCu);
            }

            objc_msgSend(v16, "unload");
          }
          else
          {
            v21 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v12;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Unable to find extension for activity %@", buf, 0xCu);
            }

          }
          -[_DASDaemon activityCompleted:](self, "activityCompleted:", v12);
LABEL_21:

          continue;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v8);
  }

}

- (void)runApplicationLaunchActivities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  NSMutableSet *v22;
  NSObject *v23;
  double v24;
  id v25;
  _QWORD *v26;
  id v27;
  id v28;
  _QWORD *v29;
  id v30;
  _QWORD *v31;
  NSMutableDictionary *v32;
  void *k;
  NSMutableSet *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  BOOL v45;
  NSObject *v46;
  NSMutableSet *runningTasks;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_s *p_activityStateLock;
  id obj;
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _DASDaemon *v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _DASDaemon *v74;
  id v75;
  id v76;
  _QWORD v77[6];
  id v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  NSMutableSet *v93;
  __int16 v94;
  id v95;
  __int16 v96;
  id v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];

  v4 = a3;
  v49 = (void *)os_transaction_create("com.apple.dasd.runLaunchTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v89 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "requestsApplicationLaunch"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relatedApplications"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
    }
    while (v7);
  }

  v50 = objc_msgSend(obj, "mutableCopy");
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v48 = v5;
  v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
  if (v52)
  {
    p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
    p_activityStateLock = &self->_activityStateLock;
    v51 = *(_QWORD *)v85;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v85 != v51)
        {
          v14 = v13;
          objc_enumerationMutation(v48);
          v13 = v14;
        }
        v53 = v13;
        v57 = *(id *)(*((_QWORD *)&v84 + 1) + 8 * v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        os_unfair_recursive_lock_lock_with_options(p_activityStateLock, 0);
        v60 = -[NSMutableSet copy](self->_runningTasks, "copy");
        os_unfair_recursive_lock_unlock(p_activityStateLock);
        os_unfair_recursive_lock_lock_with_options(p_applicationLaunchRequestsLock, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_applicationLaunchRequests, "objectForKeyedSubscript:", v57));
        v17 = objc_msgSend(v16, "copy");

        os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v81;
          do
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(_QWORD *)v81 != v20)
                objc_enumerationMutation(v18);
              v22 = *(NSMutableSet **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j);
              if ((-[NSMutableSet wasForceRun](v22, "wasForceRun") & 1) != 0)
                goto LABEL_23;
              if (-[NSMutableSet timewiseEligibleAtDate:](v22, "timewiseEligibleAtDate:", v6)
                && (objc_msgSend(v60, "containsObject:", v22) & 1) == 0)
              {
                v79 = 0;
                +[_DASConditionScore scoreForActivity:withState:response:](_DASConditionScore, "scoreForActivity:withState:response:", v22, self->_context, &v79);
                if (v24 == 0.0)
                {
                  v23 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v93 = v22;
                    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Skipping activity %@", buf, 0xCu);
                  }
                }
                else
                {
LABEL_23:
                  if (-[_DASBARScheduler backgroundLaunchAllowedForBGTaskActivity:](self->_barScheduler, "backgroundLaunchAllowedForBGTaskActivity:", v22))
                  {
                    objc_msgSend(v15, "addObject:", v22);
                    -[NSMutableSet setStartDate:](v22, "setStartDate:", v6);
                    v23 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v93 = v22;
                      v94 = 2112;
                      v95 = v57;
                      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Activity: %@ requesting launch of application: %@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    objc_msgSend(v62, "addObject:", v22);
                    v23 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v93 = v22;
                      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Background launch not allowed for %@, cancelling", buf, 0xCu);
                    }
                  }
                }

                continue;
              }
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
          }
          while (v19);
        }

        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v50, "minusSet:", v15);
          v77[0] = _NSConcreteStackBlock;
          v77[1] = 3221225472;
          v77[2] = sub_1000AF6AC;
          v77[3] = &unk_10015D530;
          v77[4] = self;
          v77[5] = v57;
          v25 = v15;
          v78 = v25;
          v26 = objc_retainBlock(v77);
          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472;
          v72[2] = sub_1000AF978;
          v72[3] = &unk_10015DC88;
          v27 = v49;
          v73 = v27;
          v74 = self;
          v75 = v57;
          v28 = v25;
          v76 = v28;
          v29 = objc_retainBlock(v72);
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = sub_1000AFC90;
          v67[3] = &unk_10015DC88;
          v68 = v27;
          v30 = v28;
          v69 = v30;
          v70 = self;
          v71 = v57;
          v31 = objc_retainBlock(v67);
          -[_DASDaemon runLaunchTasks:forApplication:forApplicationURL:onLaunch:onCompletion:onFailure:](self, "runLaunchTasks:forApplication:forApplicationURL:onLaunch:onCompletion:onFailure:", v30, v57, 0, v26, v29, v31);
          v32 = self->_recentlyLaunchedApps;
          objc_sync_enter(v32);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentlyLaunchedApps, "setObject:forKeyedSubscript:", v6, v57);
          -[NSCountedSet addObject:](self->_launchesPerApp, "addObject:", v57);
          objc_sync_exit(v32);

          -[_DASDaemon clearRecentlyLaunchedApps](self, "clearRecentlyLaunchedApps");
        }

        v13 = v53 + 1;
      }
      while ((id)(v53 + 1) != v52);
      v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
    }
    while (v52);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v58 = v50;
  v61 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v63, v98, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v61; k = (char *)k + 1)
      {
        if (*(_QWORD *)v64 != v59)
          objc_enumerationMutation(v58);
        v34 = *(NSMutableSet **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)k);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet groupName](v34, "groupName"));

        if (v35)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet groupName](v34, "groupName"));
          os_unfair_lock_lock(&self->_groupLock);
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToRunningTasks, "objectForKeyedSubscript:", v36));
          objc_msgSend(v37, "removeObject:", v34);

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToPrerunningTasks, "objectForKeyedSubscript:", v36));
          objc_msgSend(v38, "removeObject:", v34);

          v39 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle(activityGroup)")));
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet groupName](v34, "groupName"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToRunningTasks, "objectForKeyedSubscript:", v36));
            v42 = objc_msgSend(v41, "count");
            *(_DWORD *)buf = 138543874;
            v93 = v34;
            v94 = 2112;
            v95 = v40;
            v96 = 2048;
            v97 = v42;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NO LONGER RUNNING [Not in application -> activity mapping] %{public}@ ...Tasks running in group [%@] are %ld!", buf, 0x20u);

          }
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToPendingTasks, "objectForKeyedSubscript:", v36));
          v44 = v43;
          if (v43)
          {
            objc_msgSend(v43, "addObject:", v34);
          }
          else
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v34));
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupToPendingTasks, "setObject:forKeyedSubscript:", v44, v36);
          }
          os_unfair_lock_unlock(&self->_groupLock);
          os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
          v45 = -[NSMutableSet count](self->_runningTasks, "count") == 0;
          -[NSMutableSet removeObject:](self->_prerunningTasks, "removeObject:", v34);
          -[NSMutableSet removeObject:](self->_runningTasks, "removeObject:", v34);
          -[NSMutableSet addObject:](self->_pendingTasks, "addObject:", v34);
          if (!v45)
            -[NSMutableSet count](self->_runningTasks, "count");
          v46 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runningTasks")));
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            runningTasks = self->_runningTasks;
            *(_DWORD *)buf = 138543362;
            v93 = runningTasks;
            _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
          }

          os_unfair_recursive_lock_unlock(&self->_activityStateLock);
        }
      }
      v61 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v63, v98, 16);
    }
    while (v61);
  }

  -[_DASDaemon cancelActivities:](self, "cancelActivities:", v62);
}

- (void)suspendPlugin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  OS_dispatch_queue *evaluationQueue;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extensionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlugin existingPluginForIdentifier:ofType:](_DASPlugin, "existingPluginForIdentifier:ofType:", v5, CFSTR("com.apple.ml-extension")));

  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_1000E9C18(v6, v8);

    objc_msgSend(v6, "suspend");
    v9 = dispatch_time(0, 10000000000);
    evaluationQueue = self->_evaluationQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000B0280;
    v11[3] = &unk_10015D558;
    v12 = v4;
    v13 = v6;
    dispatch_after(v9, (dispatch_queue_t)evaluationQueue, v11);

    v8 = v12;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not suspending activity %{public}@ - extension already gone", buf, 0xCu);
  }

}

- (void)warnBGTaskClientsForActivitiesAboutToExpire:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon connectedBGTaskClients](self, "connectedBGTaskClients"));
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon connectedBGTaskClients](self, "connectedBGTaskClients", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "willExpireBGTaskActivities:", v4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (void)deferActivities:(id)a3 withHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL8 v18;
  void (**v19)(id, _BOOL8);
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;

  v6 = a3;
  v19 = (void (**)(id, _BOOL8))a4;
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deferring %lu activities", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon getActivityRunningWithName:](self, "getActivityRunningWithName:", v15));
        if (v16)
        {
          objc_msgSend(v8, "addObject:", v16);
          -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:](self, "updateSuspendRequestDate:forActivity:withReason:", v9, v16, 0);
        }
        else
        {
          v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to find activity %@ to defer", buf, 0xCu);
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v18 = objc_msgSend(v8, "count") != 0;
  -[_DASDaemon suspendActivities:](self, "suspendActivities:", v8);
  v19[2](v19, v18);

}

- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)inspect:(id)a3 withHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)suspendActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:](self, "recordToTaskRegistry:lifeCycleStateName:", v4, CFSTR("suspended"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));

  -[_DASDaemon suspendActivities:](self, "suspendActivities:", v5);
}

- (void)suspendActivitiesWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_runningTasks;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
        v13 = objc_msgSend(v4, "containsObject:", v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  -[_DASDaemon suspendActivities:](self, "suspendActivities:", v5);

}

- (void)suspendActivities:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  dispatch_time_t v10;
  OS_dispatch_queue *evaluationQueue;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void **v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  unsigned int v24;
  dispatch_time_t v25;
  OS_dispatch_queue *v26;
  void **v27;
  void ***v28;
  void **v29;
  void **v30;
  void **v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[5];
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Suspending: %{public}@", buf, 0xCu);
    }

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000B0C18;
    v38[3] = &unk_10015FAF0;
    v6 = v4;
    v39 = v6;
    -[_DASDaemon allClientsDo:](self, "allClientsDo:", v38);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon connectedBGTaskClients](self, "connectedBGTaskClients"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[_DASDaemon warnBGTaskClientsForActivitiesAboutToExpire:](self, "warnBGTaskClientsForActivitiesAboutToExpire:", v6);
      v9 = objc_msgSend(v6, "copy");
      v10 = dispatch_time(0, 5000000000);
      evaluationQueue = self->_evaluationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B0C24;
      block[3] = &unk_10015D558;
      block[4] = self;
      v37 = v9;
      v12 = v9;
      dispatch_after(v10, (dispatch_queue_t)evaluationQueue, block);

    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v18, "requestsExtensionLaunch"))
            -[_DASDaemon suspendPlugin:](self, "suspendPlugin:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v15);
    }

    v19 = (void **)objc_msgSend(v13, "copy");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBootTimePolicy getDeviceBootTime](_DASBootTimePolicy, "getDeviceBootTime"));
    objc_msgSend(v20, "timeIntervalSinceDate:", v21);
    v23 = v22;

    v24 = +[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild");
    v25 = dispatch_time(0, 10000000000);
    v26 = self->_evaluationQueue;
    if (v24 && v23 >= 300.0)
    {
      v31 = _NSConcreteStackBlock;
      v27 = (void **)sub_1000B0FAC;
      v28 = &v31;
    }
    else
    {
      v30 = _NSConcreteStackBlock;
      v27 = (void **)sub_1000B151C;
      v28 = &v30;
    }
    v28[1] = (void **)3221225472;
    v28[2] = v27;
    v28[3] = (void **)&unk_10015D558;
    v28[4] = (void **)&self->super.isa;
    v28[5] = v19;
    v29 = v19;
    dispatch_after(v25, (dispatch_queue_t)v26, v28);

  }
}

- (void)activity:(id)a3 blockedOnPolicies:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B15C8;
  v8[3] = &unk_10015FC58;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[_DASDaemon allClientsDo:](self, "allClientsDo:", v8);

}

- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B1674;
  v8[3] = &unk_10015FC58;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[_DASDaemon allClientsDo:](self, "allClientsDo:", v8);

}

- (id)activityMatchingPredicate:(id)a3
{
  id v4;
  os_unfair_recursive_lock_s *p_activityStateLock;
  NSMutableSet *v6;
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
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_pendingTasks;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        if (objc_msgSend(v4, "evaluateWithObject:", v10, (_QWORD)v12))
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v7;
}

- (id)getActivityWithUUID:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self.uuid = %@"), a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon activityMatchingPredicate:](self, "activityMatchingPredicate:", v4));

  return v5;
}

- (id)getActivityWithName:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self.name = %@"), a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon activityMatchingPredicate:](self, "activityMatchingPredicate:", v4));

  return v5;
}

- (id)getActivityRunningWithName:(id)a3
{
  id v4;
  os_unfair_recursive_lock_s *p_activityStateLock;
  NSMutableSet *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_runningTasks;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name", (_QWORD)v17));
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14)
        {
          v15 = v12;

          v9 = v15;
        }
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v9;
}

- (id)getActivityRunningWithUUID:(id)a3
{
  id v4;
  os_unfair_recursive_lock_s *p_activityStateLock;
  NSMutableSet *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_runningTasks;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid", (_QWORD)v17));
        v14 = objc_msgSend(v13, "isEqual:", v4);

        if (v14)
        {
          v15 = v12;

          v9 = v15;
        }
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v9;
}

- (void)addConstraint:(unint64_t)a3 forSchedulingPriority:(unint64_t)a4
{
  os_unfair_lock_s *p_constraintsLock;
  unint64_t utilityConstraints;
  uint64_t v9;
  unint64_t maintenanceConstraints;
  void *v11;

  p_constraintsLock = &self->_constraintsLock;
  os_unfair_lock_lock(&self->_constraintsLock);
  if (_DASSchedulingPriorityBackground >= a4)
  {
    maintenanceConstraints = self->_maintenanceConstraints;
    if ((maintenanceConstraints & a3) == 0)
    {
      self->_maintenanceConstraints = maintenanceConstraints | a3;
      v9 = 528;
      goto LABEL_6;
    }
  }
  else
  {
    utilityConstraints = self->_utilityConstraints;
    if ((utilityConstraints & a3) == 0)
    {
      self->_utilityConstraints = utilityConstraints | a3;
      v9 = 520;
LABEL_6:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
      -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v11, *(Class *)((char *)&self->super.isa + v9));

    }
  }
  os_unfair_lock_unlock(p_constraintsLock);
}

- (void)removeConstraint:(unint64_t)a3 forSchedulingPriority:(unint64_t)a4
{
  os_unfair_lock_s *p_constraintsLock;
  unint64_t utilityConstraints;
  uint64_t v9;
  unint64_t maintenanceConstraints;
  void *v11;

  p_constraintsLock = &self->_constraintsLock;
  os_unfair_lock_lock(&self->_constraintsLock);
  if (_DASSchedulingPriorityBackground >= a4)
  {
    maintenanceConstraints = self->_maintenanceConstraints;
    if ((maintenanceConstraints & a3) != 0)
    {
      self->_maintenanceConstraints = maintenanceConstraints & ~a3;
      v9 = 528;
      goto LABEL_6;
    }
  }
  else
  {
    utilityConstraints = self->_utilityConstraints;
    if ((utilityConstraints & a3) != 0)
    {
      self->_utilityConstraints = utilityConstraints & ~a3;
      v9 = 520;
LABEL_6:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
      -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v11, *(Class *)((char *)&self->super.isa + v9));

    }
  }
  os_unfair_lock_unlock(p_constraintsLock);
}

- (void)updateiCPLTasksBlocked:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t photosIsBlocked;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  const __CFString *v21;
  void *v22;
  unsigned int v23;
  _CDLocalContext *context;
  NSObject *v25;
  NSObject *v26;
  double v27;
  int v28;
  double v29;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosIsBlocked](_DASPhotosPolicy, "keyPathForPhotosIsBlocked"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForBlockedStartDate](_DASPhotosPolicy, "keyPathForBlockedStartDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy keyPathForPhotosIsUnBlocked](_DASPhotosPolicy, "keyPathForPhotosIsUnBlocked"));
  v8 = v5;
  objc_sync_enter(v8);
  photosIsBlocked = self->_photosIsBlocked;
  if (a3)
  {
    if (!photosIsBlocked)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v10, v6);

    }
  }
  else if (photosIsBlocked)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v12, "timeIntervalSinceDate:", v11);
    v14 = v13;

    v15 = fmax(v14, 0.0);
    +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.dasd.icpl-blocked"), llround(v15));
    v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("stats")));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134217984;
      v29 = v15 / 60.0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "iCPL gated for %5.2f mins", (uint8_t *)&v28, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v17, v6);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v18, v8);
  v19 = a3 == 0;

  self->_photosIsBlocked = a3;
  objc_sync_exit(v8);

  v20 = v7;
  objc_sync_enter(v20);
  if (v19)
  {
    if (+[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:](_DASPhotosPolicy, "isPhotosSyncOverriddenWithContext:", self->_context))
    {
      -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", &off_10016ED98, v20);
      *(double *)&v21 = COERCE_DOUBLE(CFSTR("Sync Now Override"));
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](_DASPhotosPolicy, "policyInstance"));
      v23 = objc_msgSend(v22, "intentSyncIsEngaged");

      context = self->_context;
      if (v23)
      {
        -[_CDLocalContext setObject:forKeyedSubscript:](context, "setObject:forKeyedSubscript:", &off_10016EDB0, v20);
        *(double *)&v21 = COERCE_DOUBLE(CFSTR("Remote Device Intent"));
      }
      else
      {
        -[_CDLocalContext setObject:forKeyedSubscript:](context, "setObject:forKeyedSubscript:", &off_10016EDC8, v20);
        *(double *)&v21 = COERCE_DOUBLE(CFSTR("DAS"));
      }
    }
    v25 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = *(double *)&v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Reporting photos activity no longer blocked due to: %@", (uint8_t *)&v28, 0xCu);
    }

  }
  else
  {
    -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", &off_10016EDE0, v20);
  }
  v26 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", v20)));
    v28 = 138412290;
    v29 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Reporting photos activity unBlockedOptions: %@", (uint8_t *)&v28, 0xCu);

  }
  objc_sync_exit(v20);

}

- (void)reportActivity:(id)a3 isBlockedWithDecision:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  _DASRemoteDeviceActivityMonitor *remoteDeviceActivityMonitor;
  NSObject *v43;
  void *v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  unsigned __int8 v48;
  _DASDaemon *v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  char v55;
  char v56;
  BOOL v57;
  BOOL v58;
  BOOL v59;
  BOOL v60;
  char v61;
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;

  v6 = a3;
  if (!+[_DASPolicyResponse isPolicyDecisionProceedable:](_DASPolicyResponse, "isPolicyDecisionProceedable:", a4)&& +[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v6))
  {
    v49 = self;
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    v7 = v6;
    objc_sync_enter(v7);
    v8 = objc_alloc((Class)NSDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "policyResponseMetadata"));
    v10 = objc_msgSend(v8, "initWithDictionary:copyItems:", v9, 1);

    objc_sync_exit(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLowPowerModePolicy policyInstance](_DASLowPowerModePolicy, "policyInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "policyName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v12));
    v48 = objc_msgSend(v13, "reason");

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](_DASPhotosPolicy, "policyInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "policyName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v15));
    v47 = objc_msgSend(v16, "reason");

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](_DASPhotosPolicy, "policyInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "policyName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v18));
    v46 = objc_msgSend(v19, "reason");

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkQualityPolicy policyInstance](_DASNetworkQualityPolicy, "policyInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "policyName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v21));
    v45 = objc_msgSend(v22, "reason");

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkQualityPolicy policyInstance](_DASNetworkQualityPolicy, "policyInstance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "policyName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v24));
    v26 = objc_msgSend(v25, "reason");

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[_DASThermalPolicy policyInstance](_DASThermalPolicy, "policyInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "policyName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v28));
    v30 = ((unint64_t)objc_msgSend(v29, "reason") & 0x18) != 0;

    v31 = objc_claimAutoreleasedReturnValue(+[_DASRequiresPluggedInPolicy policyInstance](_DASRequiresPluggedInPolicy, "policyInstance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "policyName"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v32));
    v34 = objc_msgSend(v33, "reason");

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDeviceActivityPolicy policyInstance](_DASDeviceActivityPolicy, "policyInstance"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "policyName"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v36));
    LOBYTE(v31) = objc_msgSend(v37, "reason");

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000B2728;
    v52[3] = &unk_10015FC80;
    v55 = v48 & 1;
    v54 = &v63;
    v56 = v47 & 1;
    v57 = (v46 & 2) != 0;
    v58 = (v45 & 2) != 0;
    v59 = (v26 & 4) != 0;
    v38 = v10;
    v53 = v38;
    v60 = v30;
    v61 = v34 & 1;
    v62 = v31 & 1;
    objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v52);
    v39 = v64[3];
    if (v39 != v49->_photosIsBlocked)
    {
      if (v39)
      {
        v40 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v64[3]));
          *(_DWORD *)buf = 138412802;
          v68 = v41;
          v69 = 2114;
          v70 = v7;
          v71 = 2112;
          v72 = v38;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Reporting photos activity blocked: %@ %{public}@ %@", buf, 0x20u);

        }
        -[_DASDaemon updateiCPLTasksBlocked:](v49, "updateiCPLTasksBlocked:", v64[3]);
        if (_os_feature_enabled_impl("DAS", "photos_intent_sync")
          && +[_DASPhotosPolicy isPhotosSyncActivity:](_DASPhotosPolicy, "isPhotosSyncActivity:", v7)
          && +[_DASPhotosPolicy shouldOverrideForIntentSync:activity:](_DASPhotosPolicy, "shouldOverrideForIntentSync:activity:", v64[3], v7)&& !-[_DASRemoteDeviceActivityMonitor isRegistered](v49->_remoteDeviceActivityMonitor, "isRegistered"))
        {
          remoteDeviceActivityMonitor = v49->_remoteDeviceActivityMonitor;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1000B2DD4;
          v50[3] = &unk_10015D558;
          v50[4] = v49;
          v51 = v7;
          -[_DASRemoteDeviceActivityMonitor registerForRemoteDeviceActiveNotificationsWithChange:](remoteDeviceActivityMonitor, "registerForRemoteDeviceActiveNotificationsWithChange:", v50);

        }
      }
      else
      {
        v43 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v49->_photosIsBlocked));
          *(_DWORD *)buf = 138543874;
          v68 = v7;
          v69 = 2112;
          v70 = v38;
          v71 = 2112;
          v72 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Reporting photos activity no longer blocked: %{public}@ %@ (was %@)", buf, 0x20u);

        }
        -[_DASDaemon updateiCPLTasksBlocked:](v49, "updateiCPLTasksBlocked:", v64[3]);
        if (_os_feature_enabled_impl("DAS", "photos_intent_sync")
          && +[_DASPhotosPolicy isPhotosSyncActivity:](_DASPhotosPolicy, "isPhotosSyncActivity:", v7)
          && -[_DASRemoteDeviceActivityMonitor isRegistered](v49->_remoteDeviceActivityMonitor, "isRegistered"))
        {
          -[_DASRemoteDeviceActivityMonitor unregisterForRemoteDeviceActiveNotifications](v49->_remoteDeviceActivityMonitor, "unregisterForRemoteDeviceActiveNotifications");
        }
      }
    }

    _Block_object_dispose(&v63, 8);
  }

}

- (BOOL)testModeConstraintsApplyToActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  __objc2_class_ro **p_info;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __objc2_class_ro **v21;
  NSObject *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  unsigned int v26;
  id v27;
  NSObject *v29;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("activities")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Test Mode Applies To Activity: %@", buf, 0xCu);
    }
    v10 = 1;
    goto LABEL_27;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("activityClasses")));

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v12;
  v13 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (!v13)
  {
    v10 = 0;
    goto LABEL_26;
  }
  v14 = v13;
  v32 = v6;
  v33 = v4;
  v15 = *(_QWORD *)v35;
  p_info = &OBJC_METACLASS___AppKillsInfo.info;
  v17 = CFSTR("photos");
LABEL_7:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v15)
      objc_enumerationMutation(v9);
    v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v18);
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("icpl"), v32) & 1) != 0
      || objc_msgSend(v19, "isEqualToString:", v17))
    {
      if (objc_msgSend(p_info + 131, "isiCPLActivity:", v4))
      {
        v29 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        goto LABEL_23;
      }
      goto LABEL_13;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("network")))
      break;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v21 = p_info;
    v22 = v9;
    v23 = v20;
    v24 = v17;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lowercaseString"));
    v26 = objc_msgSend(v25, "containsString:", v19);

    v17 = v24;
    v9 = v22;
    p_info = v21;
    v4 = v33;
    if (v26)
    {
      v29 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      goto LABEL_24;
    }
LABEL_13:
    if (v14 == (id)++v18)
    {
      v27 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      v14 = v27;
      if (!v27)
      {
        v10 = 0;
        v6 = v32;
        goto LABEL_26;
      }
      goto LABEL_7;
    }
  }
  if (!objc_msgSend(v4, "requiresNetwork"))
    goto LABEL_13;
  v29 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
LABEL_23:
    *(_DWORD *)buf = 138412546;
    v39 = v19;
    v40 = 2112;
    v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Test Mode (%@) Applies To Activity: %@", buf, 0x16u);
  }
LABEL_24:
  v6 = v32;

  v10 = 1;
LABEL_26:

LABEL_27:
  return v10;
}

- (BOOL)testModeConstraintsRequireOverridingDecisionWithScores:(id)a3 ignoredPolicies:(id)a4 honoredPolicies:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("overrides")));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000B3594;
  v20[3] = &unk_10015FCA8;
  v13 = v12;
  v21 = v13;
  v14 = v8;
  v22 = v14;
  v15 = v9;
  v23 = v15;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v20);

  v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Ignored policies: %@", buf, 0xCu);
  }

  v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Honored policies: %@", buf, 0xCu);
  }

  v18 = objc_msgSend(v15, "count") == 0;
  return v18;
}

- (void)moveActivityToPrerunning:(id)a3
{
  id v4;
  _DASNetworkEvaluationMonitor *networkEvaluationMonitor;
  void *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  OS_dispatch_queue *evaluationQueue;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[_DASDaemon removeActivityFromTriggerMap:](self, "removeActivityFromTriggerMap:", v4);
  if (-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:](self->_networkEvaluationMonitor, "requiresNetworkPathMonitoring:", v4))
  {
    networkEvaluationMonitor = self->_networkEvaluationMonitor;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    -[_DASNetworkEvaluationMonitor stopMonitoringActivity:](networkEvaluationMonitor, "stopMonitoringActivity:", v6);

  }
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  -[NSMutableSet removeObject:](self->_pendingTasks, "removeObject:", v4);
  -[NSMutableSet addObject:](self->_prerunningTasks, "addObject:", v4);
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:](self, "recordToTaskRegistry:lifeCycleStateName:", v4, CFSTR("prerunning"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupName"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupName"));
    -[_DASDaemon addPrerunningActivity:toGroupWithName:](self, "addPrerunningActivity:toGroupWithName:", v4, v8);

  }
  v9 = dispatch_time(0, 61000000000);
  evaluationQueue = self->_evaluationQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B377C;
  v12[3] = &unk_10015D558;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_after(v9, (dispatch_queue_t)evaluationQueue, v12);

}

- (void)moveActivityToRunning:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  if (-[NSMutableSet containsObject:](self->_runningTasks, "containsObject:", v4))
  {
    os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  }
  else
  {
    -[NSMutableSet removeObject:](self->_prerunningTasks, "removeObject:", v4);
    -[NSMutableSet removeObject:](self->_pendingTasks, "removeObject:", v4);
    -[NSMutableSet count](self->_runningTasks, "count");
    -[NSMutableSet addObject:](self->_runningTasks, "addObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runningTasks")));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1000E9E2C();

    os_unfair_recursive_lock_unlock(&self->_activityStateLock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v4, "setStartDate:", v6);

    if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:](_DASCheckpointRecorder, "shouldLogCheckpointForActivity:", v4))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
      objc_msgSend(v7, "reportTaskCheckpoint:forTask:error:", 20, v4, 0);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupName"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupName"));
      -[_DASDaemon addRunningActivity:toGroupWithName:](self, "addRunningActivity:toGroupWithName:", v4, v9);

    }
    if ((objc_msgSend(v4, "requestsApplicationLaunch") & 1) == 0)
      -[_DASBudgetManager reportActivityRunning:](self->_budgetManager, "reportActivityRunning:", v4);
    if (objc_msgSend(v4, "isIntensive"))
      -[_DASFairScheduleManager activityStarted:](self->_fairScheduleManager, "activityStarted:", v4);
    if (objc_msgSend(v4, "userRequestedBackupTask"))
      -[_DASUserRequestedBackupTaskManager reportActivityRunning:](self->_backupTaskManager, "reportActivityRunning:", v4);
  }

}

- (void)beginWorkForActivity:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "requestsApplicationLaunch"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v6));
    -[_DASDaemon runApplicationLaunchActivities:](self, "runApplicationLaunchActivities:", v4);
  }
  else
  {
    v5 = objc_msgSend(v6, "requestsExtensionLaunch");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v6));
    if (v5)
      -[_DASDaemon runExtensionLaunchActivities:](self, "runExtensionLaunchActivities:", v4);
    else
      -[_DASDaemon runActivitiesAndRemoveUnknown:](self, "runActivitiesAndRemoveUnknown:", v4);
  }

}

- (void)immediatelyBeginWorkForActivity:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  uint8_t buf[4];
  id v9;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObjectsFrom:](NSMutableSet, "setWithObjectsFrom:", self->_prerunningTasks, self->_runningTasks, 0));
  v6 = objc_msgSend(v5, "containsObject:", v4);
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is already running, cannot begin work for it.", buf, 0xCu);
    }

  }
  else
  {
    -[_DASDaemon moveActivityToPrerunning:](self, "moveActivityToPrerunning:", v4);
    -[_DASDaemon beginWorkForActivity:](self, "beginWorkForActivity:", v4);
  }

}

- (void)computeStaticPriorityForActivity:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  signed int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = 999999999;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureCodes"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryForPlist:", 2));

    if (objc_msgSend(v7, "count"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureCodes", 0));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "stringValue"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));

            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("priority")));
            v16 = v15;
            if (v15)
              v17 = objc_msgSend(v15, "intValue");
            else
              v17 = 999999999;
            if (v3 >= v17)
              v3 = v17;

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

    }
  }
  objc_msgSend(v4, "setStaticPriority:", v3);

}

- (BOOL)validateConfigurationForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  unsigned int v15;
  NSObject *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASConfigurationLimiter shouldLimitActivityAtSubmission:](self->_configurationLimiter, "shouldLimitActivityAtSubmission:", v4));
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    -[_DASConfigurationLimiter limitedActivity:withLimitsResponses:](self->_configurationLimiter, "limitedActivity:withLimitsResponses:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "limitationResponse"));
    v8 = +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 4, v7);

    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
      if (!v9
        || (v10 = (void *)v9,
            v11 = -[_DASDaemon testModeConstraintsApplyToActivity:](self, "testModeConstraintsApplyToActivity:", v4),
            v10,
            (v11 & 1) == 0))
      {
        v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("ConfigurationLimiter")));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_1000E9E8C(v4, v16);
        v14 = 0;
        goto LABEL_17;
      }
      v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("ConfigurationLimiter")));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        sub_1000E9FA8();

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "limitationResponse"));
    v14 = 1;
    v15 = +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 1, v13);

    if (v15)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("ConfigurationLimiter")));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000E9F28(v4, v16);
      v14 = 1;
LABEL_17:

    }
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)startedActivities:(id)a3
{
  id v4;
  void *v5;
  _DASDaemon *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *evaluationQueue;
  NSObject *v13;
  _QWORD block[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.startedActivities");
  v6 = self;
  objc_sync_enter(v6);
  v7 = objc_autoreleasePoolPush();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        -[_DASDaemon moveActivityToRunning:](v6, "moveActivityToRunning:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v9);
  }

  objc_autoreleasePoolPop(v7);
  objc_sync_exit(v6);

  evaluationQueue = v6->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B42AC;
  block[3] = &unk_10015D4E0;
  block[4] = v6;
  dispatch_sync(evaluationQueue, block);
  v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Started activities: %{public}@", buf, 0xCu);
  }

}

- (void)submitActivities:(id)a3
{
  id v4;
  _DASDaemon *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  id v41;
  unsigned int v42;
  NSObject *v43;
  _DASBARScheduler *barScheduler;
  void *v45;
  void *v46;
  unsigned int v47;
  unsigned int v48;
  _DASBARScheduler *v49;
  void *v50;
  void *v51;
  void *v52;
  NSMutableDictionary *groups;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _DASNetworkEvaluationMonitor *networkEvaluationMonitor;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id obj;
  void *v81;
  os_unfair_lock_s *lock;
  uint64_t v83;
  id v84;
  void *v85;
  os_unfair_recursive_lock_s *p_activityStateLock;
  void *context;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  id v99;

  v4 = a3;
  v70 = os_transaction_create("com.apple.dasd.submitActivities");
  v5 = self;
  objc_sync_enter(v5);
  v72 = objc_autoreleasePoolPush();
  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v99 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Submitted activities: %{public}@", buf, 0xCu);
  }

  v7 = objc_msgSend(v4, "count");
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v7));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", -[NSMutableDictionary count](v5->_groups, "count")));
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v7));
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v7));
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v7));
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v7));
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
  if (v8)
  {
    v83 = *(_QWORD *)v93;
    v79 = _DASLaunchReasonBackgroundRemoteNotification;
    lock = &v5->_groupLock;
    p_activityStateLock = &v5->_activityStateLock;
    v76 = kNWEndpointKey;
    do
    {
      v84 = v8;
      for (i = 0; i != v84; i = (char *)i + 1)
      {
        if (*(_QWORD *)v93 != v83)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteDevice", v70));
        if (v11)
        {
          v12 = objc_msgSend(v10, "targetDevice") == (id)3;

          if (v12)
            -[_DASRemoteDeviceNearbyMonitor registerForRemoteDeviceWithActivity:](v5->_remoteDeviceNearbyMonitor, "registerForRemoteDeviceWithActivity:", v10);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteDevice"));
        if (v13)
        {
          v14 = objc_msgSend(v10, "requiresRemoteDeviceWake");

          if (v14)
            -[_DASRemoteDeviceWakeMonitor registerRemoteDeviceWakeStateWithActivity:](v5->_remoteDeviceWakeMonitor, "registerRemoteDeviceWakeStateWithActivity:", v10);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "diskVolume"));

        if (v15)
          -[_DASDiskSpaceMonitor registerForPurgeableSpaceWithActivity:](v5->_diskSpaceMonitor, "registerForPurgeableSpaceWithActivity:", v10);
        context = objc_autoreleasePoolPush();
        -[_DASDaemon clearActivityFromPrerunning:](v5, "clearActivityFromPrerunning:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "submitDate"));
        v17 = v16 == 0;

        if (v17)
          objc_msgSend(v10, "setSubmitDate:", v85);
        if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:](_DASCheckpointRecorder, "shouldLogCheckpointForActivity:", v10))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
          objc_msgSend(v18, "reportTaskCheckpoint:forTask:error:", 10, v10, 0);

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "featureCodes"));
        if (v19)
        {

        }
        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fastPass"));
          v21 = v20 == 0;

          if (v21)
            goto LABEL_24;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "featureCodes"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fastPass"));
        objc_msgSend(v22, "addFeatureCodesForTask:featureCodes:semanticVersion:", v23, v24, objc_msgSend(v25, "semanticVersion"));

LABEL_24:
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "producedResultIdentifiers"));
        if (v26)
        {

        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dependencies"));
          v28 = v27 == 0;

          if (v28)
            goto LABEL_35;
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dependencies"));
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v89;
          do
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(_QWORD *)v89 != v32)
                objc_enumerationMutation(v30);
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1)
                                                                                 + 8 * (_QWORD)j), "identifier"));
              objc_msgSend(v29, "addObject:", v34);

            }
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
          }
          while (v31);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "producedResultIdentifiers"));
        objc_msgSend(v35, "addDependencyInfoForTask:producedResultIdentifiers:dependencyIdentifiers:", v36, v37, v29);

LABEL_35:
        -[_DASDaemon computeStaticPriorityForActivity:](v5, "computeStaticPriorityForActivity:", v10);
        +[_DASConditionScore setActivityShouldBypassPredictions:](_DASConditionScore, "setActivityShouldBypassPredictions:", v10);
        -[_DASDaemon addTriggersToActivity:](v5, "addTriggersToActivity:", v10);
        if (objc_msgSend(v10, "requestsApplicationLaunch"))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "launchReason"));
          v39 = objc_msgSend(v38, "isEqualToString:", v79);

          if (v39)
          {
            v40 = objc_msgSend(v10, "isSilentPush");
            v41 = objc_msgSend(v10, "schedulingPriority");
            if ((unint64_t)v41 >= _DASSchedulingPriorityBackground)
              v42 = v40;
            else
              v42 = 0;
            if (v42 == 1)
            {
              v43 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relatedApplications"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "firstObject"));
                *(_DWORD *)buf = 138412290;
                v99 = v68;
                _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "High-priority silent push for %@", buf, 0xCu);

              }
              objc_msgSend(v75, "addObject:", v10);
              goto LABEL_75;
            }
            buf[0] = 0;
            barScheduler = v5->_barScheduler;
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relatedApplications"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));
            v47 = -[_DASBARScheduler pushLaunchAllowedForApp:immediately:](barScheduler, "pushLaunchAllowedForApp:immediately:", v46, buf);

            if (buf[0])
              v48 = v47;
            else
              v48 = 0;
            if (v48 == 1)
            {
              -[_DASDaemon addLaunchRequest:](v5, "addLaunchRequest:", v10);
              -[_DASDaemon immediatelyBeginWorkForActivity:](v5, "immediatelyBeginWorkForActivity:", v10);
              goto LABEL_75;
            }
            v49 = v5->_barScheduler;
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "relatedApplications"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "firstObject"));
            LODWORD(v49) = -[_DASBARScheduler isNewsstandApp:](v49, "isNewsstandApp:", v51);

            if ((_DWORD)v49)
              objc_msgSend(v10, "setRequestsNewsstandLaunch:", 1);
          }
          if (!-[_DASDaemon addLaunchRequest:](v5, "addLaunchRequest:", v10))
          {
            objc_msgSend(v75, "addObject:", v10);
            goto LABEL_75;
          }
        }
        if ((objc_msgSend(v10, "requestsApplicationLaunch") & 1) != 0
          || objc_msgSend(v10, "requestsExtensionLaunch"))
        {
          if (objc_msgSend(v10, "shouldBePersisted"))
            objc_msgSend(v74, "addObject:", v10);
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupName"));

          if (v52)
          {
            os_unfair_lock_lock(lock);
            groups = v5->_groups;
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupName"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groups, "objectForKeyedSubscript:", v54));

            if (v55)
            {
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
              objc_msgSend(v73, "setObject:forKey:", v55, v56);

            }
            os_unfair_lock_unlock(lock);

          }
        }
        if (objc_msgSend(v10, "userRequestedBackupTask"))
          -[_DASUserRequestedBackupTaskManager activitySubmitted:](v5->_backupTaskManager, "activitySubmitted:", v10);
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupName"));
        if (v57)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", v57));
          v59 = v58;
          if (v58)
          {
            objc_msgSend(v58, "addObject:", v10);
          }
          else
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v10));
            objc_msgSend(v81, "setObject:forKeyedSubscript:", v60, v57);

          }
        }
        +[_DASConditionScore computeOptimalScoreAndDateForActivity:](_DASConditionScore, "computeOptimalScoreAndDateForActivity:", v10);
        os_unfair_recursive_lock_lock_with_options(p_activityStateLock, 0);
        -[NSMutableSet addObject:](v5->_pendingTasks, "addObject:", v10);
        os_unfair_recursive_lock_unlock(p_activityStateLock);
        if (-[_DASDaemon shouldEvaluateTask:atDate:](v5, "shouldEvaluateTask:atDate:", v10, v85))
          objc_msgSend(v78, "addObject:", v10);
        if (-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:](v5->_networkEvaluationMonitor, "requiresNetworkPathMonitoring:", v10))
        {
          v61 = objc_autoreleasePoolPush();
          networkEvaluationMonitor = v5->_networkEvaluationMonitor;
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkEvaluationMonitor nwParametersForActivity:](_DASNetworkEvaluationMonitor, "nwParametersForActivity:", v10));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", v76));
          -[_DASNetworkEvaluationMonitor startMonitoringActivity:withNetworkParameters:withEndpoint:](networkEvaluationMonitor, "startMonitoringActivity:withNetworkParameters:withEndpoint:", v63, v64, v66);

          objc_autoreleasePoolPop(v61);
        }
        if (objc_msgSend(v10, "triggersRestart"))
          objc_msgSend(v77, "addObject:", v10);

LABEL_75:
        objc_autoreleasePoolPop(context);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
    }
    while (v8);
  }

  -[_DASDaemon addPendingActivitiesToGroups:](v5, "addPendingActivitiesToGroups:", v81);
  if (objc_msgSend(v74, "count"))
  {
    v69 = objc_autoreleasePoolPush();
    -[_DASDataStore saveActivities:](v5->_store, "saveActivities:", v74);
    objc_autoreleasePoolPop(v69);
  }
  -[_DASDaemon cancelActivities:](v5, "cancelActivities:", v75, v70);
  -[_DASDaemon evaluateScoreAndRunActivities:](v5, "evaluateScoreAndRunActivities:", v78);
  -[_DASDaemon determineNextTimerFireDateAndSchedule](v5, "determineNextTimerFireDateAndSchedule");

  objc_autoreleasePoolPop(v72);
  objc_sync_exit(v5);

}

- (void)handleRunningActivities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[_DASDaemon prepareActivityForStart:atTime:](self, "prepareActivityForStart:atTime:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), v5, (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)cleanupForActivity:(id)a3 wasCompleted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  __objc2_class **p_superclass;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _DASNetworkEvaluationMonitor *networkEvaluationMonitor;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  NSMutableDictionary *groupToPrerunningTasks;
  void *v27;
  void *v28;
  NSMutableDictionary *groupToPendingTasks;
  void *v30;
  void *v31;
  NSMutableDictionary *groupToRunningTasks;
  void *v33;
  void *v34;
  unsigned int v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSMutableDictionary *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  unint64_t v52;
  void *v53;
  unsigned __int8 v54;
  __CFString **v55;
  void *v56;
  unsigned int v57;
  id v58;
  unsigned int v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  double v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  unsigned int v75;
  void *v76;
  void *v77;
  void *v78;
  unsigned __int8 v79;
  void *v80;
  NSMutableDictionary *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  void *i;
  void *v90;
  OS_dispatch_queue *evaluationQueue;
  void **block;
  uint64_t v93;
  id (*v94)(uint64_t);
  void *v95;
  _DASDaemon *v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  uint8_t v103[128];
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  double v107;
  __int16 v108;
  id v109;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_72;
  p_superclass = _DASCPMModePolicy.superclass;
  if (objc_msgSend(v6, "requestsApplicationLaunch"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assertion"));
    v102 = 0;
    v10 = objc_msgSend(v9, "invalidateWithError:", &v102);
    v11 = v102;

    if ((v10 & 1) == 0 && v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1000EA008();

    }
  }
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v13 = -[NSMutableSet count](self->_runningTasks, "count");
  -[NSMutableSet removeObject:](self->_runningTasks, "removeObject:", v7);
  -[NSMutableSet removeObject:](self->_pendingTasks, "removeObject:", v7);
  -[NSMutableSet removeObject:](self->_prerunningTasks, "removeObject:", v7);
  -[_DASDaemon removeActivityFromNestedMaps:](self, "removeActivityFromNestedMaps:", v7);
  if (v13)
    -[NSMutableSet count](self->_runningTasks, "count");
  v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runningTasks")));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_1000E9E2C();

  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  -[_DASDaemon releaseAssertion:](self, "releaseAssertion:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
  objc_msgSend(v15, "recordActivity:", v7);

  -[_DASDaemon reportOversizeLoadSymptomForActivity:atStart:](self, "reportOversizeLoadSymptomForActivity:atStart:", v7, 0);
  if ((objc_msgSend(v7, "requestsApplicationLaunch") & 1) == 0)
    -[_DASBudgetManager reportActivityNoLongerRunning:](self->_budgetManager, "reportActivityNoLongerRunning:", v7);
  -[_DASActivityDependencyManager endDependencyMonitoringForActivity:](self->_dependencyManager, "endDependencyMonitoringForActivity:", v7);
  if (-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:](self->_networkEvaluationMonitor, "requiresNetworkPathMonitoring:", v7))
  {
    networkEvaluationMonitor = self->_networkEvaluationMonitor;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
    -[_DASNetworkEvaluationMonitor stopMonitoringActivity:](networkEvaluationMonitor, "stopMonitoringActivity:", v17);

  }
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteDevice"));
  if (v18)
  {
    v19 = (void *)v18;
    v20 = objc_msgSend(v7, "targetDevice");

    if (v20 == (id)3)
      -[_DASRemoteDeviceNearbyMonitor unregisterForRemoteDeviceWithActivity:](self->_remoteDeviceNearbyMonitor, "unregisterForRemoteDeviceWithActivity:", v7);
  }
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteDevice"));
  if (v21)
  {
    v22 = (void *)v21;
    v23 = objc_msgSend(v7, "requiresRemoteDeviceWake");

    if (v23)
      -[_DASRemoteDeviceWakeMonitor unregisterRemoteDeviceWakeStateWithActivity:](self->_remoteDeviceWakeMonitor, "unregisterRemoteDeviceWakeStateWithActivity:", v7);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "diskVolume"));

  if (v24)
    -[_DASDiskSpaceMonitor unregisterForPurgeableSpaceWithActivity:](self->_diskSpaceMonitor, "unregisterForPurgeableSpaceWithActivity:", v7);
  -[_DASActivityRateLimitManager completeActivity:](self->_rateLimiter, "completeActivity:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));

  if (!v25)
    goto LABEL_35;
  os_unfair_lock_lock(&self->_groupLock);
  groupToPrerunningTasks = self->_groupToPrerunningTasks;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groupToPrerunningTasks, "objectForKeyedSubscript:", v27));
  objc_msgSend(v28, "removeObject:", v7);

  groupToPendingTasks = self->_groupToPendingTasks;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groupToPendingTasks, "objectForKeyedSubscript:", v30));
  objc_msgSend(v31, "removeObject:", v7);

  groupToRunningTasks = self->_groupToRunningTasks;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groupToRunningTasks, "objectForKeyedSubscript:", v33));
  v35 = objc_msgSend(v34, "containsObject:", v7);

  if (!v35)
  {
    os_unfair_lock_unlock(&self->_groupLock);
LABEL_35:
    v47 = 0;
    goto LABEL_36;
  }
  v36 = self->_groupToRunningTasks;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v37));
  objc_msgSend(v38, "removeObject:", v7);

  v39 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle(activityGroup)")));
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
    v41 = self->_groupToRunningTasks;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", v42));
    v44 = objc_msgSend(v43, "count");
    *(_DWORD *)buf = 138543874;
    v105 = v7;
    v106 = 2112;
    v107 = *(double *)&v40;
    v108 = 2048;
    v109 = v44;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NO LONGER RUNNING %{public}@ ...Tasks running in group [%@] are %ld!", buf, 0x20u);

  }
  os_unfair_lock_unlock(&self->_groupLock);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
  if (objc_msgSend(v45, "isEqualToString:", _DASDefaultGroupName))
    goto LABEL_32;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
  if (objc_msgSend(v46, "isEqualToString:", _DASDefaultNetworkGroupName))
  {

LABEL_32:
LABEL_33:
    v47 = 1;
    goto LABEL_36;
  }
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
  v79 = objc_msgSend(v78, "isEqualToString:", _DASDefaultRemoteGroupName);

  if ((v79 & 1) != 0)
    goto LABEL_33;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  os_unfair_lock_lock(&self->_groupLock);
  v81 = self->_groupToPendingTasks;
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", v82));
  v84 = objc_msgSend(v83, "copy");

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v85 = v84;
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v87; i = (char *)i + 1)
      {
        if (*(_QWORD *)v99 != v88)
          objc_enumerationMutation(v85);
        v90 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v90, "isIntensive") & 1) == 0)
          objc_msgSend(v80, "addObject:", v90);
      }
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
    }
    while (v87);
  }

  os_unfair_lock_unlock(&self->_groupLock);
  if (objc_msgSend(v80, "count"))
  {
    evaluationQueue = self->_evaluationQueue;
    block = _NSConcreteStackBlock;
    v93 = 3221225472;
    v94 = sub_1000B593C;
    v95 = &unk_10015D558;
    v96 = self;
    v97 = v80;
    dispatch_async((dispatch_queue_t)evaluationQueue, &block);

  }
  v47 = 1;
  p_superclass = (__objc2_class **)(_DASCPMModePolicy + 8);
LABEL_36:
  if ((objc_msgSend(v7, "requestsApplicationLaunch") & 1) != 0
    || objc_msgSend(v7, "requestsExtensionLaunch"))
  {
    -[_DASDaemon removeLaunchRequest:](self, "removeLaunchRequest:", v7);
    if (objc_msgSend(v7, "shouldBePersisted"))
      -[_DASDataStore deleteActivity:](self->_store, "deleteActivity:", v7);
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (objc_msgSend(v7, "isIntensive"))
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));

    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
      objc_msgSend(v48, "timeIntervalSinceDate:", v50);
      v52 = llround(v51 / 60.0);

      +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.runtimemins.intensive"), v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.photoanalysisd.backgroundanalysis"));

      if ((v54 & 1) != 0)
      {
        v55 = &off_10015F2E8;
      }
      else
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
        v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("com.apple.mediaanalysisd.fullanalysis"));

        if (!v57)
          goto LABEL_47;
        v55 = &off_10015F2F0;
      }
      +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", *v55, v52);
LABEL_47:
      v58 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
      v59 = objc_msgSend(v58, "BOOLForKey:", CFSTR("postIntensiveActivityNotifications"));

      if (v59)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suspendRequestDate"));

        if (v60)
          v61 = CFSTR("Intensive Activity Suspended");
        else
          v61 = CFSTR("Intensive Activity Completed");
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
        objc_msgSend(v48, "timeIntervalSinceDate:", v63);
        if (v4)
          v65 = CFSTR("%@ completed after running for %.0f minutes");
        else
          v65 = CFSTR("%@ deferred after running for %.0f minutes");
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v65, v62, v64 / 60.0, block, v93, v94, v95, v96));

        -[_DASNotificationManager postNotificationAtDate:withTitle:withTextContent:icon:url:expirationDate:](self->_notificationManager, "postNotificationAtDate:withTitle:withTextContent:icon:url:expirationDate:", 0, v61, v66, 0, 0, 0);
      }
    }
  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));

  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    objc_msgSend(v48, "timeIntervalSinceDate:", v68);
    v70 = v69 / 60.0;

    if (v70 > 60.0)
    {
      v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 224, "logForCategory:", CFSTR("lifecycle")));
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v105 = v7;
        v106 = 2048;
        v107 = v70;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ ran for %lf minutes", buf, 0x16u);
      }

    }
  }
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
  if (v72)
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suspendRequestDate"));
    if (v73)
    {

LABEL_68:
      goto LABEL_69;
    }
  }
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUrgencyOverridePolicy policyInstance](_DASUrgencyOverridePolicy, "policyInstance"));
  v75 = objc_msgSend(v74, "appliesToActivity:", v7);

  if (v72)
  {

    if ((v75 & 1) == 0)
      goto LABEL_69;
    goto LABEL_67;
  }
  if (v75)
  {
LABEL_67:
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUrgencyOverridePolicy policyInstance](_DASUrgencyOverridePolicy, "policyInstance"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    objc_msgSend(v76, "removeActivity:", v77);

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](_DASPhotosPolicy, "policyInstance"));
    objc_msgSend(v72, "setIntentSyncIsEngaged:", 0);
    goto LABEL_68;
  }
LABEL_69:
  -[_DASDaemon logLimitations:](self, "logLimitations:", v7);
  if (v47)
    -[_DASBatchingQueue addWorkItem:](self->_activityCompletedBatchingQueue, "addWorkItem:", v7);

LABEL_72:
}

- (void)removeActivityFromNestedMaps:(id)a3
{
  id v4;

  v4 = a3;
  -[_DASDaemon removeActivityFromTriggerMap:](self, "removeActivityFromTriggerMap:", v4);
  -[_DASDaemon removeActivityFromGroupToPendingTasks:](self, "removeActivityFromGroupToPendingTasks:", v4);
  -[_DASDaemon removeActivityFromIncompatibleActivitiesMap:](self, "removeActivityFromIncompatibleActivitiesMap:", v4);

}

- (void)removeActivityFromGroupToPendingTasks:(id)a3
{
  id v4;
  os_unfair_lock_s *p_groupLock;
  NSMutableDictionary *groupToPendingTasks;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  groupToPendingTasks = self->_groupToPendingTasks;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B5A38;
  v8[3] = &unk_10015FAC8;
  v9 = v4;
  v7 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](groupToPendingTasks, "enumerateKeysAndObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(p_groupLock);

}

- (void)removeActivityFromIncompatibleActivitiesMap:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *activityToIncompatibleActivitiesMap;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = self->_activityToIncompatibleActivitiesMap;
  objc_sync_enter(v5);
  activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B5B00;
  v8[3] = &unk_10015FAC8;
  v7 = v4;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activityToIncompatibleActivitiesMap, "enumerateKeysAndObjectsUsingBlock:", v8);

  objc_sync_exit(v5);
}

- (void)activityStarted:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSMutableSet *prerunningTasks;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  OS_dispatch_queue *evaluationQueue;
  _QWORD block[5];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;

  v4 = a3;
  if (objc_msgSend(v4, "delayedStart"))
  {
    v5 = (void *)os_transaction_create("com.apple.dasd.activityStarted");
    v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortDescription"));
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "STARTING %{public}@!", buf, 0xCu);

    }
    os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
    prerunningTasks = self->_prerunningTasks;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000B5D8C;
    v18[3] = &unk_10015FD38;
    v9 = v4;
    v19 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet objectsPassingTest:](prerunningTasks, "objectsPassingTest:", v18));
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));
      objc_msgSend(v9, "reconcileWithActivity:", v11);

    }
    -[_DASDaemon createAssertion:](self, "createAssertion:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon currentReportingConditions](self, "currentReportingConditions"));
    objc_msgSend(v9, "setStartConditions:", v12);

    os_unfair_recursive_lock_unlock(&self->_activityStateLock);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
    objc_msgSend(v13, "recordActivityLifeCycleStart:", v9);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
    -[_DASDaemon handleRunningActivities:](self, "handleRunningActivities:", v14);

    -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:](self, "recordToTaskRegistry:lifeCycleStateName:", v9, CFSTR("started"));
    if ((objc_msgSend(v9, "wasForceRun") & 1) == 0)
    {
      evaluationQueue = self->_evaluationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B5DFC;
      block[3] = &unk_10015D558;
      block[4] = self;
      v17 = v9;
      dispatch_sync((dispatch_queue_t)evaluationQueue, block);

    }
  }

}

- (id)currentReportingConditions
{
  int64_t v3;
  _CDLocalContext *context;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  _UNKNOWN **v12;
  void *v13;
  void *v14;
  _CDLocalContext *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _UNKNOWN **v19;
  _CDLocalContext *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _UNKNOWN **v24;
  void *v25;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[6];
  _QWORD v31[6];

  v29 = 0;
  v3 = +[_DASNetworkQualityPolicy currentNetworkQualityWithContext:interface:](_DASNetworkQualityPolicy, "currentNetworkQualityWithContext:interface:", self->_context, &v29);
  context = self->_context;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v5));

  v30[0] = CFSTR("batteryLevel");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryPercentageKey](_CDContextQueries, "batteryPercentageKey"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v28));
  v8 = (void *)v7;
  if (v7)
    v9 = (_UNKNOWN **)v7;
  else
    v9 = &off_10016EDF8;
  v31[0] = v9;
  v30[1] = CFSTR("onCharger");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryExternalConnectedKey](_CDContextQueries, "batteryExternalConnectedKey"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v27));
  v11 = (void *)v10;
  if (v10)
    v12 = (_UNKNOWN **)v10;
  else
    v12 = &off_10016EDF8;
  v31[1] = v12;
  v30[2] = CFSTR("nwInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v29));
  v31[2] = v13;
  v30[3] = CFSTR("nwQuality");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v3));
  v31[3] = v14;
  v30[4] = CFSTR("idle");
  v15 = self->_context;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v17 = objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16));
  v18 = (void *)v17;
  if (v17)
    v19 = (_UNKNOWN **)v17;
  else
    v19 = &off_10016EDF8;
  v31[4] = v19;
  v30[5] = CFSTR("thermalLevel");
  v20 = self->_context;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForThermalPressureLevel](_CDContextQueries, "keyPathForThermalPressureLevel"));
  v22 = objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v21));
  v23 = (void *)v22;
  if (v22)
    v24 = (_UNKNOWN **)v22;
  else
    v24 = &off_10016EDF8;
  v31[5] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 6));

  return v25;
}

- (void)logLimitations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  if ((objc_msgSend(v4, "requestsApplicationLaunch") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    if (v5)
    {

    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "limitationResponse"));
      if (!v10)
        goto LABEL_8;
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "limitationResponse"));
      v13 = objc_msgSend(v12, "count");

      if (!v13)
        goto LABEL_8;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B6260;
    v16[3] = &unk_10015DA30;
    v6 = v4;
    v17 = v6;
    AnalyticsSendEventLazy(CFSTR("com.apple.dasd.limitationDistribution"), v16);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = -[_DASRuntimeLimiter limitsApplyToActivity:](self->_runtimeLimiter, "limitsApplyToActivity:", v6);

      if (v9)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000B64B0;
        v14[3] = &unk_10015FD60;
        v14[4] = self;
        v15 = v6;
        AnalyticsSendEventLazy(CFSTR("com.apple.dasd.runtimeLimits"), v14);

      }
    }

  }
LABEL_8:

}

- (id)activityAnalyticsWithActivity:(id)a3 didComplete:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  _UNKNOWN **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  double v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  _UNKNOWN **v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _UNKNOWN **v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  unsigned int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  __CFString *v110;
  _QWORD v111[20];
  _QWORD v112[20];

  v4 = a4;
  v6 = a3;
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = (uint64_t)v10;

  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startConditions"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon currentReportingConditions](self, "currentReportingConditions"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  if ((-[__CFString hasPrefix:](v12, "hasPrefix:", CFSTR("com.apple.CFNetwork-cc")) & 1) != 0)
  {
    v13 = CFSTR("com.apple.CFNetwork");
  }
  else
  {
    if (!-[__CFString containsString:](v12, "containsString:", CFSTR("x-coredata")))
    {
      v110 = v12;
      goto LABEL_7;
    }
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v12, "substringWithRange:", 0, -[__CFString rangeOfString:](v12, "rangeOfString:", CFSTR(".x-coredata"))));
  }

  v110 = (__CFString *)v13;
LABEL_7:
  v14 = 0;
  while (1)
  {
    objc_msgSend(v6, "interval");
    v16 = qword_10011D5A8[v14];
    if (v16 == (uint64_t)v15)
      break;
    objc_msgSend(v6, "interval");
    if (v17 < (double)v16)
      break;
    if (++v14 == 120)
      goto LABEL_13;
  }
  v18 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:"));
  if (v18)
    goto LABEL_14;
LABEL_13:
  v18 = &off_10016EE28;
LABEL_14:
  v109 = v18;
  v19 = 0;
  while (1)
  {
    v20 = qword_10011D5A8[v19];
    if (v20 == v11)
      break;
    if (v20 > v11)
    {
      v21 = v20 - 1;
      goto LABEL_21;
    }
    if (++v19 == 120)
      goto LABEL_22;
  }
  v21 = v11;
LABEL_21:
  v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v21));
  if (v22)
    goto LABEL_23;
LABEL_22:
  v22 = &off_10016EE28;
LABEL_23:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
  objc_msgSend(v23, "timeIntervalSinceDate:", v24);
  v26 = llround(v25);
  v27 = v26;

  if (v26 < 1)
  {
    v31 = 120;
    v32 = v22;
    while (1)
    {
      if (!v31)
      {
        v36 = 0;
        goto LABEL_41;
      }
      if (!(v26 + qword_10011D5A8[v31 - 1]))
        break;
      v33 = qword_10011D5A8[v31--];
      if (v33 < -(uint64_t)v26)
      {
        v34 = 1 - v33;
        goto LABEL_40;
      }
    }
    v34 = -qword_10011D5A8[v31];
LABEL_40:
    v36 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v34));
LABEL_41:

    v29 = &off_10016EDF8;
  }
  else
  {
    v28 = 0;
    v29 = v22;
    while (1)
    {
      v30 = qword_10011D5A8[v28];
      if (v30 == v27)
        break;
      if (v30 > v27)
      {
        v35 = v30 - 1;
        goto LABEL_36;
      }
      if (++v28 == 120)
        goto LABEL_37;
    }
    v35 = v27;
LABEL_36:
    v36 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v35));
    if (v36)
      goto LABEL_42;
LABEL_37:
    v36 = &off_10016EE28;
  }
LABEL_42:
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startAfter"));
  objc_msgSend(v37, "timeIntervalSinceDate:", v38);
  v40 = round(v39 / (double)v11 * 5.0) * 20.0;

  v41 = 1000.0;
  if (v40 <= 1000.0)
    v41 = v40;
  v42 = fmax(v41, 0.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "components:fromDate:", 28, v7));
  v102 = v43;
  v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "dateFromComponents:", v44));

  v101 = (void *)v45;
  objc_msgSend(v7, "timeIntervalSinceDate:", v45);
  v97 = (int)(v46 / 3600.0) % 24;
  v112[0] = v110;
  v111[0] = CFSTR("Name");
  v111[1] = CFSTR("Priority");
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "schedulingPriority")));
  v112[1] = v100;
  v111[2] = CFSTR("RuntimeMins");
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  v107 = v7;
  if (v99)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v108);
    v48 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v47 / 60.0)));
  }
  else
  {
    v48 = &stru_1001617C8;
  }
  v112[2] = v48;
  v112[3] = v109;
  v111[3] = CFSTR("Interval");
  v111[4] = CFSTR("Completed");
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4, v48));
  v112[4] = v98;
  v111[5] = CFSTR("Backlogged");
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "backlogged")));
  v112[5] = v96;
  v111[6] = CFSTR("AppLaunch");
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "requestsApplicationLaunch")));
  v112[6] = v95;
  v111[7] = CFSTR("LaunchType");
  v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchReason"));
  v94 = (void *)v49;
  if (v49)
    v50 = (const __CFString *)v49;
  else
    v50 = &stru_1001617C8;
  v112[7] = v50;
  v111[8] = CFSTR("SuspendRequested");
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suspendRequestDate"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v93 != 0));
  v112[8] = v92;
  v111[9] = CFSTR("RequiresInactivity");
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "requiresDeviceInactivity")));
  v112[9] = v91;
  v111[10] = CFSTR("RequiresPlugin");
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "requiresPlugin")));
  v112[10] = v90;
  v111[11] = CFSTR("RequiresInexpensive");
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "requiresInexpensiveNetworking")));
  v112[11] = v51;
  v111[12] = CFSTR("RequiresNetworking");
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "requiresNetwork")));
  v112[12] = v52;
  v111[13] = CFSTR("IsIntensive");
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isIntensive")));
  v112[13] = v53;
  v112[14] = v29;
  v103 = v36;
  v104 = v29;
  v111[14] = CFSTR("TimeWindow");
  v111[15] = CFSTR("DeadlineDelta");
  v112[15] = v36;
  v111[16] = CFSTR("DeadlinePct");
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v42));
  v112[16] = v54;
  v111[17] = CFSTR("DeadlinePctHist");
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v42));
  v112[17] = v55;
  v111[18] = CFSTR("RecentlyUpdated");
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[_DASConfig hasRecentlyUpdated](_DASConfig, "hasRecentlyUpdated")));
  v112[18] = v56;
  v111[19] = CFSTR("TimeSlot");
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v97));
  v112[19] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v112, v111, 20));
  v59 = objc_msgSend(v58, "mutableCopy");

  if (v99)
  if (objc_msgSend(v6, "lastDenialValue"))
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[_DASConditionScore lastDenialResponses:](_DASConditionScore, "lastDenialResponses:", v6));
    if (objc_msgSend(v60, "count"))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v60));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "anyObject"));
      objc_msgSend(v59, "setObject:forKeyedSubscript:", v62, CFSTR("SuspensionReason"));

    }
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("batteryLevel")));

  if (v63)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("batteryLevel")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v64, CFSTR("StartBatteryLevel"));

  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("nwInterface")));

  if (v65)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("nwInterface")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v66, CFSTR("StartNWInterface"));

  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("nwQuality")));

  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("nwQuality")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v68, CFSTR("StartNWQuality"));

  }
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("onCharger")));

  if (v69)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("onCharger")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v70, CFSTR("StartedOnCharger"));

  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("idle")));

  if (v71)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("idle")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v72, CFSTR("StartIdle"));

  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("thermalLevel")));

  if (v73)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("thermalLevel")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v74, CFSTR("EndingThermalPressure"));

  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("batteryLevel")));

  if (v75)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("batteryLevel")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v76, CFSTR("EndBatteryLevel"));

  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("nwInterface")));

  if (v77)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("nwInterface")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v78, CFSTR("EndNWInterface"));

  }
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("nwQuality")));

  if (v79)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("nwQuality")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v80, CFSTR("EndNWQuality"));

  }
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("onCharger")));

  if (v81)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("onCharger")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v82, CFSTR("EndedOnCharger"));

  }
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("idle")));

  if (v83)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("idle")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v84, CFSTR("EndIdle"));

  }
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("thermalLevel")));

  if (v85)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("thermalLevel")));
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v86, CFSTR("EndingThermalPressure"));

  }
  v87 = objc_msgSend(v59, "copy");

  return v87;
}

- (void)updateActivity:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSMutableSet *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  os_unfair_recursive_lock_s *p_activityStateLock;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = a4;
  -[_DASBudgetManager reportUpdateForActivity:withDataConsumed:](self->_budgetManager, "reportUpdateForActivity:withDataConsumed:", v6, v7);
  v8 = _DASUpdateActivityPercentCompletedKey;
  v21 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", _DASUpdateActivityPercentCompletedKey));

  if (v9)
  {
    p_activityStateLock = &self->_activityStateLock;
    os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = self->_runningTasks;
    v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid", p_activityStateLock));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v8));
            objc_msgSend(v19, "doubleValue");
            objc_msgSend(v15, "setPercentCompleted:");

          }
        }
        v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    os_unfair_recursive_lock_unlock(p_activityStateLock);
  }

}

- (void)_resetWidgetBudgets
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[_DASWidgetRefreshBudgetManager sharedInstance](_DASWidgetRefreshBudgetManager, "sharedInstance"));
  objc_msgSend(v2, "resetBudgets");

}

- (void)updateSystemConstraintsWithParameters:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = kDASSystemContextKeyHeavyDiskUsage;
  v5 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kDASSystemContextNonDASCriticalWorkloadRunning));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kDASSystemContextGPWorkloadRunningState));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kDASSystemContextMCWorkloadRunningState));

  if (v12)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCustomSystemConstraintsPolicy policyInstance](_DASCustomSystemConstraintsPolicy, "policyInstance"));
    objc_msgSend(v9, "updateSystemConstraint:withState:withDaemon:", kDASSystemContextKeyHeavyDiskUsage, objc_msgSend(v12, "BOOLValue"), 0);
LABEL_5:

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon tasksNoLongerEligible](self, "tasksNoLongerEligible"));
    -[_DASDaemon suspendActivities:](self, "suspendActivities:", v10);
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFastPassPolicy policyInstance](_DASFastPassPolicy, "policyInstance"));
    objc_msgSend(v9, "updateFastPassShallYield:", objc_msgSend(v6, "BOOLValue"));
    goto LABEL_5;
  }
  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCustomSystemConstraintsPolicy policyInstance](_DASCustomSystemConstraintsPolicy, "policyInstance"));
    objc_msgSend(v11, "updateSystemConstraint:withState:withDaemon:", kDASSystemContextGPWorkloadRunningState, objc_msgSend(v7, "BOOLValue"), self);

  }
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCustomSystemConstraintsPolicy policyInstance](_DASCustomSystemConstraintsPolicy, "policyInstance"));
    objc_msgSend(v10, "updateSystemConstraint:withState:withDaemon:", kDASSystemContextMCWorkloadRunningState, objc_msgSend(v8, "BOOLValue"), self);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)addPrerunningActivity:(id)a3 toGroupWithName:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_groupLock;
  void *v9;
  void *v10;
  NSMutableDictionary *groupToPrerunningTasks;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToPendingTasks, "objectForKeyedSubscript:", v7));
  objc_msgSend(v9, "removeObject:", v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToPrerunningTasks, "objectForKeyedSubscript:", v7));
  if (!v10)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    groupToPrerunningTasks = self->_groupToPrerunningTasks;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](groupToPrerunningTasks, "setObject:forKeyedSubscript:", v10, v12);

  }
  objc_msgSend(v10, "_DAS_addOrReplaceObject:", v6);
  v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle(activityGroup)")));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412802;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2048;
    v19 = objc_msgSend(v10, "count");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "With %@ ...Tasks pre-running in group [%@] are %ld!", (uint8_t *)&v14, 0x20u);
  }

  os_unfair_lock_unlock(p_groupLock);
}

- (void)addRunningActivity:(id)a3 toGroupWithName:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_groupLock;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *groupToRunningTasks;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToPrerunningTasks, "objectForKeyedSubscript:", v7));
  objc_msgSend(v9, "removeObject:", v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToPendingTasks, "objectForKeyedSubscript:", v7));
  objc_msgSend(v10, "removeObject:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groupToRunningTasks, "objectForKeyedSubscript:", v7));
  if (!v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    groupToRunningTasks = self->_groupToRunningTasks;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](groupToRunningTasks, "setObject:forKeyedSubscript:", v11, v13);

  }
  objc_msgSend(v11, "_DAS_addOrReplaceObject:", v6);
  v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle(activityGroup)")));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412802;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2048;
    v20 = objc_msgSend(v11, "count");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "With %@ ...Tasks running in group [%@] are %ld!", (uint8_t *)&v15, 0x20u);
  }

  os_unfair_lock_unlock(p_groupLock);
}

- (void)addPendingActivitiesToGroups:(id)a3
{
  os_unfair_lock_s *p_groupLock;
  id v5;
  _QWORD v6[5];

  p_groupLock = &self->_groupLock;
  v5 = a3;
  os_unfair_lock_lock(p_groupLock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B7D68;
  v6[3] = &unk_10015FAC8;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

  os_unfair_lock_unlock(p_groupLock);
}

- (void)submitActivity:(id)a3 inGroup:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _DASDaemon *v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  void *v26;
  void *v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *i;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  unsigned int v54;
  unsigned int v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _DASBARScheduler *barScheduler;
  void *v63;
  void *v64;
  unsigned int v65;
  unsigned int v66;
  id v67;
  _DASBARScheduler *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  unsigned int v76;
  void *v77;
  _DASNetworkEvaluationMonitor *networkEvaluationMonitor;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *evaluationQueue;
  id v84;
  id v85;
  NSObject *timerSchedulingQueue;
  id v87;
  id v88;
  NSObject *v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  id v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *context;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[4];
  id v107;
  id v108;
  _DASDaemon *v109;
  _BYTE *v110;
  _QWORD block[4];
  id v112;
  _DASDaemon *v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint8_t v119[128];
  _BYTE buf[24];
  uint64_t (*v121)(uint64_t, uint64_t);
  _BYTE v122[20];
  const __CFString *v123;
  void *v124;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v105 = (void *)os_transaction_create("com.apple.dasd.submitActivity");
  v104 = v9;
  if (!-[_DASDaemon validateConfigurationForActivity:](self, "validateConfigurationForActivity:", v8))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", _DASActivitySchedulerErrorDomain, 3, &off_10016F5D8));
    v10[2](v10, 0, v17);

    goto LABEL_92;
  }
  if (v9)
  {
    -[_DASDaemon createActivityGroup:](self, "createActivityGroup:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    objc_msgSend(v8, "setGroupName:", v11);

  }
  if (!-[_DASRuntimeLimiter featureHasNoRemainingRuntimeForActivity:](self->_runtimeLimiter, "featureHasNoRemainingRuntimeForActivity:", v8))
  {
    v18 = self;
    objc_sync_enter(v18);
    context = objc_autoreleasePoolPush();
    -[_DASActivityRateLimitManager submitActivity:](v18->_rateLimiter, "submitActivity:", v8);
    objc_msgSend(v8, "interval");
    if (v19 <= 0.0)
    {
      if (+[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild"))
      {
        v20 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_16:
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugDescription"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Submitted: %@", buf, 0xCu);

        }
      }
      else
      {
        v20 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "schedulingPriority")));
          v28 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startAfter"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startBefore"));
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v27;
          *(_WORD *)&buf[22] = 2114;
          v121 = v28;
          *(_WORD *)v122 = 2114;
          *(_QWORD *)&v122[2] = v29;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Submitted: %{public}@ at priority %{public}@ (%{public}@ - %{public}@)", buf, 0x2Au);

        }
      }
    }
    else
    {
      if (+[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild"))
      {
        v20 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        goto LABEL_16;
      }
      v20 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "schedulingPriority")));
        objc_msgSend(v8, "interval");
        v24 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startAfter"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startBefore"));
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2048;
        v121 = v24;
        *(_WORD *)v122 = 2114;
        *(_QWORD *)&v122[2] = v25;
        *(_WORD *)&v122[10] = 2114;
        *(_QWORD *)&v122[12] = v26;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Submitted: %{public}@ at priority %{public}@ with interval %.0f (%{public}@ - %{public}@)", buf, 0x34u);

      }
    }
LABEL_24:

    +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.submitcount.all"), 1);
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "submitDate"));
    v31 = v30 == 0;

    if (v31)
      objc_msgSend(v8, "setSubmitDate:", v103);
    if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:](_DASCheckpointRecorder, "shouldLogCheckpointForActivity:", v8))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
      objc_msgSend(v32, "reportTaskCheckpoint:forTask:error:", 10, v8, 0);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "featureCodes"));
    if (v33)
    {

    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fastPass"));
      v35 = v34 == 0;

      if (v35)
        goto LABEL_32;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "featureCodes"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fastPass"));
    objc_msgSend(v36, "addFeatureCodesForTask:featureCodes:semanticVersion:", v37, v38, objc_msgSend(v39, "semanticVersion"));

LABEL_32:
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "producedResultIdentifiers"));
    if (v40)
    {

    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dependencies"));
      v42 = v41 == 0;

      if (v42)
        goto LABEL_43;
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v117 = 0u;
    v118 = 0u;
    v116 = 0u;
    v115 = 0u;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dependencies"));
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v116;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(_QWORD *)v116 != v46)
            objc_enumerationMutation(v44);
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i), "identifier"));
          objc_msgSend(v43, "addObject:", v48);

        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
      }
      while (v45);
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "producedResultIdentifiers"));
    objc_msgSend(v49, "addDependencyInfoForTask:producedResultIdentifiers:dependencyIdentifiers:", v50, v51, v43);

LABEL_43:
    -[_DASRuntimeLimiter maximumRuntimeForActivity:](self->_runtimeLimiter, "maximumRuntimeForActivity:", v8);
    objc_msgSend(v8, "setMaximumRuntime:", (uint64_t)v52);
    -[_DASDaemon computeStaticPriorityForActivity:](v18, "computeStaticPriorityForActivity:", v8);
    -[_DASDaemon clearActivityFromPrerunning:](v18, "clearActivityFromPrerunning:", v8);
    +[_DASConditionScore setActivityShouldBypassPredictions:](_DASConditionScore, "setActivityShouldBypassPredictions:", v8);
    if (objc_msgSend(v8, "requestsApplicationLaunch"))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "launchReason"));
      v54 = objc_msgSend(v53, "isEqualToString:", _DASLaunchReasonBackgroundRemoteNotification);

      if (v54)
      {
        v55 = objc_msgSend(v8, "isSilentPush");
        +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.push.count"), 1);
        v56 = objc_msgSend(v8, "schedulingPriority");
        if ((unint64_t)v56 >= _DASSchedulingPriorityBackground)
        {
          +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.highprioritypush"), 1);
          if (v55)
          {
            +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.silentpush.highprioritycount"), 1);
            +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.silentpush.count"), 1);
            v57 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relatedApplications"));
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "firstObject"));
              sub_1000EA2E4(v59, (uint64_t)buf, v57, v58);
            }

            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
            -[_DASDaemon cancelActivities:](v18, "cancelActivities:", v60);

            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", _DASActivitySchedulerErrorDomain, 3, &off_10016F600));
            v10[2](v10, 0, v61);

            goto LABEL_91;
          }
        }
        else
        {
          +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.lowprioritypush"), 1);
          if (v55)
            +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.silentpush.count"), 1);
        }
        buf[0] = 0;
        barScheduler = v18->_barScheduler;
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relatedApplications"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "firstObject"));
        v65 = -[_DASBARScheduler pushLaunchAllowedForApp:immediately:](barScheduler, "pushLaunchAllowedForApp:immediately:", v64, buf);

        if (buf[0])
          v66 = v65;
        else
          v66 = 0;
        if (v66 == 1)
        {
          v10[2](v10, 1, 0);
          -[_DASDaemon addLaunchRequest:](v18, "addLaunchRequest:", v8);
          -[_DASDaemon immediatelyBeginWorkForActivity:](v18, "immediatelyBeginWorkForActivity:", v8);
          goto LABEL_91;
        }
        v67 = objc_msgSend(v8, "schedulingPriority");
        if (v67 == (id)_DASSchedulingPriorityMaintenance)
          -[_DASBlueListManager decrementPushBudgetRemaining](v18->_blueListManager, "decrementPushBudgetRemaining");
        if (((v65 | v55 ^ 1) & 1) == 0)
          +[_DASMetricRecorder recordOccurrenceForKey:](_DASMetricRecorder, "recordOccurrenceForKey:", CFSTR("com.apple.das.silentpush.pushnotallowedcount"));
        v68 = v18->_barScheduler;
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relatedApplications"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "firstObject"));
        LODWORD(v68) = -[_DASBARScheduler isNewsstandApp:](v68, "isNewsstandApp:", v70);

        if ((_DWORD)v68)
          objc_msgSend(v8, "setRequestsNewsstandLaunch:", 1);
      }
    }
    if ((objc_msgSend(v8, "requestsApplicationLaunch") & 1) != 0
      || objc_msgSend(v8, "requestsExtensionLaunch"))
    {
      if (!-[_DASDaemon addLaunchRequest:](v18, "addLaunchRequest:", v8))
      {
        v97 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relatedApplications"));
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "firstObject"));
          sub_1000EA290(v99, (uint64_t)buf, v97, v98);
        }

        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
        -[_DASDaemon cancelActivities:](v18, "cancelActivities:", v100);

        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", _DASActivitySchedulerErrorDomain, 5, &off_10016F628));
        v10[2](v10, 0, v101);

        goto LABEL_91;
      }
      if (objc_msgSend(v8, "requestsApplicationLaunch"))
      {
        +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.submitcount.launch"), 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relatedApplications"));
        v72 = objc_msgSend(v71, "count");

        if (v72)
          -[_DASDaemon advanceAppLaunchDateIfNecessaryForActivity:](v18, "advanceAppLaunchDateIfNecessaryForActivity:", v8);
      }
      if (objc_msgSend(v8, "shouldBePersisted"))
        -[_DASDataStore saveActivity:](v18->_store, "saveActivity:", v8);
    }
    if (objc_msgSend(v8, "userRequestedBackupTask"))
      -[_DASUserRequestedBackupTaskManager activitySubmitted:](v18->_backupTaskManager, "activitySubmitted:", v8);
    -[_DASActivityDependencyManager beginDependencyMonitoringForActivity:](v18->_dependencyManager, "beginDependencyMonitoringForActivity:", v8);
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteDevice"));
    if (v73)
    {
      v74 = objc_msgSend(v8, "targetDevice") == (id)3;

      if (v74)
        -[_DASRemoteDeviceNearbyMonitor registerForRemoteDeviceWithActivity:](v18->_remoteDeviceNearbyMonitor, "registerForRemoteDeviceWithActivity:", v8);
    }
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteDevice"));
    if (v75)
    {
      v76 = objc_msgSend(v8, "requiresRemoteDeviceWake");

      if (v76)
        -[_DASRemoteDeviceWakeMonitor registerRemoteDeviceWakeStateWithActivity:](v18->_remoteDeviceWakeMonitor, "registerRemoteDeviceWakeStateWithActivity:", v8);
    }
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "diskVolume"));

    if (v77)
      -[_DASDiskSpaceMonitor registerForPurgeableSpaceWithActivity:](v18->_diskSpaceMonitor, "registerForPurgeableSpaceWithActivity:", v8);
    if (-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:](v18->_networkEvaluationMonitor, "requiresNetworkPathMonitoring:", v8))
    {
      +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.submitcount.network"), 1);
      networkEvaluationMonitor = v18->_networkEvaluationMonitor;
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkEvaluationMonitor nwParametersForActivity:](_DASNetworkEvaluationMonitor, "nwParametersForActivity:", v8));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", kNWEndpointKey));
      -[_DASNetworkEvaluationMonitor startMonitoringActivity:withNetworkParameters:withEndpoint:](networkEvaluationMonitor, "startMonitoringActivity:withNetworkParameters:withEndpoint:", v79, v80, v82);

    }
    -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:](v18, "recordToTaskRegistry:lifeCycleStateName:", v8, CFSTR("submitted"));
    v10[2](v10, 1, 0);
    evaluationQueue = v18->_evaluationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B8E18;
    block[3] = &unk_10015D530;
    v84 = v8;
    v112 = v84;
    v113 = v18;
    v85 = v103;
    v114 = v85;
    dispatch_async(evaluationQueue, block);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v121 = sub_1000B383C;
    *(_QWORD *)v122 = sub_1000B384C;
    *(_QWORD *)&v122[8] = 0;
    timerSchedulingQueue = v18->_timerSchedulingQueue;
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_1000B8F64;
    v106[3] = &unk_10015FDA8;
    v87 = v85;
    v107 = v87;
    v88 = v84;
    v108 = v88;
    v109 = v18;
    v110 = buf;
    dispatch_sync(timerSchedulingQueue, v106);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v89 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        sub_1000EA230();

      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "name"));
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "timeIntervalSinceDate:", v87);
      v92 = v91;
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "startBefore"));
      objc_msgSend(v93, "timeIntervalSinceDate:", v87);
      v95 = v94;
      v96 = objc_msgSend(v88, "schedulingPriority");
      -[_DASDaemon scheduleTimerOnBehalfOf:between:and:waking:](v18, "scheduleTimerOnBehalfOf:between:and:waking:", v90, (unint64_t)v96 > _DASSchedulingPriorityUtility, v92, v95);

    }
    _Block_object_dispose(buf, 8);

LABEL_91:
    objc_autoreleasePoolPop(context);
    objc_sync_exit(v18);

    goto LABEL_92;
  }
  v123 = CFSTR("exhaustedRuntimeFeatureCodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRuntimeLimiter exhaustedRuntimeFeatureCodesAssociatedWithActivity:](self->_runtimeLimiter, "exhaustedRuntimeFeatureCodesAssociatedWithActivity:", v8));
  v13 = v12;
  if (!v12)
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v124 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", _DASActivitySchedulerErrorDomain, 7, v14));

  if (!v12)
  v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("featureDurationTracker")));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting submission of %@ with error: %@!", buf, 0x16u);
  }

  v10[2](v10, 0, v15);
LABEL_92:

}

- (void)endLaunchWithReason:(id)a3 forApp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OS_dispatch_queue *evaluationQueue;
  NSObject *v10;
  _QWORD block[4];
  NSObject *v12;
  id v13;
  _DASDaemon *v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    evaluationQueue = self->_evaluationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B926C;
    block[3] = &unk_10015D530;
    v12 = v7;
    v13 = v6;
    v14 = self;
    dispatch_async((dispatch_queue_t)evaluationQueue, block);

    v10 = v12;
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "endLaunchWithReason: launchReason or appName is null", buf, 2u);
    }
  }

}

- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4
{
  _DASBARScheduler *barScheduler;
  id v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void (**v10)(id, id, _BOOL8);

  barScheduler = self->_barScheduler;
  v10 = (void (**)(id, id, _BOOL8))a4;
  v7 = a3;
  v8 = -[_DASBARScheduler backgroundAppRefreshEnabled](barScheduler, "backgroundAppRefreshEnabled");
  v9 = -[_DASBARScheduler backgroundAppRefreshEnabledForApp:](self->_barScheduler, "backgroundAppRefreshEnabledForApp:", v7);

  v10[2](v10, (id)v8, v9);
}

- (void)disableAppRefreshForApps:(id)a3
{
  _DASBARScheduler *barScheduler;
  id v4;

  barScheduler = self->_barScheduler;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", a3));
  -[_DASBARScheduler disableAppRefreshForApps:](barScheduler, "disableAppRefreshForApps:", v4);

}

- (void)scheduleConnectionTimeoutForPid:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_time_t v12;
  OS_dispatch_queue *activityLaunchQueue;
  _QWORD v14[5];
  int v15;

  v3 = *(_QWORD *)&a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000EA338(v3, v5, v6, v7, v8, v9, v10, v11);

  v12 = dispatch_time(0, 10000000000);
  activityLaunchQueue = self->_activityLaunchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B96C0;
  v14[3] = &unk_10015FDD0;
  v15 = v3;
  v14[4] = self;
  dispatch_after(v12, (dispatch_queue_t)activityLaunchQueue, v14);
}

- (void)updateCompletionStatus:(BOOL)a3 forOngoingTask:(id)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
  if (v6)
  {
    if (!v4)
      goto LABEL_7;
  }
  else
  {
    v6 = objc_alloc_init((Class)NSProgress);
    if (!v4)
      goto LABEL_7;
  }
  if ((uint64_t)objc_msgSend(v6, "completedUnitCount") >= 1)
  {
    objc_msgSend(v6, "setTotalUnitCount:", objc_msgSend(v6, "completedUnitCount"));
    goto LABEL_8;
  }
LABEL_7:
  objc_msgSend(v6, "cancel");
LABEL_8:
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("BackgroundTasks")));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = v4;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Update progress (%u) to %@ for %@", (uint8_t *)v10, 0x1Cu);
  }

  objc_msgSend(v5, "setProgress:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASContinuedProcessingTaskUIClient sharedClient](_DASContinuedProcessingTaskUIClient, "sharedClient"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  objc_msgSend(v8, "updateProgress:forIdentifier:", v6, v9);

}

- (void)updateOngoingTask:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASContinuedProcessingTaskUIClient sharedClient](_DASContinuedProcessingTaskUIClient, "sharedClient"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientProvidedTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientProvidedReason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));

  objc_msgSend(v6, "updateTitle:andDescription:forIdentifier:", v7, v8, v9);
  v10[2]();

}

- (void)updateProgressForOngoingTask:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASContinuedProcessingTaskUIClient sharedClient](_DASContinuedProcessingTaskUIClient, "sharedClient"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));

  objc_msgSend(v6, "updateProgress:forIdentifier:", v7, v8);
  v9[2]();

}

- (void)submittedActivitiesWithHandler:(id)a3
{
  os_unfair_recursive_lock_s *p_activityStateLock;
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  id v8;

  p_activityStateLock = &self->_activityStateLock;
  v5 = (void (**)(id, void *))a3;
  os_unfair_recursive_lock_lock_with_options(p_activityStateLock, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_pendingTasks, "allObjects"));
  v8 = objc_msgSend(v6, "mutableCopy");

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  objc_msgSend(v8, "sortUsingComparator:", &stru_10015FE10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8));
  v5[2](v5, v7);

}

- (void)delayedRunningActivitiesWithHandler:(id)a3
{
  os_unfair_recursive_lock_s *p_activityStateLock;
  void (**v5)(id, id);
  void *v6;
  id v7;
  id v8;

  p_activityStateLock = &self->_activityStateLock;
  v5 = (void (**)(id, id))a3;
  os_unfair_recursive_lock_lock_with_options(p_activityStateLock, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_prerunningTasks, "allObjects"));
  v8 = objc_msgSend(v6, "mutableCopy");

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  objc_msgSend(v8, "sortUsingComparator:", &stru_10015FE30);
  v7 = objc_msgSend(v8, "copy");
  v5[2](v5, v7);

}

- (void)runningActivitiesWithHandler:(id)a3
{
  void (**v4)(id, void *);
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = (void (**)(id, void *))a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BA048;
  v7[3] = &unk_10015FAF0;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = v8;
  -[_DASDaemon allClientsDo:](self, "allClientsDo:", v7);
  objc_msgSend(v5, "sortUsingComparator:", &stru_10015FE50);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
  v4[2](v4, v6);

}

- (void)runningGroupActivitiesWithHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  os_unfair_lock_s *p_groupLock;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_groupToRunningTasks, "allValues", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "allObjects"));
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_groupLock);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
  v4[2](v4, v13);

}

- (void)scoresForActivityWithName:(id)a3 withHandler:(id)a4
{
  (*((void (**)(id, void *))a4 + 2))(a4, &__NSArray0__struct);
}

- (void)activityRunStatisticsWithHandler:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, &__NSDictionary0__struct);
}

- (id)activityRunStatistics
{
  return 0;
}

- (void)forceRunActivities:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Force Running %lu activities", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon getActivityWithName:](self, "getActivityWithName:", v11, (_QWORD)v15));
        if (!v12)
        {
          v14 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Force run activities unable to find activity %@", buf, 0xCu);
          }

          goto LABEL_15;
        }
        v13 = v12;
        objc_msgSend(v12, "setWasForceRun:", 1);
        -[_DASDaemon immediatelyBeginWorkForActivity:](self, "immediatelyBeginWorkForActivity:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

}

- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  __int128 v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  OS_dispatch_queue *evaluationQueue;
  id v18;
  NSObject *v19;
  __int128 v20;
  _QWORD block[5];
  id v22;
  uint64_t v23;
  int64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  _BYTE v31[14];

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v31 = a3;
    *(_WORD *)&v31[4] = 2112;
    *(_QWORD *)&v31[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "With %i urgency level, Running %@ activities", buf, 0x12u);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v26;
    *(_QWORD *)&v10 = 138412290;
    v20 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon getActivityWithName:](self, "getActivityWithName:", v14, v20));
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUrgencyOverridePolicy policyInstance](_DASUrgencyOverridePolicy, "policyInstance"));
          objc_msgSend(v16, "addActivity:urgencyLevel:", v14, a3);

          evaluationQueue = self->_evaluationQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000BA758;
          block[3] = &unk_10015EEF0;
          block[4] = self;
          v18 = v15;
          v23 = v14;
          v24 = a3;
          v22 = v18;
          dispatch_async((dispatch_queue_t)evaluationQueue, block);

        }
        else
        {
          v19 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            *(_QWORD *)v31 = v14;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "With urgency level, run activities unable to find activity %@", buf, 0xCu);
          }

        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

}

- (void)currentPredictionsWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager currentPredictions](_DASPredictionManager, "currentPredictions"));
  (*((void (**)(id, id))a3 + 2))(v4, v5);

}

- (id)earlyToday
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "components:fromDate:", 28, v3));

  objc_msgSend(v4, "setHour:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateFromComponents:", v4));

  return v5;
}

- (id)widgetViewsStatisticsWithStore:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _BYTE v60[128];
  _BYTE v61[128];
  void *v62;
  void *v63;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](NSCountedSet, "set"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon earlyToday](self, "earlyToday"));
  v6 = objc_claimAutoreleasedReturnValue(+[_DKEventQuery predicateForEventsWithStartDateAfter:](_DKEventQuery, "predicateForEventsWithStartDateAfter:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", kDASWidgetViewStreamName));
  v63 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
  v62 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));
  v41 = (void *)v6;
  v11 = objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v6, v8, 0, 0, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v43 = v4;
  v40 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeQuery:error:", v11, 0));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
        objc_msgSend(v5, "addObject:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v15);
  }
  v39 = v12;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000BADD0;
  v51[3] = &unk_10015FE78;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v52 = v22;
  v23 = v5;
  v53 = v23;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v51);
  v38 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allObjects"));
  v25 = objc_msgSend(v24, "mutableCopy");

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000BAE48;
  v49[3] = &unk_10015E090;
  v26 = v22;
  v50 = v26;
  objc_msgSend(v25, "sortUsingComparator:", v49);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v25;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v30)
          objc_enumerationMutation(obj);
        v32 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
        v58[0] = CFSTR("name");
        v58[1] = CFSTR("count");
        v59[0] = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:"));
        objc_msgSend(v33, "doubleValue");
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v34)));
        v59[1] = v35;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 2));
        objc_msgSend(v27, "addObject:", v36);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
    }
    while (v29);
  }

  return v27;
}

- (id)widgetRefreshStatisticsWithStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  uint64_t v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id obj;
  id v54;
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[3];
  _QWORD v73[3];
  _BYTE v74[128];
  _BYTE v75[128];
  void *v76;
  void *v77;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](NSCountedSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](NSCountedSet, "set"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon earlyToday](self, "earlyToday"));
  v7 = objc_claimAutoreleasedReturnValue(+[_DKEventQuery predicateForEventsWithStartDateAfter:](_DKEventQuery, "predicateForEventsWithStartDateAfter:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", kDASWidgetRefreshStreamName));
  v77 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
  v76 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v76, 1));
  v49 = (void *)v7;
  v12 = objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v7, v9, 0, 0, v11));

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v51 = v4;
  v48 = (void *)v12;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeQuery:error:", v12, 0));
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v69;
    v16 = kDASWidgetMetadataDASInitiated;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
        objc_msgSend(v5, "addObject:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "metadata"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v16));
        v22 = objc_msgSend(v21, "BOOLValue");

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
          objc_msgSend(v6, "addObject:", v23);

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v24, v25);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    }
    while (v14);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_1000BB47C;
  v63[3] = &unk_10015FEA0;
  v28 = v26;
  v64 = v28;
  v29 = v5;
  v65 = v29;
  v55 = v27;
  v66 = v55;
  v46 = v6;
  v67 = v46;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v63);
  v47 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allObjects"));
  v31 = objc_msgSend(v30, "mutableCopy");

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1000BB534;
  v61[3] = &unk_10015E090;
  v32 = v28;
  v62 = v32;
  objc_msgSend(v31, "sortUsingComparator:", v61);
  v54 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v52 = v31;
  v33 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(_QWORD *)v58 != v35)
          objc_enumerationMutation(v52);
        v37 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
        v73[0] = v37;
        v72[0] = CFSTR("name");
        v72[1] = CFSTR("count");
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v37));
        objc_msgSend(v38, "doubleValue");
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v39)));
        v73[1] = v40;
        v72[2] = CFSTR("dasRefreshes");
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v37));
        objc_msgSend(v41, "doubleValue");
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v42)));
        v73[2] = v43;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v73, v72, 3));
        objc_msgSend(v54, "addObject:", v44);

      }
      v34 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
    }
    while (v34);
  }

  return v54;
}

- (void)statisticsWithHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];

  v16[0] = CFSTR("widgetViews");
  v14[0] = CFSTR("name");
  v14[1] = CFSTR("data");
  v15[0] = CFSTR("Widget Views");
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](_DASPredictionManager, "sharedKnowledgeStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon widgetViewsStatisticsWithStore:](self, "widgetViewsStatisticsWithStore:", v5));
  v15[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
  v16[1] = CFSTR("widgetRefreshes");
  v17[0] = v7;
  v12[1] = CFSTR("data");
  v13[0] = CFSTR("Widget Refreshes");
  v12[0] = CFSTR("name");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](_DASPredictionManager, "sharedKnowledgeStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon widgetRefreshStatisticsWithStore:](self, "widgetRefreshStatisticsWithStore:", v8));
  v13[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v17[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));

  v4[2](v4, v11);
}

- (void)allBudgetsWithHandler:(id)a3
{
  _DASBudgetManager *budgetManager;
  id v5;
  id v6;

  budgetManager = self->_budgetManager;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[_DASBudgetManager allBudgets](budgetManager, "allBudgets"));
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)balanceForBudgetWithName:(id)a3 withHandler:(id)a4
{
  _DASBudgetManager *budgetManager;
  id v7;

  budgetManager = self->_budgetManager;
  v7 = a4;
  -[_DASBudgetManager balanceForBudgetWithName:](budgetManager, "balanceForBudgetWithName:", a3);
  (*((void (**)(id))a4 + 2))(v7);

}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  -[_DASBudgetManager setBalance:forBudgetWithName:](self->_budgetManager, "setBalance:forBudgetWithName:", a4, a3);
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  -[_DASBudgetManager decrementBy:forBudgetWithName:](self->_budgetManager, "decrementBy:forBudgetWithName:", a4, a3);
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  -[_DASBudgetManager setCapacity:forBudgetWithName:](self->_budgetManager, "setCapacity:forBudgetWithName:", a4, a3);
}

- (void)policiesWithHandler:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void (**v18)(id, id);
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v18 = (void (**)(id, id))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "policyName"));
        v10 = +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", v9);

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "policyName"));
        objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("policyName"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "policyDescription"));
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "policyDescription"));
          objc_msgSend(v11, "setValue:forKey:", v14, CFSTR("policyDescription"));

        }
        else
        {
          objc_msgSend(v11, "setValue:forKey:", &stru_1001617C8, CFSTR("policyDescription"));
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v10));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
        objc_msgSend(v3, "setValue:forKey:", v11, v16);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }
  v17 = objc_msgSend(v3, "copy");
  v18[2](v18, v17);

}

- (void)clasStatusWithHandler:(id)a3
{
  _DASControlEngine *controlEnginge;
  void (**v4)(id, id);
  id v5;
  id v6;

  controlEnginge = self->_controlEnginge;
  v4 = (void (**)(id, id))a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[_DASControlEngine status](controlEnginge, "status"));
  v5 = objc_msgSend(v6, "copy");
  v4[2](v4, v5);

}

- (id)evaluatePolicies:(id)a3
{
  id v4;
  void *v5;
  os_unfair_recursive_lock_s *p_activityStateLock;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *k;
  void *v30;
  void *v31;
  unsigned int v32;
  int v33;
  id v34;
  NSObject *v35;
  _UNKNOWN **v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  void *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  unsigned int v65;
  void *v66;
  unsigned int v67;
  unsigned int v68;
  void *v69;
  _DASDaemon *v70;
  id v71;
  os_unfair_recursive_lock_s *obj;
  id obja;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t v90[128];
  uint8_t buf[4];
  id v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v70 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pendingTasks](self, "pendingTasks"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
  obj = p_activityStateLock;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v87;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v87 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
        v14 = objc_msgSend(v4, "isEqualToString:", v13);

        if (v14)
        {
          v15 = v12;
          v68 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
      if (v9)
        continue;
      break;
    }
  }
  v68 = 0;
  v15 = 0;
LABEL_11:

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon prerunningTasks](v70, "prerunningTasks"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v83;
    while (2)
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v83 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)j);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
        v23 = objc_msgSend(v4, "isEqualToString:", v22);

        if (v23)
        {
          v24 = v21;

          v67 = 1;
          v15 = v24;
          goto LABEL_21;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
      if (v18)
        continue;
      break;
    }
  }
  v67 = 0;
LABEL_21:

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon runningTasks](v70, "runningTasks"));
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v79;
    while (2)
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(_QWORD *)v79 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)k);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
        v32 = objc_msgSend(v4, "isEqualToString:", v31);

        if (v32)
        {
          v34 = v30;

          v33 = 1;
          v15 = v34;
          goto LABEL_31;
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
      if (v27)
        continue;
      break;
    }
  }
  v33 = 0;
LABEL_31:

  os_unfair_recursive_lock_unlock(obj);
  if (v15)
  {
    v66 = v5;
    v35 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v92 = v4;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Evaluating policies for %@", buf, 0xCu);
    }
    v65 = v33;

    v36 = &AnalyticsSendEvent_ptr;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    obja = (id)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](_DASPolicyManager, "allPoliciesForPlatform"));
    v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v75;
      do
      {
        v40 = 0;
        v71 = v38;
        do
        {
          if (*(_QWORD *)v75 != v39)
            objc_enumerationMutation(obja);
          v41 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)v40);
          v42 = objc_autoreleasePoolPush();
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36[127], "dictionary"));
          if (objc_msgSend(v41, "appliesToActivity:", v15))
          {
            objc_msgSend(v41, "weightForActivity:", v15);
            v45 = v44;
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon context](v70, "context"));
            v47 = v15;
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "responseForActivity:withState:", v15, v46));

            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "rationale"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v45));
            objc_msgSend(v43, "setValue:forKey:", v50, CFSTR("weightForActivity"));

            objc_msgSend(v48, "score");
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            objc_msgSend(v43, "setValue:forKey:", v51, CFSTR("score"));

            v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(v48, "policyDecision")));
            objc_msgSend(v43, "setValue:forKey:", v52, CFSTR("policyDecision"));

            objc_msgSend(v48, "validityDuration");
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            objc_msgSend(v43, "setValue:forKey:", v53, CFSTR("validityDuration"));

            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(v49, "responseOptions")));
            objc_msgSend(v43, "setValue:forKey:", v54, CFSTR("rationaleResponseOptions"));

            if ((objc_opt_respondsToSelector(v41, "blockReasons:") & 1) != 0)
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "blockReasons:", v48));
              objc_msgSend(v43, "setValue:forKey:", v55, CFSTR("blockReasons"));

            }
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "description"));
            objc_msgSend(v43, "setValue:forKey:", v56, CFSTR("rationaleDescription"));

            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "policyName"));
            objc_msgSend(v69, "setValue:forKey:", v43, v57);

            v36 = &AnalyticsSendEvent_ptr;
            v15 = v47;
            v38 = v71;
          }

          objc_autoreleasePoolPop(v42);
          v40 = (char *)v40 + 1;
        }
        while (v38 != v40);
        v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
      }
      while (v38);
    }

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v68));
    v59 = objc_msgSend(v58, "unsignedIntValue");
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v67));
    v61 = v59 | (2 * objc_msgSend(v60, "unsignedIntValue"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v65));
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v61 | (4 * objc_msgSend(v62, "unsignedIntValue"))));

    v5 = v66;
    objc_msgSend(v66, "setValue:forKey:", v63, CFSTR("taskStatus"));
    objc_msgSend(v66, "setValue:forKey:", v69, CFSTR("policyEvaluations"));

  }
  return v5;
}

- (void)evaluatePolicies:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  OS_dispatch_queue *evaluationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000B383C;
  v18 = sub_1000B384C;
  v19 = 0;
  evaluationQueue = self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BC338;
  block[3] = &unk_10015DB40;
  v13 = &v14;
  block[4] = self;
  v9 = v6;
  v12 = v9;
  dispatch_sync((dispatch_queue_t)evaluationQueue, block);
  v10 = objc_msgSend((id)v15[5], "copy");
  v7[2](v7, v10);

  _Block_object_dispose(&v14, 8);
}

- (void)evaluateAllActivities:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  OS_dispatch_queue *evaluationQueue;
  id v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  evaluationQueue = self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BC468;
  block[3] = &unk_10015E940;
  block[4] = self;
  v12 = &v13;
  v9 = v6;
  v11 = v9;
  dispatch_sync((dispatch_queue_t)evaluationQueue, block);
  v7[2](v7, *((unsigned __int8 *)v14 + 24));

  _Block_object_dispose(&v13, 8);
}

- (BOOL)evaluateAllActivitiesFor:(id)a3 writingToFile:(id)a4
{
  id v5;
  _QWORD v7[5];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BC5F4;
  v7[3] = &unk_10015FEC8;
  v7[4] = self;
  v8 = a4;
  v5 = v8;
  LOBYTE(a3) = objc_msgSend(a3, "enumerateObjectsInChunksOfSize:block:", 5, v7);

  return (char)a3;
}

- (BOOL)evaluatePoliciesForActivitiesChunk:(id)a3 writingToFile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  id v23;
  BOOL v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon evaluatePolicies:](self, "evaluatePolicies:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
        objc_msgSend(v8, "setValue:forKey:", v16, v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

  v27 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v8, 0, &v27));
  v19 = v27;
  if (v19)
  {
    v20 = v19;
    v21 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000EA540();
LABEL_16:

    v24 = 0;
    goto LABEL_17;
  }
  v26 = 0;
  v22 = objc_msgSend(v7, "writeData:error:", v18, &v26);
  v23 = v26;
  v20 = v23;
  if (!v22 || v23)
  {
    v21 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000EA4DC();
    goto LABEL_16;
  }
  v24 = 1;
LABEL_17:

  return v24;
}

- (void)runProceedableActivities:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  OS_dispatch_queue *evaluationQueue;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void (**v26)(id, void *);
  NSMutableArray *v27;
  id obj;
  uint64_t v29;
  void *v30;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD block[7];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v5 = a3;
  v26 = (void (**)(id, void *))a4;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v27 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activities")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("overrides")));

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v5;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v32)
  {
    v29 = *(_QWORD *)v51;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v51 != v29)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v33 = v8;
        v10 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v8);
        v37 = objc_opt_new(NSMutableArray);
        v44 = 0;
        v45 = &v44;
        v46 = 0x3032000000;
        v47 = sub_1000B383C;
        v48 = sub_1000B384C;
        v49 = 0;
        evaluationQueue = self->_evaluationQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000BCE98;
        block[3] = &unk_10015DB40;
        block[5] = v10;
        block[6] = &v44;
        block[4] = self;
        dispatch_sync((dispatch_queue_t)evaluationQueue, block);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v45[5], "objectForKey:", CFSTR("taskStatus")));
        v12 = objc_msgSend(v34, "unsignedIntegerValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v37, CFSTR("blockingPolicies"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("foundActivity"));
        v35 = v13;
        if (objc_msgSend((id)v45[5], "count") && (v12 & 1) != 0)
        {
          objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("foundActivity"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v45[5], "objectForKeyedSubscript:", CFSTR("policyEvaluations")));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortedArrayUsingSelector:", "localizedCaseInsensitiveCompare:"));

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(_QWORD *)v40 != v19)
                  objc_enumerationMutation(v17);
                v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v21));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("policyDecision")));
                v24 = objc_msgSend(v23, "longValue");

                if ((!objc_msgSend(v38, "containsObject:", v10)
                   || (objc_msgSend(v36, "containsObject:", v21) & 1) == 0)
                  && (v24 == (id)100 || v24 == (id)33))
                {
                  -[NSMutableArray addObject:](v37, "addObject:", v21);
                }

              }
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
            }
            while (v18);
          }

          if (!-[NSMutableArray count](v37, "count"))
          {
            v25 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v10;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ is a proceedable activity!", buf, 0xCu);
            }

            -[NSMutableArray addObject:](v27, "addObject:", v10);
          }

        }
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v35, v10);

        _Block_object_dispose(&v44, 8);
        v8 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v32);
  }

  -[_DASDaemon forceRunActivities:](self, "forceRunActivities:", v27);
  v26[2](v26, v30);

}

- (void)activityContainsOverrides:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "loadOverrides"));
  (*((void (**)(id, void *))a4 + 2))(v5, v6);

}

- (void)blockingPoliciesWithParameters:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  double v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  os_unfair_recursive_lock_s *p_activityStateLock;
  id v37;
  void *v38;
  uint64_t v39;
  _DASDaemon *v40;
  id v41;
  id obj;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];

  v6 = a3;
  v37 = a4;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activity")));
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v40 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_pendingTasks, "allObjects"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
        v14 = objc_msgSend(v13, "isEqualToString:", v38);

        if (v14)
        {
          v15 = v12;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityClasses")));
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    v39 = *(_QWORD *)v49;
    do
    {
      v19 = 0;
      v41 = v17;
      do
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(obj);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v19), "isEqualToString:", CFSTR("icpl")))
        {
          v43 = v19;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v40->_pendingTasks, "allObjects"));
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(_QWORD *)v45 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
                if (+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v26))
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastScored"));
                  if (v27)
                  {
                    objc_msgSend(v20, "timeIntervalSinceDate:", v27);
                    if (v28 < 0.0)
                    {
                      v29 = v27;

                      v30 = v26;
                      v20 = v29;
                      v15 = v30;
                    }
                  }

                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
            }
            while (v23);
          }

          v18 = v39;
          v17 = v41;
          v19 = v43;
        }
        v19 = (char *)v19 + 1;
      }
      while (v19 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v17);
  }
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  if (v15)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[_DASConditionScore lastDenialResponses:](_DASConditionScore, "lastDenialResponses:", v15));
    v32 = v37;
    (*((void (**)(id, void *))v37 + 2))(v37, v31);

    v33 = v6;
  }
  else
  {
    v34 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    v32 = v37;
    v33 = v6;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
      *(_DWORD *)buf = 138412290;
      v57 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No blocked activity was found for %@", buf, 0xCu);

    }
    (*((void (**)(id, void *))v37 + 2))(v37, &__NSArray0__struct);
  }

}

- (void)updateOnlyPreemptiveSuspend:(BOOL)a3
{
  -[_DASRuntimeLimiter setOnlyPreemptiveSuspend:](self->_runtimeLimiter, "setOnlyPreemptiveSuspend:", a3);
}

- (void)resetOnlyPreemptiveSuspend
{
  -[_DASRuntimeLimiter resetOnlyPreemptiveSuspend](self->_runtimeLimiter, "resetOnlyPreemptiveSuspend");
}

- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4 handler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t);
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resetting test mode parameters", (uint8_t *)&v13, 2u);
    }

    -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", 0, CFSTR("testModeParameters"));
    -[_DASDaemon setTestModeParameters:](self, "setTestModeParameters:", 0);
  }
  else
  {
    if (v11)
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Entering test mode with parameters: %@", (uint8_t *)&v13, 0xCu);
    }

    -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", v8, CFSTR("testModeParameters"));
    -[_DASDaemon setTestModeParameters:](self, "setTestModeParameters:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", v12, CFSTR("testModeLastUpdated"));

  }
  v9[2](v9, 1);

}

- (void)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4 handler:(id)a5
{
  _BOOL8 v6;
  NSSet *v8;
  void (**v9)(id, uint64_t);
  NSObject *v10;
  NSObject *v11;
  NSSet *taskRegistryProcesses;
  NSSet *v13;
  void *v14;
  int v15;
  NSSet *v16;

  v6 = a3;
  v8 = (NSSet *)a4;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 67109120;
    LODWORD(v16) = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting task registry mode to: %i", (uint8_t *)&v15, 8u);
  }

  v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting processes to: %@", (uint8_t *)&v15, 0xCu);
  }

  self->_taskRegistryMode = v6;
  taskRegistryProcesses = self->_taskRegistryProcesses;
  self->_taskRegistryProcesses = v8;
  v13 = v8;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v13, "allObjects"));
  -[NSUserDefaults setBool:forKey:](self->_testingDefaults, "setBool:forKey:", v6, CFSTR("taskRegistryMode"));
  -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", v14, CFSTR("taskRegistryProcesses"));

  v9[2](v9, 1);
}

- (void)submitRateLimitConfiguration:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(id, uint64_t);

  v7 = (void (**)(id, uint64_t))a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRateLimitManager sharedLimiter](_DASActivityRateLimitManager, "sharedLimiter"));
  objc_msgSend(v6, "submitRateLimitConfiguration:", v5);

  v7[2](v7, 1);
}

- (void)pauseWithParameters:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pausing scheduling with parameters: %@", (uint8_t *)&v13, 0xCu);
  }

  if (objc_msgSend(v6, "count"))
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("validUntil"));

    -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", v9, CFSTR("pausedParameters"));
    -[_DASDaemon setPausedParameters:](self, "setPausedParameters:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon tasksNoLongerEligible](self, "tasksNoLongerEligible"));
    -[_DASDaemon suspendActivities:](self, "suspendActivities:", v12);

  }
  else
  {
    -[NSUserDefaults removeObjectForKey:](self->_testingDefaults, "removeObjectForKey:", CFSTR("pausedParameters"));
    -[_DASDaemon setPausedParameters:](self, "setPausedParameters:", 0);
  }
  v7[2](v7, 1);

}

- (void)addPauseExceptParameter:(id)a3 handler:(id)a4
{
  void (**v6)(id, uint64_t);
  NSUserDefaults *testingDefaults;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSUserDefaults *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;

  v6 = (void (**)(id, uint64_t))a4;
  if (a3)
  {
    testingDefaults = self->_testingDefaults;
    v8 = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](testingDefaults, "objectForKey:", CFSTR("pausedParameters")));
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "mutableCopy");
    else
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("exceptTypes")));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("exceptTypes")));
      v15 = objc_msgSend(v14, "mutableCopy");

    }
    else
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    }

    objc_msgSend(v15, "addObject:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v15));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("exceptTypes"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v12));
    -[_DASDaemon setPausedParameters:](self, "setPausedParameters:", v17);

    v18 = self->_testingDefaults;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
    -[NSUserDefaults setObject:forKey:](v18, "setObject:forKey:", v19, CFSTR("pausedParameters"));

    v20 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
      v22 = 138412290;
      v23 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Adding pause parameter: %@", (uint8_t *)&v22, 0xCu);

    }
  }
  v6[2](v6, 1);

}

- (void)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4 handler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id *p_runtimeLimiter;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRuntimeLimiter limitationName](self->_runtimeLimiter, "limitationName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));
  v12 = objc_msgSend(v11, "isEqualToString:", v8);

  if ((v12 & 1) != 0)
  {
    p_runtimeLimiter = (id *)&self->_runtimeLimiter;
LABEL_5:
    v9[2](v9, objc_msgSend(*p_runtimeLimiter, "deleteLimitForActivity:", v17));
    goto LABEL_6;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASConfigurationLimiter limitationName](self->_configurationLimiter, "limitationName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
  v16 = objc_msgSend(v15, "isEqualToString:", v8);

  if (v16)
  {
    p_runtimeLimiter = (id *)&self->_configurationLimiter;
    goto LABEL_5;
  }
LABEL_6:
  v9[2](v9, 0);

}

- (void)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5 handler:(id)a6
{
  id v10;
  void (**v11)(id, id);
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;

  v21 = a4;
  v10 = a5;
  v11 = (void (**)(id, id))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRuntimeLimiter limitationName](self->_runtimeLimiter, "limitationName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (v15)
  {
    v16 = (id)-[_DASRuntimeLimiter setLimit:forActivity:](self->_runtimeLimiter, "setLimit:forActivity:", v21, a3);
LABEL_5:
    v11[2](v11, v16);
    goto LABEL_6;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASConfigurationLimiter limitationName](self->_configurationLimiter, "limitationName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lowercaseString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if (v20)
  {
    v16 = -[_DASConfigurationLimiter setLimitForActivity:](self->_configurationLimiter, "setLimitForActivity:", v21);
    goto LABEL_5;
  }
LABEL_6:
  v11[2](v11, 0);

}

- (void)getLimiterResponseForActivity:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  void (**v33)(id, id);
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[_DASDaemon allTasks](self, "allTasks"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      v15 = objc_msgSend(v6, "isEqualToString:", v14);

      if ((v15 & 1) != 0)
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "limitationResponse"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (!v19)
    {
      v16 = 0;
      goto LABEL_22;
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = v19;
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v20)
    {
      v21 = v20;
      v34 = v6;
      obj = v18;
      v32 = v8;
      v33 = v7;
      v22 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", v32, v33, v34));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "decision")));
          objc_msgSend(v24, "validityDuration");
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("decision"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rationale"));
          objc_msgSend(v25, "setObject:forKey:", v28, CFSTR("rationale"));

          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "limiterName"));
          objc_msgSend(v25, "setObject:forKey:", v29, CFSTR("limiterName"));

          objc_msgSend(v25, "setObject:forKey:", v27, CFSTR("validityDuration"));
          objc_msgSend(v17, "addObject:", v25);

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v21);
      v6 = v34;
      v18 = obj;
      v16 = obj;
      v8 = v32;
      v7 = v33;
    }
    else
    {
      v16 = v18;
    }
  }
  else
  {
LABEL_9:
    v16 = 0;
    v17 = 0;
    v18 = v8;
  }

LABEL_22:
  v30 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v17;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Limiter Response: %@", buf, 0xCu);
  }

  v31 = objc_msgSend(v17, "copy");
  v7[2](v7, v31);

}

- (void)getRuntimeLimit:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(_QWORD, double);
  id v8;
  id v9;
  double v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  double v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  double v24;
  _BYTE v25[128];

  v6 = a3;
  v7 = (void (**)(_QWORD, double))a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[_DASDaemon allTasks](self, "allTasks"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  v10 = -1.0;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name", (_QWORD)v19));
        v16 = objc_msgSend(v6, "isEqualToString:", v15);

        if (v16)
        {
          -[_DASRuntimeLimiter maximumRuntimeForActivity:](self->_runtimeLimiter, "maximumRuntimeForActivity:", v14);
          v10 = v17;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  v18 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Maximum Allowable Runtime: %lf", buf, 0xCu);
  }

  v7[2](v7, v10);
}

- (id)createTempBGSQLFile:(id)a3
{
  id v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v13;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@tempSQL_%@.BGSQL"), v5, v6));
  v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "File Path: %s", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v9, "createFileAtPath:contents:attributes:", v7, v3, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v7, 0));
  return v10;
}

- (BOOL)removeTempBGSQLFile:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  uint8_t buf[4];
  id v14;

  v3 = a3;
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path")));
      *(_DWORD *)buf = 136315138;
      v14 = objc_msgSend(v5, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing temporary BGSQL file at %s", buf, 0xCu);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = 0;
    v7 = objc_msgSend(v6, "removeItemAtURL:error:", v3, &v12);
    v8 = v12;

    if ((v7 & 1) == 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000EA5A4(v8, v9);

    }
    v10 = v8 == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  void (**v10)(id, id);
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v10 = (void (**)(id, id))a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](_DASLatencyProjector, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v11));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "computeElapsedRunTimes:timeFilter:filepath:", v13, v12, v14));
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v14);
  v16 = objc_msgSend(v15, "copy");
  v10[2](v10, v16);

}

- (void)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  void (**v10)(id, id);
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v10 = (void (**)(id, id))a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](_DASLatencyProjector, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v11));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "computeEstimatedRunTimes:timeFilter:filepath:", v13, v12, v14));
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v14);
  v16 = objc_msgSend(v15, "copy");
  v10[2](v10, v16);

}

- (void)getConditionsPenalties:(id)a3 handler:(id)a4
{
  void (**v5)(id, id);
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = (void (**)(id, id))a4;
  v6 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](_DASLatencyProjector, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getConditionsPenalties:", v6));

  v8 = objc_msgSend(v7, "copy");
  v5[2](v5, v8);

}

- (void)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  void (**v10)(id, id);
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v10 = (void (**)(id, id))a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](_DASLatencyProjector, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v11));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getFeatureTimelines:timeFilter:filepath:", v13, v12, v14));
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v14);
  v16 = objc_msgSend(v15, "copy");
  v10[2](v10, v16);

}

- (void)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  void (**v10)(id, id);
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v10 = (void (**)(id, id))a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](_DASLatencyProjector, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v11));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getActivityTimelines:timeFilter:filepath:", v13, v12, v14));
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v14);
  v16 = objc_msgSend(v15, "copy");
  v10[2](v10, v16);

}

- (void)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  void (**v8)(id, id);
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v8 = (void (**)(id, id))a5;
  v9 = a4;
  v10 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](_DASLatencyProjector, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getDeviceConditionTimelines:filepath:", v10, v11));
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v11);
  v13 = objc_msgSend(v12, "copy");
  v8[2](v8, v13);

}

- (void)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  void (**v10)(id, id);
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v10 = (void (**)(id, id))a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](_DASLatencyProjector, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v11));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "computeEstimatedMADCompletionTimes:endDate:filepath:", v13, v12, v14));
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v14);
  v16 = objc_msgSend(v15, "copy");
  v10[2](v10, v16);

}

- (void)registerForNetworkPathEvaluation
{
  _DASNetworkEvaluationMonitor *networkEvaluationMonitor;
  _QWORD v3[5];

  networkEvaluationMonitor = self->_networkEvaluationMonitor;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000BEBF4;
  v3[3] = &unk_10015FEF0;
  v3[4] = self;
  -[_DASNetworkEvaluationMonitor registerForNetworkEvaluationWithCallback:](networkEvaluationMonitor, "registerForNetworkEvaluationWithCallback:", v3);
}

- (void)handleTriggersBatched:(id)a3
{
  -[_DASBatchingQueue addWorkItems:](self->_triggerBatchingQueue, "addWorkItems:", a3);
}

- (void)handleTriggers:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *p_super;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  double v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  void *v29;
  unsigned int v30;
  NSMutableDictionary *triggerToActivitiesMap;
  void *v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  NSObject *v43;
  id v44;
  _CDLocalContext *context;
  void *v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id obj;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *i;
  void *v59;
  id v60;
  uint64_t v61;
  char *v62;
  void *v63;
  char *v64;
  NSMutableDictionary *v65;
  os_unfair_recursive_lock_s *p_applicationLaunchRequestsLock;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  id v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];

  v3 = a3;
  v52 = (void *)os_transaction_create("com.apple.dasd.handleTriggers");
  v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));
    *(_DWORD *)buf = 138543362;
    v89 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to suspend based on triggers: %{public}@", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon tasksNoLongerEligible](self, "tasksNoLongerEligible"));
  -[_DASDaemon suspendActivities:](self, "suspendActivities:", v7);

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v3;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v85;
    p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
    v8 = _DASLaunchReasonNSURLSessionComplete;
    v71 = _DASLaunchReasonWatchConnectivityPendingData;
    v70 = _DASLaunchReasonBackgroundRemoteNotification;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(_QWORD *)v85 != v54)
          objc_enumerationMutation(obj);
        v59 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v57, "containsObject:") & 1) == 0)
        {
          objc_msgSend(v57, "addObject:", v59);
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_triggerToPolicyMap, "objectForKeyedSubscript:", v59));
          if (objc_msgSend(v56, "shouldIgnoreTrigger:withState:", v59, self->_context))
          {
            p_super = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v89 = v59;
              _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Ignoring trigger %{public}@, conditions are worse", buf, 0xCu);
            }
            goto LABEL_54;
          }
          if (!objc_msgSend(v59, "isEqualToString:", CFSTR("com.apple.das.apppolicy.appchanged")))
            goto LABEL_37;
          v60 = (id)objc_claimAutoreleasedReturnValue(+[_DASApplicationPolicy focalApplicationsWithContext:](_DASApplicationPolicy, "focalApplicationsWithContext:", self->_context));
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          v62 = (char *)objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
          if (!v62)
            goto LABEL_36;
          v61 = *(_QWORD *)v81;
          while (2)
          {
            v10 = 0;
            while (2)
            {
              if (*(_QWORD *)v81 != v61)
              {
                v11 = v10;
                objc_enumerationMutation(v60);
                v10 = v11;
              }
              v64 = v10;
              v68 = *(id *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
              os_unfair_recursive_lock_lock_with_options(p_applicationLaunchRequestsLock, 0);
              v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_applicationLaunchRequests, "objectForKeyedSubscript:", v68));
              v78 = 0u;
              v79 = 0u;
              v76 = 0u;
              v77 = 0u;
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
              if (v14)
              {
                v15 = *(_QWORD *)v77;
                do
                {
                  v16 = 0;
                  do
                  {
                    if (*(_QWORD *)v77 != v15)
                      objc_enumerationMutation(v13);
                    v17 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)v16);
                    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "launchReason"));
                    if (objc_msgSend(v18, "isEqualToString:", v8))
                    {

LABEL_26:
                      objc_msgSend(v12, "addObject:", v17);
                      goto LABEL_27;
                    }
                    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "launchReason"));
                    v20 = objc_msgSend(v19, "isEqualToString:", v71);

                    if (v20)
                      goto LABEL_26;
                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "launchReason"));
                    v22 = objc_msgSend(v21, "isEqualToString:", v70);

                    if (v22)
                    {
                      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
                      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startAfter"));
                      objc_msgSend(v24, "timeIntervalSinceDate:", v23);
                      v26 = v25 > 0.0;

                      if (v26)
                        objc_msgSend(v17, "setStartAfter:", v23);

                    }
LABEL_27:
                    v16 = (char *)v16 + 1;
                  }
                  while (v14 != v16);
                  v27 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
                  v14 = v27;
                }
                while (v27);
              }

              os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
              -[_DASDaemon cancelActivities:](self, "cancelActivities:", v12);
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[_DASApplicationPolicy policyInstance](_DASApplicationPolicy, "policyInstance"));
              objc_msgSend(v28, "updateAppLaunchedRecently:", v68);

              v10 = v64 + 1;
              if (v64 + 1 != v62)
                continue;
              break;
            }
            v62 = (char *)objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
            if (v62)
              continue;
            break;
          }
LABEL_36:

LABEL_37:
          v65 = self->_triggerToActivitiesMap;
          objc_sync_enter(v65);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerToActivitiesMap, "objectForKeyedSubscript:", v59));

          if (v29)
          {
            v30 = objc_msgSend(v59, "isEqualToString:", CFSTR("com.apple.das.fileprotectionpolicy.statuschanged"));
            triggerToActivitiesMap = self->_triggerToActivitiesMap;
            if (v30)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](triggerToActivitiesMap, "objectForKeyedSubscript:", v59));
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              v69 = v32;
              v33 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
              if (!v33)
                goto LABEL_50;
              v34 = *(_QWORD *)v73;
              while (1)
              {
                for (j = 0; j != v33; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v73 != v34)
                    objc_enumerationMutation(v69);
                  v36 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)j);
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "fileProtection"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](_DASFileProtection, "complete"));
                  if (objc_msgSend(v37, "isEqual:", v38))
                  {

                  }
                  else
                  {
                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "fileProtection"));
                    v40 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](_DASFileProtection, "completeUnlessOpen"));
                    v41 = objc_msgSend(v39, "isEqual:", v40);

                    if (!v41)
                      continue;
                  }
                  objc_msgSend(v63, "addObject:", v36);
                }
                v33 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
                if (!v33)
                {
LABEL_50:

                  v42 = v69;
                  goto LABEL_52;
                }
              }
            }
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](triggerToActivitiesMap, "objectForKeyedSubscript:", v59));
            objc_msgSend(v63, "unionSet:", v42);
LABEL_52:

          }
          p_super = &v65->super.super;
          objc_sync_exit(v65);
LABEL_54:

          continue;
        }
      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
    }
    while (v55);
  }

  v43 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = objc_msgSend(v63, "count");
    *(_DWORD *)buf = 134217984;
    v89 = v44;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Evaluating %llu activities based on triggers", buf, 0xCu);
  }

  context = self->_context;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForCallInProgressStatus](_CDContextQueries, "keyPathForCallInProgressStatus"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v46));
  LOBYTE(context) = objc_msgSend(v47, "BOOLValue");

  if ((context & 1) == 0)
    -[_DASDaemon unprotectedEvaluateScoreAndRunActivities:](self, "unprotectedEvaluateScoreAndRunActivities:", v63);
  if (objc_msgSend(v57, "containsObject:", CFSTR("com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin")))
  {
    -[_DASDaemon determineNextTimerFireDateAndSchedule](self, "determineNextTimerFireDateAndSchedule");
    -[_DASDaemon evaluateAssertions](self, "evaluateAssertions");
  }
  if ((objc_msgSend(v57, "containsObject:", CFSTR("com.apple.duetactivityscheduler.databudgetpolicy.status")) & 1) != 0|| (objc_msgSend(v57, "containsObject:", CFSTR("com.apple.duetactivityscheduler.energybudgetpolicy.status")) & 1) != 0|| objc_msgSend(v57, "containsObject:", CFSTR("com.apple.dueatctivityscheduler.photospolicy.photoswork")))
  {
    if (self->_photosIsBlocked)
    {
      if (+[_DASDataBudgetPolicy budgetIsPositive:](_DASDataBudgetPolicy, "budgetIsPositive:", self->_context))
      {
        if (+[_DASEnergyBudgetPolicy budgetIsPositive:](_DASEnergyBudgetPolicy, "budgetIsPositive:", self->_context))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](_DASPhotosPolicy, "policyInstance"));
          v49 = objc_msgSend(v48, "haveSignificantWorkRemaining:", self->_context);

          if ((v49 & 1) == 0)
          {
            v50 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_photosIsBlocked));
              *(_DWORD *)buf = 138543618;
              v89 = obj;
              v90 = 2112;
              v91 = v51;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Reporting photos activity no longer blocked: %{public}@ (was %@)", buf, 0x16u);

            }
            -[_DASDaemon updateiCPLTasksBlocked:](self, "updateiCPLTasksBlocked:", 0);
          }
        }
      }
    }
  }
  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.triggercount"), 1);

}

- (void)handleCompletedActivities:(id)a3
{
  id v4;
  void *v5;
  void *i;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *activityToIncompatibleActivitiesMap;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *groupToPendingTasks;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned __int8 v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v4 = a3;
  v35 = (void *)os_transaction_create("com.apple.dasd.completedActivitiesQueueHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v37)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v8 = self->_activityToIncompatibleActivitiesMap;
        objc_sync_enter(v8);
        activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](activityToIncompatibleActivitiesMap, "objectForKeyedSubscript:", v10));

        if (v11)
        {
          objc_msgSend(v5, "unionSet:", v11);
          v12 = self->_activityToIncompatibleActivitiesMap;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
          -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

        }
        objc_sync_exit(v8);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
        if ((objc_msgSend(v14, "isEqualToString:", _DASDefaultGroupName) & 1) == 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
          if (!objc_msgSend(v15, "isEqualToString:", _DASDefaultNetworkGroupName))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
            v24 = objc_msgSend(v23, "isEqualToString:", _DASDefaultRemoteGroupName);

            if ((v24 & 1) == 0)
              goto LABEL_15;
            goto LABEL_12;
          }

        }
LABEL_12:
        os_unfair_lock_lock(&self->_groupLock);
        groupToPendingTasks = self->_groupToPendingTasks;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groupToPendingTasks, "objectForKeyedSubscript:", v17));
        v19 = objc_msgSend(v18, "copy");

        os_unfair_lock_unlock(&self->_groupLock);
        if (v19)
          objc_msgSend(v5, "unionSet:", v19);

LABEL_15:
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
        if (!v20)
          continue;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
        if ((objc_msgSend(v21, "isEqualToString:", _DASDefaultGroupName) & 1) == 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
          if (objc_msgSend(v22, "isEqualToString:", _DASDefaultNetworkGroupName))
          {

          }
          else
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
            v26 = objc_msgSend(v25, "isEqualToString:", _DASDefaultRemoteGroupName);

            if ((v26 & 1) != 0)
              continue;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
            os_unfair_lock_lock(&self->_groupLock);
            v27 = self->_groupToPendingTasks;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v28));
            v30 = objc_msgSend(v29, "copy");

            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            v20 = v30;
            v31 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            if (v31)
            {
              v32 = *(_QWORD *)v40;
              do
              {
                for (j = 0; j != v31; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v40 != v32)
                    objc_enumerationMutation(v20);
                  v34 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
                  if (objc_msgSend(v34, "isIntensive"))
                    objc_msgSend(v21, "addObject:", v34);
                }
                v31 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
              }
              while (v31);
            }

            os_unfair_lock_unlock(&self->_groupLock);
            if (objc_msgSend(v21, "count"))
              objc_msgSend(v5, "unionSet:", v21);
          }
        }

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v38);
  }

  -[_DASDaemon unprotectedEvaluateScoreAndRunActivities:](self, "unprotectedEvaluateScoreAndRunActivities:", v5);
}

- (void)registerWithContextStoreForId:(id)a3 contextualPredicate:(id)a4 dismissalCondition:(id)a5 deviceSet:(unint64_t)a6 mustWake:(BOOL)a7 qualityOfService:(unsigned int)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _DASDaemon *v21;
  id v22;

  v9 = a7;
  v14 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100009638;
  v19[3] = &unk_10015FF18;
  v20 = a4;
  v21 = self;
  v22 = v14;
  v15 = v14;
  v16 = v20;
  LODWORD(v18) = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualChangeRegistration registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:clientIdentifier:mustWake:qualityOfService:callback:](_CDContextualChangeRegistration, "registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:clientIdentifier:mustWake:qualityOfService:callback:", v15, v16, a5, a6, CFSTR("com.apple.dasd.trigger"), v9, v18, v19));
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v17);

}

- (void)registerTriggersWithContextStoreForPolicies:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *triggerToPolicyMap;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v3 = a3;
  v30 = objc_msgSend(&__NSDictionary0__struct, "mutableCopy");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v3;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v38;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(obj);
        v25 = v4;
        v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v4);
        v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "triggers"));
        if (v29)
        {
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v5 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v5)
          {
            v6 = v5;
            v7 = *(_QWORD *)v34;
            v27 = *(_QWORD *)v34;
            do
            {
              v8 = 0;
              v28 = v6;
              do
              {
                if (*(_QWORD *)v34 != v7)
                  objc_enumerationMutation(v29);
                v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v8);
                v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifier")));
                if (v10)
                {
                  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("predicate")));

                  if (v11)
                  {
                    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("predicate")));
                    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dismissalCondition")));
                    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("deviceSet")));
                    v14 = objc_msgSend(v13, "unsignedIntegerValue");
                    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mustWake")));
                    v16 = objc_msgSend(v15, "BOOLValue");
                    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("qualityOfService")));
                    if (v17)
                    {
                      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("qualityOfService")));
                      v19 = (void *)v32;
                      -[_DASDaemon registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:](self, "registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:", v10, v32, v12, v14, v16, objc_msgSend(v18, "unsignedIntegerValue"));

                    }
                    else
                    {
                      v19 = (void *)v32;
                      -[_DASDaemon registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:](self, "registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:", v10, v32, v12, v14, v16, 17);
                    }

                    v7 = v27;
                    v6 = v28;
                  }
                  objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, v10);
                }

                v8 = (char *)v8 + 1;
              }
              while (v6 != v8);
              v6 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v6);
          }
        }

        v4 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v24);
  }

  v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v30));
  triggerToPolicyMap = self->_triggerToPolicyMap;
  self->_triggerToPolicyMap = v20;

}

- (void)periodicCalculationForOptimal
{
  NSObject *v3;
  os_unfair_recursive_lock_s *p_activityStateLock;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];

  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Periodic scoring of activities for optimal date", buf, 2u);
  }

  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_pendingTasks;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startBefore", (_QWORD)v15));
        objc_msgSend(v12, "timeIntervalSinceDate:", v5);
        v14 = v13;

        if (v14 > 0.0)
          +[_DASConditionScore computeOptimalScoreAndDateForActivity:](_DASConditionScore, "computeOptimalScoreAndDateForActivity:", v11);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

  os_unfair_recursive_lock_unlock(p_activityStateLock);
}

- (id)sortCandidateActivities:(id)a3
{
  _CDLocalContext *context;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  unsigned __int8 v15;
  unsigned __int8 v16;

  context = self->_context;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath](_DASUserRequestedBackupTaskManager, "userRequestedBackupKeyPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = +[_DASPhotosPolicy isPhotosForegroundWithContext:](_DASPhotosPolicy, "isPhotosForegroundWithContext:", self->_context);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000C02DC;
  v14[3] = &unk_10015FF40;
  v15 = v8;
  v16 = v9;
  v14[4] = self;
  v10 = objc_retainBlock(v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingComparator:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v11));
  return v12;
}

- (void)evaluateScoreAndRunActivities:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *evaluationQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  _DASDaemon *v11;
  id v12;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.dasd.evaluateScoreAndRun");
  evaluationQueue = self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C092C;
  block[3] = &unk_10015D530;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_sync((dispatch_queue_t)evaluationQueue, block);

}

- (BOOL)shouldSuspendLongRunningActivity:(id)a3 withStartDate:(id)a4 whileBlockingOtherTasks:(BOOL)a5 atDate:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[_DASDaemon isActivitySuspendable:withStartDate:](self, "isActivitySuspendable:withStartDate:", v10, v11)
    && (!-[_DASRuntimeLimiter onlyPreemptiveSuspend](self->_runtimeLimiter, "onlyPreemptiveSuspend") || v7))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRuntimeLimiter shouldLimitActivityAtRuntime:withStartDate:atDate:withContext:](self->_runtimeLimiter, "shouldLimitActivityAtRuntime:withStartDate:atDate:withContext:", v10, v11, v12, self->_context));
    v15 = v14;
    if (v14)
      v13 = objc_msgSend(v14, "decision") == (id)3;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)shouldPreemptActivity:(id)a3 forFastPassActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  if (!-[_DASDaemon isActivitySuspendable:withStartDate:](self, "isActivitySuspendable:withStartDate:", v6, v8))
  {
    v15 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fastPass"));

  if (v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fastPass"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "processingTaskIdentifiers"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fastPass"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "processingTaskIdentifiers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      if (objc_msgSend(v12, "containsObject:", v13))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fastPass"));
        v15 = v14 == 0;

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

    goto LABEL_12;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)isActivitySuspendable:(id)a3 withStartDate:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suspendRequestDate"));
  if (v7
    || (v10 = objc_msgSend(v6, "schedulingPriority"), !a4)
    || (unint64_t)v10 > _DASSchedulingPriorityDefault)
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

    if (v11
      && (!+[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v6)
       || !+[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:](_DASPhotosPolicy, "isPhotosSyncOverriddenWithContext:", self->_context)))
    {
      v12 = objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
      if (!v12
        || (v13 = (void *)v12,
            v14 = -[_DASDaemon testModeConstraintsApplyToActivity:](self, "testModeConstraintsApplyToActivity:", v6),
            v13,
            (v14 & 1) == 0))
      {
        v8 = 1;
        goto LABEL_4;
      }
    }
  }
  v8 = 0;
LABEL_4:

  return v8;
}

- (id)candidateGroupActivityForPreemption:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (!v6)
  {
    v8 = 0;
    v21 = v5;
LABEL_18:

    goto LABEL_19;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
      v12 = objc_msgSend(v11, "schedulingPriority", (_QWORD)v23);
      if ((unint64_t)v12 <= _DASSchedulingPriorityDefault)
      {
        if (objc_msgSend(v11, "suspendable"))
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
          if (v13)
          {
            v14 = (void *)v13;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "suspendRequestDate"));

            if (!v15)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
              objc_msgSend(v16, "timeIntervalSinceDate:", v4);
              v18 = v17;

              if (v18 > 0.0)
              {
                v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));

                v20 = v11;
                v8 = v20;
                v4 = (void *)v19;
              }
            }
          }
        }
      }
    }
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  }
  while (v7);

  if (v8)
  {
    v21 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Suspending %{public}@ as it may block other high priority activities.", buf, 0xCu);
    }
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

- (id)tasksNoLongerEligibleFromTasks:(id)a3
{
  id v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  __objc2_class **p_superclass;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  double v20;
  void *v21;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _DASRuntimeLimiter *runtimeLimiter;
  void *v29;
  void *v30;
  _DASRuntimeLimiter *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unsigned __int8 v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  __int128 v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  double v62;
  __int16 v63;
  _BOOL4 v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];

  v4 = a3;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v6)
  {
    v8 = v6;
    p_superclass = _DASCPMModePolicy.superclass;
    v10 = *(_QWORD *)v55;
    *(_QWORD *)&v7 = 138412290;
    v49 = v7;
    v51 = v5;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "suspendable", v49))
        {
          if (-[_DASDaemon pausedParametersApplyToActivity:](self, "pausedParametersApplyToActivity:", v12))
          {
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 224, "defaultCategory"));
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Scheduling Paused: Suspending activity: %{public}@", buf, 0xCu);
            }

          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
            objc_msgSend(v52, "timeIntervalSinceDate:", v15);
            v17 = v16 / 60.0;

            if (v17 > 60.0 && v17 < 70.0)
            {
              v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 224, "logForCategory:", CFSTR("lifecycle")));
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suspendRequestDate"));
                -[_DASRuntimeLimiter maximumRuntimeForActivity:](self->_runtimeLimiter, "maximumRuntimeForActivity:", v12);
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20 / 60.0));
                *(_DWORD *)buf = 138544130;
                v60 = v12;
                v61 = 2048;
                v62 = v17;
                v63 = 1024;
                v64 = v19 != 0;
                v65 = 2112;
                v66 = v21;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ running for %lf mins (suspendRequested=%u), Max runtime: %@ mins", buf, 0x26u);

              }
              v5 = v51;
            }
            if (v17 > 90.0 && v17 < 100.0)
            {
              v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 224, "logForCategory:", CFSTR("lifecycle")));
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suspendRequestDate"));
                *(_DWORD *)buf = 138543874;
                v60 = v12;
                v61 = 2048;
                v62 = v17;
                v63 = 1024;
                v64 = v24 != 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ running for %lf mins (suspendRequested=%u)", buf, 0x1Cu);

              }
            }
            if (v17 > 120.0 && v17 < 130.0)
            {
              v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(p_superclass + 224, "logForCategory:", CFSTR("lifecycle")));
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suspendRequestDate"));
                *(_DWORD *)buf = 138543874;
                v60 = v12;
                v61 = 2048;
                v62 = v17;
                v63 = 1024;
                v64 = v26 != 0;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ running for %lf mins (suspendRequested=%u)", buf, 0x1Cu);

              }
            }
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suspendRequestDate"));

          if (!v27)
          {
            runtimeLimiter = self->_runtimeLimiter;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRuntimeLimiter shouldLimitActivityAtRuntime:withStartDate:atDate:withContext:](runtimeLimiter, "shouldLimitActivityAtRuntime:withStartDate:atDate:withContext:", v12, v29, v52, self->_context));

            if (v30 && objc_msgSend(v30, "decision") == (id)3)
            {
              v31 = self->_runtimeLimiter;
              v58 = v30;
              v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
              LODWORD(v31) = -[_DASRuntimeLimiter limitedActivity:withLimitsResponses:](v31, "limitedActivity:withLimitsResponses:", v12, v32);

              if ((_DWORD)v31)
              {
                v33 = objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
                if (v33)
                {
                  v34 = (void *)v33;
                  v35 = -[_DASDaemon testModeConstraintsApplyToActivity:](self, "testModeConstraintsApplyToActivity:", v12);

                  if ((v35 & 1) != 0)
                  {
                    v36 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v60 = v12;
                      _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "WARNING: Test mode is on so activity %{public}@ is not being suspended for running too long", buf, 0xCu);
                    }

                    goto LABEL_55;
                  }
                }
                v45 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("runtimeLimiter")));
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v60 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Suspending %{public}@ - running for too long", buf, 0xCu);
                }

                -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:](self, "updateSuspendRequestDate:forActivity:withReason:", v52, v12, CFSTR("Limitations"));
LABEL_54:
                objc_msgSend(v50, "addObject:", v12);
              }
            }
            else
            {
              v53 = 0;
              +[_DASConditionScore scoreForActivity:withState:response:](_DASConditionScore, "scoreForActivity:withState:response:", v12, self->_context, &v53);
              if (v53 == 100 || v53 == 33)
              {
                v37 = objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
                if (v37)
                {
                  v38 = (void *)v37;
                  v39 = -[_DASDaemon testModeConstraintsApplyToActivity:](self, "testModeConstraintsApplyToActivity:", v12);

                  if (v39)
                  {
                    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "policyScores"));
                    v43 = -[_DASDaemon testModeConstraintsRequireOverridingDecisionWithScores:ignoredPolicies:honoredPolicies:](self, "testModeConstraintsRequireOverridingDecisionWithScores:ignoredPolicies:honoredPolicies:", v42, v40, v41);

                    if (v43)
                    {
                      v44 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = v49;
                        v60 = v12;
                        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Test Mode: Not suspending: %@", buf, 0xCu);
                      }

                      v5 = v51;
                      goto LABEL_55;
                    }

                    v5 = v51;
                  }
                }
                v46 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v60 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Suspending %{public}@ - required criterion is not satisfied.", buf, 0xCu);
                }

                v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
                -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:](self, "updateSuspendRequestDate:forActivity:withReason:", v47, v12, 0);

                goto LABEL_54;
              }
            }
LABEL_55:

            p_superclass = (__objc2_class **)(_DASCPMModePolicy + 8);
            continue;
          }
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v8);
  }

  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.suspensioncount"), objc_msgSend(v50, "count"));
  return v50;
}

- (id)tasksNoLongerEligible
{
  os_unfair_recursive_lock_s *p_activityStateLock;
  void *v4;
  void *v5;

  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_runningTasks, "allObjects"));
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon tasksNoLongerEligibleFromTasks:](self, "tasksNoLongerEligibleFromTasks:", v4));

  return v5;
}

- (void)updateSuspendRequestDate:(id)a3 forActivity:(id)a4 withReason:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  objc_msgSend(v11, "setSuspendRequestDate:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](_DASPLLogger, "sharedInstance"));
  objc_msgSend(v8, "recordActivityLifeCycleSuspend:", v11);

  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:](_DASMetricRecorder, "incrementOccurrencesForKey:byCount:", CFSTR("com.apple.das.suspensioncount"), 1);
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Limitations")))
  {
    objc_msgSend(v11, "setLastDenialValue:", (unint64_t)objc_msgSend(v11, "lastDenialValue") | +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", CFSTR("Limitations")));
    if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:](_DASCheckpointRecorder, "shouldLogCheckpointForActivity:", v11))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
      objc_msgSend(v9, "reportTaskCheckpoint:forTask:error:", 45, v11, 0);

    }
  }
  else
  {
    v10 = CFSTR("Sysdiagnose");
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Sysdiagnose"))
      || (v10 = CFSTR("Preemption"), objc_msgSend(v7, "isEqualToString:", CFSTR("Preemption")))
      || (v10 = CFSTR("Incompatibility"), objc_msgSend(v7, "isEqualToString:", CFSTR("Incompatibility"))))
    {
      objc_msgSend(v11, "setLastDenialValue:", (unint64_t)objc_msgSend(v11, "lastDenialValue") | +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", v10));
    }
  }

}

- (void)reportPostRestoreCheckpoint:(unint64_t)a3 withParameters:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = kBGSTKeyTaskName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kBGSTKeyTaskName));
  v10 = objc_opt_class(NSArray);
  isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v8));
  v13 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  }
  else
  {
    v15 = objc_opt_class(NSString);
    v16 = objc_opt_isKindOfClass(v13, v15);

    if ((v16 & 1) != 0)
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v8));
    else
      v14 = 0;
  }
  v17 = kBGSTKeyFeatureCode;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kBGSTKeyFeatureCode));
  v19 = objc_opt_class(NSArray);
  v20 = objc_opt_isKindOfClass(v18, v19);

  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v17));
  v22 = (void *)v21;
  if ((v20 & 1) != 0)
  {

  }
  else
  {
    v34 = v21;
    v23 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));

    v22 = (void *)v23;
  }
  v24 = kBGSTKeyInvolvedProcesses;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kBGSTKeyInvolvedProcesses));
  v26 = objc_opt_class(NSArray);
  v27 = objc_opt_isKindOfClass(v25, v26);

  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v24));
  v29 = (void *)v28;
  if ((v27 & 1) == 0)
  {
    v33 = v28;
    v30 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));

    v7 = v29;
    v29 = (void *)v30;
  }

  if (a3 == 30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kBGSTKeyPaused));
    objc_msgSend(v31, "BOOLValue");

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPostRestoreBUILogger sharedInstance](_DASPostRestoreBUILogger, "sharedInstance"));
  objc_msgSend(v32, "reportState:forTaskName:featureCode:involvedProcesses:", a3, v14, v22, v29);

}

- (void)activityStartedWithParameters:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kBGSTKeyFeatureCode));

  if (v4)
    -[_DASDaemon reportPostRestoreCheckpoint:withParameters:](self, "reportPostRestoreCheckpoint:withParameters:", 20, v5);
  -[_DASBudgetManager reportActivityRunningWithParameters:](self->_budgetManager, "reportActivityRunningWithParameters:", v5);

}

- (void)activityStoppedWithParameters:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[7];
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kBGSTKeyFeatureCode));

  if (v5)
    -[_DASDaemon reportPostRestoreCheckpoint:withParameters:](self, "reportPostRestoreCheckpoint:withParameters:", 30, v4);
  -[_DASBudgetManager reportActivityNoLongerRunningWithParameters:](self->_budgetManager, "reportActivityNoLongerRunningWithParameters:", v4);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1000B383C;
  v11[4] = sub_1000B384C;
  v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1000B383C;
  v9[4] = sub_1000B384C;
  v10 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1000B383C;
  v7[4] = sub_1000B384C;
  v8 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C1CF8;
  v6[3] = &unk_10015FF68;
  v6[4] = v11;
  v6[5] = v7;
  v6[6] = v9;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);

}

- (void)reportActivityTiming:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C1EA4;
  v6[3] = &unk_10015FD60;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = v3;
  v4 = v3;
  v5 = v7;
  AnalyticsSendEventLazy(CFSTR("com.apple.das.activity.timing.minimal"), v6);

}

- (void)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 withHandler:(id)a5
{
  void (**v7)(id, id, id);
  void *v8;
  id v9;
  id v10;
  id v11;

  v7 = (void (**)(id, id, id))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASSystemWorkloadRecorder sharedInstance](_DASSystemWorkloadRecorder, "sharedInstance"));
  v11 = 0;
  v9 = objc_msgSend(v8, "recordWorkload:ofCategory:error:", a3, a4, &v11);
  v10 = v11;

  v7[2](v7, v9, v10);
}

- (void)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 withHandler:(id)a5
{
  void (**v7)(id, id, id);
  void *v8;
  id v9;
  id v10;
  id v11;

  v7 = (void (**)(id, id, id))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
  v11 = 0;
  v9 = objc_msgSend(v8, "reportFeatureCheckpoint:forFeature:error:", a3, a4, &v11);
  v10 = v11;

  v7[2](v7, v9, v10);
}

- (void)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 withHandler:(id)a5
{
  void (**v7)(id, id, id);
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v7 = (void (**)(id, id, id))a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](_DASCheckpointRecorder, "sharedInstance"));
  v12 = 0;
  v10 = objc_msgSend(v9, "reportCustomCheckpoint:forTask:error:", a3, v8, &v12);

  v11 = v12;
  v7[2](v7, v10, v11);

}

- (void)extensionActivity:(id)a3 finishedWithStatus:(unsigned __int8)a4
{
  int v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with status %hhu", (uint8_t *)&v10, 0x12u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "extensionIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlugin existingPluginForIdentifier:ofType:](_DASPlugin, "existingPluginForIdentifier:ofType:", v8, CFSTR("com.apple.ml-extension")));

  objc_msgSend(v9, "unload");
  if (v4 == 2)
  {
    -[_DASDaemon activityCanceled:](self, "activityCanceled:", v6);
    -[_DASDaemon submitActivity:](self, "submitActivity:", v6);
  }
  else
  {
    -[_DASDaemon activityCompleted:](self, "activityCompleted:", v6);
  }

}

- (void)prewarmApplication:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](_APRSPrewarmInterface, "sharedInstance"));
  v4 = objc_msgSend(v3, "prewarmLaunchAppFromBundleID:", v5);

}

- (void)prewarmSuspendApplication:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](_APRSPrewarmInterface, "sharedInstance"));
  objc_msgSend(v7, "invalidatePrewarmAssertionForApplication:onInvalidation:", v6, v5);

}

- (void)_unexpectedXPCObject:(id)a3 WithLog:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a4;
  v6 = (void *)xpc_dictionary_copy_basic_description(a3);
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1000EA6AC();

  free(v6);
}

- (void)_prewarmSuspendForMessage:(id)a3
{
  id v4;
  __int128 v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;

  v4 = a3;
  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  v16 = v5;
  v17 = v5;
  xpc_dictionary_get_audit_token();
  if (DWORD1(v17) == -1)
  {
    -[_DASDaemon _unexpectedXPCObject:WithLog:](self, "_unexpectedXPCObject:WithLog:", v4, CFSTR("Prewarm suspend failed to fetch audit token"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
    v15 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v6, &v15));
    v8 = v15;

    v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        *(_DWORD *)buf = 138412290;
        v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Suspending prewarm for %@", buf, 0xCu);

      }
      v9 = objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](_APRSPrewarmInterface, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      -[NSObject invalidatePrewarmAssertionForApplication:](v9, "invalidatePrewarmAssertionForApplication:", v14);

    }
    else if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Prewarm suspend failed to fetch handle with error %@", buf, 0xCu);
    }

  }
}

- (void)_prewarmSuspendHandleIncoming:(id)a3 onConnection:(id)a4
{
  id v6;
  _xpc_connection_s *v7;
  os_unfair_lock_s *p_prewarmInvalidationLock;
  xpc_object_t reply;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD v21[2];

  v6 = a3;
  v7 = (_xpc_connection_s *)a4;
  p_prewarmInvalidationLock = &self->_prewarmInvalidationLock;
  os_unfair_lock_lock(&self->_prewarmInvalidationLock);
  if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[_DASDaemon _prewarmSuspendForMessage:](self, "_prewarmSuspendForMessage:", v6);
    reply = xpc_dictionary_create_reply(v6);
    v10 = reply;
    if (v7 && reply)
    {
      xpc_connection_send_message(v7, reply);
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1000EA720(v13, v14, v15, v16, v17, v18, v19, v20);

    }
  }
  else if (v6 == &_xpc_error_connection_invalid)
  {
    -[NSMutableSet removeObject:](self->_prewarmInvalidationConnections, "removeObject:", v7);
    v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = -[NSMutableSet count](self->_prewarmInvalidationConnections, "count");
      v21[0] = 67109120;
      v21[1] = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "setupPrewarmSuspendListener connection invalidated (outstanding connections: %d)", (uint8_t *)v21, 8u);
    }

  }
  else
  {
    -[_DASDaemon _unexpectedXPCObject:WithLog:](self, "_unexpectedXPCObject:WithLog:", v6, CFSTR("Prewarm suspend connection received unexpected message"));
  }
  os_unfair_lock_unlock(p_prewarmInvalidationLock);

}

- (void)setupPrewarmSuspendListener
{
  os_unfair_lock_s *p_prewarmInvalidationLock;
  NSMutableSet *v4;
  NSMutableSet *prewarmInvalidationConnections;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  OS_xpc_object *mach_service;
  OS_xpc_object *prewarmInvalidationListener;
  OS_xpc_object *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD handler[5];

  self->_prewarmInvalidationLock._os_unfair_lock_opaque = 0;
  p_prewarmInvalidationLock = &self->_prewarmInvalidationLock;
  os_unfair_lock_lock(&self->_prewarmInvalidationLock);
  v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  prewarmInvalidationConnections = self->_prewarmInvalidationConnections;
  self->_prewarmInvalidationConnections = v4;

  global_queue = dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  mach_service = xpc_connection_create_mach_service("com.apple.dasd.end-prewarm", v7, 1uLL);
  prewarmInvalidationListener = self->_prewarmInvalidationListener;
  self->_prewarmInvalidationListener = mach_service;

  v10 = self->_prewarmInvalidationListener;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000C2E98;
  handler[3] = &unk_10015FFB8;
  handler[4] = self;
  xpc_connection_set_event_handler(v10, handler);
  xpc_connection_activate(self->_prewarmInvalidationListener);
  os_unfair_lock_unlock(p_prewarmInvalidationLock);
  v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("lifecycle")));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setupPrewarmSuspendListener complete", v12, 2u);
  }

}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (os_unfair_recursive_lock_s)activityStateLock
{
  return self->_activityStateLock;
}

- (void)setActivityStateLock:(os_unfair_recursive_lock_s)a3
{
  self->_activityStateLock = a3;
}

- (NSMutableSet)pendingTasks
{
  return self->_pendingTasks;
}

- (void)setPendingTasks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTasks, a3);
}

- (NSMutableSet)prerunningTasks
{
  return self->_prerunningTasks;
}

- (void)setPrerunningTasks:(id)a3
{
  objc_storeStrong((id *)&self->_prerunningTasks, a3);
}

- (NSMutableSet)runningTasks
{
  return self->_runningTasks;
}

- (void)setRunningTasks:(id)a3
{
  objc_storeStrong((id *)&self->_runningTasks, a3);
}

- (NSDictionary)triggerToPolicyMap
{
  return self->_triggerToPolicyMap;
}

- (void)setTriggerToPolicyMap:(id)a3
{
  objc_storeStrong((id *)&self->_triggerToPolicyMap, a3);
}

- (NSMutableDictionary)triggerToActivitiesMap
{
  return self->_triggerToActivitiesMap;
}

- (void)setTriggerToActivitiesMap:(id)a3
{
  objc_storeStrong((id *)&self->_triggerToActivitiesMap, a3);
}

- (NSMutableDictionary)activityToIncompatibleActivitiesMap
{
  return self->_activityToIncompatibleActivitiesMap;
}

- (void)setActivityToIncompatibleActivitiesMap:(id)a3
{
  objc_storeStrong((id *)&self->_activityToIncompatibleActivitiesMap, a3);
}

- (os_unfair_lock_s)groupLock
{
  return self->_groupLock;
}

- (void)setGroupLock:(os_unfair_lock_s)a3
{
  self->_groupLock = a3;
}

- (NSMutableDictionary)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (NSMutableDictionary)groupToPendingTasks
{
  return self->_groupToPendingTasks;
}

- (void)setGroupToPendingTasks:(id)a3
{
  objc_storeStrong((id *)&self->_groupToPendingTasks, a3);
}

- (NSMutableDictionary)groupToRunningTasks
{
  return self->_groupToRunningTasks;
}

- (void)setGroupToRunningTasks:(id)a3
{
  objc_storeStrong((id *)&self->_groupToRunningTasks, a3);
}

- (NSMutableDictionary)groupToPrerunningTasks
{
  return self->_groupToPrerunningTasks;
}

- (void)setGroupToPrerunningTasks:(id)a3
{
  objc_storeStrong((id *)&self->_groupToPrerunningTasks, a3);
}

- (os_unfair_recursive_lock_s)applicationLaunchRequestsLock
{
  return self->_applicationLaunchRequestsLock;
}

- (void)setApplicationLaunchRequestsLock:(os_unfair_recursive_lock_s)a3
{
  self->_applicationLaunchRequestsLock = a3;
}

- (NSMutableDictionary)applicationLaunchRequests
{
  return self->_applicationLaunchRequests;
}

- (void)setApplicationLaunchRequests:(id)a3
{
  objc_storeStrong((id *)&self->_applicationLaunchRequests, a3);
}

- (NSMutableDictionary)applicationsLaunched
{
  return self->_applicationsLaunched;
}

- (void)setApplicationsLaunched:(id)a3
{
  objc_storeStrong((id *)&self->_applicationsLaunched, a3);
}

- (NSMutableDictionary)extensionLaunchRequests
{
  return self->_extensionLaunchRequests;
}

- (void)setExtensionLaunchRequests:(id)a3
{
  objc_storeStrong((id *)&self->_extensionLaunchRequests, a3);
}

- (_DASUserRequestedBackupTaskManager)backupTaskManager
{
  return self->_backupTaskManager;
}

- (void)setBackupTaskManager:(id)a3
{
  objc_storeStrong((id *)&self->_backupTaskManager, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSXPCListener)bgstListener
{
  return self->_bgstListener;
}

- (void)setBgstListener:(id)a3
{
  objc_storeStrong((id *)&self->_bgstListener, a3);
}

- (OS_dispatch_queue)timerSchedulingQueue
{
  return self->_timerSchedulingQueue;
}

- (void)setTimerSchedulingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_timerSchedulingQueue, a3);
}

- (_DASTimer)schedulingTimer
{
  return self->_schedulingTimer;
}

- (void)setSchedulingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_schedulingTimer, a3);
}

- (NSDate)timerEarliestFireDate
{
  return self->_timerEarliestFireDate;
}

- (void)setTimerEarliestFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_timerEarliestFireDate, a3);
}

- (NSDate)timerLatestFireDate
{
  return self->_timerLatestFireDate;
}

- (void)setTimerLatestFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_timerLatestFireDate, a3);
}

- (_DASNetworkEvaluationMonitor)networkEvaluationMonitor
{
  return self->_networkEvaluationMonitor;
}

- (void)setNetworkEvaluationMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkEvaluationMonitor, a3);
}

- (_DASSleepWakeMonitor)sleepWakeMonitor
{
  return self->_sleepWakeMonitor;
}

- (void)setSleepWakeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_sleepWakeMonitor, a3);
}

- (_DASRemoteDeviceNearbyMonitor)remoteDeviceNearbyMonitor
{
  return self->_remoteDeviceNearbyMonitor;
}

- (void)setRemoteDeviceNearbyMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceNearbyMonitor, a3);
}

- (_DASRemoteDeviceWakeMonitor)remoteDeviceWakeMonitor
{
  return self->_remoteDeviceWakeMonitor;
}

- (void)setRemoteDeviceWakeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceWakeMonitor, a3);
}

- (_DASRemoteDeviceActivityMonitor)remoteDeviceActivityMonitor
{
  return self->_remoteDeviceActivityMonitor;
}

- (void)setRemoteDeviceActivityMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceActivityMonitor, a3);
}

- (_DASSmartPowerNapMonitor)smartPowerNapMonitor
{
  return self->_smartPowerNapMonitor;
}

- (void)setSmartPowerNapMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_smartPowerNapMonitor, a3);
}

- (_DASCPMModeMonitor)cpmModeMonitor
{
  return self->_cpmModeMonitor;
}

- (void)setCpmModeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_cpmModeMonitor, a3);
}

- (_DASBacklightStateMonitor)backlightStateMonitor
{
  return self->_backlightStateMonitor;
}

- (void)setBacklightStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_backlightStateMonitor, a3);
}

- (void)setEnManager:(id)a3
{
  objc_storeStrong((id *)&self->_enManager, a3);
}

- (_DASDiskSpaceMonitor)diskSpaceMonitor
{
  return self->_diskSpaceMonitor;
}

- (void)setDiskSpaceMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_diskSpaceMonitor, a3);
}

- (_DASDataStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (OS_dispatch_source)optimalScoringTimer
{
  return self->_optimalScoringTimer;
}

- (void)setOptimalScoringTimer:(id)a3
{
  objc_storeStrong((id *)&self->_optimalScoringTimer, a3);
}

- (OS_dispatch_source)databaseMaintenanceTimer
{
  return self->_databaseMaintenanceTimer;
}

- (void)setDatabaseMaintenanceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_databaseMaintenanceTimer, a3);
}

- (OS_dispatch_source)groupMonitoringTimer
{
  return self->_groupMonitoringTimer;
}

- (void)setGroupMonitoringTimer:(id)a3
{
  objc_storeStrong((id *)&self->_groupMonitoringTimer, a3);
}

- (OS_dispatch_queue)evaluationQueue
{
  return self->_evaluationQueue;
}

- (void)setEvaluationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationQueue, a3);
}

- (_DASBatchingQueue)triggerBatchingQueue
{
  return self->_triggerBatchingQueue;
}

- (void)setTriggerBatchingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_triggerBatchingQueue, a3);
}

- (_DASBatchingQueue)triggerRecorderBatchingQueue
{
  return self->_triggerRecorderBatchingQueue;
}

- (void)setTriggerRecorderBatchingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_triggerRecorderBatchingQueue, a3);
}

- (_DASBatchingQueue)activityCompletedBatchingQueue
{
  return self->_activityCompletedBatchingQueue;
}

- (void)setActivityCompletedBatchingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activityCompletedBatchingQueue, a3);
}

- (_DASBatchingQueue)networkActivitiesQueue
{
  return self->_networkActivitiesQueue;
}

- (void)setNetworkActivitiesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_networkActivitiesQueue, a3);
}

- (_DASFairScheduleManager)fairScheduleManager
{
  return self->_fairScheduleManager;
}

- (void)setFairScheduleManager:(id)a3
{
  objc_storeStrong((id *)&self->_fairScheduleManager, a3);
}

- (_DASActivityRateLimitManager)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimiter, a3);
}

- (_DASControlEngine)controlEnginge
{
  return self->_controlEnginge;
}

- (void)setControlEnginge:(id)a3
{
  objc_storeStrong((id *)&self->_controlEnginge, a3);
}

- (_DASRuntimeLimiter)runtimeLimiter
{
  return self->_runtimeLimiter;
}

- (void)setRuntimeLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_runtimeLimiter, a3);
}

- (_DASConfigurationLimiter)configurationLimiter
{
  return self->_configurationLimiter;
}

- (void)setConfigurationLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_configurationLimiter, a3);
}

- (_DASFeatureDurationTracker)featureDurationTracker
{
  return self->_featureDurationTracker;
}

- (void)setFeatureDurationTracker:(id)a3
{
  objc_storeStrong((id *)&self->_featureDurationTracker, a3);
}

- (NSMutableDictionary)recentlyLaunchedApps
{
  return self->_recentlyLaunchedApps;
}

- (void)setRecentlyLaunchedApps:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyLaunchedApps, a3);
}

- (NSCountedSet)launchesPerApp
{
  return self->_launchesPerApp;
}

- (void)setLaunchesPerApp:(id)a3
{
  objc_storeStrong((id *)&self->_launchesPerApp, a3);
}

- (OS_dispatch_source)launchTimeResetTimer
{
  return self->_launchTimeResetTimer;
}

- (void)setLaunchTimeResetTimer:(id)a3
{
  objc_storeStrong((id *)&self->_launchTimeResetTimer, a3);
}

- (OS_dispatch_queue)launchQueue
{
  return self->_launchQueue;
}

- (void)setLaunchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_launchQueue, a3);
}

- (OS_dispatch_queue)groupMonitoringQueue
{
  return self->_groupMonitoringQueue;
}

- (void)setGroupMonitoringQueue:(id)a3
{
  objc_storeStrong((id *)&self->_groupMonitoringQueue, a3);
}

- (_DASBlueListManager)blueListManager
{
  return self->_blueListManager;
}

- (void)setBlueListManager:(id)a3
{
  objc_storeStrong((id *)&self->_blueListManager, a3);
}

- (OS_dispatch_queue)activityLaunchQueue
{
  return self->_activityLaunchQueue;
}

- (void)setActivityLaunchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activityLaunchQueue, a3);
}

- (_DASSwapPredictionManager)swapManager
{
  return self->_swapManager;
}

- (void)setSwapManager:(id)a3
{
  objc_storeStrong((id *)&self->_swapManager, a3);
}

- (_APRSManager)appResumeManager
{
  return self->_appResumeManager;
}

- (void)setAppResumeManager:(id)a3
{
  objc_storeStrong((id *)&self->_appResumeManager, a3);
}

- (_DASClosureManager)closureManager
{
  return self->_closureManager;
}

- (void)setClosureManager:(id)a3
{
  objc_storeStrong((id *)&self->_closureManager, a3);
}

- (_DASBudgetManager)budgetManager
{
  return self->_budgetManager;
}

- (void)setBudgetManager:(id)a3
{
  objc_storeStrong((id *)&self->_budgetManager, a3);
}

- (_DASActivityDependencyManager)dependencyManager
{
  return self->_dependencyManager;
}

- (void)setDependencyManager:(id)a3
{
  objc_storeStrong((id *)&self->_dependencyManager, a3);
}

- (unint64_t)photosIsBlocked
{
  return self->_photosIsBlocked;
}

- (void)setPhotosIsBlocked:(unint64_t)a3
{
  self->_photosIsBlocked = a3;
}

- (os_unfair_lock_s)constraintsLock
{
  return self->_constraintsLock;
}

- (void)setConstraintsLock:(os_unfair_lock_s)a3
{
  self->_constraintsLock = a3;
}

- (_CDContextualKeyPath)utilityConstraintsKP
{
  return self->_utilityConstraintsKP;
}

- (void)setUtilityConstraintsKP:(id)a3
{
  objc_storeStrong((id *)&self->_utilityConstraintsKP, a3);
}

- (_CDContextualKeyPath)maintenanceConstraintsKP
{
  return self->_maintenanceConstraintsKP;
}

- (void)setMaintenanceConstraintsKP:(id)a3
{
  objc_storeStrong((id *)&self->_maintenanceConstraintsKP, a3);
}

- (unint64_t)utilityConstraints
{
  return self->_utilityConstraints;
}

- (void)setUtilityConstraints:(unint64_t)a3
{
  self->_utilityConstraints = a3;
}

- (unint64_t)maintenanceConstraints
{
  return self->_maintenanceConstraints;
}

- (void)setMaintenanceConstraints:(unint64_t)a3
{
  self->_maintenanceConstraints = a3;
}

- (NSDictionary)testModeParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 552, 1);
}

- (void)setTestModeParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (void)setPausedParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (NSUserDefaults)testingDefaults
{
  return self->_testingDefaults;
}

- (void)setTestingDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_testingDefaults, a3);
}

- (os_unfair_lock_s)signpostLock
{
  return self->_signpostLock;
}

- (void)setSignpostLock:(os_unfair_lock_s)a3
{
  self->_signpostLock = a3;
}

- (NSMutableSet)signpostActivitiesRunningDeviceActive
{
  return self->_signpostActivitiesRunningDeviceActive;
}

- (void)setSignpostActivitiesRunningDeviceActive:(id)a3
{
  objc_storeStrong((id *)&self->_signpostActivitiesRunningDeviceActive, a3);
}

- (NSMutableSet)signpostActivitiesRunningScreenOff
{
  return self->_signpostActivitiesRunningScreenOff;
}

- (void)setSignpostActivitiesRunningScreenOff:(id)a3
{
  objc_storeStrong((id *)&self->_signpostActivitiesRunningScreenOff, a3);
}

- (void)setActivitiesWaitingForBGTaskClients:(id)a3
{
  objc_storeStrong((id *)&self->_activitiesWaitingForBGTaskClients, a3);
}

- (void)setConnectedBGTaskClients:(id)a3
{
  objc_storeStrong((id *)&self->_connectedBGTaskClients, a3);
}

- (_DASActivityProfiler)profiler
{
  return self->_profiler;
}

- (void)setProfiler:(id)a3
{
  objc_storeStrong((id *)&self->_profiler, a3);
}

- (_DASBackgroundAppKillDemo)bgAppKillDemoInstance
{
  return self->_bgAppKillDemoInstance;
}

- (void)setBgAppKillDemoInstance:(id)a3
{
  objc_storeStrong((id *)&self->_bgAppKillDemoInstance, a3);
}

- (void)setPowerAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_powerAssertions, a3);
}

- (_DASTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (BOOL)recomEngineDisabled
{
  return self->_recomEngineDisabled;
}

- (void)setRecomEngineDisabled:(BOOL)a3
{
  self->_recomEngineDisabled = a3;
}

- (OS_xpc_object)prewarmInvalidationListener
{
  return self->_prewarmInvalidationListener;
}

- (void)setPrewarmInvalidationListener:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmInvalidationListener, a3);
}

- (NSMutableSet)prewarmInvalidationConnections
{
  return self->_prewarmInvalidationConnections;
}

- (void)setPrewarmInvalidationConnections:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmInvalidationConnections, a3);
}

- (os_unfair_lock_s)prewarmInvalidationLock
{
  return self->_prewarmInvalidationLock;
}

- (void)setPrewarmInvalidationLock:(os_unfair_lock_s)a3
{
  self->_prewarmInvalidationLock = a3;
}

- (_DASNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManager, a3);
}

- (BOOL)taskRegistryMode
{
  return self->_taskRegistryMode;
}

- (void)setTaskRegistryMode:(BOOL)a3
{
  self->_taskRegistryMode = a3;
}

- (NSSet)taskRegistryProcesses
{
  return self->_taskRegistryProcesses;
}

- (void)setTaskRegistryProcesses:(id)a3
{
  objc_storeStrong((id *)&self->_taskRegistryProcesses, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (_DASBARScheduler)barScheduler
{
  return self->_barScheduler;
}

- (void)setBarScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_barScheduler, a3);
}

- (_DASDock)applicationDock
{
  return self->_applicationDock;
}

- (void)setApplicationDock:(id)a3
{
  objc_storeStrong((id *)&self->_applicationDock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationDock, 0);
  objc_storeStrong((id *)&self->_barScheduler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_taskRegistryProcesses, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_prewarmInvalidationConnections, 0);
  objc_storeStrong((id *)&self->_prewarmInvalidationListener, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_powerAssertions, 0);
  objc_storeStrong((id *)&self->_bgAppKillDemoInstance, 0);
  objc_storeStrong((id *)&self->_profiler, 0);
  objc_storeStrong((id *)&self->_connectedBGTaskClients, 0);
  objc_storeStrong((id *)&self->_activitiesWaitingForBGTaskClients, 0);
  objc_storeStrong((id *)&self->_signpostActivitiesRunningScreenOff, 0);
  objc_storeStrong((id *)&self->_signpostActivitiesRunningDeviceActive, 0);
  objc_storeStrong((id *)&self->_testingDefaults, 0);
  objc_storeStrong((id *)&self->_pausedParameters, 0);
  objc_storeStrong((id *)&self->_testModeParameters, 0);
  objc_storeStrong((id *)&self->_maintenanceConstraintsKP, 0);
  objc_storeStrong((id *)&self->_utilityConstraintsKP, 0);
  objc_storeStrong((id *)&self->_dependencyManager, 0);
  objc_storeStrong((id *)&self->_budgetManager, 0);
  objc_storeStrong((id *)&self->_closureManager, 0);
  objc_storeStrong((id *)&self->_appResumeManager, 0);
  objc_storeStrong((id *)&self->_swapManager, 0);
  objc_storeStrong((id *)&self->_activityLaunchQueue, 0);
  objc_storeStrong((id *)&self->_blueListManager, 0);
  objc_storeStrong((id *)&self->_groupMonitoringQueue, 0);
  objc_storeStrong((id *)&self->_launchQueue, 0);
  objc_storeStrong((id *)&self->_launchTimeResetTimer, 0);
  objc_storeStrong((id *)&self->_launchesPerApp, 0);
  objc_storeStrong((id *)&self->_recentlyLaunchedApps, 0);
  objc_storeStrong((id *)&self->_featureDurationTracker, 0);
  objc_storeStrong((id *)&self->_configurationLimiter, 0);
  objc_storeStrong((id *)&self->_runtimeLimiter, 0);
  objc_storeStrong((id *)&self->_controlEnginge, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_fairScheduleManager, 0);
  objc_storeStrong((id *)&self->_networkActivitiesQueue, 0);
  objc_storeStrong((id *)&self->_activityCompletedBatchingQueue, 0);
  objc_storeStrong((id *)&self->_triggerRecorderBatchingQueue, 0);
  objc_storeStrong((id *)&self->_triggerBatchingQueue, 0);
  objc_storeStrong((id *)&self->_evaluationQueue, 0);
  objc_storeStrong((id *)&self->_groupMonitoringTimer, 0);
  objc_storeStrong((id *)&self->_databaseMaintenanceTimer, 0);
  objc_storeStrong((id *)&self->_optimalScoringTimer, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_diskSpaceMonitor, 0);
  objc_storeStrong((id *)&self->_enManager, 0);
  objc_storeStrong((id *)&self->_backlightStateMonitor, 0);
  objc_storeStrong((id *)&self->_cpmModeMonitor, 0);
  objc_storeStrong((id *)&self->_smartPowerNapMonitor, 0);
  objc_storeStrong((id *)&self->_remoteDeviceActivityMonitor, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWakeMonitor, 0);
  objc_storeStrong((id *)&self->_remoteDeviceNearbyMonitor, 0);
  objc_storeStrong((id *)&self->_sleepWakeMonitor, 0);
  objc_storeStrong((id *)&self->_networkEvaluationMonitor, 0);
  objc_storeStrong((id *)&self->_timerLatestFireDate, 0);
  objc_storeStrong((id *)&self->_timerEarliestFireDate, 0);
  objc_storeStrong((id *)&self->_schedulingTimer, 0);
  objc_storeStrong((id *)&self->_timerSchedulingQueue, 0);
  objc_storeStrong((id *)&self->_bgstListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_backupTaskManager, 0);
  objc_storeStrong((id *)&self->_extensionLaunchRequests, 0);
  objc_storeStrong((id *)&self->_applicationsLaunched, 0);
  objc_storeStrong((id *)&self->_applicationLaunchRequests, 0);
  objc_storeStrong((id *)&self->_groupToPrerunningTasks, 0);
  objc_storeStrong((id *)&self->_groupToRunningTasks, 0);
  objc_storeStrong((id *)&self->_groupToPendingTasks, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_activityToIncompatibleActivitiesMap, 0);
  objc_storeStrong((id *)&self->_triggerToActivitiesMap, 0);
  objc_storeStrong((id *)&self->_triggerToPolicyMap, 0);
  objc_storeStrong((id *)&self->_runningTasks, 0);
  objc_storeStrong((id *)&self->_prerunningTasks, 0);
  objc_storeStrong((id *)&self->_pendingTasks, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
