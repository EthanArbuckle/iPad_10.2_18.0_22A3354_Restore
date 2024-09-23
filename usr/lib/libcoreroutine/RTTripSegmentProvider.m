@implementation RTTripSegmentProvider

- (RTTripSegmentProvider)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLearnedLocationManager_locationManager_motionActivityManager_tripSegmentInertialDataManager_inertialOdometryManager_vehicleStore_tripSegmentManager_elevationAdjuster_distanceCalculator_defaultsManager_visitManager_);
}

- (RTTripSegmentProvider)initWithLearnedLocationManager:(id)a3 locationManager:(id)a4 motionActivityManager:(id)a5 tripSegmentInertialDataManager:(id)a6 inertialOdometryManager:(id)a7 vehicleStore:(id)a8 tripSegmentManager:(id)a9 elevationAdjuster:(id)a10 distanceCalculator:(id)a11 defaultsManager:(id)a12 visitManager:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  RTTripSegmentProvider *v31;
  RTTripSegmentProvider *v32;
  const char *v33;
  NSObject *v34;
  RTTripSegmentProvider *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v42;
  OS_dispatch_queue *queue;
  CLTripSegmentProcessorManager *v44;
  CLTripSegmentProcessorManager *tripProcessorManager;
  NSMutableArray *v46;
  NSMutableArray *transitionLocations;
  double v48;
  RTTripSegmentTransitionPreprocessor *v49;
  RTTripSegmentTransitionPreprocessor *transitionPreprocessor;
  void *v51;
  void *v52;
  NSObject *v53;
  double processingChunkWidthSeconds;
  id v55;
  dispatch_queue_t v56;
  NSObject *attr;
  id obj;
  id v59;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  RTTripSegmentProvider *v70;
  id v71;
  objc_super v72;
  uint8_t buf[4];
  double v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v61 = a4;
  v19 = a4;
  v62 = a5;
  v20 = a5;
  obj = a6;
  v64 = a6;
  v59 = a7;
  v21 = a7;
  v63 = a8;
  v22 = a8;
  v65 = a9;
  v68 = a10;
  v23 = v18;
  v24 = a11;
  v71 = a12;
  v66 = v23;
  v67 = a13;
  if (v23)
  {
    v25 = v19;
    if (v19)
    {
      v26 = v24;
      if (v20)
      {
        v27 = v64;
        v28 = v22;
        if (v64)
        {
          v29 = v65;
          if (v21)
          {
            v30 = v68;
            if (v28)
            {
              if (v65)
              {
                if (v68)
                {
                  if (v24)
                  {
                    if (v71)
                    {
                      v72.receiver = self;
                      v72.super_class = (Class)RTTripSegmentProvider;
                      v31 = -[RTTripSegmentProvider init](&v72, sel_init);
                      if (v31)
                      {
                        v70 = v31;
                        v32 = v31;
                        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                        attr = objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v33 = (const char *)-[RTTripSegmentProvider UTF8String](objc_retainAutorelease(v32), "UTF8String");
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v32);
                          v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                          v42 = objc_msgSend(v55, "UTF8String");

                          v33 = (const char *)v42;
                        }
                        v56 = dispatch_queue_create(v33, attr);

                        queue = v32->_queue;
                        v32->_queue = (OS_dispatch_queue *)v56;

                        objc_storeStrong((id *)&v32->_inertialDataManager, obj);
                        objc_storeStrong((id *)&v32->_inertialOdometryManager, v59);
                        objc_storeStrong((id *)&v32->_learnedLocationManager, a3);
                        objc_storeStrong((id *)&v32->_locationManager, v61);
                        objc_storeStrong((id *)&v32->_motionActivityManager, v62);
                        objc_storeStrong((id *)&v32->_vehicleStore, v63);
                        objc_storeStrong((id *)&v32->_tripSegmentManager, a9);
                        v44 = (CLTripSegmentProcessorManager *)objc_alloc_init(MEMORY[0x1E0C9E438]);
                        tripProcessorManager = v32->_tripProcessorManager;
                        v32->_tripProcessorManager = v44;

                        v46 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                        transitionLocations = v32->_transitionLocations;
                        v32->_transitionLocations = v46;

                        objc_storeStrong((id *)&v32->_elevationAdjuster, a10);
                        objc_storeStrong((id *)&v32->_defaultsManager, a12);
                        -[RTTripSegmentProvider getProcessingChunkWidthSeconds](v32, "getProcessingChunkWidthSeconds");
                        v32->_processingChunkWidthSeconds = v48;
                        v49 = -[RTTripSegmentTransitionPreprocessor initWithMotionActivityManager:locationManager:learnedLocationManager:vehicleStore:distanceCalculator:visitManager:elevationAdjuster:defaultsManager:]([RTTripSegmentTransitionPreprocessor alloc], "initWithMotionActivityManager:locationManager:learnedLocationManager:vehicleStore:distanceCalculator:visitManager:elevationAdjuster:defaultsManager:", v20, v25, v66, v28, v24, v67, v68, v71);
                        transitionPreprocessor = v32->_transitionPreprocessor;
                        v32->_transitionPreprocessor = v49;

                        v32->_sessionInProgress = 0;
                        -[RTTripSegmentProvider prepareTripProcessorOptions](v32, "prepareTripProcessorOptions");
                        v32->_usingLegacyInertialData = 1;
                        -[RTTripSegmentProvider defaultsManager](v32, "defaultsManager");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v51, "objectForKey:", CFSTR("RTDefaultsTripSegmentUseInertialOdometrySamples"));
                        v52 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v52)
                          v32->_usingLegacyInertialData = objc_msgSend(v52, "BOOLValue") ^ 1;
                        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                        v53 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                        {
                          processingChunkWidthSeconds = v32->_processingChunkWidthSeconds;
                          *(_DWORD *)buf = 134217984;
                          v74 = processingChunkWidthSeconds;
                          _os_log_debug_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider successfully initialized with the trip segment reconstruction length of %.1lf seconds.", buf, 0xCu);
                        }

                        v30 = v68;
                        v31 = v70;
                        v26 = v24;
                      }
                      v35 = v31;
                      self = v35;
                      goto LABEL_42;
                    }
                    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v40 = "Invalid parameter not satisfying: defaultsManager";
                      goto LABEL_40;
                    }
LABEL_41:

                    v35 = 0;
                    goto LABEL_42;
                  }
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    goto LABEL_41;
                  *(_WORD *)buf = 0;
                  v40 = "Invalid parameter not satisfying: distanceCalculator";
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    goto LABEL_41;
                  *(_WORD *)buf = 0;
                  v40 = "Invalid parameter not satisfying: elevationAdjuster";
                }
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                v39 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  goto LABEL_41;
                *(_WORD *)buf = 0;
                v40 = "Invalid parameter not satisfying: tripSegmentManager";
              }
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v39 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                goto LABEL_41;
              *(_WORD *)buf = 0;
              v40 = "Invalid parameter not satisfying: vehicleStore";
            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v39 = objc_claimAutoreleasedReturnValue();
            v30 = v68;
            if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              goto LABEL_41;
            *(_WORD *)buf = 0;
            v40 = "Invalid parameter not satisfying: inertialOdometryManager";
          }
LABEL_40:
          _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, v40, buf, 2u);
          goto LABEL_41;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v38 = objc_claimAutoreleasedReturnValue();
        v29 = v65;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: tripSegmentInertialDatamanager", buf, 2u);
        }

        v35 = 0;
LABEL_24:
        v30 = v68;
        goto LABEL_42;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v37 = objc_claimAutoreleasedReturnValue();
      v27 = v64;
      v28 = v22;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: motionActivityManager", buf, 2u);
      }

      v35 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v36 = objc_claimAutoreleasedReturnValue();
      v26 = v24;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager", buf, 2u);
      }

      v35 = 0;
      v27 = v64;
      v28 = v22;
    }
    v29 = v65;
    goto LABEL_24;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationManager", buf, 2u);
  }

  v35 = 0;
  v25 = v19;
  v28 = v22;
  v27 = v64;
  v29 = v65;
  v30 = v68;
  v26 = v24;
LABEL_42:

  return v35;
}

+ (int64_t)CLTripModeFromRTModeOfTransportation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return qword_1D1EEE878[a3 - 1];
}

- (id)trimTimeOfTripSegment:(id)a3 dateInterval:(id)a4 uuidType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  RTTripSegmentFeatures *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  RTTripSegmentFeatures *v24;
  void *v26;
  int v27;
  int64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  +[RTTripSegmentManager uuidForTripSegmentOfType:](RTTripSegmentManager, "uuidForTripSegmentOfType:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 134218242;
    v28 = a5;
    v29 = 2112;
    v30 = v26;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:trimTimeOfTripSegment, uuidType, %lu, UUID, %@", (uint8_t *)&v27, 0x16u);

  }
  objc_msgSend(v8, "setTripId:", v9);
  objc_msgSend(v8, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "laterDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateInterval");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "earlierDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [RTTripSegmentFeatures alloc];
  v20 = objc_msgSend(v8, "transitionIndex");
  objc_msgSend(v8, "tripId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v8, "mode");

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v14, v18);
  v24 = -[RTTripSegmentFeatures initWithTransitionIndex:tripId:mode:dateInterval:](v19, "initWithTransitionIndex:tripId:mode:dateInterval:", v20, v21, v22, v23);

  return v24;
}

- (void)addTripSegmentFeaturesItem:(id)a3 intoList:(id)a4 overlapDateInterval:(id)a5 uuidType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  RTTripSegmentProvider *v22;
  id v23;
  int64_t v24;
  void *v25;
  int64_t v26;
  RTTripSegmentProvider *v27;
  void *v28;
  double v29;
  double v30;
  int v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[RTTripSegmentProvider addTripSegmentFeaturesItem:intoList:overlapDateInterval:uuidType:]";
      v35 = 1024;
      v36 = 251;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: itemToBeAdded (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if (v12)
        goto LABEL_4;
LABEL_12:
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[RTTripSegmentProvider addTripSegmentFeaturesItem:intoList:overlapDateInterval:uuidType:]";
        v35 = 1024;
        v36 = 253;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: overlapDateInterval (in %s:%d)", buf, 0x12u);
      }

      if (!v10)
        goto LABEL_21;
      goto LABEL_15;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[RTTripSegmentProvider addTripSegmentFeaturesItem:intoList:overlapDateInterval:uuidType:]";
    v35 = 1024;
    v36 = 252;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: targetList (in %s:%d)", buf, 0x12u);
  }

  if (!v12)
    goto LABEL_12;
LABEL_4:
  if (!v10)
    goto LABEL_21;
