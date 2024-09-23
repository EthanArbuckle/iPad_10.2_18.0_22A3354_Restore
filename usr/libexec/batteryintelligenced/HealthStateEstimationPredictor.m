@implementation HealthStateEstimationPredictor

+ (id)sharedPredictor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009448;
  block[3] = &unk_10002C5E0;
  block[4] = a1;
  if (qword_100035210 != -1)
    dispatch_once(&qword_100035210, block);
  return (id)qword_100035208;
}

- (HealthStateEstimationPredictor)init
{
  void *v3;
  HealthStateEstimationPredictor *v4;
  char *v5;
  uint64_t v6;
  OS_os_log *logger;
  NSBundle *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HealthStateEstimationPredictor *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v32;
  objc_super v33;

  v3 = (void *)os_transaction_create("com.apple.batteryintelligenced.stateestimation.init", a2);
  v33.receiver = self;
  v33.super_class = (Class)HealthStateEstimationPredictor;
  v4 = -[HealthStateEstimationPredictor init](&v33, "init");
  if (v4)
  {
    v5 = sub_10001714C("stateestimationpredictor");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    logger = v4->_logger;
    v4->_logger = (OS_os_log *)v6;

    -[HealthStateEstimationPredictor setLogToPPS:](v4, "setLogToPPS:", 1);
    -[HealthStateEstimationPredictor setLogToCoreAnalytics:](v4, "setLogToCoreAnalytics:", 1);
    -[HealthStateEstimationPredictor setName:](v4, "setName:", CFSTR("state_estimation_model"));
    -[HealthStateEstimationPredictor setOutputFeatureType:](v4, "setOutputFeatureType:", 19);
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor name](v4, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathForResource:ofType:", v10, CFSTR("mlmodelc")));

    if (!v11)
    {
      v20 = v4->_logger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10001D3A4(v20);
      v19 = 0;
      goto LABEL_24;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v12, 0));

    if (!v13)
    {
      v21 = v4->_logger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_10001D424(v21);
      v19 = 0;
      goto LABEL_23;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metadata"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelDescription"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metadata"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", MLModelVersionStringKey));
      -[HealthStateEstimationPredictor setVersion:](v4, "setVersion:", v18);

    }
    else
    {
      v22 = v4->_logger;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10001D524(v22);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelDescription"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "predictedFeatureName"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelDescription"));
    v26 = v25;
    if (v24)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "predictedFeatureName"));
      v28 = objc_msgSend(v27, "copy");
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "outputDescriptionsByName"));

      if (!v29)
      {
        v32 = v4->_logger;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          sub_10001D4A4(v32);
        goto LABEL_22;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelDescription"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "outputDescriptionsByName"));
      v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allKeys"));
    }
    v30 = v28;
    -[HealthStateEstimationPredictor setPredictedFeatureNames:](v4, "setPredictedFeatureNames:", v28);

LABEL_22:
    v19 = v4;
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10001D360();
  v19 = 0;
LABEL_25:

  return v19;
}

