@implementation _DASPLLogger

- (void)recordPrediction:(id)a3 key:(id)a4 valueMultiplier:(int)a5
{
  uint64_t v5;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v11 = a3;
  v8 = a4;
  if (-[_DASPLLogger shouldLogPrediction:](self, "shouldLogPrediction:", v11))
  {
    v9 = self->_predictions;
    objc_sync_enter(v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_predictions, "setObject:forKeyedSubscript:", v11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_multiplier, "setObject:forKeyedSubscript:", v10, v8);

    objc_sync_exit(v9);
  }

}

- (BOOL)shouldLogPrediction:(id)a3
{
  void *v3;
  double v4;
  BOOL v5;

  if (!a3)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "startDate"));
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4 <= 64800.0;

  return v5;
}

- (void)recordActivityLifeCycleEnd:(id)a3
{
  id v4;
  NSMutableDictionary *activityToLifeCycle;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  _BYTE *v14;
  void *v15;
  _BYTE *v16;
  void *v17;
  id v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  __CFString *v78;
  void *v79;
  void *v80;
  rusage_info_t buffer[2];
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
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    activityToLifeCycle = self->_activityToLifeCycle;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](activityToLifeCycle, "objectForKeyedSubscript:", v6));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PID")));
      v9 = objc_msgSend(v8, "intValue");

      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ProcessName")));
      v11 = (void *)v10;
      v12 = &stru_1001617C8;
      if (v10)
        v12 = (__CFString *)v10;
      v78 = v12;

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UptimeAtStart")));
      v14 = objc_msgSend(v13, "unsignedLongValue");

      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WalltimeAtStart")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UptimeAtSuspension")));
      v16 = objc_msgSend(v15, "unsignedLongValue");

      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WalltimeAtSuspension")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BilledEnergyAtStart")));
      v18 = objc_msgSend(v17, "unsignedLongValue");

      if ((_DWORD)v9 && v18)
      {
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        *(_OWORD *)buffer = 0u;
        proc_pid_rusage((int)v9, 6, buffer);
      }
      v19 = self->_activityToLifeCycle;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
      -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", v20);

      os_unfair_lock_unlock(&self->_lock);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startBefore"));
      objc_msgSend(v22, "timeIntervalSinceDate:", v23);
      v25 = v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("Name"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", (double)(unint64_t)objc_msgSend(v4, "schedulingPriority")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("Priority"));

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, CFSTR("PID"));

      objc_msgSend(v26, "setObject:forKeyedSubscript:", v78, CFSTR("ProcessName"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupName"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("GroupName"));

      objc_msgSend(v26, "setObject:forKeyedSubscript:", v80, CFSTR("StartDate"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, CFSTR("EndDate"));
      objc_msgSend(v21, "timeIntervalSinceDate:", v80);
      v32 = v31;
      v33 = (double)(((_BYTE *)-[_DASPLLogger uptime](self, "uptime") - v14) / 0x3B9ACA00uLL);
      if (v32 < v33)
        v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)fmax(v33, 0.0)));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, CFSTR("Duration"));

      if (v79)
      {
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v79, CFSTR("SuspendRequestDate"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", ((_BYTE *)-[_DASPLLogger uptime](self, "uptime") - v16) / 0x3B9ACA00uLL));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, CFSTR("SuspensionDelay"));

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "lastDenialValue")));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v36, CFSTR("SuspensionReason"));

      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startAfter", 5.0));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, CFSTR("ScheduleAfterDate"));

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startBefore"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v38, CFSTR("ScheduleBeforeDate"));

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v25 > 5.0));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v39, CFSTR("BeyondDeadline"));

      objc_msgSend(v4, "interval");
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v40, CFSTR("Interval"));

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileProtection"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "description"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v42, CFSTR("FileProtection"));

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "cpuIntensive")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v43, CFSTR("IsCPUIntensive"));

      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "memoryIntensive")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v44, CFSTR("IsMemoryIntensive"));

      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "aneIntensive")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v45, CFSTR("IsANEIntensive"));

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "gpuIntensive")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v46, CFSTR("IsGPUIntensive"));

      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "requiresPlugin")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v47, CFSTR("RequiresPlugin"));

      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "requiresNetwork")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v48, CFSTR("RequiresNetwork"));

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "requiresInexpensiveNetworking")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v49, CFSTR("RequiresInexpensiveNetworking"));

      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "requiresUnconstrainedNetworking")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v50, CFSTR("RequiresUnconstrainedNetworking"));

      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "requiresDeviceInactivity")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v51, CFSTR("RequiresDeviceInactivity"));

      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "requiresSignificantUserInactivity")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v52, CFSTR("RequiresSignificantUserInactivity"));

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "triggersRestart")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v53, CFSTR("TriggersRestart"));

      objc_msgSend(v26, "setObject:forKeyedSubscript:", &off_10016F188, CFSTR("Energy"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "transferSize")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v54, CFSTR("NetworkTaskSize"));

      objc_msgSend(v4, "predictedOptimalScore");
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v55 * 100.0));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v56, CFSTR("OptimalScore"));

      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "limitationResponse"));
      v58 = objc_msgSend(v57, "count");

      if (v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "limitationResponse"));
        v60 = +[_DASLimiterResponse bitmaskFromResponses:](_DASLimiterResponse, "bitmaskFromResponses:", v59);

        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v60));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v61, CFSTR("Limitations"));

      }
      v62 = v4;
      objc_sync_enter(v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "policyResponseMetadata"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("scoreWhenRun")));

      if (v64)
      {
        objc_msgSend(v64, "score");
        v66 = v65;
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v65 * 100.0));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v67, CFSTR("ScoreWhenRun"));

      }
      else
      {
        v66 = -1.0;
        objc_msgSend(v26, "setObject:forKeyedSubscript:", &off_10016F1D0, CFSTR("ScoreWhenRun"));
      }

      objc_sync_exit(v62);
      objc_msgSend(v62, "predictedOptimalScore");
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v66 / v68 * 100.0));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v69, CFSTR("OptimalScorePercentage"));

      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "bundleId"));
      if (v70)
      {
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "bundleId"));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v71, CFSTR("BundleID"));

      }
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "relatedApplications"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger commaDelimitedEntriesFrom:](self, "commaDelimitedEntriesFrom:", v72));

      if (v73)
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v73, CFSTR("Application"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "involvedProcesses"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger commaDelimitedEntriesFrom:](self, "commaDelimitedEntriesFrom:", v74));

      if (v75)
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v75, CFSTR("InvolvedProcesses"));
      v76 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("powerlog")));
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        sub_1000EBF44((uint64_t)v26, v76);

      PLLogRegisteredEvent(70, CFSTR("DASActivityLifecycle"), v26, 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
      objc_msgSend(v77, "sendDataToPPS:subsystem:category:", v26, CFSTR("BackgroundProcessing"), CFSTR("DASActivityLifecycle"));

      -[_DASPLLogger recordCAEventsForActivity:withParams:](self, "recordCAEventsForActivity:withParams:", v62, v26);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }

  }
}

