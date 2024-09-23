@implementation RTAuthorizedLocationVisitLogStore

- (RTAuthorizedLocationVisitLogStore)initWithPersistenceManager:(id)a3
{
  RTAuthorizedLocationVisitLogStore *v4;
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
  v10.super_class = (Class)RTAuthorizedLocationVisitLogStore;
  v4 = -[RTStore initWithPersistenceManager:](&v10, sel_initWithPersistenceManager_, a3);
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
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

- (void)_fetchVisitLogsWithOptions:(id)a3 handler:(id)a4
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
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
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
    v18[2] = __72__RTAuthorizedLocationVisitLogStore__fetchVisitLogsWithOptions_handler___block_invoke;
    v18[3] = &unk_1E9297A08;
    v19 = v7;
    v21 = a2;
    v11 = v8;
    v20 = v11;
    v12 = (void *)MEMORY[0x1D8232094](v18);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __72__RTAuthorizedLocationVisitLogStore__fetchVisitLogsWithOptions_handler___block_invoke_16;
    v16[3] = &unk_1E9297568;
    v17 = v11;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 1, v16);

  }
}

void __72__RTAuthorizedLocationVisitLogStore__fetchVisitLogsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
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
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  void *v51;
  _QWORD v52[5];

  v52[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTAuthorizedLocationVisitLogMO fetchRequest](RTAuthorizedLocationVisitLogMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0x1E0C99000;
  v36 = v3;
  if (v5)
  {
    v34 = (void *)MEMORY[0x1E0CB3528];
    v7 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("%@ <= %K"), v9, CFSTR("registrationDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v10;
    v11 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("registrationDate"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v16);

    v3 = v36;
    v6 = 0x1E0C99000uLL;
  }
  v17 = v6;
  objc_msgSend(*(id *)(a1 + 32), "limit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "limit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v19, "unsignedIntegerValue"));

  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("registrationDate"), objc_msgSend(*(id *)(a1 + 32), "isAscending"));
  v51 = v20;
  objc_msgSend(*(id *)(v17 + 3360), "arrayWithObjects:count:", &v51, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v21);

  objc_msgSend(v4, "setFetchBatchSize:", 10);
  v41 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v41);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v41;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 138413058;
    v44 = v32;
    v45 = 2112;
    v46 = v4;
    v47 = 2048;
    v48 = v33;
    v49 = 2112;
    v50 = v23;
    _os_log_debug_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v23)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v35 = v22;
    v26 = v22;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v38;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v26);
          +[RTAuthorizedLocationVisitLog createWithManagedObject:](RTAuthorizedLocationVisitLog, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v30));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v28);
    }

    v22 = v35;
    v3 = v36;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __72__RTAuthorizedLocationVisitLogStore__fetchVisitLogsWithOptions_handler___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchVisitLogsWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __71__RTAuthorizedLocationVisitLogStore_fetchVisitLogsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __71__RTAuthorizedLocationVisitLogStore_fetchVisitLogsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitLogsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchVisitLogWithUUID:(id)a3 handler:(id)a4
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
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
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
    v18[2] = __68__RTAuthorizedLocationVisitLogStore__fetchVisitLogWithUUID_handler___block_invoke;
    v18[3] = &unk_1E9297A08;
    v19 = v7;
    v21 = a2;
    v11 = v8;
    v20 = v11;
    v12 = (void *)MEMORY[0x1D8232094](v18);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __68__RTAuthorizedLocationVisitLogStore__fetchVisitLogWithUUID_handler___block_invoke_23;
    v16[3] = &unk_1E9297568;
    v17 = v11;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 1, v16);

  }
}

