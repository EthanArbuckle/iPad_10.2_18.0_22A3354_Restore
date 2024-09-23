@implementation RTTripSegmentManager

- (RTTripSegmentManager)initWithTripSegmentStore:(id)a3 synthesizedLocationStore:(id)a4 defaultsManager:(id)a5 elevationAdjuster:(id)a6 learnedLocationStore:(id)a7 distanceCalculator:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  RTTripSegmentManager *v19;
  RTTripSegmentManager *v20;
  RTTripSegment *tripSegmentUnderConstruction;
  NSDate *tripSegmentUnderConstructionLastLocationTimestamp;
  NSObject *v23;
  RTTripSegmentManager *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v32 = a6;
  v33 = a7;
  v18 = a8;
  if (!v15)
  {
    v26 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: tripSegmentStore";
LABEL_19:
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_20;
  }
  if (!v16)
  {
    v26 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: synthesizedLocationStore";
    goto LABEL_19;
  }
  if (!v17)
  {
    v26 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_19;
  }
  if (!v33)
  {
    v26 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: learnedLocationStore";
      goto LABEL_19;
    }
LABEL_20:

    v24 = 0;
    v25 = v32;
    goto LABEL_21;
  }
  v31 = v18;
  if (v18)
  {
    v34.receiver = self;
    v34.super_class = (Class)RTTripSegmentManager;
    v19 = -[RTNotifier init](&v34, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_tripSegmentStore, a3);
      objc_storeStrong((id *)&v20->_locationStore, a4);
      objc_storeStrong((id *)&v20->_defaultsManager, a5);
      objc_storeStrong((id *)&v20->_elevationAdjuster, a6);
      objc_storeStrong((id *)&v20->_learnedLocationStore, a7);
      objc_storeStrong((id *)&v20->_distanceCalculator, a8);
      tripSegmentUnderConstruction = v20->_tripSegmentUnderConstruction;
      v20->_tripSegmentUnderConstruction = 0;

      tripSegmentUnderConstructionLastLocationTimestamp = v20->_tripSegmentUnderConstructionLastLocationTimestamp;
      v20->_tripSegmentUnderConstructionLastLocationTimestamp = 0;

      -[RTService setup](v20, "setup");
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager successfully initialized.", buf, 2u);
      }

    }
    self = v20;
    v24 = self;
    v25 = v32;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    v25 = v32;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
    }

    v24 = 0;
  }
  v26 = v31;
LABEL_21:

  return v24;
}

- (void)_setup
{
  self->_isTripSegmentGenerationEnabled = -[RTTripSegmentManager _checkIsTripSegmentGenerationEnabled](self, "_checkIsTripSegmentGenerationEnabled");
  self->_tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations = -[RTTripSegmentManager _favorNewerLocationsOverOlderLocationsForTripSegmentUnderConstruction](self, "_favorNewerLocationsOverOlderLocationsForTripSegmentUnderConstruction");
}

- (BOOL)_checkIsTripSegmentGenerationEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[RTTripSegmentManager defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsTripSegmentGenerationEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_favorNewerLocationsOverOlderLocationsForTripSegmentUnderConstruction
{
  void *v2;
  void *v3;
  char v4;

  -[RTTripSegmentManager defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsTripSegmentFavorNewerLocationsOverOlderLocations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (id)uuidForTripSegmentOfType:(int64_t)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v12;
  int v13;
  int64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v5 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("00000000"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("00000000"), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v4, "initWithUUIDString:", v8);

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = a3;
    v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:uuidForTripSegmentOfType, type, %lu, UUID, %@", (uint8_t *)&v13, 0x16u);

  }
  return v9;
}

+ (int64_t)tripSegmentUUIDTypeFromUUID:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  objc_msgSend(a3, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringToIndex:", objc_msgSend(CFSTR("00000000"), "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("00000000"));

  return v5;
}

- (void)_fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager: invoking tripSegmentStore _fetchTripSegmentsWithOptions", v10, 2u);
  }

  -[RTTripSegmentManager tripSegmentStore](self, "tripSegmentStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchTripSegmentsWithOptions:handler:", v7, v6);

}

- (void)fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTTripSegmentManager fetchTripSegmentsWithOptions:handler:]";
    v19 = 1024;
    v20 = 164;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTripSegmentManager fetchTripSegmentsWithOptions:handler:]";
      v19 = 1024;
      v20 = 165;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RTTripSegmentManager_fetchTripSegmentsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __61__RTTripSegmentManager_fetchTripSegmentsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTripSegmentsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchLocationsCountForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v6 = a4;
  v7 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager: invoking tripSegmentStore _fetchLocationsCountForTripSegmentWithOptions", v16, 2u);
  }

  v9 = objc_alloc(MEMORY[0x1E0D18518]);
  objc_msgSend(v7, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "preferredDownsamplingLevel");
  v12 = objc_msgSend(v7, "batchSize");
  objc_msgSend(v7, "boundingBoxLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v9, "initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:", v10, v11, v12, v13);
  -[RTTripSegmentManager locationStore](self, "locationStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchStoredLocationsCountWithOptions:handler:", v14, v6);

}

- (void)fetchLocationsCountForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTTripSegmentManager fetchLocationsCountForTripSegmentWithOptions:handler:]";
    v19 = 1024;
    v20 = 190;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTripSegmentManager fetchLocationsCountForTripSegmentWithOptions:handler:]";
      v19 = 1024;
      v20 = 191;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__RTTripSegmentManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __77__RTTripSegmentManager_fetchLocationsCountForTripSegmentWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationsCountForTripSegmentWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (BOOL)isValidSynthesizedLocation:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_16;
  objc_msgSend(v3, "coordinate");
  if (v5 == 0.0)
  {
    objc_msgSend(v4, "coordinate");
    if (v6 == 0.0)
      goto LABEL_16;
  }
  objc_msgSend(v4, "coordinate");
  if (fabs(v7) > 90.0)
    goto LABEL_16;
  objc_msgSend(v4, "coordinate");
  if (fabs(v8) > 360.0)
    goto LABEL_16;
  objc_msgSend(v4, "speed");
  if (v9 < 0.0)
    goto LABEL_16;
  objc_msgSend(v4, "speed");
  v10 = 0;
  if (fabs(v11) == INFINITY)
    goto LABEL_17;
  objc_msgSend(v4, "horizontalAccuracy");
  if (v12 <= 0.0)
    goto LABEL_16;
  objc_msgSend(v4, "horizontalAccuracy");
  v10 = 0;
  if (fabs(v13) == INFINITY)
    goto LABEL_17;
  objc_msgSend(v4, "verticalAccuracy");
  if (v14 <= 0.0)
    goto LABEL_16;
  objc_msgSend(v4, "verticalAccuracy");
  v10 = 0;
  if (fabs(v15) == INFINITY)
    goto LABEL_17;
  objc_msgSend(v4, "speedAccuracy");
  if (v16 <= 0.0)
  {
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "speedAccuracy");
  v18 = fabs(v17);
  v10 = v18 > INFINITY || v18 < INFINITY;
LABEL_17:

  return v10;
}

- (void)_fetchLocationsForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  dispatch_semaphore_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  dispatch_time_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  uint8_t buf[16];
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D18518];
  v8 = a3;
  v9 = [v7 alloc];
  objc_msgSend(v8, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "preferredDownsamplingLevel");
  v12 = objc_msgSend(v8, "batchSize");
  objc_msgSend(v8, "boundingBoxLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:", v10, v11, v12, v13);

  v15 = objc_alloc(MEMORY[0x1E0D18510]);
  v16 = objc_msgSend(v8, "offset");

  v17 = (void *)objc_msgSend(v15, "initWithEnumerationOptions:offset:", v14, v16);
  v18 = dispatch_semaphore_create(0);
  -[RTTripSegmentManager locationStore](self, "locationStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __73__RTTripSegmentManager__fetchLocationsForTripSegmentWithOptions_handler___block_invoke;
  v45[3] = &unk_1E9296F98;
  v20 = v6;
  v47 = v20;
  v21 = v18;
  v46 = v21;
  objc_msgSend(v19, "fetchStoredLocationsWithContext:handler:", v17, v45);

  v22 = v21;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v22, v24))
  {
    v42 = v20;
    v43 = v17;
    v44 = v14;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceDate:", v23);
    v27 = v26;
    v28 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "filteredArrayUsingPredicate:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "submitToCoreAnalytics:type:duration:", v32, 1, v27);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0D18598];
    v49[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    v36 = 1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v49, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 15, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = objc_retainAutorelease(v38);

      v36 = 0;
    }
    else
    {
      v39 = 0;
    }
    v17 = v43;
    v14 = v44;
    v20 = v42;
  }
  else
  {
    v39 = 0;
    v36 = 1;
  }

  v40 = v39;
  if ((v36 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v40;
      _os_log_debug_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager fetchStoredLocationsWithOptions timeout %@", buf, 0xCu);
    }

  }
}

void __73__RTTripSegmentManager__fetchLocationsForTripSegmentWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
        v14 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v13, "coordinate");
        v36 = v15;
        v17 = v16;
        objc_msgSend(v13, "altitude");
        v19 = v18;
        objc_msgSend(v13, "horizontalAccuracy");
        v21 = v20;
        objc_msgSend(v13, "verticalAccuracy");
        v23 = v22;
        objc_msgSend(v13, "course");
        v25 = v24;
        objc_msgSend(v13, "courseAccuracy");
        v27 = v26;
        objc_msgSend(v13, "speed");
        v29 = v28;
        objc_msgSend(v13, "speedAccuracy");
        v31 = v30;
        objc_msgSend(v13, "timestamp");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v14, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:", v32, v36, v17, v19, v21, v23, v25, v27, v29, v31);
        objc_msgSend(v7, "addObject:", v33);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v10);
  }

  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v35 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    v42 = v35;
    _os_log_debug_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager converted %lu RTSynthesizedLocations to CLLocations", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)fetchLocationsForTripSegmentWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTTripSegmentManager fetchLocationsForTripSegmentWithOptions:handler:]";
    v19 = 1024;
    v20 = 278;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTripSegmentManager fetchLocationsForTripSegmentWithOptions:handler:]";
      v19 = 1024;
      v20 = 279;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__RTTripSegmentManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __72__RTTripSegmentManager_fetchLocationsForTripSegmentWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLocationsForTripSegmentWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)getPreferredNameForLocation:(id)a3 isStartOfTripSegment:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  dispatch_semaphore_t v24;
  RTLearnedLocationStore *learnedLocationStore;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  dispatch_time_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  char v45;
  id v46;
  NSObject *v47;
  id v49;
  _QWORD v50[4];
  id v51;
  NSObject *v52;
  uint64_t *v53;
  BOOL v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[24];
  _QWORD v62[3];

  v4 = a4;
  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v6, "coordinate");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v6, "altitude");
    v13 = v12;
    objc_msgSend(v6, "timestamp");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v7, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v14, v9, v11, v13, 1.0, 1.0);

    v16 = objc_alloc(MEMORY[0x1E0CB3588]);
    if (v4)
    {
      v17 = (objc_class *)MEMORY[0x1E0C99D68];
      v18 = v16;
      v19 = [v17 alloc];
      objc_msgSend(v6, "timestamp");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v19, "initWithTimeInterval:sinceDate:", v20, -86400.0);
      v22 = (void *)objc_msgSend(v18, "initWithStartDate:duration:", v21, 86400.0);

    }
    else
    {
      v21 = v16;
      objc_msgSend(v6, "timestamp");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "initWithStartDate:duration:", v20, 86400.0);
    }

    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__1;
    v59 = __Block_byref_object_dispose__1;
    v60 = 0;
    v24 = dispatch_semaphore_create(0);
    learnedLocationStore = self->_learnedLocationStore;
    objc_msgSend(v22, "startDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "endDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __73__RTTripSegmentManager_getPreferredNameForLocation_isStartOfTripSegment___block_invoke;
    v50[3] = &unk_1E9296FC0;
    v54 = v4;
    v49 = v15;
    v51 = v49;
    v53 = &v55;
    v28 = v24;
    v52 = v28;
    -[RTLearnedLocationStore fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:](learnedLocationStore, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:handler:", v26, v27, v50);

    v29 = v28;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v29, v31))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "timeIntervalSinceDate:", v30);
    v34 = v33;
    v35 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "filteredArrayUsingPredicate:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "submitToCoreAnalytics:type:duration:", v39, 1, v34);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v41 = (void *)MEMORY[0x1E0CB35C8];
    v62[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v62, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v44 = objc_retainAutorelease(v43);

      v45 = 0;
    }
    else
    {
LABEL_11:
      v44 = 0;
      v45 = 1;
    }

    v46 = v44;
    if ((v45 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v46;
        _os_log_debug_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager [_learnedLocationStore fetchLocationsOfInterestVisitedBetweenStartDate:endDate:]: timeout %@", buf, 0xCu);
      }

    }
    v23 = (id)v56[5];

    _Block_object_dispose(&v55, 8);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

