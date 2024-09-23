@implementation _DASPPSDataManager

- (_DASPPSDataManager)init
{
  _DASPPSDataManager *v2;
  uint64_t v3;
  OS_os_log *log;
  uint64_t v5;
  NSMutableDictionary *ppsIDMapping;
  uint64_t v7;
  NSMutableDictionary *mediaanalysisProgressMapping;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASPPSDataManager;
  v2 = -[_DASPPSDataManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("ppsDataManager")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    ppsIDMapping = v2->_ppsIDMapping;
    v2->_ppsIDMapping = (NSMutableDictionary *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    mediaanalysisProgressMapping = v2->_mediaanalysisProgressMapping;
    v2->_mediaanalysisProgressMapping = (NSMutableDictionary *)v7;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mediaanalysisProgressMapping, "setObject:forKeyedSubscript:", CFSTR("com.apple.mediaanalysisd.photos.face"), CFSTR("FaceAnalysis"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mediaanalysisProgressMapping, "setObject:forKeyedSubscript:", CFSTR("com.apple.mediaanalysisd.photos.scene"), CFSTR("SceneAnalysis"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mediaanalysisProgressMapping, "setObject:forKeyedSubscript:", CFSTR("com.apple.mediaanalysisd.photos.full"), CFSTR("MediaAnalysis"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mediaanalysisProgressMapping, "setObject:forKeyedSubscript:", CFSTR("com.apple.mediaanalysisd.photos.visualsearch"), CFSTR("VisualSearchAnalysis"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mediaanalysisProgressMapping, "setObject:forKeyedSubscript:", CFSTR("com.apple.mediaanalysisd.photos.ocr"), CFSTR("OCRAnalysis"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_mediaanalysisProgressMapping, "setObject:forKeyedSubscript:", CFSTR("com.apple.mediaanalysisd.photos.pec"), CFSTR("PECAnalysis"));
  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F9F0;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB740 != -1)
    dispatch_once(&qword_1001AB740, block);
  return (id)qword_1001AB738;
}

- (PPSTelemetryIdentifier)ppsIDForSubsystem:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *log;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  PPSTelemetryIdentifier *v22;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager ppsIDMapping](self, "ppsIDMapping"));
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v6, v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager ppsIDMapping](self, "ppsIDMapping"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

  v24 = 0;
  if (v11)
  {
    objc_msgSend(v11, "getValue:size:", &v24, 8);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Creating PPS ID for %@", buf, 0xCu);
    }
    v24 = PPSCreateTelemetryIdentifier(v6, v7);
    if (v24)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue value:withObjCType:](NSValue, "value:withObjCType:", &v24, "^{PPSTelemetryIdentifier=}"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager ppsIDMapping](self, "ppsIDMapping"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v9);

    }
    else
    {
      v14 = self->_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1000E1D5C(v14, v15, v16, v17, v18, v19, v20, v21);
      v11 = 0;
    }
  }
  v22 = (PPSTelemetryIdentifier *)v24;

  objc_sync_exit(v8);
  return v22;
}

- (id)filterTimeSeriesByTaskIdentifiers:(id)a3 timeSeries:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.TaskName IN %@"), v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "array"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v7));

    v10 = objc_msgSend(objc_alloc((Class)sub_10004FCD4()), "initWithEvents:", v9);
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (id)filterTimeSeriesByFeatureCodes:(id)a3 timeSeries:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.FeatureCode IN %@"), v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "array"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v7));

    v10 = objc_msgSend(objc_alloc((Class)sub_10004FCD4()), "initWithEvents:", v9);
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (id)filterTimeSeriesByTimeFilter:(id)a3 timeSeries:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    objc_msgSend(v11, "timeIntervalSince1970");
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("@epochTimestamp >= %lf AND @epochTimestamp <= %lf"), v10, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "array"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filteredArrayUsingPredicate:", v14));

    v17 = objc_msgSend(objc_alloc((Class)sub_10004FCD4()), "initWithEvents:", v16);
  }
  else
  {
    v17 = v5;
  }

  return v17;
}

