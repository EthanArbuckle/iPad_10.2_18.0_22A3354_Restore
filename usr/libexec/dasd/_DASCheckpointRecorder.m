@implementation _DASCheckpointRecorder

+ (BOOL)shouldLogCheckpointForActivity:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isIntensive") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fastPass"));
    if (v5)
      v4 = 1;
    else
      v4 = +[_DASPhotosPolicy isPhotosSyncActivity:](_DASPhotosPolicy, "isPhotosSyncActivity:", v3);

  }
  return v4;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D040;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABB38 != -1)
    dispatch_once(&qword_1001ABB38, block);
  return (id)qword_1001ABB30;
}

- (_DASCheckpointRecorder)init
{
  _DASCheckpointRecorder *v2;
  uint64_t v3;
  OS_os_log *log;
  NSUserDefaults *v5;
  NSUserDefaults *defaults;
  NSMutableDictionary *v7;
  NSMutableDictionary *taskToFeatureCodes;
  NSMutableDictionary *v9;
  NSMutableDictionary *taskToSemanticVersion;
  NSMutableDictionary *v11;
  NSMutableDictionary *taskToDependencies;
  NSMutableDictionary *v13;
  NSMutableDictionary *availableStatus;
  NSMutableDictionary *v15;
  NSMutableDictionary *previewAvailableStatus;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *taskCheckpointQueue;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_attr_t v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *featureCodeQueue;
  dispatch_queue_attr_t v29;
  NSObject *v30;
  dispatch_queue_attr_t v31;
  NSObject *v32;
  dispatch_queue_t v33;
  OS_dispatch_queue *taskDependencyQueue;
  dispatch_queue_attr_t v35;
  NSObject *v36;
  dispatch_queue_attr_t v37;
  NSObject *v38;
  dispatch_queue_t v39;
  OS_dispatch_queue *featureAvailabilityQueue;
  dispatch_queue_attr_t v41;
  NSObject *v42;
  dispatch_queue_t v43;
  OS_dispatch_queue *featureStatusQueue;
  const char *v45;
  NSObject *v46;
  _QWORD handler[4];
  _DASCheckpointRecorder *v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)_DASCheckpointRecorder;
  v2 = -[_DASCheckpointRecorder init](&v50, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("checkpointRecorder")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    defaults = v2->_defaults;
    v2->_defaults = v5;

    v7 = objc_opt_new(NSMutableDictionary);
    taskToFeatureCodes = v2->_taskToFeatureCodes;
    v2->_taskToFeatureCodes = v7;

    v9 = objc_opt_new(NSMutableDictionary);
    taskToSemanticVersion = v2->_taskToSemanticVersion;
    v2->_taskToSemanticVersion = v9;

    v11 = objc_opt_new(NSMutableDictionary);
    taskToDependencies = v2->_taskToDependencies;
    v2->_taskToDependencies = v11;

    v13 = objc_opt_new(NSMutableDictionary);
    availableStatus = v2->_availableStatus;
    v2->_availableStatus = v13;

    v15 = objc_opt_new(NSMutableDictionary);
    previewAvailableStatus = v2->_previewAvailableStatus;
    v2->_previewAvailableStatus = v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_BACKGROUND, 0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create("com.apple.duetactivityscheduler.taskCheckpoint", v20);
    taskCheckpointQueue = v2->_taskCheckpointQueue;
    v2->_taskCheckpointQueue = (OS_dispatch_queue *)v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_BACKGROUND, 0);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = dispatch_queue_create("com.apple.duetactivityscheduler.featureCode", v26);
    featureCodeQueue = v2->_featureCodeQueue;
    v2->_featureCodeQueue = (OS_dispatch_queue *)v27;

    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_BACKGROUND, 0);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = dispatch_queue_create("com.apple.duetactivityscheduler.taskDependency", v32);
    taskDependencyQueue = v2->_taskDependencyQueue;
    v2->_taskDependencyQueue = (OS_dispatch_queue *)v33;

    v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    v37 = dispatch_queue_attr_make_with_qos_class(v36, QOS_CLASS_BACKGROUND, 0);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    v39 = dispatch_queue_create("com.apple.duetactivityscheduler.featureAvailability", v38);
    featureAvailabilityQueue = v2->_featureAvailabilityQueue;
    v2->_featureAvailabilityQueue = (OS_dispatch_queue *)v39;

    v41 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    v43 = dispatch_queue_create("com.apple.duetactivityscheduler.featureStatusRecorder", v42);
    featureStatusQueue = v2->_featureStatusQueue;
    v2->_featureStatusQueue = (OS_dispatch_queue *)v43;

    v45 = (const char *)objc_msgSend(CFSTR("com.apple.perfpowerservices.reportfeaturestatus"), "UTF8String");
    v46 = v2->_featureStatusQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10007D334;
    handler[3] = &unk_10015D9B8;
    v49 = v2;
    notify_register_dispatch(v45, &v2->_notifyToken, v46, handler);

  }
  return v2;
}

