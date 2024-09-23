@implementation BatteryAlgorithmsRunner

- (BatteryAlgorithmsRunner)init
{
  BatteryAlgorithmsRunner *v2;
  os_log_t v3;
  void *v4;
  BatteryAlgorithmsRunner *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BatteryAlgorithmsRunner;
  v2 = -[BatteryAlgorithmsRunner init](&v7, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.batteryintelligence", "BatteryAlgorithmsRunner");
    v4 = (void *)qword_100035228;
    qword_100035228 = (uint64_t)v3;

    v5 = v2;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10001E6B0();
  }

  return v2;
}

- (void)algoRunnerInitWithData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *metaFilePath;
  NSObject *v15;
  NSString *v16;
  void *v17;
  id v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *runMetaData;
  void *v22;
  NSString *v23;
  NSString *stateFilePath;
  NSObject *v25;
  NSString *v26;
  void *v27;
  id v28;
  void *v29;
  NSDictionary *v30;
  NSDictionary *algoStateData;
  void *v32;
  NSString *v33;
  NSString *eventCA;
  void *v35;
  NSString *v36;
  id v37;
  void *v38;
  id algorithmObject;
  void *v40;
  void *v41;
  NSObject *v42;
  NSString *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSString *v47;
  void *v48;
  NSObject *v49;
  NSString *v50;
  uint8_t buf[4];
  NSString *v52;

  v4 = a3;
  if (!-[BatteryAlgorithmsRunner featureFlagEn](self, "featureFlagEn"))
  {
    v5 = (void *)qword_100035228;
    if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner AlgorithmClassName](self, "AlgorithmClassName"));
      *(_DWORD *)buf = 138412290;
      v52 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ algorithm disabled by Feature Flag, Skipping", buf, 0xCu);

    }
    self->_initDone = 1;
  }
  v8 = sub_100017140();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("%@%@%@"), CFSTR("/"), CFSTR("com.apple.batteryintelligence.batteryalgorithms"), CFSTR("/")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("%@%@"), CFSTR("com.apple.batteryintelligence.batteryalgorithms"), CFSTR("-")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner AlgorithmClassName](self, "AlgorithmClassName"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("%@%@"), v12, CFSTR("-meta.plist")));
  metaFilePath = self->_metaFilePath;
  self->_metaFilePath = v13;

  v15 = qword_100035228;
  if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_metaFilePath;
    *(_DWORD *)buf = 138412290;
    v52 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Metadata file: %@", buf, 0xCu);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner metaFilePath](self, "metaFilePath"));
  v18 = sub_10001740C(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v19));
  runMetaData = self->_runMetaData;
  self->_runMetaData = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner AlgorithmClassName](self, "AlgorithmClassName"));
  v23 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("%@%@"), v22, CFSTR("-state.plist")));
  stateFilePath = self->_stateFilePath;
  self->_stateFilePath = v23;

  v25 = qword_100035228;
  if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
  {
    v26 = self->_stateFilePath;
    *(_DWORD *)buf = 138412290;
    v52 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "State file: %@", buf, 0xCu);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner stateFilePath](self, "stateFilePath"));
  v28 = sub_10001740C(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v29));
  algoStateData = self->_algoStateData;
  self->_algoStateData = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner AlgorithmClassName](self, "AlgorithmClassName"));
  v33 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.batteryalgorithm."), "stringByAppendingFormat:", CFSTR("%@"), v32));
  eventCA = self->_eventCA;
  self->_eventCA = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner algoStateData](self, "algoStateData"));
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("savedAlgoState"));

  v36 = (NSString *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner AlgorithmClassName](self, "AlgorithmClassName"));
  v37 = -[objc_class algorithmWithData:](NSClassFromString(v36), "algorithmWithData:", v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

  algorithmObject = self->_algorithmObject;
  self->_algorithmObject = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner algorithmObject](self, "algorithmObject"));
  if (!v40)
  {
    v41 = (void *)qword_100035228;
    if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      v43 = (NSString *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner AlgorithmClassName](self, "AlgorithmClassName"));
      *(_DWORD *)buf = 138412290;
      v52 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@ algorithm Errored out", buf, 0xCu);

    }
    self->_initDone = 0;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner algorithmObject](self, "algorithmObject"));
  v45 = (void *)qword_100035228;
  if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
  {
    v46 = v45;
    v47 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "name"));
    *(_DWORD *)buf = 138412290;
    v52 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "The Algorithm Name is: %@", buf, 0xCu);

  }
  v48 = (void *)qword_100035228;
  if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
  {
    v49 = v48;
    v50 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "algoDescription"));
    *(_DWORD *)buf = 138412290;
    v52 = v50;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "The Algorithm description is: %@", buf, 0xCu);

  }
  self->_freshInitRequested = objc_msgSend(v44, "freshInitNeeded");
  self->_initDone = 1;

}

