@implementation CombinedHealthSequencePredictor

+ (id)sharedPredictor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004F98;
  block[3] = &unk_10002C5E0;
  block[4] = a1;
  if (qword_1000351D8 != -1)
    dispatch_once(&qword_1000351D8, block);
  return (id)qword_1000351D0;
}

- (CombinedHealthSequencePredictor)init
{
  void *v3;
  CombinedHealthSequencePredictor *v4;
  char *v5;
  uint64_t v6;
  OS_os_log *logger;
  NSBundle *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CombinedHealthSequencePredictor *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v33;
  objc_super v34;

  v3 = (void *)os_transaction_create("com.apple.batteryintelligenced.bhf.init", a2);
  v34.receiver = self;
  v34.super_class = (Class)CombinedHealthSequencePredictor;
  v4 = -[CombinedHealthSequencePredictor init](&v34, "init");
  if (v4)
  {
    v5 = sub_10001714C("combinedseqpredictor");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    logger = v4->_logger;
    v4->_logger = (OS_os_log *)v6;

    -[CombinedHealthSequencePredictor setLogToPPS:](v4, "setLogToPPS:", 1);
    -[CombinedHealthSequencePredictor setLogToCoreAnalytics:](v4, "setLogToCoreAnalytics:", 1);
    -[CombinedHealthSequencePredictor setName:](v4, "setName:", CFSTR("nccp_wra_qmaxp_seq_model"));
    -[CombinedHealthSequencePredictor setOutputFeatureType:](v4, "setOutputFeatureType:", 18);
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor name](v4, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathForResource:ofType:", v10, CFSTR("mlmodelc")));

    if (!v11)
    {
      v21 = v4->_logger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_10001D3A4(v21);
      v20 = 0;
      goto LABEL_24;
    }
    v12 = objc_alloc_init((Class)MLModelConfiguration);
    objc_msgSend(v12, "setComputeUnits:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", v13, v12, 0));

    if (!v14)
    {
      v22 = v4->_logger;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10001D424(v22);
      v20 = 0;
      goto LABEL_23;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modelDescription"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "metadata"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modelDescription"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "metadata"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", MLModelVersionStringKey));
      -[CombinedHealthSequencePredictor setVersion:](v4, "setVersion:", v19);

    }
    else
    {
      v23 = v4->_logger;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10001D524(v23);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modelDescription"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "predictedFeatureName"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modelDescription"));
    v27 = v26;
    if (v25)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "predictedFeatureName"));
      v29 = objc_msgSend(v28, "copy");
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "outputDescriptionsByName"));

      if (!v30)
      {
        v33 = v4->_logger;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_10001D4A4(v33);
        goto LABEL_22;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modelDescription"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "outputDescriptionsByName"));
      v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allKeys"));
    }
    v31 = v29;
    -[CombinedHealthSequencePredictor setPredictedFeatureNames:](v4, "setPredictedFeatureNames:", v29);

LABEL_22:
    v20 = v4;
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10001D360();
  v20 = 0;
LABEL_25:

  return v20;
}

