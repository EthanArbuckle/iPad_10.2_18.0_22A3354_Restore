@implementation BISeqPredictorCommon

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000069C8;
  block[3] = &unk_10002C5E0;
  block[4] = a1;
  if (qword_1000351E8 != -1)
    dispatch_once(&qword_1000351E8, block);
  return (id)qword_1000351E0;
}

- (BISeqPredictorCommon)init
{
  id v2;
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BISeqPredictorCommon *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BISeqPredictorCommon;
  v2 = -[BISeqPredictorCommon init](&v18, "init");
  if (!v2)
  {
    v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9)
      sub_10001D844(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_8;
  }
  v3 = sub_10001714C("bimodelseqpredictorcommon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BIFeatures sharedInstance](BIFeatures, "sharedInstance"));
  objc_msgSend(v2, "setFeatureGen:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "featureGen"));
  if (!v7)
  {
    if (os_log_type_enabled(*((os_log_t *)v2 + 2), OS_LOG_TYPE_ERROR))
      sub_10001D878();
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = (BISeqPredictorCommon *)v2;
LABEL_9:

  return v8;
}

- (id)_copyFeaturesWithParams:(id)a3 modelName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *logger;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  const char *v16;
  id v17;
  id v18;
  _UNKNOWN **v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  int v29;
  void *v30;
  _BYTE v32[24];

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(&off_10002EFD8, "containsObject:", v8))
  {
    v17 = 0;
LABEL_39:
    v17 = v17;
    v30 = v17;
    goto LABEL_40;
  }
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "addEntriesFromDictionary:", v7);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    sub_10001D95C(logger);
  if (qword_1000351F0
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now")),
        objc_msgSend(v12, "timeIntervalSinceDate:", qword_1000351F0),
        v14 = v13,
        v12,
        v14 < 86400.0))
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UseCachedFeatures"));
    v15 = self->_logger;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)v32 = 0;
    v16 = "Using cached feature set";
  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("UseCachedFeatures"));
    v15 = self->_logger;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)v32 = 0;
    v16 = "Regenerating new feature set";
  }
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, v32, 2u);
LABEL_14:
  v18 = objc_alloc_init((Class)NSMutableDictionary);
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("nccp_wra_qmaxp_seq_model")) & 1) != 0)
  {
    v19 = &off_10002EFF0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("state_estimation_model")) & 1) != 0)
  {
    v19 = &off_10002F008;
LABEL_18:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BISeqPredictorCommon getInputNamesAndDimensionsForModel:](self, "getInputNamesAndDimensionsForModel:", v8, *(_QWORD *)v32));
    v21 = -[BIFeatures copyDailyHealthHistoryForFeatures:withFeatureDimensions:withParams:](self->_featureGen, "copyDailyHealthHistoryForFeatures:withFeatureDimensions:withParams:", v19, v20, v10);
    if (v21)
    {
      objc_msgSend(v18, "addEntriesFromDictionary:", v21);
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("nccp_wra_qmaxp_seq_model")) & 1) == 0
        && !objc_msgSend(v8, "isEqualToString:", CFSTR("state_estimation_model")))
      {
        goto LABEL_23;
      }
      v22 = -[BIFeatures copyUsageHistory:withFeatureDimensions:withParams:](self->_featureGen, "copyUsageHistory:withFeatureDimensions:withParams:", &off_10002F020, v20, v10);
      if (v22)
      {
        v23 = v22;
        objc_msgSend(v18, "addEntriesFromDictionary:", v22);

LABEL_23:
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UseCachedFeatures")));
        v25 = objc_msgSend(v24, "BOOLValue");

        if ((v25 & 1) == 0)
        {
          v26 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          v27 = (void *)qword_1000351F0;
          qword_1000351F0 = v26;

        }
        v28 = self->_logger;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v32 = 138412290;
          *(_QWORD *)&v32[4] = v18;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "ML model input dict: %@", v32, 0xCu);
        }
        v17 = objc_msgSend(v18, "copy");
        v29 = 0;
        goto LABEL_36;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001D8D0();
    }
    else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      sub_10001D8A4();
    }
    v17 = 0;
    v29 = 1;
LABEL_36:

    goto LABEL_37;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    sub_10001D8FC();
  v17 = 0;
  v29 = 1;
LABEL_37:

  if (!v29)
    goto LABEL_39;
  v30 = 0;
LABEL_40:

  return v30;
}

- (id)getInputNamesAndDimensionsForModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  const __CFString *v25;
  void *v26;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("qmaxp_seq_model")))
  {
    v25 = CFSTR("daily_history_input");
    v23[0] = &off_10002F3B0;
    v23[1] = &off_10002F3C8;
    v24[0] = CFSTR("qmaxpHistory");
    v24[1] = CFSTR("cycleCountHistory");
    v23[2] = &off_10002F3E0;
    v24[2] = CFSTR("ageHistory");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 3));
    v26 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("nccp_wra_qmaxp_seq_model")))
  {
    v21[0] = CFSTR("daily_history_input");
    v19[0] = &off_10002F3B0;
    v19[1] = &off_10002F3C8;
    v20[0] = CFSTR("nccpHistory");
    v20[1] = CFSTR("wraHistory");
    v19[2] = &off_10002F3E0;
    v19[3] = &off_10002F3F8;
    v20[2] = CFSTR("qmaxpHistory");
    v20[3] = CFSTR("cycleCountHistory");
    v19[4] = &off_10002F410;
    v19[5] = &off_10002F428;
    v20[4] = CFSTR("ageHistory");
    v20[5] = CFSTR("timeSinceLastReadingDays");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 6));
    v21[1] = CFSTR("usage_history_input");
    v22[0] = v5;
    v17[0] = &off_10002F3B0;
    v17[1] = &off_10002F3C8;
    v18[0] = CFSTR("voltageHistory");
    v18[1] = CFSTR("currentHistory");
    v17[2] = &off_10002F3E0;
    v17[3] = &off_10002F3F8;
    v18[2] = CFSTR("tempHistory");
    v18[3] = CFSTR("qHistory");
    v17[4] = &off_10002F410;
    v18[4] = CFSTR("timeSinceLastReadingMins");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 5));
    v22[1] = v7;
    v8 = v22;
    v9 = v21;
LABEL_7:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v9, 2));

    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("state_estimation_model")))
  {
    v15[0] = CFSTR("daily_history_input");
    v13[0] = &off_10002F3B0;
    v13[1] = &off_10002F3C8;
    v14[0] = CFSTR("cycleCountHistory");
    v14[1] = CFSTR("ageHistory");
    v13[2] = &off_10002F3E0;
    v14[2] = CFSTR("timeSinceLastReadingDays");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
    v15[1] = CFSTR("usage_history_input");
    v16[0] = v5;
    v11[0] = &off_10002F3B0;
    v11[1] = &off_10002F3C8;
    v12[0] = CFSTR("voltageHistory");
    v12[1] = CFSTR("currentHistory");
    v11[2] = &off_10002F3E0;
    v11[3] = &off_10002F3F8;
    v12[2] = CFSTR("tempHistory");
    v12[3] = CFSTR("qHistory");
    v11[4] = &off_10002F410;
    v12[4] = CFSTR("timeSinceLastReadingMins");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 5));
    v16[1] = v7;
    v8 = v16;
    v9 = v15;
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    sub_10001D9D8();
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)getOutputNamesAndDimensionsForModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  const __CFString *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[5];
  _QWORD v27[5];

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("nccp_wra_qmaxp_seq_model")))
  {
    v24[0] = &off_10002F3B0;
    v24[1] = &off_10002F3C8;
    v25[0] = CFSTR("q10_nccp_forecast");
    v25[1] = CFSTR("q10_wra_forecast");
    v24[2] = &off_10002F3E0;
    v25[2] = CFSTR("q10_qmaxp_forecast");
    v26[0] = CFSTR("nccp_wra_qmaxp_q10_forecast");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 3));
    v27[0] = v5;
    v26[1] = CFSTR("nccp_wra_qmaxp_q25_forecast");
    v22[0] = &off_10002F3B0;
    v22[1] = &off_10002F3C8;
    v23[0] = CFSTR("q25_nccp_forecast");
    v23[1] = CFSTR("q25_wra_forecast");
    v22[2] = &off_10002F3E0;
    v23[2] = CFSTR("q25_qmaxp_forecast");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));
    v27[1] = v6;
    v26[2] = CFSTR("nccp_wra_qmaxp_q50_forecast");
    v20[0] = &off_10002F3B0;
    v20[1] = &off_10002F3C8;
    v21[0] = CFSTR("q50_nccp_forecast");
    v21[1] = CFSTR("q50_wra_forecast");
    v20[2] = &off_10002F3E0;
    v21[2] = CFSTR("q50_qmaxp_forecast");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));
    v27[2] = v7;
    v26[3] = CFSTR("nccp_wra_qmaxp_q75_forecast");
    v18[0] = &off_10002F3B0;
    v18[1] = &off_10002F3C8;
    v19[0] = CFSTR("q75_nccp_forecast");
    v19[1] = CFSTR("q75_wra_forecast");
    v18[2] = &off_10002F3E0;
    v19[2] = CFSTR("q75_qmaxp_forecast");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
    v27[3] = v8;
    v26[4] = CFSTR("nccp_wra_qmaxp_q90_forecast");
    v16[0] = &off_10002F3B0;
    v16[1] = &off_10002F3C8;
    v17[0] = CFSTR("q90_nccp_forecast");
    v17[1] = CFSTR("q90_wra_forecast");
    v16[2] = &off_10002F3E0;
    v17[2] = CFSTR("q90_qmaxp_forecast");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));
    v27[4] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 5));

