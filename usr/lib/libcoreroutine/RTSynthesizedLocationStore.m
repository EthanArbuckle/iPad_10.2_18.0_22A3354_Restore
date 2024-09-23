@implementation RTSynthesizedLocationStore

- (RTSynthesizedLocationStore)initWithPersistenceManager:(id)a3
{
  RTSynthesizedLocationStore *v3;
  RTSynthesizedLocationStore *v5;
  NSObject *v6;
  RTSynthesizedLocationStore *v7;
  NSObject *v8;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = self;
  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTSynthesizedLocationStore;
    v5 = -[RTStore initWithPersistenceManager:](&v13, sel_initWithPersistenceManager_);
    if (v5)
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v11;
        v16 = 2112;
        v17 = v12;
        _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ success.", buf, 0x16u);

      }
    }
    v3 = v5;
    v7 = v3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (void)_storeLocations:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD v16[4];
  id v17;
  SEL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v11;
          _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "CRTSM,RTSynthesizedLocationStore,storeLocations,%@", buf, 0xCu);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__RTSynthesizedLocationStore__storeLocations_handler___block_invoke;
  v16[3] = &unk_1E92971A0;
  v17 = v6;
  v18 = a2;
  v13 = v6;
  -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v5, v16);

}

void __54__RTSynthesizedLocationStore__storeLocations_handler___block_invoke(uint64_t a1, void *a2)
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
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "RTSynthesizedLocationStore,%@,error,%@", (uint8_t *)&v7, 0x16u);

    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)storeLocations:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v13;
    v19 = 2048;
    v20 = objc_msgSend(v6, "count");
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@ storeLocations invoked with locationCount,%lu", buf, 0x16u);

  }
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__RTSynthesizedLocationStore_storeLocations_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

uint64_t __53__RTSynthesizedLocationStore_storeLocations_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeLocations:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchStoredLocationsCountWithContext:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  char *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  RTSynthesizedLocationStore *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke;
    v22[3] = &unk_1E9297A30;
    v23 = v6;
    v24 = self;
    v9 = v7;
    v25 = v9;
    v10 = (void *)MEMORY[0x1D8232094](v22);
    -[RTNotifier queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke_45;
    v19[3] = &unk_1E929B4A8;
    v19[4] = self;
    v20 = v10;
    v21 = v9;
    v12 = v10;
    dispatch_async(v11, v19);

    v13 = v23;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[RTSynthesizedLocationStore _fetchStoredLocationsCountWithContext:handler:]";
      v28 = 1024;
      LODWORD(v29) = 92;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v30 = *MEMORY[0x1E0CB2D50];
    v31[0] = CFSTR("A handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v18;
      v28 = 2112;
      v29 = v15;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@: A handler is a required parameter, %@", buf, 0x16u);

    }
  }

}

void __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
    v5 = v4;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v5, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestFromStoredLocationOptions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchLimit:", 604800);
  v40 = 0;
  v10 = objc_msgSend(v3, "countForFetchRequest:error:", v9, &v40);
  v11 = v40;
  objc_msgSend(v6, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "preferredDownsamplingLevel");

  v37 = a1;
  if (v13 >= 1 && !v10)
  {
    do
    {
      v14 = v11;
      v39 = v11;
      v15 = objc_msgSend(v3, "countForFetchRequest:error:", v9, &v39);
      v11 = v39;

      if (!v15)
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "options");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v24, "preferredDownsamplingLevel");
          v25 = (void *)MEMORY[0x1E0D18518];
          objc_msgSend(v6, "options");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "NextLessDecimatedDownsamplingPreference:", objc_msgSend(v26, "preferredDownsamplingLevel"));
          *(_DWORD *)buf = 138412802;
          v42 = v34;
          v43 = 2048;
          v44 = v33;
          v45 = 2048;
          v46 = v27;
          _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "%@: No locations found at downsamplingLevel %ld, trying %ld", buf, 0x20u);

        }
        v17 = (void *)MEMORY[0x1E0D18518];
        objc_msgSend(v6, "options");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "NextLessDecimatedDownsamplingPreference:", objc_msgSend(v18, "preferredDownsamplingLevel"));
        objc_msgSend(v6, "options");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setPreferredDownsamplingLevel:", v19);

      }
      objc_msgSend(v6, "options");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "preferredDownsamplingLevel");

    }
    while (!v15 && v22 > 0);
  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "options");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "preferredDownsamplingLevel");
    v38 = v11;
    v32 = objc_msgSend(v3, "countForFetchRequest:error:", v9, &v38);
    v36 = v38;

    *(_DWORD *)buf = 138412802;
    v42 = v35;
    v43 = 2048;
    v44 = v31;
    v45 = 2048;
    v46 = v32;
    _os_log_debug_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEBUG, "%@: selected downsampling level is %ld, location count is %lu", buf, 0x20u);

    v11 = v36;
  }

  (*(void (**)(void))(*(_QWORD *)(v37 + 48) + 16))();
}

