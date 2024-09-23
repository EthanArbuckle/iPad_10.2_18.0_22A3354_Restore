@implementation TimeTo80Estimator

+ (id)sharedPredictor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007CD4;
  block[3] = &unk_10002C5E0;
  block[4] = a1;
  if (qword_100035200 != -1)
    dispatch_once(&qword_100035200, block);
  return (id)qword_1000351F8;
}

- (MLModel)tt80EstimatorModel
{
  MLModel *tt80EstimatorModel;
  void *v4;
  id v5;
  void *v6;
  MLModel *v7;
  MLModel *v8;
  MLModel *v9;
  NSObject *logger;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  tt80EstimatorModel = self->_tt80EstimatorModel;
  if (tt80EstimatorModel)
    goto LABEL_4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TimeTo80Estimator name](self, "name"));
  v5 = sub_100018924(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = (MLModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mlModel")));
    v8 = self->_tt80EstimatorModel;
    self->_tt80EstimatorModel = v7;

    tt80EstimatorModel = self->_tt80EstimatorModel;
LABEL_4:
    v9 = tt80EstimatorModel;
    return v9;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    sub_10001DB50(logger, v12, v13, v14, v15, v16, v17, v18);
  v9 = 0;
  return v9;
}

- (TimeTo80Estimator)init
{
  TimeTo80Estimator *v2;
  char *v3;
  uint64_t v4;
  OS_os_log *logger;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TimeTo80Estimator *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)TimeTo80Estimator;
  v2 = -[TimeTo80Estimator init](&v29, "init");
  if (v2)
  {
    v3 = sub_10001714C("TimeTo80Estimator");
    v4 = objc_claimAutoreleasedReturnValue(v3);
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v4;

    -[TimeTo80Estimator setName:](v2, "setName:", CFSTR("tt80_lstm_regression"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TimeTo80Estimator name](v2, "name"));
    v7 = sub_100018924(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version")));
      -[TimeTo80Estimator setVersion:](v2, "setVersion:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("predictedFeatureNames")));
      -[TimeTo80Estimator setPredictedFeatureNames:](v2, "setPredictedFeatureNames:", v10);

      v11 = v2;
    }
    else
    {
      v20 = v2->_logger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10001DB50(v20, v21, v22, v23, v24, v25, v26, v27);
      v11 = 0;
    }

  }
  else
  {
    v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12)
      sub_10001D844(v12, v13, v14, v15, v16, v17, v18, v19);
    v11 = 0;
  }

  return v11;
}

- (id)runInferenceAndGetPrediction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MLModel *tt80EstimatorModel;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TimeTo80Estimator tt80EstimatorModel](self, "tt80EstimatorModel"));
  v15 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "predictionFromFeatures:error:", v4, &v15));

  v7 = v15;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001DB80();
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TimeTo80Estimator predictedFeatureNames](self, "predictedFeatureNames"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "featureValueForName:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "multiArrayValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));

    tt80EstimatorModel = self->_tt80EstimatorModel;
    self->_tt80EstimatorModel = 0;

  }
  return v8;
}