intptr_t __73__RTTripSegmentManager_getPreferredNameForLocation_isStartOfTripSegment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", a2);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v31)
    {
      v30 = *(_QWORD *)v38;
      v4 = 600.0;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(obj);
          v32 = v5;
          v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v5);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v6, "visits");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v34 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                v13 = objc_alloc(MEMORY[0x1E0C9E3B8]);
                objc_msgSend(v6, "location");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "latitude");
                v16 = v15;
                objc_msgSend(v6, "location");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "longitude");
                v19 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:", v16, v18);

                LODWORD(v17) = *(unsigned __int8 *)(a1 + 56);
                objc_msgSend(*(id *)(a1 + 32), "timestamp");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if ((_DWORD)v17)
                  objc_msgSend(v12, "exitDate");
                else
                  objc_msgSend(v12, "entryDate");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "timeIntervalSinceDate:", v21);
                v23 = fabs(v22);

                objc_msgSend(*(id *)(a1 + 32), "distanceFromLocation:", v19);
                if (v23 < v4 && v24 < 250.0)
                {
                  objc_msgSend(v6, "preferredName");
                  v25 = objc_claimAutoreleasedReturnValue();
                  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
                  v27 = *(void **)(v26 + 40);
                  *(_QWORD *)(v26 + 40) = v25;

                  v4 = v23;
                }

              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v9);
          }

          v5 = v32 + 1;
        }
        while (v32 + 1 != v31);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v31);
    }

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_fetchTripSegmentMetadataWithOptions:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  intptr_t v14;
  uint64_t *v15;
  _QWORD *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  id v30;
  NSObject *v31;
  __int128 v32;
  void *v33;
  double v34;
  dispatch_semaphore_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  dispatch_time_t v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  char v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  unint64_t i;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  double v77;
  double v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  unint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  double v128;
  void *v129;
  void *v130;
  void *v131;
  unint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  id v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  void *v145;
  void *v146;
  double v147;
  void *v148;
  void *v149;
  void *v150;
  unint64_t v151;
  void *v152;
  uint64_t v153;
  void *v154;
  id v155;
  id v156;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  double v162;
  double v163;
  void *v164;
  void *v165;
  double v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  NSObject *v172;
  void *v173;
  __int128 v174;
  id v175;
  NSObject *dsema;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  void *v181;
  uint64_t v182;
  id v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  unint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  NSObject *v192;
  dispatch_semaphore_t v193;
  dispatch_semaphore_t v194;
  dispatch_semaphore_t v195;
  id v196;
  id v197;
  id v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  unint64_t v208;
  unint64_t v209;
  unint64_t v210;
  uint64_t v211;
  unint64_t v212;
  unint64_t v213;
  unint64_t v214;
  void *v216;
  _QWORD v217[4];
  NSObject *v218;
  _BYTE *v219;
  _QWORD v220[4];
  NSObject *v221;
  id v222;
  uint64_t *v223;
  uint64_t v224;
  uint64_t *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  __int128 buf;
  _BYTE v231[24];
  uint64_t (*v232)(uint64_t, uint64_t);
  void (*v233)(uint64_t);
  id v234;
  uint64_t v235;

  v235 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D18518]);
  v216 = v5;
  objc_msgSend(v5, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = (void *)objc_msgSend(v7, "initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:", v8, 0, 0, 0);

  v9 = dispatch_semaphore_create(0);
  v224 = 0;
  v225 = &v224;
  v226 = 0x2020000000;
  v227 = 0;
  -[RTTripSegmentManager locationStore](self, "locationStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v220[0] = MEMORY[0x1E0C809B0];
  v220[1] = 3221225472;
  v220[2] = __69__RTTripSegmentManager__fetchTripSegmentMetadataWithOptions_handler___block_invoke;
  v220[3] = &unk_1E9296FE8;
  v175 = v6;
  v222 = v175;
  v223 = &v224;
  v11 = v9;
  v221 = v11;
  objc_msgSend(v10, "fetchStoredLocationsCountWithOptions:handler:", v180, v220);

  dsema = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 3600000000000);
  v14 = dispatch_semaphore_wait(dsema, v13);
  v15 = (uint64_t *)MEMORY[0x1E0D18598];
  v16 = (_QWORD *)MEMORY[0x1E0CB2D50];
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v12);
    v19 = v18;
    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v231 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v231, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)&buf = *v16;
    *(_QWORD *)v231 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v231, &buf, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *v15, 15, v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v28 = objc_retainAutorelease(v28);

      v29 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v28 = 0;
  }
  v29 = 1;
LABEL_8:

  v30 = v28;
  if ((v29 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v231 = 138412290;
      *(_QWORD *)&v231[4] = v30;
      _os_log_debug_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager _fetchRoadClassForTripSegmentWithOptions timeout %@", v231, 0xCu);
    }

  }
  if (objc_msgSend(v216, "fetchRoadClass"))
    v198 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v198 = 0;
  if (objc_msgSend(v216, "fetchFormOfWay"))
    v197 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v197 = 0;
  if (objc_msgSend(v216, "fetchLocationType"))
    v196 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v196 = 0;
  v181 = 0;
  v33 = 0;
  v188 = 0;
  v177 = 0;
  v178 = *v15;
  v179 = *v16;
  v34 = 0.0;
  *(_QWORD *)&v32 = 138412290;
  v174 = v32;
  do
  {
    v184 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18510]), "initWithEnumerationOptions:offset:", v180, v188);
    v35 = dispatch_semaphore_create(0);
    *(_QWORD *)v231 = 0;
    *(_QWORD *)&v231[8] = v231;
    *(_QWORD *)&v231[16] = 0x3032000000;
    v232 = __Block_byref_object_copy__1;
    v233 = __Block_byref_object_dispose__1;
    v234 = 0;
    -[RTTripSegmentManager locationStore](self, "locationStore");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v217[0] = MEMORY[0x1E0C809B0];
    v217[1] = 3221225472;
    v217[2] = __69__RTTripSegmentManager__fetchTripSegmentMetadataWithOptions_handler___block_invoke_53;
    v217[3] = &unk_1E9297010;
    v219 = v231;
    v37 = v35;
    v218 = v37;
    objc_msgSend(v36, "fetchStoredLocationsWithContext:handler:", v184, v217);

    v192 = v37;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v192, v39))
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "timeIntervalSinceDate:", v38);
    v42 = v41;
    v43 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "filteredArrayUsingPredicate:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "submitToCoreAnalytics:type:duration:", v47, 1, v42);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&buf, 2u);
    }

    v49 = (void *)MEMORY[0x1E0CB35C8];
    v228 = v179;
    *(_QWORD *)&buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, &v228, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", v178, 15, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      v52 = objc_retainAutorelease(v51);

      v53 = 0;
    }
    else
    {
LABEL_27:
      v53 = 1;
      v52 = v30;
    }

    v183 = v52;
    if ((v53 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = v174;
        *(_QWORD *)((char *)&buf + 4) = v183;
        _os_log_debug_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager _fetchRoadClassForTripSegmentWithOptions timeout %@", (uint8_t *)&buf, 0xCu);
      }

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "count", v174))
    {
      if (!v188)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "firstObject");
        v55 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "firstObject");
        v56 = objc_claimAutoreleasedReturnValue();

        v177 = (void *)v55;
        v33 = (void *)v56;
      }
      objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "lastObject");
      v57 = objc_claimAutoreleasedReturnValue();

      v181 = (void *)v57;
    }
    v182 = objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "count");
    v58 = objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "count");
    objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "firstObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "timestamp");
    v207 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "firstObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "timestamp");
    v203 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "firstObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "timestamp");
    v199 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "firstObject");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = objc_msgSend(v62, "geoRoadClass");

    objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "firstObject");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "geoFormOfWay");

    objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "firstObject");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "locationType");

    v188 += v58;
    v67 = v34;
    v68 = v34;
    v69 = v34;
    for (i = 1; i < objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "count"); ++i)
    {
      buf = 0uLL;
      objc_msgSend(v33, "coordinate");
      *(_QWORD *)&buf = v71;
      *((_QWORD *)&buf + 1) = v72;
      v228 = 0;
      v229 = 0;
      objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "coordinate");
      v228 = v74;
      v229 = v75;

      -[RTTripSegmentManager distanceCalculator](self, "distanceCalculator");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "distanceFromLocationCoordinate:toLocationCoordinate:error:", &buf, &v228, 0);
      v78 = v77;

      objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
      v79 = objc_claimAutoreleasedReturnValue();

      v34 = v34 + v78;
      if (objc_msgSend(v216, "fetchRoadClass"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "geoRoadClass");

        if (i == objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "count") - 1 || v211 != v81)
        {
          v82 = objc_alloc(MEMORY[0x1E0D18560]);
          v83 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "timestamp");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = (void *)objc_msgSend(v83, "initWithStartDate:endDate:", v207, v85);
          v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18368]), "initWithStartDistance:endDistance:", v67, v34);
          v88 = (void *)objc_msgSend(v82, "initWithDateInterval:distanceInterval:geoRoadClass:", v86, v87, v211);
          objc_msgSend(v198, "addObject:", v88);

          objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "timestamp");
          v90 = objc_claimAutoreleasedReturnValue();

          v207 = (void *)v90;
          v211 = v81;
          v67 = v34;
        }
      }
      if (objc_msgSend(v216, "fetchFormOfWay"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "geoFormOfWay");

        if (i == objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "count") - 1 || v64 != v92)
        {
          v93 = objc_alloc(MEMORY[0x1E0D18530]);
          v94 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "timestamp");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = (void *)objc_msgSend(v94, "initWithStartDate:endDate:", v203, v96);
          v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18368]), "initWithStartDistance:endDistance:", v68, v34);
          v99 = (void *)objc_msgSend(v93, "initWithDateInterval:distanceInterval:geoFormOfWay:", v97, v98, v64);
          objc_msgSend(v197, "addObject:", v99);

          objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "timestamp");
          v101 = objc_claimAutoreleasedReturnValue();

          v203 = (void *)v101;
          v68 = v34;
          v64 = v92;
        }
      }
      if (objc_msgSend(v216, "fetchLocationType"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend(v102, "locationType");

        if (i == objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "count") - 1 || v66 != v103)
        {
          v104 = objc_alloc(MEMORY[0x1E0D18548]);
          v105 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "timestamp");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = (void *)objc_msgSend(v105, "initWithStartDate:endDate:", v199, v107);
          v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18368]), "initWithStartDistance:endDistance:", v69, v34);
          v110 = (void *)objc_msgSend(v104, "initWithDateInterval:distanceInterval:locationType:", v108, v109, v66);
          objc_msgSend(v196, "addObject:", v110);

          objc_msgSend(*(id *)(*(_QWORD *)&v231[8] + 40), "objectAtIndexedSubscript:", i);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "timestamp");
          v112 = objc_claimAutoreleasedReturnValue();

          v199 = (void *)v112;
          v69 = v34;
          v66 = v103;
        }
      }
      v33 = (void *)v79;
    }

    _Block_object_dispose(v231, 8);
    if (v188 >= v225[3])
      break;
    v30 = v183;
  }
  while (v182 > 0);
  if (v198 && (unint64_t)objc_msgSend(v198, "count") >= 2)
  {
    v113 = 0;
LABEL_56:
    v212 = v113;
    v208 = v113 + 1;
    while (v212 < objc_msgSend(v198, "count") - 1)
    {
      objc_msgSend(v198, "objectAtIndexedSubscript:");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v114, "geoRoadClass");
      objc_msgSend(v198, "objectAtIndexedSubscript:", v208);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v115) = v115 == objc_msgSend(v116, "geoRoadClass");

      if (!(_DWORD)v115)
      {
        v113 = v208;
        goto LABEL_56;
      }
      v117 = objc_alloc(MEMORY[0x1E0D18560]);
      v118 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v198, "objectAtIndexedSubscript:", v212);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "dateInterval");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "startDate");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "objectAtIndexedSubscript:", v208);
      v193 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
      -[NSObject dateInterval](v193, "dateInterval");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "endDate");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = (void *)objc_msgSend(v118, "initWithStartDate:endDate:", v185, v119);
      v121 = objc_alloc(MEMORY[0x1E0D18368]);
      objc_msgSend(v198, "objectAtIndexedSubscript:", v212);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "distanceInterval");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "startDistance");
      v125 = v124;
      objc_msgSend(v198, "objectAtIndexedSubscript:", v208);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "distanceInterval");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "endDistance");
      v129 = (void *)objc_msgSend(v121, "initWithStartDistance:endDistance:", v125, v128);
      objc_msgSend(v198, "objectAtIndexedSubscript:", v212);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = (void *)objc_msgSend(v117, "initWithDateInterval:distanceInterval:geoRoadClass:", v120, v129, objc_msgSend(v130, "geoRoadClass"));
      objc_msgSend(v198, "setObject:atIndexedSubscript:", v131, v208);

      objc_msgSend(v198, "removeObjectAtIndex:", v212);
    }
  }
  if (v197 && (unint64_t)objc_msgSend(v197, "count") >= 2)
  {
    v132 = 0;
LABEL_64:
    v213 = v132;
    v209 = v132 + 1;
    while (v213 < objc_msgSend(v197, "count") - 1)
    {
      objc_msgSend(v197, "objectAtIndexedSubscript:");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = objc_msgSend(v133, "geoFormOfWay");
      objc_msgSend(v197, "objectAtIndexedSubscript:", v209);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v134) = v134 == objc_msgSend(v135, "geoFormOfWay");

      if (!(_DWORD)v134)
      {
        v132 = v209;
        goto LABEL_64;
      }
      v136 = objc_alloc(MEMORY[0x1E0D18530]);
      v137 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v197, "objectAtIndexedSubscript:", v213);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "dateInterval");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "startDate");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "objectAtIndexedSubscript:", v209);
      v194 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
      -[NSObject dateInterval](v194, "dateInterval");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "endDate");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = (void *)objc_msgSend(v137, "initWithStartDate:endDate:", v186, v138);
      v140 = objc_alloc(MEMORY[0x1E0D18368]);
      objc_msgSend(v197, "objectAtIndexedSubscript:", v213);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "distanceInterval");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "startDistance");
      v144 = v143;
      objc_msgSend(v197, "objectAtIndexedSubscript:", v209);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "distanceInterval");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "endDistance");
      v148 = (void *)objc_msgSend(v140, "initWithStartDistance:endDistance:", v144, v147);
      objc_msgSend(v197, "objectAtIndexedSubscript:", v213);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = (void *)objc_msgSend(v136, "initWithDateInterval:distanceInterval:geoFormOfWay:", v139, v148, objc_msgSend(v149, "geoFormOfWay"));
      objc_msgSend(v197, "setObject:atIndexedSubscript:", v150, v209);

      objc_msgSend(v197, "removeObjectAtIndex:", v213);
    }
  }
  if (v196 && (unint64_t)objc_msgSend(v196, "count") >= 2)
  {
    v151 = 0;
LABEL_72:
    v214 = v151;
    v210 = v151 + 1;
    while (v214 < objc_msgSend(v196, "count") - 1)
    {
      objc_msgSend(v196, "objectAtIndexedSubscript:");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = objc_msgSend(v152, "locationType");
      objc_msgSend(v196, "objectAtIndexedSubscript:", v210);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v153) = v153 == objc_msgSend(v154, "locationType");

      if (!(_DWORD)v153)
      {
        v151 = v210;
        goto LABEL_72;
      }
      v155 = objc_alloc(MEMORY[0x1E0D18548]);
      v156 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v196, "objectAtIndexedSubscript:", v214);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "dateInterval");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "startDate");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "objectAtIndexedSubscript:", v210);
      v195 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
      -[NSObject dateInterval](v195, "dateInterval");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "endDate");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = (void *)objc_msgSend(v156, "initWithStartDate:endDate:", v187, v157);
      v159 = objc_alloc(MEMORY[0x1E0D18368]);
      objc_msgSend(v196, "objectAtIndexedSubscript:", v214);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "distanceInterval");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "startDistance");
      v163 = v162;
      objc_msgSend(v196, "objectAtIndexedSubscript:", v210);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "distanceInterval");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "endDistance");
      v167 = (void *)objc_msgSend(v159, "initWithStartDistance:endDistance:", v163, v166);
      objc_msgSend(v196, "objectAtIndexedSubscript:", v214);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = (void *)objc_msgSend(v155, "initWithDateInterval:distanceInterval:locationType:", v158, v167, objc_msgSend(v168, "locationType"));
      objc_msgSend(v196, "setObject:atIndexedSubscript:", v169, v210);

      objc_msgSend(v196, "removeObjectAtIndex:", v214);
    }
  }
  if (objc_msgSend(v216, "fetchPreferredNames"))
  {
    -[RTTripSegmentManager getPreferredNameForLocation:isStartOfTripSegment:](self, "getPreferredNameForLocation:isStartOfTripSegment:", v177, 1);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTripSegmentManager getPreferredNameForLocation:isStartOfTripSegment:](self, "getPreferredNameForLocation:isStartOfTripSegment:", v181, 0);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v172 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v172, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v231 = 138412546;
      *(_QWORD *)&v231[4] = v170;
      *(_WORD *)&v231[12] = 2112;
      *(_QWORD *)&v231[14] = v171;
      _os_log_debug_impl(&dword_1D1A22000, v172, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager startPreferredName %@, endPreferredName %@", v231, 0x16u);
    }

  }
  else
  {
    v170 = 0;
    v171 = 0;
  }
  v173 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18550]), "initWithRoadClass:formOfWay:locationType:startLocationName:endLocationName:", v198, v197, v196, v170, v171);
  (*((void (**)(id, void *, _QWORD))v175 + 2))(v175, v173, 0);

  _Block_object_dispose(&v224, 8);
}

