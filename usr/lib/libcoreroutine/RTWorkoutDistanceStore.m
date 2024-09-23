@implementation RTWorkoutDistanceStore

- (void)storeWorkoutDistances:(id)a3 handler:(id)a4
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
  block[2] = __56__RTWorkoutDistanceStore_storeWorkoutDistances_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __56__RTWorkoutDistanceStore_storeWorkoutDistances_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeWorkoutDistances:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)predicateForObjectIDs:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t buf[16];

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: objectIDs", buf, 2u);
    }

    v3 = 0;
  }
  return v3;
}

+ (id)propertyDictionaryForIsVisited:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("isVisited");
  v3 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expressionForConstantValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateWorkoutDistancesWithObjectIDs:(id)a3 isVisited:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  RTWorkoutDistanceStore *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__RTWorkoutDistanceStore_updateWorkoutDistancesWithObjectIDs_isVisited_handler___block_invoke;
  v13[3] = &unk_1E92970B0;
  v14 = v8;
  v15 = self;
  v17 = a4;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __80__RTWorkoutDistanceStore_updateWorkoutDistancesWithObjectIDs_isVisited_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "propertyDictionaryForIsVisited:", *(unsigned __int8 *)(a1 + 56));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateWorkoutDistancesWithPredicate:propertiesDictionary:handler:", 0, v6, *(_QWORD *)(a1 + 48));
    goto LABEL_5;
  }
  if (objc_msgSend(v2, "count"))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "predicateForObjectIDs:", *(_QWORD *)(a1 + 32));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "propertyDictionaryForIsVisited:", *(unsigned __int8 *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateWorkoutDistancesWithPredicate:propertiesDictionary:handler:", v6, v4, *(_QWORD *)(a1 + 48));

LABEL_5:
    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_updateWorkoutDistancesWithPredicate:(id)a3 propertiesDictionary:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  RTWorkoutDistanceStore *v20;
  id v21;
  id v22;
  SEL v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v10 && objc_msgSend(v10, "count"))
    {
      v12 = (void *)MEMORY[0x1D8231EA8]();
      v13 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __92__RTWorkoutDistanceStore__updateWorkoutDistancesWithPredicate_propertiesDictionary_handler___block_invoke;
      v18[3] = &unk_1E929D938;
      v19 = v9;
      v20 = self;
      v23 = a2;
      v21 = v10;
      v14 = v11;
      v22 = v14;
      v15 = (void *)MEMORY[0x1D8232094](v18);
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __92__RTWorkoutDistanceStore__updateWorkoutDistancesWithPredicate_propertiesDictionary_handler___block_invoke_14;
      v16[3] = &unk_1E9297568;
      v17 = v14;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v15, 2, v16);

      objc_autoreleasePoolPop(v12);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
    }
  }

}

void __92__RTWorkoutDistanceStore__updateWorkoutDistancesWithPredicate_propertiesDictionary_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  objc_class *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C97AB0];
  v4 = a2;
  v5 = [v3 alloc];
  +[RTWorkoutDistanceMO entity](RTWorkoutDistanceMO, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntity:", v6);

  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@, %@, predicate, %@", buf, 0x20u);

    }
    objc_msgSend(v7, "setPredicate:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(v7, "setPropertiesToUpdate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v7, "setResultType:", 2);
  v27 = 0;
  objc_msgSend(v4, "executeRequest:error:", v7, &v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v27;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12)
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "result");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413314;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      v32 = 2112;
      v33 = v22;
      v34 = 2112;
      v35 = v23;
      v36 = 2112;
      v37 = v10;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, batchupdate result, %@, properties dictionary, %@, error, %@", buf, 0x34u);

    }
    v13 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v9, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, objc_msgSend(v14, "integerValue"), v10);

  }
  else
  {
    if (v12)
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v25;
      v30 = 2112;
      v31 = v26;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, batchupdate result is nil", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __92__RTWorkoutDistanceStore__updateWorkoutDistancesWithPredicate_propertiesDictionary_handler___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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

- (void)deleteWorkoutDistanceWithWorkoutUUID:(id)a3 handler:(id)a4
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
  block[2] = __71__RTWorkoutDistanceStore_deleteWorkoutDistanceWithWorkoutUUID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __71__RTWorkoutDistanceStore_deleteWorkoutDistanceWithWorkoutUUID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteWorkoutDistanceWithWorkoutUUID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deleteWorkoutDistanceWithWorkoutUUID:(id)a3 handler:(id)a4
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
  RTWorkoutDistanceStore *v19;
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
      v16 = __72__RTWorkoutDistanceStore__deleteWorkoutDistanceWithWorkoutUUID_handler___block_invoke;
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
      v22[0] = CFSTR("requires valid workouts.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 0, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v13);

    }
  }

}

