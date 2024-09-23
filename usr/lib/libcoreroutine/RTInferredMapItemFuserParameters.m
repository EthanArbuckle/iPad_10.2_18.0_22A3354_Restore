@implementation RTInferredMapItemFuserParameters

- (RTInferredMapItemFuserParameters)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAoiConsiderThreshold_aoiUseThreshold_confidenceEqualityEpsilon_distanceThreshold_placeholderMultiplier_);
}

- (RTInferredMapItemFuserParameters)initWithAoiConsiderThreshold:(double)a3 aoiUseThreshold:(double)a4 confidenceEqualityEpsilon:(double)a5 distanceThreshold:(double)a6 placeholderMultiplier:(double)a7
{
  NSObject *v13;
  const char *v14;
  RTInferredMapItemFuserParameters *v15;
  RTInferredMapItemFuserParameters *v17;
  objc_super v18;
  uint8_t buf[16];

  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: RTCommonValidConfidence(aoiConsiderThreshold)";
      goto LABEL_16;
    }
LABEL_17:

    v15 = 0;
    goto LABEL_18;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: RTCommonValidConfidence(aoiUseThreshold)";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: RTCommonValidConfidence(confidenceEqualityEpsilon)";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (a6 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: distanceThreshold > 0";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (a7 < 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: placeholderMultiplier >= 1";
LABEL_16:
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTInferredMapItemFuserParameters;
  v17 = -[RTInferredMapItemFuserParameters init](&v18, sel_init);
  if (v17)
  {
    v17->_aoiConsiderThreshold = a3;
    v17->_aoiUseThreshold = a4;
    v17->_confidenceEqualityEpsilon = a5;
    v17->_distanceThreshold = a6;
    v17->_placeholderMultiplier = a7;
  }
  self = v17;
  v15 = self;
LABEL_18:

  return v15;
}

- (RTInferredMapItemFuserParameters)initWithDefaultsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  RTInferredMapItemFuserParameters *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  char isKindOfClass;
  double v22;
  double v23;
  uint8_t v25[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsInferredMapItemFuserAOIConsiderThreshold"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      v8 = v7;
    }
    else
    {
      v8 = 0.3;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsInferredMapItemFuserAOIUseThreshold"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "doubleValue");
      v13 = v12;
    }
    else
    {
      v13 = 0.15;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsInferredMapItemFuserConfidenceEqualityEpsilon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      v16 = v15;
    }
    else
    {
      v16 = 0.01;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsInferredMapItemFuserDistanceThreshold"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "doubleValue");
      v19 = v18;
    }
    else
    {
      v19 = 250.0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsInferredMapItemFuserPlaceholderMultiplier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v22 = 3.0;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v20, "doubleValue");
      v22 = v23;
    }
    self = -[RTInferredMapItemFuserParameters initWithAoiConsiderThreshold:aoiUseThreshold:confidenceEqualityEpsilon:distanceThreshold:placeholderMultiplier:](self, "initWithAoiConsiderThreshold:aoiUseThreshold:confidenceEqualityEpsilon:distanceThreshold:placeholderMultiplier:", v8, v13, v16, v19, v22);

    v10 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v25, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aoiConsiderThreshold, %.3f, aoiUseThreshold, %.3f, confidenceEqualityEpsilon, %.3f, distanceThreshold, %.3f, placeholderMultiplier, %.3f"), *(_QWORD *)&self->_aoiConsiderThreshold, *(_QWORD *)&self->_aoiUseThreshold, *(_QWORD *)&self->_confidenceEqualityEpsilon, *(_QWORD *)&self->_distanceThreshold, *(_QWORD *)&self->_placeholderMultiplier);
}

- (double)aoiConsiderThreshold
{
  return self->_aoiConsiderThreshold;
}

- (double)aoiUseThreshold
{
  return self->_aoiUseThreshold;
}

- (double)confidenceEqualityEpsilon
{
  return self->_confidenceEqualityEpsilon;
}

- (double)distanceThreshold
{
  return self->_distanceThreshold;
}

- (double)placeholderMultiplier
{
  return self->_placeholderMultiplier;
}

@end