LABEL_15:
  objc_msgSend(v10, "dateInterval");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isBeforeDate:", v18) & 1) == 0)
  {

LABEL_20:
    goto LABEL_21;
  }
  objc_msgSend(v10, "dateInterval");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v32 = v10;
  v21 = v12;
  v22 = self;
  v23 = v11;
  v24 = a6;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v20, "isAfterDate:", v25);

  v26 = v24;
  v11 = v23;
  v27 = v22;
  v12 = v21;
  v10 = v32;

  if (v31)
  {
    -[RTTripSegmentProvider trimTimeOfTripSegment:dateInterval:uuidType:](v27, "trimTimeOfTripSegment:dateInterval:uuidType:", v32, v12, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateInterval");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "duration");
    v30 = v29;

    if (v30 > 5.0)
      objc_msgSend(v11, "addObject:", v16);
    goto LABEL_20;
  }
LABEL_21:

}

- (double)getProcessingChunkWidthSeconds
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[RTTripSegmentProvider defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsTripSegmentProcessingChunkWidth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 900.0;
  }

  return v5;
}

- (BOOL)allowReprocessingOfTransitionsWithTripSegments
{
  void *v2;
  void *v3;
  char v4;

  -[RTTripSegmentProvider defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsTripSegmentAllowReprocessTransitions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)prepareTripProcessorOptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CLTripSegmentProcessorOptions *v18;
  CLTripSegmentProcessorOptions *tripProcessorOptions;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[RTTripSegmentProvider defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsTripProcessorOptionRunLinearInterpolator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 1;
  -[RTTripSegmentProvider defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsTripProcessorOptionRunInertialIntegrator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = 1;
  v21 = v4;
  -[RTTripSegmentProvider defaultsManager](self, "defaultsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("RTDefaultsTripProcessorOptionRunMapIntegrator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = objc_msgSend(v10, "BOOLValue");
  else
    v11 = 1;
  -[RTTripSegmentProvider defaultsManager](self, "defaultsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsTripProcessorOptionUseXPCServiceForMapQuery"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = objc_msgSend(v13, "BOOLValue");
  else
    v14 = 1;
  -[RTTripSegmentProvider defaultsManager](self, "defaultsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("RTDefaultsTripProcessorOptionRecordForReplay"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = objc_msgSend(v16, "BOOLValue");
  else
    v17 = 1;
  v18 = (CLTripSegmentProcessorOptions *)objc_alloc_init(MEMORY[0x1E0C9E440]);
  tripProcessorOptions = self->_tripProcessorOptions;
  self->_tripProcessorOptions = v18;

  -[CLTripSegmentProcessorOptions setRunLinearInterpolator:](self->_tripProcessorOptions, "setRunLinearInterpolator:", v5);
  -[CLTripSegmentProcessorOptions setRunInertialIntegrator:](self->_tripProcessorOptions, "setRunInertialIntegrator:", v8);
  -[CLTripSegmentProcessorOptions setRunMapIntegrator:](self->_tripProcessorOptions, "setRunMapIntegrator:", v11);
  -[CLTripSegmentProcessorOptions setUseXPCService:](self->_tripProcessorOptions, "setUseXPCService:", v14);
  -[CLTripSegmentProcessorOptions setshouldRecordDataInFileForReplay:](self->_tripProcessorOptions, "setshouldRecordDataInFileForReplay:", v17);
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110144;
    v23 = v5;
    v24 = 1024;
    v25 = v8;
    v26 = 1024;
    v27 = v11;
    v28 = 1024;
    v29 = v14;
    v30 = 1024;
    v31 = v17;
    _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:prepareTripProcessorOptions: setRunLinearInterpolator,%d,setRunInertialIntegrator,%d,setRunMapIntegrator,%d,setUseXPCService,%d,setshouldRecordDataInFileForReplay,%d.", buf, 0x20u);
  }

}

- (void)_startReconstructTripSegmentWithTrainMode:(unint64_t)a3
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  __int128 v30;
  unint64_t v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  dispatch_semaphore_t v39;
  RTTripSegmentManager *tripSegmentManager;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  dispatch_time_t v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  _BOOL4 v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  _BOOL4 v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *dsema;
  id v76;
  _QWORD v77[4];
  NSObject *v78;
  _BYTE *v79;
  _QWORD v80[5];
  _QWORD v81[4];
  NSObject *v82;
  __int128 *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _BYTE v91[12];
  __int16 v92;
  uint64_t v93;
  _BYTE buf[24];
  void *v95;
  __int128 v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  _QWORD v101[4];

  v101[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v96) = 134217984;
    *(_QWORD *)((char *)&v96 + 4) = a3;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:_startReconstructTripSegmentWithTrainMode, mode, %lu", (uint8_t *)&v96, 0xCu);
  }

  -[RTTripSegmentProvider prepareTripProcessorOptions](self, "prepareTripProcessorOptions");
  *(_QWORD *)&v96 = 0;
  *((_QWORD *)&v96 + 1) = &v96;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__175;
  v99 = __Block_byref_object_dispose__175;
  v100 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__175;
  v89 = __Block_byref_object_dispose__175;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v90 = (id)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  -[RTTripSegmentProvider learnedLocationManager](self, "learnedLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -691200.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke;
  v81[3] = &unk_1E9296EE0;
  v83 = &v96;
  v84 = &v85;
  v8 = v4;
  v82 = v8;
  objc_msgSend(v5, "fetchTransitionsBetweenStartDate:endDate:handler:", v6, v7, v81);

  dsema = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v10))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_301);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  *(_QWORD *)v91 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v91, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

  }
  else
  {
LABEL_8:
    v23 = 0;
  }

  v76 = v23;
  if (v76 || *(_QWORD *)(*((_QWORD *)&v96 + 1) + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v67 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 40);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v67;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v76;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: Failed in transition fetching,fetchError,%@,semaError,%@", buf, 0x16u);
    }
    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v68 = objc_msgSend((id)v86[5], "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v68;
    _os_log_debug_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetchedTransitionSummary,transitionCount,%tu", buf, 0xCu);
  }

  v26 = (void *)v86[5];
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke_102;
  v80[3] = &unk_1E92A62A8;
  v80[4] = &v85;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v80);
  v70 = -[RTTripSegmentProvider allowReprocessingOfTransitionsWithTripSegments](self, "allowReprocessingOfTransitionsWithTripSegments");
  -[RTTripSegmentTransitionPreprocessor processTransitions:](self->_transitionPreprocessor, "processTransitions:", v86[5]);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v86[5];
  v86[5] = v27;

  v29 = 0;
  v76 = 0;
  v71 = *MEMORY[0x1E0D18598];
  v72 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)&v30 = 134218242;
  v69 = v30;
  while (1)
  {
    v31 = objc_msgSend((id)v86[5], "count", v69);
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v24 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    if (v29 >= v31)
      break;
    if (v32)
    {
      v62 = objc_msgSend((id)v86[5], "count");
      objc_msgSend((id)v86[5], "objectAtIndexedSubscript:", v29);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v62;
      *(_WORD *)&buf[22] = 2112;
      v95 = v63;
      _os_log_debug_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: processingTransition,transitionIndex,%tu,transitionCount,%tu,thisTransition,%@", buf, 0x20u);

    }
    v33 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend((id)v86[5], "objectAtIndexedSubscript:", v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "startDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v86[5], "objectAtIndexedSubscript:", v29);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stopDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v33, "initWithStartDate:endDate:", v35, v37);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v95) = 1;
    v39 = dispatch_semaphore_create(0);
    tripSegmentManager = self->_tripSegmentManager;
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke_104;
    v77[3] = &unk_1E929F3E8;
    v79 = buf;
    v41 = v39;
    v78 = v41;
    -[RTTripSegmentManager tripSegmentExistsForDateInterval:ignoreTemporary:handler:](tripSegmentManager, "tripSegmentExistsForDateInterval:ignoreTemporary:handler:", v38, 1, v77);
    v42 = v41;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = dispatch_time(0, 3600000000000);
    v45 = v76;
    if (dispatch_semaphore_wait(v42, v44))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "timeIntervalSinceDate:", v43);
      v48 = v47;
      v49 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_301);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "filteredArrayUsingPredicate:", v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "firstObject");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v49, "submitToCoreAnalytics:type:duration:", v53, 1, v48);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v91 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v91, 2u);
      }

      v55 = (void *)MEMORY[0x1E0CB35C8];
      v101[0] = v72;
      *(_QWORD *)v91 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v101, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", v71, 15, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = v76;
      if (v57)
      {
        v45 = objc_retainAutorelease(v57);

      }
    }

    v58 = v45;
    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      goto LABEL_33;
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG);
    if (v70)
    {
      if (v60)
      {
        objc_msgSend(v38, "description");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v91 = v69;
        *(_QWORD *)&v91[4] = v29;
        v92 = 2112;
        v93 = (uint64_t)v65;
        _os_log_debug_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:TripSegment already exists in store for transitionIndex, %tu, date interval %@, and configuration set to reprocess trip segment data.", v91, 0x16u);

      }
LABEL_33:
      -[RTTripSegmentProvider buildTripSegmentsForOneLearnedTransitionWithIndex:inTransitions:trainMode:](self, "buildTripSegmentsForOneLearnedTransitionWithIndex:inTransitions:trainMode:", v29, v86[5], a3);
      goto LABEL_34;
    }
    if (v60)
    {
      objc_msgSend(v38, "description");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v91 = v69;
      *(_QWORD *)&v91[4] = v29;
      v92 = 2112;
      v93 = (uint64_t)v66;
      _os_log_debug_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:TripSegment already exists in store for transitionIndex, %tu, date interval %@, and configuration set to skip reprocessing trip segment data.", v91, 0x16u);

    }
    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      goto LABEL_33;
LABEL_34:
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      v64 = objc_msgSend((id)v86[5], "count");
      *(_DWORD *)v91 = 134218240;
      *(_QWORD *)&v91[4] = v29;
      v92 = 2048;
      v93 = v64;
      _os_log_debug_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:completedTransition,transitionIndex,%tu,transitionCount,%tu", v91, 0x16u);
    }

    _Block_object_dispose(buf, 8);
    ++v29;
    v76 = v58;
  }
  if (v32)
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = a3;
    _os_log_debug_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:_startReconstructTripSegmentWithTrainMode, mode, %lu - finished. Exiting.", buf, 0xCu);
  }
LABEL_13:

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v96, 8);

}

void __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke_102(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count");
    v8 = 134218498;
    v9 = a3;
    v10 = 2048;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetchedTransitions,transitionIndex,%tu,count,%tu,transition,%@", (uint8_t *)&v8, 0x20u);
  }

}

