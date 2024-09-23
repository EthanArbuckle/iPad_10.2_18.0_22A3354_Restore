@implementation DatapathMetricStream

+ (id)sharedInstance
{
  if (qword_1000ECFF0 != -1)
    dispatch_once(&qword_1000ECFF0, &stru_1000CCF28);
  return (id)qword_1000ECFE8;
}

- (DatapathMetricStream)init
{
  DatapathMetricStream *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _BOOL4 timerRunning;
  WAProtobufMessageSubmitter *v9;
  WAProtobufMessageSubmitter *pbConverter;
  id v11;
  void *v12;
  id v13;
  DatapathMetricStream *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;

  v16.receiver = self;
  v16.super_class = (Class)DatapathMetricStream;
  v2 = -[DatapathMetricStream init](&v16, "init");
  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[DatapathMetricStream init]";
      v19 = 1024;
      v20 = 65;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:starting", buf, 0x12u);
    }

    v2->_timerRunning = 0;
    v6 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      timerRunning = v2->_timerRunning;
      *(_DWORD *)buf = 136446722;
      v18 = "-[DatapathMetricStream init]";
      v19 = 1024;
      v20 = 68;
      v21 = 1024;
      v22 = timerRunning;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _timerRunning %d", buf, 0x18u);
    }

    -[DatapathMetricStream setMonitoring:](v2, "setMonitoring:", 0);
    v9 = objc_alloc_init(WAProtobufMessageSubmitter);
    pbConverter = v2->_pbConverter;
    v2->_pbConverter = v9;

    v11 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 10240);
    -[DatapathMetricStream setLastPB:](v2, "setLastPB:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream lastPB](v2, "lastPB"));
    objc_msgSend(v12, "setLength:", 10240);

    -[DatapathMetricStream setLastPBLength:](v2, "setLastPBLength:", 0);
    v13 = objc_alloc_init((Class)NSLock);
    -[DatapathMetricStream setLastPBLock:](v2, "setLastPBLock:", v13);

    v14 = v2;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "-[DatapathMetricStream init]";
      v19 = 1024;
      v20 = 63;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
    }

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("megawifiprofile_diagnostic_metrics_enabled"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("megawifiprofile_diagnostic_metrics_period_ms"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("coredata_diagnostic_metrics_enabled"));

  v4.receiver = self;
  v4.super_class = (Class)DatapathMetricStream;
  -[DatapathMetricStream dealloc](&v4, "dealloc");
}