- (void)algoRunnerFreshInitWithData:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  unsigned int v16;

  v4 = a3;
  if (-[BatteryAlgorithmsRunner featureFlagEn](self, "featureFlagEn"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner algorithmObject](self, "algorithmObject"));
    v6 = objc_msgSend(v5, "freshInitWithData:", v4);

    if (v6)
    {
      v7 = (void *)qword_100035228;
      if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner AlgorithmClassName](self, "AlgorithmClassName"));
        v13 = 138412546;
        v14 = v9;
        v15 = 1024;
        v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ failed to init: %d", (uint8_t *)&v13, 0x12u);

      }
      self->_initDone = 0;
    }
  }
  else
  {
    v10 = (void *)qword_100035228;
    if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner AlgorithmClassName](self, "AlgorithmClassName"));
      v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ algorithm disabled by Feature Flag, Skipping", (uint8_t *)&v13, 0xCu);

    }
  }

}

- (int)algoRunnerExecuteWithData:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner algorithmObject](self, "algorithmObject"));
  v6 = objc_msgSend(v5, "runWithData:", v4);

  return v6;
}

- (void)algoRunnerStoreOutput
{
  BatteryAlgorithmsRunner *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *i;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  BatteryAlgorithmsRunner *v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id obj;
  uint64_t v77;
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
  uint8_t v92[128];
  uint8_t v93[4];
  void *v94;
  __int16 v95;
  id v96;
  uint64_t v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  void *v106;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner algorithmObject](self, "algorithmObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "output"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("kCoreAnalyticsData")));

    if (v5)
    {
      v6 = (void *)qword_100035228;
      if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("kCoreAnalyticsData")));
        *(_DWORD *)buf = 138412290;
        v104 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Storing this to CA: %@", buf, 0xCu);

      }
      v9 = v4;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("kCoreAnalyticsData")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner eventCA](v2, "eventCA"));
      +[BIMetricRecorder sendToCoreAnalytics:forEvent:](BIMetricRecorder, "sendToCoreAnalytics:forEvent:", v10, v11);

      v4 = v9;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("kBDCOutputData")));

    if (v12)
    {
      v68 = v4;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("kBDCOutputData")));
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v14 = objc_msgSend(&off_10002F068, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
      if (v14)
      {
        v15 = v14;
        v74 = *(_QWORD *)v81;
        v69 = v13;
        v70 = v2;
        do
        {
          v16 = 0;
          v71 = v15;
          do
          {
            if (*(_QWORD *)v81 != v74)
              objc_enumerationMutation(&off_10002F068);
            v75 = v16;
            v17 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v16);
            v18 = qword_100035228;
            if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v104 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Looking for %@ in BDCOutputData", buf, 0xCu);
            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));
            v20 = objc_msgSend(v19, "containsObject:", v17);

            if ((v20 & 1) != 0)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", v17));
              v22 = qword_100035228;
              if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v104 = v17;
                v105 = 2112;
                v106 = v21;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Storing this to DB Table %@: %@", buf, 0x16u);
              }
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner AlgorithmClassName](v2, "AlgorithmClassName"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v23, v17));

              v25 = objc_opt_class(NSArray);
              if ((objc_opt_isKindOfClass(v21, v25) & 1) != 0)
              {
                v72 = v21;
                v73 = v24;
                if (objc_msgSend(v17, "isEqualToString:", CFSTR("SBC")))
                {
                  v26 = v21;
                  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                  v99 = 0u;
                  v100 = 0u;
                  v101 = 0u;
                  v102 = 0u;
                  v28 = v26;
                  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v99, buf, 16);
                  if (v29)
                  {
                    v30 = v29;
                    v31 = 0;
                    v32 = 0;
                    v33 = *(_QWORD *)v100;
                    do
                    {
                      v34 = 0;
                      v35 = v32;
                      do
                      {
                        if (*(_QWORD *)v100 != v33)
                          objc_enumerationMutation(v28);
                        v32 = *(id *)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)v34);

                        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)v34 + v31));
                        objc_msgSend(v27, "setObject:forKey:", v32, v36);

                        v34 = (char *)v34 + 1;
                        v35 = v32;
                      }
                      while (v30 != v34);
                      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v99, buf, 16);
                      v31 += (uint64_t)v34;
                    }
                    while (v30);

                  }
                  v37 = qword_100035228;
                  if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v104 = v27;
                    v105 = 2112;
                    v106 = v73;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Storing this Dictionary to PPS EPSQL %@: %@", buf, 0x16u);
                  }
                  v24 = v73;
                  +[BIMetricRecorder sendToPPS:forIdentifier:](BIMetricRecorder, "sendToPPS:forIdentifier:", v27, v73);

                  v13 = v69;
                  v2 = v70;
                  v15 = v71;
                  v21 = v72;
                }
                else
                {
                  v41 = v21;
                  v42 = v24;
                  v88 = 0u;
                  v89 = 0u;
                  v90 = 0u;
                  v91 = 0u;
                  obj = v41;
                  v78 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v88, buf, 16);
                  if (v78)
                  {
                    v77 = *(_QWORD *)v89;
                    do
                    {
                      v43 = 0;
                      do
                      {
                        if (*(_QWORD *)v89 != v77)
                          objc_enumerationMutation(obj);
                        v79 = v43;
                        v44 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v43);
                        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                        v84 = 0u;
                        v85 = 0u;
                        v86 = 0u;
                        v87 = 0u;
                        v46 = v44;
                        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v84, &v99, 16);
                        if (v47)
                        {
                          v48 = v47;
                          v49 = *(_QWORD *)v85;
                          do
                          {
                            for (i = 0; i != v48; i = (char *)i + 1)
                            {
                              if (*(_QWORD *)v85 != v49)
                                objc_enumerationMutation(v46);
                              v51 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
                              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKey:", v51));
                              v53 = objc_opt_class(NSArray);
                              if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0)
                              {
                                v97 = v51;
                                v98 = v52;
                                v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1));
                                v55 = qword_100035228;
                                if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)v93 = 138412546;
                                  v94 = v54;
                                  v95 = 2112;
                                  v96 = v42;
                                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Adding this Array to PPS EPSQL %@ : %@", v93, 0x16u);
                                }
                                +[BIMetricRecorder sendToPPS:forIdentifier:](BIMetricRecorder, "sendToPPS:forIdentifier:", v54, v42);

                              }
                              else
                              {
                                objc_msgSend(v45, "setObject:forKeyedSubscript:", v52, v51);
                              }

                            }
                            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v84, &v99, 16);
                          }
                          while (v48);
                        }

                        v56 = qword_100035228;
                        if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v93 = 138412546;
                          v94 = v45;
                          v95 = 2112;
                          v96 = v42;
                          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Storing this Dictionary to PPS EPSQL %@: %@", v93, 0x16u);
                        }
                        +[BIMetricRecorder sendToPPS:forIdentifier:](BIMetricRecorder, "sendToPPS:forIdentifier:", v45, v42);

                        v43 = v79 + 1;
                      }
                      while ((id)(v79 + 1) != v78);
                      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, buf, 16);
                    }
                    while (v78);
                  }

                  v13 = v69;
                  v2 = v70;
                  v15 = v71;
                  v21 = v72;
                  v24 = v73;
                }
              }

            }
            else
            {
              v38 = (void *)qword_100035228;
              if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
              {
                v39 = v38;
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));
                *(_DWORD *)buf = 138412546;
                v104 = v17;
                v105 = 2112;
                v106 = v40;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Did not find any data for %@. Keys passed in = %@", buf, 0x16u);

              }
            }
            v16 = v75 + 1;
          }
          while ((id)(v75 + 1) != v15);
          v15 = objc_msgSend(&off_10002F068, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
        }
        while (v15);
      }

      v4 = v68;
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("savedAlgoState")));

    if (v57)
    {
      v58 = (void *)qword_100035228;
      if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
      {
        v59 = v58;
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("savedAlgoState")));
        *(_DWORD *)buf = 138412290;
        v104 = v60;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Storing system state %@", buf, 0xCu);

      }
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("savedAlgoState")));
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner stateFilePath](v2, "stateFilePath"));
      sub_100017248(v61, v62);

    }
  }
  v63 = (void *)qword_100035228;
  if (os_log_type_enabled((os_log_t)qword_100035228, OS_LOG_TYPE_DEFAULT))
  {
    v64 = v63;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner runMetaData](v2, "runMetaData"));
    *(_DWORD *)buf = 138412290;
    v104 = v65;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Storing MetaData %@", buf, 0xCu);

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner runMetaData](v2, "runMetaData"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsRunner metaFilePath](v2, "metaFilePath"));
  sub_100017248(v66, v67);

}