intptr_t __67__RTTripSegmentProvider__startReconstructTripSegmentWithTrainMode___block_invoke_104(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isTripSegmentGenerationSupportedOnPlatform:(id)a3
{
  return objc_msgSend(a3, "iPhoneDevice");
}

- (BOOL)isTripSegmentGenerationEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[RTTripSegmentProvider defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsTripSegmentGenerationEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)startReconstructTripSegmentWithTrainMode:(unint64_t)a3
{
  BOOL v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[7];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = -[RTTripSegmentProvider isTripSegmentGenerationEnabled](self, "isTripSegmentGenerationEnabled");
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "RTTripSegmentProvider:%@,trip segment generation is supported on this platform but is not enabled", buf, 0xCu);

    }
    goto LABEL_11;
  }
  if (v8)
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "RTTripSegmentProvider:%@,trip segment generation is supported on this platform and is enabled", buf, 0xCu);

  }
  if (!self->_sessionInProgress)
  {
    -[RTTripSegmentProvider queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__RTTripSegmentProvider_startReconstructTripSegmentWithTrainMode___block_invoke;
    block[3] = &unk_1E92A62D0;
    block[4] = self;
    block[5] = a2;
    block[6] = a3;
    dispatch_async(v7, block);
LABEL_11:

    return;
  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "RTTripSegmentProvider:startReconstructTripSegmentWithTrainMode: Session already in progress, ignoring request.", buf, 2u);
  }

}

void __66__RTTripSegmentProvider_startReconstructTripSegmentWithTrainMode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "RTTripSegmentProvider:startReconstructTripSegmentWithTrainMode: Starting.", buf, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  v8 = (void *)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_startReconstructTripSegmentWithTrainMode:", *(_QWORD *)(a1 + 48));

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "RTTripSegmentProvider:startReconstructTripSegmentWithTrainMode: Finished.", buf, 2u);
  }

}

- (id)buildTinySegmentArrayForTransitionWithIndex:(unint64_t)a3 withinDateInterval:(id)a4 fromActivity:(id)a5 uuidType:(int64_t)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  RTTripSegmentFeatures *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  RTTripSegmentFeatures *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  RTTripSegmentProvider *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  RTTripSegmentFeatures *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  RTTripSegmentFeatures *v55;
  id v56;
  void *v57;
  void *v58;
  RTTripSegmentFeatures *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  RTTripSegmentFeatures *v66;
  id v67;
  void *v70;
  id obj;
  RTTripSegmentFeatures *v72;
  id v73;
  uint64_t v74;
  RTTripSegmentProvider *v75;
  uint64_t v76;
  id context;
  void *contexta;
  uint64_t v80;
  uint64_t v81;
  id v82;
  _QWORD v83[4];
  id v84;
  unint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
  unint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  const char *v100;
  __int16 v101;
  int v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v9 || !objc_msgSend(v9, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v100 = "-[RTTripSegmentProvider buildTinySegmentArrayForTransitionWithIndex:withinDateInterval:fromActivity:uuidType:]";
      v101 = 1024;
      v102 = 468;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider:Activities cannot be nil or empty for a transition (in %s:%d)", buf, 0x12u);
    }

  }
  v75 = self;
  context = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = [RTTripSegmentFeatures alloc];
  v13 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithStartDate:endDate:", v14, v15);
  v17 = -[RTTripSegmentFeatures initWithTransitionIndex:tripId:mode:dateInterval:](v12, "initWithTransitionIndex:tripId:mode:dateInterval:", a3, 0, 0, v16);

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = v10;
  v70 = v8;
  v72 = v17;
  v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
  if (v81)
  {
    v18 = *(_QWORD *)v94;
    while (2)
    {
      for (i = 0; i != v81; ++i)
      {
        if (*(_QWORD *)v94 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v20, "startDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "endDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isAfterDate:", v23);

        if ((v24 & 1) != 0)
        {
          objc_autoreleasePoolPop(v21);
          goto LABEL_18;
        }
        v25 = objc_msgSend(MEMORY[0x1E0D183D0], "modeOfTransportationFromMotionActivityType:", objc_msgSend(v20, "type"));
        if (v25 != -[RTTripSegmentFeatures mode](v17, "mode"))
        {
          v26 = objc_alloc(MEMORY[0x1E0CB3588]);
          -[RTTripSegmentFeatures dateInterval](v17, "dateInterval");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "startDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "startDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v26, "initWithStartDate:endDate:", v28, v29);
          -[RTTripSegmentFeatures setDateInterval:](v72, "setDateInterval:", v30);

          v8 = v70;
          -[RTTripSegmentProvider addTripSegmentFeaturesItem:intoList:overlapDateInterval:uuidType:](v75, "addTripSegmentFeaturesItem:intoList:overlapDateInterval:uuidType:", v72, context, v70, a6);
          v31 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v20, "startDate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v31, "initWithStartDate:endDate:", v32, v33);
          -[RTTripSegmentFeatures setDateInterval:](v72, "setDateInterval:", v34);

          v17 = v72;
          -[RTTripSegmentFeatures setMode:](v72, "setMode:", v25);
        }
        objc_autoreleasePoolPop(v21);
      }
      v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
      if (v81)
        continue;
      break;
    }
  }
LABEL_18:

  v35 = v75;
  -[RTTripSegmentProvider addTripSegmentFeaturesItem:intoList:overlapDateInterval:uuidType:](v75, "addTripSegmentFeaturesItem:intoList:overlapDateInterval:uuidType:", v17, context, v8, a6);
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __110__RTTripSegmentProvider_buildTinySegmentArrayForTransitionWithIndex_withinDateInterval_fromActivity_uuidType___block_invoke;
  v90[3] = &unk_1E92A62F8;
  v92 = a3;
  v36 = context;
  v91 = v36;
  objc_msgSend(v36, "enumerateObjectsUsingBlock:", v90);
  v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v73 = v36;
  v76 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
  if (v76)
  {
    v74 = *(_QWORD *)v87;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v87 != v74)
          objc_enumerationMutation(v73);
        v38 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v37);
        contexta = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v38, "tripId");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "dateInterval");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "startDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "dateInterval");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "startDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "dateByAddingTimeInterval:", v35->_processingChunkWidthSeconds);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "dateInterval");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "endDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "dateByAddingTimeInterval:", v35->_processingChunkWidthSeconds * -0.5);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "dateInterval");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "endDate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v44, "isBeforeDate:", v49);

        v80 = v37;
        if (v50)
        {
          while ((objc_msgSend(v44, "isAfterDate:", v47) & 1) == 0)
          {
            v51 = [RTTripSegmentFeatures alloc];
            v52 = objc_msgSend(v38, "transitionIndex");
            v53 = objc_msgSend(v38, "mode");
            v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v41, v44);
            v55 = -[RTTripSegmentFeatures initWithTransitionIndex:tripId:mode:dateInterval:](v51, "initWithTransitionIndex:tripId:mode:dateInterval:", v52, v39, v53, v54);
            objc_msgSend(v82, "addObject:", v55);

            v56 = v44;
            objc_msgSend(v56, "dateByAddingTimeInterval:", v35->_processingChunkWidthSeconds);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v38, "dateInterval");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "endDate");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v52) = objc_msgSend(v44, "isBeforeDate:", v58);

            v41 = v56;
            if ((v52 & 1) == 0)
              goto LABEL_28;
          }
        }
        v56 = v41;
LABEL_28:
        v59 = [RTTripSegmentFeatures alloc];
        v60 = objc_msgSend(v38, "transitionIndex");
        v61 = objc_msgSend(v38, "mode");
        v62 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v38, "dateInterval");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "endDate");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(v62, "initWithStartDate:endDate:", v56, v64);
        v66 = -[RTTripSegmentFeatures initWithTransitionIndex:tripId:mode:dateInterval:](v59, "initWithTransitionIndex:tripId:mode:dateInterval:", v60, v39, v61, v65);
        objc_msgSend(v82, "addObject:", v66);

        v35 = v75;
        objc_autoreleasePoolPop(contexta);
        v37 = v80 + 1;
      }
      while (v80 + 1 != v76);
      v76 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
    }
    while (v76);
  }

  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __110__RTTripSegmentProvider_buildTinySegmentArrayForTransitionWithIndex_withinDateInterval_fromActivity_uuidType___block_invoke_113;
  v83[3] = &unk_1E92A62F8;
  v85 = a3;
  v67 = v82;
  v84 = v67;
  objc_msgSend(v67, "enumerateObjectsUsingBlock:", v83);

  return v67;
}

void __110__RTTripSegmentProvider_buildTinySegmentArrayForTransitionWithIndex_withinDateInterval_fromActivity_uuidType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_QWORD *)(a1 + 40);
    v16 = objc_msgSend(*(id *)(a1 + 32), "count");
    v15 = objc_msgSend(v5, "mode");
    objc_msgSend(v5, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "duration");
    *(_DWORD *)buf = 134219523;
    v19 = v17;
    v20 = 2048;
    v21 = v16;
    v22 = 2048;
    v23 = a3;
    v24 = 2048;
    v25 = v15;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v12;
    v30 = 2049;
    v31 = v14;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:tripSegmentGenerated,TransitionIndex,%tu,SegmentCount,%tu,SegmentIndex,%tu,mode,%zd,startTime,%@,endTime,%@,duration,%{private}.1f", buf, 0x48u);

  }
}

void __110__RTTripSegmentProvider_buildTinySegmentArrayForTransitionWithIndex_withinDateInterval_fromActivity_uuidType___block_invoke_113(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    v9 = 134218754;
    v10 = v7;
    v11 = 2048;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:chunkGenerated,TransitionIndex,%tu,ChunkCount,%tu,ChunkIndex,%tu,thisChunk,%@", (uint8_t *)&v9, 0x2Au);
  }

}

- (id)getTransitionlocations
{
  return self->_transitionLocations;
}

+ (BOOL)isLocationTypeSupported:(int)a3
{
  return (a3 < 0xE) & (0x2E1Au >> a3);
}

- (void)addToTransitionLocationsBuffer:(id)a3 forDateInterval:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *transitionLocations;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  __int128 v26;
  unint64_t v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_126);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isBeforeDate:", v11);

    if (v12)
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v33;
        v40 = 2112;
        v41 = v6;
        _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:addToTransitionLocationsBuffer Fetched location, %@, before the desired chunk time interval, %@", buf, 0x16u);

      }
    }
    objc_msgSend(v8, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isAfterDate:", v16);

    if (v17)
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "lastObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v34;
        v40 = 2112;
        v41 = v6;
        _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:addToTransitionLocationsBuffer Fetched location, %@, after the desired chunk time interval, %@", buf, 0x16u);

      }
    }

  }
  if (-[NSMutableArray count](self->_transitionLocations, "count"))
  {
    -[NSMutableArray lastObject](self->_transitionLocations, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timestamp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3880];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __72__RTTripSegmentProvider_addToTransitionLocationsBuffer_forDateInterval___block_invoke_116;
    v36[3] = &unk_1E92A6360;
    v37 = v20;
    transitionLocations = v20;
    objc_msgSend(v21, "predicateWithBlock:", v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObjectsFromArray:](self->_transitionLocations, "addObjectsFromArray:", v24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
    v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    transitionLocations = self->_transitionLocations;
    self->_transitionLocations = v25;
  }

  if (-[NSMutableArray count](self->_transitionLocations, "count"))
  {
    v27 = 0;
    *(_QWORD *)&v26 = 138412290;
    v35 = v26;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_transitionLocations, "objectAtIndexedSubscript:", v27, v35);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = +[RTTripSegmentProvider isLocationTypeSupported:](RTTripSegmentProvider, "isLocationTypeSupported:", objc_msgSend(v28, "type"));

      if (!v29)
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_transitionLocations, "objectAtIndexedSubscript:", v27);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "toString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v35;
          v39 = v32;
          _os_log_debug_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:addToTransitionLocationsBuffer Removing unsupported location %@", buf, 0xCu);

        }
        -[NSMutableArray removeObjectAtIndex:](self->_transitionLocations, "removeObjectAtIndex:", v27--);
      }
      ++v27;
    }
    while (v27 < -[NSMutableArray count](self->_transitionLocations, "count"));
  }

}

