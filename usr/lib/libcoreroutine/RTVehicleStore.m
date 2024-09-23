@implementation RTVehicleStore

- (RTVehicleStore)initWithPersistenceManager:(id)a3
{
  RTVehicleStore *v4;
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
  v10.super_class = (Class)RTVehicleStore;
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

- (void)_fetchVehiclesWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked.", buf, 0x16u);

    }
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52__RTVehicleStore__fetchVehiclesWithOptions_handler___block_invoke;
    v18[3] = &unk_1E9297A08;
    v19 = v7;
    v21 = a2;
    v11 = v8;
    v20 = v11;
    v12 = (void *)MEMORY[0x1D8232094](v18);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __52__RTVehicleStore__fetchVehiclesWithOptions_handler___block_invoke_13;
    v16[3] = &unk_1E9297568;
    v17 = v11;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 1, v16);

  }
}

void __52__RTVehicleStore__fetchVehiclesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
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
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  _QWORD v63[7];

  v63[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTVehicleMO fetchRequest](RTVehicleMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = v3;
  v48 = v4;
  if (v5)
  {
    v38 = (void *)MEMORY[0x1E0CB3528];
    v6 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "startDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "endDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("%@ <= %K AND %K <= %@"), v44, CFSTR("startDate"), CFSTR("endDate"), v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v42;
    v7 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "startDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "endDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("%@ <= %K AND %K <= %@"), v39, CFSTR("startDate"), CFSTR("startDate"), v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v36;
    v8 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "startDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("%@ <= %K AND %K <= %@"), v33, CFSTR("endDate"), CFSTR("endDate"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v10;
    v11 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K <= %@ AND %@ <= %K"), CFSTR("startDate"), v13, v15, CFSTR("endDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "orPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setPredicate:", v18);

    v4 = v48;
    v3 = v47;

  }
  objc_msgSend(*(id *)(a1 + 32), "limit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(*(id *)(a1 + 32), "limit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v20, "unsignedIntegerValue"));

  }
  objc_msgSend(v4, "setFetchBatchSize:", 100);
  v53 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v53);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v53;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 138413058;
    v56 = v31;
    v57 = 2112;
    v58 = v4;
    v59 = 2048;
    v60 = v32;
    v61 = 2112;
    v62 = v22;
    _os_log_debug_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v22)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v25 = v21;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v50;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v50 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(MEMORY[0x1E0D18568], "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v29));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend(v24, "addObject:", v30);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v27);
    }

    v3 = v47;
    v4 = v48;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __52__RTVehicleStore__fetchVehiclesWithOptions_handler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchVehiclesWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __51__RTVehicleStore_fetchVehiclesWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __51__RTVehicleStore_fetchVehiclesWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVehiclesWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_storeVehicle:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@ %@ invoked on Vehicle %@", buf, 0x20u);

    }
    v17 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v11, v8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "RTVehicleStore::storeVehicle invoked with nil vehicle, not storing nil vehicle.", buf, 2u);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, 0);
    v8[2](v8, v11);
  }

}

- (void)storeVehicle:(id)a3 handler:(id)a4
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
  block[2] = __39__RTVehicleStore_storeVehicle_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __39__RTVehicleStore_storeVehicle_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeVehicle:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_purgeVehiclesPredating:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);

  }
  v16 = CFSTR("endDate");
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTStore purgePredating:predicateMappings:handler:](self, "purgePredating:predicateMappings:handler:", v8, v11, v7);
}

- (void)purgeVehiclesPredating:(id)a3 handler:(id)a4
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
  block[2] = __49__RTVehicleStore_purgeVehiclesPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __49__RTVehicleStore_purgeVehiclesPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeVehiclesPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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
  RTVehicleStore *v16;
  id v17;
  int64_t v18;
  SEL v19;

  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__RTVehicleStore_performPurgeOfType_referenceDate_completion___block_invoke;
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

void __62__RTVehicleStore_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
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
    v5[2] = __62__RTVehicleStore_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v5[3] = &unk_1E92971A0;
    v7 = *(_QWORD *)(a1 + 64);
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "purgeVehiclesPredating:handler:", v3, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __62__RTVehicleStore_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
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

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0D18598];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("The vehicle store doesn't support enumeration");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return 0;
}

@end