+ (id)sharedInstance
{
  if (qword_1001ABE98 != -1)
    dispatch_once(&qword_1001ABE98, &stru_100160580);
  return (id)qword_1001ABEA0;
}

- (void)recordActivity:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self->_activities;
    objc_sync_enter(v5);
    if (-[_DASPLLogger shouldLogActivity:](self, "shouldLogActivity:", v7))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger createRecordFromActivity:](self, "createRecordFromActivity:", v7));
      -[NSMutableArray addObject:](self->_activities, "addObject:", v6);
      ++self->_taskCount;

    }
    else
    {
      ++self->_droppedCount;
    }
    if (-[_DASPLLogger didCoalesceWithPrevious:](self, "didCoalesceWithPrevious:", v7))
      ++self->_eventsCoalesced;
    objc_sync_exit(v5);

    v4 = v7;
  }

}

- (BOOL)shouldLogActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  BOOL v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v10 = v8 > 5.0
       && (v9 = objc_msgSend(v4, "schedulingPriority"), (unint64_t)v9 < _DASSchedulingPriorityUserInitiated)
       && self->_taskCount < 100;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)didCoalesceWithPrevious:(id)a3
{
  id v4;
  NSDate *v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;
  NSDate *v10;
  NSDate *lastCoalesced;

  v4 = a3;
  if (objc_msgSend(v4, "requiresNetwork"))
  {
    v5 = self->_lastCoalesced;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
      objc_msgSend(v7, "timeIntervalSinceDate:", self->_lastCoalesced);
      v9 = v8 < 10.0;

    }
    else
    {
      v9 = 0;
    }

    v10 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    lastCoalesced = self->_lastCoalesced;
    self->_lastCoalesced = v10;

    objc_sync_exit(v5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_DASPLLogger)init
{
  _DASPLLogger *v2;
  BOOL v3;
  uint64_t v4;
  NSDate *lastCoalesced;
  uint64_t v6;
  NSMutableArray *activities;
  uint64_t v8;
  NSMutableDictionary *predictions;
  uint64_t v10;
  NSMutableDictionary *appPredictions;
  uint64_t v12;
  NSMutableDictionary *multiplier;
  NSUserDefaults *v14;
  NSUserDefaults *defaults;
  uint64_t v16;
  NSMutableDictionary *triggerReport;
  uint64_t v18;
  NSArray *triggers;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  _DASPLLogger *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *syncQueue;
  _DASPLLogger *v31;
  uint64_t v32;
  NSMutableDictionary *activityToLifeCycle;
  _QWORD handler[4];
  _DASPLLogger *v36;
  objc_super v37;
  uint8_t buf[4];
  const char *v39;

  v37.receiver = self;
  v37.super_class = (Class)_DASPLLogger;
  v2 = -[_DASPLLogger init](&v37, "init");
  if (!v2)
  {
LABEL_13:
    v25 = v2;
    goto LABEL_14;
  }
  v3 = dlopen_preflight("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog");
  v2->_powerLogExists = v3;
  if (v3)
  {
    v2->_taskCount = 0;
    v2->_droppedCount = 0;
    v2->_eventsCoalesced = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    lastCoalesced = v2->_lastCoalesced;
    v2->_lastCoalesced = (NSDate *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    activities = v2->_activities;
    v2->_activities = (NSMutableArray *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    predictions = v2->_predictions;
    v2->_predictions = (NSMutableDictionary *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    appPredictions = v2->_appPredictions;
    v2->_appPredictions = (NSMutableDictionary *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    multiplier = v2->_multiplier;
    v2->_multiplier = (NSMutableDictionary *)v12;

    v2->_lock._os_unfair_lock_opaque = 0;
    v14 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    defaults = v2->_defaults;
    v2->_defaults = v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    triggerReport = v2->_triggerReport;
    v2->_triggerReport = (NSMutableDictionary *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", off_1001AB2C8, off_1001AB2D0, off_1001AB2D8, off_1001AB2E0, 0));
    triggers = v2->_triggers;
    v2->_triggers = (NSArray *)v18;

    -[_DASPLLogger resetTriggerReport](v2, "resetTriggerReport");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Available"), off_1001AB2C8));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_triggerReport, "objectForKeyedSubscript:", v20));
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_triggerReport, "objectForKeyedSubscript:", v20));
      v23 = objc_msgSend(v22, "BOOLValue");

    }
    else
    {
      v23 = 0;
    }

    -[_DASPLLogger logToPowerLogTrigger:withStatus:](v2, "logToPowerLogTrigger:withStatus:", off_1001AB2C8, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Available"), off_1001AB2D0));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_triggerReport, "objectForKeyedSubscript:", v26));
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2->_triggerReport, "objectForKeyedSubscript:", v26));
      v29 = objc_msgSend(v28, "BOOLValue");

    }
    else
    {
      v29 = 0;
    }

    -[_DASPLLogger logToPowerLogTrigger:withStatus:](v2, "logToPowerLogTrigger:withStatus:", off_1001AB2D0, v29);
    -[_DASPLLogger setupTimers](v2, "setupTimers");
    *(_DWORD *)buf = 0;
    syncQueue = v2->_syncQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000D8CBC;
    handler[3] = &unk_10015D9B8;
    v31 = v2;
    v36 = v31;
    notify_register_dispatch("com.apple.dasd.plloger.logActivities", (int *)buf, syncQueue, handler);
    v32 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    activityToLifeCycle = v31->_activityToLifeCycle;
    v31->_activityToLifeCycle = (NSMutableDictionary *)v32;

    goto LABEL_13;
  }
  v24 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("PowerLog")));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog";
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Powerlog library at %s does not exist", buf, 0xCu);
  }

  v25 = 0;