uint64_t __72__RTTripSegmentProvider_addToTransitionLocationsBuffer_forDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __72__RTTripSegmentProvider_addToTransitionLocationsBuffer_forDateInterval___block_invoke_116(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAfterDate:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)applyElevationAdjustmentToBreadcrumbs
{
  void *v2;
  void *v3;
  char v4;

  -[RTTripSegmentProvider defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsTripSegmentAdjustElevationForBreadcrumbs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (id)convertToTripSegmentLocations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0C9E430]);
        v12 = (void *)objc_msgSend(v11, "initWithCLLocation:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)processChunkWithIndex:(unint64_t)a3 inChunks:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  unint64_t v32;
  CLLocation *transitionStartLocation;
  NSObject *v34;
  void *v35;
  void *v36;
  CLLocation *transitionStopLocation;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSMutableArray *transitionLocations;
  void *v43;
  void *v44;
  uint64_t v45;
  dispatch_semaphore_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  dispatch_time_t v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  const char *v66;
  NSObject *v67;
  uint32_t v68;
  int v69;
  void *v70;
  dispatch_semaphore_t v71;
  NSObject *v72;
  RTElevationAdjuster *elevationAdjuster;
  uint64_t v74;
  NSObject *v75;
  NSObject *v76;
  dispatch_time_t v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  NSObject *v95;
  id v96;
  void *v97;
  int64_t v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  dispatch_semaphore_t v106;
  uint64_t v107;
  RTBackgroundInertialOdometryManager *inertialOdometryManager;
  NSObject *v109;
  void *v110;
  dispatch_time_t v111;
  void *v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  NSObject *v132;
  id v133;
  void *v134;
  int64_t v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  NSObject *v143;
  dispatch_semaphore_t v144;
  void *v145;
  CLTripSegmentProcessorOptions *tripProcessorOptions;
  id v147;
  NSObject *v148;
  NSObject *v149;
  void *v150;
  dispatch_time_t v151;
  void *v152;
  double v153;
  double v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  NSObject *v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  id v165;
  NSObject *v166;
  uint64_t v167;
  id *v168;
  NSObject *v169;
  char v170;
  void *v171;
  void *v172;
  int v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  uint64_t v188;
  NSObject *v189;
  NSObject *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  uint64_t v195;
  NSObject *v196;
  NSObject *v197;
  void *v198;
  id v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  void *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  id v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  id v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  void *v224;
  id v225;
  id v226;
  void *v227;
  void *v228;
  NSObject *v229;
  NSObject *v230;
  dispatch_semaphore_t v231;
  id v232;
  void *v233;
  void *v234;
  void *v235;
  id v236;
  _BOOL4 v237;
  id v238;
  void *v239;
  void *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  unint64_t v245;
  void *v246;
  NSObject *dsema;
  _QWORD v248[4];
  id v249;
  id v250;
  NSObject *v251;
  _BYTE *v252;
  unint64_t v253;
  uint64_t v254;
  _QWORD v255[4];
  dispatch_semaphore_t v256;
  id v257;
  RTTripSegmentProvider *v258;
  SEL v259;
  _QWORD v260[5];
  _QWORD v261[5];
  _QWORD v262[4];
  NSObject *v263;
  _BYTE *v264;
  uint64_t *v265;
  _QWORD v266[5];
  _QWORD v267[5];
  _QWORD v268[4];
  NSObject *v269;
  _BYTE *v270;
  uint64_t *v271;
  _QWORD v272[4];
  id v273;
  _QWORD v274[4];
  _QWORD v275[2];
  _QWORD v276[4];
  id v277[3];
  _QWORD v278[4];
  NSObject *v279;
  uint64_t *v280;
  uint64_t *v281;
  uint64_t v282;
  uint64_t *v283;
  uint64_t v284;
  uint64_t (*v285)(uint64_t, uint64_t);
  void (*v286)(uint64_t);
  id v287;
  uint64_t v288;
  uint64_t *v289;
  uint64_t v290;
  uint64_t (*v291)(uint64_t, uint64_t);
  void (*v292)(uint64_t);
  id v293;
  _BYTE buf[78];
  __int16 v295;
  void *v296;
  uint64_t v297;
  uint64_t *v298;
  uint64_t v299;
  uint64_t (*v300)(uint64_t, uint64_t);
  void (*v301)(uint64_t);
  id v302;
  _BYTE v303[24];
  uint64_t (*v304)(uint64_t, uint64_t);
  void (*v305)(uint64_t);
  id v306;
  CLLocation *v307;
  CLLocation *v308;
  _QWORD v309[4];

  v309[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "count") > a3)
  {
    v244 = v6;
    v245 = a3;
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = objc_msgSend(v6, "count") - 1;
    if (v242 == a3)
    {
      v237 = 1;
    }
    else
    {
      objc_msgSend(v246, "tripId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v244, "objectAtIndexedSubscript:", a3 + 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tripId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = v7 != v9;

    }
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v90 = objc_msgSend(v246, "transitionIndex");
      v91 = objc_msgSend(v244, "count");
      v92 = objc_msgSend(v246, "mode");
      objc_msgSend(v246, "tripId");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "dateInterval");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219778;
      *(_QWORD *)&buf[4] = v90;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v245;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v91;
      *(_WORD *)&buf[32] = 2048;
      *(_QWORD *)&buf[34] = v92;
      *(_WORD *)&buf[42] = 1024;
      *(_DWORD *)&buf[44] = v237;
      *(_WORD *)&buf[48] = 1024;
      *(_DWORD *)&buf[50] = v242 == v245;
      *(_WORD *)&buf[54] = 2112;
      *(_QWORD *)&buf[56] = v93;
      *(_WORD *)&buf[64] = 2112;
      *(_QWORD *)&buf[66] = v94;
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: processChunk,inTransition,%tu,chunkIndex,%tu,chunkCount,%tu,mode,%zd,isFinalSegmentPart,%d,isLastChunk,%d,tripId,%@,timeInterval,%@", buf, 0x4Au);

    }
    v11 = objc_alloc(MEMORY[0x1E0D184F0]);
    objc_msgSend(v246, "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v243 = (void *)objc_msgSend(v11, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v12, 0x7FFFFFFFFFFFFFFFLL, 0, 1.79769313e308);

    v288 = 0;
    v289 = &v288;
    v290 = 0x3032000000;
    v291 = __Block_byref_object_copy__175;
    v292 = __Block_byref_object_dispose__175;
    v293 = 0;
    v282 = 0;
    v283 = &v282;
    v284 = 0x3032000000;
    v285 = __Block_byref_object_copy__175;
    v286 = __Block_byref_object_dispose__175;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v287 = (id)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_semaphore_create(0);
    -[RTTripSegmentProvider locationManager](self, "locationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v278[0] = MEMORY[0x1E0C809B0];
    v278[1] = 3221225472;
    v278[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke;
    v278[3] = &unk_1E9296EE0;
    v280 = &v288;
    v281 = &v282;
    v15 = v13;
    v279 = v15;
    objc_msgSend(v14, "fetchStoredLocationsWithOptions:handler:", v243, v278);

    dsema = v15;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v17))
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v16);
    v20 = v19;
    v21 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_301);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "filteredArrayUsingPredicate:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "submitToCoreAnalytics:type:duration:", v25, 1, v20);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v27 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)v303 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v303, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = objc_retainAutorelease(v29);

    }
    else
    {
LABEL_12:
      v30 = 0;
    }

    v238 = v30;
    if (v238 || v289[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v125 = v289[5];
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v125;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v238;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: Failed in clLocations fetching,fetchError,%@,semaError,%@", buf, 0x16u);
      }

      goto LABEL_18;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__175;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__175;
    *(_QWORD *)&buf[40] = 0;
    v71 = dispatch_semaphore_create(0);
    if (v283[5]
      && -[RTTripSegmentProvider applyElevationAdjustmentToBreadcrumbs](self, "applyElevationAdjustmentToBreadcrumbs"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        v209 = objc_msgSend((id)v283[5], "count");
        *(_DWORD *)v303 = 134217984;
        *(_QWORD *)&v303[4] = v209;
        _os_log_debug_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: adjusting the elevation for %lu CLLocation breadcrumb samples", v303, 0xCu);
      }

      elevationAdjuster = self->_elevationAdjuster;
      v74 = v283[5];
      v276[0] = MEMORY[0x1E0C809B0];
      v276[1] = 3221225472;
      v276[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_123;
      v276[3] = &unk_1E9296EE0;
      v277[1] = buf;
      v277[2] = &v282;
      v75 = v71;
      v277[0] = v75;
      -[RTElevationAdjuster adjustElevationForLocations:handler:](elevationAdjuster, "adjustElevationForLocations:handler:", v74, v276);
      v76 = v75;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v76, v77))
        goto LABEL_97;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "timeIntervalSinceDate:", v239);
      v79 = v78;
      v80 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_301);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "filteredArrayUsingPredicate:", v81);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "firstObject");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v80, "submitToCoreAnalytics:type:duration:", v84, 1, v79);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v303 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v85, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v303, 2u);
      }

      v86 = (void *)MEMORY[0x1E0CB35C8];
      v297 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v303 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v303, &v297, 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if (v88)
      {
        v89 = objc_retainAutorelease(v88);

      }
      else
      {
LABEL_97:
        v89 = 0;
      }

      v238 = v89;
      if (v238 || *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        v168 = v277;
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v169 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
        {
          v210 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v303 = 138412546;
          *(_QWORD *)&v303[4] = v210;
          *(_WORD *)&v303[12] = 2112;
          *(_QWORD *)&v303[14] = v238;
          _os_log_error_impl(&dword_1D1A22000, v169, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: Failed in to adjust elevations for locations,adjustError,%@,semaError,%@", v303, 0x16u);
        }
        v170 = 0;
        goto LABEL_126;
      }

    }
    v198 = (void *)v283[5];
    v274[0] = MEMORY[0x1E0C809B0];
    v274[1] = 3221225472;
    v274[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_124;
    v274[3] = &unk_1E92A6388;
    v199 = v246;
    v275[0] = v199;
    v275[1] = &v282;
    objc_msgSend(v198, "enumerateObjectsUsingBlock:", v274);
    v168 = (id *)v275;
    if (!objc_msgSend((id)v283[5], "count"))
    {
      v238 = 0;
      v170 = 1;
LABEL_128:

      _Block_object_dispose(buf, 8);
      if ((v170 & 1) == 0)
        goto LABEL_93;
LABEL_18:
      v32 = v245;
      if (!v245)
      {
        transitionStartLocation = self->_transitionStartLocation;
        if (transitionStartLocation)
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            -[CLLocation toString](self->_transitionStartLocation, "toString");
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v183;
            _os_log_debug_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: adding LOI start location, %@", buf, 0xCu);

          }
          v308 = self->_transitionStartLocation;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v308, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v246, "dateInterval");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTTripSegmentProvider addToTransitionLocationsBuffer:forDateInterval:](self, "addToTransitionLocationsBuffer:forDateInterval:", v35, v36);

          transitionStartLocation = self->_transitionStartLocation;
        }
        self->_transitionStartLocation = 0;

        v32 = 0;
      }
      if (v242 == v32)
      {
        transitionStopLocation = self->_transitionStopLocation;
        if (transitionStopLocation)
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            -[CLLocation toString](self->_transitionStopLocation, "toString");
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v171;
            _os_log_debug_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: adding LOI stop location, %@", buf, 0xCu);

          }
          v307 = self->_transitionStopLocation;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v307, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v246, "dateInterval");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTTripSegmentProvider addToTransitionLocationsBuffer:forDateInterval:](self, "addToTransitionLocationsBuffer:forDateInterval:", v39, v40);

          transitionStopLocation = self->_transitionStopLocation;
        }
        self->_transitionStopLocation = 0;

      }
      if (!-[NSMutableArray count](self->_transitionLocations, "count"))
      {
        -[NSMutableArray removeAllObjects](self->_transitionLocations, "removeAllObjects");
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v65 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
LABEL_92:

LABEL_93:
          _Block_object_dispose(&v282, 8);

          _Block_object_dispose(&v288, 8);
          v6 = v244;
          goto LABEL_94;
        }
        *(_WORD *)buf = 0;
        v66 = "RTTripSegmentProvider: No locations exist in current chunk, skip and move to the next one";
        v67 = v65;
        v68 = 2;
