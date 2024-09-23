@implementation RTLearnedPlaceTypeInferenceStore

- (RTLearnedPlaceTypeInferenceStore)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_learnedLocationStore_);
}

- (RTLearnedPlaceTypeInferenceStore)initWithPersistenceManager:(id)a3 learnedLocationStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RTLearnedPlaceTypeInferenceStore *v9;
  RTLearnedPlaceTypeInferenceStore *v10;
  RTLearnedPlaceTypeInferenceStore *v11;
  NSObject *v12;
  const char *v13;
  objc_super v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v11 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: persistenceManager";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)RTLearnedPlaceTypeInferenceStore;
  v9 = -[RTStore initWithPersistenceManager:](&v15, sel_initWithPersistenceManager_, v6);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_learnedLocationStore, a4);
  self = v10;
  v11 = self;
LABEL_10:

  return v11;
}

- (void)storeLearnedPlaceTypeInferences:(id)a3 handler:(id)a4
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
  block[2] = __76__RTLearnedPlaceTypeInferenceStore_storeLearnedPlaceTypeInferences_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __76__RTLearnedPlaceTypeInferenceStore_storeLearnedPlaceTypeInferences_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeLearnedPlaceTypeInferences:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_storeLearnedPlaceTypeInferences:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    v17 = 2048;
    v18 = objc_msgSend(v7, "count");
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, %@, storing learnedPlaceTypeInferences with count, %lu", (uint8_t *)&v13, 0x20u);

  }
  -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v7, v8);

}

- (void)fetchLearnedPlaceTypeInferencesWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __87__RTLearnedPlaceTypeInferenceStore_fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __87__RTLearnedPlaceTypeInferenceStore_fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLearnedPlaceTypeInferencesWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchLearnedPlaceTypeInferencesWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  char *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  SEL v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke;
    v20[3] = &unk_1E92979A0;
    v20[4] = self;
    v21 = v7;
    v10 = v8;
    v22 = v10;
    v23 = a2;
    v11 = (void *)MEMORY[0x1D8232094](v20);
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __88__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke_8;
    v18[3] = &unk_1E9297568;
    v19 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v18);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTLearnedPlaceTypeInferenceStore _fetchLearnedPlaceTypeInferencesWithOptions:handler:]";
      v26 = 1024;
      LODWORD(v27) = 86;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v17;
      v26 = 2112;
      v27 = v14;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);

    }
  }

}

void __88__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  objc_class *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v37 = a1;
  v5 = *(_QWORD *)(a1 + 40);
  v43 = 0;
  objc_msgSend(v4, "fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:error:", v5, &v43);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v43;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v6, "fetchBatchSize");
    v28 = objc_msgSend(v6, "fetchOffset");
    *(_DWORD *)buf = 138413058;
    v46 = v26;
    v47 = 2048;
    v48 = v27;
    v49 = 2048;
    v50 = v28;
    v51 = 2112;
    v52 = (uint64_t)v7;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@: using options fetch batch size, %lu, fetch offset, %lu, error, %@", buf, 0x2Au);

  }
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(v37 + 48) + 16))();
  }
  else
  {
    v42 = 0;
    objc_msgSend(v3, "executeFetchRequest:error:", v6, &v42);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v42;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(v37 + 56));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 138413314;
      v46 = v30;
      v47 = 2112;
      v48 = (uint64_t)v31;
      v49 = 2112;
      v50 = (uint64_t)v6;
      v51 = 2048;
      v52 = v32;
      v53 = 2112;
      v54 = v7;
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@: %@, request, %@, results count, %lu, error, %@", buf, 0x34u);

    }
    v11 = (void *)objc_opt_new();
    if (v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(v37 + 56));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v46 = v14;
        v47 = 2112;
        v48 = (uint64_t)v15;
        v49 = 2112;
        v50 = (uint64_t)v7;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@: %@, error, %@", buf, 0x20u);

      }
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v34 = v9;
      v12 = v9;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v16)
      {
        v17 = v16;
        v33 = v3;
        v18 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v39 != v18)
              objc_enumerationMutation(v12);
            v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v21 = (void *)MEMORY[0x1D8231EA8]();
            +[RTLearnedPlaceTypeInference createWithManagedObject:](RTLearnedPlaceTypeInference, "createWithManagedObject:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              objc_msgSend(v11, "addObject:", v22);
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                v24 = (objc_class *)objc_opt_class();
                NSStringFromClass(v24);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(*(SEL *)(v37 + 56));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v46 = v36;
                v47 = 2112;
                v48 = (uint64_t)v35;
                v49 = 2112;
                v50 = (uint64_t)v20;
                v51 = 2112;
                v52 = 0;
                _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@: %@, learnedPlaceTypeInference MO, %@, learnedPlaceTypeInference, %@", buf, 0x2Au);

              }
            }

            objc_autoreleasePoolPop(v21);
          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        }
        while (v17);
        v3 = v33;
        v7 = 0;
      }
      v9 = v34;
    }

    (*(void (**)(void))(*(_QWORD *)(v37 + 48) + 16))();
  }

}

