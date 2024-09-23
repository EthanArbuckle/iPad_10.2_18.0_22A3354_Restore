@implementation RTLearnedLocationReconcilerPerVisit

- (RTLearnedLocationReconcilerPerVisit)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_defaultsManager_distanceCalculator_reconciliationModels_);
}

- (RTLearnedLocationReconcilerPerVisit)initWithPersistenceManager:(id)a3 defaultsManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  RTLearnedLocationReconcilerPerVisit *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[RTLearnedLocationReconcilerPerVisit initWithPersistenceManager:defaultsManager:distanceCalculator:reconciliationModels:](self, "initWithPersistenceManager:defaultsManager:distanceCalculator:reconciliationModels:", v7, v6, v8, v10);

  return v11;
}

- (RTLearnedLocationReconcilerPerVisit)initWithPersistenceManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 reconciliationModels:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  RTLearnedLocationReconcilerPerVisit *v19;
  RTLearnedLocationReconcilerPerVisit *v20;
  RTLearnedLocationReconcilerPerVisit *v21;
  RTLearnedLocationReconcilerPerVisit *v22;
  NSObject *v23;
  const char *v24;
  id v25;
  id v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  uint64_t v29;
  NSArray *reconciliationModels;
  id v32;
  id obj;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTLearnedLocationReconcilerPerVisit initWithPersistenceManager:defaultsManager:distanceCalculator:reconciliationModels:]";
      v37 = 1024;
      v38 = 164;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager (in %s:%d)", buf, 0x12u);
    }

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[RTLearnedLocationReconcilerPerVisit initWithPersistenceManager:defaultsManager:distanceCalculator:reconciliationModels:]";
    v37 = 1024;
    v38 = 165;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
  }

  if (!v13)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTLearnedLocationReconcilerPerVisit initWithPersistenceManager:defaultsManager:distanceCalculator:reconciliationModels:]";
      v37 = 1024;
      v38 = 166;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_14:
  if (!objc_msgSend(v14, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTLearnedLocationReconcilerPerVisit initWithPersistenceManager:defaultsManager:distanceCalculator:reconciliationModels:]";
      v37 = 1024;
      v38 = 167;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "no reconcilation models available (in %s:%d)", buf, 0x12u);
    }

  }
  v19 = 0;
  if (v11 && v12 && v13)
  {
    if (objc_msgSend(v14, "count"))
    {
      v34.receiver = self;
      v34.super_class = (Class)RTLearnedLocationReconcilerPerVisit;
      v20 = -[RTLearnedLocationReconcilerPerVisit init](&v34, sel_init);
      v21 = v20;
      if (v20)
      {
        obj = a3;
        v22 = v20;
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v23 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = (const char *)-[RTLearnedLocationReconcilerPerVisit UTF8String](objc_retainAutorelease(v22), "UTF8String");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v22);
          v32 = a4;
          v25 = a5;
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v24 = (const char *)objc_msgSend(v26, "UTF8String");

          a5 = v25;
          a4 = v32;
        }
        v27 = dispatch_queue_create(v24, v23);

        queue = v22->_queue;
        v22->_queue = (OS_dispatch_queue *)v27;

        objc_storeStrong((id *)&v22->_persistenceManager, obj);
        objc_storeStrong((id *)&v22->_defaultsManager, a4);
        objc_storeStrong((id *)&v22->_distanceCalculator, a5);
        v29 = objc_msgSend(v14, "copy");
        reconciliationModels = v22->_reconciliationModels;
        v22->_reconciliationModels = (NSArray *)v29;

      }
      self = v21;
      v19 = self;
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (void)performReconciliationWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__RTLearnedLocationReconcilerPerVisit_performReconciliationWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __72__RTLearnedLocationReconcilerPerVisit_performReconciliationWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performReconciliationWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_performReconciliationWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  RTPersistenceManager *persistenceManager;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTLearnedLocationReconcilerPerVisit _performReconciliationWithHandler:]";
      v12 = 1024;
      v13 = 196;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  persistenceManager = self->_persistenceManager;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__RTLearnedLocationReconcilerPerVisit__performReconciliationWithHandler___block_invoke;
  v8[3] = &unk_1E929B808;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[RTPersistenceManager createManagedObjectContext:](persistenceManager, "createManagedObjectContext:", v8);

}