intptr_t __69__RTTripSegmentManager__fetchTripSegmentMetadataWithOptions_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__RTTripSegmentManager__fetchTripSegmentMetadataWithOptions_handler___block_invoke_53(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)fetchTripSegmentMetadataWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTTripSegmentManager fetchTripSegmentMetadataWithOptions:handler:]";
    v19 = 1024;
    v20 = 582;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTripSegmentManager fetchTripSegmentMetadataWithOptions:handler:]";
      v19 = 1024;
      v20 = 583;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTTripSegmentManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __68__RTTripSegmentManager_fetchTripSegmentMetadataWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTripSegmentMetadataWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)fetchDownsamplingLevelAnnotationForLocations:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v3 = a3;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      v5 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "coordinate");
      v48 = v6;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "coordinate");
      v8 = v7;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "altitude");
      v10 = v9;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "speed");
      v12 = v11;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "course");
      v15 = v14;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "horizontalAccuracy");
      v18 = v17;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "verticalAccuracy");
      v21 = v20;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "speedAccuracy");
      v24 = v23;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "courseAccuracy");
      v27 = v26;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timestamp");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v5, "initWithLatitude:longitude:altitude:speed:course:horizontalAccuracy:verticalAccuracy:speedAccuracy:courseAccuracy:type:timestamp:", 0, v29, v48, v8, v10, v12, v15, v18, v21, v24, v27);
      objc_msgSend(v47, "setObject:atIndexedSubscript:", v30, v4);

      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
  }
  v31 = (void *)MEMORY[0x1E0D183B8];
  objc_msgSend(MEMORY[0x1E0D183B8], "createErrorFunctionWithAbsoluteCrosstrackDistance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "downsampleLocations:errorFunction:errorThreshold:outputSize:", v47, v32, 0, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0D183B8];
  objc_msgSend(MEMORY[0x1E0D183B8], "createErrorFunctionWithAbsoluteCrosstrackDistance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "downsampleLocations:errorFunction:errorThreshold:outputSize:", v47, v35, 0, 2.5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v38 = v47;
  if (objc_msgSend(v3, "count"))
  {
    v39 = 0;
    v40 = 0;
    v41 = 0;
    do
    {
      objc_msgSend(v37, "setObject:atIndexedSubscript:", &unk_1E9326360, v41);
      v42 = v38;
      objc_msgSend(v38, "objectAtIndex:", v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39 < objc_msgSend(v33, "count"))
      {
        objc_msgSend(v33, "objectAtIndex:", v39);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "isEqual:", v44))
        {
          objc_msgSend(v37, "setObject:atIndexedSubscript:", &unk_1E9326378, v41);
          ++v39;
        }

      }
      if (v40 < objc_msgSend(v36, "count"))
      {
        objc_msgSend(v36, "objectAtIndex:", v40);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "isEqual:", v45))
        {
          objc_msgSend(v37, "setObject:atIndexedSubscript:", &unk_1E9326390, v41);
          ++v40;
        }

      }
      ++v41;
      v38 = v42;
    }
    while (v41 < objc_msgSend(v3, "count"));
  }

  return v37;
}

- (void)addLocationsToStore:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[RTTripSegmentManager addLocationsToStore:handler:]";
      v21 = 1024;
      LODWORD(v22) = 653;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations (in %s:%d)", (uint8_t *)&v19, 0x12u);
    }

  }
  -[RTTripSegmentManager fetchDownsamplingLevelAnnotationForLocations:](self, "fetchDownsamplingLevelAnnotationForLocations:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10 != objc_msgSend(v6, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(v9, "count");
      v18 = objc_msgSend(v6, "count");
      v19 = 134218754;
      v20 = (const char *)v17;
      v21 = 2048;
      v22 = v18;
      v23 = 2080;
      v24 = "-[RTTripSegmentManager addLocationsToStore:handler:]";
      v25 = 1024;
      v26 = 667;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "downsampling annotation array length is not equal to locations array legnth, %tu != %tu (in %s:%d)", (uint8_t *)&v19, 0x26u);
    }

  }
  if (objc_msgSend(v6, "count"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (int)objc_msgSend(v13, "intValue");
      objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDownsamplingLevel:", v14);

      ++v12;
    }
    while (v12 < objc_msgSend(v6, "count"));
  }
  -[RTTripSegmentManager locationStore](self, "locationStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "storeLocations:handler:", v6, v7);

}

+ (int64_t)translateModeOfTransport:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return qword_1D1EECD48[a3 - 1];
}

- (BOOL)_applyElevationAdjustmentToReconstructedRoute
{
  void *v2;
  void *v3;
  char v4;

  -[RTTripSegmentManager defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsTripSegmentAdjustElevationForReconstructedRoute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)tryPrepareForAddTripSegmentdata:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  _QWORD v26[4];
  id v27;
  RTTripSegmentManager *v28;
  NSObject *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint8_t buf[8];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F8]), "initWithAscending:dateInterval:limit:", 1, v4, 0);
  v6 = dispatch_semaphore_create(0);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__RTTripSegmentManager_tryPrepareForAddTripSegmentdata___block_invoke;
  v26[3] = &unk_1E9297060;
  v30 = &v31;
  v7 = v4;
  v27 = v7;
  v28 = self;
  v8 = v6;
  v29 = v8;
  -[RTTripSegmentManager _fetchTripSegmentsWithOptions:handler:](self, "_fetchTripSegmentsWithOptions:handler:", v5, v26);
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v9, v11))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v10);
    v14 = v13;
    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filteredArrayUsingPredicate:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "submitToCoreAnalytics:type:duration:", v19, 1, v14);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v35, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
  }

  v24 = *((_BYTE *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);

  return v24;
}

void __56__RTTripSegmentManager_tryPrepareForAddTripSegmentdata___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  void *v24;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v7 = objc_msgSend(v5, "count");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    if (!v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        *(_DWORD *)buf = 138412546;
        v34 = v22;
        v35 = 1024;
        v36 = v23;
        _os_log_debug_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager no trip segment data found for interval %@, okToAddTripSegmentData,%d", buf, 0x12u);
      }
      goto LABEL_18;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = +[RTTripSegmentManager tripSegmentUUIDTypeFromUUID:](RTTripSegmentManager, "tripSegmentUUIDTypeFromUUID:", v13);

          if (!v14)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
            _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v16 = *(_QWORD *)(a1 + 32);
              v17 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
              *(_DWORD *)buf = 138412546;
              v34 = v16;
              v35 = 1024;
              v36 = v17;
              _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager trip segment of type FINAL found for interval %@, okToAddTripSegmentData,%d", buf, 0x12u);
            }

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v10);
    }

    v18 = *(_QWORD *)(a1 + 56);
    v6 = v24;
    if (*(_BYTE *)(*(_QWORD *)(v18 + 8) + 24))
    {
      v19 = *(void **)(a1 + 32);
      v20 = *(void **)(a1 + 40);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __56__RTTripSegmentManager_tryPrepareForAddTripSegmentdata___block_invoke_67;
      v25[3] = &unk_1E9297038;
      v27 = v18;
      v26 = v19;
      objc_msgSend(v20, "_purgeTripSegmentsOnDateInterval:handler:", v26, v25);
      v21 = v26;
LABEL_18:

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __56__RTTripSegmentManager_tryPrepareForAddTripSegmentdata___block_invoke_67(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v6 = 138412546;
      v7 = v4;
      v8 = 1024;
      v9 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager purge of trip segments for date interval %@ failed, okToAddTripSegmentData,%d", (uint8_t *)&v6, 0x12u);
    }

  }
}

- (void)_tripSegmentExistsForDateInterval:(id)a3 ignoreTemporary:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  BOOL v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[3];
  char v20;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F8]), "initWithAscending:dateInterval:limit:", 1, v8, 0);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__RTTripSegmentManager__tripSegmentExistsForDateInterval_ignoreTemporary_handler___block_invoke;
  v12[3] = &unk_1E9297088;
  v16 = a4;
  v14 = v17;
  v15 = v19;
  v11 = v9;
  v13 = v11;
  -[RTTripSegmentManager _fetchTripSegmentsWithOptions:handler:](self, "_fetchTripSegmentsWithOptions:handler:", v10, v12);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

void __82__RTTripSegmentManager__tripSegmentExistsForDateInterval_ignoreTemporary_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (*(_BYTE *)(a1 + 56))
  {
    v14 = v6;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = +[RTTripSegmentManager tripSegmentUUIDTypeFromUUID:](RTTripSegmentManager, "tripSegmentUUIDTypeFromUUID:", v12);

          if (!v13)
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    v6 = v14;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "count") != 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)tripSegmentExistsForDateInterval:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTTripSegmentManager tripSegmentExistsForDateInterval:handler:]";
    v19 = 1024;
    v20 = 784;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTripSegmentManager tripSegmentExistsForDateInterval:handler:]";
      v19 = 1024;
      v20 = 785;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RTTripSegmentManager_tripSegmentExistsForDateInterval_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __65__RTTripSegmentManager_tripSegmentExistsForDateInterval_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tripSegmentExistsForDateInterval:ignoreTemporary:handler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)tripSegmentExistsForDateInterval:(id)a3 ignoreTemporary:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[RTTripSegmentManager tripSegmentExistsForDateInterval:ignoreTemporary:handler:]";
    v22 = 1024;
    v23 = 798;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTTripSegmentManager tripSegmentExistsForDateInterval:ignoreTemporary:handler:]";
      v22 = 1024;
      v23 = 799;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__RTTripSegmentManager_tripSegmentExistsForDateInterval_ignoreTemporary_handler___block_invoke;
  v16[3] = &unk_1E92970B0;
  v16[4] = self;
  v17 = v8;
  v19 = a4;
  v18 = v10;
  v14 = v10;
  v15 = v8;
  dispatch_async(v13, v16);

}