LABEL_14:

  return v25;
}

- (void)setupTimers
{
  const char *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *syncQueue;
  OS_dispatch_source *v8;
  OS_dispatch_source *shortPeriodTimer;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  OS_dispatch_source *v13;
  OS_dispatch_source *longPeriodTimer;
  NSObject *v15;
  NSObject *v16;
  dispatch_time_t v17;
  OS_dispatch_source *v18;
  OS_dispatch_source *dailyPeriodTimer;
  void *v20;
  NSUserDefaults *defaults;
  void *v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  dispatch_time_t v29;
  NSObject *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD handler[5];
  uint8_t buf[4];
  void *v35;

  v3 = (const char *)objc_msgSend(CFSTR("com.apple.duetactivityschedulerpowerlog.hourlysyncqueue"), "UTF8String");
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (OS_dispatch_queue *)dispatch_queue_create(v3, v5);
  syncQueue = self->_syncQueue;
  self->_syncQueue = v6;

  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_syncQueue);
  shortPeriodTimer = self->_shortPeriodTimer;
  self->_shortPeriodTimer = v8;

  dispatch_set_qos_class_fallback(self->_shortPeriodTimer, 17);
  v10 = self->_shortPeriodTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000D9058;
  handler[3] = &unk_10015D4E0;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  v11 = self->_shortPeriodTimer;
  v12 = dispatch_walltime(0, 817405952);
  dispatch_source_set_timer(v11, v12, 0x34630B8A000uLL, 0x45D964B800uLL);
  dispatch_resume((dispatch_object_t)self->_shortPeriodTimer);
  v13 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_syncQueue);
  longPeriodTimer = self->_longPeriodTimer;
  self->_longPeriodTimer = v13;

  dispatch_set_qos_class_fallback(self->_longPeriodTimer, 17);
  v15 = self->_longPeriodTimer;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000D9060;
  v32[3] = &unk_10015D4E0;
  v32[4] = self;
  dispatch_source_set_event_handler(v15, v32);
  v16 = self->_longPeriodTimer;
  v17 = dispatch_walltime(0, -1025343488);
  dispatch_source_set_timer(v16, v17, 0xD18C2E28000uLL, 0x45D964B800uLL);
  dispatch_resume((dispatch_object_t)self->_longPeriodTimer);
  v18 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_syncQueue);
  dailyPeriodTimer = self->_dailyPeriodTimer;
  self->_dailyPeriodTimer = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("nextTriggerReport")));
  defaults = self->_defaults;
  if (v20)
  {
    -[NSUserDefaults doubleForKey:](self->_defaults, "doubleForKey:", CFSTR("nextTriggerReport"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    objc_msgSend(v22, "timeIntervalSinceNow");
    v23 = 0.0;
    if (v24 > 0.0)
    {
      objc_msgSend(v22, "timeIntervalSinceNow");
      v23 = v25;
    }
  }
  else
  {
    v23 = 86400.0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
    objc_msgSend(v22, "timeIntervalSinceReferenceDate");
    -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", CFSTR("nextTriggerReport"));
  }

  v26 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("PowerLog")));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23 / 60.0));
    *(_DWORD *)buf = 138412290;
    v35 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Will report in %@ minutes", buf, 0xCu);

  }
  v28 = self->_dailyPeriodTimer;
  v29 = dispatch_walltime(0, (uint64_t)(v23 * 1000000000.0));
  dispatch_source_set_timer(v28, v29, 0x4E94914F0000uLL, 0x45D964B800uLL);
  v30 = self->_dailyPeriodTimer;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000D9068;
  v31[3] = &unk_10015D4E0;
  v31[4] = self;
  dispatch_source_set_event_handler(v30, v31);
  dispatch_activate((dispatch_object_t)self->_dailyPeriodTimer);
}

