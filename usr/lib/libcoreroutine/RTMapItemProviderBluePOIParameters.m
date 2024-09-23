@implementation RTMapItemProviderBluePOIParameters

- (RTMapItemProviderBluePOIParameters)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBaseDuration_injectedPlistPath_locationLookupWindowMaxMinutes_locationLookupWindowMinMinutes_maxLocationsPerFingerprint_locationUncertaintyThreshold_aoiDistanceThreshold_poiDistanceThreshold_harvestMask_aoiConfidencePassThroughThreshold_aoiConfidenceConsiderThreshold_poiConfidencePassThroughThreshold_poiConfidenceConsiderThreshold_maxNumberOfQueries_earlyStop_noFingerprintMinVisitDuration_minVisitLength_);
}

- (RTMapItemProviderBluePOIParameters)initWithBaseDuration:(double)a3 injectedPlistPath:(id)a4 locationLookupWindowMaxMinutes:(double)a5 locationLookupWindowMinMinutes:(double)a6 maxLocationsPerFingerprint:(unint64_t)a7 locationUncertaintyThreshold:(double)a8 aoiDistanceThreshold:(double)a9 poiDistanceThreshold:(double)a10 harvestMask:(unint64_t)a11 aoiConfidencePassThroughThreshold:(double)a12 aoiConfidenceConsiderThreshold:(double)a13 poiConfidencePassThroughThreshold:(double)a14 poiConfidenceConsiderThreshold:(double)a15 maxNumberOfQueries:(unint64_t)a16 earlyStop:(BOOL)a17 noFingerprintMinVisitDuration:(double)a18 minVisitLength:(double)a19
{
  id v33;
  RTMapItemProviderBluePOIParameters *v34;
  RTMapItemProviderBluePOIParameters *v35;
  RTMapItemProviderBluePOIParameters *v36;
  NSObject *v37;
  const char *v38;
  objc_super v40;
  uint8_t buf[16];

  v33 = a4;
  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: baseDuration > 0";
LABEL_40:
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_41;
  }
  if (a5 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: locationLookupWindowMaxMinutes > 0";
    goto LABEL_40;
  }
  if (a6 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: locationLookupWindowMinMinutes > 0";
    goto LABEL_40;
  }
  if (!a7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: maxLocationsPerFingerprint > 0";
    goto LABEL_40;
  }
  if (a8 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: locationUncertaintyThreshold > 0";
    goto LABEL_40;
  }
  if (a9 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: aoiDistanceThreshold > 0";
    goto LABEL_40;
  }
  if (a10 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: poiDistanceThreshold > 0";
    goto LABEL_40;
  }
  if (a12 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: aoiConfidencePassThroughThreshold > 0";
    goto LABEL_40;
  }
  if (a13 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: aoiConfidenceConsiderThreshold > 0";
    goto LABEL_40;
  }
  if (a14 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: poiConfidencePassThroughThreshold > 0";
    goto LABEL_40;
  }
  if (a15 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: poiConfidenceConsiderThreshold > 0";
    goto LABEL_40;
  }
  if (!a16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v38 = "Invalid parameter not satisfying: maxNumberOfQueries > 0";
      goto LABEL_40;
    }
LABEL_41:

    v36 = 0;
    goto LABEL_42;
  }
  v40.receiver = self;
  v40.super_class = (Class)RTMapItemProviderBluePOIParameters;
  v34 = -[RTMapItemProviderBluePOIParameters init](&v40, sel_init);
  v35 = v34;
  if (v34)
  {
    v34->_baseDuration = a3;
    objc_storeStrong((id *)&v34->_injectedPlistPath, a4);
    v35->_locationLookupWindowMaxMinutes = a5;
    v35->_locationLookupWindowMinMinutes = a6;
    v35->_maxLocationsPerFingerprint = a7;
    v35->_locationUncertaintyThreshold = a8;
    v35->_aoiDistanceThreshold = a9;
    v35->_poiDistanceThreshold = a10;
    v35->_harvestMask = a11;
    v35->_aoiConfidencePassThroughThreshold = a12;
    v35->_aoiConfidenceConsiderThreshold = a13;
    v35->_poiConfidencePassThroughThreshold = a14;
    v35->_poiConfidenceConsiderThreshold = a15;
    v35->_maxNumberOfQueries = a16;
    v35->_earlyStop = a17;
    v35->_noFingerprintMinVisitDuration = a18;
    v35->_minVisitLength = a19;
  }
  self = v35;
  v36 = self;