void __72__RTWorkoutDistanceStore__deleteWorkoutDistanceWithWorkoutUUID_handler___block_invoke(_QWORD *a1, void *a2)
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
  +[RTWorkoutDistanceMO fetchRequest](RTWorkoutDistanceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %@) || (%K == %@)"), CFSTR("firstWorkout"), a1[4], CFSTR("secondWorkout"), a1[4]);
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

- (void)fetchUniqueWorkoutUUIDsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__RTWorkoutDistanceStore_fetchUniqueWorkoutUUIDsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __61__RTWorkoutDistanceStore_fetchUniqueWorkoutUUIDsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchUniqueWorkoutUUIDsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchUniqueWorkoutUUIDsWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__RTWorkoutDistanceStore__fetchUniqueWorkoutUUIDsWithHandler___block_invoke;
  v12[3] = &unk_1E9297A08;
  v12[4] = self;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  v8 = (void *)MEMORY[0x1D8232094](v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __62__RTWorkoutDistanceStore__fetchUniqueWorkoutUUIDsWithHandler___block_invoke_28;
  v10[3] = &unk_1E9297568;
  v11 = v7;
  v9 = v7;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v8, 1, v10);

}

void __62__RTWorkoutDistanceStore__fetchUniqueWorkoutUUIDsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTWorkoutDistanceMO fetchRequest](RTWorkoutDistanceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setReturnsDistinctResults:", 1);
  v29[0] = CFSTR("firstWorkout");
  v29[1] = CFSTR("secondWorkout");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v5);

  objc_msgSend(v4, "setResultType:", 2);
  v18 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v18;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "valueForKey:", CFSTR("firstWorkout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("secondWorkout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "addObjectsFromArray:", v9);
  if (v10)
    objc_msgSend(v8, "addObjectsFromArray:", v10);
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138413314;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v4;
    v25 = 2048;
    v26 = v17;
    v27 = 2112;
    v28 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, results count, %lu, error, %@", buf, 0x34u);

  }
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v7);

}

uint64_t __62__RTWorkoutDistanceStore__fetchUniqueWorkoutUUIDsWithHandler___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTotalWorkoutDistancesCountWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__RTWorkoutDistanceStore_fetchTotalWorkoutDistancesCountWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __69__RTWorkoutDistanceStore_fetchTotalWorkoutDistancesCountWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTotalWorkoutDistancesCountWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchTotalWorkoutDistancesCountWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithHandler___block_invoke;
  v12[3] = &unk_1E9297A08;
  v12[4] = self;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  v8 = (void *)MEMORY[0x1D8232094](v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __70__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithHandler___block_invoke_29;
  v10[3] = &unk_1E9297568;
  v11 = v7;
  v9 = v7;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v8, 1, v10);

}

void __70__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTWorkoutDistanceMO fetchRequest](RTWorkoutDistanceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v5 = objc_msgSend(v3, "countForFetchRequest:error:", v4, &v11);

  v6 = v11;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v4;
    v18 = 2048;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, total workout distances count, %lu, error, %@", buf, 0x34u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __70__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTotalWorkoutDistancesCountWithClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  double v24;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __134__RTWorkoutDistanceStore_fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke;
  v19[3] = &unk_1E9297E20;
  v19[4] = self;
  v20 = v12;
  v22 = v14;
  v23 = a5;
  v24 = a6;
  v21 = v13;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(v15, v19);

}

