@implementation RTPlaceInferenceQueryStore

- (void)_fetchPlaceInferenceQueriesWithDateInterval:(id)a3 ascending:(BOOL)a4 handler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SEL v19;
  BOOL v20;

  v9 = a3;
  v10 = a5;
  if (v10)
  {
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__RTPlaceInferenceQueryStore__fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke;
    v16[3] = &unk_1E92A5888;
    v20 = a4;
    v17 = v9;
    v19 = a2;
    v12 = v10;
    v18 = v12;
    v13 = (void *)MEMORY[0x1D8232094](v16);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __92__RTPlaceInferenceQueryStore__fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke_9;
    v14[3] = &unk_1E9297568;
    v15 = v12;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v13, 1, v14);

  }
}

void __92__RTPlaceInferenceQueryStore__fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke(uint64_t a1, void *a2)
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
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  _QWORD v40[4];

  v40[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTPlaceInferenceQueryMO fetchRequest](RTPlaceInferenceQueryMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K >= %@ && %K <= %@"), CFSTR("date"), v7, CFSTR("date"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v9);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), *(unsigned __int8 *)(a1 + 56));
  v40[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v11);

  v30 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v30;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 138413058;
    v33 = v22;
    v34 = 2112;
    v35 = v4;
    v36 = 2048;
    v37 = v23;
    v38 = 2112;
    v39 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v13)
  {
    v15 = 0;
  }
  else
  {
    v25 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v12;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(MEMORY[0x1E0D18430], "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v18);
    }

    v12 = v24;
    v3 = v25;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __92__RTPlaceInferenceQueryStore__fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPlaceInferenceQueriesWithDateInterval:(id)a3 ascending:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__RTPlaceInferenceQueryStore_fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke;
  v13[3] = &unk_1E92970B0;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __91__RTPlaceInferenceQueryStore_fetchPlaceInferenceQueriesWithDateInterval_ascending_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPlaceInferenceQueriesWithDateInterval:ascending:handler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_storePlaceInferenceQuery:(id)a3 handler:(id)a4
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

- (void)storePlaceInferenceQuery:(id)a3 handler:(id)a4
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
  block[2] = __63__RTPlaceInferenceQueryStore_storePlaceInferenceQuery_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __63__RTPlaceInferenceQueryStore_storePlaceInferenceQuery_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storePlaceInferenceQuery:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_purgePlaceInferenceQueriesPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("date");
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

- (void)purgePlaceInferenceQueriesPredating:(id)a3 handler:(id)a4
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
  block[2] = __74__RTPlaceInferenceQueryStore_purgePlaceInferenceQueriesPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __74__RTPlaceInferenceQueryStore_purgePlaceInferenceQueriesPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgePlaceInferenceQueriesPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