- (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *log;
  NSObject *v18;
  void *v19;
  void *v20;
  BOOL v21;
  OS_dispatch_queue *featureAvailabilityQueue;
  void *v23;
  void *v24;
  void *v26;
  _QWORD block[7];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("FeatureCode == %@"), v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v28 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:limitCount:offsetCount:readDirection:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("FeatureCheckpoint"), v9, 0, 0, 1, 0, 1, 0, &v28));
  v12 = v28;

  if (!v12 && v11)
  {
    v26 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metricKeysAndValues"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("FeatureState")));
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    if (v16 == (id)a3 && (a3 == 50 || a3 == 30))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v18 = log;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
        *(_DWORD *)buf = 138412546;
        v30 = v19;
        v31 = 2112;
        v32 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Duplicate feature state: %@ for feature code: %@", buf, 0x16u);

      }
      v21 = 1;
      v9 = v26;
      goto LABEL_14;
    }

    v9 = v26;
  }
  if (a3 == 50 || a3 == 30)
  {
    featureAvailabilityQueue = self->_featureAvailabilityQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007D660;
    block[3] = &unk_10015EE78;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_sync((dispatch_queue_t)featureAvailabilityQueue, block);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("FeatureCode"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("FeatureState"));

  v21 = -[_DASCheckpointRecorder sendDataToPPS:subsystem:category:](self, "sendDataToPPS:subsystem:category:", v13, CFSTR("BackgroundProcessing"), CFSTR("FeatureCheckpoint"));
LABEL_14:

  return v21;
}

- (void)logFeatureAvailability:(unint64_t)a3 forFeature:(unint64_t)a4
{
  unint64_t v5;
  void *v7;
  NSMutableDictionary **p_previewAvailableStatus;
  NSMutableDictionary *availableStatus;
  void *v10;
  void *v11;
  const __CFString *v12;
  NSMutableDictionary *previewAvailableStatus;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  id v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  BOOL v48;
  id v49;
  unsigned __int8 v50;
  unint64_t v51;
  void *v52;
  void *v53;
  unint64_t v54;
  _QWORD v55[4];
  id v56;
  unint64_t v57;
  double v58;
  unint64_t v59;
  uint64_t v60;
  BOOL v61;
  unsigned __int8 v62;
  id v63;
  id v64;
  id v65[2];

  v5 = a3;
  if (a3 == 30)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    p_previewAvailableStatus = &self->_previewAvailableStatus;
    previewAvailableStatus = self->_previewAvailableStatus;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](previewAvailableStatus, "setObject:forKeyedSubscript:", v7, v11);
    v12 = CFSTR("previewAvailableStatus");
    goto LABEL_5;
  }
  if (a3 == 50)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    p_previewAvailableStatus = &self->_availableStatus;
    availableStatus = self->_availableStatus;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](availableStatus, "setObject:forKeyedSubscript:", v7, v11);
    v12 = CFSTR("availableStatus");