uint64_t __88__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesWithOptions_handler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLearnedPlaceTypeInferencesCountWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __92__RTLearnedPlaceTypeInferenceStore_fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __92__RTLearnedPlaceTypeInferenceStore_fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLearnedPlaceTypeInferencesCountWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchLearnedPlaceTypeInferencesCountWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  char *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  SEL v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __93__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke;
    v20[3] = &unk_1E92979A0;
    v20[4] = self;
    v21 = v7;
    v10 = v8;
    v22 = v10;
    v23 = a2;
    v11 = (void *)MEMORY[0x1D8232094](v20);
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __93__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke_10;
    v18[3] = &unk_1E9297568;
    v19 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v18);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTLearnedPlaceTypeInferenceStore _fetchLearnedPlaceTypeInferencesCountWithOptions:handler:]";
      v26 = 1024;
      LODWORD(v27) = 170;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v17;
      v26 = 2112;
      v27 = v14;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);

    }
  }

}

void __93__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 40);
  v24 = 0;
  objc_msgSend(v4, "fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:error:", v5, &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v6, "fetchBatchSize");
    v15 = objc_msgSend(v6, "fetchOffset");
    *(_DWORD *)buf = 138413058;
    v26 = v13;
    v27 = 2048;
    v28 = v14;
    v29 = 2048;
    v30 = v15;
    v31 = 2112;
    v32 = (uint64_t)v7;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@: using options fetch batch size, %lu, fetch offset, %lu, error, %@", buf, 0x2Au);

  }
  if (v7)
    goto LABEL_7;
  v23 = 0;
  v9 = objc_msgSend(v3, "countForFetchRequest:error:", v6, &v23);
  v7 = v23;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v6, "fetchBatchSize");
    v19 = objc_msgSend(v6, "fetchOffset");
    *(_DWORD *)buf = 138413058;
    v26 = v17;
    v27 = 2048;
    v28 = v18;
    v29 = 2048;
    v30 = v19;
    v31 = 2112;
    v32 = (uint64_t)v7;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@: using options fetch batch size, %lu, fetch offset, %lu, error, %@", buf, 0x2Au);

  }
  if (v7)
  {
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v26 = v21;
      v27 = 2112;
      v28 = (uint64_t)v22;
      v29 = 2112;
      v30 = (uint64_t)v6;
      v31 = 2048;
      v32 = v9;
      v33 = 2112;
      v34 = 0;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, total learnedPlaceTypeInferences count, %lu, error, %@", buf, 0x34u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v7 = 0;
  }

}

uint64_t __93__RTLearnedPlaceTypeInferenceStore__fetchLearnedPlaceTypeInferencesCountWithOptions_handler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deletedLearnedPlaceTypeInferencesPredating:(id)a3 handler:(id)a4
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
  block[2] = __87__RTLearnedPlaceTypeInferenceStore_deletedLearnedPlaceTypeInferencesPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __87__RTLearnedPlaceTypeInferenceStore_deletedLearnedPlaceTypeInferencesPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deletedLearnedPlaceTypeInferencesPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deletedLearnedPlaceTypeInferencesPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  RTLearnedPlaceTypeInferenceStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__RTLearnedPlaceTypeInferenceStore__deletedLearnedPlaceTypeInferencesPredating_handler___block_invoke;
    v10[3] = &unk_1E9297A30;
    v11 = v6;
    v12 = self;
    v8 = v7;
    v13 = v8;
    v9 = (void *)MEMORY[0x1D8232094](v10);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 0, v8);

  }
}

void __88__RTLearnedPlaceTypeInferenceStore__deletedLearnedPlaceTypeInferencesPredating_handler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTLearnedPlaceTypeInferenceMO fetchRequest](RTLearnedPlaceTypeInferenceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K < %@)"), CFSTR("creationDate"), a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v4);
  objc_msgSend(v6, "setResultType:", 2);
  v7 = (void *)a1[5];
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeDeleteRequests:context:handler:", v8, v3, a1[6]);

}