uint64_t __81__RTTripSegmentManager_tripSegmentExistsForDateInterval_ignoreTemporary_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tripSegmentExistsForDateInterval:ignoreTemporary:handler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_addTripSegmentDataWithIdentifier:(id)a3 dateInterval:(id)a4 tripDistance:(double)a5 tripDistanceUncertainty:(double)a6 modeOfTransportation:(int64_t)a7 locations:(id)a8 isEndOfSegment:(BOOL)a9 handler:(id)a10
{
  id v16;
  NSObject *v17;
  double v18;
  BOOL v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  id v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  unint64_t i;
  RTSynthesizedLocation *v46;
  void *v47;
  RTSynthesizedLocation *v48;
  NSObject *v49;
  dispatch_semaphore_t v50;
  NSObject *v51;
  RTElevationAdjuster *elevationAdjuster;
  id v53;
  id *v54;
  void *v55;
  dispatch_time_t v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  void *v75;
  BOOL v76;
  void *v77;
  void *v78;
  int v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  dispatch_semaphore_t v94;
  NSObject *v95;
  NSObject *v96;
  id v97;
  id *v98;
  NSObject *v99;
  void *v100;
  dispatch_time_t v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  dispatch_semaphore_t v113;
  NSObject *v114;
  NSObject *v115;
  id v116;
  id *v117;
  NSObject *v118;
  void *v119;
  dispatch_time_t v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  void *v131;
  NSObject *v132;
  _BOOL4 v133;
  dispatch_semaphore_t v134;
  void *v135;
  RTTripSegment *tripSegmentUnderConstruction;
  NSObject *v137;
  id v138;
  id *v139;
  NSObject *v140;
  dispatch_time_t v141;
  double v142;
  double v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  NSObject *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  NSObject *v157;
  dispatch_semaphore_t v158;
  NSObject *v159;
  id v160;
  id *v161;
  dispatch_time_t v162;
  double v163;
  double v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  NSObject *v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  id v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  double v179;
  double v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  __int128 v186;
  _BOOL4 v187;
  void *v188;
  NSObject *dsema;
  id v190;
  void *v191;
  void (**v192)(id, _QWORD);
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  id obj;
  id v198;
  void *v199;
  void *v201;
  _QWORD v202[4];
  NSObject *v203;
  _BYTE *v204;
  _QWORD v205[5];
  NSObject *v206;
  _BYTE *v207;
  _QWORD v208[4];
  NSObject *v209;
  _BYTE *v210;
  _QWORD v211[4];
  NSObject *v212;
  _BYTE *v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  _QWORD v218[4];
  NSObject *v219;
  _BYTE *v220;
  _BYTE *v221;
  _BYTE v222[24];
  uint64_t (*v223)(uint64_t, uint64_t);
  void (*v224)(uint64_t);
  id v225;
  _BYTE buf[24];
  uint64_t (*v227)(uint64_t, uint64_t);
  void (*v228)(uint64_t);
  id v229;
  uint8_t v230[128];
  _BYTE v231[24];
  double v232;
  __int128 v233;
  uint64_t v234;
  const __CFString *v235;
  uint64_t v236;
  const __CFString *v237;
  _BYTE v238[24];
  uint64_t (*v239)(uint64_t, uint64_t);
  void (*v240)(uint64_t);
  id v241;
  uint64_t v242;
  uint8_t v243[8];
  uint64_t v244;

  v187 = a9;
  v244 = *MEMORY[0x1E0C80C00];
  v190 = a3;
  v16 = a4;
  v198 = a8;
  v192 = (void (**)(id, _QWORD))a10;
  if (!v192)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v238 = 136315394;
      *(_QWORD *)&v238[4] = "-[RTTripSegmentManager _addTripSegmentDataWithIdentifier:dateInterval:tripDistance:tripDista"
                            "nceUncertainty:modeOfTransportation:locations:isEndOfSegment:handler:]";
      *(_WORD *)&v238[12] = 1024;
      *(_DWORD *)&v238[14] = 818;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v238, 0x12u);
    }

  }
  *(_QWORD *)v238 = 0;
  *(_QWORD *)&v238[8] = v238;
  *(_QWORD *)&v238[16] = 0x3032000000;
  v239 = __Block_byref_object_copy__1;
  v240 = __Block_byref_object_dispose__1;
  v241 = 0;
  v191 = v16;
  objc_msgSend(v16, "duration");
  if (a6 <= 0.0 || a5 <= 0.0 || v18 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "duration");
      *(_DWORD *)v231 = 134218752;
      *(_QWORD *)&v231[4] = v174;
      *(_WORD *)&v231[12] = 2048;
      *(double *)&v231[14] = a5;
      *(_WORD *)&v231[22] = 2048;
      v232 = a6;
      LOWORD(v233) = 2048;
      *(_QWORD *)((char *)&v233 + 2) = objc_msgSend(v198, "count");
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "RTTripSegmentManager attempted to add invalid trip segment data: dateInterval.duration, %.3f, distance, %.3f, distanceUncertainty, %.3f, locations.count, %tu.", v231, 0x2Au);
    }

    v36 = (void *)MEMORY[0x1E0CB35C8];
    v236 = *MEMORY[0x1E0CB2D50];
    v237 = CFSTR("RTTripSegmentManager attempted to add invalid trip segment data.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v237, &v236, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = *(void **)(*(_QWORD *)&v238[8] + 40);
    *(_QWORD *)(*(_QWORD *)&v238[8] + 40) = v38;

    v192[2](v192, *(_QWORD *)(*(_QWORD *)&v238[8] + 40));
  }
  else
  {
    v19 = -[RTTripSegmentManager tryPrepareForAddTripSegmentdata:](self, "tryPrepareForAddTripSegmentdata:", v16);
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v21)
      {
        objc_msgSend(v190, "UUIDString");
        v175 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v176 = objc_msgSend(v175, "UTF8String");
        v177 = objc_msgSend(v198, "count");
        objc_msgSend(v16, "startDate");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "timeIntervalSinceReferenceDate");
        v180 = v179;
        objc_msgSend(v16, "endDate");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "timeIntervalSinceReferenceDate");
        *(_DWORD *)v231 = 136315906;
        *(_QWORD *)&v231[4] = v176;
        *(_WORD *)&v231[12] = 2048;
        *(_QWORD *)&v231[14] = v177;
        *(_WORD *)&v231[22] = 2048;
        v232 = v180;
        LOWORD(v233) = 2048;
        *(_QWORD *)((char *)&v233 + 2) = v182;
        _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager invoked addTripSegmentData with UUID %s, and %lu locations, from startTime, %.1f, to stopTime, %.1lf", v231, 0x2Au);

      }
      -[RTTripSegmentManager tripSegmentUnderConstruction](self, "tripSegmentUnderConstruction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[RTTripSegmentManager tripSegmentUnderConstruction](self, "tripSegmentUnderConstruction");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = v24 == v190;

        if (!v25)
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v231 = 0;
            _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager _tripSegmentUnderConstruction has different UUID, setting to nil", v231, 2u);
          }

          -[RTTripSegmentManager setTripSegmentUnderConstruction:](self, "setTripSegmentUnderConstruction:", 0);
          -[RTTripSegmentManager setTripSegmentUnderConstructionLastLocationTimestamp:](self, "setTripSegmentUnderConstructionLastLocationTimestamp:", 0);
        }
      }
      -[RTTripSegmentManager tripSegmentUnderConstruction](self, "tripSegmentUnderConstruction");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27 == 0;

      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
      if (v28)
      {
        if (v30)
        {
          *(_WORD *)v231 = 0;
          _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager addTripSegmentData created new RTTripSegment instance", v231, 2u);
        }

        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18528]), "initWithTripSegmentIdentifier:dateInterval:tripDistance:tripDistanceUncertainty:modeOfTransportation:", v190, v191, a7, a5, a6);
        -[RTTripSegmentManager setTripSegmentUnderConstruction:](self, "setTripSegmentUnderConstruction:", v44);

        -[RTTripSegmentManager setTripSegmentUnderConstructionLastLocationTimestamp:](self, "setTripSegmentUnderConstructionLastLocationTimestamp:", 0);
      }
      else
      {
        if (v30)
        {
          *(_WORD *)v231 = 0;
          _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager addTripSegmentData appending to existing trip-segment", v231, 2u);
        }

        v31 = (void *)MEMORY[0x1E0D18528];
        -[RTTripSegmentManager tripSegmentUnderConstruction](self, "tripSegmentUnderConstruction");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18528]), "initWithTripSegmentIdentifier:dateInterval:tripDistance:tripDistanceUncertainty:modeOfTransportation:", v190, v191, a7, a5, a6);
        objc_msgSend(v31, "mergeTripSegment:other:", v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTTripSegmentManager setTripSegmentUnderConstruction:](self, "setTripSegmentUnderConstruction:", v34);

      }
      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v198, "count"));
      for (i = 0; i < objc_msgSend(v198, "count"); ++i)
      {
        v46 = [RTSynthesizedLocation alloc];
        objc_msgSend(v198, "objectAtIndexedSubscript:", i);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[RTSynthesizedLocation initWithCLTripSegmentLocation:](v46, "initWithCLTripSegmentLocation:", v47);

        objc_msgSend(obj, "addObject:", v48);
      }
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        v183 = objc_msgSend(v198, "count");
        *(_DWORD *)v231 = 134217984;
        *(_QWORD *)&v231[4] = v183;
        _os_log_debug_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager converted %lu CLTripSegmentLocations to RTSynthesizedLocations", v231, 0xCu);
      }

      *(_QWORD *)v231 = 0;
      *(_QWORD *)&v231[8] = v231;
      *(_QWORD *)&v231[16] = 0x3032000000;
      v232 = COERCE_DOUBLE(__Block_byref_object_copy__1);
      *(_QWORD *)&v233 = __Block_byref_object_dispose__1;
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      *((_QWORD *)&v233 + 1) = objc_claimAutoreleasedReturnValue();
      v50 = dispatch_semaphore_create(0);
      if (self->_elevationAdjuster
        && -[RTTripSegmentManager _applyElevationAdjustmentToReconstructedRoute](self, "_applyElevationAdjustmentToReconstructedRoute"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = objc_msgSend(v198, "count");
          _os_log_debug_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager adjusted elevation for %lu locations", buf, 0xCu);
        }

        elevationAdjuster = self->_elevationAdjuster;
        v218[0] = MEMORY[0x1E0C809B0];
        v218[1] = 3221225472;
        v218[2] = __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke;
        v218[3] = &unk_1E9296EE0;
        v220 = v231;
        v221 = v238;
        v219 = v50;
        -[RTElevationAdjuster adjustElevationForSynthesizedLocations:handler:](elevationAdjuster, "adjustElevationForSynthesizedLocations:handler:", obj, v218);

      }
      else
      {
        objc_storeStrong((id *)(*(_QWORD *)&v231[8] + 40), obj);
        dispatch_semaphore_signal(v50);
      }
      v54 = (id *)(*(_QWORD *)&v238[8] + 40);
      v53 = *(id *)(*(_QWORD *)&v238[8] + 40);
      dsema = v50;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(dsema, v56))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "timeIntervalSinceDate:", v55);
        v59 = v58;
        v60 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "filteredArrayUsingPredicate:", v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "firstObject");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v60, "submitToCoreAnalytics:type:duration:", v64, 1, v59);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v66 = (void *)MEMORY[0x1E0CB35C8];
        *(_QWORD *)v222 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v222, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          v53 = objc_retainAutorelease(v68);

        }
      }

      objc_storeStrong(v54, v53);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = 0u;
      v217 = 0u;
      v214 = 0u;
      v215 = 0u;
      v69 = *(id *)(*(_QWORD *)&v231[8] + 40);
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v214, v230, 16);
      if (v70)
      {
        v72 = *(_QWORD *)v215;
        *(_QWORD *)&v71 = 138412546;
        v186 = v71;
        do
        {
          for (j = 0; j != v70; ++j)
          {
            if (*(_QWORD *)v215 != v72)
              objc_enumerationMutation(v69);
            v74 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * j);
            if (!+[RTTripSegmentManager isValidSynthesizedLocation:](RTTripSegmentManager, "isValidSynthesizedLocation:", v74, v186))
            {
              _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              v80 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v74;
                _os_log_debug_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager invalid properties observed for location sample %@.", buf, 0xCu);
              }
              goto LABEL_58;
            }
            -[RTTripSegmentManager tripSegmentUnderConstructionLastLocationTimestamp](self, "tripSegmentUnderConstructionLastLocationTimestamp");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            if (v75)
            {
              v76 = -[RTTripSegmentManager tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations](self, "tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations");

              if (!v76)
              {
                objc_msgSend(v74, "timestamp");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTTripSegmentManager tripSegmentUnderConstructionLastLocationTimestamp](self, "tripSegmentUnderConstructionLastLocationTimestamp");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                v79 = objc_msgSend(v77, "isOnOrBefore:", v78);

                if (v79)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                  v80 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                  {
                    -[RTTripSegmentManager tripSegmentUnderConstructionLastLocationTimestamp](self, "tripSegmentUnderConstructionLastLocationTimestamp");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v186;
                    *(_QWORD *)&buf[4] = v74;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v81;
                    _os_log_debug_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager skipping location %@ earlier than most recent location at %@.", buf, 0x16u);

                  }
LABEL_58:

                  continue;
                }
              }
            }
            objc_msgSend(v74, "timestamp");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTTripSegmentManager setTripSegmentUnderConstructionLastLocationTimestamp:](self, "setTripSegmentUnderConstructionLastLocationTimestamp:", v82);

            objc_msgSend(v199, "addObject:", v74);
          }
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v214, v230, 16);
        }
        while (v70);
      }

      if ((unint64_t)objc_msgSend(v199, "count") >= 2)
      {
        objc_msgSend(v199, "lastObject");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "timestamp");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "firstObject");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "timestamp");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v84, "isAfterDate:", v86);

        if (v87)
        {
          v88 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v199, "firstObject");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "timestamp");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v199, "lastObject");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "timestamp");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = (void *)objc_msgSend(v88, "initWithStartDate:endDate:", v90, v92);

          v94 = dispatch_semaphore_create(0);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v227 = __Block_byref_object_copy__1;
          v228 = __Block_byref_object_dispose__1;
          v229 = 0;
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v95 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
          {
            v185 = objc_msgSend(v199, "count");
            *(_DWORD *)v222 = 138412546;
            *(_QWORD *)&v222[4] = v93;
            *(_WORD *)&v222[12] = 2048;
            *(_QWORD *)&v222[14] = v185;
            _os_log_debug_impl(&dword_1D1A22000, v95, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager cleaning location store on interval %@ prior to adding %ld locations", v222, 0x16u);
          }

          v211[0] = MEMORY[0x1E0C809B0];
          v211[1] = 3221225472;
          v211[2] = __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_78;
          v211[3] = &unk_1E9297038;
          v213 = buf;
          v96 = v94;
          v212 = v96;
          -[RTTripSegmentManager _purgeTripSegmentsOnDateInterval:handler:](self, "_purgeTripSegmentsOnDateInterval:handler:", v93, v211);
          v98 = (id *)(*(_QWORD *)&buf[8] + 40);
          v97 = *(id *)(*(_QWORD *)&buf[8] + 40);
          v99 = v96;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = dispatch_time(0, 3600000000000);
          if (dispatch_semaphore_wait(v99, v101))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v193, "timeIntervalSinceDate:", v100);
            v103 = v102;
            v104 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "filteredArrayUsingPredicate:", v105);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "firstObject");
            v108 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v104, "submitToCoreAnalytics:type:duration:", v108, 1, v103);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v109 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v222 = 0;
              _os_log_fault_impl(&dword_1D1A22000, v109, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v222, 2u);
            }

            v110 = (void *)MEMORY[0x1E0CB35C8];
            *(_QWORD *)v243 = *MEMORY[0x1E0CB2D50];
            *(_QWORD *)v222 = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v222, v243, 1);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();

            if (v112)
            {
              v97 = objc_retainAutorelease(v112);

            }
          }

          objc_storeStrong(v98, v97);
          _Block_object_dispose(buf, 8);

        }
      }
      v113 = dispatch_semaphore_create(0);
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v114 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
      {
        v184 = objc_msgSend(v199, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v184;
        _os_log_debug_impl(&dword_1D1A22000, v114, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager adding %lu locations to location store", buf, 0xCu);
      }

      v208[0] = MEMORY[0x1E0C809B0];
      v208[1] = 3221225472;
      v208[2] = __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_79;
      v208[3] = &unk_1E9297038;
      v210 = v238;
      v115 = v113;
      v209 = v115;
      -[RTTripSegmentManager addLocationsToStore:handler:](self, "addLocationsToStore:handler:", v199, v208);
      v117 = (id *)(*(_QWORD *)&v238[8] + 40);
      v116 = *(id *)(*(_QWORD *)&v238[8] + 40);
      v118 = v115;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v118, v120))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v194, "timeIntervalSinceDate:", v119);
        v122 = v121;
        v123 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "filteredArrayUsingPredicate:", v124);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "firstObject");
        v127 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v123, "submitToCoreAnalytics:type:duration:", v127, 1, v122);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v128 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v128, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v129 = (void *)MEMORY[0x1E0CB35C8];
        *(_QWORD *)v222 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v222, 1);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v130);
        v131 = (void *)objc_claimAutoreleasedReturnValue();

        if (v131)
        {
          v116 = objc_retainAutorelease(v131);

        }
      }

      objc_storeStrong(v117, v116);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v227 = __Block_byref_object_copy__1;
      v228 = __Block_byref_object_dispose__1;
      v229 = 0;
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v132 = objc_claimAutoreleasedReturnValue();
      v133 = os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG);
      if (v187)
      {
        if (v133)
        {
          *(_DWORD *)v222 = 67109120;
          *(_DWORD *)&v222[4] = 1;
          _os_log_debug_impl(&dword_1D1A22000, v132, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager inserting tripSegment in RTTripSegmentStore (isEndOfSegment == %d)", v222, 8u);
        }

        v134 = dispatch_semaphore_create(0);
        -[RTTripSegmentManager tripSegmentStore](self, "tripSegmentStore");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        tripSegmentUnderConstruction = self->_tripSegmentUnderConstruction;
        v205[0] = MEMORY[0x1E0C809B0];
        v205[1] = 3221225472;
        v205[2] = __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_80;
        v205[3] = &unk_1E92970D8;
        v207 = buf;
        v205[4] = self;
        v137 = v134;
        v206 = v137;
        objc_msgSend(v135, "storeTripSegment:handler:", tripSegmentUnderConstruction, v205);

        v139 = (id *)(*(_QWORD *)&buf[8] + 40);
        v138 = *(id *)(*(_QWORD *)&buf[8] + 40);
        v140 = v137;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v140, v141))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v188, "timeIntervalSinceDate:", v195);
          v143 = v142;
          v144 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "filteredArrayUsingPredicate:", v145);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "firstObject");
          v148 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v144, "submitToCoreAnalytics:type:duration:", v148, 1, v143);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v149 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v149, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v222 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v149, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v222, 2u);
          }

          v150 = (void *)MEMORY[0x1E0CB35C8];
          *(_QWORD *)v243 = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)v222 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v222, v243, 1);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v151);
          v152 = (void *)objc_claimAutoreleasedReturnValue();

          if (v152)
          {
            v138 = objc_retainAutorelease(v152);

          }
        }

        objc_storeStrong(v139, v138);
        v153 = objc_alloc(MEMORY[0x1E0C99D68]);
        -[RTTripSegment dateInterval](self->_tripSegmentUnderConstruction, "dateInterval");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "startDate");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = (void *)objc_msgSend(v153, "initWithTimeInterval:sinceDate:", v155, -60.0);

        -[RTTripSegmentManager setTripSegmentUnderConstruction:](self, "setTripSegmentUnderConstruction:", 0);
        -[RTTripSegmentManager setTripSegmentUnderConstructionLastLocationTimestamp:](self, "setTripSegmentUnderConstructionLastLocationTimestamp:", 0);

        if (!v156)
          goto LABEL_100;
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v157 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v222 = 0;
          _os_log_debug_impl(&dword_1D1A22000, v157, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager performing post-storeTripSegment sanitization.", v222, 2u);
        }

        v158 = dispatch_semaphore_create(0);
        *(_QWORD *)v222 = 0;
        *(_QWORD *)&v222[8] = v222;
        *(_QWORD *)&v222[16] = 0x3032000000;
        v223 = __Block_byref_object_copy__1;
        v224 = __Block_byref_object_dispose__1;
        v225 = 0;
        v202[0] = MEMORY[0x1E0C809B0];
        v202[1] = 3221225472;
        v202[2] = __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_81;
        v202[3] = &unk_1E9297038;
        v204 = v222;
        v159 = v158;
        v203 = v159;
        -[RTTripSegmentManager _sanitizeTripSegmentDatabaseSinceDate:handler:](self, "_sanitizeTripSegmentDatabaseSinceDate:handler:", v156, v202);
        v161 = (id *)(*(_QWORD *)&v222[8] + 40);
        v160 = *(id *)(*(_QWORD *)&v222[8] + 40);
        v132 = v159;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v132, v162))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v196, "timeIntervalSinceDate:", v201);
          v164 = v163;
          v165 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "filteredArrayUsingPredicate:", v166);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "firstObject");
          v169 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v165, "submitToCoreAnalytics:type:duration:", v169, 1, v164);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v170 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v170, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v243 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v170, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v243, 2u);
          }

          v171 = (void *)MEMORY[0x1E0CB35C8];
          v242 = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)v243 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v243, &v242, 1);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v172);
          v173 = (void *)objc_claimAutoreleasedReturnValue();

          if (v173)
          {
            v160 = objc_retainAutorelease(v173);

          }
        }

        objc_storeStrong(v161, v160);
        _Block_object_dispose(v222, 8);

      }
      else
      {
        if (v133)
        {
          *(_DWORD *)v222 = 67109120;
          *(_DWORD *)&v222[4] = 0;
          _os_log_debug_impl(&dword_1D1A22000, v132, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager maintaining tripSegment under construction (isEndOfSegment == %d)", v222, 8u);
        }
        v156 = 0;
      }

LABEL_100:
      v192[2](v192, *(_QWORD *)(*(_QWORD *)&v238[8] + 40));
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(v231, 8);
      goto LABEL_101;
    }
    if (v21)
    {
      *(_WORD *)v231 = 0;
      _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager Possible duplication of trip segment, date interval overlaps with previous entry. Not adding new data.", v231, 2u);
    }

    v40 = (void *)MEMORY[0x1E0CB35C8];
    v234 = *MEMORY[0x1E0CB2D50];
    v235 = CFSTR("TripSegment already exists with this dateInterval.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v235, &v234, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v41);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = *(void **)(*(_QWORD *)&v238[8] + 40);
    *(_QWORD *)(*(_QWORD *)&v238[8] + 40) = v42;

    v192[2](v192, *(_QWORD *)(*(_QWORD *)&v238[8] + 40));
  }