LABEL_5:

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", *p_previewAvailableStatus, v12);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v65[0] = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:limitCount:offsetCount:readDirection:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("Config"), 0, 0, 0, 1, 0, 1, 0, v65));
  v16 = v65[0];

  v17 = 0;
  v18 = 0;
  v19 = 0.0;
  if (!v16 && v15)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metricKeysAndValues"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("LastUpgradeSystemTimestamp")));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metricKeysAndValues"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("InstallType")));
    v18 = v24 != 0;

    if (v22)
    {
      objc_msgSend(v22, "doubleValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
      objc_msgSend(v17, "timeIntervalSinceNow");
      v19 = -v25;
    }
    else
    {
      v17 = 0;
    }

  }
  v54 = a4;
  if (a4 - 100 > 0x64)
  {
    v32 = 0;
  }
  else
  {
    v52 = v15;
    v26 = v16;
    v27 = v5;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("WorkloadType == %@"), &off_10016EA38));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
    v64 = 0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:limitCount:offsetCount:readDirection:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("WorkloadInformation"), v28, 0, 0, 1, 0, 1, 0, &v64));
    v31 = v64;

    v32 = 0;
    if (!v31 && v30)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstObject"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "metricKeysAndValues"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("Size")));

    }
    v5 = v27;
    v16 = v26;
    v15 = v52;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPLLogger sharedInstance](_APRSPLLogger, "sharedInstance"));
  v36 = objc_msgSend(v35, "getInferredCarryStatus");

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  if (v17 && objc_msgSend(v17, "compare:", v37) != (id)1)
  {
    v50 = v36;
    v51 = v5;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
    v40 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v17, v37);
    v63 = 0;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:limitCount:offsetCount:readDirection:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("FeatureCheckpoint"), 0, 0, v40, 1, 0, 1, 0, &v63));
    v42 = v63;

    v38 = 40;
    if (!v42 && v41)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "metricKeysAndValues"));
      v53 = v15;
      v45 = v16;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("FeatureState")));

      v47 = 40;
      if (v46 == (void *)60)
        v47 = 30;
      if (v46 == (void *)40)
        v47 = 20;
      v48 = (unint64_t)v46 >= 0x1E;
      v16 = v45;
      v15 = v53;
      if (v48)
        v38 = v47;
      else
        v38 = 10;

    }
    v5 = v51;
    v36 = v50;
  }
  else
  {
    v38 = 40;
  }
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10007DBB8;
  v55[3] = &unk_10015EEA0;
  v56 = v32;
  v57 = v54;
  v61 = v18;
  v58 = v19;
  v62 = v36;
  v59 = v5;
  v60 = v38;
  v49 = v32;
  AnalyticsSendEventLazy(CFSTR("com.apple.dasd.featureAvailability"), v55);

}

- (BOOL)sendTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("TaskName"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("CheckpointState"));

  LOBYTE(v9) = -[_DASCheckpointRecorder sendDataToPPS:subsystem:category:](self, "sendDataToPPS:subsystem:category:", v8, CFSTR("BackgroundProcessing"), CFSTR("TaskCheckpoint"));
  return (char)v9;
}

- (void)reportTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5
{
  id v8;
  OS_dispatch_queue *taskCheckpointQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  _DASCheckpointRecorder *v13;
  unint64_t v14;
  id *v15;

  v8 = a4;
  taskCheckpointQueue = self->_taskCheckpointQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007DEE8;
  v11[3] = &unk_10015EEC8;
  v12 = v8;
  v13 = self;
  v14 = a3;
  v15 = a5;
  v10 = v8;
  dispatch_async((dispatch_queue_t)taskCheckpointQueue, v11);

}

- (void)handlePLBackgroundProcessingNotification
{
  int notifyToken;
  uint32_t state;
  uint32_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *log;
  uint64_t state64;
  uint8_t buf[4];
  uint32_t v13;

  state64 = 0;
  notifyToken = self->_notifyToken;
  if (notifyToken == -1)
  {
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v7 = "Invalid notify token";
    v8 = log;
    v9 = 2;
    goto LABEL_7;
  }
  state = notify_get_state(notifyToken, &state64);
  if (state)
  {
    v5 = state;
    v6 = self->_log;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 67109120;
    v13 = v5;
    v7 = "notify_get_state() failed with error %u";
    v8 = v6;
    v9 = 8;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    return;
  }

}