- (id)getCurrentBootSessionUUID
{
  void *v2;
  void *v3;
  size_t size;

  size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  v2 = malloc_type_malloc(size, 0xB1462270uLL);
  sysctlbyname("kern.bootsessionuuid", v2, &size, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2));
  free(v2);
  return v3;
}

- (void)resetTriggerReport
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;

  v3 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("triggerReport")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger getCurrentBootSessionUUID](self, "getCurrentBootSessionUUID"));
  v5 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("lastBootUUID")));
  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("PowerLog")));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 2112;
    v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current Boot UUID is %@, Previous was %@", buf, 0x16u);
  }

  v25 = v4;
  v26 = (void *)v3;
  v24 = (void *)v5;
  if (v3 && objc_msgSend(v4, "isEqualToString:", v5))
  {
    -[NSMutableDictionary setDictionary:](self->_triggerReport, "setDictionary:", v3);
  }
  else
  {
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v4, CFSTR("lastBootUUID"));
    -[NSMutableDictionary removeAllObjects](self->_triggerReport, "removeAllObjects");
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = self->_triggers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11);
        if (objc_msgSend(v12, "isEqualToString:", off_1001AB2C8))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForEnergyBudgetRemainingStatus](_CDContextQueries, "keyPathForEnergyBudgetRemainingStatus"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
          v16 = (uint64_t)objc_msgSend(v15, "BOOLValue");

LABEL_19:
          goto LABEL_20;
        }
        if (objc_msgSend(v12, "isEqualToString:", off_1001AB2D0))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
          v17 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus](_CDContextQueries, "keyPathForNetworkingBudgetRemainingStatus"));
LABEL_18:
          v18 = (void *)v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v17));
          v16 = (uint64_t)objc_msgSend(v19, "BOOLValue");

          goto LABEL_19;
        }
        if (objc_msgSend(v12, "isEqualToString:", off_1001AB2D8))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
          v17 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
          goto LABEL_18;
        }
        if (objc_msgSend(v12, "isEqualToString:", off_1001AB2E0))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
          v16 = (uint64_t)+[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", v13) > 20;
          goto LABEL_19;
        }
        v16 = 1;
LABEL_20:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Available"), v12, v24, v25, v26, (_QWORD)v27));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", v20));
        v22 = objc_msgSend(v21, "BOOLValue");

        if ((_DWORD)v16 != v22)
          -[_DASPLLogger reportNewStatus:forTrigger:](self, "reportNewStatus:forTrigger:", v16, v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v9 = v23;
    }
    while (v23);
  }

  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_triggerReport, CFSTR("triggerReport"));
}

- (void)logDailyActivities
{
  _DASPLLogger *v2;
  NSUserDefaults *defaults;
  void *v4;
  _QWORD v5[5];

  v2 = self;
  objc_sync_enter(v2);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D95A8;
  v5[3] = &unk_10015DA30;
  v5[4] = v2;
  AnalyticsSendEventLazy(CFSTR("com.apple.dasd.budget"), v5);
  defaults = v2->_defaults;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", CFSTR("nextTriggerReport"));

  -[_DASPLLogger resetTriggerReport](v2, "resetTriggerReport");
  objc_sync_exit(v2);

}

- (double)newDurationForStartDates:(id)a3 withPreviousDurations:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v5 = a3;
  objc_msgSend(a4, "doubleValue");
  v7 = v6;
  if (objc_msgSend(v5, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    objc_msgSend(v8, "timeIntervalSinceNow");
    v10 = v9;

    if (v10 < 0.0)
      v7 = v7 - v10;
  }

  return v7;
}

- (void)updateEnergyDurationWithTrigger:(id)a3 andState:(BOOL)a4
{
  unsigned int v4;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v4 = a4;
  v20 = a3;
  v6 = v4;
  if ((objc_msgSend(v20, "isEqualToString:", off_1001AB2C8) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", CFSTR("energyAvailable")));
    v6 = objc_msgSend(v7, "BOOLValue");

  }
  if ((objc_msgSend(v20, "isEqualToString:", off_1001AB2D8) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", CFSTR("pluginAvailable")));
    v4 = objc_msgSend(v8, "BOOLValue");

  }
  if ((v4 & v6 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ActualUnavailableStartDates"), CFSTR("energy")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ActualUnavailableDuration"), CFSTR("energy")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", v9));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", v9));
      v13 = objc_msgSend(v12, "mutableCopy");

    }
    else
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    }

    if (v6 == v4)
    {
      if (((v4 | v6) & 1) != 0)
      {
        v19 = 0;
LABEL_15:
        objc_msgSend(v13, "addObject:", v19);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_triggerReport, "setObject:forKeyedSubscript:", v13, v9);

        goto LABEL_16;
      }
      v18 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", v10));
      -[_DASPLLogger newDurationForStartDates:withPreviousDurations:](self, "newDurationForStartDates:withPreviousDurations:", v13, v14);
      v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_triggerReport, "setObject:forKeyedSubscript:", v17, v10);

      v18 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    }
    v19 = (void *)v18;
    goto LABEL_15;
  }
LABEL_16:

}