- (void)logCacheStoreWithReason:(id)a3 handler:(id)a4
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
  block[2] = __68__RTLearnedPlaceTypeInferenceStore_logCacheStoreWithReason_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __68__RTLearnedPlaceTypeInferenceStore_logCacheStoreWithReason_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logCacheStoreWithReason:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_logCacheStoreWithReason:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  RTLearnedPlaceTypeInferenceStore *v16;
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke;
  v14[3] = &unk_1E92979A0;
  v15 = v7;
  v16 = self;
  v18 = a2;
  v17 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke_23;
  v12[3] = &unk_1E9297568;
  v13 = v17;
  v10 = v17;
  v11 = v7;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v14, 1, v12);

}

void __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  RTLearnedPlaceTypeInferenceEnumerationOptions *v31;
  void *v32;
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v33 = (_QWORD *)a1;
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v45 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "start logging cache store with reason, %@", buf, 0xCu);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v45 = v28;
    v46 = 2112;
    v47 = v29;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, %@, calling the fetch request", buf, 0x16u);

  }
  v42 = 0;
  v31 = objc_alloc_init(RTLearnedPlaceTypeInferenceEnumerationOptions);
  objc_msgSend((id)objc_opt_class(), "fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:error:", v31, &v42);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v42;
  objc_msgSend(v7, "setFetchLimit:", 5);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v45 = v30;
    v46 = 2112;
    v47 = v7;
    v48 = 2112;
    v49 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, request, %@, error, %@", buf, 0x20u);

  }
  v10 = 0;
  v32 = v3;
  while (1)
  {
    v11 = (void *)MEMORY[0x1D8231EA8]();
    v41 = v8;
    objc_msgSend(v3, "executeFetchRequest:error:", v7, &v41);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v41;

    if (v13)
      break;
    v14 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v10 = v12;
    v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v10);
          v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v19, "learnedPlaceIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v19, "learnedPlaceIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v21);

          }
        }
        v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v16);
    }

    v22 = (void *)v33[5];
    v36 = 0;
    objc_msgSend(v22, "_getLearnedPlacesMapFromLearnedPlaceIdentifiers:error:", v14, &v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v36;

    if (v13)
    {

      v3 = v32;
      break;
    }
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke_21;
    v34[3] = &unk_1E92A26A0;
    v35 = v23;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v34);
    objc_msgSend(v7, "setFetchOffset:", objc_msgSend(v7, "fetchOffset") + objc_msgSend(v10, "count"));
    v3 = v32;
    objc_msgSend(v32, "reset");

    objc_autoreleasePoolPop(v11);
    v8 = 0;
    if (!objc_msgSend(v10, "count"))
      goto LABEL_25;
  }
  objc_autoreleasePoolPop(v11);
LABEL_25:
  if (v33[4])
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)v33[4];
      *(_DWORD *)buf = 138412290;
      v45 = v25;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEFAULT, "end logging cache store with reason, %@", buf, 0xCu);
    }

  }
  v26 = v33[6];
  if (v26)
    (*(void (**)(uint64_t, id))(v26 + 16))(v26, v13);

}

void __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[RTLearnedPlaceTypeInference createWithManagedObject:](RTLearnedPlaceTypeInference, "createWithManagedObject:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218242;
    v17 = (void *)(a3 + 1);
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "index, %lu, learned place type inference, %@", (uint8_t *)&v16, 0x16u);
  }

  objc_msgSend(v5, "learnedPlaceIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "learnedPlaceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(a1 + 32);
        objc_msgSend(v5, "learnedPlaceIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v15;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "learned place, %@", (uint8_t *)&v16, 0xCu);

      }
    }
  }

}