void __68__RTAuthorizedLocationVisitLogStore__fetchVisitLogWithUUID_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  _QWORD v36[4];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTAuthorizedLocationVisitLogMO fetchRequest](RTAuthorizedLocationVisitLogMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ == %K"), *(_QWORD *)(a1 + 32), CFSTR("visitIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("registrationDate"), 1);
  v36[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  objc_msgSend(v4, "setFetchLimit:", 10);
  objc_msgSend(v4, "setFetchBatchSize:", 10);
  v26 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 138413058;
    v29 = v18;
    v30 = 2112;
    v31 = v4;
    v32 = 2048;
    v33 = v19;
    v34 = 2112;
    v35 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v9)
  {
    v11 = 0;
  }
  else
  {
    v20 = a1;
    v21 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          +[RTAuthorizedLocationVisitLog createWithManagedObject:](RTAuthorizedLocationVisitLog, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }

    a1 = v20;
    v3 = v21;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __68__RTAuthorizedLocationVisitLogStore__fetchVisitLogWithUUID_handler___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchVisitLogWithUUID:(id)a3 handler:(id)a4
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
  block[2] = __67__RTAuthorizedLocationVisitLogStore_fetchVisitLogWithUUID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __67__RTAuthorizedLocationVisitLogStore_fetchVisitLogWithUUID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitLogWithUUID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_storeVisitLog:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@:%@,%@", buf, 0x20u);

  }
  v15 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v10, v8);

}

- (void)storeVisitLog:(id)a3 handler:(id)a4
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
  block[2] = __59__RTAuthorizedLocationVisitLogStore_storeVisitLog_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __59__RTAuthorizedLocationVisitLogStore_storeVisitLog_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeVisitLog:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)purgeVisitLogsPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  RTAuthorizedLocationVisitLogStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__RTAuthorizedLocationVisitLogStore_purgeVisitLogsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __69__RTAuthorizedLocationVisitLogStore_purgeVisitLogsPredating_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "laterDate:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v2);
  objc_msgSend(v3, "_purgeVisitLogsOnDateInterval:handler:", v4, *(_QWORD *)(a1 + 48));

}

- (void)_purgeVisitLogsOnDateInterval:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  char *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  RTAuthorizedLocationVisitLogStore *v22;
  id v23;
  uint64_t v24;
  const __CFString *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[RTAuthorizedLocationVisitLogStore _purgeVisitLogsOnDateInterval:handler:]";
      v28 = 1024;
      LODWORD(v29) = 210;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v18;
    v28 = 2112;
    v29 = v19;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);

  }
  if (v7)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __75__RTAuthorizedLocationVisitLogStore__purgeVisitLogsOnDateInterval_handler___block_invoke;
    v20[3] = &unk_1E9297A30;
    v21 = v7;
    v22 = self;
    v11 = v8;
    v23 = v11;
    v12 = (void *)MEMORY[0x1D8232094](v20);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 0, v11);

    v13 = v21;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D18598];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("requires a non-nil dateInterval.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      (*((void (**)(id, void *))v8 + 2))(v8, v13);
  }

}

void __75__RTAuthorizedLocationVisitLogStore__purgeVisitLogsOnDateInterval_handler___block_invoke(uint64_t a1, void *a2)
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
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  +[RTAuthorizedLocationVisitLogMO fetchRequest](RTAuthorizedLocationVisitLogMO, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%@ < %K"), v8, CFSTR("registrationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("registrationDate"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v5);
  objc_msgSend(v15, "setResultType:", 2);
  objc_msgSend(v4, "addObject:", v15);
  objc_msgSend(*(id *)(a1 + 40), "executeDeleteRequests:context:handler:", v4, v3, *(_QWORD *)(a1 + 48));

}