uint64_t __134__RTWorkoutDistanceStore_fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTotalWorkoutDistancesCountWithClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(double *)(a1 + 72));
}

- (void)_fetchTotalWorkoutDistancesCountWithClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  int64_t v26;
  double v27;
  SEL v28;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (objc_msgSend(v13, "count") && objc_msgSend(v14, "count"))
  {
    v16 = (void *)MEMORY[0x1D8231EA8]();
    v17 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __135__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke;
    v22[3] = &unk_1E92A0278;
    v22[4] = self;
    v23 = v13;
    v24 = v14;
    v26 = a5;
    v27 = a6;
    v28 = a2;
    v18 = v15;
    v25 = v18;
    v19 = (void *)MEMORY[0x1D8232094](v22);
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __135__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke_30;
    v20[3] = &unk_1E9297568;
    v21 = v18;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v19, 1, v20);

    objc_autoreleasePoolPop(v16);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
  }

}

void __135__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTWorkoutDistanceMO fetchRequest](RTWorkoutDistanceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_getCrossJoinPredicateForClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, %@, predicate, %@", buf, 0x20u);

  }
  v17 = 0;
  v7 = objc_msgSend(v3, "countForFetchRequest:error:", v4, &v17);

  v8 = v17;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v4;
    v24 = 2048;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, total workout distances count, %lu, error, %@", buf, 0x34u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __135__RTWorkoutDistanceStore__fetchTotalWorkoutDistancesCountWithClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_handler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_getCrossJoinPredicateForClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *context;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v33 = a4;
  v30 = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %lu AND %K <= %f"), CFSTR("workoutActivityType"), a5, CFSTR("distance"), *(_QWORD *)&a6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v9;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v34)
  {
    v32 = *(_QWORD *)v42;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(obj);
        v36 = v11;
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
        context = (void *)MEMORY[0x1D8231EA8]();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v13 = v33;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v38;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v38 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v17);
              v19 = (void *)MEMORY[0x1D8231EA8]();
              v20 = v12;
              v21 = v18;
              if (objc_msgSend(v20, "compare:", v21) == 1)
              {
                v22 = v21;

                v21 = v20;
                v20 = v22;
              }
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ AND %K == %@"), CFSTR("firstWorkout"), v20, CFSTR("secondWorkout"), v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v23);

              objc_autoreleasePoolPop(v19);
              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v15);
        }

        objc_autoreleasePoolPop(context);
        v11 = v36 + 1;
      }
      while (v36 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v34);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB3528];
  v45[0] = v29;
  v45[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "andPredicateWithSubpredicates:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeAllObjects");
  objc_autoreleasePoolPop(v30);

  return v27;
}

- (void)fetchWorkoutDistancesWithOffset:(unint64_t)a3 limit:(unint64_t)a4 maxDistanceThreshold:(double)a5 includeVisitedRecords:(BOOL)a6 handler:(id)a7
{
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  BOOL v20;

  v12 = a7;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115__RTWorkoutDistanceStore_fetchWorkoutDistancesWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke;
  v15[3] = &unk_1E92A02A0;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  dispatch_async(v13, v15);

}

uint64_t __115__RTWorkoutDistanceStore_fetchWorkoutDistancesWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWorkoutsWithOffset:limit:maxDistanceThreshold:includeVisitedRecords:handler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));
}

- (void)_fetchWorkoutsWithOffset:(unint64_t)a3 limit:(unint64_t)a4 maxDistanceThreshold:(double)a5 includeVisitedRecords:(BOOL)a6 handler:(id)a7
{
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  SEL v26;
  BOOL v27;

  v13 = a7;
  v14 = (void *)MEMORY[0x1D8231EA8]();
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __108__RTWorkoutDistanceStore__fetchWorkoutsWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke;
  v21[3] = &unk_1E92A02C8;
  v23 = a5;
  v27 = a6;
  v24 = a4;
  v25 = a3;
  v21[4] = self;
  v26 = a2;
  v16 = v13;
  v22 = v16;
  v17 = (void *)MEMORY[0x1D8232094](v21);
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __108__RTWorkoutDistanceStore__fetchWorkoutsWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke_47;
  v19[3] = &unk_1E9297568;
  v18 = v16;
  v20 = v18;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v17, 1, v19);

  objc_autoreleasePoolPop(v14);
}

