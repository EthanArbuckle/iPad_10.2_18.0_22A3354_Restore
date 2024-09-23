@implementation RTPredictedLocationsOfInterestCriteria

- (RTPredictedLocationsOfInterestCriteria)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_);
}

- (RTPredictedLocationsOfInterestCriteria)initWithDistanceCalculator:(id)a3
{
  id v5;
  RTPredictedLocationsOfInterestCriteria *v6;
  RTPredictedLocationsOfInterestCriteria *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTPredictedLocationsOfInterestCriteria;
  v6 = -[RTPredictedLocationsOfInterestCriteria init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_distanceCalculator, a3);
    v7->_windowDuration = INFINITY;
    *(_OWORD *)&v7->_minimumDistance = xmmword_1D1EED790;
    v7->_minimumConfidence = 0.0;
  }

  return v7;
}

- (BOOL)evaluatePredictedLocationOfInterest:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  double v7;
  NSObject *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  NSObject *v24;
  RTDistanceCalculator *distanceCalculator;
  RTLocation *referenceLocation;
  double v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  RTLocation *v31;
  BOOL v32;
  double minimumDistance;
  const char *v34;
  double maximumDistance;
  NSObject *v36;
  double v37;
  void *v38;
  const char *v39;
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  double v45;
  __int16 v46;
  NSObject *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_referenceDate)
    goto LABEL_5;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[RTPredictedLocationsOfInterestCriteria evaluatePredictedLocationOfInterest:]";
    v44 = 1024;
    LODWORD(v45) = 48;
    _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _referenceDate (in %s:%d)", buf, 0x12u);
  }

  if (self->_referenceDate)
  {
LABEL_5:
    if (v4)
    {
      -[NSObject locationOfInterest](v4, "locationOfInterest");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[RTPredictedLocationsOfInterestCriteria evaluatePredictedLocationOfInterest:]";
          v44 = 1024;
          LODWORD(v45) = 59;
          _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationOfInterest (in %s:%d)", buf, 0x12u);
        }
        goto LABEL_42;
      }
      if (!self->_referenceLocation)
        goto LABEL_32;
      v7 = fabs(self->_minimumDistance);
      if (v7 >= INFINITY && v7 <= INFINITY && fabs(self->_maximumDistance) == INFINITY)
        goto LABEL_32;
      if (self->_distanceCalculator)
        goto LABEL_15;
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[RTPredictedLocationsOfInterestCriteria evaluatePredictedLocationOfInterest:]";
        v44 = 1024;
        LODWORD(v45) = 68;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _distanceCalculator (in %s:%d)", buf, 0x12u);
      }

      if (self->_distanceCalculator)
      {
LABEL_15:
        v9 = objc_alloc(MEMORY[0x1E0D183B0]);
        -[NSObject location](v6, "location");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "latitude");
        v12 = v11;
        -[NSObject location](v6, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "longitude");
        v15 = v14;
        -[NSObject location](v6, "location");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "horizontalUncertainty");
        v18 = v17;
        -[NSObject location](v6, "location");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "altitude");
        v21 = v20;
        -[NSObject location](v6, "location");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "verticalUncertainty");
        v24 = objc_msgSend(v9, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", 0, 0, v12, v15, v18, v21, v23, 0.0);

        distanceCalculator = self->_distanceCalculator;
        referenceLocation = self->_referenceLocation;
        v41 = 0;
        -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", referenceLocation, v24, &v41);
        v28 = v27;
        v29 = v41;
        if (v29)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = self->_referenceLocation;
            *(_DWORD *)buf = 138412802;
            v43 = (const char *)v29;
            v44 = 2112;
            v45 = *(double *)&v31;
            v46 = 2112;
            v47 = v24;
            _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "encountered error while computing distance, error, %@, location, %@, otherLocation, %@", buf, 0x20u);
          }
          goto LABEL_40;
        }
        if (v28 < self->_minimumDistance)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            minimumDistance = self->_minimumDistance;
            *(_DWORD *)buf = 134218498;
            v43 = *(const char **)&v28;
            v44 = 2048;
            v45 = minimumDistance;
            v46 = 2112;
            v47 = v4;
            v34 = "predicted location of interest failed minimum distance check, distance, %f, minimumDistance, %f, ploi, %@";
