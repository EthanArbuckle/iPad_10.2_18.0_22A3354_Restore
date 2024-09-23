@implementation RTVisitPipelineMotionAccumulatorParams

+ (double)loadParameterFromDefaults:(id)a3 parameterName:(id)a4 defaultValue:(double)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  double v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  double v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a3, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413314;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v8;
      v22 = 2048;
      v23 = a5;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@: Parameter updated: \"%@\", original value, %f, overridden value, %@", (uint8_t *)&v16, 0x34u);

    }
    objc_msgSend(v9, "doubleValue");
    a5 = v14;
  }

  return a5;
}

- (RTVisitPipelineMotionAccumulatorParams)initWithDefaultsManager:(id)a3
{
  id v4;
  RTVisitPipelineMotionAccumulatorParams *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  v5 = -[RTVisitPipelineMotionAccumulatorParams init](self, "init");
  +[RTVisitPipelineMotionAccumulatorParams loadParameterFromDefaults:parameterName:defaultValue:](RTVisitPipelineMotionAccumulatorParams, "loadParameterFromDefaults:parameterName:defaultValue:", v4, CFSTR("RTDefaultsVisitPipelineMotionStateTrimmerTimeToTrim"), v5->_maxTimeToTrim);
  v5->_maxTimeToTrim = v6;
  +[RTVisitPipelineMotionAccumulatorParams loadParameterFromDefaults:parameterName:defaultValue:](RTVisitPipelineMotionAccumulatorParams, "loadParameterFromDefaults:parameterName:defaultValue:", v4, CFSTR("RTDefaultsVisitPipelineMotionStateTrimmerLookOutsideVisit"), v5->_motionLookWindowOutsideVisit);
  v5->_motionLookWindowOutsideVisit = v7;
  +[RTVisitPipelineMotionAccumulatorParams loadParameterFromDefaults:parameterName:defaultValue:](RTVisitPipelineMotionAccumulatorParams, "loadParameterFromDefaults:parameterName:defaultValue:", v4, CFSTR("RTDefaultsVisitPipelineMotionStateTrimmerDurationAtHighConfidence"), v5->_minMotionDurationAtHighConfidence);
  v5->_minMotionDurationAtHighConfidence = v8;
  +[RTVisitPipelineMotionAccumulatorParams loadParameterFromDefaults:parameterName:defaultValue:](RTVisitPipelineMotionAccumulatorParams, "loadParameterFromDefaults:parameterName:defaultValue:", v4, CFSTR("RTDefaultsVisitPipelineMotionStateTrimmerDurationAtMediumConfidence"), v5->_minMotionDurationAtMediumConfidence);
  v5->_minMotionDurationAtMediumConfidence = v9;
  +[RTVisitPipelineMotionAccumulatorParams loadParameterFromDefaults:parameterName:defaultValue:](RTVisitPipelineMotionAccumulatorParams, "loadParameterFromDefaults:parameterName:defaultValue:", v4, CFSTR("RTDefaultsVisitPipelineMotionStateTrimmerMaxAllowedMotionGap"), v5->_maxAllowedGapBetweenActiveMotionStates);
  v11 = v10;

  v5->_maxAllowedGapBetweenActiveMotionStates = v11;
  return v5;
}

- (RTVisitPipelineMotionAccumulatorParams)init
{
  RTVisitPipelineMotionAccumulatorParams *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTVisitPipelineMotionAccumulatorParams;
  result = -[RTVisitPipelineMotionAccumulatorParams init](&v3, sel_init);
  if (result)
  {
    *(int64x2_t *)&result->_maxTimeToTrim = vdupq_n_s64(0x4066800000000000uLL);
    *(_OWORD *)&result->_minMotionDurationAtHighConfidence = xmmword_1D1EED7A0;
    result->_maxAllowedGapBetweenActiveMotionStates = 30.0;
  }
  return result;
}

- (double)maxTimeToTrim
{
  return self->_maxTimeToTrim;
}

- (void)setMaxTimeToTrim:(double)a3
{
  self->_maxTimeToTrim = a3;
}

- (double)motionLookWindowOutsideVisit
{
  return self->_motionLookWindowOutsideVisit;
}

- (void)setMotionLookWindowOutsideVisit:(double)a3
{
  self->_motionLookWindowOutsideVisit = a3;
}

- (double)minMotionDurationAtHighConfidence
{
  return self->_minMotionDurationAtHighConfidence;
}

- (void)setMinMotionDurationAtHighConfidence:(double)a3
{
  self->_minMotionDurationAtHighConfidence = a3;
}

- (double)minMotionDurationAtMediumConfidence
{
  return self->_minMotionDurationAtMediumConfidence;
}

- (void)setMinMotionDurationAtMediumConfidence:(double)a3
{
  self->_minMotionDurationAtMediumConfidence = a3;
}

- (double)maxAllowedGapBetweenActiveMotionStates
{
  return self->_maxAllowedGapBetweenActiveMotionStates;
}

- (void)setMaxAllowedGapBetweenActiveMotionStates:(double)a3
{
  self->_maxAllowedGapBetweenActiveMotionStates = a3;
}

@end
