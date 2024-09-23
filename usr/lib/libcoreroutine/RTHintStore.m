@implementation RTHintStore

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

- (void)clearHintsForSourceFilter:(id)a3 handler:(id)a4
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
  block[2] = __49__RTHintStore_clearHintsForSourceFilter_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __49__RTHintStore_clearHintsForSourceFilter_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearHintsForSourceFilter:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_clearHintsForSourceFilter:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  RTHintStore *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "predicateForSourceFilter:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__RTHintStore__clearHintsForSourceFilter_handler___block_invoke;
  v12[3] = &unk_1E9297A30;
  v13 = v8;
  v14 = self;
  v15 = v6;
  v9 = v6;
  v10 = v8;
  v11 = (void *)MEMORY[0x1D8232094](v12);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 0, v9);

}

void __50__RTHintStore__clearHintsForSourceFilter_handler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTHintMO fetchRequest](RTHintMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", a1[4]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v4);
  v6 = (void *)a1[5];
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeDeleteRequests:context:handler:", v7, v3, a1[6]);

}

- (void)regenerateLOIHintsWithHandler:(id)a3
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
  v7[2] = __45__RTHintStore_regenerateLOIHintsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __45__RTHintStore_regenerateLOIHintsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_regenerateLOIHintsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_regenerateLOIHintsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
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
      v11 = "-[RTHintStore _regenerateLOIHintsWithHandler:]";
      v12 = 1024;
      v13 = 85;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke;
  v8[3] = &unk_1E9297AA8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[RTHintStore clearHintsForSourceFilter:handler:](self, "clearHintsForSourceFilter:handler:", v6, v8);

}

void __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_2;
    v5[3] = &unk_1E9297650;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    dispatch_async(v3, v5);

  }
}

void __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_3;
  v8[3] = &unk_1E9297A80;
  v3 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v4 = (void *)MEMORY[0x1D8232094](v8);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_37;
  v6[3] = &unk_1E9297568;
  v5 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "_performBlock:contextType:errorHandler:", v4, 2, v6);

}

void __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id *v17;
  void *v18;
  id obj;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];

  v34[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v18 = (void *)objc_opt_new();
  v3 = 0;
  v4 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__6;
  v32 = __Block_byref_object_dispose__6;
  v33 = 0;
  while (1)
  {
    v5 = (void *)MEMORY[0x1D8231EA8]();
    +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = CFSTR("locationLatitude");
    v34[1] = CFSTR("locationLongitude");
    v34[2] = CFSTR("locationHorizontalUncertainty");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPropertiesToFetch:", v7);

    objc_msgSend(v6, "setResultType:", 2);
    objc_msgSend(v6, "setFetchLimit:", 512);
    objc_msgSend(v6, "setFetchOffset:", v4);
    v27 = 0;
    objc_msgSend(v2, "executeFetchRequest:error:", v6, &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;

    v10 = objc_msgSend(v8, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_23;
    v21[3] = &unk_1E9297A58;
    v12 = v11;
    v22 = v12;
    v13 = v18;
    v14 = *(_QWORD *)(a1 + 32);
    v23 = v13;
    v24 = v14;
    v15 = v2;
    v25 = v15;
    v26 = &v28;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v21);

    objc_autoreleasePoolPop(v5);
    if (v29[5])
      break;
    v4 += v10;
    v3 = v8;
    if (!objc_msgSend(v8, "count"))
    {
      if (!v29[5] && objc_msgSend(v13, "count"))
      {
        v16 = (void *)objc_opt_class();
        v17 = (id *)(v29 + 5);
        obj = (id)v29[5];
        objc_msgSend(v16, "batchInsertHintsDictionary:context:error:", v13, v15, &obj);
        objc_storeStrong(v17, obj);
      }
      break;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_object_dispose(&v28, 8);

}

void __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_23(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v3 = (objc_class *)MEMORY[0x1E0C99D80];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationLatitude"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationLongitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationHorizontalUncertainty"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, CFSTR("latitude"), v7, CFSTR("longitude"), v8, CFSTR("horizontalUncertainty"), *(_QWORD *)(a1 + 32), CFSTR("date"), &unk_1E93268D0, CFSTR("source"), 0);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  if (objc_msgSend(*(id *)(a1 + 40), "count") == 1024)
  {
    v10 = (void *)objc_opt_class();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(id *)(v13 + 40);
    objc_msgSend(v10, "batchInsertHintsDictionary:context:error:", v11, v12, &v14);
    objc_storeStrong((id *)(v13 + 40), v14);
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  }

}

uint64_t __46__RTHintStore__regenerateLOIHintsWithHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)batchInsertHintsDictionary:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  v8 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__RTHintStore_batchInsertHintsDictionary_context_error___block_invoke;
  v13[3] = &unk_1E9297AD0;
  v9 = v7;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v10, "performBlockAndWait:", v13);
  if (a5)
    *a5 = objc_retainAutorelease((id)v18[5]);
  v11 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __56__RTHintStore_batchInsertHintsDictionary_context_error___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id obj;

  v2 = objc_alloc(MEMORY[0x1E0C97AA0]);
  +[RTHintMO entity](RTHintMO, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEntity:objects:", v3, a1[4]);

  v5 = (void *)a1[5];
  v6 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v6 + 40);
  v7 = (id)objc_msgSend(v5, "executeRequest:error:", v4, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);

}