- (void)setDispatchQueueAndAddObservers:(id)a3 withGetter:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;

  v6 = a4;
  v7 = a3;
  v8 = WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136446466;
    v15 = "-[DatapathMetricStream setDispatchQueueAndAddObservers:withGetter:]";
    v16 = 1024;
    v17 = 97;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:scheduleWithQueue", (uint8_t *)&v14, 0x12u);
  }

  -[DatapathMetricStream setQueue:](self, "setQueue:", v7);
  -[DatapathMetricStream setGetter:](self, "setGetter:", v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ManagedConfiguration sharedInstance](ManagedConfiguration, "sharedInstance"));
  -[DatapathMetricStream setManagedConfiguration:](self, "setManagedConfiguration:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream managedConfiguration](self, "managedConfiguration"));
  objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, CFSTR("megawifiprofile_diagnostic_metrics_enabled"), 5, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream managedConfiguration](self, "managedConfiguration"));
  objc_msgSend(v12, "addObserver:forKeyPath:options:context:", self, CFSTR("megawifiprofile_diagnostic_metrics_period_ms"), 5, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream managedConfiguration](self, "managedConfiguration"));
  objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("coredata_diagnostic_metrics_enabled"), 5, 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  unsigned int v20;
  const char *v21;
  const char *v22;
  id v23;
  id v24;
  NSObject *v25;
  unint64_t v26;
  id v27;
  id v28;
  unint64_t v29;
  unsigned int v30;
  unsigned int v31;
  id v32;
  unsigned int v33;
  NSObject *v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  v13 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v16 = WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v41 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
    v42 = 1024;
    v43 = 115;
    v44 = 2112;
    v45 = (unint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:observeValueForKeyPath %@", buf, 0x1Cu);
  }

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("megawifiprofile_diagnostic_metrics_enabled")))
  {
    if (v15)
    {
      -[DatapathMetricStream setMegawifiprofile_diagnostic_metrics_enabled:](self, "setMegawifiprofile_diagnostic_metrics_enabled:", objc_msgSend(v15, "BOOLValue"));
      v18 = WALogCategoryDefaultHandle();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = -[DatapathMetricStream megawifiprofile_diagnostic_metrics_enabled](self, "megawifiprofile_diagnostic_metrics_enabled");
        v21 = "NO";
        v41 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
        v42 = 1024;
        v43 = 120;
        *(_DWORD *)buf = 136446978;
        if (v20)
          v21 = "YES";
        v44 = 2112;
        v45 = (unint64_t)v9;
        v46 = 2080;
        v47 = (unint64_t)v21;
        v22 = "%{public}s::%d:%@ Preference is %s";
        goto LABEL_28;
      }
      goto LABEL_29;
    }
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("megawifiprofile_diagnostic_metrics_period_ms")))
  {
    if (v15)
    {
      v23 = -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms](self, "megawifiprofile_diagnostic_metrics_period_ms");
      if (v23 != objc_msgSend(v15, "unsignedIntegerValue")
        && -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms](self, "megawifiprofile_diagnostic_metrics_period_ms")&& objc_msgSend(v15, "unsignedIntegerValue"))
      {
        v24 = WALogCategoryDefaultHandle();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms](self, "megawifiprofile_diagnostic_metrics_period_ms");
          v27 = objc_msgSend(v15, "unsignedIntegerValue");
          *(_DWORD *)buf = 136446978;
          v41 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
          v42 = 1024;
          v43 = 129;
          v44 = 2048;
          v45 = v26;
          v46 = 2048;
          v47 = (unint64_t)v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Noticed that kMegaProfileDiagnosticMetricsPeriod_ms is changing values from %lu to %lu", buf, 0x26u);
        }

        *((_BYTE *)v37 + 24) = 1;
      }
      -[DatapathMetricStream setMegawifiprofile_diagnostic_metrics_period_ms:](self, "setMegawifiprofile_diagnostic_metrics_period_ms:", objc_msgSend(v15, "unsignedIntegerValue"));
      v28 = WALogCategoryDefaultHandle();
      v19 = objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v29 = -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms](self, "megawifiprofile_diagnostic_metrics_period_ms");
      *(_DWORD *)buf = 136446978;
      v41 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
      v42 = 1024;
      v43 = 133;
      v44 = 2112;
      v45 = (unint64_t)v9;
      v46 = 2048;
      v47 = v29;
      v22 = "%{public}s::%d:%@ Preference is %lu";
      goto LABEL_28;
    }
  }
  else
  {
    v30 = objc_msgSend(v9, "isEqualToString:", CFSTR("coredata_diagnostic_metrics_enabled"));
    if (v15)
      v31 = v30;
    else
      v31 = 0;
    if (v31 == 1)
    {
      -[DatapathMetricStream setCoredata_diagnostic_metrics_enabled:](self, "setCoredata_diagnostic_metrics_enabled:", objc_msgSend(v15, "BOOLValue"));
      v32 = WALogCategoryDefaultHandle();
      v19 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v33 = -[DatapathMetricStream coredata_diagnostic_metrics_enabled](self, "coredata_diagnostic_metrics_enabled");
        *(_DWORD *)buf = 136446978;
        v41 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
        v42 = 1024;
        v43 = 138;
        v44 = 2112;
        v45 = (unint64_t)v9;
        v46 = 2048;
        v47 = v33;
        v22 = "%{public}s::%d:%@ Preference is %lu";
LABEL_28:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v22, buf, 0x26u);
      }