void __108__RTWorkoutDistanceStore__fetchWorkoutsWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  _QWORD v45[6];

  v45[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTWorkoutDistanceMO fetchRequest](RTWorkoutDistanceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("workoutActivityType"), 1);
  v45[0] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("distance"), 1);
  v45[1] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 1);
  v45[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v8);

  v9 = (void *)MEMORY[0x1E0CB3880];
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("(%K <= %f AND %K == %@)"), CFSTR("distance"), v10, CFSTR("isVisited"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v12);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchLimit:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setFetchOffset:", *(_QWORD *)(a1 + 64));
  v33 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v33;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 138413314;
    v36 = v24;
    v37 = 2112;
    v38 = v25;
    v39 = 2112;
    v40 = v4;
    v41 = 2048;
    v42 = v26;
    v43 = 2112;
    v44 = v14;
    _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, results count, %lu, error, %@", buf, 0x34u);

  }
  v16 = (void *)objc_opt_new();
  if (!v14 && objc_msgSend(v13, "count"))
  {
    v27 = v13;
    v28 = v3;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = v13;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          +[RTWorkoutDistance createWithManagedObject:](RTWorkoutDistance, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v19);
    }

    v13 = v27;
    v3 = v28;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __108__RTWorkoutDistanceStore__fetchWorkoutsWithOffset_limit_maxDistanceThreshold_includeVisitedRecords_handler___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutDistanceWithFirstWorkout:(id)a3 secondWorkout:(id)a4 handler:(id)a5
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
  v15[2] = __85__RTWorkoutDistanceStore_fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke;
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

uint64_t __85__RTWorkoutDistanceStore_fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWorkoutDistanceWithFirstWorkout:secondWorkout:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchWorkoutDistanceWithFirstWorkout:(id)a3 secondWorkout:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  RTWorkoutDistanceStore *v24;
  id v25;
  SEL v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9 && v10)
    {
      v12 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __86__RTWorkoutDistanceStore__fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke;
      v21[3] = &unk_1E929D938;
      v22 = v9;
      v23 = v10;
      v24 = self;
      v26 = a2;
      v13 = v11;
      v25 = v13;
      v14 = (void *)MEMORY[0x1D8232094](v21);
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __86__RTWorkoutDistanceStore__fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke_50;
      v19[3] = &unk_1E9297568;
      v20 = v13;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v14, 1, v19);

      v15 = v22;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v27 = *MEMORY[0x1E0CB2D50];
      v28[0] = CFSTR("requires valid workouts.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 0, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v18);

    }
  }

}

void __86__RTWorkoutDistanceStore__fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTWorkoutDistanceMO fetchRequest](RTWorkoutDistanceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  if (objc_msgSend(v5, "compare:", v6) == 1)
  {
    v7 = v6;

    v6 = v5;
    v5 = v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %@ AND %K == %@)"), CFSTR("firstWorkout"), v5, CFSTR("secondWorkout"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  v19 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v19;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 138413314;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v4;
    v26 = 2048;
    v27 = v18;
    v28 = 2112;
    v29 = v10;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, results count, %lu, error, %@", buf, 0x34u);

  }
  v12 = (void *)objc_opt_new();
  if (!v10 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTWorkoutDistance createWithManagedObject:](RTWorkoutDistance, "createWithManagedObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __86__RTWorkoutDistanceStore__fetchWorkoutDistanceWithFirstWorkout_secondWorkout_handler___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWorkoutDistancesWithWorkout:(id)a3 handler:(id)a4
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
  block[2] = __67__RTWorkoutDistanceStore_fetchWorkoutDistancesWithWorkout_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __67__RTWorkoutDistanceStore_fetchWorkoutDistancesWithWorkout_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWorkoutDistancesWithWorkout:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchWorkoutDistancesWithWorkout:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  RTWorkoutDistanceStore *v20;
  id v21;
  SEL v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __68__RTWorkoutDistanceStore__fetchWorkoutDistancesWithWorkout_handler___block_invoke;
      v18[3] = &unk_1E92979A0;
      v19 = v7;
      v20 = self;
      v22 = a2;
      v10 = v8;
      v21 = v10;
      v11 = (void *)MEMORY[0x1D8232094](v18);
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __68__RTWorkoutDistanceStore__fetchWorkoutDistancesWithWorkout_handler___block_invoke_51;
      v16[3] = &unk_1E9297568;
      v17 = v10;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v16);

      v12 = v19;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = CFSTR("requires valid workouts.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v15);

    }
  }

}

