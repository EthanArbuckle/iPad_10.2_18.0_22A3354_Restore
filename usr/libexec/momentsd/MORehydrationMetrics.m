@implementation MORehydrationMetrics

- (MORehydrationMetrics)initWithCategory:(unint64_t)a3 provider:(unint64_t)a4 spiSuccess:(BOOL)a5 spiError:(id)a6 failCount:(double)a7 successAfterPreFailCount:(double)a8 totalCount:(int)a9 rehydrationTrigger:(int)a10
{
  id v19;
  MORehydrationMetrics *v20;
  MORehydrationMetrics *v21;
  double v22;

  v19 = a6;
  v20 = -[MORehydrationMetrics initWithLoggingEnabled:](self, "initWithLoggingEnabled:", 1);
  v21 = v20;
  if (v20)
  {
    v20->_category = a3;
    v20->_provider = a4;
    v20->_spiSuccess = a5;
    objc_storeStrong((id *)&v20->_spiError, a6);
    v21->_totalCount = a9;
    v21->_failCount = (int)a7;
    v21->_successAfterPreFailCount = (int)a8;
    if (a9 < 1)
    {
      v21->_failPercentage = 0.0;
      v22 = 0.0;
    }
    else
    {
      v21->_failPercentage = a7 / (double)a9 * 100.0;
      v22 = a8 / (double)a9 * 100.0;
    }
    v21->_successAfterPreFailPercentage = v22;
    v21->_rehydrationTrigger = a10;
    v21->_rehydrationSuccess = v21->_failCount == 0;
    v21->_rehydrationSuccessAfterPreFail = v21->_successAfterPreFailCount != 0;
  }

  return v21;
}

- (MORehydrationMetrics)initWithLoggingEnabled:(BOOL)a3
{
  MORehydrationMetrics *v3;
  uint64_t v4;
  MORehydrationMetrics *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
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
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];

  v58.receiver = self;
  v58.super_class = (Class)MORehydrationMetrics;
  v3 = -[MOMetric initWithLoggingEnabled:](&v58, "initWithLoggingEnabled:", a3);
  v5 = v3;
  if (v3)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v6 = objc_msgSend((id)objc_opt_class(v3, v4), "BOOLeanKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v55;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v55 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v9);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v15 = objc_msgSend((id)objc_opt_class(v5, v14), "integerKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v22, "setObject:forKeyedSubscript:", &off_1002D8090, v21);

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      }
      while (v18);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v24 = objc_msgSend((id)objc_opt_class(v5, v23), "bucketedKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v47;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v31, "setObject:forKeyedSubscript:", &off_1002D8090, v30);

          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
      }
      while (v27);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v33 = objc_msgSend((id)objc_opt_class(v5, v32), "stringKeys", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v43;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v40, "setObject:forKeyedSubscript:", &off_1002D80A8, v39);

          v38 = (char *)v38 + 1;
        }
        while (v36 != v38);
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
      }
      while (v36);
    }

  }
  return v5;
}

+ (id)BOOLeanKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("spiSuccess"), CFSTR("rehydrationSuccess"), CFSTR("rehydrationSuccessAfterPreFail"), 0);
}

+ (id)integerKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("category"), CFSTR("provider"), CFSTR("rehydrationTrigger"), CFSTR("successAfterPreFailEventCount"), CFSTR("totalEventCount"), CFSTR("failEventCount"), 0);
}

+ (id)bucketedKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("failPercentage"), CFSTR("successAfterPreFailPercentage"), 0);
}

+ (id)stringKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("spiError"), 0);
}

+ (id)supportedMetricKeys
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;

  v3 = objc_msgSend((id)objc_opt_class(a1, a2), "integerKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v4));

  v7 = objc_msgSend((id)objc_opt_class(a1, v6), "BOOLeanKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v9);

  v11 = objc_msgSend((id)objc_opt_class(a1, v10), "bucketedKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v13);

  v15 = objc_msgSend((id)objc_opt_class(a1, v14), "stringKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v17);

  return v5;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  char *v5;
  objc_super v7;

  v5 = MOAnalyticsEventEventRehydration;
  -[MORehydrationMetrics setValues](self, "setValues");
  v7.receiver = self;
  v7.super_class = (Class)MORehydrationMetrics;
  return -[MOMetric submitMetricsWithError:forEvent:](&v7, "submitMetricsWithError:forEvent:", a3, v5);
}

- (void)setValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v19;
  void *v20;
  NSString *spiError;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_category));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("category"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_provider));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("provider"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rehydrationTrigger));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("rehydrationTrigger"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_spiSuccess));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("spiSuccess"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_rehydrationSuccess));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("rehydrationSuccess"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_successAfterPreFailCount));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("successAfterPreFailEventCount"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_totalCount));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("totalEventCount"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_failCount));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("failEventCount"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_rehydrationSuccessAfterPreFail));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("rehydrationSuccessAfterPreFail"));

  spiError = self->_spiError;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  v23 = v22;
  if (spiError)
    v24 = (const __CFString *)spiError;
  else
    v24 = &stru_1002B68D0;
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("spiError"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_failPercentage));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("failPercentage"));

  v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_successAfterPreFailPercentage));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("successAfterPreFailPercentage"));

}

- (unint64_t)provider
{
  return self->_provider;
}

- (void)setProvider:(unint64_t)a3
{
  self->_provider = a3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (BOOL)spiSuccess
{
  return self->_spiSuccess;
}

- (void)setSpiSuccess:(BOOL)a3
{
  self->_spiSuccess = a3;
}

- (NSString)spiError
{
  return self->_spiError;
}

- (void)setSpiError:(id)a3
{
  objc_storeStrong((id *)&self->_spiError, a3);
}

- (double)failPercentage
{
  return self->_failPercentage;
}

- (void)setFailPercentage:(double)a3
{
  self->_failPercentage = a3;
}

- (double)successAfterPreFailPercentage
{
  return self->_successAfterPreFailPercentage;
}

- (void)setSuccessAfterPreFailPercentage:(double)a3
{
  self->_successAfterPreFailPercentage = a3;
}

- (int)rehydrationTrigger
{
  return self->_rehydrationTrigger;
}

- (void)setRehydrationTrigger:(int)a3
{
  self->_rehydrationTrigger = a3;
}

- (BOOL)rehydrationSuccess
{
  return self->_rehydrationSuccess;
}

- (void)setRehydrationSuccess:(BOOL)a3
{
  self->_rehydrationSuccess = a3;
}

- (BOOL)rehydrationSuccessAfterPreFail
{
  return self->_rehydrationSuccessAfterPreFail;
}

- (void)setRehydrationSuccessAfterPreFail:(BOOL)a3
{
  self->_rehydrationSuccessAfterPreFail = a3;
}

- (int)totalCount
{
  return self->_totalCount;
}

- (void)setTotalCount:(int)a3
{
  self->_totalCount = a3;
}

- (int)failCount
{
  return self->_failCount;
}

- (void)setFailCount:(int)a3
{
  self->_failCount = a3;
}

- (int)successAfterPreFailCount
{
  return self->_successAfterPreFailCount;
}

- (void)setSuccessAfterPreFailCount:(int)a3
{
  self->_successAfterPreFailCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spiError, 0);
}

@end