LABEL_101:
  _Block_object_dispose(v238, 8);

}

void __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v10 = 134218242;
    v11 = v9;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager adjustElevationForLocations, location count, %lu, error, %@", (uint8_t *)&v10, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_78(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager clean location store for new batch, error, %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_79(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager addLocationsToStore, error, %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_80(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "tripSegmentUnderConstruction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager stored trip segment, %@, error, %@", (uint8_t *)&v7, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __162__RTTripSegmentManager__addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke_81(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)addTripSegmentData:(id)a3 isEndOfSegment:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int64_t v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      v23 = "-[RTTripSegmentManager addTripSegmentData:isEndOfSegment:handler:]";
      v24 = 1024;
      v25 = 1023;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clTripSegmentData (in %s:%d)", (uint8_t *)&v22, 0x12u);
    }

  }
  if (self->_isTripSegmentGenerationEnabled)
  {
    objc_msgSend(v8, "tripSegmentID");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v8, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:", v13, v14);
    objc_msgSend(v8, "distance_m");
    v17 = v16;
    objc_msgSend(v8, "distanceUnc_m");
    v19 = v18;
    v20 = +[RTTripSegmentManager translateModeOfTransport:](RTTripSegmentManager, "translateModeOfTransport:", objc_msgSend(v8, "modeOfTransport"));
    objc_msgSend(v8, "tripLocations");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTripSegmentManager addTripSegmentDataWithIdentifier:dateInterval:tripDistance:tripDistanceUncertainty:modeOfTransportation:locations:isEndOfSegment:handler:](self, "addTripSegmentDataWithIdentifier:dateInterval:tripDistance:tripDistanceUncertainty:modeOfTransportation:locations:isEndOfSegment:handler:", v11, v15, v20, v21, v6, v9, v17, v19);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager: trip segment generation is disabled on device.", (uint8_t *)&v22, 2u);
    }
  }

}

- (void)addTripSegmentDataWithIdentifier:(id)a3 dateInterval:(id)a4 tripDistance:(double)a5 tripDistanceUncertainty:(double)a6 modeOfTransportation:(int64_t)a7 locations:(id)a8 isEndOfSegment:(BOOL)a9 handler:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  double v32;
  double v33;
  int64_t v34;
  BOOL v35;

  v18 = a3;
  v19 = a4;
  v20 = a8;
  v21 = a10;
  -[RTNotifier queue](self, "queue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __161__RTTripSegmentManager_addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke;
  block[3] = &unk_1E9297100;
  block[4] = self;
  v28 = v18;
  v32 = a5;
  v33 = a6;
  v34 = a7;
  v29 = v19;
  v30 = v20;
  v35 = a9;
  v31 = v21;
  v23 = v21;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  dispatch_async(v22, block);

}

uint64_t __161__RTTripSegmentManager_addTripSegmentDataWithIdentifier_dateInterval_tripDistance_tripDistanceUncertainty_modeOfTransportation_locations_isEndOfSegment_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addTripSegmentDataWithIdentifier:dateInterval:tripDistance:tripDistanceUncertainty:modeOfTransportation:locations:isEndOfSegment:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)_deleteTripSegmentWithUUID:(id)a3 handler:(id)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  id *v10;
  id v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  dispatch_semaphore_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  id *v40;
  id v41;
  void *v42;
  dispatch_time_t v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  dispatch_semaphore_t v56;
  void *v57;
  NSObject *v58;
  id *v59;
  id v60;
  NSObject *v61;
  void *v62;
  dispatch_time_t v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  RTTripSegmentManager *v75;
  void *v76;
  id v77;
  NSObject *dsema;
  void (**v79)(void);
  _QWORD v80[4];
  NSObject *v81;
  uint8_t *v82;
  _QWORD v83[4];
  NSObject *v84;
  uint8_t *v85;
  _QWORD v86[4];
  id v87;
  NSObject *v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint8_t v103[8];
  uint8_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint8_t buf[8];
  uint8_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;
  uint8_t v116[16];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v79 = (void (**)(void))a4;
  v7 = dispatch_semaphore_create(0);
  v97 = 0;
  v98 = &v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__1;
  v101 = __Block_byref_object_dispose__1;
  v102 = 0;
  v91 = 0;
  v92 = &v91;
  v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__1;
  v95 = __Block_byref_object_dispose__1;
  v96 = 0;
  v75 = self;
  -[RTTripSegmentManager tripSegmentStore](self, "tripSegmentStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke;
  v86[3] = &unk_1E9297128;
  v89 = &v91;
  v87 = v6;
  v90 = &v97;
  v9 = v7;
  v88 = v9;
  v77 = v87;
  objc_msgSend(v8, "fetchTripSegmentsWithUUID:handler:", v87, v86);

  v10 = (id *)(v98 + 5);
  v11 = (id)v98[5];
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v12, v14))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)v103 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v103, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v11 = objc_retainAutorelease(v26);

    }
  }

  objc_storeStrong(v10, v11);
  if (v98[5])
  {
    v79[2]();
  }
  else
  {
    *(_QWORD *)buf = 0;
    v110 = buf;
    v111 = 0x3032000000;
    v112 = __Block_byref_object_copy__1;
    v113 = __Block_byref_object_dispose__1;
    v114 = 0;
    v27 = objc_alloc(MEMORY[0x1E0CB3588]);
    v28 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend((id)v92[5], "startDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithTimeInterval:sinceDate:", v29, -0.001);
    v31 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend((id)v92[5], "endDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithTimeInterval:sinceDate:", v32, 0.001);
    v34 = objc_msgSend(v27, "initWithStartDate:endDate:", v30, v33);
    v35 = (void *)v92[5];
    v92[5] = v34;

    v36 = dispatch_semaphore_create(0);
    -[RTTripSegmentManager locationStore](v75, "locationStore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v92[5];
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke_82;
    v83[3] = &unk_1E9297038;
    v85 = buf;
    v39 = v36;
    v84 = v39;
    objc_msgSend(v37, "removeLocationsOnDateInterval:handler:", v38, v83);

    v40 = (id *)(v98 + 5);
    v41 = (id)v98[5];
    dsema = v39;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v43))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "timeIntervalSinceDate:", v42);
      v46 = v45;
      v47 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "filteredArrayUsingPredicate:", v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "firstObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "submitToCoreAnalytics:type:duration:", v51, 1, v46);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v103 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v103, 2u);
      }

      v53 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v116 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v103 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v116, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        v41 = objc_retainAutorelease(v55);

      }
    }

    objc_storeStrong(v40, v41);
    if (*((_QWORD *)v110 + 5))
    {
      v79[2]();
    }
    else
    {
      *(_QWORD *)v103 = 0;
      v104 = v103;
      v105 = 0x3032000000;
      v106 = __Block_byref_object_copy__1;
      v107 = __Block_byref_object_dispose__1;
      v108 = 0;
      v56 = dispatch_semaphore_create(0);
      -[RTTripSegmentManager tripSegmentStore](v75, "tripSegmentStore");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke_2;
      v80[3] = &unk_1E9297038;
      v82 = v103;
      v58 = v56;
      v81 = v58;
      objc_msgSend(v57, "deleteTripSegmentWithUUID:handler:", v77, v80);

      v59 = (id *)(v104 + 40);
      v60 = (id)*((_QWORD *)v104 + 5);
      v61 = v58;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v61, v63))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "timeIntervalSinceDate:", v62);
        v65 = v64;
        v66 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "filteredArrayUsingPredicate:", v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "firstObject");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v66, "submitToCoreAnalytics:type:duration:", v70, 1, v65);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v116 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v116, 2u);
        }

        v72 = (void *)MEMORY[0x1E0CB35C8];
        v115 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v116 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        if (v74)
        {
          v60 = objc_retainAutorelease(v74);

        }
      }

      objc_storeStrong(v59, v60);
      ((void (*)(void (**)(void), _QWORD))v79[2])(v79, *((_QWORD *)v104 + 5));

      _Block_object_dispose(v103, 8);
    }

    _Block_object_dispose(buf, 8);
  }

  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v97, 8);

}

void __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dateInterval");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        if ((unint64_t)objc_msgSend(v5, "count") >= 2)
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v16 = objc_msgSend(v5, "count");
            v17 = *(_QWORD *)(a1 + 32);
            v18 = 134218242;
            v19 = v16;
            v20 = 2112;
            v21 = v17;
            _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:deleteTripSegmentWithUUID multiple (%tu) trip segments found with UUID %@", (uint8_t *)&v18, 0x16u);
          }

        }
      }
    }
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v7;
  v15 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke_82(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __59__RTTripSegmentManager__deleteTripSegmentWithUUID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)deleteTripSegmentWithUUID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTTripSegmentManager deleteTripSegmentWithUUID:handler:]";
    v19 = 1024;
    v20 = 1122;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuid (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTripSegmentManager deleteTripSegmentWithUUID:handler:]";
      v19 = 1024;
      v20 = 1123;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__RTTripSegmentManager_deleteTripSegmentWithUUID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __58__RTTripSegmentManager_deleteTripSegmentWithUUID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteTripSegmentWithUUID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_getPurgePolicyOverrideDaysToPersistTripSegmentData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  id v9;

  v4 = a3;
  -[RTTripSegmentManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsTripSegmentOverrideDaysToPersistTripSegmentData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", v7 * -86400.0);
    objc_msgSend(v8, "earlierDate:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (void)purgeTripSegmentsPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTTripSegmentManager purgeTripSegmentsPredating:handler:]";
    v19 = 1024;
    v20 = 1148;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTripSegmentManager purgeTripSegmentsPredating:handler:]";
      v19 = 1024;
      v20 = 1149;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

void __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;

  objc_msgSend(*(id *)(a1 + 32), "_getPurgePolicyOverrideDaysToPersistTripSegmentData:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  objc_msgSend(*(id *)(a1 + 32), "tripSegmentStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_2;
  v14[3] = &unk_1E9297150;
  v6 = v3;
  v15 = v6;
  objc_msgSend(v4, "purgeTripSegmentsPredating:handler:", v2, v14);

  dispatch_group_enter(v6);
  objc_msgSend(*(id *)(a1 + 32), "locationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_3;
  v12[3] = &unk_1E9297150;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "removeLocationsPredating:handler:", v2, v12);

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_4;
  block[3] = &unk_1E9297178;
  v11 = *(id *)(a1 + 48);
  dispatch_group_notify(v8, v9, block);

}

void __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __59__RTTripSegmentManager_purgeTripSegmentsPredating_handler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4
{
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  id *v10;
  id v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  dispatch_semaphore_t v27;
  void *v28;
  NSObject *v29;
  id *v30;
  id v31;
  NSObject *v32;
  void *v33;
  dispatch_time_t v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  RTTripSegmentManager *v46;
  void *v47;
  void (**v48)(id, _QWORD);
  id v49;
  _QWORD v50[4];
  NSObject *v51;
  _BYTE *v52;
  _QWORD v53[4];
  NSObject *v54;
  _BYTE *v55;
  _BYTE v56[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint8_t buf[16];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v48 = (void (**)(id, _QWORD))a4;
  if (!v48)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v56 = 136315394;
      *(_QWORD *)&v56[4] = "-[RTTripSegmentManager _purgeTripSegmentsOnDateInterval:handler:]";
      *(_WORD *)&v56[12] = 1024;
      *(_DWORD *)&v56[14] = 1185;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v56, 0x12u);
    }

  }
  *(_QWORD *)v56 = 0;
  *(_QWORD *)&v56[8] = v56;
  *(_QWORD *)&v56[16] = 0x3032000000;
  v57 = __Block_byref_object_copy__1;
  v58 = __Block_byref_object_dispose__1;
  v59 = 0;
  v7 = dispatch_semaphore_create(0);
  v46 = self;
  -[RTTripSegmentManager tripSegmentStore](self, "tripSegmentStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __65__RTTripSegmentManager__purgeTripSegmentsOnDateInterval_handler___block_invoke;
  v53[3] = &unk_1E9297038;
  v55 = v56;
  v9 = v7;
  v54 = v9;
  objc_msgSend(v8, "purgeTripSegmentsOnDateInterval:handler:", v49, v53);

  v10 = (id *)(*(_QWORD *)&v56[8] + 40);
  v11 = *(id *)(*(_QWORD *)&v56[8] + 40);
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v12, v14))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v60 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v60, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v11 = objc_retainAutorelease(v26);

    }
  }

  objc_storeStrong(v10, v11);
  if (*(_QWORD *)(*(_QWORD *)&v56[8] + 40))
  {
    v48[2](v48, 0);
  }
  else
  {
    v27 = dispatch_semaphore_create(0);
    -[RTTripSegmentManager locationStore](v46, "locationStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __65__RTTripSegmentManager__purgeTripSegmentsOnDateInterval_handler___block_invoke_2;
    v50[3] = &unk_1E9297038;
    v52 = v56;
    v29 = v27;
    v51 = v29;
    objc_msgSend(v28, "removeLocationsOnDateInterval:handler:", v49, v50);

    v30 = (id *)(*(_QWORD *)&v56[8] + 40);
    v31 = *(id *)(*(_QWORD *)&v56[8] + 40);
    v32 = v29;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v32, v34))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "timeIntervalSinceDate:", v33);
      v36 = v35;
      v37 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "filteredArrayUsingPredicate:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "submitToCoreAnalytics:type:duration:", v41, 1, v36);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v43 = (void *)MEMORY[0x1E0CB35C8];
      v60 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v60, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        v31 = objc_retainAutorelease(v45);

      }
    }

    objc_storeStrong(v30, v31);
    v48[2](v48, 0);

  }
  _Block_object_dispose(v56, 8);

}