void __73__RTLearnedLocationReconcilerPerVisit__performReconciliationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__RTLearnedLocationReconcilerPerVisit__performReconciliationWithHandler___block_invoke_2;
    v9[3] = &unk_1E9296F70;
    v9[4] = v5;
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    dispatch_async(v6, v9);

  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("reconciliation requires a managed object context.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __73__RTLearnedLocationReconcilerPerVisit__performReconciliationWithHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconcileVisitsWithContext:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_reconcileVisitsWithContext:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    if (v7)
    {
LABEL_11:
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __75__RTLearnedLocationReconcilerPerVisit__reconcileVisitsWithContext_handler___block_invoke;
      v13[3] = &unk_1E9296F70;
      v13[4] = self;
      v14 = v6;
      v15 = v8;
      objc_msgSend(v14, "performBlock:", v13);

      goto LABEL_12;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTLearnedLocationReconcilerPerVisit _reconcileVisitsWithContext:handler:]";
      v20 = 1024;
      v21 = 223;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }

    if (v8)
    {
      v16 = *MEMORY[0x1E0CB2D50];
      v17 = CFSTR("reconciliation requires a managed object context.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v11);

      goto LABEL_12;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[RTLearnedLocationReconcilerPerVisit _reconcileVisitsWithContext:handler:]";
    v20 = 1024;
    v21 = 224;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

  if (v6)
    goto LABEL_11;
LABEL_12:

}

void __75__RTLearnedLocationReconcilerPerVisit__reconcileVisitsWithContext_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("place.mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v10[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "_visitsWithContext:predicate:sortDescriptors:error:", v5, v3, v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;

  objc_msgSend(*(id *)(a1 + 32), "_reconcileVisits:context:handler:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)reconcileVisits:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__RTLearnedLocationReconcilerPerVisit_reconcileVisits_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __63__RTLearnedLocationReconcilerPerVisit_reconcileVisits_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconcileVisits:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_reconcileVisits:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  RTPersistenceManager *persistenceManager;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  persistenceManager = self->_persistenceManager;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__RTLearnedLocationReconcilerPerVisit__reconcileVisits_handler___block_invoke;
  v11[3] = &unk_1E929B830;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[RTPersistenceManager createManagedObjectContext:](persistenceManager, "createManagedObjectContext:", v11);

}

void __64__RTLearnedLocationReconcilerPerVisit__reconcileVisits_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(v4 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__RTLearnedLocationReconcilerPerVisit__reconcileVisits_handler___block_invoke_2;
    block[3] = &unk_1E9297EB8;
    block[4] = v4;
    v10 = v5;
    v11 = v3;
    v12 = *(id *)(a1 + 48);
    dispatch_async(v6, block);

  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("reconciliation requires a managed object context.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __64__RTLearnedLocationReconcilerPerVisit__reconcileVisits_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconcileVisits:context:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)reconcileVisits:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
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
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__RTLearnedLocationReconcilerPerVisit_reconcileVisits_context_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __71__RTLearnedLocationReconcilerPerVisit_reconcileVisits_context_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconcileVisits:context:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_reconcileVisits:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  RTLearnedLocationReconcilerPerVisit *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTLearnedLocationReconcilerPerVisit _reconcileVisits:context:handler:]";
      v22 = 1024;
      v23 = 307;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__RTLearnedLocationReconcilerPerVisit__reconcileVisits_context_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v13, "performBlock:", v15);

}

void __72__RTLearnedLocationReconcilerPerVisit__reconcileVisits_context_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "collapseVisits:context:", v2, *(_QWORD *)(a1 + 48));
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__42;
  v5[4] = __Block_byref_object_dispose__42;
  v6 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__RTLearnedLocationReconcilerPerVisit__reconcileVisits_context_handler___block_invoke_21;
  v4[3] = &unk_1E929B858;
  v4[4] = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterUsingPredicate:", v3);
  objc_msgSend(*(id *)(a1 + 40), "collapseReconciledVisitsToLocationsOfInterest:context:handler:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  _Block_object_dispose(v5, 8);
}

uint64_t __72__RTLearnedLocationReconcilerPerVisit__reconcileVisits_context_handler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;

  v6 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v8 + 40))
  {
    objc_msgSend(v6, "entryDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "exitDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isAfterDate:", v10);

    if (!v11)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v8 + 40), a2);
  v12 = 1;
LABEL_6:

  return v12;
}

