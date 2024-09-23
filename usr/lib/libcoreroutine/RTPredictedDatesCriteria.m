@implementation RTPredictedDatesCriteria

- (RTPredictedDatesCriteria)init
{
  RTPredictedDatesCriteria *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTPredictedDatesCriteria;
  result = -[RTPredictedDatesCriteria init](&v3, sel_init);
  if (result)
  {
    result->_windowDuration = INFINITY;
    result->_minimumConfidence = 0.0;
  }
  return result;
}

- (BOOL)evaluatePredictedDate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  double v9;
  NSObject *v10;
  char *v11;
  void *v12;
  const char *v13;
  BOOL v14;
  double v16;
  double v17;
  double minimumConfidence;
  int v19;
  const char *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_referenceLocation)
    goto LABEL_33;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v19 = 136315394;
    v20 = "-[RTPredictedDatesCriteria evaluatePredictedDate:]";
    v21 = 1024;
    LODWORD(v22) = 169;
    _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _referenceLocation (in %s:%d)", (uint8_t *)&v19, 0x12u);
  }

  if (self->_referenceLocation)
  {
LABEL_33:
    if (self->_referenceDate)
      goto LABEL_9;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[RTPredictedDatesCriteria evaluatePredictedDate:]";
      v21 = 1024;
      LODWORD(v22) = 174;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _referenceDate (in %s:%d)", (uint8_t *)&v19, 0x12u);
    }

    if (self->_referenceDate)
    {
LABEL_9:
      if (!v4)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v19 = 136315394;
          v20 = "-[RTPredictedDatesCriteria evaluatePredictedDate:]";
          v21 = 1024;
          LODWORD(v22) = 179;
          _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: predictedDate (in %s:%d)", (uint8_t *)&v19, 0x12u);
        }
        goto LABEL_24;
      }
      objc_msgSend(v4, "date");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v19 = 136315394;
          v20 = "-[RTPredictedDatesCriteria evaluatePredictedDate:]";
          v21 = 1024;
          LODWORD(v22) = 185;
          _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v19, 0x12u);
        }
        goto LABEL_23;
      }
      -[NSObject timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", self->_referenceDate);
      if (v9 >= 0.0)
      {
        if (v9 <= self->_windowDuration)
        {
          objc_msgSend(v4, "confidence");
          v17 = v16;
          if (v16 >= self->_minimumConfidence)
          {
            v14 = 1;
            goto LABEL_25;
          }
          _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            minimumConfidence = self->_minimumConfidence;
            v19 = 134218498;
            v20 = *(const char **)&v17;
            v21 = 2048;
            v22 = minimumConfidence;
            v23 = 2112;
            v24 = v4;
            _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "predicted date failed minimum confidence check, confidence, %f, minimumConfidence, %f, predicted date, %@", (uint8_t *)&v19, 0x20u);
          }
          goto LABEL_23;
        }
        _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          -[NSObject stringFromDate](v8, "stringFromDate");
          v11 = (char *)objc_claimAutoreleasedReturnValue();
          -[NSDate stringFromDate](self->_referenceDate, "stringFromDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412802;
          v20 = v11;
          v21 = 2112;
          v22 = *(double *)&v12;
          v23 = 2112;
          v24 = v4;
          v13 = "predicted date failed interval check, nextEntryDate, %@, referenceDate, %@, predicted date, %@";
          goto LABEL_22;
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityDeviceLocationPredictor);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          -[NSObject stringFromDate](v8, "stringFromDate");
          v11 = (char *)objc_claimAutoreleasedReturnValue();
          -[NSDate stringFromDate](self->_referenceDate, "stringFromDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412802;
          v20 = v11;
          v21 = 2112;
          v22 = *(double *)&v12;
          v23 = 2112;
          v24 = v4;
          v13 = "predicted date failed reference date check, nextEntryDate, %@, referenceDate, %@, predicted date, %@";
LABEL_22:
          _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v19, 0x20u);

        }
      }
LABEL_23:

LABEL_24:
      v14 = 0;
LABEL_25:

      goto LABEL_26;
    }
  }
  v14 = 0;
LABEL_26:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  if (v4)
  {
    -[RTPredictedDatesCriteria referenceDate](self, "referenceDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReferenceDate:", v5);

    -[RTPredictedDatesCriteria windowDuration](self, "windowDuration");
    objc_msgSend(v4, "setWindowDuration:");
    -[RTPredictedDatesCriteria referenceLocation](self, "referenceLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReferenceLocation:", v6);

    -[RTPredictedDatesCriteria minimumConfidence](self, "minimumConfidence");
    objc_msgSend(v4, "setMinimumConfidence:");
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

- (double)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(double)a3
{
  self->_minimumConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end