uint64_t __69__RTLearnedPlaceTypeInferenceStore__logCacheStoreWithReason_handler___block_invoke_23(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_getLearnedPlacesMapFromLearnedPlaceIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
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
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  objc_class *v41;
  id v42;
  void *v43;
  objc_class *v44;
  id v45;
  void *v46;
  void *v47;
  const char *aSelector;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  NSObject *v56;
  uint64_t *v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t buf[8];
  uint8_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE v71[128];
  _BYTE v72[12];
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      aSelector = a2;
      *(_QWORD *)buf = 0;
      v66 = buf;
      v67 = 0x3032000000;
      v68 = __Block_byref_object_copy__115;
      v69 = __Block_byref_object_dispose__115;
      v70 = 0;
      v59 = 0;
      v60 = &v59;
      v61 = 0x3032000000;
      v62 = __Block_byref_object_copy__115;
      v63 = __Block_byref_object_dispose__115;
      v64 = 0;
      v8 = (void *)objc_opt_new();
      v9 = dispatch_semaphore_create(0);
      -[RTLearnedPlaceTypeInferenceStore learnedLocationStore](self, "learnedLocationStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __90__RTLearnedPlaceTypeInferenceStore__getLearnedPlacesMapFromLearnedPlaceIdentifiers_error___block_invoke;
      v55[3] = &unk_1E9296EE0;
      v57 = &v59;
      v58 = buf;
      v11 = v9;
      v56 = v11;
      objc_msgSend(v10, "fetchPlacesWithIdentifiers:handler:", v7, v55);

      v12 = v11;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v12, v14))
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v13);
      v17 = v16;
      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_88);
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
        *(_WORD *)v72 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: persistenceManager", v72, 2u);
      }

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v77[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v72 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v77, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v27 = objc_retainAutorelease(v26);

      }
      else
      {
LABEL_13:
        v27 = 0;
      }

      v29 = v27;
      v49 = v29;
      if (a4 && v29)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v41 = (objc_class *)objc_opt_class();
          NSStringFromClass(v41);
          v42 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v72 = 138412802;
          *(_QWORD *)&v72[4] = v42;
          v73 = 2112;
          v74 = v43;
          v75 = 2112;
          v76 = v49;
          _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v72, 0x20u);

        }
        v31 = v49;
      }
      else
      {
        if (a4 && *((_QWORD *)v66 + 5))
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v44 = (objc_class *)objc_opt_class();
            NSStringFromClass(v44);
            v45 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)*((_QWORD *)v66 + 5);
            *(_DWORD *)v72 = 138412802;
            *(_QWORD *)&v72[4] = v45;
            v73 = 2112;
            v74 = v46;
            v75 = 2112;
            v76 = v47;
            _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v72, 0x20u);

          }
        }
        else
        {
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v33 = (id)v60[5];
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v52;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v52 != v35)
                  objc_enumerationMutation(v33);
                v37 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                v38 = (void *)MEMORY[0x1D8231EA8]();
                objc_msgSend(v37, "identifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, v39);

                objc_autoreleasePoolPop(v38);
              }
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
            }
            while (v34);
          }

          if (!a4)
            goto LABEL_34;
        }
        v31 = (void *)*((_QWORD *)v66 + 5);
      }
      *a4 = objc_retainAutorelease(v31);
LABEL_34:

      _Block_object_dispose(&v59, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_35;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedPlaceIdentifiers", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("learnedPlaceIdentifiers"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = (void *)MEMORY[0x1E0C9AA70];
LABEL_35:

  return v8;
}

void __90__RTLearnedPlaceTypeInferenceStore__getLearnedPlacesMapFromLearnedPlaceIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