LABEL_29:

    }
  }
  v34 = objc_claimAutoreleasedReturnValue(-[DatapathMetricStream queue](self, "queue"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10003114C;
  v35[3] = &unk_1000CCF50;
  v35[4] = self;
  v35[5] = &v36;
  dispatch_async(v34, v35);

  _Block_object_dispose(&v36, 8);
}

- (id)getPBCodableNSDataFromNSKeyedArchive:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;

  v3 = a3;
  v4 = objc_opt_class(WAMessageAWD);
  v5 = objc_opt_class(NSError);
  v6 = objc_opt_class(NSString);
  v7 = objc_opt_class(WAField);
  v8 = objc_opt_class(NSMutableDictionary);
  v9 = objc_opt_class(NSDictionary);
  v10 = objc_opt_class(NSData);
  v11 = objc_opt_class(NSMutableArray);
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(NSNumber), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v23 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v13, v3, &v23));

  v15 = v23;
  if (v15)
  {
    v16 = WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v25 = "-[DatapathMetricStream getPBCodableNSDataFromNSKeyedArchive:]";
      v26 = 1024;
      v27 = 162;
      v28 = 2112;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAMessageAWD: %@", buf, 0x1Cu);
    }
    v18 = 0;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream pbConverter](self, "pbConverter"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "instantiateAWDProtobufAndPopulateValues:", v14));

    if (!v15)
    {
      v18 = 0;
      goto LABEL_8;
    }
    v20 = objc_alloc((Class)NSData);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "data"));
    v18 = objc_msgSend(v20, "initWithData:", v17);
  }

LABEL_8:
  return v18;
}

- (void)fetchMetrics
{
  void (**getter)(id, uint64_t, _QWORD *);
  _QWORD v3[5];

  getter = (void (**)(id, uint64_t, _QWORD *))self->_getter;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100031588;
  v3[3] = &unk_1000CCF78;
  v3[4] = self;
  getter[2](getter, 1, v3);
}

