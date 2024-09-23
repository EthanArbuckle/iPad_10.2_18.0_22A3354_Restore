@implementation _DASFeatureDurationTracker

- (_DASFeatureDurationTracker)init
{
  _DASFeatureDurationTracker *v2;
  uint64_t v3;
  OS_os_log *log;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUserDefaults *v13;
  NSUserDefaults *defaults;
  uint64_t v15;
  NSMutableDictionary *featureDurationDict;
  void *v17;
  uint64_t v18;
  NSDictionary *featuresDict;
  void *v20;
  uint64_t v21;
  NSDictionary *fastPassActivities;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)_DASFeatureDurationTracker;
  v2 = -[_DASFeatureDurationTracker init](&v32, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("featureDurationTracker")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1000E2480(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.activityDurationTracker"));
    defaults = v2->_defaults;
    v2->_defaults = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    featureDurationDict = v2->_featureDurationDict;
    v2->_featureDurationDict = (NSMutableDictionary *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dictionaryForPlist:", 2));
    featuresDict = v2->_featuresDict;
    v2->_featuresDict = (NSDictionary *)v18;

    -[_DASFeatureDurationTracker loadMaximumDurations](v2, "loadMaximumDurations");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dictionaryForPlist:", 0));
    fastPassActivities = v2->_fastPassActivities;
    v2->_fastPassActivities = (NSDictionary *)v21;

    if (-[_DASFeatureDurationTracker shouldResetDurations](v2, "shouldResetDurations"))
    {
      -[_DASFeatureDurationTracker resetFeatureDurations](v2, "resetFeatureDurations");
      v23 = v2->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        sub_1000E2450(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    -[_DASFeatureDurationTracker loadState](v2, "loadState");
  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057B60;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB818 != -1)
    dispatch_once(&qword_1001AB818, block);
  return (id)qword_1001AB820;
}

+ (BOOL)shouldTrackActivity:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "featureCodes"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)loadState
{
  _DASFeatureDurationTracker *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  NSMutableDictionary *featureDurationDict;
  void *v11;
  NSObject *log;
  NSMutableDictionary *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  NSMutableDictionary *v19;
  _BYTE v20[128];

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary removeAllObjects](v2->_featureDurationDict, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("FeatureDurationDict")));
  v4 = objc_msgSend(v3, "mutableCopy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        featureDurationDict = v2->_featureDurationDict;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9, (_QWORD)v14));
        -[NSMutableDictionary setObject:forKey:](featureDurationDict, "setObject:forKey:", v11, v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  log = v2->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v2->_featureDurationDict;
    *(_DWORD *)buf = 138412290;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Loaded feature duration data from defaults %@", buf, 0xCu);
  }

  objc_sync_exit(v2);
}

- (void)saveState
{
  _DASFeatureDurationTracker *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:copyItems:", v2->_featureDurationDict, 1);
  -[NSUserDefaults setObject:forKey:](v2->_defaults, "setObject:forKey:", v3, CFSTR("FeatureDurationDict"));
  v4 = v2->_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("FeatureDurationDict")));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saved feature duration data to defaults %@", (uint8_t *)&v6, 0xCu);

  }
  objc_sync_exit(v2);

}

- (BOOL)shouldResetDurations
{
  char v3;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  _BOOL4 v8;
  void *v9;

  v9 = 0;
  if (qword_1001AB828 || sysctlbyname_get_data_np("kern.osrelease", &v9, &qword_1001AB828))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
  free(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("FeatureDurationResetVersion")));
  v7 = objc_msgSend(v6, "isEqualToString:", v5);
  v8 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG);
  if ((v7 & 1) != 0)
  {
    if (v8)
      sub_1000E24B0();
  }
  else
  {
    if (v8)
      sub_1000E2510();
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v5, CFSTR("FeatureDurationResetVersion"));
  }
  v3 = v7 ^ 1;

  return v3;
}

- (void)resetFeatureDurations
{
  _DASFeatureDurationTracker *v2;
  void *v3;
  uint64_t v4;
  NSDictionary *featuresDict;
  NSDictionary *v6;
  id v7;
  uint64_t v8;
  void *i;
  NSObject *log;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryForPlist:", 2));
  featuresDict = v2->_featuresDict;
  v2->_featuresDict = (NSDictionary *)v4;

  if (-[NSDictionary count](v2->_featuresDict, "count"))
  {
    -[NSMutableDictionary removeAllObjects](v2->_featureDurationDict, "removeAllObjects");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v2->_featuresDict;
    v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v6);
          -[NSMutableDictionary setObject:forKey:](v2->_featureDurationDict, "setObject:forKey:", &off_10016E7E0, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), (_QWORD)v18);
        }
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    -[_DASFeatureDurationTracker saveState](v2, "saveState");
    log = v2->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      sub_1000E25AC((uint64_t)&v2->_featureDurationDict, log, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    v17 = v2->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000E2570(v17);
  }
  objc_sync_exit(v2);

}