- (id)parseModelOutputName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", 1, 2));
  v5 = objc_msgSend(v4, "intValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 1));
  v11[0] = CFSTR("health_metric");
  v11[1] = CFSTR("quantile");
  v12[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));

  return v9;
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
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  NSObject *logger;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *k;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *m;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  unsigned int v67;
  void *v68;
  unint64_t v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  id v88;
  id v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
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
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  uint8_t v122[128];
  uint8_t buf[4];
  uint64_t v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  id v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _QWORD v132[7];
  _QWORD v133[3];
  uint64_t v134;
  void *v135;
  _UNKNOWN **v136;
  _UNKNOWN **v137;

  v4 = a3;
  v81 = (void *)os_transaction_create("com.apple.batteryintelligenced.bhf.inference", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", -86400.0));
  objc_msgSend(&off_10002F1D0, "floatValue");
  v132[0] = CFSTR("PredictionDurationDays");
  v132[1] = CFSTR("HealthHistoryStartDate");
  v133[0] = &off_10002EFA8;
  v133[1] = v8;
  v78 = (void *)v8;
  v132[2] = CFSTR("HealthHistoryEndDate");
  v132[3] = CFSTR("UsageHistoryStartDate");
  v132[4] = CFSTR("UsageHistoryEndDate");
  v132[5] = CFSTR("MaxHealthHistoryLenDays");
  v79 = v7;
  v80 = v6;
  v133[2] = v6;
  v134 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", (float)((float)((float)(v9 / 365.0) * -31536000.0)
                                                                                               + 86400.0)));
  v77 = (void *)v134;
  v135 = v7;
  v136 = &off_10002F200;
  v132[6] = CFSTR("MaxUsageHistoryLenTimesteps");
  v137 = &off_10002F1E8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v133, v132, 7));
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_10001D604();
  v76 = v10;
  if (v4)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v116, v131, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v117 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v17));

          if (!v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v17));
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v17);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v116, v131, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = v10;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_10001D5A4();
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BISeqPredictorCommon sharedInstance](BISeqPredictorCommon, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor name](self, "name"));
  v95 = v11;
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "runInferenceForModel:withParams:outputFeatureType:", v21, v11, 18));

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor predictedFeatureNames](self, "predictedFeatureNames"));
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v112, v130, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v113;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v113 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)j);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "featureValueForName:", v27));
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v124 = (uint64_t)v27;
          v125 = 2112;
          v126 = v28;
          _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Output %@ shape: %@", buf, 0x16u);
        }

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v112, v130, 16);
    }
    while (v24);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[BISeqPredictorCommon sharedInstance](BISeqPredictorCommon, "sharedInstance"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor name](self, "name"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "getOutputNamesAndDimensionsForModel:", v31));

  v88 = objc_alloc_init((Class)NSMutableDictionary);
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "featureNames"));
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v108, v129, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v109;
    do
    {
      for (k = 0; k != v34; k = (char *)k + 1)
      {
        if (*(_QWORD *)v109 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)k);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "featureValueForName:", v37));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "multiArrayValue"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKey:", v37));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[BITensor getValuesFrom3DMultiArray:withFeatureNamesForDimensions:](BITensor, "getValuesFrom3DMultiArray:withFeatureNamesForDimensions:", v39, v40));

        objc_msgSend(v88, "addEntriesFromDictionary:", v41);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v108, v129, 16);
    }
    while (v34);
  }

  v42 = self->_logger;
  v43 = v95;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v44 = v42;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor name](self, "name"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));
    *(_DWORD *)buf = 138412802;
    v124 = (uint64_t)v45;
    v125 = 2112;
    v126 = v46;
    v127 = 2112;
    v128 = v88;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Model: %@ Days: %@ Predictions: %@\n", buf, 0x20u);

  }
  if (self->_logToPPS
    && (v106 = 0u,
        v107 = 0u,
        v104 = 0u,
        v105 = 0u,
        (v83 = objc_msgSend(&off_10002EFC0, "countByEnumeratingWithState:objects:count:", &v104, v122, 16)) != 0))
  {
    v47 = 0;
    v82 = *(_QWORD *)v105;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v105 != v82)
          objc_enumerationMutation(&off_10002EFC0);
        v85 = v48;
        v93 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v48);
        v100 = 0u;
        v101 = 0u;
        v102 = 0u;
        v103 = 0u;
        v89 = objc_msgSend(&off_10002EF90, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
        if (v89)
        {
          v87 = *(_QWORD *)v101;
          do
          {
            for (m = 0; m != v89; m = (char *)m + 1)
            {
              if (*(_QWORD *)v101 != v87)
                objc_enumerationMutation(&off_10002EF90);
              v91 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)m);
              v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("q%@_%@_forecast"), v93, v91, v76));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKey:", v50));
              if (objc_msgSend(v51, "count"))
              {
                v52 = 0;
                v53 = v47;
                do
                {
                  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));
                  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndex:", v52));

                  v56 = self->_logger;
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412802;
                    v124 = (uint64_t)v93;
                    v125 = 2112;
                    v126 = v91;
                    v127 = 2112;
                    v128 = v55;
                    _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "Logging PPS data for Q=%@ %@ prediction at t=%@ days.", buf, 0x20u);
                  }
                  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v43));
                  objc_msgSend(v57, "setObject:forKeyedSubscript:", v55, CFSTR("PredictionDurationDays"));
                  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectAtIndex:", v52));
                  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor getPayloadForPPSWithParams:andFeatureValue:forModelOutput:](self, "getPayloadForPPSWithParams:andFeatureValue:forModelOutput:", v57, v58, v50));

                  v59 = self->_logger;
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v124 = (uint64_t)v47;
                    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "PPS data to log %@", buf, 0xCu);
                  }
                  +[BIMetricRecorder sendToPPS:forIdentifier:](BIMetricRecorder, "sendToPPS:forIdentifier:", v47, CFSTR("BatteryHealthDelta"));

                  ++v52;
                  v53 = v47;
                  v43 = v95;
                }
                while ((unint64_t)objc_msgSend(v51, "count") > v52);
              }

            }
            v89 = objc_msgSend(&off_10002EF90, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
          }
          while (v89);
        }
        v48 = v85 + 1;
      }
      while ((id)(v85 + 1) != v83);
      v83 = objc_msgSend(&off_10002EFC0, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
    }
    while (v83);
  }
  else
  {
    v47 = 0;
  }
  if (self->_logToCoreAnalytics)
  {
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v60 = v88;
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v96, v120, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v97;
      v92 = v60;
      v90 = *(_QWORD *)v97;
      do
      {
        v64 = 0;
        v94 = v62;
        do
        {
          if (*(_QWORD *)v97 != v63)
            objc_enumerationMutation(v60);
          v65 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)v64);
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "substringWithRange:", 1, 2));
          v67 = objc_msgSend(v66, "intValue");

          if (v67 == 50)
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKey:", v65));
            if (objc_msgSend(v68, "count"))
            {
              v69 = 0;
              do
              {
                v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectAtIndex:", v69));

                v72 = self->_logger;
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v124 = (uint64_t)v71;
                  _os_log_debug_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Searching for past prediction at t=%@ days for CA logging.", buf, 0xCu);
                }
                v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v43));
                objc_msgSend(v73, "setObject:forKeyedSubscript:", v71, CFSTR("PredictionDurationDays"));
                v74 = objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor getPayloadForCoreAnalyticsWithParams:forModelOutput:](self, "getPayloadForCoreAnalyticsWithParams:forModelOutput:", v73, v65));

                v75 = self->_logger;
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v124 = v74;
                  _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "CA data to log %@", buf, 0xCu);
                }
                +[BIMetricRecorder sendToCoreAnalytics:forEvent:](BIMetricRecorder, "sendToCoreAnalytics:forEvent:", v74, CFSTR("com.apple.bi.batteryhealthdelta_predictions"));

                ++v69;
                v47 = (void *)v74;
                v43 = v95;
              }
              while ((unint64_t)objc_msgSend(v68, "count") > v69);
            }
            else
            {
              v74 = (uint64_t)v47;
            }

            v47 = (void *)v74;
            v60 = v92;
            v62 = v94;
            v63 = v90;
          }
          v64 = (char *)v64 + 1;
        }
        while (v64 != v62);
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v96, v120, 16);
      }
      while (v62);
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
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor version](self, "version"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("model_id"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor name](self, "name"));
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