LABEL_96:
        _os_log_debug_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_DEBUG, v66, buf, v68);
        goto LABEL_92;
      }
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v126 = objc_msgSend(v246, "transitionIndex");
        objc_msgSend(v246, "tripId");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "UUIDString");
        v128 = (id)objc_claimAutoreleasedReturnValue();
        v129 = objc_msgSend(v246, "mode");
        v130 = -[NSMutableArray count](self->_transitionLocations, "count");
        if (v130)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_transitionLocations, "objectAtIndexedSubscript:", 0);
          v131 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v131 = &unk_1E93298A0;
        }
        v181 = -[NSMutableArray count](self->_transitionLocations, "count");
        *(_DWORD *)buf = 134219266;
        *(_QWORD *)&buf[4] = v126;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v245;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v128;
        *(_WORD *)&buf[32] = 2048;
        *(_QWORD *)&buf[34] = v129;
        *(_WORD *)&buf[42] = 2112;
        *(_QWORD *)&buf[44] = v131;
        *(_WORD *)&buf[52] = 2048;
        *(_QWORD *)&buf[54] = v181;
        _os_log_debug_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: bufferedCLLocations,transitionIndex,%tu,chunkIndex,%zu,segmentUUID,%@,mode,%zd,firstBuffedLoc,%@,bufferedLocCount,%tu", buf, 0x3Eu);
        if (v130)

      }
      if ((unint64_t)-[NSMutableArray count](self->_transitionLocations, "count") < 2)
      {
        if (!v237)
        {
LABEL_90:
          -[NSMutableArray removeObjectsInRange:](self->_transitionLocations, "removeObjectsInRange:", 0, -[NSMutableArray count](self->_transitionLocations, "count") - 1);
          v69 = 0;
          goto LABEL_91;
        }
      }
      else
      {
        transitionLocations = self->_transitionLocations;
        v272[0] = MEMORY[0x1E0C809B0];
        v272[1] = 3221225472;
        v272[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_127;
        v272[3] = &unk_1E929A988;
        v232 = v246;
        v273 = v232;
        -[NSMutableArray enumerateObjectsUsingBlock:](transitionLocations, "enumerateObjectsUsingBlock:", v272);
        -[NSMutableArray firstObject](self->_transitionLocations, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "timestamp");
        v234 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableArray lastObject](self->_transitionLocations, "lastObject");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "timestamp");
        v233 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v234, "isBeforeDate:", v233))
        {
          v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v234, v233);
          v228 = (void *)v45;
          if (self->_usingLegacyInertialData)
          {
            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)v303 = 0;
            *(_QWORD *)&v303[8] = v303;
            *(_QWORD *)&v303[16] = 0x3032000000;
            v304 = __Block_byref_object_copy__175;
            v305 = __Block_byref_object_dispose__175;
            v306 = 0;
            v297 = 0;
            v298 = &v297;
            v299 = 0x3032000000;
            v300 = __Block_byref_object_copy__175;
            v301 = __Block_byref_object_dispose__175;
            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v302 = (id)objc_claimAutoreleasedReturnValue();
            v46 = dispatch_semaphore_create(0);
            v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18540]), "initWithDateInterval:", v45);
            -[RTTripSegmentInertialDataManager inertialDataStore](self->_inertialDataManager, "inertialDataStore");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v268[0] = MEMORY[0x1E0C809B0];
            v268[1] = 3221225472;
            v268[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_129;
            v268[3] = &unk_1E9296EE0;
            v270 = v303;
            v271 = &v297;
            v49 = v46;
            v269 = v49;
            objc_msgSend(v48, "fetchStoredTripSegmentInertialDataWithOptions:handler:", v47, v268);
            v223 = (void *)v47;

            v229 = v49;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v229, v51))
              goto LABEL_54;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "timeIntervalSinceDate:", v50);
            v54 = v53;
            v55 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_301);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "filteredArrayUsingPredicate:", v56);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "firstObject");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v55, "submitToCoreAnalytics:type:duration:", v59, 1, v54);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            v61 = (void *)MEMORY[0x1E0CB35C8];
            v309[0] = *MEMORY[0x1E0CB2D50];
            *(_QWORD *)buf = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v309, 1);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (v63)
            {
              v64 = objc_retainAutorelease(v63);

            }
            else
            {
LABEL_54:
              v64 = 0;
            }

            v225 = v64;
            if (v225 || *(_QWORD *)(*(_QWORD *)&v303[8] + 40))
            {
              _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              v95 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
              {
                v201 = objc_msgSend(v232, "transitionIndex");
                objc_msgSend(v232, "tripId");
                v202 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v202, "UUIDString");
                v203 = (void *)objc_claimAutoreleasedReturnValue();
                v204 = *(_QWORD *)(*(_QWORD *)&v303[8] + 40);
                *(_DWORD *)buf = 134218755;
                *(_QWORD *)&buf[4] = v201;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v203;
                *(_WORD *)&buf[22] = 2113;
                *(_QWORD *)&buf[24] = v204;
                *(_WORD *)&buf[32] = 2113;
                *(_QWORD *)&buf[34] = v225;
                _os_log_debug_impl(&dword_1D1A22000, v95, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: Failed in trip segment inertial data fetching,transitionIndex,%tu,segmentUUID,%@,fetchError,%{private}@,semaError,%{private}@", buf, 0x2Au);

              }
            }
            else if (objc_msgSend((id)v298[5], "count"))
            {
              v184 = (void *)v298[5];
              v267[0] = MEMORY[0x1E0C809B0];
              v267[1] = 3221225472;
              v267[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_130;
              v267[3] = &unk_1E92A63B0;
              v267[4] = self;
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v267);
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v184, "filteredArrayUsingPredicate:", v185);
              v186 = (void *)objc_claimAutoreleasedReturnValue();

              v266[0] = MEMORY[0x1E0C809B0];
              v266[1] = 3221225472;
              v266[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_2;
              v266[3] = &unk_1E92A63B0;
              v266[4] = self;
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v266);
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v186, "filteredArrayUsingPredicate:", v187);
              v227 = (void *)objc_claimAutoreleasedReturnValue();

              v188 = objc_msgSend(v227, "count");
              if (v188 != objc_msgSend((id)v298[5], "count"))
              {
                _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                v189 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_1D1A22000, v189, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:inertial data fetched are out of location-based dateInterval", buf, 2u);
                }

              }
              _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              v190 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v190, OS_LOG_TYPE_DEBUG))
              {
                v211 = objc_msgSend(v232, "transitionIndex");
                objc_msgSend(v232, "tripId");
                v212 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v212, "UUIDString");
                v213 = (id)objc_claimAutoreleasedReturnValue();
                v214 = objc_msgSend(v232, "mode");
                v215 = objc_msgSend((id)v298[5], "count");
                v216 = objc_msgSend(v227, "count");
                *(_DWORD *)buf = 134219010;
                *(_QWORD *)&buf[4] = v211;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v213;
                *(_WORD *)&buf[22] = 2048;
                *(_QWORD *)&buf[24] = v214;
                *(_WORD *)&buf[32] = 2048;
                *(_QWORD *)&buf[34] = v215;
                *(_WORD *)&buf[42] = 2048;
                *(_QWORD *)&buf[44] = v216;
                _os_log_debug_impl(&dword_1D1A22000, v190, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:Succeeded in trip segment inertial data fetching,transitionIndex,%tu,segmentUUID,%@,mode,%zd,count,%tu,inputInertialCount,%tu", buf, 0x34u);

              }
            }
            v96 = objc_alloc(MEMORY[0x1E0C9E428]);
            objc_msgSend(v232, "tripId");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = +[RTTripSegmentProvider CLTripModeFromRTModeOfTransportation:](RTTripSegmentProvider, "CLTripModeFromRTModeOfTransportation:", objc_msgSend(v232, "mode"));
            +[RTTripSegmentProvider convertToTripSegmentLocations:](RTTripSegmentProvider, "convertToTripSegmentLocations:", self->_transitionLocations);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_alloc(MEMORY[0x1E0C9E430]);
            -[NSMutableArray firstObject](self->_transitionLocations, "firstObject");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = (void *)objc_msgSend(v100, "initWithCLLocation:", v101);
            v103 = objc_alloc(MEMORY[0x1E0C9E430]);
            -[NSMutableArray lastObject](self->_transitionLocations, "lastObject");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = (void *)objc_msgSend(v103, "initWithCLLocation:", v104);
            v70 = (void *)objc_msgSend(v96, "initWithTripSegmentID:isFinalPart:modeOfTransport:tripLocations:startTripLocation:stopTripLocation:inertialData:", v97, v237, v98, v99, v102, v105, v227);

            _Block_object_dispose(&v297, 8);
            _Block_object_dispose(v303, 8);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)v303 = 0;
            *(_QWORD *)&v303[8] = v303;
            *(_QWORD *)&v303[16] = 0x3032000000;
            v304 = __Block_byref_object_copy__175;
            v305 = __Block_byref_object_dispose__175;
            v306 = 0;
            v297 = 0;
            v298 = &v297;
            v299 = 0x3032000000;
            v300 = __Block_byref_object_copy__175;
            v301 = __Block_byref_object_dispose__175;
            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v302 = (id)objc_claimAutoreleasedReturnValue();
            v106 = dispatch_semaphore_create(0);
            v107 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18350]), "initWithDateInterval:", v45);
            inertialOdometryManager = self->_inertialOdometryManager;
            v262[0] = MEMORY[0x1E0C809B0];
            v262[1] = 3221225472;
            v262[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_134;
            v262[3] = &unk_1E9296EE0;
            v264 = v303;
            v265 = &v297;
            v109 = v106;
            v263 = v109;
            -[RTBackgroundInertialOdometryManager fetchBackgroundInertialOdometrySamplesWithOptions:handler:](inertialOdometryManager, "fetchBackgroundInertialOdometrySamplesWithOptions:handler:", v107, v262);
            v224 = (void *)v107;
            v230 = v109;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v230, v111))
              goto LABEL_68;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "timeIntervalSinceDate:", v110);
            v114 = v113;
            v115 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_301);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "filteredArrayUsingPredicate:", v116);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "firstObject");
            v119 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v115, "submitToCoreAnalytics:type:duration:", v119, 1, v114);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v120 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D1A22000, v120, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            v121 = (void *)MEMORY[0x1E0CB35C8];
            v309[0] = *MEMORY[0x1E0CB2D50];
            *(_QWORD *)buf = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v309, 1);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();

            if (v123)
            {
              v124 = objc_retainAutorelease(v123);

            }
            else
            {
LABEL_68:
              v124 = 0;
            }

            v226 = v124;
            if (v226 || *(_QWORD *)(*(_QWORD *)&v303[8] + 40))
            {
              _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              v132 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
              {
                v205 = objc_msgSend(v232, "transitionIndex");
                objc_msgSend(v232, "tripId");
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v206, "UUIDString");
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                v208 = *(_QWORD *)(*(_QWORD *)&v303[8] + 40);
                *(_DWORD *)buf = 134218755;
                *(_QWORD *)&buf[4] = v205;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v207;
                *(_WORD *)&buf[22] = 2113;
                *(_QWORD *)&buf[24] = v208;
                *(_WORD *)&buf[32] = 2113;
                *(_QWORD *)&buf[34] = v226;
                _os_log_debug_impl(&dword_1D1A22000, v132, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: Failed in trip segment inertial data fetching,transitionIndex,%tu,segmentUUID,%@,fetchError,%{private}@,semaError,%{private}@", buf, 0x2Au);

              }
            }
            else if (objc_msgSend((id)v298[5], "count"))
            {
              v191 = (void *)v298[5];
              v261[0] = MEMORY[0x1E0C809B0];
              v261[1] = 3221225472;
              v261[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_135;
              v261[3] = &unk_1E92A63D8;
              v261[4] = self;
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v261);
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v191, "filteredArrayUsingPredicate:", v192);
              v193 = (void *)objc_claimAutoreleasedReturnValue();

              v260[0] = MEMORY[0x1E0C809B0];
              v260[1] = 3221225472;
              v260[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_2_137;
              v260[3] = &unk_1E92A63D8;
              v260[4] = self;
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v260);
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v193, "filteredArrayUsingPredicate:", v194);
              v227 = (void *)objc_claimAutoreleasedReturnValue();

              v195 = objc_msgSend(v227, "count");
              if (v195 != objc_msgSend((id)v298[5], "count"))
              {
                _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                v196 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_1D1A22000, v196, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:inertial data fetched are out of location-based dateInterval", buf, 2u);
                }

              }
              _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              v197 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v197, OS_LOG_TYPE_DEBUG))
              {
                v217 = objc_msgSend(v232, "transitionIndex");
                objc_msgSend(v232, "tripId");
                v218 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v218, "UUIDString");
                v219 = (id)objc_claimAutoreleasedReturnValue();
                v220 = objc_msgSend(v232, "mode");
                v221 = objc_msgSend((id)v298[5], "count");
                v222 = objc_msgSend(v227, "count");
                *(_DWORD *)buf = 134219010;
                *(_QWORD *)&buf[4] = v217;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v219;
                *(_WORD *)&buf[22] = 2048;
                *(_QWORD *)&buf[24] = v220;
                *(_WORD *)&buf[32] = 2048;
                *(_QWORD *)&buf[34] = v221;
                *(_WORD *)&buf[42] = 2048;
                *(_QWORD *)&buf[44] = v222;
                _os_log_debug_impl(&dword_1D1A22000, v197, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:Succeeded in trip segment inertial data fetching,transitionIndex,%tu,segmentUUID,%@,mode,%zd,count,%tu,inputInertialCount,%tu", buf, 0x34u);

              }
            }
            v133 = objc_alloc(MEMORY[0x1E0C9E428]);
            objc_msgSend(v232, "tripId");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            v135 = +[RTTripSegmentProvider CLTripModeFromRTModeOfTransportation:](RTTripSegmentProvider, "CLTripModeFromRTModeOfTransportation:", objc_msgSend(v232, "mode"));
            +[RTTripSegmentProvider convertToTripSegmentLocations:](RTTripSegmentProvider, "convertToTripSegmentLocations:", self->_transitionLocations);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = objc_alloc(MEMORY[0x1E0C9E430]);
            -[NSMutableArray firstObject](self->_transitionLocations, "firstObject");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = (void *)objc_msgSend(v137, "initWithCLLocation:", v138);
            v140 = objc_alloc(MEMORY[0x1E0C9E430]);
            -[NSMutableArray lastObject](self->_transitionLocations, "lastObject");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            v142 = (void *)objc_msgSend(v140, "initWithCLLocation:", v141);
            v70 = (void *)objc_msgSend(v133, "initWithTripSegmentID:isFinalPart:modeOfTransport:tripLocations:startTripLocation:stopTripLocation:inertialOdometryData:", v134, v237, v135, v136, v139, v142, v227);

            _Block_object_dispose(&v297, 8);
            _Block_object_dispose(v303, 8);

          }
        }
        else
        {
          v70 = 0;
          v228 = 0;
        }
        v255[0] = MEMORY[0x1E0C809B0];
        v255[1] = 3221225472;
        v255[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_138;
        v255[3] = &unk_1E92A6428;
        v231 = v234;
        v256 = v231;
        v236 = v233;
        v257 = v236;
        v258 = self;
        v259 = a2;
        v241 = (void *)MEMORY[0x1D8232094](v255);
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v143 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v70, "tripSegmentID");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = objc_msgSend(v70, "isFinalPart");
          v174 = objc_msgSend(v70, "modeOfTransport");
          objc_msgSend(v70, "tripLocations");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = objc_msgSend(v175, "count");
          objc_msgSend(v236, "timeIntervalSinceDate:", v231);
          v178 = v177;
          -[NSMutableArray firstObject](self->_transitionLocations, "firstObject");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray lastObject](self->_transitionLocations, "lastObject");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138414338;
          *(_QWORD *)&buf[4] = v172;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v173;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = v174;
          *(_WORD *)&buf[28] = 2048;
          *(_QWORD *)&buf[30] = v176;
          *(_WORD *)&buf[38] = 2112;
          *(_QWORD *)&buf[40] = v231;
          *(_WORD *)&buf[48] = 2112;
          *(_QWORD *)&buf[50] = v236;
          *(_WORD *)&buf[58] = 2048;
          *(_QWORD *)&buf[60] = v178;
          *(_WORD *)&buf[68] = 2112;
          *(_QWORD *)&buf[70] = v179;
          v295 = 2112;
          v296 = v180;
          _os_log_debug_impl(&dword_1D1A22000, v143, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:tripInputData,ID,%@,isFinalPart,%d,mode,%zd,locationCount,%tu,startDate,%@,endDate,%@,Interval,%.3lf,firstBreadcrumb,%@,lastBreadcrumb,%@", buf, 0x58u);

        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&buf[24] = __Block_byref_object_copy__175;
        *(_QWORD *)&buf[32] = __Block_byref_object_dispose__175;
        *(_QWORD *)&buf[40] = 0;
        v144 = dispatch_semaphore_create(0);
        -[RTTripSegmentProvider tripProcessorManager](self, "tripProcessorManager");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        tripProcessorOptions = self->_tripProcessorOptions;
        v248[0] = MEMORY[0x1E0C809B0];
        v248[1] = 3221225472;
        v248[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_142;
        v248[3] = &unk_1E92A6450;
        v249 = v232;
        v253 = v245;
        v254 = v242;
        v147 = v70;
        v250 = v147;
        v252 = buf;
        v148 = v144;
        v251 = v148;
        objc_msgSend(v145, "processTripSegmentData:withOptions:outputHandler:completionHandler:", v147, tripProcessorOptions, v241, v248);

        v149 = v148;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v149, v151))
          goto LABEL_83;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "timeIntervalSinceDate:", v150);
        v154 = v153;
        v155 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_301);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "filteredArrayUsingPredicate:", v156);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "firstObject");
        v159 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v155, "submitToCoreAnalytics:type:duration:", v159, 1, v154);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v160 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v303 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v160, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v303, 2u);
        }

        v161 = (void *)MEMORY[0x1E0CB35C8];
        v297 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v303 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v303, &v297, 1);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v162);
        v163 = (void *)objc_claimAutoreleasedReturnValue();

        if (v163)
        {
          v164 = objc_retainAutorelease(v163);

        }
        else
        {
LABEL_83:
          v164 = 0;
        }

        v165 = v164;
        if (v165 || *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v166 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
          {
            v182 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v303 = 138412546;
            *(_QWORD *)&v303[4] = v182;
            *(_WORD *)&v303[12] = 2112;
            *(_QWORD *)&v303[14] = v165;
            _os_log_error_impl(&dword_1D1A22000, v166, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: Failed in processTripSegmentData,procError,%@,procSemaError,%@", v303, 0x16u);
          }

        }
        _Block_object_dispose(buf, 8);

        if (!v237)
          goto LABEL_90;
      }
      -[NSMutableArray removeAllObjects](self->_transitionLocations, "removeAllObjects");
      v69 = 1;