- (void)collapseReconciledVisitsToLocationsOfInterest:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  RTLearnedLocationReconcilerPerVisit *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTLearnedLocationReconcilerPerVisit collapseReconciledVisitsToLocationsOfInterest:context:handler:]";
      v22 = 1024;
      v23 = 336;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __101__RTLearnedLocationReconcilerPerVisit_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v13, "performBlock:", v15);

}

void __101__RTLearnedLocationReconcilerPerVisit_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke(uint64_t a1)
{
  void *v2;
  RTLearnedTransition *v3;
  uint64_t i;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
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
  uint64_t v23;
  void *v24;
  uint64_t v25;
  RTLearnedLocation *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  int v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  RTLearnedPlace *v65;
  void *v66;
  void *v67;
  RTLearnedTransition *v68;
  void *v69;
  void *v70;
  RTLearnedLocation *v71;
  RTLearnedLocationOfInterest *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  RTLearnedLocationOfInterest *v77;
  RTLearnedTransition *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  int v100;
  int v101;
  uint64_t v102;
  RTLearnedTransition *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  RTLearnedLocation *v113;
  void *v114;
  RTLearnedLocationOfInterest *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  _QWORD *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id obj;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  RTLearnedTransition *v143;
  RTLearnedPlace *v144;
  RTLearnedPlace *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  RTLearnedTransition *v152;
  RTLearnedVisit *v153;
  RTLearnedTransition *v154;
  uint64_t v155;
  _QWORD v156[5];
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  RTLearnedTransition *v161;
  void *v162;
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v121 = (_QWORD *)a1;
  obj = *(id *)(a1 + 32);
  v137 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v163, 16);
  v3 = 0;
  if (v137)
  {
    v136 = *(_QWORD *)v158;
    v138 = v2;
    do
    {
      for (i = 0; i != v137; i = v79 + 1)
      {
        v152 = v3;
        if (*(_QWORD *)v158 != v136)
          objc_enumerationMutation(obj);
        v141 = i;
        v5 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * i);
        v140 = MEMORY[0x1D8231EA8]();
        v156[0] = MEMORY[0x1E0C809B0];
        v156[1] = 3221225472;
        v156[2] = __101__RTLearnedLocationReconcilerPerVisit_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_2;
        v156[3] = &unk_1E929B880;
        v156[4] = v5;
        v148 = objc_msgSend(v2, "indexOfObjectPassingTest:", v156);
        v6 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend(v5, "locationLatitude");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "doubleValue");
        v9 = v8;
        objc_msgSend(v5, "locationLongitude");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;
        objc_msgSend(v5, "locationHorizontalUncertainty");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;
        objc_msgSend(v5, "locationAltitude");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;
        objc_msgSend(v5, "locationVerticalUncertainty");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;
        objc_msgSend(v5, "locationReferenceFrame");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "intValue");
        objc_msgSend(v5, "locationSourceAccuracy");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v6, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v23, (int)objc_msgSend(v24, "intValue"), v9, v12, v15, v18, v21, 0.0);

        v26 = [RTLearnedLocation alloc];
        objc_msgSend(v5, "dataPointCount");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "unsignedIntegerValue");
        objc_msgSend(v5, "confidence");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v146 = (void *)v25;
        v30 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](v26, "initWithLocation:dataPointCount:confidence:", v25, v28);

        v153 = [RTLearnedVisit alloc];
        objc_msgSend(v5, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "entryDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "exitDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "creationDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (uint64_t)v34;
        if (!v34)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v35 = objc_claimAutoreleasedReturnValue();
          v128 = (void *)v35;
        }
        objc_msgSend(v5, "expirationDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "placeConfidence");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
        v39 = v38;
        objc_msgSend(v5, "placeSource");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = (void *)v30;
        v41 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v153, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v31, v30, v32, v33, v35, v36, v39, objc_msgSend(v40, "unsignedIntegerValue"));

        if (!v34)
        v147 = (void *)v41;
        if (v148 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v5, "place");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            v43 = (void *)MEMORY[0x1E0D183E8];
            objc_msgSend(v5, "place");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "mapItem");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "createWithManagedObject:", v45);
            v154 = (RTLearnedTransition *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v154 = 0;
          }
          v145 = [RTLearnedPlace alloc];
          objc_msgSend(v5, "place");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "identifier");
          v82 = objc_claimAutoreleasedReturnValue();
          v83 = (void *)v82;
          if (!v82)
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v82 = objc_claimAutoreleasedReturnValue();
            v124 = (void *)v82;
          }
          v129 = v82;
          objc_msgSend(v5, "place");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "type");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v131, "unsignedIntegerValue");
          objc_msgSend(v5, "place");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "typeSource");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v86, "unsignedIntegerValue");
          objc_msgSend(v5, "place");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "customLabel");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "expirationDate");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v145, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v129, v84, v87, v154, v89, v90, v91);

          if (!v83)
          -[RTLearnedTransition device](v152, "device");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "identifier");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "device");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "identifier");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedTransition outbound](v152, "outbound");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "predominantMotionActivityType");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend(v95, "unsignedIntegerValue");
          objc_msgSend(v5, "inbound");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "predominantMotionActivityType");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend(v98, "unsignedIntegerValue");
          v100 = objc_msgSend(v92, "isEqual:", v93);
          if (v96 == v99)
            v101 = 1;
          else
            v101 = v100;
          if (v101)
            v102 = v99;
          else
            v102 = 0;
          v135 = v102;

          v103 = [RTLearnedTransition alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedTransition exitDate](v152, "exitDate");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = (uint64_t)v104;
          if (!v104)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v105 = objc_claimAutoreleasedReturnValue();
            v126 = (void *)v105;
          }
          objc_msgSend(v5, "entryDate");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedTransition identifier](v152, "identifier");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = (uint64_t)v107;
          if (!v107)
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "nilUUID");
            v108 = objc_claimAutoreleasedReturnValue();
            v125 = (void *)v108;
          }
          objc_msgSend(v5, "identifier");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "expirationDate");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v103, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v151, v105, v106, v108, v109, v110, v111, v135);

          if (!v107)
          v2 = v138;
          v81 = v139;
          v78 = v154;
          if (!v104)

          v112 = v147;
          if (!v147 || !v68)
          {

            v3 = v152;
            v80 = (void *)v140;
            v79 = v141;
            goto LABEL_60;
          }
          v113 = [RTLearnedLocation alloc];
          objc_msgSend(v5, "locationSourceAccuracy");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v113, "initWithLocation:dataPointCount:type:", v146, objc_msgSend(v114, "intValue") == 2, 2);

          v115 = [RTLearnedLocationOfInterest alloc];
          -[RTLearnedPlace identifier](v144, "identifier");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v162 = v147;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v162, 1);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v161 = v68;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v161, 1);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v115, "initWithIdentifier:location:place:visits:transitions:", v116, v71, v144, v117, v118);

          if (v77)
          {
            v2 = v138;
            objc_msgSend(v138, "addObject:", v77);
            v78 = v152;
            v80 = (void *)v140;
            v79 = v141;
          }
          else
          {
            v78 = v152;
            v80 = (void *)v140;
            v79 = v141;
            v2 = v138;
          }
        }
        else
        {
          -[RTLearnedTransition device](v152, "device");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "identifier");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "device");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedTransition outbound](v152, "outbound");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "predominantMotionActivityType");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "unsignedIntegerValue");
          objc_msgSend(v5, "inbound");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "predominantMotionActivityType");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "unsignedIntegerValue");
          v53 = objc_msgSend(v130, "isEqual:", v46);
          if (v49 == v52)
            v54 = 1;
          else
            v54 = v53;
          if (v54)
            v55 = v52;
          else
            v55 = 0;
          v155 = v55;

          v143 = [RTLearnedTransition alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedTransition exitDate](v152, "exitDate");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (uint64_t)v57;
          if (!v57)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v58 = objc_claimAutoreleasedReturnValue();
            v123 = (void *)v58;
          }
          objc_msgSend(v5, "entryDate");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedTransition identifier](v152, "identifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (uint64_t)v60;
          if (!v60)
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "nilUUID");
            v61 = objc_claimAutoreleasedReturnValue();
            v122 = (void *)v61;
          }
          objc_msgSend(v5, "identifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "expirationDate");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v143, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v56, v58, v59, v61, v62, v63, v64, v155);

          if (!v60)
          v2 = v138;
          if (!v57)

          objc_msgSend(v138, "objectAtIndex:", v148);
          v65 = (RTLearnedPlace *)objc_claimAutoreleasedReturnValue();
          v66 = (void *)MEMORY[0x1E0C99DE8];
          -[RTLearnedPlace visits](v65, "visits");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "arrayWithArray:", v67);
          v68 = (RTLearnedTransition *)objc_claimAutoreleasedReturnValue();

          if (v147)
            -[RTLearnedTransition addObject:](v68, "addObject:");
          v69 = (void *)MEMORY[0x1E0C99DE8];
          -[RTLearnedPlace transitions](v65, "transitions");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "arrayWithArray:", v70);
          v71 = (RTLearnedLocation *)objc_claimAutoreleasedReturnValue();

          if (v154)
            -[RTLearnedLocation addObject:](v71, "addObject:");
          v72 = [RTLearnedLocationOfInterest alloc];
          -[RTLearnedPlace place](v65, "place");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "identifier");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLearnedPlace location](v65, "location");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = v65;
          -[RTLearnedPlace place](v65, "place");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v72, "initWithIdentifier:location:place:visits:transitions:", v74, v75, v76, v68, v71);

          if (v77)
            objc_msgSend(v138, "setObject:atIndexedSubscript:", v77, v148);
          v78 = v152;
          v80 = (void *)v140;
          v79 = v141;
          v81 = v139;
        }

        v3 = v5;
        v112 = v147;