- (id)getPastBatteryHealthModelPredictionsWithParams:(id)a3 forPredictionOutputName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *logger;
  id v18;
  NSObject *v19;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", (double)(int)(-86400 * objc_msgSend(v9, "intValue"))));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", -86400.0));
  v12 = v10;
  v13 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor name](self, "name"));
  v15 = sub_10000BD58(v14, v13, (uint64_t)v9, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16 && objc_msgSend(v16, "count"))
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    {
      v21 = logger;
      v22 = 134218498;
      v23 = objc_msgSend(v16, "count");
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Found %lu past predictions logged to PPS from %@ to %@", (uint8_t *)&v22, 0x20u);

    }
    v18 = v16;
  }
  else
  {
    v19 = self->_logger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10001D664(v19, self, (uint64_t)v12);
    v18 = 0;
  }

  return v18;
}

- (id)getPayloadForCoreAnalyticsWithParams:(id)a3 forModelOutput:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  double v22;
  void *v23;
  NSObject *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *logger;
  NSObject *v32;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
      sub_10001D718(logger);
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("PredictionDurationDays")));

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_10001D758();
LABEL_14:
    v30 = 0;
    goto LABEL_21;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor getPastBatteryHealthModelPredictionsWithParams:forPredictionOutputName:](self, "getPastBatteryHealthModelPredictionsWithParams:forPredictionOutputName:", v6, v7));
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", CFSTR("model_prediction")));

    v14 = self->_logger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v34 = v14;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));
      *(_DWORD *)buf = 138413058;
      v40 = v35;
      v41 = 2048;
      v42 = objc_msgSend(v11, "count");
      v43 = 2112;
      v44 = v11;
      v45 = 2112;
      v46 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "For lookback days = %@, found %lu past model predictions: %@. \n Using first model prediction: %@.", buf, 0x2Au);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor parseModelOutputName:](self, "parseModelOutputName:", v7));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("health_metric")));
    v17 = sub_100018210(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (v18)
    {
      v38 = v13;
      objc_msgSend(v13, "floatValue");
      v20 = v19;
      objc_msgSend(v18, "floatValue");
      *(float *)&v22 = v20 - v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
      v24 = self->_logger;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v36 = v24;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));
        *(_DWORD *)buf = 138413058;
        v40 = v37;
        v41 = 2112;
        v42 = v38;
        v43 = 2112;
        v44 = v18;
        v45 = 2112;
        v46 = v23;
        _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Lookback days = %@, predictedVal = %@, true currentVal = %@, error = %@", buf, 0x2Au);

      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("prediction_error"), v37);
      objc_msgSend(v23, "doubleValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", fabs(v25)));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("prediction_error_absolute"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor version](self, "version"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("model_id"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CombinedHealthSequencePredictor name](self, "name"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("model_name"));

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, CFSTR("prediction_duration"));

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("prediction_output_name"));
      v30 = v9;

      v13 = v38;
    }
    else
    {
      v32 = self->_logger;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10001D7B8(v32, v15);
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

LABEL_21:
  return v30;
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
