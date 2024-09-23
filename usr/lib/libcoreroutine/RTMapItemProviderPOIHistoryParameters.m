@implementation RTMapItemProviderPOIHistoryParameters

- (RTMapItemProviderPOIHistoryParameters)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceThreshold_);
}

- (RTMapItemProviderPOIHistoryParameters)initWithDistanceThreshold:(double)a3
{
  RTMapItemProviderPOIHistoryParameters *v3;
  RTMapItemProviderPOIHistoryParameters *v5;
  RTMapItemProviderPOIHistoryParameters *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[16];

  v3 = self;
  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceThreshold > 0", buf, 2u);
    }

    v6 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)RTMapItemProviderPOIHistoryParameters;
    v5 = -[RTMapItemProviderPOIHistoryParameters init](&v9, sel_init);
    if (v5)
      v5->_distanceThreshold = a3;
    v3 = v5;
    v6 = v3;
  }

  return v6;
}

- (RTMapItemProviderPOIHistoryParameters)initWithDefaultsManager:(id)a3
{
  void *v4;
  double v5;
  NSObject *v6;
  RTMapItemProviderPOIHistoryParameters *v7;
  uint8_t v9[16];

  if (a3)
  {
    objc_msgSend(a3, "objectForKey:", CFSTR("RTDefaultsMapItemProviderPOIHistoryDistanceThreshold"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "doubleValue");
    else
      v5 = 250.0;
    self = -[RTMapItemProviderPOIHistoryParameters initWithDistanceThreshold:](self, "initWithDistanceThreshold:", v5);

    v7 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v9, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("distanceThreshold, %.3f"), *(_QWORD *)&self->_distanceThreshold);
}

- (double)distanceThreshold
{
  return self->_distanceThreshold;
}

@end
