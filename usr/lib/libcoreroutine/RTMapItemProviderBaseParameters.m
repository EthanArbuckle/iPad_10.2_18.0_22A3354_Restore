@implementation RTMapItemProviderBaseParameters

- (RTMapItemProviderBaseParameters)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTMapItemProviderBaseParameters)initWithLocationUncertaintyMax:(double)a3 locationUncertaintyMin:(double)a4 mapItemUncertaintyMax:(double)a5 mapItemUncertaintyMin:(double)a6
{
  RTMapItemProviderBaseParameters *v6;
  NSObject *v9;
  const char *v10;
  RTMapItemProviderBaseParameters *v13;
  RTMapItemProviderBaseParameters *v15;
  objc_super v16;
  uint8_t buf[16];

  v6 = self;
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid parameter not satisfying: locationUncertaintyMin > 0.0";
      goto LABEL_7;
    }
LABEL_13:

    v13 = 0;
    goto LABEL_14;
  }
  if (a3 < a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid parameter not satisfying: locationUncertaintyMax >= locationUncertaintyMin";
LABEL_7:
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (a6 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: mapItemUncertaintyMin > 0.0";
    goto LABEL_7;
  }
  if (a5 < a6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: mapItemUncertaintyMax >= mapItemUncertaintyMin";
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTMapItemProviderBaseParameters;
  v15 = -[RTMapItemProviderBaseParameters init](&v16, sel_init);
  if (v15)
  {
    v15->_locationUncertaintyMax = a3;
    v15->_locationUncertaintyMin = a4;
    v15->_mapItemUncertaintyMax = a5;
    v15->_mapItemUncertaintyMin = a6;
  }
  v6 = v15;
  v13 = v6;
LABEL_14:

  return v13;
}

- (RTMapItemProviderBaseParameters)initWithDefaultsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  RTMapItemProviderBaseParameters *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  char isKindOfClass;
  double v19;
  double v20;
  uint8_t v22[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBaseLocationUncertaintyMax"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      v8 = v7;
    }
    else
    {
      v8 = 200.0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBaseLocationUncertaintyMin"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = 1.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "doubleValue");
      v12 = v13;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBaseMapItemUncertaintyMax"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      v16 = v15;
    }
    else
    {
      v16 = 250.0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBaseMapItemUncertaintyMin"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v19 = 1.0;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v17, "doubleValue");
      v19 = v20;
    }
    self = -[RTMapItemProviderBaseParameters initWithLocationUncertaintyMax:locationUncertaintyMin:mapItemUncertaintyMax:mapItemUncertaintyMin:](self, "initWithLocationUncertaintyMax:locationUncertaintyMin:mapItemUncertaintyMax:mapItemUncertaintyMin:", v8, v12, v16, v19);

    v10 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v22, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (double)locationUncertaintyMax
{
  return self->_locationUncertaintyMax;
}

- (double)locationUncertaintyMin
{
  return self->_locationUncertaintyMin;
}

- (double)mapItemUncertaintyMax
{
  return self->_mapItemUncertaintyMax;
}

- (double)mapItemUncertaintyMin
{
  return self->_mapItemUncertaintyMin;
}

@end