void __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke_45(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke_2;
  v3[3] = &unk_1E9297568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performBlock:contextType:errorHandler:", v2, 1, v3);

}

uint64_t __76__RTSynthesizedLocationStore__fetchStoredLocationsCountWithContext_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchStoredLocationsCountWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTSynthesizedLocationStore _fetchStoredLocationsCountWithOptions:handler:]";
      v12 = 1024;
      v13 = 146;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18510]), "initWithEnumerationOptions:", v6);
  -[RTSynthesizedLocationStore _fetchStoredLocationsCountWithContext:handler:](self, "_fetchStoredLocationsCountWithContext:handler:", v9, v7);

}

- (void)fetchStoredLocationsCountWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __75__RTSynthesizedLocationStore_fetchStoredLocationsCountWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __75__RTSynthesizedLocationStore_fetchStoredLocationsCountWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredLocationsCountWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTSynthesizedLocationStore _fetchStoredLocationsWithOptions:handler:]";
      v12 = 1024;
      v13 = 166;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18510]), "initWithEnumerationOptions:", v6);
  -[RTSynthesizedLocationStore _fetchStoredLocationsWithContext:handler:](self, "_fetchStoredLocationsWithContext:handler:", v9, v7);

}

- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __70__RTSynthesizedLocationStore_fetchStoredLocationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __70__RTSynthesizedLocationStore_fetchStoredLocationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredLocationsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  char *v19;
  _QWORD block[5];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  RTSynthesizedLocationStore *v25;
  id v26;
  SEL v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke;
    v23[3] = &unk_1E92979A0;
    v24 = v7;
    v25 = self;
    v27 = a2;
    v10 = v8;
    v26 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v23);
    -[RTNotifier queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_48;
    block[3] = &unk_1E929B4A8;
    block[4] = self;
    v21 = v11;
    v22 = v10;
    v13 = v11;
    dispatch_async(v12, block);

    v14 = v24;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[RTSynthesizedLocationStore _fetchStoredLocationsWithContext:handler:]";
      v30 = 1024;
      LODWORD(v31) = 187;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = CFSTR("A handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v19;
      v30 = 2112;
      v31 = v16;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%@: A handler is a required parameter, %@", buf, 0x16u);

    }
  }

}