+ (id)predicateForSourceFilter:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    for (i = -1; i != 11; ++i)
    {
      v6 = (void *)MEMORY[0x1D8231EA8]();
      if ((objc_msgSend(v3, "integerValue") & (1 << (i + 1))) != 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v9 = objc_msgSend(v3, "integerValue");
          *(_DWORD *)buf = 134218240;
          v13 = i;
          v14 = 2048;
          v15 = v9;
          _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "Setting up predicate for hintSource, %ld, sourceFilter, %ld", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %lld"), CFSTR("source"), i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v8);

      }
      objc_autoreleasePoolPop(v6);
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 2, v4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)fetchRequestForHintEnumerationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  id v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[RTHintMO fetchRequest](RTHintMO, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), objc_msgSend(v5, "ascending"));
  v41[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v8);

  objc_msgSend(v5, "referenceLocation");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_3;
  objc_msgSend(v5, "referenceLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v38 = 0;
  v12 = objc_msgSend(v6, "setupBoundingBoxFetchRequestForLocation:distance:entityCanBeLocationShifted:locationShifter:resultExpansionPredicates:resultFilteringPredicates:error:", v10, 0, 0, 0, 0, &v38);
  v9 = v38;

  if ((v12 & 1) == 0)
  {
    if (a4)
    {
      v9 = objc_retainAutorelease(v9);
      v22 = 0;
      *a4 = v9;
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
LABEL_3:
    objc_msgSend(v5, "sourceFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)objc_opt_class();
      objc_msgSend(v5, "sourceFilter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "predicateForSourceFilter:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v6, "predicate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = (void *)MEMORY[0x1E0CB3528];
          objc_msgSend(v6, "predicate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = v19;
          v40[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "andPredicateWithSubpredicates:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setPredicate:", v21);

        }
        else
        {
          objc_msgSend(v6, "setPredicate:", v16);
        }
      }

    }
    objc_msgSend(v5, "dateInterval");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v5, "dateInterval");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "startDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateInterval");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("date"), v26, CFSTR("date"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "predicate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = (void *)MEMORY[0x1E0CB3528];
        objc_msgSend(v6, "predicate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v32;
        v39[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "andPredicateWithSubpredicates:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setPredicate:", v34);

      }
      else
      {
        objc_msgSend(v6, "setPredicate:", v29);
      }

    }
    if (objc_msgSend(v5, "batchSize"))
    {
      v35 = objc_msgSend(v5, "batchSize");
      if (v35 >= 0x400)
        v36 = 1024;
      else
        v36 = v35;
    }
    else
    {
      v36 = 1024;
    }
    objc_msgSend(v6, "setFetchLimit:", v36);
    objc_msgSend(v6, "setFetchBatchSize:", 1024);
    v22 = v6;
  }

  return v22;
}

- (void)enumerateStoredHintsWithOptions:(id)a3 usingBlock:(id)a4
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
  void *v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(id, _QWORD, id, char *);
  _BYTE *v20;
  id v21;
  char v22;
  _BYTE buf[24];
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, id, char *))a4;
  if (v8)
  {
    v22 = 0;
    if (v7)
    {
      v21 = 0;
      objc_msgSend((id)objc_opt_class(), "fetchRequestForHintEnumerationOptions:error:", v7, &v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v21;
      if (v10)
        v8[2](v8, 0, v10, &v22);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v24 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __58__RTHintStore_enumerateStoredHintsWithOptions_usingBlock___block_invoke;
      v17[3] = &unk_1E9297AF8;
      v20 = buf;
      v18 = v7;
      v19 = v8;
      v11 = (void *)MEMORY[0x1D8232094](v17);
      -[RTStore enumerateType:fetchRequest:enumerationBlock:](self, "enumerateType:fetchRequest:enumerationBlock:", objc_opt_class(), v9, v11);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("requires non-nil options.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v14);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v8[2](v8, 0, v10, &v22);
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

void __58__RTHintStore_enumerateStoredHintsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v9 = objc_msgSend(v13, "count");
  if (objc_msgSend(*(id *)(a1 + 32), "limit"))
  {
    v10 = v9 + v8;
    if (v10 > objc_msgSend(*(id *)(a1 + 32), "limit"))
    {
      objc_msgSend(v13, "subarrayWithRange:", 0, v10 - objc_msgSend(*(id *)(a1 + 32), "limit"));
      v11 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v11;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v13, "count");
  if (objc_msgSend(*(id *)(a1 + 32), "limit"))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v12 >= objc_msgSend(*(id *)(a1 + 32), "limit"))
      *a4 = 1;
  }

}

- (void)_purgeHintsPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint64_t v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v12 = CFSTR("date");
    v11 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    -[RTStore purgePredating:predicateMappings:handler:](self, "purgePredating:predicateMappings:handler:", v6, v9, v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date", v10, 2u);
    }
  }

}