- (void)addFeatureCodesForTask:(id)a3 featureCodes:(id)a4 semanticVersion:(int64_t)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *featureCodeQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  featureCodeQueue = self->_featureCodeQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007E11C;
  v13[3] = &unk_10015EEF0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async((dispatch_queue_t)featureCodeQueue, v13);

}

- (BOOL)reportFeatureStatus:(unint64_t)a3 forFeature:(unint64_t)a4 statusChangedDate:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("FeatureCode"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("FeatureState"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("StateChangedDate"));
  LOBYTE(self) = -[_DASCheckpointRecorder sendDataToPPS:subsystem:category:](self, "sendDataToPPS:subsystem:category:", v10, CFSTR("BackgroundProcessing"), CFSTR("FeatureStatus"));

  return (char)self;
}

- (void)reportFeatureCodesForTasks
{
  OS_dispatch_queue *featureCodeQueue;
  _QWORD block[5];

  featureCodeQueue = self->_featureCodeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E2C8;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)featureCodeQueue, block);
}

- (void)populateFeatureStatusFromPast
{
  void *v3;
  NSObject *log;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSMutableDictionary *availableStatus;
  NSMutableDictionary *v45;
  NSMutableDictionary *previewAvailableStatus;
  NSMutableDictionary *v47;
  void *v48;
  _DASCheckpointRecorder *v49;
  void *v50;
  NSMutableDictionary *v51;
  id obj;
  NSMutableDictionary *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("FeatureState == %@ OR FeatureState == %@"), &off_10016EA50, &off_10016EA68));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("FeatureCheckpoint"), 0));
  v49 = self;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    sub_1000E53D0((uint64_t)v3, log, v5, v6, v7, v8, v9, v10);
  v53 = objc_opt_new(NSMutableDictionary);
  v51 = objc_opt_new(NSMutableDictionary);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v3;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "metricKeysAndValues"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("FeatureCode")));
        v18 = objc_msgSend(v17, "integerValue");

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("FeatureState")));
        if (objc_msgSend(v19, "unsignedIntegerValue") == (id)50)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", v21));

          if (v22)
            goto LABEL_15;
          objc_msgSend(v15, "epochTimestamp");
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringValue"));
          v26 = v53;
          goto LABEL_14;
        }
        if (objc_msgSend(v19, "unsignedIntegerValue") == (id)30)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringValue"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v51, "objectForKeyedSubscript:", v28));

          if (!v29)
          {
            objc_msgSend(v15, "epochTimestamp");
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringValue"));
            v26 = v51;
LABEL_14:
            -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v23, v25);

          }
        }
LABEL_15:

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v12);
  }

  v30 = v49->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    sub_1000E536C((uint64_t)v53, v30, v31, v32, v33, v34, v35, v36);
  v37 = v49->_log;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    sub_1000E5308((uint64_t)v51, v37, v38, v39, v40, v41, v42, v43);
  availableStatus = v49->_availableStatus;
  v49->_availableStatus = v53;
  v45 = v53;

  previewAvailableStatus = v49->_previewAvailableStatus;
  v49->_previewAvailableStatus = v51;
  v47 = v51;

  -[NSUserDefaults setObject:forKey:](v49->_defaults, "setObject:forKey:", v49->_availableStatus, CFSTR("availableStatus"));
  -[NSUserDefaults setObject:forKey:](v49->_defaults, "setObject:forKey:", v49->_previewAvailableStatus, CFSTR("previewAvailableStatus"));

}

- (void)reportFeatureStatus
{
  OS_dispatch_queue *featureAvailabilityQueue;
  _QWORD block[5];

  featureAvailabilityQueue = self->_featureAvailabilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E9B4;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)featureAvailabilityQueue, block);
}