void __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  objc_class *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  objc_class *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  id v71;
  id v72;
  id v73;
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
    v5 = v4;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v5, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestFromStoredLocationOptions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = 0;
  v10 = objc_msgSend(v3, "countForFetchRequest:error:", v9, &v73);
  v11 = v73;
  objc_msgSend(v6, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "preferredDownsamplingLevel");

  if (v13 < 1 || v10)
  {
    v23 = v9;
  }
  else
  {
    do
    {
      v14 = v11;
      v72 = v11;
      v15 = objc_msgSend(v3, "countForFetchRequest:error:", v9, &v72);
      v11 = v72;

      if (!v15)
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "options");
          v63 = a1;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v28, "preferredDownsamplingLevel");
          v29 = (void *)MEMORY[0x1E0D18518];
          objc_msgSend(v6, "options");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "NextLessDecimatedDownsamplingPreference:", objc_msgSend(v30, "preferredDownsamplingLevel"));
          *(_DWORD *)buf = 138412802;
          v76 = v27;
          v77 = 2048;
          v78 = v61;
          v79 = 2048;
          v80 = v31;
          _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "%@: No locations found at downsamplingLevel %lu, trying %lu", buf, 0x20u);

          a1 = v63;
        }

        v17 = (void *)MEMORY[0x1E0D18518];
        objc_msgSend(v6, "options");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "NextLessDecimatedDownsamplingPreference:", objc_msgSend(v18, "preferredDownsamplingLevel"));
        objc_msgSend(v6, "options");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setPreferredDownsamplingLevel:", v19);

      }
      v21 = *(void **)(a1 + 40);
      objc_msgSend(v6, "options");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fetchRequestFromStoredLocationOptions:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "options");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "preferredDownsamplingLevel");

      if (v15)
        break;
      v9 = v23;
    }
    while (v25 > 0);
  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "options");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = a1;
    v50 = objc_msgSend(v48, "preferredDownsamplingLevel");
    v71 = v11;
    v51 = objc_msgSend(v3, "countForFetchRequest:error:", v23, &v71);
    v65 = v71;

    *(_DWORD *)buf = 138412802;
    v76 = v47;
    v77 = 2048;
    v78 = v50;
    a1 = v49;
    v79 = 2048;
    v80 = v51;
    _os_log_debug_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_DEBUG, "%@: selected downsampling level is %ld, location count is %lu", buf, 0x20u);

    v11 = v65;
  }

  objc_msgSend(v23, "setFetchOffset:", objc_msgSend(*(id *)(a1 + 32), "offset"));
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v52 = (objc_class *)objc_opt_class();
    NSStringFromClass(v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v23, "fetchLimit");
    v55 = objc_msgSend(v23, "fetchOffset");
    *(_DWORD *)buf = 138412802;
    v76 = v53;
    v77 = 2048;
    v78 = v54;
    v79 = 2048;
    v80 = v55;
    _os_log_debug_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEBUG, "%@: using options fetch limit, %lu, fetch offset, %lu", buf, 0x20u);

  }
  v70 = v11;
  objc_msgSend(v3, "executeFetchRequest:error:", v23, &v70);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v70;

  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v56 = (objc_class *)objc_opt_class();
    NSStringFromClass(v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v34, "count");
    *(_DWORD *)buf = 138413314;
    v76 = v57;
    v77 = 2112;
    v78 = (uint64_t)v58;
    v79 = 2112;
    v80 = (uint64_t)v23;
    v81 = 2048;
    v82 = v59;
    v83 = 2112;
    v84 = v35;
    _os_log_debug_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_DEBUG, "%@: %@, request, %@, results count, %lu, error, %@", buf, 0x34u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "fetchLimit"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    v62 = v3;
    v64 = a1;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v60 = v34;
    v38 = v34;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v67 != v41)
            objc_enumerationMutation(v38);
          v43 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
          v44 = (void *)MEMORY[0x1D8231EA8]();
          +[RTSynthesizedLocation createWithManagedObject:](RTSynthesizedLocation, "createWithManagedObject:", v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
            objc_msgSend(v37, "addObject:", v45);

          objc_autoreleasePoolPop(v44);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      }
      while (v40);
    }

    v35 = 0;
    v3 = v62;
    a1 = v64;
    v34 = v60;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_48(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_2;
  v3[3] = &unk_1E9297568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performBlock:contextType:errorHandler:", v2, 1, v3);

}

uint64_t __71__RTSynthesizedLocationStore__fetchStoredLocationsWithContext_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchStoredLocationsWithContext:(id)a3 handler:(id)a4
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
  block[2] = __70__RTSynthesizedLocationStore_fetchStoredLocationsWithContext_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __70__RTSynthesizedLocationStore_fetchStoredLocationsWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredLocationsWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeLocationsPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, id);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v15 = CFSTR("timestamp");
    v7 = a4;
    v14 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTStore purgePredating:predicateMappings:handler:](self, "purgePredating:predicateMappings:handler:", v6, v9, v7);
  }
  else
  {
    v10 = (void (**)(id, id))a4;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTSynthesizedLocationStore _removeLocationsPredating:handler:]";
      v21 = 1024;
      v22 = 276;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = CFSTR("requires a valid date.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v7);

  }
}

