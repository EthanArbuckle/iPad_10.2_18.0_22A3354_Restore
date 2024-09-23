@implementation _DASActivityProfiler

- (_DASActivityProfiler)init
{
  _DASActivityProfiler *v2;
  uint64_t v3;
  NSMutableDictionary *activityToSession;
  uint64_t v5;
  NSMutableDictionary *activityToSnapshot;
  uint64_t v7;
  NSMutableDictionary *activityToProfile;
  uint64_t v9;
  NSMutableDictionary *activityToProfilerStartDates;
  id v11;
  id v12;
  NSObject *v13;
  UsageFeed *v14;
  UsageFeed *symptomsFeed;
  NSObject *v16;
  _DASActivityProfiler *v17;
  uint64_t v18;
  _DASBatchingQueue *writeQueue;
  uint64_t v20;
  _DASBatteryTemperatureRecorder *batteryTemperatureRecorder;
  NSArray *mediaanalysisActivities;
  uint64_t v23;
  _DKKnowledgeStore *knowledgeStore;
  _QWORD v26[4];
  _DASActivityProfiler *v27;
  uint8_t buf[16];
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)_DASActivityProfiler;
  v2 = -[_DASActivityProfiler init](&v29, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    activityToSession = v2->_activityToSession;
    v2->_activityToSession = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    activityToSnapshot = v2->_activityToSnapshot;
    v2->_activityToSnapshot = (NSMutableDictionary *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    activityToProfile = v2->_activityToProfile;
    v2->_activityToProfile = (NSMutableDictionary *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    activityToProfilerStartDates = v2->_activityToProfilerStartDates;
    v2->_activityToProfilerStartDates = (NSMutableDictionary *)v9;

    v2->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_alloc((Class)AnalyticsWorkspace);
    v12 = objc_msgSend(v11, "initWorkspaceWithService:", kSymptomAnalyticsServiceEndpoint);
    if (!v12)
    {
      v13 = qword_1001ABB00;
      if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Init: Error setting up symptom workspace", buf, 2u);
      }
    }
    v14 = (UsageFeed *)objc_msgSend(objc_alloc((Class)UsageFeed), "initWithWorkspace:", v12);
    symptomsFeed = v2->_symptomsFeed;
    v2->_symptomsFeed = v14;

    if (!v2->_symptomsFeed)
    {
      v16 = qword_1001ABB00;
      if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_ERROR))
        sub_1000E4380(v16);
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10007678C;
    v26[3] = &unk_10015EC30;
    v17 = v2;
    v27 = v17;
    v18 = objc_claimAutoreleasedReturnValue(+[_DASBatchingQueue queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:](_DASBatchingQueue, "queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:", CFSTR("profileStoreQueue"), 16, 0, v26, 300.0));
    writeQueue = v17->_writeQueue;
    v17->_writeQueue = (_DASBatchingQueue *)v18;

    v20 = objc_claimAutoreleasedReturnValue(+[_DASBatteryTemperatureRecorder sharedInstance](_DASBatteryTemperatureRecorder, "sharedInstance"));
    batteryTemperatureRecorder = v17->_batteryTemperatureRecorder;
    v17->_batteryTemperatureRecorder = (_DASBatteryTemperatureRecorder *)v20;

    mediaanalysisActivities = v17->_mediaanalysisActivities;
    v17->_mediaanalysisActivities = (NSArray *)&off_10016F488;

    if (notify_register_check((const char *)objc_msgSend(CFSTR("com.apple.mediaanalysisd.serviceProcessID"), "UTF8String"), &v17->_pidToken)&& os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_ERROR))
    {
      sub_1000E4314();
    }
    v23 = objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStoreWithDirectReadWriteAccess](_DKKnowledgeStore, "knowledgeStoreWithDirectReadWriteAccess"));
    knowledgeStore = v17->_knowledgeStore;
    v17->_knowledgeStore = (_DKKnowledgeStore *)v23;

  }
  return v2;
}

+ (id)sharedProfiler
{
  uint64_t v3;
  void *v4;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("profiling")));
  v4 = (void *)qword_1001ABB00;
  qword_1001ABB00 = v3;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076884;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABB08 != -1)
    dispatch_once(&qword_1001ABB08, block);
  return (id)qword_1001ABB10;
}