LABEL_91:
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v65 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        goto LABEL_92;
      v167 = objc_msgSend(v246, "transitionIndex");
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = v167;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v245;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v242;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v69;
      v66 = "RTTripSegmentProvider: processTripSegmentData,compledOneChunk,transitionIndex,%tu,currentChunkIndex,%tu,last"
            "ChunkIndex,%tu,isFinalPart,%d";
      v67 = v65;
      v68 = 38;
      goto LABEL_96;
    }
    v200 = v283[5];
    objc_msgSend(v199, "dateInterval");
    v169 = objc_claimAutoreleasedReturnValue();
    -[RTTripSegmentProvider addToTransitionLocationsBuffer:forDateInterval:](self, "addToTransitionLocationsBuffer:forDateInterval:", v200, v169);
    v238 = 0;
    v170 = 1;
LABEL_126:

    goto LABEL_128;
  }
LABEL_94:

}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    v10 = 134217984;
    v11 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: _elevationAdjuster returned with %lu CLLocation breadcrumb samples", (uint8_t *)&v10, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "transitionIndex");
    objc_msgSend(*(id *)(a1 + 32), "tripId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "mode");
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    objc_msgSend(v3, "toString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134219010;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    v15 = 2048;
    v16 = v8;
    v17 = 2048;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetchedCLLocations,transitionIndex,%tu,segmentUUID,%@,mode,%zd,locCount,%tu,location,%@", (uint8_t *)&v11, 0x34u);

  }
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "transitionIndex");
    objc_msgSend(*(id *)(a1 + 32), "tripId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "mode");
    objc_msgSend(v3, "toString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218754;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:breadcrumbLocations,transitionIndex,%tu,tripSegmentUUID,%@,mode,%zd,location,%@", (uint8_t *)&v10, 0x2Au);

  }
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_130(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isAfterDate:", v5);

  return v6;
}

