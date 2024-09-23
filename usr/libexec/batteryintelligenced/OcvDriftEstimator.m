@implementation OcvDriftEstimator

+ (id)sharedPredictor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001625C;
  block[3] = &unk_10002C5E0;
  block[4] = a1;
  if (qword_100035290 != -1)
    dispatch_once(&qword_100035290, block);
  return (id)qword_100035288;
}

- (OcvDriftEstimator)init
{
  void *v3;
  OcvDriftEstimator *v4;
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
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  OcvDriftEstimator *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  objc_super v40;

  v3 = (void *)os_transaction_create("com.apple.batteryintelligenced.ocvdrift.init", a2);
  v40.receiver = self;
  v40.super_class = (Class)OcvDriftEstimator;
  v4 = -[OcvDriftEstimator init](&v40, "init");
  if (v4)
  {
    v5 = sub_10001714C("ocv-drift-predictor");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    logger = v4->_logger;
    v4->_logger = (OS_os_log *)v6;

    -[OcvDriftEstimator setLogToCoreAnalytics:](v4, "setLogToCoreAnalytics:", 0);
    -[OcvDriftEstimator setLogToPPS:](v4, "setLogToPPS:", 0);
    -[OcvDriftEstimator setName:](v4, "setName:", CFSTR("ocv_drift_model"));
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OcvDriftEstimator name](v4, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathForResource:ofType:", v10, CFSTR("mlmodelc")));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v12, 0));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelDescription"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metadata"));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelDescription"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metadata"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", MLModelVersionStringKey));
          -[OcvDriftEstimator setVersion:](v4, "setVersion:", v18);

        }
        else
        {
          v30 = v4->_logger;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            sub_10001D524(v30);
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelDescription"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "predictedFeatureName"));

        if (v32)
        {
          v33 = objc_alloc((Class)NSArray);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelDescription"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "predictedFeatureName"));
          v36 = objc_msgSend(v35, "copy");
          v37 = objc_msgSend(v33, "initWithObjects:", v36, 0);
          -[OcvDriftEstimator setPredictedFeatureNames:](v4, "setPredictedFeatureNames:", v37);

        }
        else
        {
          v38 = v4->_logger;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            sub_10001D4A4(v38);
        }
        v27 = v4;
      }
      else
      {
        v29 = v4->_logger;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_10001D424(v29);
        v27 = 0;
      }

    }
    else
    {
      v28 = v4->_logger;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_10001D3A4(v28);
      v27 = 0;
    }

  }
  else
  {
    v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v19)
      sub_10001D844(v19, v20, v21, v22, v23, v24, v25, v26);
    v27 = 0;
  }

  return v27;
}

- (id)_copyFeatures
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  double v12;
  unsigned int v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *logger;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v43;
  id v44;
  id v45;
  const __CFString *v46;
  id v47;
  void *v48;
  _UNKNOWN **v49;
  _QWORD v50[7];

  v3 = sub_10001775C();
  v4 = sub_100017718();
  v5 = sub_100017564();
  v6 = sub_100017960();
  v7 = sub_100017A10();
  v8 = sub_1000179A8();
  v9 = v8;
  v10 = sub_100017C88(v8);
  v11 = sub_1000178DC();
  if (v10)
  {
    v13 = v11;
    *(float *)&v12 = (float)v9;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12));
    v50[0] = v43;
    *(float *)&v14 = (float)v13 / 168.0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
    v50[1] = v15;
    *(float *)&v16 = (float)v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
    v50[2] = v17;
    *(float *)&v18 = (float)v3 / (float)v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
    v50[3] = v19;
    *(float *)&v20 = (float)v5 / 1000.0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20));
    v50[4] = v21;
    *(float *)&v22 = (float)v4 / 1000.0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
    v50[5] = v23;
    *(float *)&v24 = (float)v7 / 10.0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24));
    v50[6] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 7));

    v49 = &off_10002F668;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
    v45 = 0;
    v28 = objc_msgSend(objc_alloc((Class)MLMultiArray), "initWithShape:dataType:error:", v27, 65568, &v45);
    v44 = v45;
    if (objc_msgSend(&off_10002F668, "unsignedIntValue"))
    {
      v29 = 0;
      do
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", v29));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29));
        v48 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, v32);

        ++v29;
      }
      while (v29 < objc_msgSend(&off_10002F668, "unsignedIntValue"));
    }
    v46 = CFSTR("Input");
    v47 = v28;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));

  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      sub_10001F7BC(logger, v35, v36, v37, v38, v39, v40, v41);
    return 0;
  }
  return v33;
}

- (void)predictAndRecordWithParams:(id)a3
{
  void *v4;
  id v5;
  NSObject *logger;
  id v7;
  id v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;

  v4 = (void *)os_transaction_create("com.apple.batteryintelligenced.ocvdrift.inference", a2);
  v5 = -[OcvDriftEstimator _copyFeatures](self, "_copyFeatures");
  logger = self->_logger;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      sub_10001F8E4();
    v28 = 0;
    v7 = objc_msgSend(objc_alloc((Class)MLDictionaryFeatureProvider), "initWithDictionary:error:", v5, &v28);
    v8 = v28;
    if (v7)
    {
      v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[OcvDriftEstimator name](self, "name"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathForResource:ofType:", v11, CFSTR("mlmodelc")));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v13, 0));

      v27 = v8;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "predictionFromFeatures:error:", v7, &v27));
      v16 = v27;

      if (v16 && os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001F880();
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("Prediction")));
      v18 = self->_logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "OCV model ouput: %@", buf, 0xCu);
      }
      if (self->_logToPPS)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[OcvDriftEstimator getPayloadForPPSWithParams:andPredictionValue:](self, "getPayloadForPPSWithParams:andPredictionValue:", 0, v17));
        +[BIMetricRecorder sendToPPS:forIdentifier:](BIMetricRecorder, "sendToPPS:forIdentifier:", v19, CFSTR("OCVDrift"));

      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001F81C();
      v16 = v8;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001F7EC(logger, v20, v21, v22, v23, v24, v25, v26);
    v16 = 0;
  }

}

- (id)getPayloadForPPSWithParams:(id)a3 andPredictionValue:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  NSObject *logger;
  int v18;
  void *v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OcvDriftEstimator version](self, "version"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("model_id"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OcvDriftEstimator name](self, "name"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("model_name"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "multiArrayValue"));
  v10 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v11));
      objc_msgSend(v12, "floatValue");
      *(float *)&v14 = v13 * 10000.0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));

      objc_msgSend(v10, "addObject:", v15);
      ++v11;
    }
    while (v11 < (unint64_t)objc_msgSend(v9, "count"));
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("model_prediction"));
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_INFO, "OCV model to log: %@", (uint8_t *)&v18, 0xCu);
  }

  return v6;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
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