- (void)updateTimerConfiguration
{
  id v3;
  NSObject *v4;
  _BOOL4 megawifiprofile_diagnostic_metrics_enabled;
  unint64_t megawifiprofile_diagnostic_metrics_period_ms;
  _BOOL4 timerRunning;
  NSObject *timer;
  _BOOL4 v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  OS_dispatch_source *v24;
  OS_dispatch_source *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  unint64_t v35;
  NSObject *v36;
  dispatch_time_t v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  _BOOL4 v43;
  id v44;
  NSObject *v45;
  _BOOL4 v46;
  unint64_t v47;
  NSObject *v48;
  _BOOL4 v49;
  id v50;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  _BYTE v57[14];
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  _BOOL4 v61;
  __int16 v62;
  _BOOL4 v63;

  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    megawifiprofile_diagnostic_metrics_enabled = self->_megawifiprofile_diagnostic_metrics_enabled;
    megawifiprofile_diagnostic_metrics_period_ms = self->_megawifiprofile_diagnostic_metrics_period_ms;
    timerRunning = self->_timerRunning;
    timer = self->_timer;
    v9 = timer != 0;
    if (timer)
      v10 = dispatch_source_testcancel(timer) != 0;
    else
      v10 = 0;
    *(_DWORD *)buf = 136447746;
    v53 = "-[DatapathMetricStream updateTimerConfiguration]";
    v54 = 1024;
    v55 = 211;
    v56 = 1024;
    *(_DWORD *)v57 = megawifiprofile_diagnostic_metrics_enabled;
    *(_WORD *)&v57[4] = 2048;
    *(_QWORD *)&v57[6] = megawifiprofile_diagnostic_metrics_period_ms;
    v58 = 1024;
    v59 = timerRunning;
    v60 = 1024;
    v61 = v9;
    v62 = 1024;
    v63 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:megawifiprofile_diagnostic_metrics_enabled is %d megawifiprofile_diagnostic_metrics_period_ms is %lu _timerRunning is %d _timer exists %d testcancel is %d", buf, 0x34u);
  }

  if (self->_timerRunning)
  {
    if (!self->_megawifiprofile_diagnostic_metrics_enabled || !self->_megawifiprofile_diagnostic_metrics_period_ms)
    {
      v11 = self->_timer;
      if (v11)
      {
        if (!dispatch_source_testcancel(v11))
        {
          v12 = WALogCategoryDefaultHandle();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = self->_megawifiprofile_diagnostic_metrics_enabled;
            v15 = self->_megawifiprofile_diagnostic_metrics_period_ms;
            *(_DWORD *)buf = 136446978;
            v53 = "-[DatapathMetricStream updateTimerConfiguration]";
            v54 = 1024;
            v55 = 247;
            v56 = 1024;
            *(_DWORD *)v57 = v14;
            *(_WORD *)&v57[4] = 2048;
            *(_QWORD *)&v57[6] = v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer exists and is valid, Suspending: Enabled %d Period(ms) %lu", buf, 0x22u);
          }

          dispatch_suspend((dispatch_object_t)self->_timer);
          self->_timerRunning = 0;
          v16 = WALogCategoryDefaultHandle();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            goto LABEL_41;
          v18 = self->_timerRunning;
          *(_DWORD *)buf = 136446722;
          v53 = "-[DatapathMetricStream updateTimerConfiguration]";
          v54 = 1024;
          v55 = 250;
          v56 = 1024;
          *(_DWORD *)v57 = v18;
LABEL_40:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _timerRunning %d", buf, 0x18u);
LABEL_41:

        }
      }
    }
LABEL_42:
    v44 = WALogCategoryDefaultHandle();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = self->_megawifiprofile_diagnostic_metrics_enabled;
      v47 = self->_megawifiprofile_diagnostic_metrics_period_ms;
      v48 = self->_timer;
      if (v48)
        v49 = dispatch_source_testcancel(v48) == 0;
      else
        v49 = 0;
      *(_DWORD *)buf = 136447234;
      v53 = "-[DatapathMetricStream updateTimerConfiguration]";
      v54 = 1024;
      v55 = 254;
      v56 = 1024;
      *(_DWORD *)v57 = v46;
      *(_WORD *)&v57[4] = 2048;
      *(_QWORD *)&v57[6] = v47;
      v58 = 1024;
      v59 = v49;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer State : Enabled %d Period(ms) %lu valid %d", buf, 0x28u);
    }
    goto LABEL_47;
  }
  if (!self->_megawifiprofile_diagnostic_metrics_enabled || !self->_megawifiprofile_diagnostic_metrics_period_ms)
    goto LABEL_42;
  v19 = WALogCategoryDefaultHandle();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v53 = "-[DatapathMetricStream updateTimerConfiguration]";
    v54 = 1024;
    v55 = 214;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
  }

  v21 = self->_timer;
  if (v21)
  {
    if (!dispatch_source_testcancel(v21))
    {
LABEL_32:
      v33 = WALogCategoryDefaultHandle();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms](self, "megawifiprofile_diagnostic_metrics_period_ms");
        *(_DWORD *)buf = 136446722;
        v53 = "-[DatapathMetricStream updateTimerConfiguration]";
        v54 = 1024;
        v55 = 234;
        v56 = 2048;
        *(_QWORD *)v57 = 1000000 * v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer fire in %llu ns", buf, 0x1Cu);
      }

      v36 = self->_timer;
      v37 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 0);
      dispatch_source_set_timer(v36, v37, 1000000* -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms](self, "megawifiprofile_diagnostic_metrics_period_ms"), 0x5F5E100uLL);
      v38 = WALogCategoryDefaultHandle();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v53 = "-[DatapathMetricStream updateTimerConfiguration]";
        v54 = 1024;
        v55 = 236;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer Done", buf, 0x12u);
      }

      v40 = WALogCategoryDefaultHandle();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v53 = "-[DatapathMetricStream updateTimerConfiguration]";
        v54 = 1024;
        v55 = 238;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dispatch_resume _timer", buf, 0x12u);
      }

      dispatch_resume((dispatch_object_t)self->_timer);
      self->_timerRunning = 1;
      v42 = WALogCategoryDefaultHandle();
      v17 = objc_claimAutoreleasedReturnValue(v42);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      v43 = self->_timerRunning;
      *(_DWORD *)buf = 136446722;
      v53 = "-[DatapathMetricStream updateTimerConfiguration]";
      v54 = 1024;
      v55 = 242;
      v56 = 1024;
      *(_DWORD *)v57 = v43;
      goto LABEL_40;
    }