uint64_t __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isBeforeDate:", v5);

  return v6;
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_135(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "cfAbsTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isAfterDate:", v5);

  return v6;
}

uint64_t __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_2_137(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "cfAbsTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isBeforeDate:", v5);

  return v6;
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_138(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id *v17;
  id v18;
  NSObject *v19;
  void *v20;
  dispatch_time_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  _BYTE *v45;
  uint64_t v46;
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  __int128 v49;
  uint64_t v50;
  uint8_t v51[16];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_14;
  objc_msgSend(v3, "tripLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isBeforeDate:", a1[4]))
  {

LABEL_5:
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "tripLocations");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timestamp");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = a1[4];
      objc_msgSend(v4, "tripLocations");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "timestamp");
      v39 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      v40 = a1[5];
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2112;
      v48 = v39;
      LOWORD(v49) = 2112;
      *(_QWORD *)((char *)&v49 + 2) = v40;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider:reconstructed location beyond desired time interval,%@,%@,%@,%@", buf, 0x2Au);

    }
    goto LABEL_8;
  }
  objc_msgSend(v4, "tripLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAfterDate:", a1[5]);

  if (v11)
    goto LABEL_5;
LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v48 = __Block_byref_object_copy__175;
  *(_QWORD *)&v49 = __Block_byref_object_dispose__175;
  *((_QWORD *)&v49 + 1) = 0;
  v13 = dispatch_semaphore_create(0);
  v14 = *(void **)(a1[6] + 40);
  v15 = objc_msgSend(v4, "isFinalPart");
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_139;
  v42[3] = &unk_1E92A6400;
  v46 = a1[7];
  v43 = v4;
  v45 = buf;
  v16 = v13;
  v44 = v16;
  objc_msgSend(v14, "addTripSegmentData:isEndOfSegment:handler:", v43, v15, v42);
  v17 = (id *)(*(_QWORD *)&buf[8] + 40);
  v18 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v19 = v16;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v19, v21))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeIntervalSinceDate:", v20);
    v23 = v22;
    v24 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_301);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "filteredArrayUsingPredicate:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "submitToCoreAnalytics:type:duration:", v28, 1, v23);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v51 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v51, 2u);
    }

    v30 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v51 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v18 = objc_retainAutorelease(v32);

    }
  }

  objc_storeStrong(v17, v18);
  _Block_object_dispose(buf, 8);

LABEL_14:
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_139(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "tripSegmentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "isFinalPart");
    v12 = 138413314;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 1024;
    v19 = v11;
    v20 = 2112;
    v21 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:%@, addedTripSegment, %@, tripId,%@, isFinalPart, %d, error, %@", (uint8_t *)&v12, 0x30u);

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __56__RTTripSegmentProvider_processChunkWithIndex_inChunks___block_invoke_142(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "transitionIndex");
      v7 = *(_QWORD *)(a1 + 64);
      v8 = *(_QWORD *)(a1 + 72);
      v9 = objc_msgSend(*(id *)(a1 + 40), "isFinalPart");
      objc_msgSend(*(id *)(a1 + 40), "tripSegmentID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v23 = v6;
      v24 = 2048;
      v25 = v7;
      v26 = 2048;
      v27 = v8;
      v28 = 1024;
      v29 = v9;
      v30 = 2112;
      v31 = (uint64_t)v10;
      v32 = 2112;
      v33 = (uint64_t)v3;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: processTripSegmentData,fail,transitionIndex,%tu,chunkIndex,%tu,lastIndex,%tu,isFinalPart,%d,tripId,%@,receivedError,%@,completionHandler", buf, 0x3Au);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "transitionIndex");
    v15 = *(_QWORD *)(a1 + 64);
    v21 = *(_QWORD *)(a1 + 72);
    v16 = objc_msgSend(*(id *)(a1 + 40), "isFinalPart");
    objc_msgSend(*(id *)(a1 + 40), "tripLocations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    v19 = objc_msgSend(*(id *)(a1 + 40), "modeOfTransport");
    objc_msgSend(*(id *)(a1 + 40), "tripSegmentID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219522;
    v23 = v14;
    v24 = 2048;
    v25 = v15;
    v26 = 2048;
    v27 = v21;
    v28 = 1024;
    v29 = v16;
    v30 = 2048;
    v31 = v18;
    v32 = 2048;
    v33 = v19;
    v34 = 2112;
    v35 = v20;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: processTripSegmentData,success,transitionIndex,%tu,currentChunkIndex,%tu,lastChunkIndex,%tu,isFinalPart,%d,locationCount,%tu,mode,%zd,tripId,%@", buf, 0x44u);

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;
  v13 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)collectVehicleConnectionTimeIntervals:(id)a3
{
  uint64_t v4;
  dispatch_semaphore_t v5;
  RTVehicleStore *vehicleStore;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  NSObject *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _BYTE buf[12];
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _QWORD v70[4];

  v70[1] = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18500]), "initWithDateInterval:limit:", v42, 0);
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__175;
  v62 = __Block_byref_object_dispose__175;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__175;
  v56 = __Block_byref_object_dispose__175;
  v57 = 0;
  v5 = dispatch_semaphore_create(0);
  vehicleStore = self->_vehicleStore;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __63__RTTripSegmentProvider_collectVehicleConnectionTimeIntervals___block_invoke;
  v48[3] = &unk_1E9296EE0;
  v50 = &v52;
  v51 = &v58;
  v7 = v5;
  v49 = v7;
  v41 = (void *)v4;
  -[RTVehicleStore fetchVehiclesWithOptions:handler:](vehicleStore, "fetchVehiclesWithOptions:handler:", v4, v48);
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v8, v10))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v9);
    v13 = v12;
    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_301);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v70[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v70, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v22 = objc_retainAutorelease(v22);

    }
  }
  else
  {
    v22 = 0;
  }

  v23 = v22;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 || v59[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v40 = v59[5];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v40;
      v65 = 2112;
      v66 = v23;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: failed in vehicle connection fetching,fetchError,%@,semaError,%@", buf, 0x16u);
    }
  }
  else
  {
    v27 = (void *)v53[5];
    if (v27 && objc_msgSend(v27, "count"))
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v25 = (id)v53[5];
      v28 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v44, v69, 16);
      if (v28)
      {
        v43 = 0;
        v29 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v45 != v29)
              objc_enumerationMutation(v25);
            v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v31, "dateInterval");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v32);

            _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              v34 = v24;
              v35 = v25;
              v36 = v23;
              v37 = v8;
              v38 = objc_msgSend((id)v53[5], "count");
              objc_msgSend(v31, "dateInterval");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              *(_QWORD *)&buf[4] = v38;
              v65 = 2048;
              v66 = (id)(v43 + i);
              v67 = 2112;
              v68 = v39;
              _os_log_debug_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: VehicleConnectionTimeIntervals,count,%tu,index,%tu,dateInterval,%@", buf, 0x20u);

              v8 = v37;
              v23 = v36;
              v25 = v35;
              v24 = v34;
            }

          }
          v28 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v44, v69, 16);
          v43 += i;
        }
        while (v28);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v42;
        _os_log_debug_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: collectVehicleConnectionTimeIntervals, no vehicles found for transitionInterval,%@", buf, 0xCu);
      }
    }
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v24;
}

