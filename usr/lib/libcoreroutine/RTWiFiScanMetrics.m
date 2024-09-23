@implementation RTWiFiScanMetrics

+ (void)submitWiFiScanMetricsWithErrorCode:(unint64_t)a3 accessPointsscanResultsCount:(unint64_t)a4 isScanIssuedByOtherClient:(BOOL)a5 isCacheQuery:(BOOL)a6
{
  RTWiFiScanMetrics *v6;
  RTWiFiScanMetrics *v7;
  uint64_t v8;

  v6 = -[RTWiFiScanMetrics initWithAccessPointsscanResultsCount:errorCode:isCacheQuery:isScanIssuedByOtherClient:]([RTWiFiScanMetrics alloc], "initWithAccessPointsscanResultsCount:errorCode:isCacheQuery:isScanIssuedByOtherClient:", a4, a3, a6, a5);
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    -[RTMetric submitMetricsWithError:](v6, "submitMetricsWithError:", &v8);
  }

}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventWiFiScanMetrics;
}

+ (id)supportedMetricKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("wifiScanTotalAccessPointsCount"), CFSTR("errorCode"), CFSTR("isCacheQuery"), CFSTR("isScanIssuedByAnotherClient"), 0);
}

- (RTWiFiScanMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccessPointsscanResultsCount_errorCode_isCacheQuery_isScanIssuedByOtherClient_);
}

- (RTWiFiScanMetrics)initWithAccessPointsscanResultsCount:(unint64_t)a3 errorCode:(unint64_t)a4 isCacheQuery:(BOOL)a5 isScanIssuedByOtherClient:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  RTWiFiScanMetrics *v10;
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
  objc_super v22;

  v6 = a6;
  v7 = a5;
  v22.receiver = self;
  v22.super_class = (Class)RTWiFiScanMetrics;
  v10 = -[RTMetric init](&v22, sel_init);
  if (v10)
  {
    +[RTWiFiScanMetrics binsForWiFiAPsCount](RTWiFiScanMetrics, "binsForWiFiAPsCount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("wifiScanTotalAccessPointsCount"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("errorCode"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("isCacheQuery"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v10, "metrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("isScanIssuedByAnotherClient"));

  }
  return v10;
}

+ (id)binsForWiFiAPsCount
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E932CCE8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 10;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

    v3 = (v3 + 10);
  }
  while ((_DWORD)v3 != 60);
  v5 = 100;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

    v5 = (v5 + 100);
  }
  while ((_DWORD)v5 != 600);
  return v2;
}

+ (unint64_t)bucketForWiFiAPsCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binsForWiFiAPsCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binForNumber:bins:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

@end