- (BOOL)isProfilingDelayedForActivity:(id)a3
{
  NSArray *mediaanalysisActivities;
  void *v4;

  mediaanalysisActivities = self->_mediaanalysisActivities;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  LOBYTE(mediaanalysisActivities) = -[NSArray containsObject:](mediaanalysisActivities, "containsObject:", v4);

  return (char)mediaanalysisActivities;
}

- (void)startProfilingForActivity:(id)a3 withState:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[_DASActivityProfiler lockedStartProfilingForActivity:withState:](self, "lockedStartProfilingForActivity:withState:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)lockedStartProfilingForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[_DASActivityProfiler shouldProfileActivity:](self, "shouldProfileActivity:", v6))
  {
    v8 = qword_1001ABB00;
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Starting profiling on activity %@", (uint8_t *)&v9, 0xCu);
    }
    -[_DASActivityProfiler startProfilingSnapshotForActivity:withState:](self, "startProfilingSnapshotForActivity:withState:", v6, v7);
  }

}

- (BOOL)shouldProfileActivity:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  NSMutableDictionary *activityToProfilerStartDates;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  NSObject *v31;
  int v32;
  id v33;
  __int16 v34;
  uint64_t v35;

  v4 = a3;
  if (!objc_msgSend(v4, "pid"))
  {
    v21 = (void *)qword_1001ABB00;
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      objc_msgSend(v4, "interval");
      v32 = 138412546;
      v33 = v4;
      v34 = 2048;
      v35 = v23;
      v24 = "Profiling not started for %@, interval: %f";
      v25 = v22;
      v26 = 22;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v32, v26);

    }
LABEL_17:
    v28 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v4, "interval");
  if (v5 <= 0.0)
  {
    v27 = (void *)qword_1001ABB00;
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_INFO))
    {
      v22 = v27;
      v32 = 138412546;
      v33 = v4;
      v34 = 1024;
      LODWORD(v35) = objc_msgSend(v4, "pid");
      v24 = "Profiling not started for %@, pid: %d";
      v25 = v22;
      v26 = 18;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v6 = qword_1001ABB18++;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v6 + 0x1999999999999998, 1) >= 0x1999999999999999uLL
    && !+[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild"))
  {
    goto LABEL_17;
  }
  activityToProfilerStartDates = self->_activityToProfilerStartDates;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](activityToProfilerStartDates, "objectForKeyedSubscript:", v8));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
    v11 = self->_activityToProfilerStartDates;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

  }
  v13 = self->_activityToProfilerStartDates;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14));

  if (objc_msgSend(v15, "count") == (id)3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v18 = 0;
    while (1)
    {
      objc_msgSend(v17, "timeIntervalSinceDate:", v16);
      if (v19 <= 60.0)
        break;
      objc_msgSend(v15, "removeObject:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));

      --v18;
      v16 = v20;
      if (v18 == -3)
        goto LABEL_20;
    }
    if (v18)
    {
      v20 = v16;
LABEL_20:

      goto LABEL_21;
    }
    v31 = qword_1001ABB00;
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138412290;
      v33 = v4;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Profiling not started for %@, rate limited", (uint8_t *)&v32, 0xCu);
    }

    v28 = 0;
  }
  else
  {
LABEL_21:
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    objc_msgSend(v15, "insertObject:atIndex:", v29, 0);

    v28 = 1;
  }

LABEL_23:
  return v28;
}