LABEL_5:
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("state_estimation_model")))
  {
    v12[0] = &off_10002F3B0;
    v12[1] = &off_10002F3C8;
    v13[0] = CFSTR("nccp");
    v13[1] = CFSTR("wra");
    v12[2] = &off_10002F3E0;
    v13[2] = CFSTR("qmaxp");
    v14 = CFSTR("health_state_estimation");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));
    v15 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    sub_10001D9D8();
  v10 = 0;
LABEL_9:

  return v10;
}

- (id)runInferenceForModel:(id)a3 withParams:(id)a4 outputFeatureType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *logger;
  NSObject *v11;
  void *v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *i;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *j;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _BOOL4 v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  unint64_t v60;
  id v61;
  id obj;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  id v76;
  id v77;
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;
  __int16 v82;
  void *v83;

  v8 = a3;
  v9 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v11 = logger;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PredictionDurationDays")));
    *(_DWORD *)buf = 138412546;
    v81 = v8;
    v82 = 2112;
    v83 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Running inference for model %@ for prediction duration = %@ days", buf, 0x16u);

  }
  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathForResource:ofType:", v8, CFSTR("mlmodelc")));

  v16 = objc_alloc_init((Class)MLModelConfiguration);
  objc_msgSend(v16, "setComputeUnits:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", v17, v16, 0));

  v77 = 0;
  v19 = -[BISeqPredictorCommon _copyFeaturesWithParams:modelName:error:](self, "_copyFeaturesWithParams:modelName:error:", v9, v8, &v77);
  v20 = v77;
  v21 = v20;
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001DA38();
    goto LABEL_9;
  }
  if (v20)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001DAF0();
LABEL_9:
    v22 = 0;
    goto LABEL_10;
  }
  v76 = 0;
  v24 = objc_msgSend(objc_alloc((Class)MLDictionaryFeatureProvider), "initWithDictionary:error:", v19, &v76);
  v25 = v76;
  v21 = v25;
  if (!v24)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001DA64();
    goto LABEL_9;
  }
  v60 = a5;
  v75 = v25;
  v26 = v24;
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "predictionFromFeatures:error:", v24, &v75));
  v61 = v75;

  v65 = v26;
  v66 = (void *)v27;
  if (v27)
  {
    v28 = v26;
    v54 = v19;
    v55 = v18;
    v56 = v16;
    v57 = v15;
    v58 = v9;
    v29 = objc_alloc_init((Class)NSMutableDictionary);
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[BISeqPredictorCommon getInputNamesAndDimensionsForModel:](self, "getInputNamesAndDimensionsForModel:", v8));
    v59 = v8;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[BISeqPredictorCommon getOutputNamesAndDimensionsForModel:](self, "getOutputNamesAndDimensionsForModel:", v8));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "featureNames"));
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v30)
    {
      v31 = v30;
      v32 = v28;
      v33 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v72 != v33)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
          v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("scalar_input"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "featureValueForName:", v35));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "multiArrayValue"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKey:", v35));
          if (v36)
            v40 = objc_claimAutoreleasedReturnValue(+[BITensor getValuesFrom2DMultiArray:withFeatureNamesForDimensions:](BITensor, "getValuesFrom2DMultiArray:withFeatureNamesForDimensions:", v38, v39));
          else
            v40 = objc_claimAutoreleasedReturnValue(+[BITensor getValuesFrom3DMultiArray:withFeatureNamesForDimensions:](BITensor, "getValuesFrom3DMultiArray:withFeatureNamesForDimensions:", v38, v39));
          v41 = (void *)v40;

          objc_msgSend(v29, "addEntriesFromDictionary:", v41);
          v32 = v65;
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      }
      while (v31);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "featureNames"));
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v44; j = (char *)j + 1)
        {
          if (*(_QWORD *)v68 != v45)
            objc_enumerationMutation(v42);
          v47 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)j);
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "featureValueForName:", v47));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "multiArrayValue"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKey:", v47));
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[BITensor getValuesFrom3DMultiArray:withFeatureNamesForDimensions:](BITensor, "getValuesFrom3DMultiArray:withFeatureNamesForDimensions:", v49, v50));

          objc_msgSend(v29, "addEntriesFromDictionary:", v51);
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
      }
      while (v44);
    }

    sub_100017388(v29, v60);
    v22 = v66;
    v52 = v66;

    v9 = v58;
    v8 = v59;
    v16 = v56;
    v15 = v57;
    v19 = v54;
    v18 = v55;
  }
  else
  {
    v53 = os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR);
    v22 = 0;
    if (v53)
      sub_10001DAC4();
  }

  v21 = v61;
LABEL_10:

  return v22;
}

- (BIFeatures)featureGen
{
  return self->_featureGen;
}

- (void)setFeatureGen:(id)a3
{
  objc_storeStrong((id *)&self->_featureGen, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_featureGen, 0);
}

@end
