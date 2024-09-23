@implementation RTMapItemProviderLearnedPlaceParameters

- (double)maxDistanceThreshold
{
  return self->_maxDistanceThreshold;
}

- (double)softDistanceThreshold
{
  return self->_softDistanceThreshold;
}

- (double)minDistanceThreshold
{
  return self->_minDistanceThreshold;
}

- (RTMapItemProviderLearnedPlaceParameters)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMaxDistanceThreshold_minDistanceThreshold_softDistanceThreshold_homeConfidence_workConfidence_schoolConfidence_gymConfidence_nonRevGeoConfidence_revGeoConfidence_revGeoSourceMask_removeSourceMask_);
}

- (RTMapItemProviderLearnedPlaceParameters)initWithMaxDistanceThreshold:(double)a3 minDistanceThreshold:(double)a4 softDistanceThreshold:(double)a5 homeConfidence:(double)a6 workConfidence:(double)a7 schoolConfidence:(double)a8 gymConfidence:(double)a9 nonRevGeoConfidence:(double)a10 revGeoConfidence:(double)a11 revGeoSourceMask:(unint64_t)a12 removeSourceMask:(unint64_t)a13
{
  NSObject *v24;
  const char *v25;
  RTMapItemProviderLearnedPlaceParameters *v26;
  RTMapItemProviderLearnedPlaceParameters *v28;
  objc_super v29;
  uint8_t buf[16];

  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: maxDistanceThreshold > 0";
      goto LABEL_31;
    }
LABEL_32:

    v26 = 0;
    goto LABEL_33;
  }
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: minDistanceThreshold > 0";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (a5 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: softDistanceThreshold > 0";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(homeConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(workConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(schoolConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(gymConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(nonRevGeoConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTCommonValidConfidence(revGeoConfidence)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((a12 & 0xFFFFFFFFFFF00020) != 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: RTMapItemSourceValid(revGeoSourceMask)";
LABEL_31:
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if ((a13 & 0xFFFFFFFFFFF00020) != 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: RTMapItemSourceValid(removeSourceMask)";
    goto LABEL_31;
  }
  v29.receiver = self;
  v29.super_class = (Class)RTMapItemProviderLearnedPlaceParameters;
  v28 = -[RTMapItemProviderLearnedPlaceParameters init](&v29, sel_init);
  if (v28)
  {
    v28->_maxDistanceThreshold = a3;
    v28->_minDistanceThreshold = a4;
    v28->_softDistanceThreshold = a5;
    v28->_homeConfidence = a6;
    v28->_workConfidence = a7;
    v28->_schoolConfidence = a8;
    v28->_gymConfidence = a9;
    v28->_nonRevGeoConfidence = a10;
    v28->_revGeoConfidence = a11;
    v28->_revGeoSourceMask = a12;
    v28->_removeSourceMask = a13;
  }
  self = v28;
  v26 = self;
LABEL_33:

  return v26;
}

- (RTMapItemProviderLearnedPlaceParameters)initWithDefaultsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  NSObject *v8;
  RTMapItemProviderLearnedPlaceParameters *v9;
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
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v41;
  void *v42;
  double v43;
  RTMapItemProviderLearnedPlaceParameters *v44;
  void *v45;
  void *v46;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceMaxDistanceThreshold"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      v43 = v7;
    }
    else
    {
      v43 = 200.0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceMinDistanceThreshold"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v44 = self;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      v12 = v11;
    }
    else
    {
      v12 = 150.0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceSoftDistanceThreshold"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "doubleValue");
      v15 = v14;
    }
    else
    {
      v15 = 250.0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceHomeConfidence"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "doubleValue");
      v18 = v17;
    }
    else
    {
      v18 = 0.975;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceWorkConfidence"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = 0.95;
    v21 = 0.95;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "doubleValue");
      v21 = v22;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceSchoolConfidence"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "doubleValue");
      v20 = v24;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceGymConfidence"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v25, "doubleValue");
      v27 = v26;
    }
    else
    {
      v27 = 0.9;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceNonRevGeoConfidence"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v46 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v28, "doubleValue");
      v30 = v29;
    }
    else
    {
      v30 = 0.3;
    }
    v42 = v16;
    v45 = v10;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceRevGeoConfidence"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = 0.25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v31, "doubleValue");
      v32 = v33;
    }
    v34 = v23;
    v41 = v13;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceRevGeoSourceMask"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = objc_msgSend(v35, "unsignedIntegerValue");
    else
      v37 = 8193;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderLearnedPlaceRemoveSourceMask"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = objc_msgSend(v38, "unsignedIntegerValue");
    else
      v39 = 0x4000;
    self = -[RTMapItemProviderLearnedPlaceParameters initWithMaxDistanceThreshold:minDistanceThreshold:softDistanceThreshold:homeConfidence:workConfidence:schoolConfidence:gymConfidence:nonRevGeoConfidence:revGeoConfidence:revGeoSourceMask:removeSourceMask:](v44, "initWithMaxDistanceThreshold:minDistanceThreshold:softDistanceThreshold:homeConfidence:workConfidence:schoolConfidence:gymConfidence:nonRevGeoConfidence:revGeoConfidence:revGeoSourceMask:removeSourceMask:", v37, v39, v43, v12, v15, v18, v21, v20, v27, v30, *(_QWORD *)&v32);

    v9 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("maxDistanceThreshold, %.3f, minDistanceThreshold, %.3f, softDistanceThreshold, %.3f, homeConfidence, %.3f, workConfidence, %.3f, schoolConfidence, %.3f, gymConfidence, %.3f, nonRevGeoConfidence, %.3f, revGeoConfidence, %.3f, revGeoSourceMask, %lu, removeSourcemask, %lu"), *(_QWORD *)&self->_maxDistanceThreshold, *(_QWORD *)&self->_minDistanceThreshold, *(_QWORD *)&self->_softDistanceThreshold, *(_QWORD *)&self->_homeConfidence, *(_QWORD *)&self->_workConfidence, *(_QWORD *)&self->_schoolConfidence, *(_QWORD *)&self->_gymConfidence, *(_QWORD *)&self->_nonRevGeoConfidence, *(_QWORD *)&self->_revGeoConfidence, self->_revGeoSourceMask, self->_removeSourceMask);
}

- (double)homeConfidence
{
  return self->_homeConfidence;
}

- (double)workConfidence
{
  return self->_workConfidence;
}

- (double)schoolConfidence
{
  return self->_schoolConfidence;
}

- (double)gymConfidence
{
  return self->_gymConfidence;
}

- (double)nonRevGeoConfidence
{
  return self->_nonRevGeoConfidence;
}

- (double)revGeoConfidence
{
  return self->_revGeoConfidence;
}

- (unint64_t)revGeoSourceMask
{
  return self->_revGeoSourceMask;
}

- (unint64_t)removeSourceMask
{
  return self->_removeSourceMask;
}

@end
