@implementation RTTripSegmentInertialDataManager

- (RTTripSegmentInertialDataManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithInertialDataStore_routineLocationManager_);
}

- (RTTripSegmentInertialDataManager)initWithInertialDataStore:(id)a3 routineLocationManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTTripSegmentInertialDataManager *v10;
  id *p_isa;
  RTTripSegmentInertialDataManager *v12;
  NSObject *v13;
  const char *v14;
  objc_super v16;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: inertialDataStore";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: routineLocationManager";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTTripSegmentInertialDataManager;
  v10 = -[RTNotifier init](&v16, sel_init);
  p_isa = (id *)&v10->super.super.super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_inertialDataStore, a3);
    objc_storeStrong(p_isa + 4, a4);
    objc_msgSend(p_isa[4], "setInertialDelegate:", p_isa);
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

- (void)_fetchTripSegmentInertialDataWithOptions:(id)a3 handler:(id)a4
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
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentInertialDataManager: invoking RTTripSegmentInertialDataStore fetchTripSegmentInertialDataWithOptions", v10, 2u);
  }

  -[RTTripSegmentInertialDataManager inertialDataStore](self, "inertialDataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchStoredTripSegmentInertialDataWithOptions:handler:", v7, v6);

}

- (void)fetchTripSegmentInertialDataWithOptions:(id)a3 handler:(id)a4
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
    v18 = "-[RTTripSegmentInertialDataManager fetchTripSegmentInertialDataWithOptions:handler:]";
    v19 = 1024;
    v20 = 62;
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
      v18 = "-[RTTripSegmentInertialDataManager fetchTripSegmentInertialDataWithOptions:handler:]";
      v19 = 1024;
      v20 = 63;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__RTTripSegmentInertialDataManager_fetchTripSegmentInertialDataWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __84__RTTripSegmentInertialDataManager_fetchTripSegmentInertialDataWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTripSegmentInertialDataWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_addTripSegmentInertialData:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  SEL v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    -[RTTripSegmentInertialDataManager inertialDataStore](self, "inertialDataStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__RTTripSegmentInertialDataManager__addTripSegmentInertialData_handler___block_invoke;
    v14[3] = &unk_1E92971A0;
    v16 = a2;
    v15 = v8;
    objc_msgSend(v9, "storeWritableObjects:handler:", v7, v14);

    v10 = v15;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D18598];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("requires valid locations.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 7, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v13);

    goto LABEL_5;
  }
LABEL_6:

}

void __72__RTTripSegmentInertialDataManager__addTripSegmentInertialData_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "RTTripSegmentInertialDataStore,%@,error,%@", (uint8_t *)&v7, 0x16u);

    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)addTripSegmentInertialData:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  RTTripSegmentInertialDataManager *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v19 = "-[RTTripSegmentInertialDataManager addTripSegmentInertialData:handler:]";
    v20 = 1024;
    v21 = 105;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samples (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTTripSegmentInertialDataManager addTripSegmentInertialData:handler:]";
      v20 = 1024;
      v21 = 106;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__RTTripSegmentInertialDataManager_addTripSegmentInertialData_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  v15 = v6;
  v16 = self;
  v17 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

void __71__RTTripSegmentInertialDataManager_addTripSegmentInertialData_handler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_33);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__RTTripSegmentInertialDataManager_addTripSegmentInertialData_handler___block_invoke_18;
  v5[3] = &unk_1E929BB08;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend(*(id *)(a1 + 40), "_addTripSegmentInertialData:handler:", v4, *(_QWORD *)(a1 + 48));

}