LABEL_27:
    v28 = WALogCategoryDefaultHandle();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v53 = "-[DatapathMetricStream updateTimerConfiguration]";
      v54 = 1024;
      v55 = 226;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting dispatch_source_set_event_handler", buf, 0x12u);
    }

    v30 = self->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003201C;
    handler[3] = &unk_1000CCDB0;
    handler[4] = self;
    dispatch_source_set_event_handler(v30, handler);
    v31 = WALogCategoryDefaultHandle();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v53 = "-[DatapathMetricStream updateTimerConfiguration]";
      v54 = 1024;
      v55 = 231;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting block Done", buf, 0x12u);
    }

    goto LABEL_32;
  }
  v22 = WALogCategoryDefaultHandle();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v53 = "-[DatapathMetricStream updateTimerConfiguration]";
    v54 = 1024;
    v55 = 220;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Creating _timer", buf, 0x12u);
  }

  v24 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  v25 = self->_timer;
  self->_timer = v24;

  v26 = WALogCategoryDefaultHandle();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v53 = "-[DatapathMetricStream updateTimerConfiguration]";
    v54 = 1024;
    v55 = 222;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Creating _timer Done", buf, 0x12u);
  }

  if (self->_timer)
    goto LABEL_27;
  v50 = WALogCategoryDefaultHandle();
  v45 = objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "Failed to create _timer", buf, 2u);
  }
LABEL_47:

}

