@implementation RTVisitPipelineMotionAccumulator

+ (BOOL)isActivityTypeMotionTrimmable:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (RTVisitPipelineMotionAccumulator)initWithParams:(id)a3 processInReverse:(BOOL)a4
{
  id v7;
  NSObject *v8;
  RTVisitPipelineMotionAccumulator *v9;
  RTVisitPipelineMotionAccumulator *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTVisitPipelineMotionAccumulator initWithParams:processInReverse:]";
      v15 = 1024;
      v16 = 25;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: motionAccumulatorParams (in %s:%d)", buf, 0x12u);
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)RTVisitPipelineMotionAccumulator;
  v9 = -[RTVisitPipelineMotionAccumulator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_params, a3);
    v10->_processActivitiesReverse = a4;
    v10->_foundIntervalToTrim = 0;
    v10->_runningScoreHighConfidence = 0.0;
    v10->_runningScoreMediumConfidence = 0.0;
  }

  return v10;
}

- (void)processMotionActivity:(id)a3
{
  id v5;
  void *v6;
  RTMotionActivity **p_lastObservedMotionActivity;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSDate *v13;
  NSDate *intervalStartDate;
  double v15;
  NSDate *v16;
  double runningScoreMediumConfidence;
  double runningScoreHighConfidence;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  _BOOL4 processActivitiesReverse;
  void *v24;
  void *v25;
  int v26;
  _BYTE v27[14];
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!self->_foundIntervalToTrim)
  {
    p_lastObservedMotionActivity = &self->_lastObservedMotionActivity;
    if (self->_lastObservedMotionActivity)
    {
      objc_msgSend(v5, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMotionActivity startDate](self->_lastObservedMotionActivity, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v9);
      v11 = v10;

      if (self->_processActivitiesReverse)
        v11 = -v11;
      if (v11 < 0.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          processActivitiesReverse = self->_processActivitiesReverse;
          -[RTMotionActivity startDate](self->_lastObservedMotionActivity, "startDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "startDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 67110146;
          *(_DWORD *)v27 = processActivitiesReverse;
          *(_WORD *)&v27[4] = 2112;
          *(_QWORD *)&v27[6] = v24;
          v28 = 2112;
          v29 = v25;
          v30 = 2080;
          v31 = "-[RTVisitPipelineMotionAccumulator processMotionActivity:]";
          v32 = 1024;
          v33 = 63;
          _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Observed motion activity is out of expected order. Running in reverse: %u. Previous time %@, current time %@ (in %s:%d)", (uint8_t *)&v26, 0x2Cu);

        }
      }
      if (+[RTVisitPipelineMotionAccumulator isActivityTypeMotionTrimmable:](RTVisitPipelineMotionAccumulator, "isActivityTypeMotionTrimmable:", -[RTMotionActivity type](*p_lastObservedMotionActivity, "type")))
      {
        if ((unint64_t)-[RTMotionActivity confidence](*p_lastObservedMotionActivity, "confidence") >= 2)
        {
          if (!self->_intervalStartDate)
          {
            -[RTMotionActivity startDate](self->_lastObservedMotionActivity, "startDate");
            v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
            intervalStartDate = self->_intervalStartDate;
            self->_intervalStartDate = v13;

          }
          if (-[RTMotionActivity confidence](*p_lastObservedMotionActivity, "confidence") == 2)
          {
            self->_runningScoreMediumConfidence = v11 + self->_runningScoreMediumConfidence;
          }
          else if (-[RTMotionActivity confidence](*p_lastObservedMotionActivity, "confidence") == 3)
          {
            self->_runningScoreHighConfidence = v11 + self->_runningScoreHighConfidence;
          }
        }
      }
      else
      {
        -[RTVisitPipelineMotionAccumulatorParams maxAllowedGapBetweenActiveMotionStates](self->_params, "maxAllowedGapBetweenActiveMotionStates");
        if (v11 > v15)
        {
          self->_runningScoreHighConfidence = 0.0;
          self->_runningScoreMediumConfidence = 0.0;
          v16 = self->_intervalStartDate;
          self->_intervalStartDate = 0;

        }
      }
      runningScoreMediumConfidence = self->_runningScoreMediumConfidence;
      -[RTVisitPipelineMotionAccumulatorParams minMotionDurationAtMediumConfidence](self->_params, "minMotionDurationAtMediumConfidence");
      runningScoreHighConfidence = self->_runningScoreHighConfidence;
      v20 = runningScoreMediumConfidence / v19;
      -[RTVisitPipelineMotionAccumulatorParams minMotionDurationAtHighConfidence](self->_params, "minMotionDurationAtHighConfidence");
      if (v20 + runningScoreHighConfidence / v21 >= 1.0)
      {
        self->_foundIntervalToTrim = 1;
        if (!self->_intervalStartDate)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v26 = 136315394;
            *(_QWORD *)v27 = "-[RTVisitPipelineMotionAccumulator processMotionActivity:]";
            *(_WORD *)&v27[8] = 1024;
            *(_DWORD *)&v27[10] = 93;
            _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Interval start not set (in %s:%d)", (uint8_t *)&v26, 0x12u);
          }

        }
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_lastObservedMotionActivity, a3);
      if (!+[RTVisitPipelineMotionAccumulator isActivityTypeMotionTrimmable:](RTVisitPipelineMotionAccumulator, "isActivityTypeMotionTrimmable:", objc_msgSend(v6, "type")))goto LABEL_25;
    }
    objc_storeStrong((id *)p_lastObservedMotionActivity, a3);
  }
LABEL_25:

}

- (void)finishMotionObservations:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0D18400];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithType:confidence:startDate:", 0, 2, v5);

  -[RTVisitPipelineMotionAccumulator processMotionActivity:](self, "processMotionActivity:", v6);
}

- (id)getTrimDate
{
  if (self->_foundIntervalToTrim)
    return self->_intervalStartDate;
  else
    return 0;
}

- (RTVisitPipelineMotionAccumulatorParams)params
{
  return self->_params;
}

- (BOOL)processActivitiesReverse
{
  return self->_processActivitiesReverse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_lastObservedMotionActivity, 0);
  objc_storeStrong((id *)&self->_intervalStartDate, 0);
}

@end