LABEL_60:

        objc_autoreleasePoolPop(v80);
      }
      v137 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v163, 16);
    }
    while (v137);
  }

  logReconciledGraph(v2, 0);
  objc_msgSend((id)objc_opt_class(), "submitMetricsOnReconciledGraphDensity:algorithm:persistenceManager:managedObjectContext:", v121[4], 0, *(_QWORD *)(v121[5] + 16), v121[6]);
  v119 = v121[7];
  if (v119)
  {
    v120 = (void *)objc_msgSend(v2, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v119 + 16))(v119, v120, 0);

  }
}

uint64_t __101__RTLearnedLocationReconcilerPerVisit_collapseReconciledVisitsToLocationsOfInterest_context_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x1E0D183E8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "place");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createWithManagedObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "place");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToMapItem:", v7);

  return v10;
}

- (void)collapseVisits:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  RTLearnedLocationReconcilerPerVisit *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTLearnedLocationReconcilerPerVisit collapseVisits:context:]";
      v17 = 1024;
      v18 = 473;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke;
  v11[3] = &unk_1E9299D78;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v9, "performBlockAndWait:", v11);

}

unint64_t __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke(id *a1)
{
  unint64_t result;
  unint64_t i;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1[4], "count");
  if (result)
  {
    result = objc_msgSend(a1[4], "count");
    if (result)
    {
      for (i = 0; i < result; ++i)
      {
        v4 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(a1[4], "objectAtIndexedSubscript:", i);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = a1[4];
        v7 = (void *)MEMORY[0x1E0CB3880];
        v8 = MEMORY[0x1E0C809B0];
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke_2;
        v37[3] = &unk_1E929B8A8;
        v9 = v5;
        v38 = v9;
        objc_msgSend(v7, "predicateWithBlock:", v37);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "filteredArrayUsingPredicate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0CB3880];
        v34[0] = v8;
        v34[1] = 3221225472;
        v34[2] = __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke_3;
        v34[3] = &unk_1E929B8D0;
        v13 = v9;
        v14 = a1[5];
        v35 = v13;
        v36 = v14;
        objc_msgSend(v12, "predicateWithBlock:", v34);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "filteredArrayUsingPredicate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "count"))
        {
          v32 = v11;
          v33 = v4;
          v17 = (void *)objc_opt_new();
          +[RTDeviceMO fetchRequest](RTDeviceMO, "fetchRequest");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "executeFetchRequest:error:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          objc_msgSend(v17, "setDevices:", v18);

          objc_msgSend(v17, "setOverlappingVisits:", v16);
          v19 = a1[5];
          objc_msgSend(v19, "_currentModel");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_findWinner:currentVisit:model:modelContext:", v16, v13, v20, v17);
          v21 = (id)objc_claimAutoreleasedReturnValue();

          v22 = v21;
          v23 = (void *)objc_opt_new();
          objc_msgSend(a1[5], "_visitFollowingVisit:visits:", v13, a1[4]);
          v24 = objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = (void *)v24;
            while ((objc_msgSend(v25, "overlapsWithVisit:", v22) & 1) != 0)
            {
              objc_msgSend(v23, "addObject:", v25);
              objc_msgSend(a1[5], "_visitFollowingVisit:visits:", v25, a1[4]);
              v26 = objc_claimAutoreleasedReturnValue();

              v25 = (void *)v26;
              if (!v26)
                goto LABEL_12;
            }

          }
LABEL_12:
          objc_msgSend(v23, "removeObject:", v22);
          if (v21 != v13)
            objc_msgSend(v23, "addObject:", v13);
          objc_msgSend(a1[4], "removeObjectsInArray:", v23);
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = a1[4];
          v39[0] = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "sortUsingDescriptors:", v29);

          v11 = v32;
          v4 = v33;
        }
        else
        {
          objc_msgSend(a1[4], "removeObjectsInArray:", v11);
        }

        objc_autoreleasePoolPop(v4);
        result = objc_msgSend(a1[4], "count");
      }
    }
  }
  return result;
}