- (void)loadMaximumDurations
{
  NSDictionary *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  _UNKNOWN **v15;
  NSDictionary *maximumFeatureDurationDict;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryForPlist:", 2));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("runtimeLimit")));

        objc_msgSend(v12, "doubleValue");
        if ((uint64_t)v13 <= 0 || v12 == 0)
          v15 = &off_10016F500;
        else
          v15 = (_UNKNOWN **)v12;
        -[NSDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v15, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  maximumFeatureDurationDict = self->_maximumFeatureDurationDict;
  self->_maximumFeatureDurationDict = v2;

}

- (double)maximumDurationForFeature:(id)a3
{
  id v4;
  _DASFeatureDurationTracker *v5;
  NSDictionary *maximumFeatureDurationDict;
  void *v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSDictionary count](v5->_maximumFeatureDurationDict, "count"))
    -[_DASFeatureDurationTracker loadMaximumDurations](v5, "loadMaximumDurations");
  maximumFeatureDurationDict = v5->_maximumFeatureDurationDict;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](maximumFeatureDurationDict, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    v9 = v5->_maximumFeatureDurationDict;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

  }
  else
  {
    v13 = 0.0;
  }
  objc_sync_exit(v5);

  return v13;
}

- (double)durationForFeature:(id)a3
{
  id v4;
  _DASFeatureDurationTracker *v5;
  NSMutableDictionary *featureDurationDict;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSMutableDictionary count](v5->_featureDurationDict, "count"))
    -[_DASFeatureDurationTracker loadState](v5, "loadState");
  featureDurationDict = v5->_featureDurationDict;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](featureDurationDict, "objectForKeyedSubscript:", v7));

  if (v8)
  {
    v9 = v5->_featureDurationDict;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

  }
  else
  {
    v13 = 0.0;
  }
  objc_sync_exit(v5);

  return v13;
}

- (void)updateFeatureDurationActivityCompleted:(id)a3
{
  id v4;
  _DASFeatureDurationTracker *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *fastPassActivities;
  double v9;
  double v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *i;
  void *v20;
  NSMutableDictionary *featureDurationDict;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSDictionary *maximumFeatureDurationDict;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *log;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  double v60;
  __int16 v61;
  uint64_t v62;
  _BYTE v63[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v46 = v4;
  if (+[_DASFeatureDurationTracker shouldTrackActivity:](_DASFeatureDurationTracker, "shouldTrackActivity:", v4))
  {
    -[_DASFeatureDurationTracker loadState](v5, "loadState");
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endTime"));
    if (v45 && v44)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryForPlist:", 0));
      fastPassActivities = v5->_fastPassActivities;
      v5->_fastPassActivities = (NSDictionary *)v7;

      objc_msgSend(v44, "timeIntervalSinceDate:", v45);
      v10 = v9;
      v11 = v5->_fastPassActivities;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "name"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12));

      if (v13)
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v14 = v5->_fastPassActivities;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "name"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("FeatureCodes")));

        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
        obj = v17;
        if (v18)
        {
          v48 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(_QWORD *)v50 != v48)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
              featureDurationDict = v5->_featureDurationDict;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue", v44));
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](featureDurationDict, "objectForKeyedSubscript:", v22));

              objc_msgSend(v23, "doubleValue");
              v25 = v10 + v24;
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10 + v24));
              v27 = v5->_featureDurationDict;
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v26, v28);

              v29 = v5->_log;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "name"));
                maximumFeatureDurationDict = v5->_maximumFeatureDurationDict;
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue"));
                v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](maximumFeatureDurationDict, "objectForKeyedSubscript:", v33));
                objc_msgSend(v34, "doubleValue");
                *(_DWORD *)buf = 138413314;
                v54 = v30;
                v55 = 2112;
                v56 = v31;
                v57 = 2112;
                v58 = v20;
                v59 = 2048;
                v60 = v25;
                v61 = 2048;
                v62 = v35;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Deducting runtime %@ after activity %@: Feature code %@ is now %f < %f", buf, 0x34u);

              }
            }
            v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
          }
          while (v18);
        }
      }
      else
      {
        obj = v5->_log;
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "name"));
          sub_1000E267C(v36, buf, obj);
        }
      }

      log = v5->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        sub_1000E2614((uint64_t)v5, log, v38, v39, v40, v41, v42, v43);
      -[_DASFeatureDurationTracker saveState](v5, "saveState", v44);
    }

  }
  objc_sync_exit(v5);

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

- (NSDictionary)featuresDict
{
  return self->_featuresDict;
}

- (void)setFeaturesDict:(id)a3
{
  objc_storeStrong((id *)&self->_featuresDict, a3);
}

- (NSDictionary)maximumFeatureDurationDict
{
  return self->_maximumFeatureDurationDict;
}

- (void)setMaximumFeatureDurationDict:(id)a3
{
  objc_storeStrong((id *)&self->_maximumFeatureDurationDict, a3);
}

- (NSDictionary)fastPassActivities
{
  return self->_fastPassActivities;
}

- (void)setFastPassActivities:(id)a3
{
  objc_storeStrong((id *)&self->_fastPassActivities, a3);
}

- (NSMutableDictionary)featureDurationDict
{
  return self->_featureDurationDict;
}

- (void)setFeatureDurationDict:(id)a3
{
  objc_storeStrong((id *)&self->_featureDurationDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDurationDict, 0);
  objc_storeStrong((id *)&self->_fastPassActivities, 0);
  objc_storeStrong((id *)&self->_maximumFeatureDurationDict, 0);
  objc_storeStrong((id *)&self->_featuresDict, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
