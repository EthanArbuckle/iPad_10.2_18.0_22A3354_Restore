@implementation MORehydrationThresholdMetrics

- (MORehydrationThresholdMetrics)initWithCategory:(unint64_t)a3 provider:(unint64_t)a4 failureCount:(int)a5
{
  MORehydrationThresholdMetrics *result;

  result = -[MORehydrationThresholdMetrics initWithLoggingEnabled:](self, "initWithLoggingEnabled:", 1);
  if (result)
  {
    result->_category = a3;
    result->_provider = a4;
    result->_failureCount = a5;
  }
  return result;
}

- (MORehydrationThresholdMetrics)initWithLoggingEnabled:(BOOL)a3
{
  MORehydrationThresholdMetrics *v3;
  uint64_t v4;
  MORehydrationThresholdMetrics *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];

  v19.receiver = self;
  v19.super_class = (Class)MORehydrationThresholdMetrics;
  v3 = -[MOMetric initWithLoggingEnabled:](&v19, "initWithLoggingEnabled:", a3);
  v5 = v3;
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = objc_msgSend((id)objc_opt_class(v3, v4), "integerKeys", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v5, "metrics"));
          objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_1002D8060, v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

  }
  return v5;
}

+ (id)integerKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("category"), CFSTR("provider"), CFSTR("failureCount"), 0);
}

+ (id)supportedMetricKeys
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend((id)objc_opt_class(a1, a2), "integerKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v3));

  return v4;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  char *v5;
  objc_super v7;

  v5 = MOAnalyticsEventMOEventRehydrationThreshold;
  -[MORehydrationThresholdMetrics setValues](self, "setValues");
  v7.receiver = self;
  v7.super_class = (Class)MORehydrationThresholdMetrics;
  return -[MOMetric submitMetricsWithError:forEvent:](&v7, "submitMetricsWithError:forEvent:", a3, v5);
}

- (void)setValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_category));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("category"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_provider));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("provider"));

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_failureCount));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("failureCount"));

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

- (int)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(int)a3
{
  self->_failureCount = a3;
}

@end