- (void)startProfilingSnapshotForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSNumber *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  id v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *activityToProfile;
  void *v28;
  uint32_t state;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  _BOOL4 v36;
  NSMutableDictionary *activityToSession;
  void *v38;
  void *v39;
  int v40;
  char v41;
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
  void *v55;
  NSMutableDictionary *activityToSnapshot;
  void *v57;
  NSMutableDictionary *v58;
  uint64_t v59;
  int v60;
  uint8_t buf[16];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;

  v6 = a3;
  v60 = 0;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_10016EA08, CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("activityname"));

  v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_100079B60());
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("cpuAwakeTime"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v13 = objc_msgSend(v12, "secondsFromGMT");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    objc_msgSend(v15, "timeIntervalSince1970WithTimeZoneOffset:", (double)(uint64_t)v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("startTime"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_10016EA20, CFSTR("startTime"));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v17));
  v19 = objc_msgSend(v18, "BOOLValue");

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v20));

  v22 = objc_msgSend(v21, "unsignedLongLongValue");
  v23 = -[_DASBatteryTemperatureRecorder currentBatteryTemperature](self->_batteryTemperatureRecorder, "currentBatteryTemperature");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19 ^ 1));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("startedOnBattery"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v22 == 0));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("startedInIdle"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v23));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("startBatteryTemperature"));

  activityToProfile = self->_activityToProfile;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](activityToProfile, "setObject:forKeyedSubscript:", v8, v28);

  if (-[_DASActivityProfiler isProfilingDelayedForActivity:](self, "isProfilingDelayedForActivity:", v6))
  {
    v59 = 0;
    state = notify_get_state(self->_pidToken, &v59);
    v30 = qword_1001ABB00;
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v59;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "PID number found for mediaanalysisd-service is (%lu)\n", buf, 0xCu);
    }
    if (state && os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_ERROR))
      sub_1000E4720();
    if (v59)
      objc_msgSend(v6, "setPid:");
  }
  v31 = pc_session_create(&v60, __stderrp, __stderrp);
  if (pc_session_set_procpid(v31, objc_msgSend(v6, "pid")))
  {
    v32 = (void *)qword_1001ABB00;
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      sub_1000E46A0((uint64_t)v6, v32);
    v33 = 0;
LABEL_19:
    pc_session_destroy(v31);
    activityToSession = self->_activityToSession;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    -[NSMutableDictionary removeObjectForKey:](activityToSession, "removeObjectForKey:", v38);
    goto LABEL_20;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", v31));
  v34 = pc_session_begin(v31);
  v35 = (void *)qword_1001ABB00;
  v36 = os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG);
  if (v34)
  {
    if (v36)
      sub_1000E4620((uint64_t)v6, v35);
    goto LABEL_19;
  }
  if (v36)
    sub_1000E45C0();
  v58 = self->_activityToSession;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", v33, v38);
LABEL_20:

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v79 = 0;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  *(_OWORD *)buf = 0u;
  v62 = 0u;
  *__error() = 255;
  v40 = proc_pid_rusage((int)objc_msgSend(v6, "pid"), 4, (rusage_info_t *)buf);
  if (v40 << 24)
  {
    v41 = v40;
    v42 = (void *)qword_1001ABB00;
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      sub_1000E4518((uint64_t)v6, v42, v41);
    objc_msgSend(v39, "removeObjectForKey:", CFSTR("rusage"));
  }
  else
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)v71));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, CFSTR("qosDefault"));

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)*((unint64_t *)&v71 + 1)));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v45, CFSTR("qosMaintenance"));

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)v72));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v46, CFSTR("qosBackground"));

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)*((unint64_t *)&v72 + 1)));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v47, CFSTR("qosUtility"));

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)*((unint64_t *)&v73 + 1)));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v48, CFSTR("qosUserInit"));

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)v74));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v49, CFSTR("qosUserInteractive"));

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)v73));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v50, CFSTR("qosLegacy"));

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)v70));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v51, CFSTR("ioRead"));

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)*((unint64_t *)&v70 + 1)));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v52, CFSTR("ioWrite"));

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)*((unint64_t *)&v77 + 1)));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v53, CFSTR("billedEnergy"));

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)v78));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v54, CFSTR("servicedEnergy"));

    objc_msgSend(v39, "setObject:forKeyedSubscript:", v43, CFSTR("rusage"));
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      sub_1000E44B8();

  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityProfiler startRecordingNetworkTransfer:](self, "startRecordingNetworkTransfer:", v6));
  if (v55)
  {
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v55, CFSTR("network"));
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      sub_1000E4458();
  }
  else
  {
    objc_msgSend(v39, "removeObjectForKey:", CFSTR("network"));
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      sub_1000E43F8();
  }
  activityToSnapshot = self->_activityToSnapshot;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](activityToSnapshot, "setObject:forKeyedSubscript:", v39, v57);

}

- (void)endProfilingForActivity:(id)a3 completed:(BOOL)a4 withState:(id)a5
{
  _BOOL8 v5;
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;

  v5 = a4;
  p_lock = &self->_lock;
  v9 = a5;
  v10 = a3;
  os_unfair_lock_lock(p_lock);
  -[_DASActivityProfiler lockedEndProfilingForActivity:completed:withState:](self, "lockedEndProfilingForActivity:completed:withState:", v10, v5, v9);

  os_unfair_lock_unlock(p_lock);
}

