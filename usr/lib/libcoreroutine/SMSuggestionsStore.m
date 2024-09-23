@implementation SMSuggestionsStore

- (void)fetchSuggestionsWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __58__SMSuggestionsStore_fetchSuggestionsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __58__SMSuggestionsStore_fetchSuggestionsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSuggestionsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchSuggestionsWithOptions:(id)a3 handler:(id)a4
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
    v20[2] = __59__SMSuggestionsStore__fetchSuggestionsWithOptions_handler___block_invoke;
    v20[3] = &unk_1E92979A0;
    v20[4] = self;
    v21 = v7;
    v10 = v8;
    v22 = v10;
    v23 = a2;
    v11 = (void *)MEMORY[0x1D8232094](v20);
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __59__SMSuggestionsStore__fetchSuggestionsWithOptions_handler___block_invoke_8;
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
      v25 = "-[SMSuggestionsStore _fetchSuggestionsWithOptions:handler:]";
      v26 = 1024;
      LODWORD(v27) = 43;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
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

void __59__SMSuggestionsStore__fetchSuggestionsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
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
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v34 = a1;
  v5 = *(_QWORD *)(a1 + 40);
  v40 = 0;
  objc_msgSend(v4, "fetchRequestForSuggestionEnumerationOptions:error:", v5, &v40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v40;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v6, "fetchBatchSize");
    v25 = objc_msgSend(v6, "fetchOffset");
    *(_DWORD *)buf = 138413058;
    v43 = v23;
    v44 = 2048;
    v45 = v24;
    v46 = 2048;
    v47 = v25;
    v48 = 2112;
    v49 = (uint64_t)v7;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@: using options fetch batch size, %lu, fetch offset, %lu, error, %@", buf, 0x2Au);

  }
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(v34 + 48) + 16))();
  }
  else
  {
    v39 = 0;
    objc_msgSend(v3, "executeFetchRequest:error:", v6, &v39);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v39;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(v34 + 56));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 138413314;
      v43 = v27;
      v44 = 2112;
      v45 = (uint64_t)v28;
      v46 = 2112;
      v47 = (uint64_t)v6;
      v48 = 2048;
      v49 = v29;
      v50 = 2112;
      v51 = v7;
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@: %@, request, %@, results count, %lu, error, %@", buf, 0x34u);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "fetchBatchSize"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v31 = v3;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v30 = v9;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v36;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v36 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v16);
            v18 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(MEMORY[0x1E0D8BA90], "createWithManagedObject:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(v11, "addObject:", v19);
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                v21 = (objc_class *)objc_opt_class();
                NSStringFromClass(v21);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(*(SEL *)(v34 + 56));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v43 = v33;
                v44 = 2112;
                v45 = (uint64_t)v32;
                v46 = 2112;
                v47 = (uint64_t)v17;
                v48 = 2112;
                v49 = 0;
                _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%@: %@, suggestion MO, %@, suggestion, %@", buf, 0x2Au);

              }
            }

            objc_autoreleasePoolPop(v18);
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v14);
      }

      v3 = v31;
      v9 = v30;
      v7 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(v34 + 48) + 16))();

  }
}

uint64_t __59__SMSuggestionsStore__fetchSuggestionsWithOptions_handler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __63__SMSuggestionsStore_fetchSuggestionsCountWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __63__SMSuggestionsStore_fetchSuggestionsCountWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSuggestionsCountWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  SEL v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SMSuggestionsStore _fetchSuggestionsCountWithOptions:handler:]";
      v23 = 1024;
      v24 = 120;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__SMSuggestionsStore__fetchSuggestionsCountWithOptions_handler___block_invoke;
  v17[3] = &unk_1E92979A0;
  v17[4] = self;
  v18 = v7;
  v11 = v8;
  v19 = v11;
  v20 = a2;
  v12 = v7;
  v13 = (void *)MEMORY[0x1D8232094](v17);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __64__SMSuggestionsStore__fetchSuggestionsCountWithOptions_handler___block_invoke_10;
  v15[3] = &unk_1E9297568;
  v16 = v11;
  v14 = v11;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v13, 1, v15);

}

void __64__SMSuggestionsStore__fetchSuggestionsCountWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void (*v11)(void);
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 40);
  v21 = 0;
  objc_msgSend(v4, "fetchRequestForSuggestionEnumerationOptions:error:", v5, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  v20 = 0;
  v8 = objc_msgSend(v3, "countForFetchRequest:error:", v6, &v20);

  v9 = v20;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v6, "fetchBatchSize");
    v16 = objc_msgSend(v6, "fetchOffset");
    *(_DWORD *)buf = 138413058;
    v23 = v14;
    v24 = 2048;
    v25 = v15;
    v26 = 2048;
    v27 = v16;
    v28 = 2112;
    v29 = (uint64_t)v7;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@: using options fetch batch size, %lu, fetch offset, %lu, error, %@", buf, 0x2Au);

  }
  if (v7)
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v23 = v18;
      v24 = 2112;
      v25 = (uint64_t)v19;
      v26 = 2112;
      v27 = (uint64_t)v6;
      v28 = 2048;
      v29 = v8;
      v30 = 2112;
      v31 = v9;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "%@, %@, request, %@, total suggestions count, %lu, error, %@", buf, 0x34u);

    }
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v11();

}