- (void)purgeHintsPredating:(id)a3 handler:(id)a4
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
  block[2] = __43__RTHintStore_purgeHintsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __43__RTHintStore_purgeHintsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeHintsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchHintStatsNearLocation:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t *v27;
  SEL v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      *(_QWORD *)buf = 0;
      v30 = buf;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__6;
      v33 = __Block_byref_object_dispose__6;
      v34 = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __51__RTHintStore__fetchHintStatsNearLocation_handler___block_invoke;
      v23[3] = &unk_1E9297B20;
      v24 = v7;
      v11 = v8;
      v26 = v11;
      v27 = buf;
      v28 = a2;
      v12 = v9;
      v25 = v12;
      v13 = (void *)MEMORY[0x1D8232094](v23);
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __51__RTHintStore__fetchHintStatsNearLocation_handler___block_invoke_62;
      v21[3] = &unk_1E9297568;
      v22 = v11;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v13, 1, v21);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2D50];
      v16 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ requires a valid location."), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v20);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __51__RTHintStore__fetchHintStatsNearLocation_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id obj;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  const __CFString *v48;
  _QWORD v49[2];
  _QWORD v50[4];

  v50[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTHintMO fetchRequest](RTHintMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v38 = 0;
  v6 = objc_msgSend(v4, "setupBoundingBoxFetchRequestForLocation:distance:entityCanBeLocationShifted:locationShifter:resultExpansionPredicates:resultFilteringPredicates:error:", v5, 0, 0, 0, 0, &v38, 130.0);
  v7 = v38;
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    v31 = v7;
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setName:", CFSTR("count"));
    v10 = (void *)MEMORY[0x1E0CB35D0];
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("source"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "expressionForFunction:arguments:", CFSTR("count:"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExpression:", v13);

    objc_msgSend(v9, "setExpressionResultType:", 300);
    v49[0] = CFSTR("source");
    v49[1] = v9;
    v30 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPropertiesToFetch:", v14);

    v48 = CFSTR("source");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPropertiesToGroupBy:", v15);

    objc_msgSend(v4, "setResultType:", 2);
    objc_msgSend(v4, "setFetchBatchSize:", 1024);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v16 + 40);
    v32 = v3;
    objc_msgSend(v3, "executeFetchRequest:error:", v4, &obj);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v16 + 40), obj);
    _rt_log_facility_get_os_log(RTLogFacilityHint);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v17, "count");
      v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138413058;
      v41 = v27;
      v42 = 2112;
      v43 = v4;
      v44 = 2048;
      v45 = v28;
      v46 = 2112;
      v47 = v29;
      _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("source"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("count"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v26, v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v21);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v8 = v31;
    v3 = v32;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __51__RTHintStore__fetchHintStatsNearLocation_handler___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchHintStatsNearLocation:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__RTHintStore_fetchHintStatsNearLocation_handler___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v19 = v7;
    v20 = v9;
    dispatch_async(v10, block);

  }
  else if (v8)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D18598];
    v21 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ requires a valid location."), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 7, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v17);
  }

}

uint64_t __50__RTHintStore_fetchHintStatsNearLocation_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchHintStatsNearLocation:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchIsHintNearLocation:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__RTHintStore_fetchIsHintNearLocation_withHandler___block_invoke;
  v8[3] = &unk_1E9297B48;
  v9 = v6;
  v7 = v6;
  -[RTHintStore fetchHintStatsNearLocation:handler:](self, "fetchHintStatsNearLocation:handler:", a3, v8);

}

void __51__RTHintStore_fetchIsHintNearLocation_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.self"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, objc_msgSend(v6, "integerValue") > 0, v5);

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
      objc_msgSend((id)objc_opt_class(), "fetchRequestForHintEnumerationOptions:error:", v8, &v25);
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