- (void)lockedEndProfilingForActivity:(id)a3 completed:(BOOL)a4 withState:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSMutableDictionary *activityToProfile;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  activityToProfile = self->_activityToProfile;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](activityToProfile, "objectForKeyedSubscript:", v11));

  if (v12)
  {
    v13 = sub_100079B60();
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("cpuAwakeTime")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v13 - (_QWORD)objc_msgSend(v14, "unsignedIntegerValue")));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("cpuAwakeTime"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[_DASActivityProfiler stopProfilingSnapshotForActivity:endDate:completionStatus:currentProfile:withState:](self, "stopProfilingSnapshotForActivity:endDate:completionStatus:currentProfile:withState:", v8, v16, v6, v12, v9);

    v17 = qword_1001ABB00;
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "endProfiling: %@", buf, 0xCu);
    }
    -[_DASBatchingQueue addWorkItem:](self->_writeQueue, "addWorkItem:", v12);
    v18 = self->_activityToProfile;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", v19);

    if ((unint64_t)-[NSMutableDictionary count](self->_activityToProfilerStartDates, "count") >= 0xB)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_activityToProfilerStartDates, "allKeys"));
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v21)
      {
        v22 = v21;
        v32 = v12;
        v33 = v9;
        v23 = 0;
        v24 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v35 != v24)
              objc_enumerationMutation(v20);
            v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activityToProfilerStartDates, "objectForKeyedSubscript:", v26));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));

            objc_msgSend(v28, "timeIntervalSinceNow");
            if (v29 < -60.0)
            {
              -[NSMutableDictionary removeObjectForKey:](self->_activityToProfilerStartDates, "removeObjectForKey:", v26);
              ++v23;
            }

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v22);
        v9 = v33;
        v12 = v32;
        if (v23)
        {
          v30 = qword_1001ABB00;
          if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v40 = v23;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Cleaned up %llu stale rate-limiting records", buf, 0xCu);
          }
        }
      }

    }
  }
  else
  {
    v31 = qword_1001ABB00;
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v8;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "endProfiling: %@ Didn't start profiling", buf, 0xCu);
    }
  }

}

- (void)storeProfileArrayToKnowledgeStore:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  _DKKnowledgeStore *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id obj;
  id v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  const __CFString *v40;
  id v41;
  _BYTE v42[128];

  v3 = a3;
  v29 = objc_alloc_init((Class)NSMutableArray);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/dasd/activityprofile")));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v9 = objc_alloc((Class)NSDate);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endTime")));
        objc_msgSend(v10, "doubleValue");
        v11 = objc_msgSend(v9, "initWithTimeIntervalSince1970:");

        v12 = objc_alloc((Class)NSDate);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startTime")));
        objc_msgSend(v13, "doubleValue");
        v14 = objc_msgSend(v12, "initWithTimeIntervalSince1970:");

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("activityname")));
        v40 = CFSTR("metadata");
        v16 = objc_msgSend(v8, "copy");
        v41 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEvent eventWithStream:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v30, v14, v11, v15, v17));

        if (v18)
          objc_msgSend(v29, "addObject:", v18);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v5);
  }

  v19 = (void *)qword_1001ABB00;
  if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_INFO))
  {
    v20 = v19;
    v21 = objc_msgSend(v29, "count");
    v22 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 134218240;
    v37 = v21;
    v38 = 2048;
    v39 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Processed %lu events from %lu profiles", buf, 0x16u);

  }
  v23 = self->_knowledgeStore;
  if (objc_msgSend(v29, "count"))
  {
    v31 = 0;
    -[_DKKnowledgeStore saveObjects:error:](v23, "saveObjects:error:", v29, &v31);
    v24 = v31;
    v25 = qword_1001ABB00;
    if (v24)
    {
      v26 = v24;
      if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_ERROR))
        sub_1000E478C();

    }
    else if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Events sent to store successfully", buf, 2u);
    }
  }

}