uint64_t __64__SMSuggestionsStore__fetchSuggestionsCountWithOptions_handler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeSuggestions:(id)a3 handler:(id)a4
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
  block[2] = __47__SMSuggestionsStore_storeSuggestions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __47__SMSuggestionsStore_storeSuggestions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeSuggestions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)clearSuggestionsWithHandler:(id)a3
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
  v7[2] = __50__SMSuggestionsStore_clearSuggestionsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__SMSuggestionsStore_clearSuggestionsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearSuggestionsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_clearSuggestionsWithHandler:(id)a3
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

- (void)deleteSuggestionsPredating:(id)a3 handler:(id)a4
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
  block[2] = __57__SMSuggestionsStore_deleteSuggestionsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __57__SMSuggestionsStore_deleteSuggestionsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteSuggestionsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deleteSuggestionsPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  SMSuggestionsStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__SMSuggestionsStore__deleteSuggestionsPredating_handler___block_invoke;
    v10[3] = &unk_1E9297A30;
    v11 = v6;
    v12 = self;
    v8 = v7;
    v13 = v8;
    v9 = (void *)MEMORY[0x1D8232094](v10);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 0, v8);

  }
}

void __58__SMSuggestionsStore__deleteSuggestionsPredating_handler___block_invoke(_QWORD *a1, void *a2)
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
  +[SMSuggestionMO fetchRequest](SMSuggestionMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K < %@)"), CFSTR("endDate"), a1[4]);
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

+ (id)fetchRequestForSuggestionEnumerationOptions:(id)a3 error:(id *)a4
{
  id v4;
  NSObject *v5;
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
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v81 = "+[SMSuggestionsStore fetchRequestForSuggestionEnumerationOptions:error:]";
    v82 = 2112;
    v83 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, options, %@", buf, 0x16u);
  }

  +[SMSuggestionMO fetchRequest](SMSuggestionMO, "fetchRequest");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "sortByCreationDate"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("creationDate"), objc_msgSend(v4, "ascending"));
    objc_msgSend(v6, "addObject:", v8);

  }
  if ((objc_msgSend(v4, "includeSuppressed") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %ld)"), CFSTR("suppressionReason"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  v62 = v6;
  objc_msgSend(v4, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v4, "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("creationDate"), v13, CFSTR("creationDate"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v16);

  }
  objc_msgSend(v4, "filteredToSuggestionTriggers");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = 0x1E0CB3000;
  v64 = v7;
  if (v17)
  {
    v19 = (void *)v17;
    objc_msgSend(v4, "filteredToSuggestionTriggers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      v22 = (void *)objc_opt_new();
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      objc_msgSend(v4, "filteredToSuggestionTriggers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v74 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
            v29 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %ld)"), CFSTR("suggestionTrigger"), objc_msgSend(v28, "unsignedIntegerValue"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v30);

            objc_autoreleasePoolPop(v29);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
        }
        while (v25);
      }

      v18 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v22);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v64;
      objc_msgSend(v64, "addObject:", v31);

    }
  }
  objc_msgSend(v4, "filteredToSuggestionUserTypes");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    objc_msgSend(v4, "filteredToSuggestionUserTypes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      v36 = (void *)objc_opt_new();
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      objc_msgSend(v4, "filteredToSuggestionUserTypes");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v70;
        do
        {
          for (j = 0; j != v39; ++j)
          {
            if (*(_QWORD *)v70 != v40)
              objc_enumerationMutation(v37);
            v42 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
            v43 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %ld)"), CFSTR("suggestionUserType"), objc_msgSend(v42, "unsignedIntegerValue"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v44);

            objc_autoreleasePoolPop(v43);
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        }
        while (v39);
      }

      v18 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v36);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v64;
      objc_msgSend(v64, "addObject:", v45);

    }
  }
  objc_msgSend(v4, "filteredToSessionTypes");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    objc_msgSend(v4, "filteredToSessionTypes");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count");

    if (v49)
    {
      v50 = (void *)objc_opt_new();
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      objc_msgSend(v4, "filteredToSessionTypes");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v66;
        do
        {
          for (k = 0; k != v53; ++k)
          {
            if (*(_QWORD *)v66 != v54)
              objc_enumerationMutation(v51);
            v56 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
            v57 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %ld)"), CFSTR("sessionType"), objc_msgSend(v56, "unsignedIntegerValue"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v58);

            objc_autoreleasePoolPop(v57);
          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
        }
        while (v53);
      }

      v18 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v50);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v64;
      objc_msgSend(v64, "addObject:", v59);

    }
  }
  objc_msgSend(*(id *)(v18 + 1320), "andPredicateWithSubpredicates:", v7);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setPredicate:", v60);

  objc_msgSend(v63, "setSortDescriptors:", v62);
  objc_msgSend(v63, "setFetchBatchSize:", objc_msgSend(v4, "batchSize"));
  objc_msgSend(v63, "setFetchLimit:", objc_msgSend(v4, "fetchLimit"));
  objc_msgSend(v63, "setFetchOffset:", objc_msgSend(v4, "offset"));
  objc_msgSend(v63, "setReturnsObjectsAsFaults:", 0);

  return v63;
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
      objc_msgSend((id)objc_opt_class(), "fetchRequestForSuggestionEnumerationOptions:error:", v8, &v25);
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
