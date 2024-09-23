@implementation RTProximityEventStore

- (void)fetchProximityEventsFromDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__RTProximityEventStore_fetchProximityEventsFromDate_endDate_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __70__RTProximityEventStore_fetchProximityEventsFromDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchProximityEventsFromDate:endDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchProximityEventsFromDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void (**v25)(id, _QWORD, void *);
  void *v26;
  _QWORD v27[4];
  void (**v28)(id, _QWORD, void *);
  _QWORD v29[4];
  id v30;
  id v31;
  RTProximityEventStore *v32;
  id v33;
  SEL v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[RTProximityEventStore _fetchProximityEventsFromDate:endDate:handler:]";
      v39 = 1024;
      v40 = 43;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
    }

    if (v10)
    {
LABEL_3:
      if (v11)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[RTProximityEventStore _fetchProximityEventsFromDate:endDate:handler:]";
    v39 = 1024;
    v40 = 44;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
  }

  if (!v11)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[RTProximityEventStore _fetchProximityEventsFromDate:endDate:handler:]";
      v39 = 1024;
      v40 = 45;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_14:
  if (objc_msgSend(v9, "compare:", v10) == 1)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v35 = *MEMORY[0x1E0CB2D50];
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "getFormattedDateString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getFormattedDateString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("startDate, %@, endDate, %@"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, MEMORY[0x1E0C9AA60], v22);

  }
  else
  {
    v23 = (void *)MEMORY[0x1D8231EA8]();
    v24 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __71__RTProximityEventStore__fetchProximityEventsFromDate_endDate_handler___block_invoke;
    v29[3] = &unk_1E929D938;
    v30 = v10;
    v31 = v9;
    v32 = self;
    v34 = a2;
    v25 = v11;
    v33 = v25;
    v26 = (void *)MEMORY[0x1D8232094](v29);
    v27[0] = v24;
    v27[1] = 3221225472;
    v27[2] = __71__RTProximityEventStore__fetchProximityEventsFromDate_endDate_handler___block_invoke_15;
    v27[3] = &unk_1E9297568;
    v28 = v25;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v26, 1, v27);

    objc_autoreleasePoolPop(v23);
  }

}

void __71__RTProximityEventStore__fetchProximityEventsFromDate_endDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTProximityEventMO fetchRequest](RTProximityEventMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@ AND %K >= %@"), CFSTR("startDate"), *(_QWORD *)(a1 + 32), CFSTR("endDate"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v28 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138413314;
    v31 = v19;
    v32 = 2112;
    v33 = v20;
    v34 = 2112;
    v35 = v4;
    v36 = 2048;
    v37 = v21;
    v38 = 2112;
    v39 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, results count, %lu, error, %@", buf, 0x34u);

  }
  v9 = (void *)objc_opt_new();
  if (!v7 && objc_msgSend(v6, "count"))
  {
    v22 = a1;
    v23 = v3;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0D18458], "createWithManagedObject:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

          objc_autoreleasePoolPop(v16);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v12);
    }

    a1 = v22;
    v3 = v23;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __71__RTProximityEventStore__fetchProximityEventsFromDate_endDate_handler___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchProximityEventsFromEventIDs:(id)a3 handler:(id)a4
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
  block[2] = __66__RTProximityEventStore_fetchProximityEventsFromEventIDs_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __66__RTProximityEventStore_fetchProximityEventsFromEventIDs_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchProximityEventsFromEventIDs:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchProximityEventsFromEventIDs:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD, _QWORD, _QWORD);
  _QWORD v22[5];
  id v23;
  id v24;
  SEL v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[RTProximityEventStore _fetchProximityEventsFromEventIDs:handler:]";
    v30 = 1024;
    v31 = 107;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventIDs (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[RTProximityEventStore _fetchProximityEventsFromEventIDs:handler:]";
      v30 = 1024;
      v31 = 108;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  if (objc_msgSend(v7, "count"))
  {
    v12 = (void *)MEMORY[0x1D8231EA8]();
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __67__RTProximityEventStore__fetchProximityEventsFromEventIDs_handler___block_invoke;
    v22[3] = &unk_1E92979A0;
    v22[4] = self;
    v23 = v7;
    v25 = a2;
    v14 = v9;
    v24 = v14;
    v15 = (void *)MEMORY[0x1D8232094](v22);
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __67__RTProximityEventStore__fetchProximityEventsFromEventIDs_handler___block_invoke_19;
    v20[3] = &unk_1E9297568;
    v21 = v14;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v15, 1, v20);

    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D18598];
    v26 = *MEMORY[0x1E0CB2D50];
    v27 = CFSTR("eventIDs requires at least one element to fetch");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, MEMORY[0x1E0C9AA60], v19);

  }
}

