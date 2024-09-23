@implementation RTMapItemProviderReverseGeocodeParameters

- (RTMapItemProviderReverseGeocodeParameters)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithConfidence_relatedPlacesConfidence_);
}

- (RTMapItemProviderReverseGeocodeParameters)initWithConfidence:(double)a3 relatedPlacesConfidence:(double)a4
{
  RTMapItemProviderReverseGeocodeParameters *v7;
  RTMapItemProviderReverseGeocodeParameters *v8;
  NSObject *v9;
  const char *v10;
  objc_super v12;
  uint8_t buf[16];

  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v8 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: RTCommonValidConfidence(confidence)";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    goto LABEL_9;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: RTCommonValidConfidence(relatedPlacesConfidence)";
    goto LABEL_12;
  }
  v12.receiver = self;
  v12.super_class = (Class)RTMapItemProviderReverseGeocodeParameters;
  v7 = -[RTMapItemProviderReverseGeocodeParameters init](&v12, sel_init);
  if (v7)
  {
    v7->_confidence = a3;
    v7->_relatedPlacesConfidence = a4;
  }
  self = v7;
  v8 = self;
LABEL_10:

  return v8;
}

- (RTMapItemProviderReverseGeocodeParameters)initWithDefaultsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  RTMapItemProviderReverseGeocodeParameters *v12;
  NSObject *v13;
  uint8_t v15[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsMapItemProviderReverseGeocodeConfidence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = 0.4;
    v8 = 0.4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      v8 = v9;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderReverseGeocodeRelatedPlacesConfidence"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      v7 = v11;
    }
    self = -[RTMapItemProviderReverseGeocodeParameters initWithConfidence:relatedPlacesConfidence:](self, "initWithConfidence:relatedPlacesConfidence:", v8, v7);

    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v15, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("confidence, %.3f, relatedPlacesConfidence, %.3f"), *(_QWORD *)&self->_confidence, *(_QWORD *)&self->_relatedPlacesConfidence);
}

- (double)confidence
{
  return self->_confidence;
}

- (double)relatedPlacesConfidence
{
  return self->_relatedPlacesConfidence;
}

@end