+ (id)fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:(id)a3 error:(id *)a4
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
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t m;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id obj;
  id obja;
  id objb;
  id objc;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint8_t v107[128];
  uint8_t buf[4];
  const char *v109;
  __int16 v110;
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v109 = "+[RTLearnedPlaceTypeInferenceStore fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:error:]";
    v110 = 2112;
    v111 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, options, %@", buf, 0x16u);
  }

  if (v5)
  {
    +[RTLearnedPlaceTypeInferenceMO fetchRequest](RTLearnedPlaceTypeInferenceMO, "fetchRequest");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    if (objc_msgSend(v5, "sortByCreationDate"))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("creationDate"), objc_msgSend(v5, "ascending"));
      objc_msgSend(v7, "addObject:", v9);

    }
    v80 = v7;
    objc_msgSend(v5, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v5, "dateInterval");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateInterval");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("creationDate"), v13, CFSTR("creationDate"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v16);

    }
    objc_msgSend(v5, "filteredToPlaceTypes");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 0x1E0CB3000;
    v82 = v8;
    v83 = v5;
    if (v17)
    {
      v19 = (void *)v17;
      objc_msgSend(v5, "filteredToPlaceTypes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        v22 = (void *)objc_opt_new();
        v100 = 0u;
        v101 = 0u;
        v102 = 0u;
        v103 = 0u;
        objc_msgSend(v5, "filteredToPlaceTypes");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v107, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v101;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v101 != v25)
                objc_enumerationMutation(obj);
              v27 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
              v28 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %ld)"), CFSTR("placeType"), objc_msgSend(v27, "unsignedIntegerValue"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v29);

              objc_autoreleasePoolPop(v28);
            }
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v107, 16);
          }
          while (v24);
        }

        v18 = 0x1E0CB3000uLL;
        objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v30);

        v5 = v83;
      }
    }
    objc_msgSend(v5, "filteredToIdentifiers");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      objc_msgSend(v5, "filteredToIdentifiers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34)
      {
        v35 = (void *)objc_opt_new();
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        objc_msgSend(v5, "filteredToIdentifiers");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v97;
          do
          {
            for (j = 0; j != v37; ++j)
            {
              if (*(_QWORD *)v97 != v38)
                objc_enumerationMutation(obja);
              v40 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
              v41 = (void *)MEMORY[0x1D8231EA8]();
              v42 = (void *)MEMORY[0x1E0CB3880];
              objc_msgSend(v40, "UUIDString");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("identifier"), v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "addObject:", v44);

              objc_autoreleasePoolPop(v41);
            }
            v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
          }
          while (v37);
        }

        v18 = 0x1E0CB3000uLL;
        objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v35);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v82;
        objc_msgSend(v82, "addObject:", v45);

        v5 = v83;
      }
    }
    objc_msgSend(v5, "filteredToSessionIds");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = (void *)v46;
      objc_msgSend(v5, "filteredToSessionIds");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "count");

      if (v49)
      {
        v50 = (void *)objc_opt_new();
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        objc_msgSend(v5, "filteredToSessionIds");
        objb = (id)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v93;
          do
          {
            for (k = 0; k != v52; ++k)
            {
              if (*(_QWORD *)v93 != v53)
                objc_enumerationMutation(objb);
              v55 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * k);
              v56 = (void *)MEMORY[0x1D8231EA8]();
              v57 = (void *)MEMORY[0x1E0CB3880];
              objc_msgSend(v55, "UUIDString");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("sessionId"), v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "addObject:", v59);

              objc_autoreleasePoolPop(v56);
            }
            v52 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
          }
          while (v52);
        }

        v18 = 0x1E0CB3000uLL;
        objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v50);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v82;
        objc_msgSend(v82, "addObject:", v60);

        v5 = v83;
      }
    }
    objc_msgSend(v5, "filteredToLearnedPlaceIdentifiers");
    v61 = objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      v62 = (void *)v61;
      objc_msgSend(v5, "filteredToLearnedPlaceIdentifiers");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "count");

      if (v64)
      {
        v65 = (void *)objc_opt_new();
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        objc_msgSend(v5, "filteredToLearnedPlaceIdentifiers");
        objc = (id)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
        if (v66)
        {
          v67 = v66;
          v68 = *(_QWORD *)v89;
          do
          {
            for (m = 0; m != v67; ++m)
            {
              if (*(_QWORD *)v89 != v68)
                objc_enumerationMutation(objc);
              v70 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * m);
              v71 = (void *)MEMORY[0x1D8231EA8]();
              v72 = (void *)MEMORY[0x1E0CB3880];
              objc_msgSend(v70, "UUIDString");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("learnedPlaceIdentifier"), v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "addObject:", v74);

              objc_autoreleasePoolPop(v71);
            }
            v67 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
          }
          while (v67);
        }

        v18 = 0x1E0CB3000uLL;
        objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v65);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v82;
        objc_msgSend(v82, "addObject:", v75);

        v5 = v83;
      }
    }
    objc_msgSend(*(id *)(v18 + 1320), "andPredicateWithSubpredicates:", v8);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v81;
    objc_msgSend(v81, "setPredicate:", v76);

    objc_msgSend(v81, "setSortDescriptors:", v80);
    objc_msgSend(v81, "setFetchBatchSize:", objc_msgSend(v5, "batchSize"));
    objc_msgSend(v81, "setFetchLimit:", objc_msgSend(v5, "fetchLimit"));
    objc_msgSend(v81, "setFetchOffset:", objc_msgSend(v5, "offset"));
    objc_msgSend(v81, "setReturnsObjectsAsFaults:", 0);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("options"));
      v77 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v77 = 0;
    }
  }

  return v77;
}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  uint8_t buf[8];
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  if (v7)
  {
    v9 = (void *)objc_opt_class();
    if (objc_msgSend(v9, "isEqual:", objc_opt_class()))
    {
      v25 = 0;
      objc_msgSend((id)objc_opt_class(), "fetchRequestForLearnedPlaceTypeInferenceEnumerationOptions:error:", v8, &v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v25;
      if (!v11)
      {
        objc_msgSend(v10, "setFetchOffset:", a4);
        goto LABEL_14;
      }
      v12 = objc_retainAutorelease(v11);
      *a5 = v12;

    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("error of type, %@, is not supported"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0D18598];
      v27 = *MEMORY[0x1E0CB2D50];
      v28[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_retainAutorelease(v22);
      *a5 = v23;

    }
    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", buf, 2u);
  }

  _RTErrorInvalidParameterCreate((uint64_t)CFSTR("options"));
  v10 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v10;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
}

@end