- (void)removeLocationsPredating:(id)a3 handler:(id)a4
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
  block[2] = __63__RTSynthesizedLocationStore_removeLocationsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __63__RTSynthesizedLocationStore_removeLocationsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeLocationsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeLocationsOnDateInterval:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, id);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v15 = CFSTR("timestamp");
    v7 = a4;
    v14 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTStore purgeDateInterval:predicateMappings:purgeLimit:handler:](self, "purgeDateInterval:predicateMappings:purgeLimit:handler:", v6, v9, 3600, v7);
  }
  else
  {
    v10 = (void (**)(id, id))a4;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTSynthesizedLocationStore _removeLocationsOnDateInterval:handler:]";
      v21 = 1024;
      v22 = 303;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = CFSTR("requires a valid dateInterval.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v7);

  }
}

- (void)removeLocationsOnDateInterval:(id)a3 handler:(id)a4
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
  block[2] = __68__RTSynthesizedLocationStore_removeLocationsOnDateInterval_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __68__RTSynthesizedLocationStore_removeLocationsOnDateInterval_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeLocationsOnDateInterval:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[8];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

LABEL_8:
    v21 = 0;
    goto LABEL_13;
  }
  if (v8)
  {
    v10 = objc_opt_class();
    if (v10 == objc_opt_class())
    {
      -[RTSynthesizedLocationStore fetchRequestFromStoredLocationOptions:](self, "fetchRequestFromStoredLocationOptions:", v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFetchOffset:", a4);
      goto LABEL_13;
    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("error of type, %@, is not supported"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_retainAutorelease(v18);
    *a5 = v19;

    goto LABEL_8;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
  }

  _RTErrorInvalidParameterCreate((uint64_t)CFSTR("options"));
  v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v21;
}

- (id)fetchRequestFromStoredLocationOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  NSObject *v71;
  void *v72;
  id v73;
  void *v74;
  uint8_t buf[8];
  _QWORD v76[4];
  _QWORD v77[4];
  _QWORD v78[2];
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    +[RTSynthesizedLocationMO fetchRequest](RTSynthesizedLocationMO, "fetchRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timestamp"), 1);
    v79[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v4;
    objc_msgSend(v4, "setSortDescriptors:", v6);

    objc_msgSend(v3, "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v13 = v10;

    objc_msgSend(v3, "dateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    v19 = objc_msgSend(v3, "preferredDownsamplingLevel");
    if (objc_msgSend(v3, "batchSize"))
    {
      v20 = objc_msgSend(v3, "batchSize");
      v21 = 3600;
      if (v20 < 0xE10)
        v21 = v20;
    }
    else
    {
      v21 = 3600;
    }
    v69 = v21;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3528];
    v71 = v13;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ <= %K"), v13, CFSTR("timestamp"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v24;
    v70 = v18;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("timestamp"), v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateWithSubpredicates:", v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v68 = (void *)v27;
    objc_msgSend(v22, "addObject:", v27);
    v28 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("downsamplingLevel"), v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v74 = v22;
    v67 = (void *)v30;
    objc_msgSend(v22, "addObject:", v30);
    objc_msgSend(v3, "boundingBoxLocation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = v3;
    if (v31)
    {
      *(_QWORD *)buf = 0;
      objc_msgSend(v3, "boundingBoxLocation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "coordinate");
      objc_msgSend(v3, "boundingBoxLocation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "coordinate");
      objc_msgSend(v3, "boundingBoxLocation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "horizontalAccuracy");
      RTCommonCalculateBoundingBox();

      v64 = (void *)MEMORY[0x1E0CB3528];
      v35 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "predicateWithFormat:", CFSTR("%@ <= %K"), v65, CFSTR("longitude"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v36;
      v37 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("longitude"), v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v77[1] = v39;
      v40 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "predicateWithFormat:", CFSTR("%@ <= %K"), v41, CFSTR("latitude"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v77[2] = v42;
      v43 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("latitude"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v77[3] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "andPredicateWithSubpredicates:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v74, "addObject:", v47);
    }
    v48 = (void *)MEMORY[0x1E0CB3528];
    v49 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("speed"), v66);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v50;
    v51 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("speedAccuracy"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v53;
    v54 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("horizontalAccuracy"), v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v56;
    v57 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("verticalAccuracy"), v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v59;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "andPredicateWithSubpredicates:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v74, "addObject:", v61);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v74);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v72;
    objc_msgSend(v72, "setPredicate:", v62);

    objc_msgSend(v72, "setFetchBatchSize:", 100);
    objc_msgSend(v72, "setFetchLimit:", v69);

    v3 = v73;
    v11 = v71;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }
    v12 = 0;
  }

  return v12;
}

@end