- (void)purgeVisitLogsOnDateInterval:(id)a3 handler:(id)a4
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
  block[2] = __74__RTAuthorizedLocationVisitLogStore_purgeVisitLogsOnDateInterval_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __74__RTAuthorizedLocationVisitLogStore_purgeVisitLogsOnDateInterval_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeVisitLogsOnDateInterval:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deleteVisitLogWithUUID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString **v19;
  uint64_t *v20;
  void *v21;
  objc_class *v22;
  char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  RTAuthorizedLocationVisitLogStore *v32;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[RTAuthorizedLocationVisitLogStore _deleteVisitLogWithUUID:handler:]";
      v43 = 1024;
      LODWORD(v44) = 263;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuid (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v23;
    v43 = 2112;
    v44 = v24;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);

  }
  v39 = CFSTR("visitIdentifier");
  v38 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v12)
    {
      objc_msgSend(v12, "allKeys");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        v25 = MEMORY[0x1E0C809B0];
        v26 = 3221225472;
        v27 = __69__RTAuthorizedLocationVisitLogStore__deleteVisitLogWithUUID_handler___block_invoke;
        v28 = &unk_1E929A5D0;
        v13 = v13;
        v29 = v13;
        v30 = v12;
        v31 = v7;
        v32 = self;
        v14 = v8;
        v33 = v14;
        v15 = (void *)MEMORY[0x1D8232094](&v25);
        -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v15, 0, v14, v25, v26, v27, v28);

      }
      goto LABEL_15;
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D18598];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("requires a non-nil mappings.");
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v35;
    v20 = &v34;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D18598];
    v36 = *MEMORY[0x1E0CB2D50];
    v37 = CFSTR("requires a non-nil uuid.");
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v37;
    v20 = &v36;
  }
  objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v21);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    (*((void (**)(id, id))v8 + 2))(v8, v13);
LABEL_15:

}

void __69__RTAuthorizedLocationVisitLogStore__deleteVisitLogWithUUID_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v3 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v18 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v4);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
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
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "fetchRequest");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), v5, *(_QWORD *)(a1 + 48));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setPredicate:", v12);

              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v11);
              objc_msgSend(v13, "setResultType:", 2);
              objc_msgSend(v3, "addObject:", v13);

              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v8);
        }

        v4 = v18 + 1;
      }
      while (v18 + 1 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }

  objc_msgSend(*(id *)(a1 + 56), "executeDeleteRequests:context:handler:", v3, v14, *(_QWORD *)(a1 + 64));
}

- (void)deleteVisitLogWithUUID:(id)a3 handler:(id)a4
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
  block[2] = __68__RTAuthorizedLocationVisitLogStore_deleteVisitLogWithUUID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __68__RTAuthorizedLocationVisitLogStore_deleteVisitLogWithUUID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteVisitLogWithUUID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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
  v12[0] = CFSTR("the authorized location visit log store doesn't support enumeration");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return 0;
}

