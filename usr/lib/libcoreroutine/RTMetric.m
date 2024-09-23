@implementation RTMetric

- (RTMetric)initWithLoggingEnabled:(BOOL)a3
{
  RTMetric *v4;
  RTMetric *v5;
  uint64_t v6;
  NSMutableDictionary *metrics;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RTMetric;
  v4 = -[RTMetric init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_loggingEnabled = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v6;

    v5->_submitted = 0;
  }
  return v5;
}

- (RTMetric)init
{
  return -[RTMetric initWithLoggingEnabled:](self, "initWithLoggingEnabled:", 1);
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

+ (id)supportedMetricKeys
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)metricName
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_opt_class(), "event");
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v3, 1);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%@, cannot get metric name for a nil eventName", (uint8_t *)&v8, 0xCu);

    }
    v4 = 0;
  }
  return v4;
}

+ (id)binForNumber:(id)a3 bins:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  const char *v23;
  uint8_t *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  unint64_t v31;
  __int16 v33;
  __int16 v34;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      v25 = 0;
      goto LABEL_19;
    }
    v34 = 0;
    v23 = "Invalid parameter not satisfying: number";
    v24 = (uint8_t *)&v34;
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, v23, v24, 2u);
    goto LABEL_13;
  }
  if (!objc_msgSend(v6, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v33 = 0;
    v23 = "Invalid parameter not satisfying: bins.count > 0";
    v24 = (uint8_t *)&v33;
    goto LABEL_21;
  }
  v8 = objc_msgSend(v7, "count");
  v9 = v8 - 1;
  if (v8 == 1)
  {
    v11 = 0;
  }
  else
  {
    v10 = 0;
    do
    {
      v11 = (v10 + v9) >> 1;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = v13;
      objc_msgSend(v5, "doubleValue");
      v16 = v15;

      if (v14 >= v16)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", (v10 + v9) >> 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;
        objc_msgSend(v5, "doubleValue");
        v21 = v20;

        v9 = (v10 + v9) >> 1;
        if (v19 <= v21)
          goto LABEL_15;
      }
      else
      {
        v10 = v11 + 1;
      }
    }
    while (v10 < v9);
    v11 = (v9 + v10) >> 1;
  }
LABEL_15:
  objc_msgSend(v5, "doubleValue");
  v27 = v26;
  objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  v30 = v29;

  if (v27 >= v30)
    v31 = v11 + 1;
  else
    v31 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v25;
}

+ (id)binsFromStart:(id)a3 toEnd:(id)a4 gap:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  __int16 v22;
  __int16 v23;
  __int16 v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v24 = 0;
    v19 = "Invalid parameter not satisfying: start";
    v20 = (uint8_t *)&v24;
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_14;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v23 = 0;
    v19 = "Invalid parameter not satisfying: end";
    v20 = (uint8_t *)&v23;
    goto LABEL_13;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = 0;
      v19 = "Invalid parameter not satisfying: gap";
      v20 = (uint8_t *)&v22;
      goto LABEL_13;
    }
LABEL_14:

    v11 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v13 = v12;
  objc_msgSend(v8, "doubleValue");
  if (v13 <= v14)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);

      objc_msgSend(v10, "doubleValue");
      v13 = v13 + v16;
      objc_msgSend(v8, "doubleValue");
    }
    while (v13 <= v17);
  }
LABEL_15:

  return v11;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSMutableDictionary *metrics;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  NSObject *v49;
  __int16 v50;
  NSMutableDictionary *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "event");
    objc_msgSend((id)objc_opt_class(), "metricName");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (self->_submitted)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metric, %@, has already been submitted"), v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = *MEMORY[0x1E0D18598];
        v54 = *MEMORY[0x1E0CB2D50];
        v55 = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, v11);
        v12 = objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v47 = v41;
          v48 = 2112;
          v49 = v12;
          _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        v14 = objc_retainAutorelease(v12);
        *a3 = v14;

        v15 = 0;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0C99E60];
        -[NSMutableDictionary allKeys](self->_metrics, "allKeys");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setWithArray:", v22);
        v8 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend((id)objc_opt_class(), "supportedMetricKeys");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setWithSet:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = -[NSObject isEqualToSet:](v8, "isEqualToSet:", v25);
        if ((v15 & 1) != 0)
        {
          if (self->_loggingEnabled)
          {
            _rt_log_facility_get_os_log(RTLogFacilityMetric);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              metrics = self->_metrics;
              *(_DWORD *)buf = 138412802;
              v47 = v27;
              v48 = 2112;
              v49 = v7;
              v50 = 2112;
              v51 = metrics;
              _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, submitting, %@, metrics, %@", buf, 0x20u);

            }
          }
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v6, 1);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

          self->_submitted = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "minusSet:", v25);
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v25);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "minusSet:", v8);
          v45 = v31;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metric keys set does not match with keys that metric, %@, supports.  Extra keys, %@, missing keys, %@"), v7, v31, v32);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = (void *)MEMORY[0x1E0CB35C8];
          v35 = *MEMORY[0x1E0D18598];
          v52 = *MEMORY[0x1E0CB2D50];
          v53 = v33;
          v44 = (void *)v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 7, v36);
          v37 = objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityMetric);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v47 = v43;
            v48 = 2112;
            v49 = v37;
            _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          v39 = objc_retainAutorelease(v37);
          *a3 = v39;

        }
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v56 = *MEMORY[0x1E0CB2D50];
      v57[0] = CFSTR("metricName cannot be nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v18);
      v19 = objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v47 = v42;
        v48 = 2112;
        v49 = v19;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v8 = objc_retainAutorelease(v19);
      v15 = 0;
      *a3 = v8;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)setAllMetrics:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a4)
  {
    if (v7)
    {
      objc_msgSend((id)objc_opt_class(), "metricName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v8, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWithArray:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "supportedMetricKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isSubsetOfSet:", v13);
        if ((v14 & 1) != 0)
        {
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __32__RTMetric_setAllMetrics_error___block_invoke;
          v35[3] = &unk_1E9298370;
          v35[4] = self;
          objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v35);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "minusSet:", v13);
          v34 = v22;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metric keys contains keys that metric, %@, does not support.  Extra keys, %@"), v9, v22);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x1E0CB35C8];
          v25 = *MEMORY[0x1E0D18598];
          v36 = *MEMORY[0x1E0CB2D50];
          v37 = v23;
          v33 = (void *)v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 7, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityMetric);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v39 = v32;
            v40 = 2112;
            v41 = v27;
            _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          v29 = objc_retainAutorelease(v27);
          *a4 = v29;

        }
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0D18598];
        v42 = *MEMORY[0x1E0CB2D50];
        v43[0] = CFSTR("cannot set all metrics when metricName is nil");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 7, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = v31;
          v40 = 2112;
          v41 = v20;
          _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        v12 = objc_retainAutorelease(v20);
        v14 = 0;
        *a4 = v12;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metrics", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("metrics"));
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

uint64_t __32__RTMetric_setAllMetrics_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", a3, a2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "metricName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name, %@, metrics, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

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

@end