- (void)predictAndRecordWithParams:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  float v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  NSObject *logger;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *k;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  uint8_t v78;
  char v79[15];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t v84;
  char v85[15];
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
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  id v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _QWORD v113[7];
  _QWORD v114[3];
  uint64_t v115;
  void *v116;
  _UNKNOWN **v117;
  _UNKNOWN **v118;

  v4 = a3;
  v73 = (void *)os_transaction_create("com.apple.batteryintelligenced.stateestimation.inference", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", -86400.0));
  objc_msgSend(&off_10002F500, "floatValue");
  v113[0] = CFSTR("PredictionDurationDays");
  v113[1] = CFSTR("HealthHistoryStartDate");
  v114[0] = &off_10002F530;
  v114[1] = v8;
  v70 = (void *)v8;
  v113[2] = CFSTR("HealthHistoryEndDate");
  v113[3] = CFSTR("UsageHistoryStartDate");
  v113[4] = CFSTR("UsageHistoryEndDate");
  v113[5] = CFSTR("MaxHealthHistoryLenDays");
  v71 = v7;
  v72 = v6;
  v114[2] = v6;
  v115 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", (float)((float)((float)(v9 / 365.0) * -31536000.0)
                                                                                               + 86400.0)));
  v69 = (void *)v115;
  v116 = v7;
  v117 = &off_10002F548;
  v113[6] = CFSTR("MaxUsageHistoryLenTimesteps");
  v118 = &off_10002F518;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v114, v113, 7));
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_10001D604();
  v68 = v10;
  if (v4)
  {
    v77 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v99 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKey:", v16));

          if (!v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v16));
            objc_msgSend(v77, "setObject:forKeyedSubscript:", v18, v16);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
      }
      while (v13);
    }

  }
  else
  {
    v77 = v10;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_10001D5A4();
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BISeqPredictorCommon sharedInstance](BISeqPredictorCommon, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor name](self, "name"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "runInferenceForModel:withParams:outputFeatureType:", v20, v77, 19));

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor predictedFeatureNames](self, "predictedFeatureNames"));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v95;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v95 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "featureValueForName:", v26));
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v105 = v26;
          v106 = 2112;
          v107 = v27;
          _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Output %@ shape: %@", buf, 0x16u);
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
    }
    while (v23);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[BISeqPredictorCommon sharedInstance](BISeqPredictorCommon, "sharedInstance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor name](self, "name"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "getOutputNamesAndDimensionsForModel:", v30));

  v75 = objc_alloc_init((Class)NSMutableDictionary);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "featureNames"));
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v91;
    do
    {
      for (k = 0; k != v33; k = (char *)k + 1)
      {
        if (*(_QWORD *)v91 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)k);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "featureValueForName:", v36));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "multiArrayValue"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKey:", v36));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[BITensor getValuesFrom3DMultiArray:withFeatureNamesForDimensions:](BITensor, "getValuesFrom3DMultiArray:withFeatureNamesForDimensions:", v38, v39));

        objc_msgSend(v75, "addEntriesFromDictionary:", v40);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
    }
    while (v33);
  }

  v41 = self->_logger;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor name](self, "name"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));
    *(_DWORD *)buf = 138412802;
    v105 = v43;
    v106 = 2112;
    v107 = v44;
    v108 = 2112;
    v109 = v75;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Model: %@ Days: %@ Predictions: %@\n", buf, 0x20u);

  }
  if (self->_logToPPS)
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v45 = v75;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
    if (v46)
    {
      v47 = v46;
      v48 = 0;
      v49 = *(_QWORD *)v87;
      do
      {
        v50 = 0;
        v51 = v48;
        do
        {
          if (*(_QWORD *)v87 != v49)
            objc_enumerationMutation(v45);
          v52 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)v50);
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", v52));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectAtIndex:", 0));
          v55 = self->_logger;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            sub_10001DDD8(&v84, v85, v55);
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor getPayloadForPPSWithParams:andFeatureValue:forModelOutput:](self, "getPayloadForPPSWithParams:andFeatureValue:forModelOutput:", v77, v54, v52));

          v56 = self->_logger;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v105 = v48;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "PPS data to log %@", buf, 0xCu);
          }
          +[BIMetricRecorder sendToPPS:forIdentifier:](BIMetricRecorder, "sendToPPS:forIdentifier:", v48, CFSTR("BatteryHealthDelta"));

          v50 = (char *)v50 + 1;
          v51 = v48;
        }
        while (v47 != v50);
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
      }
      while (v47);
    }
    else
    {
      v48 = 0;
    }

  }
  else
  {
    v48 = 0;
  }
  if (self->_logToCoreAnalytics)
  {
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v57 = v75;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v81;
      do
      {
        v61 = 0;
        v62 = v48;
        do
        {
          if (*(_QWORD *)v81 != v60)
            objc_enumerationMutation(v57);
          v63 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)v61);
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKey:", v63));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectAtIndex:", 0));
          v66 = self->_logger;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            sub_10001DDA4(&v78, v79, v66);
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor getPayloadForCoreAnalyticsWithParams:andModelPred:forModelOutput:](self, "getPayloadForCoreAnalyticsWithParams:andModelPred:forModelOutput:", v77, v65, v63));

          v67 = self->_logger;
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v105 = v48;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "CA data to log %@", buf, 0xCu);
          }
          +[BIMetricRecorder sendToCoreAnalytics:forEvent:](BIMetricRecorder, "sendToCoreAnalytics:forEvent:", v48, CFSTR("com.apple.bi.batteryhealthdelta_predictions"));

          v61 = (char *)v61 + 1;
          v62 = v48;
        }
        while (v59 != v61);
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
      }
      while (v59);
    }

  }
}

- (id)getPayloadForPPSWithParams:(id)a3 andFeatureValue:(id)a4 forModelOutput:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor version](self, "version"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("model_id"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor name](self, "name"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("model_name"));

  objc_msgSend(v9, "doubleValue");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("model_prediction"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("prediction_duration"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("prediction_output_name"));
  return v11;
}

- (id)getPayloadForCoreAnalyticsWithParams:(id)a3 andModelPred:(id)a4 forModelOutput:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  double v18;
  void *v19;
  NSObject *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *logger;
  uint64_t v28;
  uint64_t v29;
  int v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
      sub_10001DE0C(logger, v28, v29);
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("PredictionDurationDays")));

  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_10001D758();
LABEL_11:
    v26 = 0;
    goto LABEL_16;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = sub_100018210(v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    objc_msgSend(v9, "floatValue");
    v16 = v15;
    objc_msgSend(v14, "floatValue");
    *(float *)&v18 = v16 - v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
    v20 = self->_logger;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v31 = 138412802;
      v32 = v9;
      v33 = 2112;
      v34 = v14;
      v35 = 2112;
      v36 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Current state estimation error (t=0 days): predictedVal = %@, true currentVal = %@, error = %@", (uint8_t *)&v31, 0x20u);
    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("prediction_error"));
    objc_msgSend(v19, "doubleValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", fabs(v21)));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("prediction_error_absolute"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor version](self, "version"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("model_id"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HealthStateEstimationPredictor name](self, "name"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("model_name"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("prediction_duration"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("prediction_output_name"));
    v26 = v12;

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001DE44();
    v26 = 0;
  }

LABEL_16:
  return v26;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (int64_t)outputFeatureType
{
  return self->_outputFeatureType;
}

- (void)setOutputFeatureType:(int64_t)a3
{
  self->_outputFeatureType = a3;
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

- (BOOL)logToPPS
{
  return self->_logToPPS;
}

- (void)setLogToPPS:(BOOL)a3
{
  self->_logToPPS = a3;
}

- (BOOL)logToCoreAnalytics
{
  return self->_logToCoreAnalytics;
}

- (void)setLogToCoreAnalytics:(BOOL)a3
{
  self->_logToCoreAnalytics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_predictedFeatureNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