- (void)streamPBCodeable:(id)a3 additionalDictionaryItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  NSObject *v44;
  char *v45;
  id v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  char *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  int v60;
  id v61;
  NSObject *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  _BYTE v85[24];
  __int16 v86;
  NSObject *v87;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v9 = objc_alloc((Class)WANWActivityStatistics);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));
  v11 = objc_msgSend(v9, "initWithPBCodableData:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream lastPBLock](self, "lastPBLock"));
  objc_msgSend(v12, "lock");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream lastPB](self, "lastPB"));
  if (!objc_msgSend(v13, "length"))
  {

    goto LABEL_18;
  }
  v14 = -[DatapathMetricStream lastPBLength](self, "lastPBLength");

  if (!v14)
  {
LABEL_18:
    v46 = WALogCategoryDefaultHandle();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v81 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
      v82 = 1024;
      v83 = 335;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Missing previous fragment, writing single fragment", buf, 0x12u);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getTransformedFlattened:", 2));
    if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v32))
    {
      v78 = 0;
      v39 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v32, 0, &v78));
      v20 = v78;
      if (!v20)
      {
        v48 = WALogDiagnosticProfileLogHandle();
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = (char *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v39, 4);
          *(_DWORD *)buf = 138543362;
          v81 = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

        }
      }
      goto LABEL_40;
    }
    v51 = WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v81 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
      v82 = 1024;
      v83 = 350;
      v84 = 2112;
      *(_QWORD *)v85 = v32;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid JSON %@", buf, 0x1Cu);
    }
    goto LABEL_41;
  }
  v15 = objc_alloc((Class)NSData);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream lastPB](self, "lastPB")));
  v17 = objc_msgSend(v15, "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v16, "mutableBytes"), -[DatapathMetricStream lastPBLength](self, "lastPBLength"), 0);

  v18 = WALogCategoryDefaultHandle();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (v17)
  {
    v76 = v6;
    v77 = v8;
    v75 = v7;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v81 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
      v82 = 1024;
      v83 = 284;
      v84 = 2048;
      *(_QWORD *)v85 = objc_msgSend(v17, "length");
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:initWithBytesNoCopy NSData len %lu", buf, 0x1Cu);
    }

    v72 = v17;
    v20 = objc_msgSend(objc_alloc((Class)WANWActivityStatistics), "initWithPBCodableData:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject awdReport](v20, "awdReport"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dictionaryRepresentation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allKeys"));
    v24 = objc_msgSend(v23, "count");
    v74 = v11;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "awdReport"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dictionaryRepresentation"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allKeys"));
    v28 = objc_msgSend(v27, "count");

    if (v24 != v28)
    {
      v52 = WALogCategoryDefaultHandle();
      v39 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject awdReport](v20, "awdReport"));
        loga = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "dictionaryRepresentation"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](loga, "allKeys"));
        v55 = objc_msgSend(v54, "count");
        v11 = v74;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "awdReport"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "dictionaryRepresentation"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "allKeys"));
        v59 = objc_msgSend(v58, "count");
        *(_DWORD *)buf = 136446978;
        v81 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
        v82 = 1024;
        v83 = 327;
        v84 = 2048;
        *(_QWORD *)v85 = v55;
        *(_WORD *)&v85[8] = 2048;
        *(_QWORD *)&v85[10] = v59;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Not diffing - previousFragment.keys.count %lu wifiFragment %lu", buf, 0x26u);

        v7 = v75;
        v6 = v76;
        v8 = v77;
      }
      else
      {
        v7 = v75;
        v6 = v76;
        v8 = v77;
        v11 = v74;
      }
      v32 = v72;
LABEL_40:

      goto LABEL_41;
    }
    if (v20)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject awdReport](v20, "awdReport"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dictionaryRepresentation"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allKeys"));
      v32 = v72;
      if ((objc_msgSend(v31, "containsObject:", CFSTR("interfaceStats")) & 1) != 0)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject awdReport](v20, "awdReport"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dictionaryRepresentation"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "allKeys"));
        v36 = objc_msgSend(v35, "containsObject:", CFSTR("controllerStats"));

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject awdReport](v20, "awdReport"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dictionaryRepresentation"));
          v11 = v74;
          v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "getTransformedFlattenedFrom:style:", v38, 2));

          v6 = v76;
          v8 = v77;
          if (v39)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream dbDelegate](self, "dbDelegate"));
            objc_msgSend(v40, "processMetricDictOnEngine:data:", WADeviceAnalyticsWiFiStatsInfo, v39);

            v7 = v75;
            if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v39))
            {
              v79 = 0;
              v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v39, 0, &v79));
              v42 = v79;
              if (!v42)
              {
                v43 = WALogDiagnosticProfileLogHandle();
                v44 = objc_claimAutoreleasedReturnValue(v43);
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  log = v44;
                  v45 = (char *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v41, 4);
                  *(_DWORD *)buf = 138543362;
                  v81 = v45;
                  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

                  v44 = log;
                }

              }
              v8 = v77;
              goto LABEL_40;
            }
            v60 = 0;
          }
          else
          {
            v60 = 1;
            v7 = v75;
          }