- (void)updateDataDurationWithTrigger:(id)a3 andState:(BOOL)a4
{
  unsigned int v4;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v4 = a4;
  v20 = a3;
  v6 = v4;
  if ((objc_msgSend(v20, "isEqualToString:", off_1001AB2D0) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", CFSTR("dataAvailable")));
    v6 = objc_msgSend(v7, "BOOLValue");

  }
  if ((objc_msgSend(v20, "isEqualToString:", off_1001AB2E0) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", CFSTR("wifiAvailable")));
    v4 = objc_msgSend(v8, "BOOLValue");

  }
  if ((v4 & v6 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ActualUnavailableStartDates"), CFSTR("data")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ActualUnavailableDuration"), CFSTR("data")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", v9));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", v9));
      v13 = objc_msgSend(v12, "mutableCopy");

    }
    else
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    }

    if (v6 == v4)
    {
      if (((v4 | v6) & 1) != 0)
      {
        v19 = 0;
LABEL_15:
        objc_msgSend(v13, "addObject:", v19);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_triggerReport, "setObject:forKeyedSubscript:", v13, v9);

        goto LABEL_16;
      }
      v18 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_triggerReport, "objectForKeyedSubscript:", v10));
      -[_DASPLLogger newDurationForStartDates:withPreviousDurations:](self, "newDurationForStartDates:withPreviousDurations:", v13, v14);
      v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_triggerReport, "setObject:forKeyedSubscript:", v17, v10);

      v18 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    }
    v19 = (void *)v18;
    goto LABEL_15;
  }
LABEL_16:

}

- (void)reportNewStatus:(BOOL)a3 forTrigger:(id)a4
{
  void *v4;
  _BOOL8 v5;
  id v7;
  _DASPLLogger *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  _UNKNOWN **v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  __CFString **v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSMutableDictionary *triggerReport;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  NSMutableDictionary *v37;

  v5 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Available"), v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_triggerReport, "objectForKeyedSubscript:", v31));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_triggerReport, "objectForKeyedSubscript:", v31));
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11 == v5)
      goto LABEL_31;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@EstimatedUnavailableStartDates"), v7));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_triggerReport, "objectForKeyedSubscript:", v12));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_triggerReport, "objectForKeyedSubscript:", v12));
    v15 = objc_msgSend(v14, "mutableCopy");

  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  }

  if (v5)
    v16 = CFSTR("%@AvailableCount");
  else
    v16 = CFSTR("%@UnavailableCount");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v7));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_triggerReport, "objectForKeyedSubscript:", v17));
  if (v18)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_triggerReport, "objectForKeyedSubscript:", v17));
    v19 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "intValue") + 1));
  }
  else
  {
    v19 = &off_10016F1A0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_triggerReport, "setObject:forKeyedSubscript:", v19, v17);
  if (v18)
  {

  }
  if (v5)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@EstimatedUnavailableDuration"), v7));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_triggerReport, "objectForKeyedSubscript:", v20));
    -[_DASPLLogger newDurationForStartDates:withPreviousDurations:](v8, "newDurationForStartDates:withPreviousDurations:", v15, v21);
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_triggerReport, "setObject:forKeyedSubscript:", v24, v20);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    objc_msgSend(v15, "addObject:", v25);

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v15, "addObject:", v20);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_triggerReport, "setObject:forKeyedSubscript:", v15, v12);
  if ((objc_msgSend(v7, "isEqualToString:", off_1001AB2C8) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", off_1001AB2D8))
  {
    -[_DASPLLogger updateEnergyDurationWithTrigger:andState:](v8, "updateEnergyDurationWithTrigger:andState:", v7, v5);
  }
  if ((objc_msgSend(v7, "isEqualToString:", off_1001AB2D0) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", off_1001AB2E0))
  {
    -[_DASPLLogger updateDataDurationWithTrigger:andState:](v8, "updateDataDurationWithTrigger:andState:", v7, v5);
  }
  if ((objc_msgSend(v7, "isEqualToString:", off_1001AB2C8) & 1) != 0)
  {
    v26 = &off_1001AB2C8;
LABEL_27:
    -[_DASPLLogger logToPowerLogTrigger:withStatus:](v8, "logToPowerLogTrigger:withStatus:", *v26, v5);
    goto LABEL_28;
  }
  if (objc_msgSend(v7, "isEqualToString:", off_1001AB2D0))
  {
    v26 = &off_1001AB2D0;
    goto LABEL_27;
  }
LABEL_28:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_triggerReport, "setObject:forKeyedSubscript:", v27, v31);

  -[NSUserDefaults setObject:forKey:](v8->_defaults, "setObject:forKey:", v8->_triggerReport, CFSTR("triggerReport"));
  v28 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("PowerLog")));
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    triggerReport = v8->_triggerReport;
    *(_DWORD *)buf = 138412802;
    v33 = v29;
    v34 = 2112;
    v35 = v7;
    v36 = 2112;
    v37 = triggerReport;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Recording %@ for trigger %@. Updated report is %@", buf, 0x20u);

  }
LABEL_31:

  objc_sync_exit(v8);
}

- (void)logToPowerLogTrigger:(id)a3 withStatus:(BOOL)a4
{
  _BOOL8 v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  uint8_t buf[4];
  __CFString *v15;
  __int16 v16;
  void *v17;

  v4 = a4;
  v5 = (__CFString *)a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("PowerLog")));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Recording trigger %@ budget available %@ to PowerLog", buf, 0x16u);

  }
  v9 = objc_autoreleasePoolPush();
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Available"), v5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v10);

  if (off_1001AB2C8 == v5)
  {
    v13 = CFSTR("DASBudgetAvailable");
LABEL_10:
    PLLogRegisteredEvent(24, v13, v6, 0);
    goto LABEL_11;
  }
  if (off_1001AB2D0 == v5)
  {
    v13 = CFSTR("DASDataBudgetAvailable");
    goto LABEL_10;
  }
  v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("PowerLog")));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_1000EBE64((uint64_t)v5, v12);

