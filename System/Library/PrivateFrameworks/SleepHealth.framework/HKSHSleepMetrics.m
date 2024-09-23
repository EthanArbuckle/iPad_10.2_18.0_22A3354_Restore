@implementation HKSHSleepMetrics

+ (id)sleepMetricsWithMorningIndexRange:(id)a3 sleepAnalysisAsleepCount:(int64_t)a4 sleepAnalysisInBedCount:(int64_t)a5 sleepAnalysisCount:(int64_t)a6 averageSleepDuration:(id)a7 averageInBedDuration:(id)a8 averageREMSleepDuration:(id)a9 averageCoreSleepDuration:(id)a10 averageDeepSleepDuration:(id)a11 averageUnspecifiedSleepDuration:(id)a12 averageAwakeDuration:(id)a13 bedtimeAchievedCount:(int64_t)a14 sleepDurationGoalAchievedCount:(int64_t)a15 sleepDurationGoalStreakCount:(int64_t)a16 averageBedtimeMiss:(id)a17 averageSleepDurationGoalMiss:(id)a18 averageBedtime:(id)a19 averageWakeTime:(id)a20 averageInBedStartTime:(id)a21 averageInBedEndTime:(id)a22 averageSleepStartTime:(id)a23 averageSleepEndTime:(id)a24 standardDeviationActualTimeAsleep:(id)a25 standardDeviationScheduledTimeAsleep:(id)a26 standardDeviationActualVsScheduledTimeAsleep:(id)a27
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  HKSHSleepMetrics *v35;
  uint64_t v36;
  HKQuantity *averageSleepDuration;
  uint64_t v38;
  HKQuantity *averageInBedDuration;
  uint64_t v40;
  HKQuantity *averageREMSleepDuration;
  uint64_t v42;
  HKQuantity *averageCoreSleepDuration;
  uint64_t v44;
  HKQuantity *averageDeepSleepDuration;
  uint64_t v46;
  HKQuantity *averageUnspecifiedSleepDuration;
  uint64_t v48;
  HKQuantity *averageAwakeDuration;
  uint64_t v50;
  HKQuantity *averageBedtimeMiss;
  uint64_t v52;
  HKQuantity *averageSleepDurationGoalMiss;
  uint64_t v54;
  NSDateComponents *averageBedtime;
  uint64_t v56;
  NSDateComponents *averageWakeTime;
  uint64_t v58;
  NSDateComponents *averageInBedStartTime;
  uint64_t v60;
  NSDateComponents *averageInBedEndTime;
  uint64_t v62;
  NSDateComponents *averageSleepStartTime;
  uint64_t v64;
  NSDateComponents *averageSleepEndTime;
  uint64_t v66;
  NSNumber *standardDeviationActualTimeAsleep;
  uint64_t v68;
  NSNumber *standardDeviationScheduledTimeAsleep;
  uint64_t v70;
  NSNumber *standardDeviationActualVsScheduledTimeAsleep;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;

  v87 = a27;
  v86 = a26;
  v85 = a25;
  v84 = a24;
  v83 = a23;
  v82 = a22;
  v81 = a21;
  v80 = a20;
  v79 = a19;
  v78 = a18;
  v27 = a17;
  v28 = a13;
  v29 = a12;
  v30 = a11;
  v31 = a10;
  v32 = a9;
  v33 = a8;
  v34 = a7;
  v35 = objc_alloc_init(HKSHSleepMetrics);
  v35->_morningIndexRange = ($BB81632A5F90EABF970498852D8C14B8)a3;
  v35->_sleepAnalysisAsleepCount = a4;
  v35->_sleepAnalysisInBedCount = a5;
  v35->_sleepAnalysisCount = a6;
  v36 = objc_msgSend(v34, "copy");

  averageSleepDuration = v35->_averageSleepDuration;
  v35->_averageSleepDuration = (HKQuantity *)v36;

  v38 = objc_msgSend(v33, "copy");
  averageInBedDuration = v35->_averageInBedDuration;
  v35->_averageInBedDuration = (HKQuantity *)v38;

  v40 = objc_msgSend(v32, "copy");
  averageREMSleepDuration = v35->_averageREMSleepDuration;
  v35->_averageREMSleepDuration = (HKQuantity *)v40;

  v42 = objc_msgSend(v31, "copy");
  averageCoreSleepDuration = v35->_averageCoreSleepDuration;
  v35->_averageCoreSleepDuration = (HKQuantity *)v42;

  v44 = objc_msgSend(v30, "copy");
  averageDeepSleepDuration = v35->_averageDeepSleepDuration;
  v35->_averageDeepSleepDuration = (HKQuantity *)v44;

  v46 = objc_msgSend(v29, "copy");
  averageUnspecifiedSleepDuration = v35->_averageUnspecifiedSleepDuration;
  v35->_averageUnspecifiedSleepDuration = (HKQuantity *)v46;

  v48 = objc_msgSend(v28, "copy");
  averageAwakeDuration = v35->_averageAwakeDuration;
  v35->_averageAwakeDuration = (HKQuantity *)v48;

  *(_OWORD *)&v35->_bedtimeAchievedCount = *(_OWORD *)&a14;
  v35->_sleepDurationGoalStreakCount = a16;
  v50 = objc_msgSend(v27, "copy");

  averageBedtimeMiss = v35->_averageBedtimeMiss;
  v35->_averageBedtimeMiss = (HKQuantity *)v50;

  v52 = objc_msgSend(v78, "copy");
  averageSleepDurationGoalMiss = v35->_averageSleepDurationGoalMiss;
  v35->_averageSleepDurationGoalMiss = (HKQuantity *)v52;

  v54 = objc_msgSend(v79, "copy");
  averageBedtime = v35->_averageBedtime;
  v35->_averageBedtime = (NSDateComponents *)v54;

  v56 = objc_msgSend(v80, "copy");
  averageWakeTime = v35->_averageWakeTime;
  v35->_averageWakeTime = (NSDateComponents *)v56;

  v58 = objc_msgSend(v81, "copy");
  averageInBedStartTime = v35->_averageInBedStartTime;
  v35->_averageInBedStartTime = (NSDateComponents *)v58;

  v60 = objc_msgSend(v82, "copy");
  averageInBedEndTime = v35->_averageInBedEndTime;
  v35->_averageInBedEndTime = (NSDateComponents *)v60;

  v62 = objc_msgSend(v83, "copy");
  averageSleepStartTime = v35->_averageSleepStartTime;
  v35->_averageSleepStartTime = (NSDateComponents *)v62;

  v64 = objc_msgSend(v84, "copy");
  averageSleepEndTime = v35->_averageSleepEndTime;
  v35->_averageSleepEndTime = (NSDateComponents *)v64;

  v66 = objc_msgSend(v85, "copy");
  standardDeviationActualTimeAsleep = v35->_standardDeviationActualTimeAsleep;
  v35->_standardDeviationActualTimeAsleep = (NSNumber *)v66;

  v68 = objc_msgSend(v86, "copy");
  standardDeviationScheduledTimeAsleep = v35->_standardDeviationScheduledTimeAsleep;
  v35->_standardDeviationScheduledTimeAsleep = (NSNumber *)v68;

  v70 = objc_msgSend(v87, "copy");
  standardDeviationActualVsScheduledTimeAsleep = v35->_standardDeviationActualVsScheduledTimeAsleep;
  v35->_standardDeviationActualVsScheduledTimeAsleep = (NSNumber *)v70;

  return v35;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t start;
  id v5;

  start = self->_morningIndexRange.start;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", start, CFSTR("morningIndexRangeStart"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_morningIndexRange.duration, CFSTR("morningIndexRangeDuration"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sleepAnalysisAsleepCount, CFSTR("sleepAnalysisAsleepCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sleepAnalysisInBedCount, CFSTR("sleepAnalysisInBedCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sleepAnalysisCount, CFSTR("sleepAnalysisCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageSleepDuration, CFSTR("averageSleepDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageInBedDuration, CFSTR("averageInBedDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageREMSleepDuration, CFSTR("averageREMSleepDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageCoreSleepDuration, CFSTR("averageCoreSleepDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageDeepSleepDuration, CFSTR("averageDeepSleepDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageUnspecifiedSleepDuration, CFSTR("averageUnspecifiedSleepDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageAwakeDuration, CFSTR("averageAwakeDuration"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bedtimeAchievedCount, CFSTR("bedtimeAchievedCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sleepDurationGoalAchievedCount, CFSTR("sleepDurationGoalAchievedCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sleepDurationGoalStreakCount, CFSTR("sleepDurationGoalStreakCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageBedtimeMiss, CFSTR("averageBedtimeMiss"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageSleepDurationGoalMiss, CFSTR("averageSleepDurationGoalMiss"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageBedtime, CFSTR("averageBedtime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageWakeTime, CFSTR("averageWakeTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageInBedStartTime, CFSTR("averageInBedStartTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageInBedEndTime, CFSTR("averageInBedEndTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageSleepStartTime, CFSTR("averageSleepStartTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageSleepEndTime, CFSTR("averageSleepEndTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_standardDeviationActualTimeAsleep, CFSTR("standardDeviationActualTimeAsleep"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_standardDeviationScheduledTimeAsleep, CFSTR("standardDeviationScheduledTimeAsleep"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_standardDeviationActualVsScheduledTimeAsleep, CFSTR("standardDeviationActualVsScheduledTimeAsleep"));

}

- (HKSHSleepMetrics)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  HKSHSleepMetrics *v29;
  void *v31;
  void *v32;
  void *v33;

  v3 = a3;
  v28 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("morningIndexRangeStart"));
  v27 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("morningIndexRangeDuration"));
  v26 = (void *)objc_opt_class();
  v25 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sleepAnalysisAsleepCount"));
  v24 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sleepAnalysisInBedCount"));
  v23 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sleepAnalysisCount"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageSleepDuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageInBedDuration"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageREMSleepDuration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageCoreSleepDuration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageDeepSleepDuration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageUnspecifiedSleepDuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageAwakeDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("bedtimeAchievedCount"));
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sleepDurationGoalAchievedCount"));
  v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sleepDurationGoalStreakCount"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageBedtimeMiss"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageSleepDurationGoalMiss"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageBedtime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageWakeTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageInBedStartTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageInBedEndTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageSleepStartTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averageSleepEndTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("standardDeviationActualTimeAsleep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("standardDeviationScheduledTimeAsleep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("standardDeviationActualVsScheduledTimeAsleep"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "sleepMetricsWithMorningIndexRange:sleepAnalysisAsleepCount:sleepAnalysisInBedCount:sleepAnalysisCount:averageSleepDuration:averageInBedDuration:averageREMSleepDuration:averageCoreSleepDuration:averageDeepSleepDuration:averageUnspecifiedSleepDuration:averageAwakeDuration:bedtimeAchievedCount:sleepDurationGoalAchievedCount:sleepDurationGoalStreakCount:averageBedtimeMiss:averageSleepDurationGoalMiss:averageBedtime:averageWakeTime:averageInBedStartTime:averageInBedEndTime:averageSleepStartTime:averageSleepEndTime:standardDeviationActualTimeAsleep:standardDeviationScheduledTimeAsleep:standardDeviationActualVsScheduledTimeAsleep:", v28, v27, v25, v24, v23, v22, v33, v21, v19, v16, v15, v14,
    v20,
    v18,
    v17,
    v32,
    v31,
    v13,
    v12,
    v11,
    v10,
    v9,
    v4,
    v5,
    v6,
    v7);
  v29 = (HKSHSleepMetrics *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  HKSHSleepMetrics *v4;
  HKSHSleepMetrics *v5;
  HKSHSleepMetrics *v6;
  HKQuantity *averageSleepDuration;
  HKQuantity *v8;
  HKQuantity *averageInBedDuration;
  HKQuantity *v10;
  HKQuantity *averageREMSleepDuration;
  HKQuantity *v12;
  HKQuantity *averageCoreSleepDuration;
  HKQuantity *v14;
  HKQuantity *averageDeepSleepDuration;
  HKQuantity *v16;
  HKQuantity *averageUnspecifiedSleepDuration;
  HKQuantity *v18;
  HKQuantity *averageAwakeDuration;
  HKQuantity *v20;
  HKQuantity *averageBedtimeMiss;
  HKQuantity *v22;
  HKQuantity *averageSleepDurationGoalMiss;
  HKQuantity *v24;
  NSDateComponents *averageBedtime;
  NSDateComponents *v26;
  NSDateComponents *averageWakeTime;
  NSDateComponents *v28;
  NSDateComponents *averageInBedStartTime;
  NSDateComponents *v30;
  NSDateComponents *averageInBedEndTime;
  NSDateComponents *v32;
  NSDateComponents *averageSleepStartTime;
  NSDateComponents *v34;
  NSDateComponents *averageSleepEndTime;
  NSDateComponents *v36;
  NSNumber *standardDeviationActualTimeAsleep;
  NSNumber *v38;
  NSNumber *standardDeviationScheduledTimeAsleep;
  NSNumber *v40;
  NSNumber *standardDeviationActualVsScheduledTimeAsleep;
  NSNumber *v42;
  char v43;

  v4 = (HKSHSleepMetrics *)a3;
  if (self == v4)
  {
    v43 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_morningIndexRange.start != v5->_morningIndexRange.start)
        goto LABEL_67;
      if (self->_morningIndexRange.duration != v5->_morningIndexRange.duration)
        goto LABEL_67;
      if (self->_sleepAnalysisAsleepCount != v5->_sleepAnalysisAsleepCount)
        goto LABEL_67;
      if (self->_sleepAnalysisInBedCount != v5->_sleepAnalysisInBedCount)
        goto LABEL_67;
      if (self->_sleepAnalysisCount != v5->_sleepAnalysisCount)
        goto LABEL_67;
      averageSleepDuration = self->_averageSleepDuration;
      v8 = v6->_averageSleepDuration;
      if (averageSleepDuration != v8
        && (!v8 || !-[HKQuantity isEqual:](averageSleepDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageInBedDuration = self->_averageInBedDuration;
      v10 = v6->_averageInBedDuration;
      if (averageInBedDuration != v10
        && (!v10 || !-[HKQuantity isEqual:](averageInBedDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageREMSleepDuration = self->_averageREMSleepDuration;
      v12 = v6->_averageREMSleepDuration;
      if (averageREMSleepDuration != v12
        && (!v12 || !-[HKQuantity isEqual:](averageREMSleepDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageCoreSleepDuration = self->_averageCoreSleepDuration;
      v14 = v6->_averageCoreSleepDuration;
      if (averageCoreSleepDuration != v14
        && (!v14 || !-[HKQuantity isEqual:](averageCoreSleepDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageDeepSleepDuration = self->_averageDeepSleepDuration;
      v16 = v6->_averageDeepSleepDuration;
      if (averageDeepSleepDuration != v16
        && (!v16 || !-[HKQuantity isEqual:](averageDeepSleepDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageUnspecifiedSleepDuration = self->_averageUnspecifiedSleepDuration;
      v18 = v6->_averageUnspecifiedSleepDuration;
      if (averageUnspecifiedSleepDuration != v18
        && (!v18 || !-[HKQuantity isEqual:](averageUnspecifiedSleepDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageAwakeDuration = self->_averageAwakeDuration;
      v20 = v6->_averageAwakeDuration;
      if (averageAwakeDuration != v20
        && (!v20 || !-[HKQuantity isEqual:](averageAwakeDuration, "isEqual:")))
      {
        goto LABEL_67;
      }
      if (self->_bedtimeAchievedCount != v6->_bedtimeAchievedCount)
        goto LABEL_67;
      if (self->_sleepDurationGoalAchievedCount != v6->_sleepDurationGoalAchievedCount)
        goto LABEL_67;
      if (self->_sleepDurationGoalStreakCount != v6->_sleepDurationGoalStreakCount)
        goto LABEL_67;
      averageBedtimeMiss = self->_averageBedtimeMiss;
      v22 = v6->_averageBedtimeMiss;
      if (averageBedtimeMiss != v22 && (!v22 || !-[HKQuantity isEqual:](averageBedtimeMiss, "isEqual:")))
        goto LABEL_67;
      averageSleepDurationGoalMiss = self->_averageSleepDurationGoalMiss;
      v24 = v6->_averageSleepDurationGoalMiss;
      if (averageSleepDurationGoalMiss != v24
        && (!v24 || !-[HKQuantity isEqual:](averageSleepDurationGoalMiss, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageBedtime = self->_averageBedtime;
      v26 = v6->_averageBedtime;
      if (averageBedtime != v26 && (!v26 || !-[NSDateComponents isEqual:](averageBedtime, "isEqual:")))
        goto LABEL_67;
      averageWakeTime = self->_averageWakeTime;
      v28 = v6->_averageWakeTime;
      if (averageWakeTime != v28 && (!v28 || !-[NSDateComponents isEqual:](averageWakeTime, "isEqual:")))
        goto LABEL_67;
      averageInBedStartTime = self->_averageInBedStartTime;
      v30 = v6->_averageInBedStartTime;
      if (averageInBedStartTime != v30
        && (!v30 || !-[NSDateComponents isEqual:](averageInBedStartTime, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageInBedEndTime = self->_averageInBedEndTime;
      v32 = v6->_averageInBedEndTime;
      if (averageInBedEndTime != v32
        && (!v32 || !-[NSDateComponents isEqual:](averageInBedEndTime, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageSleepStartTime = self->_averageSleepStartTime;
      v34 = v6->_averageSleepStartTime;
      if (averageSleepStartTime != v34
        && (!v34 || !-[NSDateComponents isEqual:](averageSleepStartTime, "isEqual:")))
      {
        goto LABEL_67;
      }
      averageSleepEndTime = self->_averageSleepEndTime;
      v36 = v6->_averageSleepEndTime;
      if (averageSleepEndTime != v36
        && (!v36 || !-[NSDateComponents isEqual:](averageSleepEndTime, "isEqual:")))
      {
        goto LABEL_67;
      }
      standardDeviationActualTimeAsleep = self->_standardDeviationActualTimeAsleep;
      v38 = v6->_standardDeviationActualTimeAsleep;
      if (standardDeviationActualTimeAsleep != v38
        && (!v38 || !-[NSNumber isEqual:](standardDeviationActualTimeAsleep, "isEqual:")))
      {
        goto LABEL_67;
      }
      standardDeviationScheduledTimeAsleep = self->_standardDeviationScheduledTimeAsleep;
      v40 = v6->_standardDeviationScheduledTimeAsleep;
      if (standardDeviationScheduledTimeAsleep != v40
        && (!v40 || !-[NSNumber isEqual:](standardDeviationScheduledTimeAsleep, "isEqual:")))
      {
        goto LABEL_67;
      }
      standardDeviationActualVsScheduledTimeAsleep = self->_standardDeviationActualVsScheduledTimeAsleep;
      v42 = v6->_standardDeviationActualVsScheduledTimeAsleep;
      if (standardDeviationActualVsScheduledTimeAsleep == v42)
      {
        v43 = 1;
        goto LABEL_68;
      }
      if (v42)
        v43 = -[NSNumber isEqual:](standardDeviationActualVsScheduledTimeAsleep, "isEqual:");
      else
LABEL_67:
        v43 = 0;
LABEL_68:

      goto LABEL_69;
    }
    v43 = 0;
  }
LABEL_69:

  return v43;
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

- (int64_t)sleepAnalysisAsleepCount
{
  return self->_sleepAnalysisAsleepCount;
}

- (int64_t)sleepAnalysisInBedCount
{
  return self->_sleepAnalysisInBedCount;
}

- (int64_t)sleepAnalysisCount
{
  return self->_sleepAnalysisCount;
}

- (HKQuantity)averageSleepDuration
{
  return self->_averageSleepDuration;
}

- (HKQuantity)averageInBedDuration
{
  return self->_averageInBedDuration;
}

- (HKQuantity)averageREMSleepDuration
{
  return self->_averageREMSleepDuration;
}

- (HKQuantity)averageCoreSleepDuration
{
  return self->_averageCoreSleepDuration;
}

- (HKQuantity)averageDeepSleepDuration
{
  return self->_averageDeepSleepDuration;
}

- (HKQuantity)averageUnspecifiedSleepDuration
{
  return self->_averageUnspecifiedSleepDuration;
}

- (HKQuantity)averageAwakeDuration
{
  return self->_averageAwakeDuration;
}

- (int64_t)bedtimeAchievedCount
{
  return self->_bedtimeAchievedCount;
}

- (int64_t)sleepDurationGoalAchievedCount
{
  return self->_sleepDurationGoalAchievedCount;
}

- (int64_t)sleepDurationGoalStreakCount
{
  return self->_sleepDurationGoalStreakCount;
}

- (HKQuantity)averageBedtimeMiss
{
  return self->_averageBedtimeMiss;
}

- (HKQuantity)averageSleepDurationGoalMiss
{
  return self->_averageSleepDurationGoalMiss;
}

- (NSDateComponents)averageBedtime
{
  return self->_averageBedtime;
}

- (NSDateComponents)averageWakeTime
{
  return self->_averageWakeTime;
}

- (NSDateComponents)averageInBedStartTime
{
  return self->_averageInBedStartTime;
}

- (NSDateComponents)averageInBedEndTime
{
  return self->_averageInBedEndTime;
}

- (NSDateComponents)averageSleepStartTime
{
  return self->_averageSleepStartTime;
}

- (NSDateComponents)averageSleepEndTime
{
  return self->_averageSleepEndTime;
}

- (NSNumber)standardDeviationActualTimeAsleep
{
  return self->_standardDeviationActualTimeAsleep;
}

- (NSNumber)standardDeviationScheduledTimeAsleep
{
  return self->_standardDeviationScheduledTimeAsleep;
}

- (NSNumber)standardDeviationActualVsScheduledTimeAsleep
{
  return self->_standardDeviationActualVsScheduledTimeAsleep;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardDeviationActualVsScheduledTimeAsleep, 0);
  objc_storeStrong((id *)&self->_standardDeviationScheduledTimeAsleep, 0);
  objc_storeStrong((id *)&self->_standardDeviationActualTimeAsleep, 0);
  objc_storeStrong((id *)&self->_averageSleepEndTime, 0);
  objc_storeStrong((id *)&self->_averageSleepStartTime, 0);
  objc_storeStrong((id *)&self->_averageInBedEndTime, 0);
  objc_storeStrong((id *)&self->_averageInBedStartTime, 0);
  objc_storeStrong((id *)&self->_averageWakeTime, 0);
  objc_storeStrong((id *)&self->_averageBedtime, 0);
  objc_storeStrong((id *)&self->_averageSleepDurationGoalMiss, 0);
  objc_storeStrong((id *)&self->_averageBedtimeMiss, 0);
  objc_storeStrong((id *)&self->_averageAwakeDuration, 0);
  objc_storeStrong((id *)&self->_averageUnspecifiedSleepDuration, 0);
  objc_storeStrong((id *)&self->_averageDeepSleepDuration, 0);
  objc_storeStrong((id *)&self->_averageCoreSleepDuration, 0);
  objc_storeStrong((id *)&self->_averageREMSleepDuration, 0);
  objc_storeStrong((id *)&self->_averageInBedDuration, 0);
  objc_storeStrong((id *)&self->_averageSleepDuration, 0);
}

@end
