@implementation RTTripSegmentInertialDataStore

- (RTTripSegmentInertialDataStore)initWithPersistenceManager:(id)a3
{
  RTTripSegmentInertialDataStore *v4;
  NSObject *v5;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)RTTripSegmentInertialDataStore;
  v4 = -[RTStore initWithPersistenceManager:](&v10, sel_initWithPersistenceManager_, a3);
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@ %@ success.", buf, 0x16u);

    }
  }
  return v4;
}

- (void)storeTripSegmentInertialData:(id)a3 handler:(id)a4
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
  block[2] = __71__RTTripSegmentInertialDataStore_storeTripSegmentInertialData_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __71__RTTripSegmentInertialDataStore_storeTripSegmentInertialData_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeTripSegmentInertialData:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchStoredTripSegmentInertialDataWithContext:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  char *v20;
  _QWORD block[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
LABEL_3:
      v9 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __89__RTTripSegmentInertialDataStore__fetchStoredTripSegmentInertialDataWithContext_handler___block_invoke;
      v24[3] = &unk_1E9297A80;
      v25 = v6;
      v10 = v8;
      v26 = v10;
      v11 = (void *)MEMORY[0x1D8232094](v24);
      -[RTNotifier queue](self, "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __89__RTTripSegmentInertialDataStore__fetchStoredTripSegmentInertialDataWithContext_handler___block_invoke_2;
      block[3] = &unk_1E929B4A8;
      block[4] = self;
      v22 = v11;
      v23 = v10;
      v13 = v11;
      dispatch_async(v12, block);

      v14 = v25;
      goto LABEL_12;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTTripSegmentInertialDataStore _fetchStoredTripSegmentInertialDataWithContext:handler:]";
      v29 = 1024;
      LODWORD(v30) = 61;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }

    if (v8)
      goto LABEL_3;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTTripSegmentInertialDataStore _fetchStoredTripSegmentInertialDataWithContext:handler:]";
    v29 = 1024;
    LODWORD(v30) = 62;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

  v31 = *MEMORY[0x1E0CB2D50];
  v32[0] = CFSTR("A handler is a required parameter.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v20;
    v29 = 2112;
    v30 = v17;
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%@: A handler is a required parameter, %@", buf, 0x16u);

  }
LABEL_12:

}

void __89__RTTripSegmentInertialDataStore__fetchStoredTripSegmentInertialDataWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _BYTE v43[128];
  _QWORD v44[2];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v37 = a2;
  +[RTTripSegmentInertialDataMO fetchRequest](RTTripSegmentInertialDataMO, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timestamp"), 1);
  v45[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v5);

  v6 = (void *)MEMORY[0x1E0CB3528];
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a1;
  v36 = a1;
  objc_msgSend(*(id *)(a1 + 32), "options");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%@ <= %K"), v10, CFSTR("timestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v11;
  v12 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(v8 + 32), "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("timestamp"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v18);

  v19 = v3;
  v20 = v37;

  v42 = 0;
  objc_msgSend(v37, "executeFetchRequest:error:", v3, &v42);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v42;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = v36;
  if (!v22)
  {
    v33 = v21;
    v35 = v19;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v25 = v21;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v39;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v39 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v29);
          v31 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0C9E420], "createWithManagedObject:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
            objc_msgSend(v23, "addObject:", v32);

          objc_autoreleasePoolPop(v31);
          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v27);
    }

    v24 = v36;
    v20 = v37;
    v21 = v33;
    v19 = v35;
  }
  (*(void (**)(void))(*(_QWORD *)(v24 + 40) + 16))();

}

void __89__RTTripSegmentInertialDataStore__fetchStoredTripSegmentInertialDataWithContext_handler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89__RTTripSegmentInertialDataStore__fetchStoredTripSegmentInertialDataWithContext_handler___block_invoke_3;
  v3[3] = &unk_1E9297568;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performBlock:contextType:errorHandler:", v2, 1, v3);

}

uint64_t __89__RTTripSegmentInertialDataStore__fetchStoredTripSegmentInertialDataWithContext_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchStoredTripSegmentInertialDataWithContext:(id)a3 handler:(id)a4
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
  block[2] = __88__RTTripSegmentInertialDataStore_fetchStoredTripSegmentInertialDataWithContext_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __88__RTTripSegmentInertialDataStore_fetchStoredTripSegmentInertialDataWithContext_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredTripSegmentInertialDataWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchStoredTripSegmentInertialDataWithOptions:(id)a3 handler:(id)a4
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
      v11 = "-[RTTripSegmentInertialDataStore _fetchStoredTripSegmentInertialDataWithOptions:handler:]";
      v12 = 1024;
      v13 = 127;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18538]), "initWithEnumerationOptions:", v6);
  -[RTTripSegmentInertialDataStore _fetchStoredTripSegmentInertialDataWithContext:handler:](self, "_fetchStoredTripSegmentInertialDataWithContext:handler:", v9, v7);

}

- (void)fetchStoredTripSegmentInertialDataWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __88__RTTripSegmentInertialDataStore_fetchStoredTripSegmentInertialDataWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __88__RTTripSegmentInertialDataStore_fetchStoredTripSegmentInertialDataWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchStoredTripSegmentInertialDataWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_purgeTripSegmentInertialDataPredating:(id)a3 handler:(id)a4
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
      v20 = "-[RTTripSegmentInertialDataStore _purgeTripSegmentInertialDataPredating:handler:]";
      v21 = 1024;
      v22 = 148;
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

- (void)purgeTripSegmentInertialDataPredating:(id)a3 handler:(id)a4
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
  block[2] = __80__RTTripSegmentInertialDataStore_purgeTripSegmentInertialDataPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __80__RTTripSegmentInertialDataStore_purgeTripSegmentInertialDataPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeTripSegmentInertialDataPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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
      -[RTTripSegmentInertialDataStore fetchRequestFromStoredTripSegmentInertialDataOptions:](self, "fetchRequestFromStoredTripSegmentInertialDataOptions:", v9);
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

- (id)fetchRequestFromStoredTripSegmentInertialDataOptions:(id)a3
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
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[16];
  _QWORD v26[2];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    +[RTTripSegmentInertialDataMO fetchRequest](RTTripSegmentInertialDataMO, "fetchRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timestamp"), 1);
    v27[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
    v11 = v10;

    objc_msgSend(v3, "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ <= %K"), v11, CFSTR("timestamp"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("timestamp"), v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addObject:", v22);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v23);

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
    v4 = 0;
  }

  return v4;
}

@end