- (id)getTaskDependencyGraphs:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _DASTaskDependencies *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  _DASTaskDependencyGraph *v33;
  void *v34;
  void *v36;
  id obj;
  id obja;
  void *v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
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
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];

  obj = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager loadTaskDependencies:metrics:timeFilter:filepath:](self, "loadTaskDependencies:metrics:timeFilter:filepath:"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v36 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "array"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metricKeysAndValues"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TaskName")));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metricKeysAndValues"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ProducedResultIdentifiers")));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metricKeysAndValues"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DependencyIdentifiers")));

        v19 = -[_DASTaskDependencies initWithProducedResultIdentifiers:dependencyIdentifiers:]([_DASTaskDependencies alloc], "initWithProducedResultIdentifiers:dependencyIdentifiers:", v16, v18);
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v19, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v9);
  }

  v40 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obja = obj;
  v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(obja);
        v24 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v25 = v39;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v43;
LABEL_15:
          v29 = 0;
          while (1)
          {
            if (*(_QWORD *)v43 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "nodeForTaskIdentifier:", v24));

            if (v31)
              break;
            if (v27 == (id)++v29)
            {
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
              if (v27)
                goto LABEL_15;
              goto LABEL_21;
            }
          }
          v32 = v30;

          if (v32)
            goto LABEL_24;
        }
        else
        {
LABEL_21:

        }
        v33 = [_DASTaskDependencyGraph alloc];
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskDependencyGraph constructTaskDependencyGraphForTask:dependencyDataMap:](v33, "constructTaskDependencyGraphForTask:dependencyDataMap:", v24, v41));

        objc_msgSend(v25, "addObject:", v34);
        v32 = 0;
LABEL_24:
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v32, v24);

      }
      v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v21);
  }

  return v40;
}

- (id)getPPSData:(id)a3 filepath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _DASPPSDataManager *v10;
  NSObject *log;
  _BOOL4 v12;
  unsigned int v13;
  id v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id result;
  char *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[8];
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  log = v10->_log;
  v12 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting PPS Data from provided filepath", buf, 2u);
    }
    v30 = 0;
    v13 = objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", &v30);
    v14 = v30;
    if (v13)
    {
      v36 = 0;
      v37 = &v36;
      v38 = 0x2050000000;
      v15 = (void *)qword_1001AB758;
      v39 = qword_1001AB758;
      if (!qword_1001AB758)
      {
        *(_QWORD *)buf = _NSConcreteStackBlock;
        v32 = 3221225472;
        v33 = (uint64_t)sub_100052558;
        v34 = &unk_10015D610;
        v35 = &v36;
        sub_100052558((uint64_t)buf);
        v15 = (void *)v37[3];
      }
      v16 = objc_retainAutorelease(v15);
      _Block_object_dispose(&v36, 8);
      v17 = objc_msgSend([v16 alloc], "initWithFilepath:", v9);
      v29 = v14;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataForRequest:withError:", v8, &v29));
      v19 = v29;

      v14 = v19;
    }
    else
    {
      v18 = 0;
    }
LABEL_15:
    objc_sync_exit(v10);

    if (!v14)
    {
      v25 = v18;
      goto LABEL_22;
    }
    v24 = v10->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      sub_1000E1D8C((uint64_t)v14, v24);
      if (a5)
        goto LABEL_18;
    }
    else if (a5)
    {
LABEL_18:
      v25 = 0;
      *a5 = objc_retainAutorelease(v14);
LABEL_22:

      return v25;
    }
    v25 = 0;
    goto LABEL_22;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting on-device PPS Data", buf, 2u);
  }
  v28 = 0;
  v20 = v8;
  *(_QWORD *)buf = 0;
  v32 = (uint64_t)buf;
  v33 = 0x2020000000;
  v21 = off_1001AB760;
  v34 = off_1001AB760;
  if (!off_1001AB760)
  {
    v22 = (void *)sub_1000524A8();
    v21 = dlsym(v22, "PerfPowerServicesGetData");
    *(_QWORD *)(v32 + 24) = v21;
    off_1001AB760 = v21;
  }
  _Block_object_dispose(buf, 8);
  if (v21)
  {
    v23 = ((uint64_t (*)(id, id *))v21)(v20, &v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v14 = v28;
    goto LABEL_15;
  }
  v27 = dlerror();
  result = (id)abort_report_np("%s", v27);
  __break(1u);
  return result;
}

- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *log;
  id v22;
  void *v23;
  id v24;
  void *v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    v27 = 138413314;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v18;
    v35 = 2112;
    v36 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Getting PPSTimeSeries for subsystem: %@ category: %@ with valueFilter: %@ & metrics: %@ & timeFilter:%@", (uint8_t *)&v27, 0x34u);
  }
  v22 = sub_1000507C4(v15, v16, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = objc_msgSend(objc_alloc((Class)sub_1000508B0()), "initWithMetrics:predicate:timeFilter:", v18, v23, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSData:filepath:error:](self, "getPPSData:filepath:error:", v24, v20, a9));

  return v25;
}

- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 limitCount:(unint64_t)a8 offsetCount:(unint64_t)a9 filepath:(id)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *log;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v18;
    v35 = 2112;
    v36 = v19;
    v37 = 2112;
    v38 = v20;
    v39 = 2048;
    v40 = a8;
    v41 = 2048;
    v42 = a9;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Getting PPSTimeSeries for subsystem: %@ category: %@ with valueFilter: %@ & metrics: %@ & timeFilter:%@ & limitCount:%lu & offsetCount:%lu", buf, 0x48u);
  }
  v23 = sub_1000507C4(v16, v17, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = objc_msgSend(objc_alloc((Class)sub_1000508B0()), "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:", v19, v24, v20, a8, a9);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSData:filepath:error:](self, "getPPSData:filepath:error:", v25, v21, a11));

  return v26;
}

- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 limitCount:(unint64_t)a8 offsetCount:(unint64_t)a9 readDirection:(unint64_t)a10 filepath:(id)a11 error:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *log;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a11;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414082;
    v31 = v17;
    v32 = 2112;
    v33 = v18;
    v34 = 2112;
    v35 = v19;
    v36 = 2112;
    v37 = v20;
    v38 = 2112;
    v39 = v21;
    v40 = 2048;
    v41 = a8;
    v42 = 2048;
    v43 = a9;
    v44 = 2048;
    v45 = a10;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Getting PPSTimeSeries for subsystem: %@ category: %@ with valueFilter: %@ & metrics: %@ & timeFilter:%@ & limitCount:%lu & offsetCount:%lu & readDirection: %lu", buf, 0x52u);
  }
  v24 = sub_1000507C4(v17, v18, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = objc_msgSend(objc_alloc((Class)sub_1000508B0()), "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:readDirection:", v20, v25, v21, a8, a9, a10);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSData:filepath:error:](self, "getPPSData:filepath:error:", v26, v22, a12));

  return v27;
}

- (id)getPPSHistogram:(id)a3 category:(id)a4 valueFilter:(id)a5 dimensions:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *log;
  id v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE buf[24];
  void *v35;
  _BYTE v36[10];
  __int16 v37;
  id v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v35 = v17;
    *(_WORD *)v36 = 2112;
    *(_QWORD *)&v36[2] = v18;
    v37 = 2112;
    v38 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Getting PPSHistogram for subsystem: %@ category: %@ with valueFilter: %@ dimensions: %@ timeFilter: %@", buf, 0x34u);
  }
  v22 = sub_1000507C4(v15, v16, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v24 = (void *)qword_1001AB778;
  v33 = qword_1001AB778;
  if (!qword_1001AB778)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100052600;
    v35 = &unk_10015D610;
    *(_QWORD *)v36 = &v30;
    sub_100052600((uint64_t)buf);
    v24 = (void *)v31[3];
  }
  v25 = objc_retainAutorelease(v24);
  _Block_object_dispose(&v30, 8);
  v26 = [v25 alloc];
  v27 = objc_msgSend(v26, "initWithDimensions:predicate:timeFilter:", v18, v23, v19, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSData:filepath:error:](self, "getPPSData:filepath:error:", v27, v20, a9));

  return v28;
}

- (id)getPPSTimeIntervalSet:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *log;
  id v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE buf[24];
  void *v35;
  _BYTE v36[10];
  __int16 v37;
  id v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v35 = v17;
    *(_WORD *)v36 = 2112;
    *(_QWORD *)&v36[2] = v18;
    v37 = 2112;
    v38 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Getting PPSTimeIntervalSet for subsystem: %@ category: %@ with valueFilter: %@ metrics: %@ timeFilter: %@", buf, 0x34u);
  }
  v22 = sub_1000507C4(v15, v16, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v24 = (void *)qword_1001AB780;
  v33 = qword_1001AB780;
  if (!qword_1001AB780)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100052654;
    v35 = &unk_10015D610;
    *(_QWORD *)v36 = &v30;
    sub_100052654((uint64_t)buf);
    v24 = (void *)v31[3];
  }
  v25 = objc_retainAutorelease(v24);
  _Block_object_dispose(&v30, 8);
  v26 = [v25 alloc];
  v27 = objc_msgSend(v26, "initWithMetrics:predicate:timeFilter:", v18, v23, v19, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSData:filepath:error:](self, "getPPSData:filepath:error:", v27, v20, a9));

  return v28;
}

- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v8;

  v8 = a3;
  LOBYTE(a5) = -[_DASPPSDataManager sendDataToPPS:ppsID:](self, "sendDataToPPS:ppsID:", v8, -[_DASPPSDataManager ppsIDForSubsystem:category:](self, "ppsIDForSubsystem:category:", a4, a5));

  return (char)a5;
}

- (BOOL)sendDataToPPS:(id)a3 ppsID:(PPSTelemetryIdentifier *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  NSObject *log;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  if (!v6)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      sub_1000E1E00(log, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_10;
  }
  v7 = self->_log;
  if (!a4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000E1E30(v7, v17, v18, v19, v20, v21, v22, v23);
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000E1E60((uint64_t)v6, v7);
  PPSSendTelemetry(a4, v6);
  v8 = 1;
LABEL_11:

  return v8;
}

- (id)loadTaskCheckpoints:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *log;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting task checkpoints for %@ with metrics: %@ & timeFilter: %@", buf, 0x20u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:](self, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("TaskCheckpoint"), 0, v11, 0, v13, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:](self, "filterTimeSeriesByTimeFilter:timeSeries:", v12, v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTaskIdentifiers:timeSeries:](self, "filterTimeSeriesByTaskIdentifiers:timeSeries:", v10, v16));
  return v17;
}

- (id)loadTaskBlockingReasons:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *log;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting task blocking reasons for %@ with metrics: %@ & timeFilter: %@", buf, 0x20u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:](self, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("TaskBlockingPolicies"), 0, v11, 0, v13, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:](self, "filterTimeSeriesByTimeFilter:timeSeries:", v12, v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTaskIdentifiers:timeSeries:](self, "filterTimeSeriesByTaskIdentifiers:timeSeries:", v10, v16));
  return v17;
}

- (id)loadIntensiveTaskBlockingReasons:(id)a3 metrics:(id)a4 filepath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *log;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting intensive task blocking reasons with metrics: %@ & timeFilter: %@", buf, 0x16u);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:](self, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("IntensiveTasksBlockingPolicies"), 0, v9, 0, v10, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:](self, "filterTimeSeriesByTimeFilter:timeSeries:", v8, v12));

  return v13;
}

- (id)loadFeatureCheckpoints:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *log;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting feature checkpoints for %@ with metrics: %@", buf, 0x16u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:](self, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("FeatureCheckpoint"), 0, v11, 0, v13, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:](self, "filterTimeSeriesByTimeFilter:timeSeries:", v12, v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByFeatureCodes:timeSeries:](self, "filterTimeSeriesByFeatureCodes:timeSeries:", v10, v16));
  return v17;
}

- (id)loadConfig:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *log;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting Config with metrics: %@ & timeFilter: %@", buf, 0x16u);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:](self, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("Config"), 0, v8, 0, v10, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:](self, "filterTimeSeriesByTimeFilter:timeSeries:", v9, v12));

  return v13;
}