- (void)predictAndRecordWithParams:(id)a3
{
  id v4;
  NSObject *logger;
  void *v6;
  unsigned int v7;
  _UNKNOWN **v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t Data;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  CFMutableDictionaryRef v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
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
  void *v55;
  void *i;
  char *v57;
  void *v58;
  void *v59;
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
  id v75;
  TimeTo80Estimator *v76;
  OS_os_log *v77;
  id v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
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
  void *v110;
  NSObject *log;
  NSObject *loga;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  _UNKNOWN **v120;
  void *v121;
  TimeTo80Estimator *v122;
  void *v123;
  void *v124;
  unsigned int v125;
  void *v126;
  id obj;
  id obja;
  id objb;
  uint64_t v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  id v145;
  id v146;
  _QWORD v147[3];
  _QWORD v148[3];
  _QWORD v149[3];
  _QWORD v150[3];
  _QWORD v151[3];
  _QWORD v152[3];
  _QWORD v153[3];
  _QWORD v154[3];
  _QWORD v155[3];
  _QWORD v156[3];
  uint8_t buf[4];
  id v158;
  __int16 v159;
  void *v160;
  __int16 v161;
  void *v162;
  __int16 v163;
  void *v164;
  __int16 v165;
  void *v166;
  const __CFString *v167;
  id v168;
  _QWORD v169[3];
  _QWORD v170[3];
  _QWORD v171[3];
  _QWORD v172[3];
  _QWORD v173[3];
  _BYTE v174[128];
  _QWORD v175[3];
  _QWORD v176[3];
  _QWORD v177[3];
  _QWORD v178[3];
  _QWORD v179[3];
  _QWORD v180[3];

  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v158 = v4;
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_INFO, "Additional params for TT80 inference: %@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("minTimeSteps"));

  if (v7)
    v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minTimeSteps")));
  else
    v8 = &off_10002F458;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v10 = objc_msgSend(v9, "containsObject:", CFSTR("takeLatestSMCValuesInFeatures"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("takeLatestSMCValuesInFeatures")));
    v10 = objc_msgSend(v11, "BOOLValue");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v13 = objc_msgSend(v12, "containsObject:", CFSTR("postInternalNotification"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postInternalNotification")));
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(subsystem == 'BatteryDataCollection' AND category == 'BDC_SBC')")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F038));
  v18 = objc_msgSend(objc_alloc((Class)PPSTimeSeriesRequest), "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:readDirection:", v17, v16, 0, objc_msgSend(&off_10002F440, "unsignedIntValue"), 0, 1);
  v19 = v18;
  if (v18)
  {
    v125 = v15;
    v146 = 0;
    Data = PerfPowerServicesGetData(v18, &v146);
    v21 = (void *)objc_claimAutoreleasedReturnValue(Data);
    v22 = v146;
    if (v22)
    {
      v23 = v22;
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001DD44();

      goto LABEL_58;
    }
    v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v21, "count")));
    v32 = self->_logger;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v158 = v126;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Received %@ rows", buf, 0xCu);
    }
    v33 = self->_logger;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      sub_10001DCA4(v33, v21);
    v34 = v126;
    if (objc_msgSend(v126, "compare:", v8) == (id)-1)
    {
      v38 = self->_logger;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        sub_10001DC10(v38, v126);
      v39 = 0;
      goto LABEL_57;
    }
    v35 = sub_1000174D8();
    v123 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v124 = v21;
    if (!v123)
      v10 = 0;
    v117 = v19;
    if (v10 == 1)
    {
      if (!objc_msgSend(v126, "isEqualToNumber:", &off_10002F440))
      {
        v37 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v126, "intValue") + 1));
        goto LABEL_33;
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
      objc_msgSend(v21, "removeEvent:", v36);

    }
    v37 = v126;
