@implementation RTRelabelerParameters

- (RTRelabelerParameters)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBaseCount_clippingRadius_confidenceEqualityEpsilon_confidenceThreshold_contextCandidateAmountThreshold_contextDistanceThreshold_minimumConfidenceRatio_minimumNumberPOIs_passthroughThreshold_placeholderWeight_revGeoConfidence_sigma_weekThreshold_);
}

- (RTRelabelerParameters)initWithBaseCount:(double)a3 clippingRadius:(double)a4 confidenceEqualityEpsilon:(double)a5 confidenceThreshold:(double)a6 contextCandidateAmountThreshold:(unint64_t)a7 contextDistanceThreshold:(double)a8 minimumConfidenceRatio:(double)a9 minimumNumberPOIs:(unint64_t)a10 passthroughThreshold:(double)a11 placeholderWeight:(double)a12 revGeoConfidence:(double)a13 sigma:(double)a14 weekThreshold:(unint64_t)a15
{
  NSObject *v27;
  const char *v28;
  RTRelabelerParameters *v29;
  double v31;
  RTRelabelerParameters *v32;
  double v33;
  long double v34;
  objc_super v35;
  uint8_t buf[16];

  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: baseCount > 0";
      goto LABEL_22;
    }
LABEL_23:

    v29 = 0;
    goto LABEL_24;
  }
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: clippingRadius > 0";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: RTCommonValidConfidence(confidenceEqualityEpsilon)";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: RTCommonValidConfidence(confidenceThreshold)";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (!a7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: contextCandidateAmountThreshold > 0";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (a8 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: contextDistanceThreshold > 0";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (a9 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: minimumConfidenceRatio >= 0";
LABEL_22:
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if (!a10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: minimumNumberPOIs > 0";
    goto LABEL_22;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: RTCommonValidConfidence(passthroughThreshold)";
    goto LABEL_22;
  }
  if (a12 <= 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: placeholderWeight > 1";
    goto LABEL_22;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: RTCommonValidConfidence(revGeoConfidence)";
    goto LABEL_22;
  }
  if (a14 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: sigma > 0";
    goto LABEL_22;
  }
  if (!a15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: weekThreshold > 0";
    goto LABEL_22;
  }
  v31 = (double)(a10 - 1);
  if ((1.0 - a6) * a12 / (v31 + a12) > a6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: confidenceThreshold >= nonRevGeoThreshold";
    goto LABEL_22;
  }
  v33 = log(v31 * a13);
  v34 = v33 - log(a13 * -2.0 + 1.0);
  if (a4 * a4 * 0.5 * pow(a14, -2.0) > v34)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: constraint <= upperBound";
    goto LABEL_22;
  }
  v35.receiver = self;
  v35.super_class = (Class)RTRelabelerParameters;
  v32 = -[RTRelabelerParameters init](&v35, sel_init);
  if (v32)
  {
    v32->_baseCount = a3;
    v32->_clippingRadius = a4;
    v32->_confidenceEqualityEpsilon = a5;
    v32->_confidenceThreshold = a6;
    v32->_contextCandidateAmountThreshold = a7;
    v32->_contextDistanceThreshold = a8;
    v32->_minimumConfidenceRatio = a9;
    v32->_minimumNumberPOIs = a10;
    v32->_passthroughThreshold = a11;
    v32->_placeholderWeight = a12;
    v32->_revGeoConfidence = a13;
    v32->_sigma = a14;
    v32->_weekThreshold = a15;
  }
  self = v32;
  v29 = self;
LABEL_24:

  return v29;
}

