@implementation RTMapItemProviderProactiveExpertsParameters

- (RTMapItemProviderProactiveExpertsParameters)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithConfidence_);
}

- (RTMapItemProviderProactiveExpertsParameters)initWithConfidence:(double)a3
{
  RTMapItemProviderProactiveExpertsParameters *v5;
  RTMapItemProviderProactiveExpertsParameters *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[16];

  if ((RTCommonValidConfidence() & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)RTMapItemProviderProactiveExpertsParameters;
    v5 = -[RTMapItemProviderProactiveExpertsParameters init](&v9, sel_init);
    if (v5)
      v5->_confidence = a3;
    self = v5;
    v6 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTCommonValidConfidence(confidence)", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (RTMapItemProviderProactiveExpertsParameters)initWithDefaultsManager:(id)a3
{
  void *v4;
  char isKindOfClass;
  double v6;
  RTMapItemProviderProactiveExpertsParameters *v7;
  NSObject *v8;
  uint8_t v10[16];

  if (a3)
  {
    objc_msgSend(a3, "objectForKey:", CFSTR("RTDefaultsMapItemProviderProactiveExpertsConfidenceKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = 0.5;
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v4, "doubleValue", 0.5);
    self = -[RTMapItemProviderProactiveExpertsParameters initWithConfidence:](self, "initWithConfidence:", v6);

    v7 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("confidence, %.3f"), *(_QWORD *)&self->_confidence);
}

- (double)confidence
{
  return self->_confidence;
}

@end