- (void)stopProfilingSnapshotForActivity:(id)a3 endDate:(id)a4 completionStatus:(BOOL)a5 currentProfile:(id)a6 withState:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;
  int64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *activityToSession;
  void *v36;
  void *v37;
  id v38;
  int v39;
  int v40;
  int v41;
  NSObject *v42;
  void *v43;
  uint64_t value;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSMutableDictionary *activityToSnapshot;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  void *v111;
  double v112;
  double v113;
  void *v114;
  void *v115;
  double v116;
  double v117;
  void *v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  void *v125;
  double v126;
  double v127;
  void *v128;
  void *v129;
  double v130;
  double v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  NSMutableDictionary *v136;
  void *v137;
  NSMutableDictionary *v138;
  void *v139;
  unint64_t v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  id v146;
  double v147;
  double v148;
  uint64_t v149;
  uint64_t v150;
  rusage_info_t buffer[4];
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("startTime")));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
    objc_msgSend(v13, "timeIntervalSinceDate:", v17);
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("runTime"));

  }
  else
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_10016EA20, CFSTR("runTime"));
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v22 = (double)(uint64_t)objc_msgSend(v21, "secondsFromGMT");

  objc_msgSend(v13, "timeIntervalSince1970WithTimeZoneOffset:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("endTime"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("completed"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v25));
  v27 = objc_msgSend(v26, "BOOLValue");

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v28));

  v30 = objc_msgSend(v29, "unsignedLongLongValue");
  v31 = -[_DASBatteryTemperatureRecorder currentBatteryTemperature](self->_batteryTemperatureRecorder, "currentBatteryTemperature");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27 ^ 1));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, CFSTR("endedOnBattery"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v30 == 0));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, CFSTR("endedInIdle"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v31));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, CFSTR("endBatteryTemperature"));

  activityToSession = self->_activityToSession;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](activityToSession, "objectForKeyedSubscript:", v36));
  v38 = objc_msgSend(v37, "pointerValue");

  if (v38)
  {
    v39 = pc_session_end(v38);
    v40 = pc_session_process(v38);
    if (v39 | v40)
    {
      v41 = v40;
      v42 = qword_1001ABB00;
      if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buffer[0]) = 138412802;
        *(rusage_info_t *)((char *)buffer + 4) = v12;
        WORD2(buffer[1]) = 1024;
        *(_DWORD *)((char *)&buffer[1] + 6) = v39;
        WORD1(buffer[2]) = 1024;
        HIDWORD(buffer[2]) = v41;
        _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "endProfiling: %@ : Failed to end/process session with end_ret: %d procsess_ret: %d", (uint8_t *)buffer, 0x18u);
      }
      v43 = &__kCFBooleanFalse;
    }
    else
    {
      v150 = 0;
      buffer[0] = 0;
      v149 = 0;
      value = pc_session_get_value(v38, 0, 0x63707574696D6500, buffer, &v150, &v149);
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
      LOBYTE(value) = -[_DASActivityProfiler errorCheck:withError:onActivity:](self, "errorCheck:withError:onActivity:", 0x63707574696D6500, value, v45);

      if ((value & 1) == 0)
      {
        *(double *)buffer = *(double *)buffer / 1000000.0;
        if (*(double *)buffer != 0.0)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v46, CFSTR("cpuTime"));

        }
      }
      v148 = 0.0;
      v47 = pc_session_get_value(v38, 0, 0x6D656D64656C7461, &v148, &v150, &v149);
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
      LOBYTE(v47) = -[_DASActivityProfiler errorCheck:withError:onActivity:](self, "errorCheck:withError:onActivity:", 0x6D656D64656C7461, v47, v48);

      if ((v47 & 1) == 0 && v148 != 0.0)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v148));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v49, CFSTR("dirtyMemoryDelta"));

      }
      v147 = 0.0;
      v50 = pc_session_get_value(v38, 0, 0x73746F7264697274, &v147, &v150, &v149);
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
      LOBYTE(v50) = -[_DASActivityProfiler errorCheck:withError:onActivity:](self, "errorCheck:withError:onActivity:", 0x73746F7264697274, v50, v51);

      if ((v50 & 1) == 0 && v147 != 0.0)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v147));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v52, CFSTR("storageDirty"));

      }
      v43 = &__kCFBooleanTrue;
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v43, CFSTR("sessionProfSuccess"));
    pc_session_destroy(v38);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      sub_1000E4978();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("sessionProfSuccess"));
  }
  activityToSnapshot = self->_activityToSnapshot;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](activityToSnapshot, "objectForKeyedSubscript:", v54));

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("rusage")));
  if (!v56)
  {
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      sub_1000E48B8();
    goto LABEL_29;
  }
  v168 = 0;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  memset(buffer, 0, sizeof(buffer));
  if (proc_pid_rusage((int)objc_msgSend(v12, "pid"), 4, buffer))
  {
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      sub_1000E4918();
LABEL_29:
    v57 = &__kCFBooleanFalse;
    goto LABEL_64;
  }
  v58 = v160;
  v59 = v161;
  v140 = *((_QWORD *)&v162 + 1);
  v141 = v163;
  v144 = *((_QWORD *)&v166 + 1);
  v145 = v167;
  v142 = v162;
  v60 = v159;
  v143 = *((_QWORD *)&v159 + 1);
  if ((_QWORD)v160)
  {
    v61 = (double)(unint64_t)v160;
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("qosDefault")));
    objc_msgSend(v62, "doubleValue");
    v64 = (v61 - v63) / 24000.0;

    if (v64 != 0.0)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v64));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v65, CFSTR("qosDefault"));

    }
  }
  if (*((_QWORD *)&v58 + 1))
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("qosMaintenance")));
    objc_msgSend(v66, "doubleValue");
    v68 = ((double)*((unint64_t *)&v58 + 1) - v67) / 24000.0;

    if (v68 != 0.0)
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v68));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v69, CFSTR("qosMaintenance"));

    }
  }
  if ((_QWORD)v59)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("qosBackground")));
    objc_msgSend(v70, "doubleValue");
    v72 = ((double)(unint64_t)v59 - v71) / 24000.0;

    if (v72 != 0.0)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v72));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v73, CFSTR("qosBackground"));

    }
  }
  if (*((_QWORD *)&v59 + 1))
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("qosUtility")));
    objc_msgSend(v74, "doubleValue");
    v76 = ((double)*((unint64_t *)&v59 + 1) - v75) / 24000.0;

    if (v76 != 0.0)
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v76));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v77, CFSTR("qosUtility"));

    }
  }
  if (v140)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("qosUserInit")));
    objc_msgSend(v78, "doubleValue");
    v80 = ((double)v140 - v79) / 24000.0;

    if (v80 != 0.0)
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v80));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v81, CFSTR("qosUserInit"));

    }
  }
  if (v141)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("qosUserInteractive")));
    objc_msgSend(v82, "doubleValue");
    v84 = ((double)v141 - v83) / 24000.0;

    if (v84 != 0.0)
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v84));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v85, CFSTR("qosUserInteractive"));

    }
  }
  if (v142)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("qosLegacy")));
    objc_msgSend(v86, "doubleValue");
    v88 = ((double)v142 - v87) / 24000.0;

    if (v88 != 0.0)
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v88));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v89, CFSTR("qosLegacy"));

    }
  }
  if ((_QWORD)v60)
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("ioRead")));
    objc_msgSend(v90, "doubleValue");
    v92 = (double)(unint64_t)v60 - v91;

    if (v92 != 0.0)
    {
      v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v92));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v93, CFSTR("ioRead"));

    }
  }
  if (v143)
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("ioWrite")));
    objc_msgSend(v94, "doubleValue");
    v96 = (double)v143 - v95;

    if (v96 != 0.0)
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v96));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v97, CFSTR("ioWrite"));

    }
  }
  if (v144)
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("billedEnergy")));
    objc_msgSend(v98, "doubleValue");
    v100 = (double)v144 - v99;

    if (v100 != 0.0)
    {
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v100));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v101, CFSTR("billedEnergy"));

    }
  }
  if (v145)
  {
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("servicedEnergy")));
    objc_msgSend(v102, "doubleValue");
    v104 = (double)v145 - v103;

    if (v104 != 0.0)
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v104));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v105, CFSTR("servicedEnergy"));

    }
  }
  v57 = &__kCFBooleanTrue;