- (void)addDependencyInfoForTask:(id)a3 producedResultIdentifiers:(id)a4 dependencyIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *taskDependencyQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _DASCheckpointRecorder *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  taskDependencyQueue = self->_taskDependencyQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007ED04;
  v15[3] = &unk_10015DC88;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v19 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async((dispatch_queue_t)taskDependencyQueue, v15);

}

- (void)registerFeatureStatusTask
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007EE60;
  v4[3] = &unk_10015D5E8;
  v4[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.reportfeatureStatus"), 0, v4);

}

- (void)registerReportTaskInfoTask
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007EF20;
  v4[3] = &unk_10015D5E8;
  v4[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.reportTaskInfo"), 0, v4);

}

- (void)reportDependencyInfoForTasks
{
  OS_dispatch_queue *taskDependencyQueue;
  _QWORD block[5];

  taskDependencyQueue = self->_taskDependencyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007EFC4;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)taskDependencyQueue, block);
}

- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  v11 = objc_msgSend(v10, "sendDataToPPS:subsystem:category:", v9, v8, v7);

  return v11;
}

- (OS_dispatch_queue)featureCodeQueue
{
  return self->_featureCodeQueue;
}

- (void)setFeatureCodeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_featureCodeQueue, a3);
}

- (OS_dispatch_queue)taskCheckpointQueue
{
  return self->_taskCheckpointQueue;
}

- (void)setTaskCheckpointQueue:(id)a3
{
  objc_storeStrong((id *)&self->_taskCheckpointQueue, a3);
}

- (OS_dispatch_queue)taskDependencyQueue
{
  return self->_taskDependencyQueue;
}

- (void)setTaskDependencyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_taskDependencyQueue, a3);
}

- (OS_dispatch_queue)featureAvailabilityQueue
{
  return self->_featureAvailabilityQueue;
}

- (void)setFeatureAvailabilityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_featureAvailabilityQueue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSMutableDictionary)taskToFeatureCodes
{
  return self->_taskToFeatureCodes;
}

- (void)setTaskToFeatureCodes:(id)a3
{
  objc_storeStrong((id *)&self->_taskToFeatureCodes, a3);
}

- (NSMutableDictionary)taskToSemanticVersion
{
  return self->_taskToSemanticVersion;
}

- (void)setTaskToSemanticVersion:(id)a3
{
  objc_storeStrong((id *)&self->_taskToSemanticVersion, a3);
}

- (NSMutableDictionary)availableStatus
{
  return self->_availableStatus;
}

- (void)setAvailableStatus:(id)a3
{
  objc_storeStrong((id *)&self->_availableStatus, a3);
}

- (NSMutableDictionary)previewAvailableStatus
{
  return self->_previewAvailableStatus;
}

- (void)setPreviewAvailableStatus:(id)a3
{
  objc_storeStrong((id *)&self->_previewAvailableStatus, a3);
}

- (NSMutableDictionary)taskToDependencies
{
  return self->_taskToDependencies;
}

- (void)setTaskToDependencies:(id)a3
{
  objc_storeStrong((id *)&self->_taskToDependencies, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (OS_dispatch_queue)featureStatusQueue
{
  return self->_featureStatusQueue;
}

- (void)setFeatureStatusQueue:(id)a3
{
  objc_storeStrong((id *)&self->_featureStatusQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureStatusQueue, 0);
  objc_storeStrong((id *)&self->_taskToDependencies, 0);
  objc_storeStrong((id *)&self->_previewAvailableStatus, 0);
  objc_storeStrong((id *)&self->_availableStatus, 0);
  objc_storeStrong((id *)&self->_taskToSemanticVersion, 0);
  objc_storeStrong((id *)&self->_taskToFeatureCodes, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityQueue, 0);
  objc_storeStrong((id *)&self->_taskDependencyQueue, 0);
  objc_storeStrong((id *)&self->_taskCheckpointQueue, 0);
  objc_storeStrong((id *)&self->_featureCodeQueue, 0);
}

@end