BOOL __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "entryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "exitDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isAfterDate:", v5);

  v7 = (v6 & 1) == 0
    && (objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "overlapsWithVisit:", v3) & 1) != 0;

  return v7;
}

uint64_t __62__RTLearnedLocationReconcilerPerVisit_collapseVisits_context___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intersectsWithVisit:distanceCalculator:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
}

- (id)_currentModel
{
  void *v2;
  void *v3;

  -[RTLearnedLocationReconcilerPerVisit reconciliationModels](self, "reconciliationModels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_findWinner:(id)a3 currentVisit:(id)a4 model:(id)a5 modelContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v10;
  objc_msgSend(v11, "weightForVisit:modelContext:", v13, v12);
  v15 = v14;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v18 = v13;
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v28;
    v18 = v13;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "weightForVisit:modelContext:", v22, v12, (_QWORD)v27);
        if (v23 > v15)
        {
          v24 = v23;
          v25 = v22;

          v15 = v24;
          v18 = v25;
        }
      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }

  return v18;
}

- (id)_visitFollowingVisit:(id)a3 visits:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !objc_msgSend(v6, "count"))
    goto LABEL_9;
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[RTLearnedLocationReconcilerPerVisit _visitFollowingVisit:visits:]";
      v15 = 1024;
      v16 = 593;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "current visit is not found in the array! (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }

  }
  v10 = v8 + 1;
  if (v10 < objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (id)_visitsWithContext:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__42;
  v33 = __Block_byref_object_dispose__42;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__42;
  v27 = __Block_byref_object_dispose__42;
  v28 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__RTLearnedLocationReconcilerPerVisit__visitsWithContext_predicate_sortDescriptors_error___block_invoke;
  v17[3] = &unk_1E929B8F8;
  v12 = v10;
  v18 = v12;
  v13 = v11;
  v19 = v13;
  v21 = &v29;
  v14 = v9;
  v20 = v14;
  v22 = &v23;
  objc_msgSend(v14, "performBlockAndWait:", v17);
  if (a6)
    *a6 = objc_retainAutorelease((id)v24[5]);
  v15 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __90__RTLearnedLocationReconcilerPerVisit__visitsWithContext_predicate_sortDescriptors_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", a1[4]);
  objc_msgSend(v2, "setSortDescriptors:", a1[5]);
  objc_msgSend(v2, "setFetchBatchSize:", 100);
  v3 = (void *)a1[6];
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (NSArray)reconciliationModels
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReconciliationModels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconciliationModels, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)submitMetricsOnReconciledGraphDensity:(id)a3 algorithm:(unint64_t)a4 persistenceManager:(id)a5 managedObjectContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  uint8_t buf[16];

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __136__RTLearnedLocationReconcilerPerVisit_Metrics__submitMetricsOnReconciledGraphDensity_algorithm_persistenceManager_managedObjectContext___block_invoke;
    v14[3] = &unk_1E9298238;
    v15 = v11;
    v16 = v9;
    v17 = v10;
    v18 = a4;
    objc_msgSend(v15, "performBlockAndWait:", v14);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

  }
}