LABEL_42:

  return v36;
}

- (RTMapItemProviderBluePOIParameters)initWithDefaultsManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  RTMapItemProviderBluePOIParameters *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  double v14;
  void *v15;
  char v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  RTMapItemProviderBluePOIParameters *v58;
  void *v59;
  double v60;
  void *v61;
  uint64_t v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIBaseDuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "doubleValue");
    else
      *(double *)&v7 = 300.0;
    v67 = *(double *)&v7;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIInjectedPlistPath"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = (void *)v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = (void *)v10;
    else
      v11 = 0;
    v70 = v11;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOILookupWindowMaxMinutes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v14 = 5.0;
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v12, "doubleValue", 5.0);
    v58 = self;
    v66 = v14;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOILookupWindowMinMinutes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();
    v17 = 1.0;
    if ((v16 & 1) != 0)
      objc_msgSend(v15, "doubleValue", 1.0);
    v64 = v17;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIMaxLocationsPerFingerprint"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v62 = objc_msgSend(v18, "unsignedIntegerValue");
    else
      v62 = 300;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOILocationUncertaintyThreshold"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v19, "doubleValue");
    else
      *(double *)&v20 = 250.0;
    v60 = *(double *)&v20;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIAoiDistanceThreshold"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "doubleValue");
      v23 = v22;
    }
    else
    {
      v23 = 5000.0;
    }
    v24 = v12;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIPoiDistanceThreshold"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v26 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v25, "doubleValue");
      v28 = v27;
    }
    else
    {
      v28 = 500.0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIHarvestMask"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v56 = objc_msgSend(v29, "unsignedIntegerValue");
    else
      v56 = -24577;
    v72 = v6;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIAoiConfidencePassThroughThreshold"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v31 = 0.5;
    v32 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v30, "doubleValue");
      v31 = v33;
    }
    v57 = v30;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIAoiConfidenceConsiderThreshold"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v34, "doubleValue");
      v36 = v35;
    }
    else
    {
      v36 = 0.1;
    }
    v65 = v19;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIPoiConfidencePassThroughThreshold"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = 0.5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v37, "doubleValue");
      v38 = v39;
    }
    v54 = v37;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIPoiConfidenceConsiderThreshold"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v40, "doubleValue");
      v42 = v41;
    }
    else
    {
      v42 = 0x3FB999999999999ALL;
    }
    v55 = v34;
    v69 = v24;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIMaxNumberOfQueries"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = objc_msgSend(v43, "unsignedIntegerValue");
    else
      v44 = 6;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIEarlyStop"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v46 = objc_msgSend(v45, "BOOLValue");
    else
      v46 = 0;
    v68 = v32;
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOINoFingerprintMinVisitDuration"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = 0x408C200000000000;
    v49 = 0x408C200000000000;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v47, "doubleValue");
      v49 = v50;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsMapItemProviderBluePOIMinVisitLength"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v51, "doubleValue");
      v48 = v52;
    }
    self = objc_retain(-[RTMapItemProviderBluePOIParameters initWithBaseDuration:injectedPlistPath:locationLookupWindowMaxMinutes:locationLookupWindowMinMinutes:maxLocationsPerFingerprint:locationUncertaintyThreshold:aoiDistanceThreshold:poiDistanceThreshold:harvestMask:aoiConfidencePassThroughThreshold:aoiConfidenceConsiderThreshold:poiConfidencePassThroughThreshold:poiConfidenceConsiderThreshold:maxNumberOfQueries:earlyStop:noFingerprintMinVisitDuration:minVisitLength:](v58, "initWithBaseDuration:injectedPlistPath:locationLookupWindowMaxMinutes:locationLookupWindowMinMinutes:maxLocationsPerFingerprint:locationUncertaintyThreshold:aoiDistanceThreshold:poiDistanceThreshold:harvestMask:aoiConfidencePassThroughThreshold:aoiConfidenceConsiderThreshold:poiConfidencePassThroughThreshold:poiConfidenceConsiderThreshold:maxNumberOfQueries:earlyStop:noFingerprintMinVisitDuration:minVisitLength:", v70, v62, v56, v44, v46, v67, v66, v64, v60, v23, v28, v31, v36,
               *(_QWORD *)&v38,
               v42,
               v49,
               v48));

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
  const __CFString *v2;

  if (self->_earlyStop)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("baseDuration, %.2f, locationLookupWindowMaxMinutes, %.1f, locationLookupWindowMinMinutes, %.1f, maxLocationsPerFingerprint, %lu, locationUncertaintyThreshold, %.2f, aoiDistanceThreshold, %.2f, poiDistanceThreshold, %.2f, aoiConfidencePassThroughThreshold, %.2f, aoiConfidenceConsiderThreshold, %.2f, poiConfidencePassThroughThreshold, %.2f, poiConfidenceConsiderThreshold, %.2f, maxNumberOfQueries, %lu, earlyStop, %@, noFingerprintMinVisitDuration, %.2f, minVisitLength, %.2f"), *(_QWORD *)&self->_baseDuration, *(_QWORD *)&self->_locationLookupWindowMaxMinutes, *(_QWORD *)&self->_locationLookupWindowMinMinutes, self->_maxLocationsPerFingerprint, *(_OWORD *)&self->_locationUncertaintyThreshold, *(_QWORD *)&self->_poiDistanceThreshold, *(_QWORD *)&self->_aoiConfidencePassThroughThreshold, *(_QWORD *)&self->_aoiConfidenceConsiderThreshold, *(_QWORD *)&self->_poiConfidencePassThroughThreshold, *(_QWORD *)&self->_poiConfidenceConsiderThreshold, self->_maxNumberOfQueries, v2, *(_QWORD *)&self->_noFingerprintMinVisitDuration, *(_QWORD *)&self->_minVisitLength);
}