LABEL_11:
  objc_autoreleasePoolPop(v9);

}

- (void)logActivities
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v5 = objc_msgSend(v4, "submittedTaskCount");

  v13[0] = CFSTR("queuedTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
  v13[1] = CFSTR("eventsCoalesced");
  v14[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_eventsCoalesced));
  v14[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));

  v9 = objc_autoreleasePoolPush();
  v10 = self->_activities;
  objc_sync_enter(v10);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_activities, CFSTR("dasTasks"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_droppedCount));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("droppedCount"));

  v12 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("powerlog")));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_1000EBED4((uint64_t)v3, v12);

  PLLogRegisteredEvent(70, CFSTR("DASActivity"), v3, 0);
  PLLogRegisteredEvent(70, CFSTR("DASInfo"), v8, 0);
  -[NSMutableArray removeAllObjects](self->_activities, "removeAllObjects");
  self->_taskCount = 0;
  self->_droppedCount = 0;
  self->_eventsCoalesced = 0;
  objc_sync_exit(v10);

  objc_autoreleasePoolPop(v9);
}

- (void)logPredictions
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *predictions;
  id v8;
  unint64_t v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *appPredictions;
  id v12;
  unint64_t v13;
  _QWORD v14[5];
  _UNKNOWN **v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = self->_predictions;
  objc_sync_enter(v6);
  predictions = self->_predictions;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000DA9BC;
  v17[3] = &unk_100160538;
  v17[4] = self;
  v8 = v4;
  v18 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](predictions, "enumerateKeysAndObjectsUsingBlock:", v17);
  v9 = (unint64_t)-[NSMutableDictionary count](self->_predictions, "count");
  -[NSMutableDictionary removeAllObjects](self->_predictions, "removeAllObjects");

  objc_sync_exit(v6);
  v10 = self->_appPredictions;
  objc_sync_enter(v10);
  appPredictions = self->_appPredictions;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000DAA5C;
  v14[3] = &unk_100160560;
  v14[4] = self;
  v15 = &off_10016F1B8;
  v12 = v5;
  v16 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appPredictions, "enumerateKeysAndObjectsUsingBlock:", v14);
  v13 = (unint64_t)-[NSMutableDictionary count](self->_appPredictions, "count");
  -[NSMutableDictionary removeAllObjects](self->_appPredictions, "removeAllObjects");
  self->_appPredictionCount = 0;

  objc_sync_exit(v10);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("applicationUsagePrediction"));
  if (v9 | v13)
    PLLogRegisteredEvent(70, CFSTR("DASPrediction"), v8, 0);

  objc_autoreleasePoolPop(v3);
}

- (BOOL)shouldLogAppPrediction:(id)a3
{
  if (self->_appPredictionCount > 19)
    return 0;
  else
    return -[_DASPLLogger shouldLogPrediction:](self, "shouldLogPrediction:", a3);
}

- (id)getValuesFromTimeline:(id)a3 valueMultiplier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  double v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  objc_msgSend(v7, "doubleValue");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 14400.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager getValuesForPrediction:tillEndDate:withIntervals:](_DASPredictionManager, "getValuesForPrediction:tillEndDate:withIntervals:", v6, v11, 900.0));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v12));
    if (objc_msgSend(v13, "count"))
    {
      v14 = 0;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v14));
        v16 = objc_msgSend(v15, "intValue");

        if (v16 != -1)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v14));
          objc_msgSend(v17, "doubleValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v10 * v18));
          objc_msgSend(v13, "setObject:atIndexedSubscript:", v19, v14);

        }
        ++v14;
      }
      while (v14 < (unint64_t)objc_msgSend(v13, "count"));
    }
  }
  else
  {
    v13 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return v13;
}

- (void)recordAppPrediction:(id)a3 app:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[_DASPLLogger shouldLogAppPrediction:](self, "shouldLogAppPrediction:", v8))
  {
    v7 = self->_appPredictions;
    objc_sync_enter(v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appPredictions, "setObject:forKeyedSubscript:", v8, v6);
    ++self->_appPredictionCount;
    objc_sync_exit(v7);

  }
}

- (id)numberFromDouble:(double)a3
{
  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ((int)(a3 * 100.0) / 100));
}

