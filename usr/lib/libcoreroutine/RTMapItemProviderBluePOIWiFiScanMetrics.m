@implementation RTMapItemProviderBluePOIWiFiScanMetrics

- (RTMapItemProviderBluePOIWiFiScanMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFingerprintsCount_fingerprintsZeroAccessPointsCount_fingerprintsNonZeroAccessPointsCount_isFingerprintWindowFallback_timeIntervalSinceEarliestFingerprint_timeIntervalSinceLatestFingerprint_totalAccessPointsCount_visitInterval_visitSource_);
}

- (RTMapItemProviderBluePOIWiFiScanMetrics)initWithFingerprintsCount:(unint64_t)a3 fingerprintsZeroAccessPointsCount:(unint64_t)a4 fingerprintsNonZeroAccessPointsCount:(unint64_t)a5 isFingerprintWindowFallback:(BOOL)a6 timeIntervalSinceEarliestFingerprint:(double)a7 timeIntervalSinceLatestFingerprint:(double)a8 totalAccessPointsCount:(unint64_t)a9 visitInterval:(double)a10 visitSource:(int64_t)a11
{
  _BOOL8 v13;
  RTMapItemProviderBluePOIWiFiScanMetrics *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  int64_t v46;
  objc_super v47;

  v13 = a6;
  v47.receiver = self;
  v47.super_class = (Class)RTMapItemProviderBluePOIWiFiScanMetrics;
  v20 = -[RTMetric init](&v47, sel_init);
  if (v20)
  {
    v46 = a11;
    +[RTMapItemProviderBluePOIWiFiScanMetrics binsForWiFiAPsCount](RTMapItemProviderBluePOIWiFiScanMetrics, "binsForWiFiAPsCount");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMapItemProviderBluePOIWiFiScanMetrics binsForFingerprintsCount](RTMapItemProviderBluePOIWiFiScanMetrics, "binsForFingerprintsCount");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v22, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v20, "metrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("fingerprintsCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v25, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v20, "metrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("fingerprintsWithZeroAPsCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v28, v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v20, "metrics");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("fingerprintsWithNonZeroAPsCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v20, "metrics");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, CFSTR("isFingerprintWindowFallback"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "bucketForWiFiInterval:", a7));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v20, "metrics");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("timeIntervalEarliesttWiFiScan"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "bucketForWiFiInterval:", a8));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v20, "metrics");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("timeIntervalLatestWiFiScan"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v37, v45);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v20, "metrics");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, CFSTR("totalAccessPointsCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "bucketForVisitInterval:", a10));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v20, "metrics");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("visitDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](v20, "metrics");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, CFSTR("visitSource"));

  }
  return v20;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventMapItemProviderBluePOIWiFiScansMetrics;
}

+ (id)supportedMetricKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("fingerprintsCount"), CFSTR("fingerprintsWithZeroAPsCount"), CFSTR("fingerprintsWithNonZeroAPsCount"), CFSTR("isFingerprintWindowFallback"), CFSTR("timeIntervalEarliesttWiFiScan"), CFSTR("timeIntervalLatestWiFiScan"), CFSTR("totalAccessPointsCount"), CFSTR("visitSource"), CFSTR("visitDuration"), 0);
}

+ (unint64_t)bucketForVisitInterval:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binsForVisitDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binForNumber:bins:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

+ (id)binsForVisitDuration
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = (void *)binsForVisitDuration_binsForVisitDuration;
  if (!binsForVisitDuration_binsForVisitDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E932C388);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)binsForVisitDuration_binsForVisitDuration;
    binsForVisitDuration_binsForVisitDuration = v3;

    v5 = 23;
    v6 = 3600;
    do
    {
      v7 = (void *)binsForVisitDuration_binsForVisitDuration;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      v6 += 3600;
      --v5;
    }
    while (v5);
    v9 = 4;
    v10 = 86400;
    do
    {
      v11 = (void *)binsForVisitDuration_binsForVisitDuration;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      v10 += 86400;
      --v9;
    }
    while (v9);
    v2 = (void *)binsForVisitDuration_binsForVisitDuration;
  }
  return v2;
}

+ (id)binsForWiFiAPsCount
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E932C3A0);
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

+ (id)binsForFingerprintsCount
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E932C3B8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 10;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

    v3 = (v3 + 10);
  }
  while ((_DWORD)v3 != 110);
  return v2;
}

+ (unint64_t)bucketForWiFiInterval:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binsForWiFiInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binForNumber:bins:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

+ (id)binsForWiFiInterval
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;

  v2 = (void *)binsForWiFiInterval_binsForWiFiInterval;
  if (!binsForWiFiInterval_binsForWiFiInterval)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E932C3D0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)binsForWiFiInterval_binsForWiFiInterval;
    binsForWiFiInterval_binsForWiFiInterval = v3;

    v5 = 1;
    do
    {
      v6 = (void *)binsForWiFiInterval_binsForWiFiInterval;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      v5 = (v5 + 1);
    }
    while ((_DWORD)v5 != 15);
    for (i = 60; i != 960; i += 60)
    {
      v9 = (void *)binsForWiFiInterval_binsForWiFiInterval;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
    v2 = (void *)binsForWiFiInterval_binsForWiFiInterval;
  }
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

+ (unint64_t)bucketForFingerprintsCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binsForFingerprintsCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "binForNumber:bins:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

+ (void)submitBluePOIWiFiScanMetricsWithFingerprintsCount:(unint64_t)a3 fingerprintsZeroAccessPointsCount:(unint64_t)a4 fingerprintsNonZeroAccessPointsCount:(unint64_t)a5 isFingerprintWindowFallback:(BOOL)a6 timeIntervalSinceEarliestFingerprint:(double)a7 timeIntervalSinceLatestFingerprint:(double)a8 totalAccessPointsCount:(unint64_t)a9 visitInterval:(double)a10 visitSource:(int64_t)a11
{
  RTMapItemProviderBluePOIWiFiScanMetrics *v11;
  RTMapItemProviderBluePOIWiFiScanMetrics *v12;
  uint64_t v13;

  v11 = -[RTMapItemProviderBluePOIWiFiScanMetrics initWithFingerprintsCount:fingerprintsZeroAccessPointsCount:fingerprintsNonZeroAccessPointsCount:isFingerprintWindowFallback:timeIntervalSinceEarliestFingerprint:timeIntervalSinceLatestFingerprint:totalAccessPointsCount:visitInterval:visitSource:]([RTMapItemProviderBluePOIWiFiScanMetrics alloc], "initWithFingerprintsCount:fingerprintsZeroAccessPointsCount:fingerprintsNonZeroAccessPointsCount:isFingerprintWindowFallback:timeIntervalSinceEarliestFingerprint:timeIntervalSinceLatestFingerprint:totalAccessPointsCount:visitInterval:visitSource:", a3, a4, a5, a6, a9, a11, a7, a8, a10);
  v12 = v11;
  if (v11)
  {
    v13 = 0;
    -[RTMetric submitMetricsWithError:](v11, "submitMetricsWithError:", &v13);
  }

}

@end
