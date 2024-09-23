@implementation HDSPSleepApneaAnalyticsBuilder

- (HDSPSleepApneaAnalyticsBuilder)initWithBreathingDisturbanceSamples:(id)a3 sleepApneaFeatureStatus:(id)a4 morningIndexRange:(id)a5 gregorianCalendar:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  id v13;
  HDSPSleepApneaAnalyticsBuilder *v14;
  uint64_t v15;
  NSArray *breathingDisturbanceSamples;
  uint64_t v17;
  HKFeatureStatus *sleepApneaFeatureStatus;
  uint64_t v19;
  NSCalendar *gregorianCalendar;
  HDSPSleepApneaAnalyticsBuilder *v21;
  objc_super v23;

  var1 = a5.var1;
  var0 = a5.var0;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HDSPSleepApneaAnalyticsBuilder;
  v14 = -[HDSPSleepApneaAnalyticsBuilder init](&v23, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    breathingDisturbanceSamples = v14->_breathingDisturbanceSamples;
    v14->_breathingDisturbanceSamples = (NSArray *)v15;

    v17 = objc_msgSend(v12, "copy");
    sleepApneaFeatureStatus = v14->_sleepApneaFeatureStatus;
    v14->_sleepApneaFeatureStatus = (HKFeatureStatus *)v17;

    v14->_morningIndexRange.start = var0;
    v14->_morningIndexRange.duration = var1;
    v19 = objc_msgSend(v13, "copy");
    gregorianCalendar = v14->_gregorianCalendar;
    v14->_gregorianCalendar = (NSCalendar *)v19;

    v21 = v14;
  }

  return v14;
}

- (void)updateDailyReportWithSleepApneaAnalytics:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    -[HDSPSleepApneaAnalyticsBuilder breathingDisturbanceSamples](self, "breathingDisturbanceSamples");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v6;
    v18 = 2050;
    v19 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Building daily analytics report from %{public}lu bd samples", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HDSPSleepApneaAnalyticsBuilder _isEnabledBD](self, "_isEnabledBD"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsOnboardedBD:", v9);

  -[HDSPSleepApneaAnalyticsBuilder _breathingDisturbanceSamplesInPastNight](self, "_breathingDisturbanceSamplesInPastNight");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepApneaAnalyticsBuilder _timesBetweenBDSessions:](self, "_timesBetweenBDSessions:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepApneaAnalyticsBuilder _numBDValuesInPastNight:](self, "_numBDValuesInPastNight:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumBDValuesInPastNight:", v12);

  -[HDSPSleepApneaAnalyticsBuilder _meanTimeBetweenBDSessionsPastNight:](self, "_meanTimeBetweenBDSessionsPastNight:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMeanTimeBetweenBDSessionsPastNight:", v13);

  -[HDSPSleepApneaAnalyticsBuilder _minTimeBetweenBDSessionsPastNight:](self, "_minTimeBetweenBDSessionsPastNight:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinTimeBetweenBDSessionsPastNight:", v14);

  -[HDSPSleepApneaAnalyticsBuilder _maxTimeBetweenBDSessionsPastNight:](self, "_maxTimeBetweenBDSessionsPastNight:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxTimeBetweenBDSessionsPastNight:", v15);

}

- (BOOL)_isOnboardedBD
{
  void *v3;
  void *v4;
  char v5;

  -[HDSPSleepApneaAnalyticsBuilder sleepApneaFeatureStatus](self, "sleepApneaFeatureStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HDSPSleepApneaAnalyticsBuilder sleepApneaFeatureStatus](self, "sleepApneaFeatureStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOnboardingRecordPresent");

  return v5;
}

- (BOOL)_isEnabledBD
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HDSPSleepApneaAnalyticsBuilder sleepApneaFeatureStatus](self, "sleepApneaFeatureStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HDSPSleepApneaAnalyticsBuilder sleepApneaFeatureStatus](self, "sleepApneaFeatureStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D10]);

  return v6;
}

- (id)_numBDValuesInPastNight:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[HDSPSleepApneaAnalyticsBuilder _isOnboardedBD](self, "_isOnboardedBD"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_meanTimeBetweenBDSessionsPastNight:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  if (-[HDSPSleepApneaAnalyticsBuilder _isOnboardedBD](self, "_isOnboardedBD") && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("@avg.doubleValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 / 3600.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_maxTimeBetweenBDSessionsPastNight:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  if (-[HDSPSleepApneaAnalyticsBuilder _isOnboardedBD](self, "_isOnboardedBD") && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("@max.doubleValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 / 3600.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_minTimeBetweenBDSessionsPastNight:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  if (-[HDSPSleepApneaAnalyticsBuilder _isOnboardedBD](self, "_isOnboardedBD") && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("@min.doubleValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 / 3600.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_timesBetweenBDSessions:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      v5 = 1;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5 - 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "endDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "startDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "timeIntervalSinceDate:", v7);
        if (v10 < 0.0)
          v10 = 0.0;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v5;
      }
      while (objc_msgSend(v3, "count") > v5);
    }
    v12 = (id)objc_msgSend(v4, "copy");

  }
  return v12;
}

- (id)_breathingDisturbanceSamplesInPastNight
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  -[HDSPSleepApneaAnalyticsBuilder breathingDisturbanceSamples](self, "breathingDisturbanceSamples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return objc_alloc_init(MEMORY[0x24BDBCE30]);
  v4 = -[HDSPSleepApneaAnalyticsBuilder morningIndexRange](self, "morningIndexRange");
  if (v5 <= 0)
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = v5 + v4 - 1;
  -[HDSPSleepApneaAnalyticsBuilder breathingDisturbanceSamples](self, "breathingDisturbanceSamples");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__HDSPSleepApneaAnalyticsBuilder__breathingDisturbanceSamplesInPastNight__block_invoke;
  v10[3] = &unk_24D4E3658;
  v10[4] = self;
  v10[5] = v6;
  objc_msgSend(v7, "hk_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __73__HDSPSleepApneaAnalyticsBuilder__breathingDisturbanceSamplesInPastNight__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gregorianCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hk_morningIndexWithCalendar:", v4) == *(_QWORD *)(a1 + 40);

  return v5;
}

- (NSArray)breathingDisturbanceSamples
{
  return self->_breathingDisturbanceSamples;
}

- (HKFeatureStatus)sleepApneaFeatureStatus
{
  return self->_sleepApneaFeatureStatus;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_morningIndexRange.duration;
  start = self->_morningIndexRange.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_sleepApneaFeatureStatus, 0);
  objc_storeStrong((id *)&self->_breathingDisturbanceSamples, 0);
}

@end