- (id)commaDelimitedEntriesFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingSelector:", "caseInsensitiveCompare:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v5));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v12, "isEqualToString:", v5) & 1) == 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", %@"), v12));
            objc_msgSend(v6, "appendString:", v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)createRecordFromActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v46[4];
  id v47;
  _DASPLLogger *v48;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("taskName"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", (double)(unint64_t)objc_msgSend(v4, "schedulingPriority")));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("priority"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startAfter"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("startTime"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("timeWhenRun"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startBefore"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("endTime"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v8));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("duration"));

  objc_msgSend(v4, "predictedOptimalScore");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v16 * 100.0));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("optimalScore"));

  v18 = v4;
  objc_sync_enter(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "policyResponseMetadata"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("scoreWhenRun")));

  if (v20)
  {
    objc_msgSend(v20, "score");
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v21 * 100.0));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("scoreWhenRun"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "policyResponseMetadata"));
    objc_msgSend(v24, "removeObjectForKey:", CFSTR("scoreWhenRun"));

  }
  else
  {
    v22 = -1.0;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &off_10016F1D0, CFSTR("scoreWhenRun"));
  }

  objc_sync_exit(v18);
  objc_msgSend(v18, "predictedOptimalScore");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v22 / v25 * 100.0));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("optimalScorePercentage"));

  if (objc_msgSend(v18, "requiresPlugin"))
    v27 = &__kCFBooleanTrue;
  else
    v27 = &__kCFBooleanFalse;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("requiresPlugin"));
  if (objc_msgSend(v18, "requiresInexpensiveNetworking"))
    v28 = &__kCFBooleanTrue;
  else
    v28 = &__kCFBooleanFalse;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("requiresInexpensiveNetworking"));
  if (objc_msgSend(v18, "transferSize"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "transferSize")));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, CFSTR("networkTaskSize"));

  }
  if (objc_msgSend(v18, "requiresDeviceInactivity"))
    v30 = &__kCFBooleanTrue;
  else
    v30 = &__kCFBooleanFalse;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("requiresDeviceInactivity"));
  if (objc_msgSend(v18, "cpuIntensive"))
    v31 = &__kCFBooleanTrue;
  else
    v31 = &__kCFBooleanFalse;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, CFSTR("isCpuIntensive"));
  if (objc_msgSend(v18, "memoryIntensive"))
    v32 = &__kCFBooleanTrue;
  else
    v32 = &__kCFBooleanFalse;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, CFSTR("isMemoryIntensive"));
  if (objc_msgSend(v18, "aneIntensive"))
    v33 = &__kCFBooleanTrue;
  else
    v33 = &__kCFBooleanFalse;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, CFSTR("isANEIntensive"));
  if (objc_msgSend(v18, "gpuIntensive"))
    v34 = &__kCFBooleanTrue;
  else
    v34 = &__kCFBooleanFalse;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v34, CFSTR("isGPUIntensive"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleId"));

  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleId"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, CFSTR("bundleID"));

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "relatedApplications"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger commaDelimitedEntriesFrom:](self, "commaDelimitedEntriesFrom:", v37));

  if (v38)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v38, CFSTR("application"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "involvedProcesses"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger commaDelimitedEntriesFrom:](self, "commaDelimitedEntriesFrom:", v39));

  if (v40)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v40, CFSTR("involvedProcesses"));
  v41 = v18;
  objc_sync_enter(v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "policyResponseMetadata"));
  v43 = objc_msgSend(v42, "count");

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "policyResponseMetadata"));
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000DB4DC;
    v46[3] = &unk_1001605A8;
    v47 = v9;
    v48 = self;
    objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v46);

  }
  objc_sync_exit(v41);

  return v9;
}

- (void)recordActivityLifeCycleStart:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  __CFString *v8;
  NSObject *v9;
  os_unfair_lock_s *p_lock;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *activityToLifeCycle;
  void *v17;
  _OWORD v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "pid");
    if ((_DWORD)v6)
    {
      v7 = v6;
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger processNameFromPID:](self, "processNameFromPID:", v6));
      if (!-[__CFString length](v8, "length"))
      {
        v9 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("powerlog")));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LODWORD(v18[0]) = 67109378;
          DWORD1(v18[0]) = (_DWORD)v7;
          WORD4(v18[0]) = 2114;
          *(_QWORD *)((char *)v18 + 10) = v5;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to resolve process name for PID %d for activity %{public}@", (uint8_t *)v18, 0x12u);
        }

      }
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[_DASPLLogger uptime](self, "uptime")));
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, CFSTR("UptimeAtStart"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, CFSTR("WalltimeAtStart"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, CFSTR("PID"));

      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v8, CFSTR("ProcessName"));
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v19 = 0u;
      memset(v18, 0, sizeof(v18));
      if (!proc_pid_rusage((int)v7, 6, (rusage_info_t *)v18))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((_QWORD *)&v19 + 1)));
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v15, CFSTR("BilledEnergyAtStart"));

      }
      activityToLifeCycle = self->_activityToLifeCycle;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](activityToLifeCycle, "setObject:forKeyedSubscript:", v11, v17);

      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("powerlog")));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LODWORD(v18[0]) = 138543362;
        *(_QWORD *)((char *)v18 + 4) = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No PID for activity %{public}@", (uint8_t *)v18, 0xCu);
      }
      v8 = &stru_1001617C8;
    }

  }
}

- (void)recordActivityLifeCycleSuspend:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *activityToLifeCycle;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    v17 = v4;
    os_unfair_lock_lock(&self->_lock);
    activityToLifeCycle = self->_activityToLifeCycle;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](activityToLifeCycle, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[_DASPLLogger uptime](self, "uptime")));
      v10 = self->_activityToLifeCycle;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("UptimeAtSuspension"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v14 = self->_activityToLifeCycle;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("WalltimeAtSuspension"));

    }
    os_unfair_lock_unlock(p_lock);
    v4 = v17;
  }

}