- (void)_updateVisitLogDistantFutureFlagWithStatus:(int64_t)a3 TrustedTimeAvailability:(BOOL)a4 isRetroRegistration:(BOOL)a5
{
  const __CFString *v6;
  id v7;
  void *v8;
  uint64_t v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  id v12;
  id *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  RTAuthorizedLocationVisitLog *v31;
  dispatch_semaphore_t v32;
  RTAuthorizedLocationVisitLog *v33;
  NSObject *v34;
  id *v35;
  id v36;
  NSObject *v37;
  void *v38;
  dispatch_time_t v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  void *v53;
  void *v54;
  SEL v55;
  _BOOL4 v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  NSObject *log;
  NSObject *dsema;
  _QWORD v65[5];
  RTAuthorizedLocationVisitLog *v66;
  NSObject *v67;
  uint8_t *v68;
  SEL v69;
  _QWORD v70[4];
  NSObject *v71;
  _BYTE *v72;
  uint8_t buf[8];
  uint8_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  _BYTE v79[24];
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;
  uint8_t v84[8];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v56 = a4;
    v57 = a5;
    v55 = a2;
    v6 = CFSTR("00001111-2222-3333-4444-555566667777");
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v56 = a4;
    v57 = a5;
    v55 = a2;
    v6 = CFSTR("11112222-3333-4444-5555-666677778888");
LABEL_5:
    log = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
    v7 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v7, "initWithTimeInterval:sinceDate:", v8, -120.0);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v59, v60);
    v10 = dispatch_semaphore_create(0);
    *(_QWORD *)v79 = 0;
    *(_QWORD *)&v79[8] = v79;
    *(_QWORD *)&v79[16] = 0x3032000000;
    v80 = __Block_byref_object_copy__28;
    v81 = __Block_byref_object_dispose__28;
    v82 = 0;
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __124__RTAuthorizedLocationVisitLogStore__updateVisitLogDistantFutureFlagWithStatus_TrustedTimeAvailability_isRetroRegistration___block_invoke;
    v70[3] = &unk_1E9297038;
    v72 = v79;
    v11 = v10;
    v71 = v11;
    v54 = (void *)v9;
    -[RTAuthorizedLocationVisitLogStore purgeVisitLogsOnDateInterval:handler:](self, "purgeVisitLogsOnDateInterval:handler:", v9, v70);
    v13 = (id *)(*(_QWORD *)&v79[8] + 40);
    v12 = *(id *)(*(_QWORD *)&v79[8] + 40);
    dsema = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v15))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v14);
      v18 = v17;
      v19 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v25 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v84 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v84, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v12 = objc_retainAutorelease(v27);

      }
    }

    objc_storeStrong(v13, v12);
    v28 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithTimeInterval:sinceDate:", v29, -60.0);

    +[RTAuthorizedLocationVisitLog encodeTimeSourceWithValue:isTrusted:isRetroRegistration:](RTAuthorizedLocationVisitLog, "encodeTimeSourceWithValue:isTrusted:isRetroRegistration:", v30, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = -[RTAuthorizedLocationVisitLog initWithVisitIdentifier:registrationDate:locationTechnologyAvailability:]([RTAuthorizedLocationVisitLog alloc], "initWithVisitIdentifier:registrationDate:locationTechnologyAvailability:", log, v58, 0);
    v32 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    v74 = buf;
    v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__28;
    v77 = __Block_byref_object_dispose__28;
    v78 = 0;
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __124__RTAuthorizedLocationVisitLogStore__updateVisitLogDistantFutureFlagWithStatus_TrustedTimeAvailability_isRetroRegistration___block_invoke_2;
    v65[3] = &unk_1E929A5F8;
    v68 = buf;
    v65[4] = self;
    v69 = v55;
    v33 = v31;
    v66 = v33;
    v34 = v32;
    v67 = v34;
    -[RTAuthorizedLocationVisitLogStore storeVisitLog:handler:](self, "storeVisitLog:handler:", v33, v65);
    v35 = (id *)(v74 + 40);
    v36 = (id)*((_QWORD *)v74 + 5);
    v37 = v34;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v37, v39))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "timeIntervalSinceDate:", v38);
      v41 = v40;
      v42 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_23);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "filteredArrayUsingPredicate:", v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "firstObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "submitToCoreAnalytics:type:duration:", v46, 1, v41);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v84 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v84, 2u);
      }

      v48 = (void *)MEMORY[0x1E0CB35C8];
      v83 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v84 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        v36 = objc_retainAutorelease(v50);

      }
    }

    objc_storeStrong(v35, v36);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v79, 8);
    goto LABEL_18;
  }
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  log = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v79 = 138412546;
    *(_QWORD *)&v79[4] = v52;
    *(_WORD *)&v79[12] = 2112;
    *(_QWORD *)&v79[14] = v53;
    _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, "%@ %@, cannot update VisitLogDistantFutureFlag to RTEraseInstallRetroRegistrationStatusHasNotRun", v79, 0x16u);

  }
LABEL_18:

}