- (RTRelabelerParameters)initWithDefaultsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  RTRelabelerParameters *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsRelabelerBaseCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = 0.5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      v7 = v8;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerClippingRadius"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "doubleValue");
    else
      *(double *)&v10 = 106.184;
    v46 = *(double *)&v10;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerConfidenceEqualityEpsilon"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v13, "doubleValue");
    else
      *(double *)&v14 = 0.01;
    v45 = *(double *)&v14;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerConfidenceThreshold"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "doubleValue");
      v17 = v16;
    }
    else
    {
      v17 = 0.225;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerContextCandidateAmountThreshold"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v43 = objc_msgSend(v18, "unsignedIntegerValue");
    else
      v43 = 5;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerContextDistanceThreshold"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "doubleValue");
      v21 = v20;
    }
    else
    {
      v21 = 250.0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerMinimumConfidenceRatio"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "doubleValue");
      v24 = v23;
    }
    else
    {
      v24 = 1.15;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerMinimumNumberPois"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = objc_msgSend(v25, "unsignedIntegerValue");
    else
      v42 = 6;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerPassthroughThreshold"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v26, "doubleValue");
      v28 = v27;
    }
    else
    {
      v28 = 0.8;
    }
    v47 = v15;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerPlaceholderWeight"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v30 = 1.25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v29, "doubleValue");
      v30 = v31;
    }
    v44 = v19;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerRevGeoConfidence"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v32, "doubleValue");
      v35 = v34;
    }
    else
    {
      v35 = 0x3FCCCCCCCCCCCCCDLL;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerSigma"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v36, "doubleValue");
      v38 = v37;
    }
    else
    {
      v38 = 0x405630E560418937;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsRelabelerWeekThreshold"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = objc_msgSend(v39, "unsignedIntegerValue");
    else
      v40 = 4838400;
    self = -[RTRelabelerParameters initWithBaseCount:clippingRadius:confidenceEqualityEpsilon:confidenceThreshold:contextCandidateAmountThreshold:contextDistanceThreshold:minimumConfidenceRatio:minimumNumberPOIs:passthroughThreshold:placeholderWeight:revGeoConfidence:sigma:weekThreshold:](self, "initWithBaseCount:clippingRadius:confidenceEqualityEpsilon:confidenceThreshold:contextCandidateAmountThreshold:contextDistanceThreshold:minimumConfidenceRatio:minimumNumberPOIs:passthroughThreshold:placeholderWeight:revGeoConfidence:sigma:weekThreshold:", v43, v42, v40, v7, v46, v45, v17, v21, v24, v28, v30, v35, v38);

    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("baseCount, %.3f, clippingRadius, %.3f, confidenceEqualityEpsilon, %.3f, confidenceThreshold, %.3f, contextCandidateAmountThreshold, %lu,             contextDistanceThreshold, %.3f, minimumConfidenceRatio, %.3f, minimumNumberPOIs, %lu, passthroughThreshold, %.3f, placeholderWeight, %.3f, revGeoConfidence, %.3f,             sigma, %.3f, weekThreshold, %lu"), *(_QWORD *)&self->_baseCount, *(_QWORD *)&self->_clippingRadius, *(_QWORD *)&self->_confidenceEqualityEpsilon, *(_QWORD *)&self->_confidenceThreshold, self->_contextCandidateAmountThreshold, *(_QWORD *)&self->_contextDistanceThreshold, *(_QWORD *)&self->_minimumConfidenceRatio, self->_minimumNumberPOIs, *(_QWORD *)&self->_passthroughThreshold, *(_QWORD *)&self->_placeholderWeight, *(_QWORD *)&self->_revGeoConfidence, *(_QWORD *)&self->_sigma, self->_weekThreshold);
}

- (double)baseCount
{
  return self->_baseCount;
}

- (double)clippingRadius
{
  return self->_clippingRadius;
}

- (double)confidenceEqualityEpsilon
{
  return self->_confidenceEqualityEpsilon;
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (unint64_t)contextCandidateAmountThreshold
{
  return self->_contextCandidateAmountThreshold;
}

- (double)contextDistanceThreshold
{
  return self->_contextDistanceThreshold;
}

- (double)minimumConfidenceRatio
{
  return self->_minimumConfidenceRatio;
}

- (unint64_t)minimumNumberPOIs
{
  return self->_minimumNumberPOIs;
}

- (double)passthroughThreshold
{
  return self->_passthroughThreshold;
}

- (double)placeholderWeight
{
  return self->_placeholderWeight;
}

- (double)revGeoConfidence
{
  return self->_revGeoConfidence;
}

- (double)sigma
{
  return self->_sigma;
}

- (unint64_t)weekThreshold
{
  return self->_weekThreshold;
}

@end