- (void)recordCAEventsForActivity:(id)a3 withParams:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startBefore"));
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = (uint64_t)v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 & ~(v10 >> 63)));
  -[_DASPLLogger sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:](self, "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:", CFSTR("com.apple.dasd.metrics.starvation_durations"), v18, CFSTR("TimeInSeconds"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Duration")));
  v13 = (int)objc_msgSend(v12, "intValue");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
  -[_DASPLLogger sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:](self, "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:", CFSTR("com.apple.dasd.metrics.runtime_durations"), v18, CFSTR("TimeInSeconds"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "suspendRequestDate"));
  if (v15)
    -[_DASPLLogger sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:](self, "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:", CFSTR("com.apple.dasd.metrics.suspension_count"), v18, CFSTR("Occurrences"), &off_10016F1A0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BeyondDeadline")));
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
    -[_DASPLLogger sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:](self, "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:", CFSTR("com.apple.dasd.metrics.starvation_count"), v18, CFSTR("Occurrences"), &off_10016F1A0);
  -[_DASPLLogger sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:](self, "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:", CFSTR("com.apple.dasd.metrics.run_count"), v18, CFSTR("Occurrences"), &off_10016F1A0);

}

- (void)sendAnalyticsEventForStream:(id)a3 withActivity:(id)a4 withMetricValueKey:(id)a5 withMetricValue:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  __CFString *v30;
  id v31;
  __CFString *v32;
  id v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  id v39;
  id v40;
  id v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity prettySchedulingPriorityDescription:](_DASActivity, "prettySchedulingPriorityDescription:", objc_msgSend(v9, "schedulingPriority")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileProtection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](_DASFileProtection, "complete"));
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if ((v16 & 1) != 0)
  {
    v17 = CFSTR("Fa");
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileProtection"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](_DASFileProtection, "completeUnlessOpen"));
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if ((v20 & 1) != 0)
    {
      v17 = CFSTR("Fb");
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileProtection"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection none](_DASFileProtection, "none"));
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if (v23)
        v17 = CFSTR("-");
      else
        v17 = CFSTR("Fc");
    }
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000DBE88;
  v29[3] = &unk_1001605D0;
  v30 = CFSTR("Priority");
  v31 = v13;
  v32 = CFSTR("RequiresPlugin");
  v33 = v9;
  v34 = CFSTR("RequiresNetwork");
  v35 = CFSTR("IsIntensive");
  v36 = CFSTR("RequiresDeviceInactivity");
  v37 = CFSTR("RequiresFileProtection");
  v38 = (__CFString *)v17;
  v39 = v10;
  v40 = v11;
  v41 = (id)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstanceForNamespace:](_DASTrialManager, "sharedInstanceForNamespace:", CFSTR("COREOS_DAS")));
  v42 = CFSTR("trialExperimentId");
  v43 = CFSTR("trialTreatmentId");
  v44 = CFSTR("trialDeploymentId");
  v24 = v41;
  v25 = v11;
  v26 = v10;
  v27 = v9;
  v28 = v13;
  AnalyticsSendEventLazy(v12, v29);

}

- (unint64_t)uptime
{
  return clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
}

- (id)processNameFromPID:(int)a3
{
  _OWORD v4[32];

  memset(v4, 0, sizeof(v4));
  proc_name(a3, v4, 0x200u);
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
}

- (OS_dispatch_source)shortPeriodTimer
{
  return self->_shortPeriodTimer;
}

- (void)setShortPeriodTimer:(id)a3
{
  objc_storeStrong((id *)&self->_shortPeriodTimer, a3);
}

- (OS_dispatch_source)longPeriodTimer
{
  return self->_longPeriodTimer;
}

- (void)setLongPeriodTimer:(id)a3
{
  objc_storeStrong((id *)&self->_longPeriodTimer, a3);
}

- (OS_dispatch_source)dailyPeriodTimer
{
  return self->_dailyPeriodTimer;
}

- (void)setDailyPeriodTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dailyPeriodTimer, a3);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (NSDate)lastCoalesced
{
  return self->_lastCoalesced;
}

- (void)setLastCoalesced:(id)a3
{
  objc_storeStrong((id *)&self->_lastCoalesced, a3);
}

- (NSMutableDictionary)multiplier
{
  return self->_multiplier;
}

- (void)setMultiplier:(id)a3
{
  objc_storeStrong((id *)&self->_multiplier, a3);
}

- (int)eventsCoalesced
{
  return self->_eventsCoalesced;
}

- (void)setEventsCoalesced:(int)a3
{
  self->_eventsCoalesced = a3;
}

- (BOOL)powerLogExists
{
  return self->_powerLogExists;
}

- (void)setPowerLogExists:(BOOL)a3
{
  self->_powerLogExists = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)triggerReport
{
  return self->_triggerReport;
}

- (void)setTriggerReport:(id)a3
{
  objc_storeStrong((id *)&self->_triggerReport, a3);
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSMutableDictionary)activityToLifeCycle
{
  return self->_activityToLifeCycle;
}

- (void)setActivityToLifeCycle:(id)a3
{
  objc_storeStrong((id *)&self->_activityToLifeCycle, a3);
}

- (int)taskCount
{
  return self->_taskCount;
}

- (void)setTaskCount:(int)a3
{
  self->_taskCount = a3;
}

- (int)appPredictionCount
{
  return self->_appPredictionCount;
}

- (void)setAppPredictionCount:(int)a3
{
  self->_appPredictionCount = a3;
}

- (int)droppedCount
{
  return self->_droppedCount;
}

- (void)setDroppedCount:(int)a3
{
  self->_droppedCount = a3;
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_storeStrong((id *)&self->_activities, a3);
}

- (NSMutableDictionary)predictions
{
  return self->_predictions;
}

- (void)setPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_predictions, a3);
}

- (NSMutableDictionary)appPredictions
{
  return self->_appPredictions;
}

- (void)setAppPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_appPredictions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPredictions, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_activityToLifeCycle, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_triggerReport, 0);
  objc_storeStrong((id *)&self->_multiplier, 0);
  objc_storeStrong((id *)&self->_lastCoalesced, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_dailyPeriodTimer, 0);
  objc_storeStrong((id *)&self->_longPeriodTimer, 0);
  objc_storeStrong((id *)&self->_shortPeriodTimer, 0);
}

@end