LABEL_33:
    v40 = v37;
    v122 = self;
    v118 = v17;
    v119 = v16;
    v120 = v8;
    v180[0] = &off_10002F470;
    v180[1] = v37;
    v180[2] = &off_10002F488;
    v145 = 0;
    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v180, 3));
    v133 = objc_msgSend(objc_alloc((Class)MLMultiArray), "initWithShape:dataType:error:", v116, 65568, &v145);
    v113 = v145;
    if (v10)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKey:", CFSTR("CurrentCapacity")));
      v179[0] = &off_10002F4A0;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v40, "integerValue") - 1));
      v179[1] = v42;
      v179[2] = &off_10002F4A0;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v179, 3));
      objc_msgSend(v133, "setObject:forKeyedSubscript:", v41, v43);

      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKey:", CFSTR("Voltage")));
      v178[0] = &off_10002F4A0;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v40, "integerValue") - 1));
      v178[1] = v45;
      v178[2] = &off_10002F470;
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v178, 3));
      objc_msgSend(v133, "setObject:forKeyedSubscript:", v44, v46);

      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKey:", CFSTR("Temperature")));
      v177[0] = &off_10002F4A0;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v40, "integerValue") - 1));
      v177[1] = v48;
      v177[2] = &off_10002F4B8;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v177, 3));
      objc_msgSend(v133, "setObject:forKeyedSubscript:", v47, v49);

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKey:", CFSTR("Amperage")));
      v176[0] = &off_10002F4A0;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v40, "integerValue") - 1));
      v176[1] = v51;
      v176[2] = &off_10002F4D0;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v176, 3));
      objc_msgSend(v133, "setObject:forKeyedSubscript:", v50, v52);

      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKey:", CFSTR("IsCharging")));
      v175[0] = &off_10002F4A0;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v40, "integerValue") - 1));
      v175[1] = v54;
      v175[2] = &off_10002F4E8;
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v175, 3));
      objc_msgSend(v133, "setObject:forKeyedSubscript:", v53, v55);

    }
    v121 = v40;
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    obj = v21;
    v134 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v174, 16);
    if (v134)
    {
      v137 = 0;
      v130 = *(_QWORD *)v142;
      do
      {
        for (i = 0; i != v134; i = (char *)i + 1)
        {
          v57 = (char *)i + v137;
          if (*(_QWORD *)v142 != v130)
            objc_enumerationMutation(obj);
          v58 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)i);
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "metricValueForKey:", CFSTR("CurrentCapacity")));
          v173[0] = &off_10002F4A0;
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v57));
          v173[1] = v60;
          v173[2] = &off_10002F4A0;
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v173, 3));
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v59, v61);

          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "metricValueForKey:", CFSTR("Voltage")));
          v172[0] = &off_10002F4A0;
          v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v57));
          v172[1] = v63;
          v172[2] = &off_10002F470;
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v172, 3));
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v62, v64);

          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "metricValueForKey:", CFSTR("Temperature")));
          v171[0] = &off_10002F4A0;
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v57));
          v171[1] = v66;
          v171[2] = &off_10002F4B8;
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v171, 3));
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v65, v67);

          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "metricValueForKey:", CFSTR("Amperage")));
          v170[0] = &off_10002F4A0;
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v57));
          v170[1] = v69;
          v170[2] = &off_10002F4D0;
          v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v170, 3));
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v68, v70);

          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "metricValueForKey:", CFSTR("IsCharging")));
          v169[0] = &off_10002F4A0;
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v57));
          v169[1] = v72;
          v169[2] = &off_10002F4E8;
          v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v169, 3));
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v71, v73);

        }
        v134 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v174, 16);
        v137 += (uint64_t)i;
      }
      while (v134);
    }

    v167 = CFSTR("sbc_in");
    v168 = v133;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1));
    v140 = v113;
    v75 = objc_msgSend(objc_alloc((Class)MLDictionaryFeatureProvider), "initWithDictionary:error:", v74, &v140);
    v39 = v140;

    v76 = v122;
    v77 = v122->_logger;
    if (v75)
    {
      v78 = v39;
      v8 = v120;
      if (os_log_type_enabled((os_log_t)v122->_logger, OS_LOG_TYPE_DEBUG))
      {
        v156[0] = &off_10002F4A0;
        log = v77;
        obja = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v121, "integerValue") - 2));
        v156[1] = obja;
        v156[2] = &off_10002F4A0;
        v138 = v74;
        v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v156, 3));
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", v114));
        v155[0] = &off_10002F4A0;
        v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v121, "integerValue") - 2));
        v155[1] = v109;
        v155[2] = &off_10002F470;
        v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v155, 3));
        v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", v107));
        v154[0] = &off_10002F4A0;
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v121, "integerValue") - 2));
        v154[1] = v105;
        v154[2] = &off_10002F4B8;
        v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v154, 3));
        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", v103));
        v153[0] = &off_10002F4A0;
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v121, "integerValue") - 2));
        v153[1] = v101;
        v153[2] = &off_10002F4D0;
        v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v153, 3));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", v99));
        v152[0] = &off_10002F4A0;
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v121, "integerValue") - 2));
        v152[1] = v90;
        v152[2] = &off_10002F4E8;
        v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v152, 3));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", v91));
        *(_DWORD *)buf = 138413314;
        v158 = v135;
        v159 = 2112;
        v160 = v131;
        v161 = 2112;
        v162 = v97;
        v163 = 2112;
        v164 = v89;
        v165 = 2112;
        v166 = v92;
        _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "second last row for TT80 features: [%@ %@ %@ %@ %@]", buf, 0x34u);

        v74 = v138;
        v76 = v122;

      }
      v79 = v76->_logger;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        v151[0] = &off_10002F4A0;
        loga = v79;
        objb = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v121, "integerValue") - 1));
        v151[1] = objb;
        v151[2] = &off_10002F4A0;
        v139 = v74;
        v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v151, 3));
        v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", v115));
        v150[0] = &off_10002F4A0;
        v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v121, "integerValue") - 1));
        v150[1] = v110;
        v150[2] = &off_10002F470;
        v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v150, 3));
        v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", v108));
        v149[0] = &off_10002F4A0;
        v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v121, "integerValue") - 1));
        v149[1] = v106;
        v149[2] = &off_10002F4B8;
        v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v149, 3));
        v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", v104));
        v148[0] = &off_10002F4A0;
        v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v121, "integerValue") - 1));
        v148[1] = v102;
        v148[2] = &off_10002F4D0;
        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v148, 3));
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", v100));
        v147[0] = &off_10002F4A0;
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v121, "integerValue") - 1));
        v147[1] = v94;
        v147[2] = &off_10002F4E8;
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v147, 3));
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "objectForKeyedSubscript:", v95));
        *(_DWORD *)buf = 138413314;
        v158 = v136;
        v159 = 2112;
        v160 = v132;
        v161 = 2112;
        v162 = v98;
        v163 = 2112;
        v164 = v93;
        v165 = 2112;
        v166 = v96;
        _os_log_debug_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEBUG, "Latest values for TT80 features: [%@ %@ %@ %@ %@]", buf, 0x34u);

        v74 = v139;
        v76 = v122;

      }
      v80 = v76->_logger;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        v81 = v80;
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[TimeTo80Estimator name](v76, "name"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[TimeTo80Estimator version](v76, "version"));
        *(_DWORD *)buf = 138412546;
        v158 = v82;
        v159 = 2112;
        v160 = v83;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "Predicting TT80 using model %@ and version %@", buf, 0x16u);

      }
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[TimeTo80Estimator runInferenceAndGetPrediction:](v76, "runInferenceAndGetPrediction:", v75));
      v85 = v76->_logger;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v158 = v84;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "TT80 prediction: %@", buf, 0xCu);
      }
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[TimeTo80Estimator getPayloadForPPSWithParams:andPredictionValue:](v76, "getPayloadForPPSWithParams:andPredictionValue:", 0, v84));
      +[BIMetricRecorder sendToPPS:forIdentifier:](BIMetricRecorder, "sendToPPS:forIdentifier:", v86, CFSTR("TimeTo80"));
      if (v125)
      {
        v87 = (void *)objc_claimAutoreleasedReturnValue(+[BatteryIntelligenceNotificationManager sharedInstance](BatteryIntelligenceNotificationManager, "sharedInstance"));
        objc_msgSend(v84, "doubleValue");
        objc_msgSend(v87, "postTT80NotificationWithDuration:", v88 * 3600.0);

      }
      v39 = v78;
    }
    else
    {
      v8 = v120;
      if (os_log_type_enabled((os_log_t)v122->_logger, OS_LOG_TYPE_ERROR))
        sub_10001DA64();
    }

    v17 = v118;
    v16 = v119;
    v19 = v117;
    v21 = v124;
    v34 = v126;
LABEL_57:

    goto LABEL_58;
  }
  v24 = self->_logger;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    sub_10001DBE0(v24, v25, v26, v27, v28, v29, v30, v31);
LABEL_58:

}

- (id)getPayloadForPPSWithParams:(id)a3 andPredictionValue:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSNumber *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TimeTo80Estimator version](self, "version"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("model_id"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TimeTo80Estimator name](self, "name"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("model_name"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("model_prediction"));
  v9 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_1000176E4());
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("start_soc"));

  return v6;
}

- (void)setTt80EstimatorModel:(id)a3
{
  objc_storeStrong((id *)&self->_tt80EstimatorModel, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)predictedFeatureNames
{
  return self->_predictedFeatureNames;
}

- (void)setPredictedFeatureNames:(id)a3
{
  objc_storeStrong((id *)&self->_predictedFeatureNames, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_predictedFeatureNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_tt80EstimatorModel, 0);
}

@end