void __136__RTLearnedLocationReconcilerPerVisit_Metrics__submitMetricsOnReconciledGraphDensity_algorithm_persistenceManager_managedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  _BOOL8 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  id obj;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  id v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  void *v107;
  _BYTE v108[128];
  void *v109;
  _BYTE v110[128];
  _QWORD v111[3];

  v111[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == $RT_CURRENT_DEVICE"), CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v111[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  v7 = *(void **)(a1 + 32);
  v103 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v4, &v103);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v103;
  if (!v9)
  {
    v89 = a1;
    v84 = v4;
    v85 = v3;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -4838400.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v8, "count");
    v83 = v8;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v100;
      do
      {
        v15 = v10;
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v100 != v14)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * i), "entryDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isOnOrAfter:", v92);

          v13 += v18;
        }
        v10 = v15;
        v12 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != $RT_CURRENT_DEVICE"), CFSTR("device"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v85;
    v109 = v85;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSortDescriptors:", v21);

    objc_msgSend(v20, "setPredicate:", v19);
    v22 = *(void **)(v89 + 32);
    v98 = 0;
    objc_msgSend(v22, "executeFetchRequest:error:", v20, &v98);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v98;
    if (!v9)
    {
      v77 = v10;
      v79 = v2;
      v80 = v23;
      v78 = v20;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      obj = *(id *)(v89 + 40);
      v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
      v81 = v19;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      if (v90)
      {
        v87 = *(_QWORD *)v95;
        do
        {
          for (j = 0; j != v90; ++j)
          {
            if (*(_QWORD *)v95 != v87)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
            objc_msgSend(v29, "device");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v89 + 32), "currentDevice");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "isEqual:", v31);

            objc_msgSend(v29, "entryDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "isOnOrAfter:", v92);

            if (v32)
              v25 += v34;
            else
              v24 += v34;
            if (v32)
              ++v27;
            else
              ++v26;
          }
          v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
        }
        while (v90);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v77);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObjectsFromArray:", v80);
      v3 = v85;
      v107 = v85;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sortUsingDescriptors:", v36);

      v91 = v35;
      objc_msgSend(v35, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "creationDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v88 = v38;
      objc_msgSend(v38, "timeIntervalSinceReferenceDate");
      v40 = v39;
      v105 = CFSTR("RT_CURRENT_DEVICE");
      objc_msgSend(*(id *)(v89 + 32), "currentDevice");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "predicateWithSubstitutionVariables:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v89 + 40), "filteredArrayUsingPredicate:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v85;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "sortedArrayUsingDescriptors:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "creationDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = v48;
      objc_msgSend(v48, "timeIntervalSinceReferenceDate");
      v50 = v27 + v26;
      v51 = 0.0;
      if (v82 < 1)
      {
        v52 = INFINITY;
        v53 = 0.0;
      }
      else
      {
        v52 = (double)((double)(v50 - v82) / (double)v82 * 100.0);
        v53 = (double)((double)(v82 - v27) / (double)v82 * 100.0);
      }
      v54 = v40 - v49;
      if (v13 >= 1)
        v55 = (double)(v25 + v24) / (double)v13;
      else
        v55 = 1.0;
      v56 = 0.0;
      if (v50 >= 1)
      {
        v57 = (double)v27 / (double)v50;
        v51 = (double)(v57 * 100.0);
        v56 = (double)((1.0 - v57) * 100.0);
      }
      +[RTDeviceMO fetchRequest](RTDeviceMO, "fetchRequest");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = *(void **)(v89 + 32);
      v93 = 0;
      v60 = objc_msgSend(v59, "countForFetchRequest:error:", v58, &v93);
      v61 = v93;
      v62 = objc_msgSend(*(id *)(v89 + 48), "mirroringDelegateStateForStoreType:", 1) == 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v63, CFSTR("reconciledGraphVisitCountImprovement"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v64, CFSTR("reconciledGraphVisitContributionThisDevice"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v65, CFSTR("reconciledGraphVisitContributionOtherDevices"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v66, CFSTR("reconciledGraphVisitLoss"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v67, CFSTR("reconciledGraphDensity"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v68, CFSTR("ageOfOldestVisit"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v89 + 56));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v69, CFSTR("algorithmType"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v70, CFSTR("ageDifferenceOldestVisit"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v62);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v71, CFSTR("syncEnabled"));

      if (v60 == 1)
        v72 = MEMORY[0x1E0C9AAA0];
      else
        v72 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v72, CFSTR("multiDevice"));
      v73 = objc_alloc(MEMORY[0x1E0CB3940]);
      v74 = (void *)objc_msgSend(v73, "initWithCString:encoding:", RTAnalyticsEventReconciliationGraphDensity, 1);
      log_analytics_submission(v74, v79);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      v2 = v79;
      v23 = v80;
      v19 = v81;
      v9 = 0;
      v20 = v78;
    }

    v8 = v83;
    v4 = v84;
  }

}

@end
