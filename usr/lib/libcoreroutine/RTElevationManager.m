@implementation RTElevationManager

- (RTElevationManager)initWithElevationStore:(id)a3 elevationProvider:(id)a4
{
  id v7;
  id v8;
  RTElevationManager *v9;
  id *p_isa;
  NSObject *v11;
  RTElevationManager *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)RTElevationManager;
    v9 = -[RTNotifier init](&v15, sel_init);
    p_isa = (id *)&v9->super.super.super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_elevationStore, a3);
      objc_storeStrong(p_isa + 5, a4);
      _rt_log_facility_get_os_log(RTLogFacilityElevation);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "RTElevationManager successfully initialized.", buf, 2u);
      }

    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: elevationStore", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (void)_fetchElevationsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  RTElevationStore *elevationStore;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[RTElevationManager _fetchElevationsWithOptions:handler:]";
      v18 = 1024;
      v19 = 42;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

  }
  elevationStore = self->_elevationStore;
  if (elevationStore)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__RTElevationManager__fetchElevationsWithOptions_handler___block_invoke;
    v12[3] = &unk_1E9297E70;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    -[RTElevationStore fetchStoredElevationsWithOptions:handler:](elevationStore, "fetchStoredElevationsWithOptions:handler:", v13, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityElevation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "ElevationStore was nil.", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
  }

}

void __58__RTElevationManager__fetchElevationsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityElevation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "count");
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v16 = v8;
    v17 = 2048;
    v18 = v9;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@ fetched %ld elevations, options, %@, first elevation start date, %@, last elevation end date, %@", buf, 0x34u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchElevationsWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __57__RTElevationManager_fetchElevationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __57__RTElevationManager_fetchElevationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchElevationsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_addElevations:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  void *v10;
  RTElevationStore *elevationStore;
  NSObject *v12;
  id *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
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
  id v29;
  NSObject *v30;
  uint64_t v31;
  RTElevationStore *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  void *v39;
  void *v40;
  void *v41;
  void (**v43)(id, _QWORD);
  _QWORD v44[6];
  _QWORD v45[4];
  NSObject *v46;
  __int128 *v47;
  SEL v48;
  uint8_t v49[16];
  _BYTE buf[12];
  __int16 v51;
  void *v52;
  __int128 v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[4];

  v58[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v43 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v40, v39);
    *(_QWORD *)&v53 = 0;
    *((_QWORD *)&v53 + 1) = &v53;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__109;
    v56 = __Block_byref_object_dispose__109;
    v57 = 0;
    v8 = dispatch_semaphore_create(0);
    _rt_log_facility_get_os_log(RTLogFacilityElevation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      v51 = 2112;
      v52 = v41;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@ Deleting overlapping elevations in range: %@", buf, 0x16u);

    }
    elevationStore = self->_elevationStore;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __45__RTElevationManager__addElevations_handler___block_invoke;
    v45[3] = &unk_1E929BC98;
    v47 = &v53;
    v48 = a2;
    v12 = v8;
    v46 = v12;
    -[RTElevationStore removeInterimElevations:handler:](elevationStore, "removeInterimElevations:handler:", v41, v45);
    v13 = (id *)(*((_QWORD *)&v53 + 1) + 40);
    obj = *(id *)(*((_QWORD *)&v53 + 1) + 40);
    v14 = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v14, v16))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v15);
    v19 = v18;
    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_85);
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
      *(_WORD *)v49 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v49, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v58[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v58, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = objc_retainAutorelease(v28);

      objc_storeStrong(v13, v29);
      _rt_log_facility_get_os_log(RTLogFacilityElevation);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = *(void **)(*((_QWORD *)&v53 + 1) + 40);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v35;
        v51 = 2112;
        v52 = v36;
        _os_log_debug_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_DEBUG, "%@ Elevation removeElevations timeout %@", buf, 0x16u);

      }
    }
    else
    {
LABEL_11:

      objc_storeStrong(v13, obj);
    }
    v31 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 40);
    if (!v31)
    {
      v32 = self->_elevationStore;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __45__RTElevationManager__addElevations_handler___block_invoke_3;
      v44[3] = &unk_1E92A20A0;
      v44[4] = &v53;
      v44[5] = a2;
      -[RTElevationStore storeElevations:handler:](v32, "storeElevations:handler:", v5, v44);
      v31 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 40);
    }
    v43[2](v43, v31);

    _Block_object_dispose(&v53, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityElevation);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v53) = 138412290;
      *(_QWORD *)((char *)&v53 + 4) = v34;
      _os_log_debug_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEBUG, "%@ Adding empty elevation array", (uint8_t *)&v53, 0xCu);

    }
    v43[2](v43, 0);
  }

}

void __45__RTElevationManager__addElevations_handler___block_invoke(uint64_t a1, void *a2)
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
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityElevation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@ Error removing elevations: %@", (uint8_t *)&v7, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __45__RTElevationManager__addElevations_handler___block_invoke_3(uint64_t a1, void *a2)
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
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityElevation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@ Store elevations error %@", (uint8_t *)&v7, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (void)addElevations:(id)a3 handler:(id)a4
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
  block[2] = __44__RTElevationManager_addElevations_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __44__RTElevationManager_addElevations_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addElevations:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_purgeElevationsPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
    v12 = 136315394;
    v13 = "-[RTElevationManager _purgeElevationsPredating:handler:]";
    v14 = 1024;
    v15 = 145;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v12, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[RTElevationManager _purgeElevationsPredating:handler:]";
      v14 = 1024;
      v15 = 146;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }

  }
LABEL_10:
  -[RTElevationManager elevationStore](self, "elevationStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeElevationsPredating:handler:", v6, v8);

}

- (void)purgeElevationsPredating:(id)a3 handler:(id)a4
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
  block[2] = __55__RTElevationManager_purgeElevationsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __55__RTElevationManager_purgeElevationsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeElevationsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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
  RTElevationManager *v16;
  id v17;
  int64_t v18;
  SEL v19;

  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__RTElevationManager_performPurgeOfType_referenceDate_completion___block_invoke;
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

void __66__RTElevationManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
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
    v5[2] = __66__RTElevationManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v5[3] = &unk_1E92971A0;
    v7 = *(_QWORD *)(a1 + 64);
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "purgeElevationsPredating:handler:", v3, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __66__RTElevationManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
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
  _rt_log_facility_get_os_log(RTLogFacilityElevation);
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

- (RTElevationStore)elevationStore
{
  return self->_elevationStore;
}

- (void)setElevationStore:(id)a3
{
  objc_storeStrong((id *)&self->_elevationStore, a3);
}

- (RTElevationProvider)elevationProvider
{
  return self->_elevationProvider;
}

- (void)setElevationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_elevationProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevationProvider, 0);
  objc_storeStrong((id *)&self->_elevationStore, 0);
}

@end
