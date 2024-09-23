@implementation MOMetric

- (MOMetric)initWithLoggingEnabled:(BOOL)a3
{
  MOMetric *v4;
  MOMetric *v5;
  uint64_t v6;
  NSMutableDictionary *metrics;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MOMetric;
  v4 = -[MOMetric init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_loggingEnabled = a3;
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v6;

    v5->_submitted = 0;
  }
  return v5;
}

- (MOMetric)init
{
  return -[MOMetric initWithLoggingEnabled:](self, "initWithLoggingEnabled:", 1);
}

+ (id)metricNameFromEvent:(id)a3
{
  id v3;
  id os_log;
  NSObject *v6;
  char *var0;

  var0 = a3.var0;
  if (a3.var0)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", _mo_analytics_get_event((uint64_t)&var0), 1);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MOMetric metricNameFromEvent:].cold.1(a2);

    v3 = 0;
  }
  return v3;
}

+ (id)metricName
{
  id v3;
  id os_log;
  NSObject *v5;
  id v7;

  v7 = objc_msgSend((id)objc_opt_class(a1, a2), "event");
  if (v7)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", _mo_analytics_get_event((uint64_t)&v7), 1);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[MOMetric metricNameFromEvent:].cold.1(a2);

    v3 = 0;
  }
  return v3;
}

+ (id)binForNumber:(id)a3 bins:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  id os_log;
  NSObject *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  SEL v30;
  id v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  unint64_t v41;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[MOMetric binForNumber:bins:].cold.1();

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v28 = v27;
    v29 = CFSTR("Invalid parameter not satisfying: number != nil");
    v30 = a2;
    v31 = a1;
    v32 = 86;
    goto LABEL_16;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[MOMetric binForNumber:bins:].cold.2();

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v28 = v27;
    v29 = CFSTR("Invalid parameter not satisfying: bins.count > 0");
    v30 = a2;
    v31 = a1;
    v32 = 87;
LABEL_16:
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v30, v31, CFSTR("MOMetric.m"), v32, v29);

    v35 = 0;
    goto LABEL_22;
  }
  v10 = (char *)objc_msgSend(v9, "count");
  v11 = v10 - 1;
  if (v10 == (char *)1)
  {
    v24 = 0;
  }
  else
  {
    v12 = 0;
    do
    {
      v13 = (char *)((unint64_t)&v12[(_QWORD)v11] >> 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v13));
      objc_msgSend(v14, "doubleValue");
      v16 = v15;
      objc_msgSend(v7, "doubleValue");
      v18 = v17;

      if (v16 >= v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", (unint64_t)&v12[(_QWORD)v11] >> 1));
        objc_msgSend(v19, "doubleValue");
        v21 = v20;
        objc_msgSend(v7, "doubleValue");
        v23 = v22;

        if (v21 <= v23)
          break;
      }
      else
      {
        v12 = v13 + 1;
        v13 = v11;
      }
      v11 = v13;
    }
    while (v12 < v13);
    v24 = (unint64_t)&v12[(_QWORD)v11] >> 1;
  }
  objc_msgSend(v7, "doubleValue");
  v37 = v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v24));
  objc_msgSend(v38, "doubleValue");
  v40 = v39;

  if (v37 >= v40)
    v41 = v24 + 1;
  else
    v41 = v24;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v41));
LABEL_22:

  return v35;
}

+ (id)binsFromStart:(id)a3 toEnd:(id)a4 gap:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id os_log;
  NSObject *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  SEL v25;
  id v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[MOMetric binsFromStart:toEnd:gap:].cold.1();

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v23 = v22;
    v24 = CFSTR("Invalid parameter not satisfying: start != nil");
    v25 = a2;
    v26 = a1;
    v27 = 115;
    goto LABEL_16;
  }
  if (!v10)
  {
    v28 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[MOMetric binsFromStart:toEnd:gap:].cold.2();

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v23 = v22;
    v24 = CFSTR("Invalid parameter not satisfying: end != nil");
    v25 = a2;
    v26 = a1;
    v27 = 116;
    goto LABEL_16;
  }
  if (!v11)
  {
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[MOMetric binsFromStart:toEnd:gap:].cold.3();

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v23 = v22;
    v24 = CFSTR("Invalid parameter not satisfying: gap != nil");
    v25 = a2;
    v26 = a1;
    v27 = 117;
LABEL_16:
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, CFSTR("MOMetric.m"), v27, v24);

    v13 = 0;
    goto LABEL_17;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v9, "doubleValue");
  v15 = v14;
  objc_msgSend(v10, "doubleValue");
  if (v15 <= v16)
  {
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
      objc_msgSend(v13, "addObject:", v17);

      objc_msgSend(v12, "doubleValue");
      v15 = v15 + v18;
      objc_msgSend(v10, "doubleValue");
    }
    while (v15 <= v19);
  }