void __67__RTProximityEventStore__fetchProximityEventsFromEventIDs_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTProximityEventMO fetchRequest](RTProximityEventMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_getPredicateForEventIDs:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v28 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138413314;
    v31 = v19;
    v32 = 2112;
    v33 = v20;
    v34 = 2112;
    v35 = v4;
    v36 = 2048;
    v37 = v21;
    v38 = 2112;
    v39 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, results count, %lu, error, %@", buf, 0x34u);

  }
  v9 = (void *)objc_opt_new();
  if (!v7 && objc_msgSend(v6, "count"))
  {
    v22 = a1;
    v23 = v3;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0D18458], "createWithManagedObject:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

          objc_autoreleasePoolPop(v16);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v12);
    }

    a1 = v22;
    v3 = v23;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __67__RTProximityEventStore__fetchProximityEventsFromEventIDs_handler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_getPredicateForEventIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *context;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1D8231EA8]();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("eventID"), v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  objc_autoreleasePoolPop(context);
  return v13;
}

- (void)storeProximityEvent:(id)a3 handler:(id)a4
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
  block[2] = __53__RTProximityEventStore_storeProximityEvent_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __53__RTProximityEventStore_storeProximityEvent_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeProximityEvent:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_storeProximityEvent:(id)a3 handler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v9, v7, v10, v11);
}

- (void)clearWithHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStore removeAll:handler:](self, "removeAll:handler:", v5, v4);

}

- (void)deleteProximityEventWithUUID:(id)a3 handler:(id)a4
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
  block[2] = __62__RTProximityEventStore_deleteProximityEventWithUUID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __62__RTProximityEventStore_deleteProximityEventWithUUID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteProximityEventWithUUID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deleteProximityEventWithUUID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *, void *);
  void *v17;
  id v18;
  RTProximityEventStore *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __63__RTProximityEventStore__deleteProximityEventWithUUID_handler___block_invoke;
      v17 = &unk_1E9297A30;
      v18 = v6;
      v19 = self;
      v8 = v7;
      v20 = v8;
      v9 = (void *)MEMORY[0x1D8232094](&v14);
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 0, v8, v14, v15, v16, v17);

      v10 = v18;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D18598];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("requires valid proximity event UUID.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 0, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v13);

    }
  }

}

void __63__RTProximityEventStore__deleteProximityEventWithUUID_handler___block_invoke(_QWORD *a1, void *a2)
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
  +[RTProximityEventMO fetchRequest](RTProximityEventMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("eventID"), a1[4]);
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

- (void)purgeProximityEventsPredating:(id)a3 handler:(id)a4
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
  block[2] = __63__RTProximityEventStore_purgeProximityEventsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __63__RTProximityEventStore_purgeProximityEventsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeProximityEventsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_purgeProximityEventsPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("endDate");
  v6 = a4;
  v7 = a3;
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTStore purgePredating:predicateMappings:handler:](self, "purgePredating:predicateMappings:handler:", v7, v9, v6);
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
  v12[0] = CFSTR("the proximity event store doesn't support enumeration");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return 0;
}

@end