void __71__RTTripSegmentInertialDataManager_addTripSegmentInertialData_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v2, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = v5;
    objc_msgSend(v2, "deltaCourse_rad");
    v8 = v7;
    objc_msgSend(v2, "deltaSpeed_mps");
    v10 = v9;
    objc_msgSend(v2, "dataPeriod_s");
    v12 = v11;
    objc_msgSend(v2, "deltaCourseVar_rad2");
    v14 = v13;
    objc_msgSend(v2, "deltaSpeedVar_mps2");
    v16 = v15;
    objc_msgSend(v2, "deltaCourseSpeedCovar_radmps");
    v18 = 134219521;
    v19 = v6;
    v20 = 2049;
    v21 = v8;
    v22 = 2049;
    v23 = v10;
    v24 = 2049;
    v25 = v12;
    v26 = 2049;
    v27 = v14;
    v28 = 2049;
    v29 = v16;
    v30 = 2049;
    v31 = v17;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "RTInertialDataManager,CLTripSegmentInertialData,gpsTime,%.3lf,deltaCourse_rad,%{private}.3lf,deltaSpeed_mps,%{private}.3lf,dataPeriod_s,%{private}.3lf,deltaCourseVar_rad2,%{private}8lf,deltaSpeedVar_mps2,%{private}8lf,deltaCourseSpeedCovar_radmps,%{private}8lf", (uint8_t *)&v18, 0x48u);

  }
}

void __71__RTTripSegmentInertialDataManager_addTripSegmentInertialData_handler___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isValid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "invalid CLTripSegmentInertialData,%@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)inertialDataManager:(id)a3 didUpdateInertialData:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__RTTripSegmentInertialDataManager_inertialDataManager_didUpdateInertialData___block_invoke;
  v8[3] = &unk_1E9297628;
  v9 = v6;
  v10 = a2;
  v7 = v6;
  -[RTTripSegmentInertialDataManager addTripSegmentInertialData:handler:](self, "addTripSegmentInertialData:handler:", v7, v8);

}

void __78__RTTripSegmentInertialDataManager_inertialDataManager_didUpdateInertialData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%@, addTripSegmentInertialData, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
}

+ (int64_t)periodicPurgePolicy
{
  return 1;
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
  RTTripSegmentInertialDataManager *v16;
  id v17;
  int64_t v18;
  SEL v19;

  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__RTTripSegmentInertialDataManager_performPurgeOfType_referenceDate_completion___block_invoke;
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

void __80__RTTripSegmentInertialDataManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 40), "inertialDataStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __80__RTTripSegmentInertialDataManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v5[3] = &unk_1E92971A0;
    v7 = *(_QWORD *)(a1 + 64);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "purgeTripSegmentInertialDataPredating:handler:", v3, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __80__RTTripSegmentInertialDataManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
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

+ (id)vendedClasses
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)vendedClasses_vendedClasses_0;
  if (!vendedClasses_vendedClasses_0)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    v4 = (void *)vendedClasses_vendedClasses_0;
    vendedClasses_vendedClasses_0 = v3;

    v2 = (void *)vendedClasses_vendedClasses_0;
  }
  return v2;
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  RTTripSegmentInertialDataManager *v14;
  id v15;
  unint64_t v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__RTTripSegmentInertialDataManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E92994E0;
    v13 = v8;
    v14 = self;
    v15 = v9;
    v16 = a4;
    dispatch_async(v10, v12);

    v11 = v13;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __85__RTTripSegmentInertialDataManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "enumeratedType");
    objc_msgSend((id)objc_opt_class(), "vendedClasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "member:", v3);

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "inertialDataStore");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fetchEnumerableObjectsWithOptions:offset:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

      return;
    }
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v14 = *MEMORY[0x1E0CB2D50];
    v15 = CFSTR("the type specified by options is not vended by this manager");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v15;
    v10 = &v14;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("options cannot be nil");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (const __CFString **)v17;
    v10 = &v16;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (CLLocationManagerRoutine)routineLocationManager
{
  return self->_routineLocationManager;
}

- (void)setRoutineLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineLocationManager, a3);
}

- (RTTripSegmentInertialDataStore)inertialDataStore
{
  return self->_inertialDataStore;
}

- (void)setInertialDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_inertialDataStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inertialDataStore, 0);
  objc_storeStrong((id *)&self->_routineLocationManager, 0);
}

@end