LABEL_64:
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v57, CFSTR("rusageProfSuccess"), v140);
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("network")));
  if (v106)
  {
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityProfiler stopRecordingNetworkTransfer:](self, "stopRecordingNetworkTransfer:", v12));
    if (v107)
    {
      v146 = v13;
      if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
        sub_1000E4858();
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("wifiDown")));
      objc_msgSend(v108, "doubleValue");
      v110 = v109;
      v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("wifiDown")));
      objc_msgSend(v111, "doubleValue");
      v113 = v110 - v112;

      if (v113 != 0.0)
      {
        v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v113));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v114, CFSTR("wifiDown"));

      }
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("cellDown")));
      objc_msgSend(v115, "doubleValue");
      v117 = v116;
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("cellDown")));
      objc_msgSend(v118, "doubleValue");
      v120 = v117 - v119;

      if (v120 != 0.0)
      {
        v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v120));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v121, CFSTR("cellDown"));

      }
      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("wifiUp")));
      objc_msgSend(v122, "doubleValue");
      v124 = v123;
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("wifiUp")));
      objc_msgSend(v125, "doubleValue");
      v127 = v124 - v126;

      if (v127 != 0.0)
      {
        v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v127));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v128, CFSTR("wifiUp"));

      }
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("cellUp")));
      objc_msgSend(v129, "doubleValue");
      v131 = v130;
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("cellUp")));
      objc_msgSend(v132, "doubleValue");
      v134 = v131 - v133;

      if (v134 != 0.0)
      {
        v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v134));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v135, CFSTR("cellUp"));

      }
      objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("networkProfSuccess"));
      v13 = v146;
    }
    else
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("networkProfSuccess"));
      if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
        sub_1000E47F8();
    }

  }
  else
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("networkProfSuccess"));
  }
  v136 = self->_activityToSession;
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
  -[NSMutableDictionary removeObjectForKey:](v136, "removeObjectForKey:", v137);

  v138 = self->_activityToSnapshot;
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
  -[NSMutableDictionary removeObjectForKey:](v138, "removeObjectForKey:", v139);

}

