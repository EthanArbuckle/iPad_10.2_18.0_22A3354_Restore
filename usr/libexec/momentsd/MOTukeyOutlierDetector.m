@implementation MOTukeyOutlierDetector

- (MOTukeyOutlierDetector)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOTukeyOutlierDetector;
  return -[MOTukeyOutlierDetector init](&v3, "init");
}

- (id)sortData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = objc_msgSend(a3, "mutableCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("value"), 1));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  objc_msgSend(v3, "sortUsingDescriptors:", v5);

  return v3;
}

- (BOOL)fitData:(id)a3
{
  id v5;
  MOAnalyticsStats *v6;
  MOAnalyticsStats *trainDataStats;
  id v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id os_log;
  NSObject *v19;
  NSString *v20;
  void *v21;
  _BOOL8 valid;
  double q1;
  double q2;
  double q3;
  double iqr;
  _BOOL4 v27;
  int v29;
  void *v30;
  __int16 v31;
  _BOOL8 v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;

  v5 = a3;
  v6 = -[MOAnalyticsStats initWithTimeSeries:]([MOAnalyticsStats alloc], "initWithTimeSeries:", v5);
  trainDataStats = self->_trainDataStats;
  self->_trainDataStats = v6;

  self->_valid = 0;
  if (objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v5, "count");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOTukeyOutlierDetector sortData:](self, "sortData:", v5));
    v10 = (double)(unint64_t)v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", (unint64_t)((double)(unint64_t)v8 * 0.25)));
    objc_msgSend(v11, "value");
    self->_q1 = v12;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", (unint64_t)(v10 * 0.5)));
    objc_msgSend(v13, "value");
    self->_q2 = v14;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", (unint64_t)(v10 * 0.75)));
    objc_msgSend(v15, "value");
    self->_q3 = v16;

    v17 = self->_q3 - self->_q1;
    self->_iqr = v17;
    if (v17 > 0.0)
      self->_valid = 1;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
    v19 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      valid = self->_valid;
      q1 = self->_q1;
      q2 = self->_q2;
      q3 = self->_q3;
      iqr = self->_iqr;
      v29 = 138413570;
      v30 = v21;
      v31 = 2048;
      v32 = valid;
      v33 = 2048;
      v34 = q1;
      v35 = 2048;
      v36 = q2;
      v37 = 2048;
      v38 = q3;
      v39 = 2048;
      v40 = iqr;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@, valid, %lu, q1, %f, q2, %f, q3, %f, iqr, %f", (uint8_t *)&v29, 0x3Eu);

    }
    v27 = self->_valid;

  }
  else
  {
    v27 = self->_valid;
  }

  return v27;
}

- (id)testData:(id)a3
{
  id v4;
  MOAnalyticsStats *v5;
  MOAnalyticsStats *testDataStats;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[MOAnalyticsStats initWithTimeSeries:]([MOAnalyticsStats alloc], "initWithTimeSeries:", v4);
  testDataStats = self->_testDataStats;
  self->_testDataStats = v5;

  if (self->_valid)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOTukeyOutlierDetector sortData:](self, "sortData:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (unint64_t)((double)(unint64_t)objc_msgSend(v4, "count") * 0.5)));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOTukeyOutlierDetector _testDatum:](self, "_testDatum:", v8));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_testDatum:(id)a3
{
  id v5;
  MOAnalyticsResult *v6;
  double iqr;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  _BOOL8 v13;
  double v14;
  id os_log;
  NSObject *v16;
  NSString *v17;
  void *v18;
  _BOOL8 valid;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24;
  void *v25;
  __int16 v26;
  _BOOL8 v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;

  v5 = a3;
  if (self->_valid)
  {
    v6 = objc_opt_new(MOAnalyticsResult);
    iqr = self->_iqr;
    v8 = self->_q1 + iqr * -1.5;
    v9 = self->_q3 + iqr * 1.5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
    -[MOAnalyticsResult setDate:](v6, "setDate:", v10);

    objc_msgSend(v5, "value");
    -[MOAnalyticsResult setActual:](v6, "setActual:");
    objc_msgSend(v5, "value");
    -[MOAnalyticsResult setScore:](v6, "setScore:", v11 - self->_q2);
    objc_msgSend(v5, "value");
    if (v12 >= v8)
    {
      objc_msgSend(v5, "value");
      v13 = v9 < v14;
    }
    else
    {
      v13 = 1;
    }
    -[MOAnalyticsResult setOutlier:](v6, "setOutlier:", v13);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityTrends);
    v16 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      valid = self->_valid;
      objc_msgSend(v5, "value");
      v21 = v20;
      -[MOAnalyticsResult score](v6, "score");
      v24 = 138413570;
      v25 = v18;
      v26 = 2048;
      v27 = valid;
      v28 = 2048;
      v29 = v8;
      v30 = 2048;
      v31 = v9;
      v32 = 2048;
      v33 = v21;
      v34 = 2048;
      v35 = v22;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@, valid, %lu, lower, %f, upper, %f, value, %f, score, %f", (uint8_t *)&v24, 0x3Eu);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getTrainDataStats
{
  return self->_trainDataStats;
}

- (id)getTestDataStats
{
  return self->_testDataStats;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (double)q1
{
  return self->_q1;
}

- (void)setQ1:(double)a3
{
  self->_q1 = a3;
}

- (double)q2
{
  return self->_q2;
}

- (void)setQ2:(double)a3
{
  self->_q2 = a3;
}

- (double)q3
{
  return self->_q3;
}

- (void)setQ3:(double)a3
{
  self->_q3 = a3;
}

- (double)iqr
{
  return self->_iqr;
}

- (void)setIqr:(double)a3
{
  self->_iqr = a3;
}

- (MOAnalyticsStats)trainDataStats
{
  return self->_trainDataStats;
}

- (void)setTrainDataStats:(id)a3
{
  objc_storeStrong((id *)&self->_trainDataStats, a3);
}

- (MOAnalyticsStats)testDataStats
{
  return self->_testDataStats;
}

- (void)setTestDataStats:(id)a3
{
  objc_storeStrong((id *)&self->_testDataStats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDataStats, 0);
  objc_storeStrong((id *)&self->_trainDataStats, 0);
}

@end
