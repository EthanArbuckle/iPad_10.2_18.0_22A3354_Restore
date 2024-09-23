@implementation RTRelabelerPersisterParameters

- (RTRelabelerPersisterParameters)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMaxCollapseIterations_placeholderCollapseDistanceThreshold_reverseGeocodeLeewayDistance_reverseGeocodePlaceFetchDistanceThreshold_unconcreteLOICollapseDistanceThreshold_visitAdjacencyMergeThreshold_);
}

- (RTRelabelerPersisterParameters)initWithMaxCollapseIterations:(unint64_t)a3 placeholderCollapseDistanceThreshold:(double)a4 reverseGeocodeLeewayDistance:(double)a5 reverseGeocodePlaceFetchDistanceThreshold:(double)a6 unconcreteLOICollapseDistanceThreshold:(double)a7 visitAdjacencyMergeThreshold:(double)a8
{
  RTRelabelerPersisterParameters *v8;
  RTRelabelerPersisterParameters *v15;
  RTRelabelerPersisterParameters *v16;
  NSObject *v17;
  const char *v18;
  objc_super v20;
  uint8_t buf[16];

  v8 = self;
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: placeholderCollapseDistanceThreshold > 0";
LABEL_19:
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_20;
  }
  if (a5 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: reverseGeocodeLeewayDistance > 0";
    goto LABEL_19;
  }
  if (a6 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: reverseGeocodePlaceFetchDistanceThreshold > 0";
    goto LABEL_19;
  }
  if (a7 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: unconcreteLOICollapseDistanceThreshold > 0";
    goto LABEL_19;
  }
  if (a8 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "Invalid parameter not satisfying: visitAdjacencyMergeThreshold > 0";
      goto LABEL_19;
    }
LABEL_20:

    v16 = 0;
    goto LABEL_21;
  }
  v20.receiver = self;
  v20.super_class = (Class)RTRelabelerPersisterParameters;
  v15 = -[RTRelabelerPersisterParameters init](&v20, sel_init);
  if (v15)
  {
    v15->_maxCollapseIterations = a3;
    v15->_placeholderCollapseDistanceThreshold = a4;
    v15->_reverseGeocodeLeewayDistance = a5;
    v15->_reverseGeocodePlaceFetchDistanceThreshold = a6;
    v15->_unconcreteLOICollapseDistanceThreshold = a7;
    v15->_visitAdjacencyMergeThreshold = a8;
  }
  v8 = v15;
  v16 = v8;
LABEL_21:

  return v16;
}

- (RTRelabelerPersisterParameters)initWithDefaultsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  RTRelabelerPersisterParameters *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  char isKindOfClass;
  double v24;
  double v25;
  uint8_t v27[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsRelabelerPersisterMaxCollapseIterations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v6, "unsignedIntegerValue");
    else
      v7 = 3;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerPersisterReverseGeocodeCollapseThreshold"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      v12 = v11;
    }
    else
    {
      v12 = 125.0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerPersisterReverseGeocodeLeewayDistance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "doubleValue");
      v15 = v14;
    }
    else
    {
      v15 = 50.0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerPersisterReverseGeocodePlaceFetchDistanceThreshold"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v17 = 150.0;
    v18 = 150.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "doubleValue");
      v18 = v19;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerPersisterUnconcreteLOICollapseDistanceThreshold"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "doubleValue");
      v17 = v21;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerPersisterVisitAdjacencyMergeThreshold"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v24 = 15.0;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v22, "doubleValue");
      v24 = v25;
    }
    self = -[RTRelabelerPersisterParameters initWithMaxCollapseIterations:placeholderCollapseDistanceThreshold:reverseGeocodeLeewayDistance:reverseGeocodePlaceFetchDistanceThreshold:unconcreteLOICollapseDistanceThreshold:visitAdjacencyMergeThreshold:](self, "initWithMaxCollapseIterations:placeholderCollapseDistanceThreshold:reverseGeocodeLeewayDistance:reverseGeocodePlaceFetchDistanceThreshold:unconcreteLOICollapseDistanceThreshold:visitAdjacencyMergeThreshold:", v7, v12, v15, v18, v17, v24);

    v9 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v27, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("maxCollapseIterations, %lu, placeholderCollapseDistanceThreshold, %.3f, reverseGeocodeLeewayDistance, %.3f, unconcreteLOICollapseDistanceThreshold, %.3f, visitAdjacencyMergeThreshold, %.3f"), self->_maxCollapseIterations, *(_QWORD *)&self->_placeholderCollapseDistanceThreshold, *(_QWORD *)&self->_reverseGeocodeLeewayDistance, *(_QWORD *)&self->_unconcreteLOICollapseDistanceThreshold, *(_QWORD *)&self->_visitAdjacencyMergeThreshold);
}

- (unint64_t)maxCollapseIterations
{
  return self->_maxCollapseIterations;
}

- (double)placeholderCollapseDistanceThreshold
{
  return self->_placeholderCollapseDistanceThreshold;
}

- (double)reverseGeocodeLeewayDistance
{
  return self->_reverseGeocodeLeewayDistance;
}

- (double)reverseGeocodePlaceFetchDistanceThreshold
{
  return self->_reverseGeocodePlaceFetchDistanceThreshold;
}

- (double)unconcreteLOICollapseDistanceThreshold
{
  return self->_unconcreteLOICollapseDistanceThreshold;
}

- (double)visitAdjacencyMergeThreshold
{
  return self->_visitAdjacencyMergeThreshold;
}

@end