- (id)startRecordingNetworkTransfer:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD *v11;
  dispatch_time_t v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v39 = 0;
  v40 = (double *)&v39;
  v41 = 0x2020000000;
  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v31 = 0;
  v32 = (double *)&v31;
  v33 = 0x2020000000;
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x2020000000;
  v30 = 0;
  v34 = 0;
  v38 = 0;
  v42 = 0;
  v6 = dispatch_semaphore_create(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", objc_msgSend(v4, "pid")));
  if (v7)
  {
    if (objc_msgSend(v4, "pid"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
      if (v8)
      {
        v19 = kUsageProcessProcName;
        v43 = kSymptomAnalyticsServiceRefreshUsage;
        v44 = &__kCFBooleanTrue;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10007912C;
        v20[3] = &unk_10015EC58;
        v23 = &v39;
        v24 = &v31;
        v25 = &v35;
        v26 = &v27;
        v21 = v4;
        v10 = v6;
        v22 = v10;
        v11 = objc_retainBlock(v20);
        if ((-[UsageFeed usageToDateWithOptionsFor:nameKind:options:reply:](self->_symptomsFeed, "usageToDateWithOptionsFor:nameKind:options:reply:", v8, v19, v9, v11) & 1) != 0)
        {
          v12 = dispatch_time(0, 10000000000);
          if (!dispatch_semaphore_wait(v10, v12))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40[3]));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("wifiDown"));

            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v36[3]));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("wifiUp"));

            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32[3]));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("cellDown"));

            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28[3]));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("cellUp"));

            if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
              sub_1000E4A98();
            v13 = v5;
            goto LABEL_16;
          }
          if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
            sub_1000E4AF8();
        }
        else if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
        {
          sub_1000E4B58();
        }
        v13 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      sub_1000E4A38();
  }
  else if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
  {
    sub_1000E49D8();
  }
  v13 = 0;
LABEL_17:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v13;
}