- (double)baseDuration
{
  return self->_baseDuration;
}

- (NSString)injectedPlistPath
{
  return self->_injectedPlistPath;
}

- (double)locationLookupWindowMaxMinutes
{
  return self->_locationLookupWindowMaxMinutes;
}

- (double)locationLookupWindowMinMinutes
{
  return self->_locationLookupWindowMinMinutes;
}

- (unint64_t)maxLocationsPerFingerprint
{
  return self->_maxLocationsPerFingerprint;
}

- (double)locationUncertaintyThreshold
{
  return self->_locationUncertaintyThreshold;
}

- (double)aoiDistanceThreshold
{
  return self->_aoiDistanceThreshold;
}

- (double)poiDistanceThreshold
{
  return self->_poiDistanceThreshold;
}

- (unint64_t)harvestMask
{
  return self->_harvestMask;
}

- (double)aoiConfidencePassThroughThreshold
{
  return self->_aoiConfidencePassThroughThreshold;
}

- (double)aoiConfidenceConsiderThreshold
{
  return self->_aoiConfidenceConsiderThreshold;
}

- (double)poiConfidencePassThroughThreshold
{
  return self->_poiConfidencePassThroughThreshold;
}

- (double)poiConfidenceConsiderThreshold
{
  return self->_poiConfidenceConsiderThreshold;
}

- (unint64_t)maxNumberOfQueries
{
  return self->_maxNumberOfQueries;
}

- (BOOL)earlyStop
{
  return self->_earlyStop;
}

- (double)noFingerprintMinVisitDuration
{
  return self->_noFingerprintMinVisitDuration;
}

- (double)minVisitLength
{
  return self->_minVisitLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectedPlistPath, 0);
}

@end