void __124__RTAuthorizedLocationVisitLogStore__updateVisitLogDistantFutureFlagWithStatus_TrustedTimeAvailability_isRetroRegistration___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __124__RTAuthorizedLocationVisitLogStore__updateVisitLogDistantFutureFlagWithStatus_TrustedTimeAvailability_isRetroRegistration___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@, registered visit retro registration event: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (int64_t)getEraseInstallRetroRegistrationStatus
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  RTAuthorizedLocationVisitLogFetchOptions *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  id v11;
  id *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  id v30;
  id v31;
  void *v32;
  RTAuthorizedLocationVisitLogFetchOptions *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  RTAuthorizedLocationVisitLogStore *v38;
  id v39;
  NSObject *v40;
  uint64_t *v41;
  uint64_t *v42;
  SEL v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t buf[16];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00001111-2222-3333-4444-555566667777"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("11112222-3333-4444-5555-666677778888"));
  v6 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v6, "initWithTimeInterval:sinceDate:", v7, -120.0);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v34, v35);
  v8 = -[RTAuthorizedLocationVisitLogFetchOptions initWithAscending:dateInterval:limit:]([RTAuthorizedLocationVisitLogFetchOptions alloc], "initWithAscending:dateInterval:limit:", 0, v32, &unk_1E9327080);
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v9 = dispatch_semaphore_create(0);
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__28;
  v48 = __Block_byref_object_dispose__28;
  v49 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __75__RTAuthorizedLocationVisitLogStore_getEraseInstallRetroRegistrationStatus__block_invoke;
  v36[3] = &unk_1E929A620;
  v41 = &v44;
  v30 = v4;
  v37 = v30;
  v38 = self;
  v42 = &v50;
  v43 = a2;
  v31 = v5;
  v39 = v31;
  v10 = v9;
  v40 = v10;
  v33 = v8;
  -[RTAuthorizedLocationVisitLogStore fetchVisitLogsWithOptions:handler:](self, "fetchVisitLogsWithOptions:handler:", v8, v36);
  v12 = (id *)(v45 + 5);
  v11 = (id)v45[5];
  v13 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now", v30, v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v14);
    v18 = v17;
    v19 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v25 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v54, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v11 = objc_retainAutorelease(v27);

    }
  }

  objc_storeStrong(v12, v11);
  v28 = v51[3];

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v28;
}

void __75__RTAuthorizedLocationVisitLogStore_getEraseInstallRetroRegistrationStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  objc_class *v21;
  objc_class *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  if (!v6)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visitIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v9)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "visitIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v12;
        v25 = 2112;
        v26 = v13;
        v27 = 2112;
        v28 = v15;
        v16 = "%@:%@, successfully fetched retro-registration flag, %@, indicating that it is running.";
LABEL_8:
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v23, 0x20u);

LABEL_11:
      }
    }
    else
    {
      objc_msgSend(v5, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "visitIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqual:", *(_QWORD *)(a1 + 48));

      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (v19)
      {
        *(_QWORD *)(v20 + 24) = 2;
        _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 80));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "visitIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412802;
          v24 = v12;
          v25 = 2112;
          v26 = v13;
          v27 = 2112;
          v28 = v15;
          v16 = "%@:%@, successfully fetched retro-registration flag, %@, indicating that it has already run.";
          goto LABEL_8;
        }
      }
      else
      {
        *(_QWORD *)(v20 + 24) = 0;
        _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 80));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412546;
          v24 = v12;
          v25 = 2112;
          v26 = v13;
          _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@, successfully fetched zero retro-registration flags, indicating that we have not already run.", (uint8_t *)&v23, 0x16u);
          goto LABEL_11;
        }
      }
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

- (void)setEraseInstallRetroRegistrationStatus:(int64_t)a3
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = a3;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, setting status, %d.", (uint8_t *)&v10, 0x1Cu);

  }
  -[RTAuthorizedLocationVisitLogStore _updateVisitLogDistantFutureFlagWithStatus:TrustedTimeAvailability:isRetroRegistration:](self, "_updateVisitLogDistantFutureFlagWithStatus:TrustedTimeAvailability:isRetroRegistration:", a3, 0, 1);
}