LABEL_30:
            _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, v34, buf, 0x20u);
            goto LABEL_40;
          }
          goto LABEL_40;
        }
        if (v28 > self->_maximumDistance)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            maximumDistance = self->_maximumDistance;
            *(_DWORD *)buf = 134218498;
            v43 = *(const char **)&v28;
            v44 = 2048;
            v45 = maximumDistance;
            v46 = 2112;
            v47 = v4;
            v34 = "predicted location of interest failed minimum distance check, distance, %f, maximumDistance, %f, ploi, %@";
            goto LABEL_30;
          }
LABEL_40:

          goto LABEL_41;
        }

LABEL_32:
        -[NSObject nextEntryTime](v4, "nextEntryTime");
        v36 = objc_claimAutoreleasedReturnValue();
        v24 = v36;
        if (v36)
        {
          -[NSObject timeIntervalSinceDate:](v36, "timeIntervalSinceDate:", self->_referenceDate);
          if (v37 < 0.0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              -[NSObject stringFromDate](v24, "stringFromDate");
              v30 = objc_claimAutoreleasedReturnValue();
              -[NSDate stringFromDate](self->_referenceDate, "stringFromDate");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v43 = (const char *)v30;
              v44 = 2112;
              v45 = *(double *)&v38;
              v46 = 2112;
              v47 = v4;
              v39 = "predicted location of interest failed reference date check, nextEntryDate, %@, referenceDate, %@, ploi, %@";
LABEL_39:
              _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, v39, buf, 0x20u);

              goto LABEL_40;
            }
            goto LABEL_41;
          }
          if (v37 > self->_windowDuration)
          {
            _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              -[NSObject stringFromDate](v24, "stringFromDate");
              v30 = objc_claimAutoreleasedReturnValue();
              -[NSDate stringFromDate](self->_referenceDate, "stringFromDate");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v43 = (const char *)v30;
              v44 = 2112;
              v45 = *(double *)&v38;
              v46 = 2112;
              v47 = v4;
              v39 = "predicted location of interest failed interval check, nextEntryDate, %@, referenceDate, %@, ploi, %@";
              goto LABEL_39;
            }
LABEL_41:

LABEL_42:
            v32 = 0;
LABEL_43:

            goto LABEL_44;
          }
        }
        v32 = 1;
        goto LABEL_43;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[RTPredictedLocationsOfInterestCriteria evaluatePredictedLocationOfInterest:]";
        v44 = 1024;
        LODWORD(v45) = 53;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: predictedLocationOfInterest (in %s:%d)", buf, 0x12u);
      }
    }
    v32 = 0;
LABEL_44:

    goto LABEL_45;
  }
  v32 = 0;
LABEL_45:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDistanceCalculator:", self->_distanceCalculator);
  if (v4)
  {
    -[RTPredictedLocationsOfInterestCriteria referenceDate](self, "referenceDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReferenceDate:", v5);

    -[RTPredictedLocationsOfInterestCriteria windowDuration](self, "windowDuration");
    objc_msgSend(v4, "setWindowDuration:");
    -[RTPredictedLocationsOfInterestCriteria referenceLocation](self, "referenceLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReferenceLocation:", v6);

    -[RTPredictedLocationsOfInterestCriteria minimumDistance](self, "minimumDistance");
    objc_msgSend(v4, "setMinimumDistance:");
    -[RTPredictedLocationsOfInterestCriteria maximumDistance](self, "maximumDistance");
    objc_msgSend(v4, "setMaximumDistance:");
    -[RTPredictedLocationsOfInterestCriteria minimumConfidence](self, "minimumConfidence");
    objc_msgSend(v4, "setMinimumConfidence:");
    -[RTPredictedLocationsOfInterestCriteria clientIdentifier](self, "clientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClientIdentifier:", v7);

  }
  return v4;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
  objc_storeStrong((id *)&self->_referenceDate, a3);
}

- (double)windowDuration
{
  return self->_windowDuration;
}

- (void)setWindowDuration:(double)a3
{
  self->_windowDuration = a3;
}

- (RTLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (void)setReferenceLocation:(id)a3
{
  objc_storeStrong((id *)&self->_referenceLocation, a3);
}

- (double)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(double)a3
{
  self->_minimumDistance = a3;
}

- (double)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setMaximumDistance:(double)a3
{
  self->_maximumDistance = a3;
}

- (double)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(double)a3
{
  self->_minimumConfidence = a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end