void __68__RTWorkoutDistanceStore__fetchWorkoutDistancesWithWorkout_handler___block_invoke(uint64_t a1, void *a2)
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
  void *v22;
  uint64_t v23;
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
  +[RTWorkoutDistanceMO fetchRequest](RTWorkoutDistanceMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %@) || (%K == %@)"), CFSTR("firstWorkout"), *(_QWORD *)(a1 + 32), CFSTR("secondWorkout"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v28 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
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
    v23 = a1;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = v6;
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
          +[RTWorkoutDistance createWithManagedObject:](RTWorkoutDistance, "createWithManagedObject:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

          objc_autoreleasePoolPop(v16);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v12);
    }

    a1 = v23;
    v6 = v22;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __68__RTWorkoutDistanceStore__fetchWorkoutDistancesWithWorkout_handler___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateStoredWorkoutDistancesWithOptions:(id)a3 usingBlock:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id, char *);
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  void (**v23)(id, _QWORD, id, char *);
  _BYTE *v24;
  id v25;
  char v26;
  _BYTE buf[24];
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, id, char *))a4;
  if (v8)
  {
    v26 = 0;
    if (v7)
    {
      v25 = 0;
      objc_msgSend((id)objc_opt_class(), "fetchRequestForWorkoutDistanceEnumerationOptions:error:", v7, &v25);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v25;
      if (v10)
        v8[2](v8, 0, v10, &v26);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v28 = 0;
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __80__RTWorkoutDistanceStore_enumerateStoredWorkoutDistancesWithOptions_usingBlock___block_invoke;
      v22 = &unk_1E92A02F0;
      v24 = buf;
      v23 = v8;
      v11 = (void *)MEMORY[0x1D8232094](&v19);
      -[RTStore enumerateType:fetchRequest:enumerationBlock:](self, "enumerateType:fetchRequest:enumerationBlock:", objc_opt_class(), v9, v11, v19, v20, v21, v22);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("requires non-nil options.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v14);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2112;
        v28 = v10;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, %@, error, %@", buf, 0x20u);

      }
      v8[2](v8, 0, v10, &v26);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }

  }
}

void __80__RTWorkoutDistanceStore_enumerateStoredWorkoutDistancesWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "count");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  v7 = objc_msgSend(v6, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
}

+ (id)fetchRequestForWorkoutDistanceEnumerationOptions:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[RTWorkoutDistanceMO fetchRequest](RTWorkoutDistanceMO, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("workoutActivityType"), 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("distance"), 1, v6);
  v14[1] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 1);
  v14[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v9);

  if (objc_msgSend(v4, "batchSize"))
    v10 = objc_msgSend(v4, "batchSize");
  else
    v10 = 200;
  objc_msgSend(v5, "setFetchBatchSize:", v10);
  if (objc_msgSend(v4, "batchSize"))
  {
    v11 = objc_msgSend(v4, "batchSize");
    if (v11 >= 0xC8)
      v12 = 200;
    else
      v12 = v11;
  }
  else
  {
    v12 = 200;
  }
  objc_msgSend(v5, "setFetchLimit:", v12);

  return v5;
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
      objc_msgSend((id)objc_opt_class(), "fetchRequestForWorkoutDistanceEnumerationOptions:error:", v8, &v25);
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

@end