void __65__RTTripSegmentManager__purgeTripSegmentsOnDateInterval_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __65__RTTripSegmentManager__purgeTripSegmentsOnDateInterval_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTTripSegmentManager purgeTripSegmentsOnDateInterval:handler:]";
    v19 = 1024;
    v20 = 1216;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTripSegmentManager purgeTripSegmentsOnDateInterval:handler:]";
      v19 = 1024;
      v20 = 1217;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__RTTripSegmentManager_purgeTripSegmentsOnDateInterval_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __64__RTTripSegmentManager_purgeTripSegmentsOnDateInterval_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeTripSegmentsOnDateInterval:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  RTTripSegmentManager *v16;
  id v17;
  int64_t v18;
  SEL v19;

  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTTripSegmentManager_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E92971C8;
  v17 = v10;
  v18 = a3;
  v15 = v9;
  v16 = self;
  v19 = a2;
  v12 = v10;
  v13 = v9;
  dispatch_async(v11, block);

}

void __68__RTTripSegmentManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 56) <= 2uLL && (v2 = *(id *)(a1 + 32)) != 0)
  {
    v3 = v2;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__RTTripSegmentManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v5[3] = &unk_1E92971A0;
    v7 = *(_QWORD *)(a1 + 64);
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "purgeTripSegmentsPredating:handler:", v3, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __68__RTTripSegmentManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%@, performPurgeOfType, error, %@", (uint8_t *)&v6, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)isSpeedValidityCheckingEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[RTTripSegmentManager defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsTripSegmentEnableSpeedValidityChecks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)_sanitizeTripSegmentDatabaseSinceDate:(id)a3 handler:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  id *v11;
  id v12;
  void *v13;
  dispatch_time_t v14;
  intptr_t v15;
  uint64_t *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  unint64_t v60;
  NSObject *v61;
  dispatch_semaphore_t v62;
  void *v63;
  void *v64;
  NSObject *v65;
  id v66;
  id *v67;
  NSObject *v68;
  void *v69;
  dispatch_time_t v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  BOOL v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  dispatch_semaphore_t v91;
  void *v92;
  NSObject *v93;
  id *v94;
  id v95;
  void *v96;
  dispatch_time_t v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  NSObject *v112;
  dispatch_semaphore_t v113;
  void *v114;
  NSObject *v115;
  id *v116;
  id v117;
  void *v118;
  dispatch_time_t v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  NSObject *v133;
  NSObject *v134;
  int v135;
  unint64_t i;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  double v141;
  BOOL v142;
  void *v143;
  BOOL v144;
  NSObject *v145;
  NSObject *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  void *v154;
  unint64_t v155;
  void *v156;
  void *v157;
  unint64_t v158;
  void *v159;
  void *v160;
  double v161;
  double v162;
  id v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  double v175;
  double v176;
  void *v177;
  double v178;
  double v179;
  void *v180;
  double v181;
  double v182;
  void *v183;
  void *v184;
  void *v185;
  double v186;
  double v187;
  void *v188;
  double v189;
  double v190;
  void *v191;
  double v192;
  double v193;
  double v194;
  NSObject *v195;
  uint64_t (*v196)(uint64_t, uint64_t);
  double v197;
  double v198;
  void *v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  void *v213;
  double v214;
  double v215;
  void *v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  void *v220;
  uint64_t v221;
  void *v222;
  void *v223;
  void *v224;
  RTSynthesizedLocation *v225;
  void *v226;
  int v227;
  unint64_t v228;
  NSObject *v229;
  _BOOL4 v230;
  dispatch_semaphore_t v231;
  id v232;
  id v233;
  void *v234;
  void *v235;
  id v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  NSObject *v241;
  id *v242;
  id v243;
  NSObject *v244;
  void *v245;
  dispatch_time_t v246;
  void *v247;
  double v248;
  double v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  NSObject *v255;
  void *v256;
  void *v257;
  void *v258;
  NSObject *v259;
  int v260;
  dispatch_semaphore_t v261;
  void *v262;
  NSObject *v263;
  id *v264;
  id v265;
  NSObject *v266;
  void *v267;
  dispatch_time_t v268;
  double v269;
  double v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  NSObject *v276;
  void *v277;
  void *v278;
  void *v279;
  NSObject *v280;
  uint64_t v281;
  void *v282;
  uint64_t v283;
  NSObject *v284;
  uint64_t v285;
  id v286;
  uint64_t (*v287)(uint64_t, uint64_t);
  uint64_t (*v288)(uint64_t, uint64_t);
  id v289;
  id v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t (*v294)(uint64_t, uint64_t);
  uint64_t v295;
  id v296;
  id v297;
  void *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  double v304;
  void *v305;
  double v306;
  _BOOL4 v307;
  NSObject *v308;
  dispatch_semaphore_t v309;
  void *v310;
  NSObject *v311;
  id *v312;
  id v313;
  NSObject *v314;
  void *v315;
  dispatch_time_t v316;
  void *v317;
  double v318;
  double v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  NSObject *v325;
  void *v326;
  void *v327;
  void *v328;
  dispatch_semaphore_t v329;
  NSObject *v330;
  id v331;
  id *v332;
  NSObject *v333;
  void *v334;
  dispatch_time_t v335;
  double v336;
  double v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  NSObject *v343;
  void *v344;
  void *v345;
  void *v346;
  uint64_t v347;
  BOOL v348;
  NSObject *v349;
  uint64_t v350;
  NSObject *v351;
  const char *v352;
  uint32_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  void *v358;
  uint64_t v359;
  void *v360;
  uint64_t v361;
  void *v362;
  NSObject *v363;
  uint64_t v364;
  void *v365;
  unint64_t v366;
  void *v367;
  RTSynthesizedLocation *v368;
  void *v369;
  void *v370;
  void *v371;
  char v372;
  void *v373;
  void *v374;
  id v375;
  void (**v376)(id, _QWORD);
  void *v377;
  NSObject *v378;
  NSObject *dsema;
  RTDistanceCalculator *distanceCalculator;
  id v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  double obj;
  id obja;
  id objb;
  void *v392;
  NSObject *log;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  void *v397;
  unint64_t v399;
  void *v400;
  uint64_t v401;
  void *v402;
  void *v403;
  uint64_t v404;
  _QWORD v405[4];
  NSObject *v406;
  _BYTE *v407;
  _QWORD v408[4];
  NSObject *v409;
  _BYTE *v410;
  uint8_t *v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  _QWORD v416[4];
  NSObject *v417;
  _BYTE *v418;
  _QWORD v419[4];
  NSObject *v420;
  uint64_t *v421;
  id v422;
  _QWORD v423[4];
  NSObject *v424;
  uint64_t *v425;
  uint8_t *v426;
  uint64_t *v427;
  uint64_t v428;
  uint64_t *v429;
  uint64_t v430;
  uint64_t v431;
  _QWORD v432[4];
  NSObject *v433;
  uint64_t *v434;
  uint64_t *v435;
  uint64_t v436;
  uint64_t *v437;
  uint64_t v438;
  uint64_t v439;
  _QWORD v440[4];
  NSObject *v441;
  uint64_t *v442;
  _QWORD v443[4];
  NSObject *v444;
  uint64_t *v445;
  uint64_t *v446;
  uint64_t v447;
  uint64_t *v448;
  uint64_t v449;
  uint64_t (*v450)(uint64_t, uint64_t);
  void (*v451)(uint64_t);
  id v452;
  uint64_t v453;
  uint64_t *v454;
  uint64_t v455;
  uint64_t (*v456)(uint64_t, uint64_t);
  void (*v457)(uint64_t);
  id v458;
  _BYTE v459[12];
  __int16 v460;
  uint64_t v461;
  __int16 v462;
  void *v463;
  uint8_t v464[128];
  _BYTE buf[24];
  uint64_t (*v466)(uint64_t, uint64_t);
  _BYTE v467[20];
  uint8_t v468[8];
  uint8_t *v469;
  uint64_t v470;
  uint64_t (*v471)(uint64_t, uint64_t);
  void (*v472)(uint64_t);
  id v473;
  uint64_t v474;
  uint64_t *v475;
  uint64_t v476;
  uint64_t (*v477)(uint64_t, uint64_t);
  void (*v478)(uint64_t);
  id v479;
  uint64_t v480;
  uint64_t *v481;
  uint64_t v482;
  uint64_t (*v483)(uint64_t, uint64_t);
  void (*v484)(uint64_t);
  id v485;
  _QWORD v486[4];

  v486[1] = *MEMORY[0x1E0C80C00];
  v375 = a3;
  v376 = (void (**)(id, _QWORD))a4;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler invoked", buf, 2u);
  }

  -[RTTripSegmentManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsTripSegmentEnableDatabaseSanitization"));
  v377 = (void *)objc_claimAutoreleasedReturnValue();

  if (v377 && (objc_msgSend(v377, "BOOLValue") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D1A22000, log, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler database sanitization has been disabled via defaults/profile (RTDefaultsTripSegmentEnableDatabaseSanitization == false).", buf, 2u);
    }
    goto LABEL_182;
  }
  if (v375)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    log = (id)objc_msgSend(v7, "initWithStartDate:endDate:", v375, v8);

  }
  else
  {
    log = 0;
  }
  v374 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F8]), "initWithAscending:dateInterval:limit:", 1, log, 0);
  v9 = dispatch_semaphore_create(0);
  v453 = 0;
  v454 = &v453;
  v455 = 0x3032000000;
  v456 = __Block_byref_object_copy__1;
  v457 = __Block_byref_object_dispose__1;
  v458 = 0;
  v447 = 0;
  v448 = &v447;
  v449 = 0x3032000000;
  v450 = __Block_byref_object_copy__1;
  v451 = __Block_byref_object_dispose__1;
  v452 = 0;
  v443[0] = MEMORY[0x1E0C809B0];
  v443[1] = 3221225472;
  v443[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke;
  v443[3] = &unk_1E9296EE0;
  v445 = &v447;
  v446 = &v453;
  v10 = v9;
  v444 = v10;
  -[RTTripSegmentManager _fetchTripSegmentsWithOptions:handler:](self, "_fetchTripSegmentsWithOptions:handler:", v374, v443);
  v11 = (id *)(v448 + 5);
  v12 = (id)v448[5];
  dsema = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  v15 = dispatch_semaphore_wait(dsema, v14);
  v16 = (uint64_t *)MEMORY[0x1E0CB2D50];
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v13);
    v19 = v18;
    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v480 = *v16;
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v480, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v12 = objc_retainAutorelease(v28);

    }
  }

  objc_storeStrong(v11, v12);
  v29 = (void *)v454[5];
  if (!v29 || !objc_msgSend(v29, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler no stored trip segments, returning early.", buf, 2u);
    }

    v376[2](v376, v448[5]);
    goto LABEL_181;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  while (v30 < objc_msgSend((id)v454[5], "count"))
  {
    if (!v30 && !log)
    {
      v31 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend((id)v454[5], "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "dateInterval");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "startDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v33, "initWithTimeInterval:sinceDate:", v36, -0.001);
      v38 = (void *)objc_msgSend(v31, "initWithStartDate:endDate:", v32, v37);
      objc_msgSend(v397, "addObject:", v38);

    }
    if (v30 == objc_msgSend((id)v454[5], "count") - 1)
    {
      v39 = objc_alloc(MEMORY[0x1E0CB3588]);
      v40 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend((id)v454[5], "objectAtIndexedSubscript:", v30);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "dateInterval");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "endDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v40, "initWithTimeInterval:sinceDate:", v43, 0.001);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v39, "initWithStartDate:endDate:", v44, v45);
      objc_msgSend(v397, "addObject:", v46);

      ++v30;
    }
    else
    {
      v47 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend((id)v454[5], "objectAtIndexedSubscript:", v30);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "dateInterval");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "endDate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v47, "initWithTimeInterval:sinceDate:", v50, 0.001);

      v52 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend((id)v454[5], "objectAtIndexedSubscript:", ++v30);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "dateInterval");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "startDate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(v52, "initWithTimeInterval:sinceDate:", v55, -0.001);

      if (objc_msgSend(v51, "isBeforeDate:", v56))
      {
        v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v51, v56);
        objc_msgSend(v397, "addObject:", v57);

      }
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    v355 = objc_msgSend((id)v454[5], "count");
    v356 = objc_msgSend(v397, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v355;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v356;
    _os_log_debug_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, tripSegments.count, %zu, dateIntervalsBetween.count, %zu", buf, 0x16u);
  }

  v60 = 0;
  v480 = 0;
  v481 = &v480;
  v482 = 0x3032000000;
  v483 = __Block_byref_object_copy__1;
  v484 = __Block_byref_object_dispose__1;
  v485 = 0;
  v395 = *MEMORY[0x1E0D18598];
  v396 = *v16;
  do
  {
    if (v60 >= objc_msgSend(v397, "count"))
      break;
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v397, "objectAtIndexedSubscript:", v60);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v83;
      _os_log_debug_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, Purging orphan trip segment locations on interval: %@", buf, 0xCu);

    }
    v62 = dispatch_semaphore_create(0);
    -[RTTripSegmentManager locationStore](self, "locationStore");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v397, "objectAtIndexedSubscript:", v60);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v440[0] = MEMORY[0x1E0C809B0];
    v440[1] = 3221225472;
    v440[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_89;
    v440[3] = &unk_1E9297038;
    v442 = &v480;
    v65 = v62;
    v441 = v65;
    objc_msgSend(v63, "removeLocationsOnDateInterval:handler:", v64, v440);

    v67 = (id *)(v481 + 5);
    v66 = (id)v481[5];
    v68 = v65;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v68, v70))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v402 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v402, "timeIntervalSinceDate:", v69);
      v72 = v71;
      v73 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "filteredArrayUsingPredicate:", v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "firstObject");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v73, "submitToCoreAnalytics:type:duration:", v77, 1, v72);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v79 = (void *)MEMORY[0x1E0CB35C8];
      v474 = v396;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v474, 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "errorWithDomain:code:userInfo:", v395, 15, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
      {
        v66 = objc_retainAutorelease(v81);

      }
    }

    objc_storeStrong(v67, v66);
    v82 = v481[5] == 0;

    ++v60;
  }
  while (v82);
  if (v481[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      v357 = v481[5];
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v357;
      _os_log_error_impl(&dword_1D1A22000, v84, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:Error executing removeLocationsOnDateInterval for dateIntervalsBetween %@", buf, 0xCu);
    }

    v376[2](v376, v481[5]);
    goto LABEL_180;
  }
  objc_msgSend((id)v454[5], "firstObject");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "dateInterval");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "startDate");
  v367 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v454[5], "lastObject");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "dateInterval");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "endDate");
  v365 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = objc_alloc(MEMORY[0x1E0D18518]);
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v367, v365);
  v362 = (void *)objc_msgSend(v89, "initWithDateInterval:preferredDownsamplingLevel:batchSize:boundingBoxLocation:", v90, 0, 0, 0);

  v436 = 0;
  v437 = &v436;
  v438 = 0x2020000000;
  v439 = 0;
  v474 = 0;
  v475 = &v474;
  v476 = 0x3032000000;
  v477 = __Block_byref_object_copy__1;
  v478 = __Block_byref_object_dispose__1;
  v479 = 0;
  v91 = dispatch_semaphore_create(0);
  -[RTTripSegmentManager locationStore](self, "locationStore");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v432[0] = MEMORY[0x1E0C809B0];
  v432[1] = 3221225472;
  v432[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_90;
  v432[3] = &unk_1E92971F0;
  v434 = &v436;
  v435 = &v474;
  v93 = v91;
  v433 = v93;
  objc_msgSend(v92, "fetchStoredLocationsCountWithOptions:handler:", v362, v432);

  v94 = (id *)(v475 + 5);
  v95 = (id)v475[5];
  v363 = v93;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v363, v97))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "timeIntervalSinceDate:", v96);
    v100 = v99;
    v101 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "filteredArrayUsingPredicate:", v102);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "firstObject");
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v101, "submitToCoreAnalytics:type:duration:", v105, 1, v100);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v106, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v107 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)v468 = v396;
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v468, 1);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "errorWithDomain:code:userInfo:", v395, 15, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (v109)
    {
      v95 = objc_retainAutorelease(v109);

    }
  }

  objc_storeStrong(v94, v95);
  v110 = v475[5];
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v111 = objc_claimAutoreleasedReturnValue();
  v112 = v111;
  if (v110)
  {
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v362, "dateInterval");
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      v359 = v475[5];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v358;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v359;
      _os_log_error_impl(&dword_1D1A22000, v112, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:Error executing fetchStoredLocationsCountWithOptions, dateInterval, %@, error, %@", buf, 0x16u);

    }
    v376[2](v376, v475[5]);
    goto LABEL_179;
  }
  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v362, "dateInterval");
    v360 = (void *)objc_claimAutoreleasedReturnValue();
    v361 = v437[3];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v360;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v361;
    _os_log_debug_impl(&dword_1D1A22000, v112, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager: fetchStoredLocationsCountWithOptions, dateInterval, %@, expecting %tu locations", buf, 0x16u);

  }
  v364 = 0;
  v366 = 0;
  v428 = 0;
  v429 = &v428;
  v430 = 0x2020000000;
  v431 = 0;
  do
  {
    v429[3] = 0;
    v113 = dispatch_semaphore_create(0);
    *(_QWORD *)v468 = 0;
    v469 = v468;
    v470 = 0x3032000000;
    v471 = __Block_byref_object_copy__1;
    v472 = __Block_byref_object_dispose__1;
    v473 = 0;
    v370 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v367, v365);
    v369 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18518]), "initWithDateInterval:", v370);
    -[RTTripSegmentManager locationStore](self, "locationStore");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v423[0] = MEMORY[0x1E0C809B0];
    v423[1] = 3221225472;
    v423[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_91;
    v423[3] = &unk_1E9297218;
    v425 = &v447;
    v426 = v468;
    v427 = &v428;
    v115 = v113;
    v424 = v115;
    objc_msgSend(v114, "fetchStoredLocationsWithOptions:handler:", v369, v423);

    v116 = (id *)(v448 + 5);
    v117 = (id)v448[5];
    v378 = v115;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v378, v119))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "timeIntervalSinceDate:", v118);
      v122 = v121;
      v123 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "filteredArrayUsingPredicate:", v124);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "firstObject");
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v123, "submitToCoreAnalytics:type:duration:", v127, 1, v122);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v128 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v128, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v129 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v459 = v396;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v459, 1);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "errorWithDomain:code:userInfo:", v395, 15, v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();

      if (v131)
      {
        v117 = objc_retainAutorelease(v131);

      }
    }

    objc_storeStrong(v116, v117);
    v132 = v448[5];
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v133 = objc_claimAutoreleasedReturnValue();
    v134 = v133;
    if (v132)
    {
      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
      {
        v281 = v448[5];
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v370;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v281;
        _os_log_error_impl(&dword_1D1A22000, v134, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:Error executing fetchStoredLocationsWithOptions for fetchInterval %@, error %@", buf, 0x16u);
      }

      v376[2](v376, v448[5]);
      v135 = 1;
      goto LABEL_139;
    }
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
    {
      v285 = v429[3];
      objc_msgSend(v367, "stringFromDate");
      v286 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v365, "stringFromDate");
      v287 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v285;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v286;
      *(_WORD *)&buf[22] = 2112;
      v466 = v287;
      _os_log_debug_impl(&dword_1D1A22000, v134, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, loaded samples this iteration, %tu for interval %@ to %@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend(*((id *)v469 + 5), "count"); ++i)
    {
      if (i)
      {
        objc_msgSend(*((id *)v469 + 5), "objectAtIndexedSubscript:", i);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "timestamp");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)v469 + 5), "objectAtIndexedSubscript:", i - 1);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "timestamp");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "timeIntervalSinceDate:", v140);
        v142 = v141 >= 0.1;

      }
      else
      {
        v142 = 1;
      }
      objc_msgSend(*((id *)v469 + 5), "objectAtIndexedSubscript:", i);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = +[RTTripSegmentManager isValidSynthesizedLocation:](RTTripSegmentManager, "isValidSynthesizedLocation:", v143);

      if (v142)
      {
        if (v144)
        {
          objc_msgSend(*((id *)v469 + 5), "objectAtIndexedSubscript:", i);
          v145 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v403, "addObject:", v145);
        }
        else
        {
LABEL_80:
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v145 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*((id *)v469 + 5), "objectAtIndexedSubscript:", i);
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v154;
            _os_log_debug_impl(&dword_1D1A22000, v145, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler: invalid properties detected, deleting location %@", buf, 0xCu);

          }
        }

        continue;
      }
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v146 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*((id *)v469 + 5), "objectAtIndexedSubscript:", i);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "timestamp");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)v469 + 5), "objectAtIndexedSubscript:", i - 1);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "timestamp");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "timeIntervalSinceDate:", v150);
        v152 = v151;
        objc_msgSend(*((id *)v469 + 5), "objectAtIndexedSubscript:", i);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v152;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v153;
        _os_log_debug_impl(&dword_1D1A22000, v146, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler: invalid date interval %f, deleting location %@", buf, 0x16u);

      }
      if (!v144)
        goto LABEL_80;
    }
    if (!-[RTTripSegmentManager isSpeedValidityCheckingEnabled](self, "isSpeedValidityCheckingEnabled"))
    {
      v227 = 0;
      goto LABEL_103;
    }
    v372 = 0;
    obj = 0.0;
    v155 = 1;
    while (2)
    {
      if (v155 < objc_msgSend(v403, "count"))
      {
        v399 = v155;
        objc_msgSend(v403, "objectAtIndexedSubscript:", v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "timestamp");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = v399 - 1;
        objc_msgSend(v403, "objectAtIndexedSubscript:", v399 - 1);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "timestamp");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "timeIntervalSinceDate:", v160);
        v162 = v161;

        if (v162 > 2.1 || v162 < 0.0001)
        {
          v197 = obj;
        }
        else
        {
          distanceCalculator = self->_distanceCalculator;
          v163 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
          v386 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v386, "coordinate");
          v165 = v164;
          objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
          v384 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v384, "coordinate");
          v167 = v166;
          objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
          v382 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v382, "horizontalAccuracy");
          v169 = v168;
          objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v170, "timestamp");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          v172 = (void *)objc_msgSend(v163, "initWithLatitude:longitude:horizontalUncertainty:date:", v171, v165, v167, v169);
          v173 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v403, "objectAtIndexedSubscript:", v158);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v174, "coordinate");
          v176 = v175;
          objc_msgSend(v403, "objectAtIndexedSubscript:", v158);
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "coordinate");
          v179 = v178;
          objc_msgSend(v403, "objectAtIndexedSubscript:", v158);
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "horizontalAccuracy");
          v182 = v181;
          objc_msgSend(v403, "objectAtIndexedSubscript:", v158);
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v183, "timestamp");
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          v185 = (void *)objc_msgSend(v173, "initWithLatitude:longitude:horizontalUncertainty:date:", v184, v176, v179, v182);
          v422 = 0;
          -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v172, v185, &v422);
          v187 = v186;
          v381 = v422;

          objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v188, "speed");
          v190 = v189;
          objc_msgSend(v403, "objectAtIndexedSubscript:", v158);
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v191, "speed");
          v193 = v192;

          if (!v381)
          {
            v194 = v187 / v162;
            if (v194 < 0.1)
            {
              _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              v195 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
                v196 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                *(double *)&buf[4] = v194;
                *(_WORD *)&buf[12] = 2048;
                *(double *)&buf[14] = v194;
                *(_WORD *)&buf[22] = 2112;
                v466 = v196;
                _os_log_error_impl(&dword_1D1A22000, v195, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, found location with speed inconsistent with delta position, (delta pos. %f), updating to new speed, %f mps, in location sample, %@.", buf, 0x20u);

              }
              goto LABEL_97;
            }
          }
          v198 = vabdd_f64(v190, v193) / v162;
          v197 = 0.0;
          if (v198 > obj * 0.1 + 10.0)
          {
            objc_msgSend(v403, "objectAtIndexedSubscript:", v158);
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v199, "speed");
            v194 = v200;

            obj = obj + v162;
            _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            v195 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              *(double *)&buf[4] = v198;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = 0x4024000000000000;
              *(_WORD *)&buf[22] = 2048;
              v466 = *(uint64_t (**)(uint64_t, uint64_t))&v194;
              *(_WORD *)v467 = 2112;
              *(_QWORD *)&v467[2] = v226;
              _os_log_error_impl(&dword_1D1A22000, v195, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, found location with large discontinuity in speed (%f > %f), updating to new speed, %f mps, in location sample, %@.", buf, 0x2Au);

            }