LABEL_37:
          v61 = WALogCategoryDefaultHandle();
          v62 = objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject awdReport](v20, "awdReport"));
            logb = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "dictionaryRepresentation"));
            v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allKeys](logb, "allKeys"));
            v63 = objc_msgSend(v68, "count");
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject awdReport](v20, "awdReport"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "dictionaryRepresentation"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "allKeys"));
            *(_DWORD *)buf = 136447490;
            v81 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
            v82 = 1024;
            v83 = 323;
            v84 = 1024;
            *(_DWORD *)v85 = v60;
            *(_WORD *)&v85[4] = 2048;
            *(_QWORD *)&v85[6] = v63;
            *(_WORD *)&v85[14] = 2112;
            *(_QWORD *)&v85[16] = v66;
            v86 = 2112;
            v87 = v39;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%{public}s::%d:bad flattenedAndTransformed %d %lu %@ or invalid JSON %@", buf, 0x36u);

            v6 = v76;
            v7 = v75;

            v8 = v77;
          }

          v11 = v74;
          goto LABEL_40;
        }
      }
      else
      {

      }
      v39 = 0;
      v60 = 1;
      v7 = v75;
      v6 = v76;
      v8 = v77;
      goto LABEL_37;
    }
    v39 = 0;
    v60 = 1;
    v7 = v75;
    v6 = v76;
    v8 = v77;
    v32 = v72;
    goto LABEL_37;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v81 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
    v82 = 1024;
    v83 = 330;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to make NSData initWithBytesNoCopy", buf, 0x12u);
  }
  v32 = 0;
LABEL_41:

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[DatapathMetricStream lastPBLock](self, "lastPBLock"));
  objc_msgSend(v67, "unlock");

  objc_autoreleasePoolPop(v8);
}

- (WAStreamDBDelegate)dbDelegate
{
  return (WAStreamDBDelegate *)objc_loadWeakRetained((id *)&self->_dbDelegate);
}

- (void)setDbDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dbDelegate, a3);
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (id)block
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (ManagedConfiguration)managedConfiguration
{
  return (ManagedConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (void)setManagedConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (WAProtobufMessageSubmitter)pbConverter
{
  return self->_pbConverter;
}

- (void)setPbConverter:(id)a3
{
  objc_storeStrong((id *)&self->_pbConverter, a3);
}

- (id)getter
{
  return self->_getter;
}

- (void)setGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)timerRunning
{
  return self->_timerRunning;
}

- (void)setTimerRunning:(BOOL)a3
{
  self->_timerRunning = a3;
}

- (BOOL)megawifiprofile_diagnostic_metrics_enabled
{
  return self->_megawifiprofile_diagnostic_metrics_enabled;
}

- (void)setMegawifiprofile_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_megawifiprofile_diagnostic_metrics_enabled = a3;
}

- (unint64_t)megawifiprofile_diagnostic_metrics_period_ms
{
  return self->_megawifiprofile_diagnostic_metrics_period_ms;
}

- (void)setMegawifiprofile_diagnostic_metrics_period_ms:(unint64_t)a3
{
  self->_megawifiprofile_diagnostic_metrics_period_ms = a3;
}

- (BOOL)coredata_diagnostic_metrics_enabled
{
  return self->_coredata_diagnostic_metrics_enabled;
}

- (void)setCoredata_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_coredata_diagnostic_metrics_enabled = a3;
}

- (NSMutableData)lastPB
{
  return self->_lastPB;
}

- (void)setLastPB:(id)a3
{
  objc_storeStrong((id *)&self->_lastPB, a3);
}

- (unint64_t)lastPBLength
{
  return self->_lastPBLength;
}

- (void)setLastPBLength:(unint64_t)a3
{
  self->_lastPBLength = a3;
}

- (NSLock)lastPBLock
{
  return self->_lastPBLock;
}

- (void)setLastPBLock:(id)a3
{
  objc_storeStrong((id *)&self->_lastPBLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPBLock, 0);
  objc_storeStrong((id *)&self->_lastPB, 0);
  objc_storeStrong(&self->_getter, 0);
  objc_storeStrong((id *)&self->_pbConverter, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_dbDelegate);
}

@end