- (id)stopRecordingNetworkTransfer:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD *v11;
  dispatch_time_t v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v39 = 0;
  v40 = (double *)&v39;
  v41 = 0x2020000000;
  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v31 = 0;
  v32 = (double *)&v31;
  v33 = 0x2020000000;
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x2020000000;
  v30 = 0;
  v34 = 0;
  v38 = 0;
  v42 = 0;
  v6 = dispatch_semaphore_create(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUtils processNameFromPID:](_DASUtils, "processNameFromPID:", objc_msgSend(v4, "pid")));
  if (v7)
  {
    if (objc_msgSend(v4, "pid"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
      if (v8)
      {
        v19 = kUsageProcessProcName;
        v43 = kSymptomAnalyticsServiceRefreshUsage;
        v44 = &__kCFBooleanTrue;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000797C4;
        v20[3] = &unk_10015EC58;
        v23 = &v39;
        v24 = &v31;
        v25 = &v35;
        v26 = &v27;
        v21 = v4;
        v10 = v6;
        v22 = v10;
        v11 = objc_retainBlock(v20);
        if ((-[UsageFeed usageToDateWithOptionsFor:nameKind:options:reply:](self->_symptomsFeed, "usageToDateWithOptionsFor:nameKind:options:reply:", v8, v19, v9, v11) & 1) != 0)
        {
          v12 = dispatch_time(0, 10000000000);
          if (!dispatch_semaphore_wait(v10, v12))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40[3]));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("wifiDown"));

            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v36[3]));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("wifiUp"));

            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32[3]));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("cellDown"));

            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28[3]));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("cellUp"));

            if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
              sub_1000E4CE0();
            v13 = v5;
            goto LABEL_16;
          }
          if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
            sub_1000E4D40();
        }
        else if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
        {
          sub_1000E4DA0();
        }
        v13 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
      sub_1000E4C80();
  }
  else if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_DEBUG))
  {
    sub_1000E4C20();
  }
  v13 = 0;
LABEL_17:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v13;
}

- (BOOL)errorCheck:(unint64_t)a3 withError:(int)a4 onActivity:(id)a5
{
  id v6;

  v6 = a5;
  if (a4)
  {
    if (a4 > 44)
    {
      if (a4 == 45)
      {
        if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_ERROR))
          sub_1000E4EC8();
      }
      else if (a4 == 93 && os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_ERROR))
      {
        sub_1000E4F88();
      }
    }
    else if (a4 == 22)
    {
      if (os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_ERROR))
        sub_1000E4E68();
    }
    else if (a4 == 34 && os_log_type_enabled((os_log_t)qword_1001ABB00, OS_LOG_TYPE_ERROR))
    {
      sub_1000E4F28();
    }
  }

  return a4 != 0;
}

- (NSMutableDictionary)activityToSession
{
  return self->_activityToSession;
}

- (void)setActivityToSession:(id)a3
{
  objc_storeStrong((id *)&self->_activityToSession, a3);
}

- (NSMutableDictionary)activityToProfile
{
  return self->_activityToProfile;
}

- (void)setActivityToProfile:(id)a3
{
  objc_storeStrong((id *)&self->_activityToProfile, a3);
}

- (NSMutableDictionary)activityToSnapshot
{
  return self->_activityToSnapshot;
}

- (void)setActivityToSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_activityToSnapshot, a3);
}

- (NSMutableDictionary)activityToProfilerStartDates
{
  return self->_activityToProfilerStartDates;
}

- (void)setActivityToProfilerStartDates:(id)a3
{
  objc_storeStrong((id *)&self->_activityToProfilerStartDates, a3);
}

- (_DASBatchingQueue)writeQueue
{
  return self->_writeQueue;
}

- (void)setWriteQueue:(id)a3
{
  objc_storeStrong((id *)&self->_writeQueue, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (UsageFeed)symptomsFeed
{
  return self->_symptomsFeed;
}

- (void)setSymptomsFeed:(id)a3
{
  objc_storeStrong((id *)&self->_symptomsFeed, a3);
}

- (_DASBatteryTemperatureRecorder)batteryTemperatureRecorder
{
  return self->_batteryTemperatureRecorder;
}

- (void)setBatteryTemperatureRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_batteryTemperatureRecorder, a3);
}

- (NSArray)mediaanalysisActivities
{
  return self->_mediaanalysisActivities;
}

- (void)setMediaanalysisActivities:(id)a3
{
  objc_storeStrong((id *)&self->_mediaanalysisActivities, a3);
}

- (int)pidToken
{
  return self->_pidToken;
}

- (void)setPidToken:(int)a3
{
  self->_pidToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaanalysisActivities, 0);
  objc_storeStrong((id *)&self->_batteryTemperatureRecorder, 0);
  objc_storeStrong((id *)&self->_symptomsFeed, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_activityToProfilerStartDates, 0);
  objc_storeStrong((id *)&self->_activityToSnapshot, 0);
  objc_storeStrong((id *)&self->_activityToProfile, 0);
  objc_storeStrong((id *)&self->_activityToSession, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end