LABEL_97:

            v197 = 0.0;
            if (v194 >= 0.0)
            {
              v368 = [RTSynthesizedLocation alloc];
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v387 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v387, "coordinate");
              v202 = v201;
              v204 = v203;
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v385 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v385, "altitude");
              v206 = v205;
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v383 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v383, "horizontalAccuracy");
              v208 = v207;
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v373 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v373, "verticalAccuracy");
              v210 = v209;
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v371 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v371, "course");
              v212 = v211;
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v213 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v213, "courseAccuracy");
              v215 = v214;
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v216 = (void *)objc_claimAutoreleasedReturnValue();
              v217 = objc_msgSend(v216, "geoRoadClass");
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              v219 = objc_msgSend(v218, "geoFormOfWay");
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              v221 = objc_msgSend(v220, "locationType");
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v222 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v222, "timestamp");
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v403, "objectAtIndexedSubscript:", v399);
              v224 = (void *)objc_claimAutoreleasedReturnValue();
              v225 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:](v368, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", v217, v219, v221, v223, objc_msgSend(v224, "downsamplingLevel"), v202, v204, v206, v208, v210, v212, v215, v194, 0x4024000000000000);
              objc_msgSend(v403, "setObject:atIndexedSubscript:", v225, v399);

              v372 = 1;
              v197 = obj;
            }
          }

        }
        v155 = v399 + 1;
        obj = v197;
        continue;
      }
      break;
    }
    v227 = v372 & 1;
