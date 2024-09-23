@implementation MOMediaPlayMetrics

- (MOMediaPlayMetrics)initWithFirstPartyAppRatio:(double)a3 firstPartyAppTime:(double)a4 musciAppTime:(double)a5
{
  MOMediaPlayMetrics *result;

  result = -[MOMediaPlayMetrics initWithLoggingEnabled:](self, "initWithLoggingEnabled:", 1);
  if (result)
  {
    if (a3 > 0.0)
      result->_firstPartyAppRatio = (int)(a3 * 100.0);
    if (a4 > 0.0)
      result->_firstPartyAppTime = (int)(a4 / 600.0);
    if (a5 > 0.0)
      result->_musicAppTime = (int)(a5 / 600.0);
  }
  return result;
}

- (MOMediaPlayMetrics)initWithLoggingEnabled:(BOOL)a3
{
  MOMediaPlayMetrics *v3;
  uint64_t v4;
  MOMediaPlayMetrics *v5;
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
  v19.super_class = (Class)MOMediaPlayMetrics;
  v3 = -[MOMetric initWithLoggingEnabled:](&v19, "initWithLoggingEnabled:", a3);
  v5 = v3;
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = objc_msgSend((id)objc_opt_class(v3, v4), "bucketedKeys", 0);
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
          objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_1002D8048, v12);

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

+ (id)bucketedKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("firstPartyAppRatio"), CFSTR("firstPartyAppTime"), CFSTR("musicAppTime"), 0);
}

+ (id)supportedMetricKeys
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend((id)objc_opt_class(a1, a2), "bucketedKeys");
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

  v5 = MOAnalyticsEventMediaPlayMetrics;
  -[MOMediaPlayMetrics setValues](self, "setValues");
  v7.receiver = self;
  v7.super_class = (Class)MOMediaPlayMetrics;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_firstPartyAppRatio));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("firstPartyAppRatio"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_firstPartyAppTime));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("firstPartyAppTime"));

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_musicAppTime));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("musicAppTime"));

}

- (int)firstPartyAppRatio
{
  return self->_firstPartyAppRatio;
}

- (void)setFirstPartyAppRatio:(int)a3
{
  self->_firstPartyAppRatio = a3;
}

- (int)firstPartyAppTime
{
  return self->_firstPartyAppTime;
}

- (void)setFirstPartyAppTime:(int)a3
{
  self->_firstPartyAppTime = a3;
}

- (int)musicAppTime
{
  return self->_musicAppTime;
}

- (void)setMusicAppTime:(int)a3
{
  self->_musicAppTime = a3;
}

@end