- (BOOL)wasTrustedTimeRecentlyAvailable
{
  void *v2;
  id v3;
  void *v4;
  RTAuthorizedLocationVisitLogFetchOptions *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  id *v8;
  id v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  _BOOL4 v28;
  NSObject *v29;
  objc_class *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  RTAuthorizedLocationVisitLogFetchOptions *v36;
  void *v39;
  void *v40;
  char v41;
  _QWORD v42[4];
  id v43;
  RTAuthorizedLocationVisitLogStore *v44;
  NSObject *v45;
  uint64_t *v46;
  uint64_t *v47;
  SEL v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE buf[12];
  __int16 v62;
  void *v63;
  __int16 v64;
  _BOOL4 v65;
  _QWORD v66[4];

  v66[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("11112222-3333-4444-5555-666677778888"));
  v3 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v3, "initWithTimeInterval:sinceDate:", v4, -120.0);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v39, v40);
  v5 = -[RTAuthorizedLocationVisitLogFetchOptions initWithAscending:dateInterval:limit:]([RTAuthorizedLocationVisitLogFetchOptions alloc], "initWithAscending:dateInterval:limit:", 0, v35, &unk_1E9327080);
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__28;
  v59 = __Block_byref_object_dispose__28;
  v60 = 0;
  v6 = dispatch_semaphore_create(0);
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__28;
  v53 = __Block_byref_object_dispose__28;
  v54 = 0;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __68__RTAuthorizedLocationVisitLogStore_wasTrustedTimeRecentlyAvailable__block_invoke;
  v42[3] = &unk_1E929A648;
  v46 = &v49;
  v34 = v2;
  v43 = v34;
  v44 = self;
  v47 = &v55;
  v48 = a2;
  v7 = v6;
  v45 = v7;
  v36 = v5;
  -[RTAuthorizedLocationVisitLogStore fetchVisitLogsWithOptions:handler:](self, "fetchVisitLogsWithOptions:handler:", v5, v42);
  v8 = (id *)(v50 + 5);
  v9 = (id)v50[5];
  v10 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v10, v12))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now", v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v11);
    v15 = v14;
    v16 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v22 = (void *)MEMORY[0x1E0CB35C8];
    v66[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v66, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v9 = objc_retainAutorelease(v24);

    }
  }

  objc_storeStrong(v8, v9);
  v25 = (void *)v56[5];
  if (v25)
  {
    LOBYTE(v66[0]) = 0;
    v41 = 0;
    objc_msgSend(v25, "registrationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = +[RTAuthorizedLocationVisitLog decodeTimeSourceWithValue:isRetroRegistration:isTrusted:](RTAuthorizedLocationVisitLog, "decodeTimeSourceWithValue:isRetroRegistration:isTrusted:", v26, v66, &v41);

    if (v41)
      v28 = v27;
    else
      v28 = 0;
    _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v32;
      v62 = 2112;
      v63 = v33;
      v64 = 1024;
      v65 = v28;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@:%@, decoded  trusted-time availability flag. trustedTimeWasAvailable, %d.", buf, 0x1Cu);

    }
  }
  else
  {
    LOBYTE(v28) = 0;
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v28;
}

void __68__RTAuthorizedLocationVisitLogStore_wasTrustedTimeRecentlyAvailable__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (!v6)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visitIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v9)
    {
      objc_msgSend(v5, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 72));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "visitIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412802;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        v24 = 2112;
        v25 = v18;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@, successfully fetched trusted-time availability flag, %@.", (uint8_t *)&v20, 0x20u);

LABEL_7:
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityAuthorizedLocation);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 72));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@, successfully fetched zero trusted-time availability flags.", (uint8_t *)&v20, 0x16u);
        goto LABEL_7;
      }
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (BOOL)setTrustedTimeRecentAvailability:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;

  v3 = a3;
  v5 = -[RTAuthorizedLocationVisitLogStore getEraseInstallRetroRegistrationStatus](self, "getEraseInstallRetroRegistrationStatus");
  if (v5 == 2)
    -[RTAuthorizedLocationVisitLogStore _updateVisitLogDistantFutureFlagWithStatus:TrustedTimeAvailability:isRetroRegistration:](self, "_updateVisitLogDistantFutureFlagWithStatus:TrustedTimeAvailability:isRetroRegistration:", 2, v3, 0);
  return v5 == 2;
}

@end