LABEL_103:
    v228 = objc_msgSend(v403, "count");
    if (v228 < objc_msgSend(*((id *)v469 + 5), "count"))
      v227 = 1;
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v229 = objc_claimAutoreleasedReturnValue();
    v230 = os_log_type_enabled(v229, OS_LOG_TYPE_DEBUG);
    if (v227 == 1)
    {
      if (v230)
      {
        v291 = objc_msgSend(*((id *)v469 + 5), "count");
        v292 = objc_msgSend(v403, "count");
        v293 = objc_msgSend(*((id *)v469 + 5), "count");
        objc_msgSend(v367, "stringFromDate");
        v294 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v365, "stringFromDate");
        v295 = v291 - v292;
        v296 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v295;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v293;
        *(_WORD *)&buf[22] = 2112;
        v466 = v294;
        *(_WORD *)v467 = 2112;
        *(_QWORD *)&v467[2] = v296;
        _os_log_debug_impl(&dword_1D1A22000, v229, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, %ld invalid locations found in the %ld fetched locations for interval %@ to %@", buf, 0x2Au);

      }
      v231 = dispatch_semaphore_create(0);
      v232 = objc_alloc(MEMORY[0x1E0CB3588]);
      v233 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v370, "startDate");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      v235 = (void *)objc_msgSend(v233, "initWithTimeInterval:sinceDate:", v234, -0.001);
      v236 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(*((id *)v469 + 5), "lastObject");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "timestamp");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      v239 = (void *)objc_msgSend(v236, "initWithTimeInterval:sinceDate:", v238, 0.001);
      v400 = (void *)objc_msgSend(v232, "initWithStartDate:endDate:", v235, v239);

      -[RTTripSegmentManager locationStore](self, "locationStore");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      v419[0] = MEMORY[0x1E0C809B0];
      v419[1] = 3221225472;
      v419[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_93;
      v419[3] = &unk_1E9297038;
      v421 = &v480;
      v241 = v231;
      v420 = v241;
      objc_msgSend(v240, "removeLocationsOnDateInterval:handler:", v400, v419);

      v242 = (id *)(v481 + 5);
      v243 = (id)v481[5];
      v244 = v241;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      v246 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v244, v246))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v247, "timeIntervalSinceDate:", v245);
        v249 = v248;
        v250 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v252, "filteredArrayUsingPredicate:", v251);
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v253, "firstObject");
        v254 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v250, "submitToCoreAnalytics:type:duration:", v254, 1, v249);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v255 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v255, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v255, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v256 = (void *)MEMORY[0x1E0CB35C8];
        *(_QWORD *)v459 = v396;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v459, 1);
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v256, "errorWithDomain:code:userInfo:", v395, 15, v257);
        v258 = (void *)objc_claimAutoreleasedReturnValue();

        if (v258)
        {
          v243 = objc_retainAutorelease(v258);

        }
      }

      objc_storeStrong(v242, v243);
      if (v481[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v259 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v259, OS_LOG_TYPE_ERROR))
        {
          v299 = v481[5];
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v400;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v299;
          _os_log_error_impl(&dword_1D1A22000, v259, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:Error executing removeLocationsOnDateInterval for dateInterval %@, error %@", buf, 0x16u);
        }

        v376[2](v376, v481[5]);
        v260 = 1;
      }
      else
      {
        v261 = dispatch_semaphore_create(0);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v466 = __Block_byref_object_copy__1;
        *(_QWORD *)v467 = __Block_byref_object_dispose__1;
        *(_QWORD *)&v467[8] = 0;
        -[RTTripSegmentManager locationStore](self, "locationStore");
        v262 = (void *)objc_claimAutoreleasedReturnValue();
        v416[0] = MEMORY[0x1E0C809B0];
        v416[1] = 3221225472;
        v416[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_94;
        v416[3] = &unk_1E9297038;
        v418 = buf;
        v263 = v261;
        v417 = v263;
        objc_msgSend(v262, "storeLocations:handler:", v403, v416);

        v264 = (id *)(*(_QWORD *)&buf[8] + 40);
        v265 = *(id *)(*(_QWORD *)&buf[8] + 40);
        v266 = v263;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        v268 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v266, v268))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          obja = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obja, "timeIntervalSinceDate:", v267);
          v270 = v269;
          v271 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
          v272 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v273 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v273, "filteredArrayUsingPredicate:", v272);
          v274 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v274, "firstObject");
          v275 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v271, "submitToCoreAnalytics:type:duration:", v275, 1, v270);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v276 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v276, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v459 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v276, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v459, 2u);
          }

          v277 = (void *)MEMORY[0x1E0CB35C8];
          v486[0] = v396;
          *(_QWORD *)v459 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v459, v486, 1);
          v278 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v277, "errorWithDomain:code:userInfo:", v395, 15, v278);
          v279 = (void *)objc_claimAutoreleasedReturnValue();

          if (v279)
          {
            v265 = objc_retainAutorelease(v279);

          }
        }

        objc_storeStrong(v264, v265);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v280 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR))
          {
            v300 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v459 = 138412546;
            *(_QWORD *)&v459[4] = v400;
            v460 = 2112;
            v461 = v300;
            _os_log_error_impl(&dword_1D1A22000, v280, OS_LOG_TYPE_ERROR, "RTTripSegmentManager:Error executing [self.locationStore storeLocations:sanitizedLocations for , dateInterval %@, error %@", v459, 0x16u);
          }

          v376[2](v376, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v260 = 1;
        }
        else
        {
          v260 = 0;
        }

        _Block_object_dispose(buf, 8);
      }

      if (v260)
      {
        v135 = 1;
        goto LABEL_138;
      }
    }
    else
    {
      if (v230)
      {
        objc_msgSend(v367, "stringFromDate");
        v297 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v365, "stringFromDate");
        v298 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v297;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v298;
        _os_log_debug_impl(&dword_1D1A22000, v229, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, no invalid locations found for interval %@ to %@", buf, 0x16u);

      }
    }
    if (objc_msgSend(v403, "count"))
    {
      objc_msgSend(v403, "lastObject");
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v282, "timestamp");
      v283 = objc_claimAutoreleasedReturnValue();

      v367 = (void *)v283;
    }
    v364 = v429[3] - (v366 != 0);
    v366 += v364;
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v284 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v284, OS_LOG_TYPE_DEBUG))
    {
      v288 = (uint64_t (*)(uint64_t, uint64_t))v437[3];
      objc_msgSend(v367, "stringFromDate");
      v289 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v365, "stringFromDate");
      v290 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v364;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v366;
      *(_WORD *)&buf[22] = 2048;
      v466 = v288;
      *(_WORD *)v467 = 2112;
      *(_QWORD *)&v467[2] = v289;
      *(_WORD *)&v467[10] = 2112;
      *(_QWORD *)&v467[12] = v290;
      _os_log_debug_impl(&dword_1D1A22000, v284, OS_LOG_TYPE_DEBUG, "RTTripSegmentManager:_sanitizeTripSegmentDatabaseWithHandler, iteration loaded, %tu, total loaded samples, %tu, of expected %tu, next interval from %@ to %@", buf, 0x34u);

    }
    v135 = 0;
LABEL_138:

LABEL_139:
    _Block_object_dispose(v468, 8);

    if (v135)
      goto LABEL_178;
  }
  while (v366 < v437[3] && v364);
  v414 = 0u;
  v415 = 0u;
  v412 = 0u;
  v413 = 0u;
  objb = (id)v454[5];
  v301 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v412, v464, 16);
  if (!v301)
    goto LABEL_177;
  v394 = *(_QWORD *)v413;
  while (2)
  {
    v302 = 0;
    v401 = v301;
    while (2)
    {
      if (*(_QWORD *)v413 != v394)
        objc_enumerationMutation(objb);
      v404 = v302;
      v303 = *(void **)(*((_QWORD *)&v412 + 1) + 8 * v302);
      objc_msgSend(v303, "tripDistance");
      if (v304 >= 500.0)
      {
        objc_msgSend(v303, "dateInterval");
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v305, "duration");
        v307 = v306 < 60.0;

        if (!v307)
        {
          v329 = dispatch_semaphore_create(0);
          *(_QWORD *)v468 = 0;
          v469 = v468;
          v470 = 0x2020000000;
          v471 = 0;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v466 = __Block_byref_object_copy__1;
          *(_QWORD *)v467 = __Block_byref_object_dispose__1;
          *(_QWORD *)&v467[8] = 0;
          v392 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183E0]), "initWithTripSegment:", v303);
          v408[0] = MEMORY[0x1E0C809B0];
          v408[1] = 3221225472;
          v408[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_96;
          v408[3] = &unk_1E92971F0;
          v410 = buf;
          v411 = v468;
          v330 = v329;
          v409 = v330;
          -[RTTripSegmentManager _fetchLocationsCountForTripSegmentWithOptions:handler:](self, "_fetchLocationsCountForTripSegmentWithOptions:handler:", v392, v408);
          v332 = (id *)(*(_QWORD *)&buf[8] + 40);
          v331 = *(id *)(*(_QWORD *)&buf[8] + 40);
          v333 = v330;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v334 = (void *)objc_claimAutoreleasedReturnValue();
          v335 = dispatch_time(0, 3600000000000);
          if (dispatch_semaphore_wait(v333, v335))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v388 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v388, "timeIntervalSinceDate:", v334);
            v337 = v336;
            v338 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
            v339 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v340 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v340, "filteredArrayUsingPredicate:", v339);
            v341 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v341, "firstObject");
            v342 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v338, "submitToCoreAnalytics:type:duration:", v342, 1, v337);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v343 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v343, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v459 = 0;
              _os_log_fault_impl(&dword_1D1A22000, v343, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v459, 2u);
            }

            v344 = (void *)MEMORY[0x1E0CB35C8];
            v486[0] = v396;
            *(_QWORD *)v459 = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v459, v486, 1);
            v345 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v344, "errorWithDomain:code:userInfo:", v395, 15, v345);
            v346 = (void *)objc_claimAutoreleasedReturnValue();

            if (v346)
            {
              v331 = objc_retainAutorelease(v346);

            }
          }

          objc_storeStrong(v332, v331);
          v347 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          v348 = v347 != 0;
          if (v347)
          {
            _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            v349 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v349, OS_LOG_TYPE_ERROR))
            {
              v350 = v448[5];
              *(_DWORD *)v459 = 138412546;
              *(_QWORD *)&v459[4] = v303;
              v460 = 2112;
              v461 = v350;
              v351 = v349;
              v352 = "RTTripSegmentManager:Error executing fetchLocationsCountForTripSegmentWithOptions for tripSegment %@, error, %@";
              v353 = 22;
LABEL_171:
              _os_log_error_impl(&dword_1D1A22000, v351, OS_LOG_TYPE_ERROR, v352, v459, v353);
            }
          }
          else
          {
            if (*((_QWORD *)v469 + 3) > 2uLL)
            {
              v348 = 1;
LABEL_173:

              _Block_object_dispose(buf, 8);
              _Block_object_dispose(v468, 8);

              if (v347 == 0 && !v348)
                goto LABEL_152;
              goto LABEL_158;
            }
            _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            v349 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v349, OS_LOG_TYPE_ERROR))
            {
              v354 = *((_QWORD *)v469 + 3);
              *(_DWORD *)v459 = 134218498;
              *(_QWORD *)&v459[4] = v354;
              v460 = 2048;
              v461 = 3;
              v462 = 2112;
              v463 = v303;
              v351 = v349;
              v352 = "RTTripSegmentManager: found %ld locations for tripSegment, which is fewer than the minimum requirem"
                     "ent of %ld, deleting trip segment, %@.";
              v353 = 32;
              goto LABEL_171;
            }
          }

          goto LABEL_173;
        }
      }
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v308 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = 0x404E000000000000;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 0x407F400000000000;
        *(_WORD *)&buf[22] = 2112;
        v466 = (uint64_t (*)(uint64_t, uint64_t))v303;
        _os_log_error_impl(&dword_1D1A22000, v308, OS_LOG_TYPE_ERROR, "RTTripSegmentManager: tripSegment has duration lower than threshold %f s, or distance lower than threshold %f m, deleting trip segment, %@.", buf, 0x20u);
      }

LABEL_152:
      v309 = dispatch_semaphore_create(0);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v466 = __Block_byref_object_copy__1;
      *(_QWORD *)v467 = __Block_byref_object_dispose__1;
      *(_QWORD *)&v467[8] = 0;
      objc_msgSend(v303, "identifier");
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      v405[0] = MEMORY[0x1E0C809B0];
      v405[1] = 3221225472;
      v405[2] = __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_97;
      v405[3] = &unk_1E9297038;
      v407 = buf;
      v311 = v309;
      v406 = v311;
      -[RTTripSegmentManager _deleteTripSegmentWithUUID:handler:](self, "_deleteTripSegmentWithUUID:handler:", v310, v405);

      v312 = (id *)(*(_QWORD *)&buf[8] + 40);
      v313 = *(id *)(*(_QWORD *)&buf[8] + 40);
      v314 = v311;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      v316 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v314, v316))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v317 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v317, "timeIntervalSinceDate:", v315);
        v319 = v318;
        v320 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
        v321 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v322 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v322, "filteredArrayUsingPredicate:", v321);
        v323 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v323, "firstObject");
        v324 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v320, "submitToCoreAnalytics:type:duration:", v324, 1, v319);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v325 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v325, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v468 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v325, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v468, 2u);
        }

        v326 = (void *)MEMORY[0x1E0CB35C8];
        *(_QWORD *)v459 = v396;
        *(_QWORD *)v468 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v468, v459, 1);
        v327 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v326, "errorWithDomain:code:userInfo:", v395, 15, v327);
        v328 = (void *)objc_claimAutoreleasedReturnValue();

        if (v328)
        {
          v313 = objc_retainAutorelease(v328);

        }
      }

      objc_storeStrong(v312, v313);
      _Block_object_dispose(buf, 8);

LABEL_158:
      v302 = v404 + 1;
      if (v401 != v404 + 1)
        continue;
      break;
    }
    v301 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v412, v464, 16);
    if (v301)
      continue;
    break;
  }
LABEL_177:

  v376[2](v376, 0);
LABEL_178:
  _Block_object_dispose(&v428, 8);
LABEL_179:

  _Block_object_dispose(&v474, 8);
  _Block_object_dispose(&v436, 8);

LABEL_180:
  _Block_object_dispose(&v480, 8);

LABEL_181:
  _Block_object_dispose(&v447, 8);

  _Block_object_dispose(&v453, 8);
LABEL_182:

}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_89(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_90(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_91(uint64_t a1, void *a2, void *a3)
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

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_93(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_94(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_96(uint64_t a1, uint64_t a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v6 = obj;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70__RTTripSegmentManager__sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke_97(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)sanitizeTripSegmentDatabaseSinceDate:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__RTTripSegmentManager_sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __69__RTTripSegmentManager_sanitizeTripSegmentDatabaseSinceDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sanitizeTripSegmentDatabaseSinceDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (RTTripSegmentStore)tripSegmentStore
{
  return self->_tripSegmentStore;
}

- (void)setTripSegmentStore:(id)a3
{
  objc_storeStrong((id *)&self->_tripSegmentStore, a3);
}

- (RTSynthesizedLocationStore)locationStore
{
  return self->_locationStore;
}

- (void)setLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_locationStore, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTElevationAdjuster)elevationAdjuster
{
  return self->_elevationAdjuster;
}

- (void)setElevationAdjuster:(id)a3
{
  objc_storeStrong((id *)&self->_elevationAdjuster, a3);
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTTripSegment)tripSegmentUnderConstruction
{
  return self->_tripSegmentUnderConstruction;
}

- (void)setTripSegmentUnderConstruction:(id)a3
{
  objc_storeStrong((id *)&self->_tripSegmentUnderConstruction, a3);
}

- (NSDate)tripSegmentUnderConstructionLastLocationTimestamp
{
  return self->_tripSegmentUnderConstructionLastLocationTimestamp;
}

- (void)setTripSegmentUnderConstructionLastLocationTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_tripSegmentUnderConstructionLastLocationTimestamp, a3);
}

- (BOOL)tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations
{
  return self->_tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations;
}

- (void)setTripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations:(BOOL)a3
{
  self->_tripSegmentUnderConstructionFavorNewerLocationsOverOlderLocations = a3;
}

- (BOOL)isTripSegmentGenerationEnabled
{
  return self->_isTripSegmentGenerationEnabled;
}

- (void)setIsTripSegmentGenerationEnabled:(BOOL)a3
{
  self->_isTripSegmentGenerationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripSegmentUnderConstructionLastLocationTimestamp, 0);
  objc_storeStrong((id *)&self->_tripSegmentUnderConstruction, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_elevationAdjuster, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_tripSegmentStore, 0);
}

@end