LABEL_17:

  return v13;
}

- (BOOL)submitMetricsWithError:(id *)a3 forEvent:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  id v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSString *v29;
  void *v30;
  NSMutableDictionary *metrics;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v43;
  void *v44;
  char *var0;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  NSMutableDictionary *v51;
  NSErrorUserInfoKey v52;
  void *v53;
  NSErrorUserInfoKey v54;
  id v55;
  NSErrorUserInfoKey v56;
  const __CFString *v57;

  var0 = a4.var0;
  if (a3)
  {
    v7 = objc_msgSend((id)objc_opt_class(self, a2), "metricNameFromEvent:", a4.var0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      if (self->_submitted)
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("metric, %@, has already been submitted"), v8));
        v54 = NSLocalizedDescriptionKey;
        v55 = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 0, v10));

        os_log = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
        v13 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[MOMetric submitMetricsWithError:forEvent:].cold.2();

        v14 = objc_retainAutorelease(v11);
        *a3 = v14;

        v15 = 0;
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_metrics, "allKeys"));
        v9 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v22));

        v24 = objc_msgSend((id)objc_opt_class(self, v23), "supportedMetricKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v25));

        v15 = objc_msgSend(v9, "isEqualToSet:", v26);
        if ((v15 & 1) != 0)
        {
          if (self->_loggingEnabled)
          {
            v27 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              v29 = NSStringFromSelector(a2);
              v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              metrics = self->_metrics;
              *(_DWORD *)buf = 138412802;
              v47 = v30;
              v48 = 2112;
              v49 = v8;
              v50 = 2112;
              v51 = metrics;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "MO_LOG_INFO: %@, submitting, %@, metrics, %@", buf, 0x20u);

            }
          }
          v32 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", _mo_analytics_get_event((uint64_t)&var0), 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.Moments.%@"), v32));
          AnalyticsSendEvent(v33, self->_metrics);

          self->_submitted = 1;
        }
        else
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v9));
          objc_msgSend(v34, "minusSet:", v26);
          v44 = v26;
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v26));
          objc_msgSend(v35, "minusSet:", v9);
          v43 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("metric keys set does not match with keys that metric, %@, supports.  Extra keys, %@, missing keys, %@"), v8, v34, v35));
          v52 = NSLocalizedDescriptionKey;
          v53 = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v37));

          v39 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[MOMetric submitMetricsWithError:forEvent:].cold.2();

          v41 = objc_retainAutorelease(v38);
          *a3 = v41;

          v26 = v44;
        }

      }
    }
    else
    {
      v56 = NSLocalizedDescriptionKey;
      v57 = CFSTR("metricName cannot be nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v18));

      v20 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[MOMetric submitMetricsWithError:forEvent:].cold.2();

      v9 = objc_retainAutorelease(v19);
      v15 = 0;
      *a3 = v9;
    }

  }
  else
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOMetric submitMetricsWithError:forEvent:].cold.1();

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMetric.m"), 131, CFSTR("Invalid parameter not satisfying: outError"));
    v15 = 0;
  }

  return v15;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  id v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSString *v30;
  void *v31;
  NSMutableDictionary *metrics;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  void *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  NSMutableDictionary *v52;
  NSErrorUserInfoKey v53;
  void *v54;
  NSErrorUserInfoKey v55;
  id v56;
  NSErrorUserInfoKey v57;
  const __CFString *v58;

  if (a3)
  {
    v46 = objc_msgSend((id)objc_opt_class(self, a2), "event");
    v7 = objc_msgSend((id)objc_opt_class(self, v6), "metricName");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      if (self->_submitted)
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("metric, %@, has already been submitted"), v8));
        v55 = NSLocalizedDescriptionKey;
        v56 = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 0, v10));

        os_log = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
        v13 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[MOMetric submitMetricsWithError:forEvent:].cold.2();

        v14 = objc_retainAutorelease(v11);
        *a3 = v14;

        v15 = 0;
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_metrics, "allKeys"));
        v9 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v23));

        v25 = objc_msgSend((id)objc_opt_class(self, v24), "supportedMetricKeys");
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v26));

        v15 = objc_msgSend(v9, "isEqualToSet:", v27);
        if ((v15 & 1) != 0)
        {
          if (self->_loggingEnabled)
          {
            v28 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = NSStringFromSelector(a2);
              v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
              metrics = self->_metrics;
              *(_DWORD *)buf = 138412802;
              v48 = v31;
              v49 = 2112;
              v50 = v8;
              v51 = 2112;
              v52 = metrics;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "MO_LOG_INFO: %@, submitting, %@, metrics, %@", buf, 0x20u);

            }
          }
          v33 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", _mo_analytics_get_event((uint64_t)&v46), 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.Moments.%@"), v33));
          AnalyticsSendEvent(v34, self->_metrics);

          self->_submitted = 1;
        }
        else
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v9));
          objc_msgSend(v35, "minusSet:", v27);
          v45 = v27;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v27));
          objc_msgSend(v36, "minusSet:", v9);
          v44 = v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("metric keys set does not match with keys that metric, %@, supports.  Extra keys, %@, missing keys, %@"), v8, v35, v36));
          v53 = NSLocalizedDescriptionKey;
          v54 = v37;
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v38));

          v40 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            -[MOMetric submitMetricsWithError:forEvent:].cold.2();

          v42 = objc_retainAutorelease(v39);
          *a3 = v42;

          v27 = v45;
        }

      }
    }
    else
    {
      v57 = NSLocalizedDescriptionKey;
      v58 = CFSTR("metricName cannot be nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v19));

      v21 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[MOMetric submitMetricsWithError:forEvent:].cold.2();

      v9 = objc_retainAutorelease(v20);
      v15 = 0;
      *a3 = v9;
    }

  }
  else
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOMetric submitMetricsWithError:forEvent:].cold.1();

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMetric.m"), 195, CFSTR("Invalid parameter not satisfying: outError"));

    return 0;
  }
  return v15;
}