- (BOOL)initDone
{
  return self->_initDone;
}

- (id)algorithmObject
{
  return self->_algorithmObject;
}

- (NSString)AlgorithmClassName
{
  return self->_AlgorithmClassName;
}

- (void)setAlgorithmClassName:(id)a3
{
  objc_storeStrong((id *)&self->_AlgorithmClassName, a3);
}

- (BOOL)featureFlagEn
{
  return self->_featureFlagEn;
}

- (void)setFeatureFlagEn:(BOOL)a3
{
  self->_featureFlagEn = a3;
}

- (BOOL)freshInitRequested
{
  return self->_freshInitRequested;
}

- (NSMutableDictionary)runMetaData
{
  return self->_runMetaData;
}

- (void)setRunMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_runMetaData, a3);
}

- (NSDictionary)algoStateData
{
  return self->_algoStateData;
}

- (NSString)metaFilePath
{
  return self->_metaFilePath;
}

- (NSString)stateFilePath
{
  return self->_stateFilePath;
}

- (NSString)eventCA
{
  return self->_eventCA;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCA, 0);
  objc_storeStrong((id *)&self->_stateFilePath, 0);
  objc_storeStrong((id *)&self->_metaFilePath, 0);
  objc_storeStrong((id *)&self->_algoStateData, 0);
  objc_storeStrong((id *)&self->_runMetaData, 0);
  objc_storeStrong((id *)&self->_AlgorithmClassName, 0);
  objc_storeStrong(&self->_algorithmObject, 0);
}

@end