void __63__RTTripSegmentProvider_collectVehicleConnectionTimeIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)buildTripSegmentsForOneLearnedTransitionWithIndex:(unint64_t)a3 inTransitions:(id)a4 trainMode:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  _BOOL4 v39;
  NSObject *v40;
  void *v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  CLLocation *v52;
  CLLocation *transitionStartLocation;
  CLLocation *v54;
  CLLocation *transitionStopLocation;
  NSObject *v56;
  void *v57;
  void *v58;
  CLLocation *v59;
  CLLocation *v60;
  CLLocation *v61;
  CLLocation *v62;
  unint64_t i;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  NSObject *dsema;
  void *v75;
  _QWORD v76[4];
  NSObject *v77;
  id v78;
  unint64_t v79;
  _QWORD v80[4];
  NSObject *v81;
  unint64_t v82;
  _QWORD v83[6];
  _QWORD v84[4];
  NSObject *v85;
  __int128 *p_buf;
  uint64_t *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  _BYTE v94[12];
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  CLLocation *v98;
  __int128 buf;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  _QWORD v104[4];

  v104[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a5;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: buildTripSegmentsForOneLearnedTransitionWithIndex, trainMode, %lu", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v7, "count") && objc_msgSend(v7, "count") - 1 >= a3)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v75, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "stopDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);

    -[RTTripSegmentProvider collectVehicleConnectionTimeIntervals:](self, "collectVehicleConnectionTimeIntervals:", v71);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v100 = 0x3032000000;
    v101 = __Block_byref_object_copy__175;
    v102 = __Block_byref_object_dispose__175;
    v103 = 0;
    v88 = 0;
    v89 = &v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__175;
    v92 = __Block_byref_object_dispose__175;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v93 = (id)objc_claimAutoreleasedReturnValue();
    v12 = dispatch_semaphore_create(0);
    -[RTTripSegmentProvider motionActivityManager](self, "motionActivityManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "stopDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke;
    v84[3] = &unk_1E9296EE0;
    p_buf = &buf;
    v87 = &v88;
    v16 = v12;
    v85 = v16;
    objc_msgSend(v13, "fetchMotionActivitiesFromStartDate:endDate:handler:", v14, v15, v84);

    dsema = v16;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v18))
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v17);
    v21 = v20;
    v22 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_301);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v94 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v94, 2u);
    }

    v28 = (void *)MEMORY[0x1E0CB35C8];
    v104[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v94 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v104, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = objc_retainAutorelease(v30);

    }
    else
    {
LABEL_10:
      v31 = 0;
    }

    v32 = v31;
    if (v32 || *(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v44 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v94 = 138412546;
        *(_QWORD *)&v94[4] = v44;
        v95 = 2112;
        v96 = (uint64_t)v32;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: failed in motion activity fetching,fetchError,%@,semaError,%@", v94, 0x16u);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v64 = objc_msgSend((id)v89[5], "count");
        *(_DWORD *)v94 = 134218240;
        *(_QWORD *)&v94[4] = a3;
        v95 = 2048;
        v96 = v64;
        _os_log_debug_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetchedMotionActivitySummary,transitionIndex,%tu,countOfFetchedActivities,%tu", v94, 0x16u);
      }

      v35 = (void *)v89[5];
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_144;
      v83[3] = &unk_1E92A6478;
      v83[4] = &v88;
      v83[5] = a3;
      objc_msgSend(v35, "enumerateObjectsUsingBlock:", v83);
      v33 = objc_opt_new();
      -[NSObject removeNonTransportationModeActivities:dateInterval:vehicleIntervals:predominantActivityType:](v33, "removeNonTransportationModeActivities:dateInterval:vehicleIntervals:predominantActivityType:", v89[5], v71, v70, objc_msgSend(v75, "predominantMotionActivityType"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");
      v69 = v36;
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
      if (v37)
      {
        if (v39)
        {
          v65 = objc_msgSend(v69, "count");
          *(_DWORD *)v94 = 134218240;
          *(_QWORD *)&v94[4] = a3;
          v95 = 2048;
          v96 = v65;
          _os_log_debug_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: filteredMotionActivitySummary,transitionIndex,%tu,activityCount,%tu", v94, 0x16u);
        }

        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_147;
        v80[3] = &unk_1E92A64A0;
        v82 = a3;
        v40 = v69;
        v81 = v40;
        -[NSObject enumerateObjectsUsingBlock:](v40, "enumerateObjectsUsingBlock:", v80);
        if (a5 == 1)
        {
          objc_msgSend(v75, "identifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = +[RTTripSegmentManager tripSegmentUUIDTypeFromUUID:](RTTripSegmentManager, "tripSegmentUUIDTypeFromUUID:", v41) != 0;

        }
        else
        {
          v42 = 1;
        }
        -[RTTripSegmentProvider buildTinySegmentArrayForTransitionWithIndex:withinDateInterval:fromActivity:uuidType:](self, "buildTinySegmentArrayForTransitionWithIndex:withinDateInterval:fromActivity:uuidType:", a3, v71, v40, v42, v69);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v66 = objc_msgSend(v45, "count");
          *(_DWORD *)v94 = 134218240;
          *(_QWORD *)&v94[4] = a3;
          v95 = 2048;
          v96 = v66;
          _os_log_debug_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:generatedChunksSummary,transitionIndex,%tu,chunkCount,%tu", v94, 0x16u);
        }

        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_148;
        v76[3] = &unk_1E92A64C8;
        v79 = a3;
        v77 = v40;
        v47 = v45;
        v78 = v47;
        objc_msgSend(v47, "enumerateObjectsUsingBlock:", v76);
        -[RTTripSegmentTransitionPreprocessor transitionStartStopLocations](self->_transitionPreprocessor, "transitionStartStopLocations");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "identifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "UUIDString");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", v51);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
        {
          objc_msgSend(v73, "startLocation");
          v52 = (CLLocation *)objc_claimAutoreleasedReturnValue();
          transitionStartLocation = self->_transitionStartLocation;
          self->_transitionStartLocation = v52;

          objc_msgSend(v73, "stopLocation");
          v54 = (CLLocation *)objc_claimAutoreleasedReturnValue();
          transitionStopLocation = self->_transitionStopLocation;
          self->_transitionStopLocation = v54;

          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "identifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = self->_transitionStartLocation;
            v60 = self->_transitionStopLocation;
            *(_DWORD *)v94 = 138412802;
            *(_QWORD *)&v94[4] = v58;
            v95 = 2112;
            v96 = (uint64_t)v59;
            v97 = 2112;
            v98 = v60;
            _os_log_debug_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetch endpoints for transition identifier, %@, _transitionStartLocation, %@, _transitionStopLocation, %@", v94, 0x20u);

          }
        }
        else
        {
          v61 = self->_transitionStartLocation;
          self->_transitionStartLocation = 0;

          v62 = self->_transitionStopLocation;
          self->_transitionStopLocation = 0;

          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "identifier");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v94 = 138412290;
            *(_QWORD *)&v94[4] = v68;
            _os_log_error_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_ERROR, "RTTripSegmentProvider: unable to fetch endpoints for transition identifier, %@", v94, 0xCu);

          }
        }

        -[NSMutableArray removeAllObjects](self->_transitionLocations, "removeAllObjects");
        for (i = 0; i < objc_msgSend(v47, "count"); ++i)
          -[RTTripSegmentProvider processChunkWithIndex:inChunks:](self, "processChunkWithIndex:inChunks:", i, v47);

        v38 = v81;
      }
      else if (v39)
      {
        v43 = objc_msgSend(v75, "predominantMotionActivityType");
        *(_DWORD *)v94 = 134218240;
        *(_QWORD *)&v94[4] = a3;
        v95 = 2048;
        v96 = v43;
        _os_log_debug_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: skipThisTransition,%tu,lack of real mode of transportation,predominantType,%tu", v94, 0x16u);
      }

    }
    _Block_object_dispose(&v88, 8);

    _Block_object_dispose(&buf, 8);
  }

}

void __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_144(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count");
    v9 = 134218754;
    v10 = v7;
    v11 = 2048;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: fetchedMotionActivity,transitionIndex,%tu,rawActivityCount,%tu,rawActivityIndex,%tu,thisRawActivity,%@", (uint8_t *)&v9, 0x2Au);
  }

}

void __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_147(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    v9 = 134218754;
    v10 = v7;
    v11 = 2048;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider: filteredMotionActivity,transitionIndex,%tu,activityCount,%tu,activityIndex,%tu,thisFilteredActivity,%@", (uint8_t *)&v9, 0x2Au);
  }

}

void __99__RTTripSegmentProvider_buildTripSegmentsForOneLearnedTransitionWithIndex_inTransitions_trainMode___block_invoke_148(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    v9 = objc_msgSend(*(id *)(a1 + 40), "count");
    v10 = 134219010;
    v11 = v7;
    v12 = 2048;
    v13 = v8;
    v14 = 2048;
    v15 = a3;
    v16 = 2048;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "RTTripSegmentProvider:generatedChunks,transitionIndex,%tu,activityCount,%tu,chunkIndex,%tu,chunkCount,%tu,thisChunk,%@", (uint8_t *)&v10, 0x34u);
  }

}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTTripSegmentManager)tripSegmentManager
{
  return self->_tripSegmentManager;
}

- (void)setTripSegmentManager:(id)a3
{
  objc_storeStrong((id *)&self->_tripSegmentManager, a3);
}

- (CLTripSegmentProcessorManager)tripProcessorManager
{
  return self->_tripProcessorManager;
}

- (void)setTripProcessorManager:(id)a3
{
  objc_storeStrong((id *)&self->_tripProcessorManager, a3);
}

- (CLTripSegmentProcessorOptions)tripProcessorOptions
{
  return self->_tripProcessorOptions;
}

- (void)setTripProcessorOptions:(id)a3
{
  objc_storeStrong((id *)&self->_tripProcessorOptions, a3);
}

- (RTTripSegmentInertialDataManager)inertialDataManager
{
  return self->_inertialDataManager;
}

- (void)setInertialDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_inertialDataManager, a3);
}

- (RTBackgroundInertialOdometryManager)inertialOdometryManager
{
  return self->_inertialOdometryManager;
}

- (void)setInertialOdometryManager:(id)a3
{
  objc_storeStrong((id *)&self->_inertialOdometryManager, a3);
}

- (RTElevationAdjuster)elevationAdjuster
{
  return self->_elevationAdjuster;
}

- (void)setElevationAdjuster:(id)a3
{
  objc_storeStrong((id *)&self->_elevationAdjuster, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setVehicleStore:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleStore, a3);
}

- (RTTripSegmentTransitionPreprocessor)transitionPreprocessor
{
  return self->_transitionPreprocessor;
}

- (void)setTransitionPreprocessor:(id)a3
{
  objc_storeStrong((id *)&self->_transitionPreprocessor, a3);
}

- (CLLocation)transitionStartLocation
{
  return self->_transitionStartLocation;
}

- (void)setTransitionStartLocation:(id)a3
{
  objc_storeStrong((id *)&self->_transitionStartLocation, a3);
}

- (CLLocation)transitionStopLocation
{
  return self->_transitionStopLocation;
}

- (void)setTransitionStopLocation:(id)a3
{
  objc_storeStrong((id *)&self->_transitionStopLocation, a3);
}

- (NSMutableArray)transitionLocations
{
  return self->_transitionLocations;
}

- (void)setTransitionLocations:(id)a3
{
  objc_storeStrong((id *)&self->_transitionLocations, a3);
}

- (double)processingChunkWidthSeconds
{
  return self->_processingChunkWidthSeconds;
}

- (void)setProcessingChunkWidthSeconds:(double)a3
{
  self->_processingChunkWidthSeconds = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)sessionInProgress
{
  return self->_sessionInProgress;
}

- (void)setSessionInProgress:(BOOL)a3
{
  self->_sessionInProgress = a3;
}

- (BOOL)usingLegacyInertialData
{
  return self->_usingLegacyInertialData;
}

- (void)setUsingLegacyInertialData:(BOOL)a3
{
  self->_usingLegacyInertialData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transitionLocations, 0);
  objc_storeStrong((id *)&self->_transitionStopLocation, 0);
  objc_storeStrong((id *)&self->_transitionStartLocation, 0);
  objc_storeStrong((id *)&self->_transitionPreprocessor, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_elevationAdjuster, 0);
  objc_storeStrong((id *)&self->_inertialOdometryManager, 0);
  objc_storeStrong((id *)&self->_inertialDataManager, 0);
  objc_storeStrong((id *)&self->_tripProcessorOptions, 0);
  objc_storeStrong((id *)&self->_tripProcessorManager, 0);
  objc_storeStrong((id *)&self->_tripSegmentManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
}

@end