- (BOOL)setAllMetrics:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id os_log;
  NSObject *v33;
  id v34;
  void *v36;
  void *v37;
  _QWORD v38[5];
  NSErrorUserInfoKey v39;
  uint64_t v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;

  v7 = a3;
  v9 = v7;
  if (a4)
  {
    if (v7)
    {
      v10 = objc_msgSend((id)objc_opt_class(self, v8), "metricName");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
        v13 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));

        v15 = objc_msgSend((id)objc_opt_class(self, v14), "supportedMetricKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = objc_msgSend(v13, "isSubsetOfSet:", v16);
        if ((v17 & 1) != 0)
        {
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = __32__MOMetric_setAllMetrics_error___block_invoke;
          v38[3] = &unk_1002AF758;
          v38[4] = self;
          objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v38);
        }
        else
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v13));
          objc_msgSend(v29, "minusSet:", v16);
          v37 = v29;
          v39 = NSLocalizedDescriptionKey;
          v40 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("metric keys contains keys that metric, %@, does not support.  Extra keys, %@"), v11, v29));
          v36 = (void *)v40;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v30));

          os_log = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
          v33 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[MOMetric submitMetricsWithError:forEvent:].cold.2();

          v34 = objc_retainAutorelease(v31);
          *a4 = v34;

        }
      }
      else
      {
        v41 = NSLocalizedDescriptionKey;
        v42 = CFSTR("cannot set all metrics when metricName is nil");
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v25));

        v27 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[MOMetric submitMetricsWithError:forEvent:].cold.2();

        v13 = objc_retainAutorelease(v26);
        v17 = 0;
        *a4 = v13;
      }

    }
    else
    {
      v21 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[MOMetric setAllMetrics:error:].cold.2();

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMetric.m"), 263, CFSTR("Invalid parameter not satisfying: metrics"));

      v24 = _MOErrorInvalidParameterCreate((uint64_t)CFSTR("metrics"));
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v24);
    }
  }
  else
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MOMetric submitMetricsWithError:forEvent:].cold.1();

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMetric.m"), 262, CFSTR("Invalid parameter not satisfying: outError"));

    v17 = 0;
  }

  return v17;
}

id __32__MOMetric_setAllMetrics_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", a3, a2);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "metricName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("name, %@, metrics, %@"), v4, v5));

  return (NSString *)v6;
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (BOOL)loggingEnabled
{
  return self->_loggingEnabled;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_loggingEnabled = a3;
}

- (BOOL)submitted
{
  return self->_submitted;
}

- (void)setSubmitted:(BOOL)a3
{
  self->_submitted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_9((uint64_t)a1, (uint64_t)a2);
  OUTLINED_FUNCTION_8_0(v2);
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

+ (id)supportedMetricKeys
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_9((uint64_t)a1, (uint64_t)a2);
  OUTLINED_FUNCTION_8_0(v2);
  return objc_opt_new(NSSet);
}

+ (void)metricNameFromEvent:(const char *)a1 .cold.1(const char *a1)
{
  NSString *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = NSStringFromSelector(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  OUTLINED_FUNCTION_7_0((void *)&_mh_execute_header, v3, v4, "%@, cannot get metric name for a nil eventName", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_5();
}

+ (void)binForNumber:bins:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: number != nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

+ (void)binForNumber:bins:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: bins.count > 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

+ (void)binsFromStart:toEnd:gap:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: start != nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

+ (void)binsFromStart:toEnd:gap:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: end != nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

+ (void)binsFromStart:toEnd:gap:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: gap != nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)submitMetricsWithError:forEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: outError", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)submitMetricsWithError:forEvent:.cold.2()
{
  SEL v0;
  NSString *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v3, v4, "%@, error, %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)setAllMetrics:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: metrics", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

@end