- (id)loadTaskProgress:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10;
  id v11;
  NSObject *log;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _DASPPSDataManager *v41;
  void *v42;
  id v43;
  id obj;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[128];
  uint8_t v59[128];
  _BYTE buf[24];
  void *v61;
  uint64_t *v62;

  v10 = a3;
  v11 = a4;
  v40 = a5;
  v39 = a6;
  v41 = self;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v61 = v40;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting task progress for %@ with metrics: %@ & timeFilter: %@", buf, 0x20u);
  }
  v36 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:](self, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("TaskWorkload"), 0, v11, 0, v39, 0));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:](self, "filterTimeSeriesByTimeFilter:timeSeries:", v40, v13));

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager mediaanalysisProgressMapping](self, "mediaanalysisProgressMapping"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allValues"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v10;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(obj);
        if (objc_msgSend(v45, "containsObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i)))
          objc_msgSend(v42, "addObject:", CFSTR("com.apple.mediaanalysisd.progress"));
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v16);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTaskIdentifiers:timeSeries:](self, "filterTimeSeriesByTaskIdentifiers:timeSeries:", v42, v38));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "array"));
  v20 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v21)
          objc_enumerationMutation(v43);
        v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v23, "epochTimestamp");
        objc_msgSend(v23, "monotonicTimestamp");
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "metricKeysAndValues"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v24));

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("TaskName")));
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.mediaanalysisd.progress"));

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager mediaanalysisProgressMapping](v41, "mediaanalysisProgressMapping"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("SubCategory")));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v29));
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, CFSTR("TaskName"));

        }
        v54 = 0;
        v55 = &v54;
        v56 = 0x2050000000;
        v31 = (void *)qword_1001AB788;
        v57 = qword_1001AB788;
        if (!qword_1001AB788)
        {
          *(_QWORD *)buf = _NSConcreteStackBlock;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = sub_1000526A8;
          v61 = &unk_10015D610;
          v62 = &v54;
          sub_1000526A8((uint64_t)buf);
          v31 = (void *)v55[3];
        }
        v32 = objc_retainAutorelease(v31);
        _Block_object_dispose(&v54, 8);
        objc_msgSend(v23, "monotonicTimestamp");
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "eventWithMonotonicTimestamp:timeOffset:dictionary:", v25));
        objc_msgSend(v19, "addObject:", v33);

      }
      v20 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v20);
  }

  v34 = objc_msgSend(objc_alloc((Class)sub_10004FCD4()), "initWithEvents:", v19);
  return v34;
}

- (id)loadTasksForFeatures:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *log;
  void *v15;
  void *v16;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting tasks for Feature Codes: %@ with metrics: %@ & timeFilter: %@", buf, 0x20u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:](self, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("TaskFeatureCodes"), 0, v11, 0, v13, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:](self, "filterTimeSeriesByTimeFilter:timeSeries:", v12, v15));

  return v16;
}

- (id)loadTaskDependencies:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *log;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting dependencies for tasks: %@ with metrics: %@ & timeFilter: %@", buf, 0x20u);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:](self, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("TaskDependencies"), 0, v11, 0, v13, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:](self, "filterTimeSeriesByTimeFilter:timeSeries:", v12, v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTaskIdentifiers:timeSeries:](self, "filterTimeSeriesByTaskIdentifiers:timeSeries:", v10, v16));
  return v17;
}

- (id)loadTaskDependencyGraph:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _DASTaskDependencies *v26;
  _DASTaskDependencyGraph *v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];

  v8 = a3;
  v9 = a4;
  v35 = 0;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:](self, "getPPSTimeSeries:category:valueFilter:metrics:timeFilter:filepath:error:", CFSTR("BackgroundProcessing"), CFSTR("TaskDependencies"), 0, 0, 0, a5, &v35));
  v11 = v35;
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v29 = v9;
    v30 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPPSDataManager filterTimeSeriesByTimeFilter:timeSeries:](self, "filterTimeSeriesByTimeFilter:timeSeries:", v9, v10));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = v13;
    v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v10);
          v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "metricKeysAndValues"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("TaskName")));

          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "metricKeysAndValues"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ProducedResultIdentifiers")));

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "metricKeysAndValues"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DependencyIdentifiers")));

            v26 = -[_DASTaskDependencies initWithProducedResultIdentifiers:dependencyIdentifiers:]([_DASTaskDependencies alloc], "initWithProducedResultIdentifiers:dependencyIdentifiers:", v23, v25);
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v26, v21);

          }
        }
        v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v16);
    }

    v27 = [_DASTaskDependencyGraph alloc];
    v8 = v30;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskDependencyGraph constructTaskDependencyGraphForTask:dependencyDataMap:](v27, "constructTaskDependencyGraphForTask:dependencyDataMap:", v30, v14));

    v11 = 0;
    v9 = v29;
  }

  return v12;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableDictionary)ppsIDMapping
{
  return self->_ppsIDMapping;
}

- (void)setPpsIDMapping:(id)a3
{
  objc_storeStrong((id *)&self->_ppsIDMapping, a3);
}

- (NSMutableDictionary)mediaanalysisProgressMapping
{
  return self->_mediaanalysisProgressMapping;
}

- (void)setMediaanalysisProgressMapping:(id)a3
{
  objc_storeStrong((id *)&self->_mediaanalysisProgressMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaanalysisProgressMapping, 0);
  objc_storeStrong((id *)&self->_ppsIDMapping, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
