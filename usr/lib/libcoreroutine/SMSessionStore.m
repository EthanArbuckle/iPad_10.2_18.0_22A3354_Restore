@implementation SMSessionStore

- (void)fetchSessionStatusWithHandler:(id)a3
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
  v7[2] = __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke;
  v7[3] = &unk_1E9297678;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke_14;
    v13[3] = &unk_1E9299738;
    v14 = v2;
    v4 = (void *)MEMORY[0x1D8232094](v13);
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke_2;
    v11[3] = &unk_1E9297568;
    v5 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v5, "_performBlock:contextType:errorHandler:", v4, 1, v11);

    v6 = v14;
  }
  else
  {
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);

    }
  }

}

void __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMSessionManagerStatusMO fetchRequest](SMSessionManagerStatusMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v20;
  v7 = (void *)objc_opt_new();
  if (!v6 && objc_msgSend(v5, "count"))
  {
    v14 = a1;
    v15 = v3;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x1E0D8BA30], "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), v14, v15, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    a1 = v14;
    v3 = v15;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __48__SMSessionStore_fetchSessionStatusWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchMostRecentSessionManagerStateWithHandler:(id)a3
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
  v7[2] = __64__SMSessionStore_fetchMostRecentSessionManagerStateWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __64__SMSessionStore_fetchMostRecentSessionManagerStateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMostRecentSessionManagerStateWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchMostRecentSessionManagerStateWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  char *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8BA70]), "initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:", 1, 1, 1, 0, 0);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__SMSessionStore__fetchMostRecentSessionManagerStateWithHandler___block_invoke;
    v11[3] = &unk_1E9299760;
    v12 = v4;
    -[SMSessionStore _fetchSessionManagerStatesWithOptions:handler:](self, "_fetchSessionManagerStatesWithOptions:handler:", v5, v11);
    v6 = v12;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SMSessionStore _fetchMostRecentSessionManagerStateWithHandler:]";
      v15 = 1024;
      LODWORD(v16) = 93;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);

    }
  }

}

void __65__SMSessionStore__fetchMostRecentSessionManagerStateWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[SMSessionStore _fetchMostRecentSessionManagerStateWithHandler:]_block_invoke";
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%s, most recent state fetch failed with error, %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[SMSessionStore _fetchMostRecentSessionManagerStateWithHandler:]_block_invoke";
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, fetched most recent state, %@", (uint8_t *)&v12, 0x16u);

  }
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);

}

- (void)fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __63__SMSessionStore_fetchSessionManagerStatesWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __63__SMSessionStore_fetchSessionManagerStatesWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSessionManagerStatesWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  char *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__SMSessionStore__fetchSessionManagerStatesWithOptions_handler___block_invoke;
    v19[3] = &unk_1E9297A80;
    v20 = v6;
    v9 = v7;
    v21 = v9;
    v10 = (void *)MEMORY[0x1D8232094](v19);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __64__SMSessionStore__fetchSessionManagerStatesWithOptions_handler___block_invoke_52;
    v17[3] = &unk_1E9297568;
    v18 = v9;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v10, 1, v17);

    v11 = v20;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SMSessionStore _fetchSessionManagerStatesWithOptions:handler:]";
      v24 = 1024;
      LODWORD(v25) = 137;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v16;
      v24 = 2112;
      v25 = v13;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);

    }
  }

}

void __64__SMSessionStore__fetchSessionManagerStatesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
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
  void *v22;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65[4];
  _BYTE v66[128];
  _BYTE buf[12];
  __int16 v68;
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  id v73;
  _QWORD v74[4];
  _QWORD v75[4];

  v75[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SMSessionStore _fetchSessionManagerStatesWithOptions:handler:]_block_invoke";
    v68 = 2112;
    v69 = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, options, %@", buf, 0x16u);
  }

  +[SMSessionManagerStateMO fetchRequest](SMSessionManagerStateMO, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "sortByCreationDate"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), objc_msgSend(*(id *)(a1 + 32), "ascending"));
    v75[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSortDescriptors:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("date"), v13, CFSTR("date"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v16);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "sessionState"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %lu"), CFSTR("sessionState"), objc_msgSend(*(id *)(a1 + 32), "sessionState"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v17);

  }
  objc_msgSend(*(id *)(a1 + 32), "locationBoundingBox");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    *(_QWORD *)buf = 0;
    memset(&v65[1], 0, 24);
    objc_msgSend(*(id *)(a1 + 32), "locationBoundingBox");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "coordinate");
    objc_msgSend(*(id *)(a1 + 32), "locationBoundingBox");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "coordinate");
    objc_msgSend(*(id *)(a1 + 32), "boundingBoxRadius");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    RTCommonCalculateBoundingBox();

    v52 = (void *)MEMORY[0x1E0CB3528];
    v22 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateWithFormat:", CFSTR("%@ <= %K"), v60, CFSTR("locationLongitude"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v53;
    v23 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v6;
    objc_msgSend(v23, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("locationLongitude"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v25;
    v55 = v7;
    v26 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)buf);
    v58 = a1;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "predicateWithFormat:", CFSTR("%@ <= %K"), v27, CFSTR("locationLatitude"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v28;
    v29 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("locationLatitude"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "andPredicateWithSubpredicates:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v55;
    v6 = v57;

    a1 = v58;
    objc_msgSend(v55, "addObject:", v33);

  }
  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "predicateWithFormat:", CFSTR("%K.%K == %@"), CFSTR("sessionConfiguration"), CFSTR("sessionIdentifier"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v37);

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v38);

  }
  objc_msgSend(v6, "setFetchBatchSize:", objc_msgSend(*(id *)(a1 + 32), "batchSize"));
  objc_msgSend(v6, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 32), "fetchLimit"));
  objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
  v65[0] = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v6, v65);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v65[0];
  v41 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = objc_msgSend(v39, "count");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[SMSessionStore _fetchSessionManagerStatesWithOptions:handler:]_block_invoke";
    v68 = 2112;
    v69 = v6;
    v70 = 2048;
    v71 = v43;
    v72 = 2112;
    v73 = v40;
    _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "%s, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }

  if (!v40 && objc_msgSend(v39, "count"))
  {
    v54 = v39;
    v56 = v7;
    v59 = a1;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v44 = v39;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v62 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "-[SMSessionStore _fetchSessionManagerStatesWithOptions:handler:]_block_invoke";
            v68 = 2112;
            v69 = v49;
            _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_INFO, "%s, sessionManagerState, %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0D8BA28], "createWithManagedObject:", v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v51);

        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      }
      while (v46);
    }

    a1 = v59;
    v7 = v56;
    v39 = v54;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __64__SMSessionStore__fetchSessionManagerStatesWithOptions_handler___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __64__SMSessionStore_fetchSessionConfigurationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __64__SMSessionStore_fetchSessionConfigurationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSessionConfigurationsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  char *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  SMSessionStore *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke;
    v19[3] = &unk_1E9297A30;
    v20 = v6;
    v21 = self;
    v9 = v7;
    v22 = v9;
    v10 = (void *)MEMORY[0x1D8232094](v19);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_3;
    v17[3] = &unk_1E9297568;
    v18 = v9;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v10, 1, v17);

    v11 = v20;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:]";
      v25 = 1024;
      LODWORD(v26) = 252;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v13;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@: handler is a required parameter, %@", buf, 0x16u);

    }
  }

}

void __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke(int8x16_t *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  int8x16_t *v126;
  uint64_t v127;
  void *v128;
  int v129;
  void *v130;
  unint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  unint64_t v137;
  void *v138;
  void *v139;
  char v140;
  id v141;
  void *v142;
  BOOL v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  id v149;
  int8x16_t *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  id v156;
  id obj;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  int8x16_t v172;
  void *v173;
  void *v174;
  void *v175;
  _QWORD v176[4];
  id v177;
  id v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  id v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  _QWORD v199[4];
  int8x16_t v200;
  _BYTE buf[12];
  __int16 v202;
  uint64_t v203;
  __int16 v204;
  uint64_t v205;
  __int16 v206;
  id v207;
  __int16 v208;
  uint64_t v209;
  __int16 v210;
  void *v211;
  __int16 v212;
  void *v213;
  _BYTE v214[128];
  void *v215;
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];
  _QWORD v219[4];
  _QWORD v220[4];
  _QWORD v221[4];

  v221[1] = *MEMORY[0x1E0C80C00];
  v149 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = a1[2].i64[0];
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:]_block_invoke";
    v202 = 2112;
    v203 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, options, %@", buf, 0x16u);
  }

  +[SMSessionConfigurationMO fetchRequest](SMSessionConfigurationMO, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)a1[2].i64[0], "sortBySessionStartDate"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("sessionStartDate"), objc_msgSend((id)a1[2].i64[0], "ascending"));
    v221[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v221, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSortDescriptors:", v8);

  }
  v148 = v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K == %ld"), CFSTR("sessionManagerState"), CFSTR("sessionState"), 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

  objc_msgSend((id)a1[2].i64[0], "timeInADayInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3880];
    v199[0] = MEMORY[0x1E0C809B0];
    v199[1] = 3221225472;
    v199[2] = __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_60;
    v199[3] = &unk_1E9299788;
    v172 = a1[2];
    v13 = (id)v172.i64[0];
    v200 = vextq_s8(v172, v172, 8uLL);
    objc_msgSend(v12, "predicateWithBlock:", v199);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

  }
  v147 = v9;
  objc_msgSend((id)a1[2].i64[0], "startBoundingBoxLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v150 = a1;
  v164 = v6;
  if (v15)
  {
    *(_QWORD *)buf = 0;
    v198 = 0;
    v197 = 0;
    v196 = 0;
    objc_msgSend((id)a1[2].i64[0], "startBoundingBoxLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "coordinate");
    objc_msgSend((id)a1[2].i64[0], "startBoundingBoxLocation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "coordinate");
    objc_msgSend((id)a1[2].i64[0], "boundingBoxRadius");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    RTCommonCalculateBoundingBox();

    v165 = (void *)MEMORY[0x1E0CB3528];
    v19 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateWithFormat:", CFSTR("%@ <= %K.%K"), v173, CFSTR("sessionManagerState"), CFSTR("locationLongitude"));
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v220[0] = v169;
    v20 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predicateWithFormat:", CFSTR("%K.%K <= %@"), CFSTR("sessionManagerState"), CFSTR("locationLongitude"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v220[1] = v22;
    v23 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)buf);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "predicateWithFormat:", CFSTR("%@ <= %K.%K"), v24, CFSTR("sessionManagerState"), CFSTR("locationLatitude"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v220[2] = v25;
    v26 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "predicateWithFormat:", CFSTR("%K.%K <= %@"), CFSTR("sessionManagerState"), CFSTR("locationLatitude"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v220[3] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v220, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "andPredicateWithSubpredicates:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = v150;
    v6 = v164;

    objc_msgSend(v164, "addObject:", v30);
  }
  objc_msgSend((id)a1[2].i64[0], "destinationBoundingBoxLocation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    *(_QWORD *)buf = 0;
    v198 = 0;
    v197 = 0;
    v196 = 0;
    objc_msgSend((id)a1[2].i64[0], "destinationBoundingBoxLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "coordinate");
    objc_msgSend((id)a1[2].i64[0], "destinationBoundingBoxLocation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "coordinate");
    objc_msgSend((id)a1[2].i64[0], "boundingBoxRadius");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    RTCommonCalculateBoundingBox();

    v166 = (void *)MEMORY[0x1E0CB3528];
    v35 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "predicateWithFormat:", CFSTR("%@ <= %K"), v174, CFSTR("destinationLongitude"));
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v219[0] = v170;
    v36 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("destinationLongitude"), v162);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v219[1] = v37;
    v38 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)buf);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "predicateWithFormat:", CFSTR("%@ <= %K"), v39, CFSTR("destinationLatitude"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v219[2] = v40;
    v41 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("destinationLatitude"), v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v219[3] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v219, 4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "andPredicateWithSubpredicates:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = v150;
    v6 = v164;

    objc_msgSend(v164, "addObject:", v45);
  }
  objc_msgSend((id)a1[2].i64[0], "dateInterval");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v47 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend((id)a1[2].i64[0], "dateInterval");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "startDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1[2].i64[0], "dateInterval");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "endDate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("sessionStartDate"), v49, CFSTR("sessionStartDate"), v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v52);

  }
  objc_msgSend((id)a1[2].i64[0], "sessionIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v54 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend((id)a1[2].i64[0], "sessionIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("sessionIdentifier"), v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v56);

  }
  objc_msgSend((id)a1[2].i64[0], "sessionTypes");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    objc_msgSend((id)a1[2].i64[0], "sessionTypes");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "count");

    if (v60)
    {
      v194 = 0u;
      v195 = 0u;
      v192 = 0u;
      v193 = 0u;
      objc_msgSend((id)a1[2].i64[0], "sessionTypes");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v192, v218, 16);
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v193;
        do
        {
          for (i = 0; i != v63; ++i)
          {
            if (*(_QWORD *)v193 != v64)
              objc_enumerationMutation(v61);
            v66 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * i);
            v67 = (void *)MEMORY[0x1D8231EA8]();
            v68 = objc_msgSend(v66, "unsignedIntegerValue");
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %ld)"), CFSTR("sessionType"), v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v164, "addObject:", v69);

            objc_autoreleasePoolPop(v67);
          }
          v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v192, v218, 16);
        }
        while (v63);
      }

      a1 = v150;
      v6 = v164;
    }
  }
  v70 = v148;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "setPredicate:", v71);

  }
  objc_msgSend(v148, "setFetchBatchSize:", objc_msgSend((id)a1[2].i64[0], "batchSize"));
  objc_msgSend(v148, "setFetchLimit:", objc_msgSend((id)a1[2].i64[0], "fetchLimit"));
  objc_msgSend(v148, "setReturnsObjectsAsFaults:", 0);
  v191 = 0;
  objc_msgSend(v149, "executeFetchRequest:error:", v148, &v191);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v72 = v191;
  v154 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    v74 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:]_block_invoke_2";
    v202 = 2112;
    v203 = (uint64_t)v148;
    v204 = 2048;
    v205 = v74;
    v206 = 2112;
    v207 = v72;
    _os_log_impl(&dword_1D1A22000, v73, OS_LOG_TYPE_INFO, "%s, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }

  if (v72 || !objc_msgSend(obj, "count"))
  {
    v75 = v154;
    (*(void (**)(void))(a1[3].i64[0] + 16))();
    v76 = v147;
    goto LABEL_84;
  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v147);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "filteredArrayUsingPredicate:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v79 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
  {
    v80 = objc_msgSend(v78, "count");
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:]_block_invoke";
    v202 = 2048;
    v203 = v80;
    _os_log_impl(&dword_1D1A22000, v79, OS_LOG_TYPE_INFO, "%s, filtered results count, %lu,", buf, 0x16u);
  }

  v171 = (void *)objc_opt_new();
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  obj = v78;
  v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v217, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v188;
    do
    {
      for (j = 0; j != v82; ++j)
      {
        if (*(_QWORD *)v188 != v83)
          objc_enumerationMutation(obj);
        v85 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * j);
        v86 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v85, "sessionIdentifier");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "objectForKeyedSubscript:", v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v88)
        {
          v89 = (void *)objc_opt_new();
          objc_msgSend(v85, "sessionIdentifier");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "setObject:forKeyedSubscript:", v89, v90);

        }
        objc_msgSend(v85, "sessionIdentifier");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "objectForKeyedSubscript:", v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "sessionManagerState");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "addObject:", v93);

        objc_autoreleasePoolPop(v86);
      }
      v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v217, 16);
    }
    while (v82);
  }

  v175 = (void *)objc_opt_new();
  v163 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), objc_msgSend((id)v150[2].i64[0], "ascending"));
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  objc_msgSend(v171, "allKeys");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v183, v216, 16);
  if (v95)
  {
    v96 = v95;
    v97 = *(_QWORD *)v184;
    do
    {
      for (k = 0; k != v96; ++k)
      {
        if (*(_QWORD *)v184 != v97)
          objc_enumerationMutation(v94);
        v99 = *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * k);
        v100 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v171, "objectForKeyedSubscript:", v99);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v215 = v163;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v215, 1);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "sortedArrayUsingDescriptors:", v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "setObject:forKeyedSubscript:", v103, v99);

        objc_autoreleasePoolPop(v100);
      }
      v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v183, v216, 16);
    }
    while (v96);
  }

  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  objc_msgSend(v175, "allKeys");
  v156 = (id)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v179, v214, 16);
  v75 = v154;
  if (v104)
  {
    v105 = v104;
    v106 = *(_QWORD *)v180;
    v153 = *(_QWORD *)v180;
    do
    {
      v107 = 0;
      v155 = v105;
      do
      {
        if (*(_QWORD *)v180 != v106)
          objc_enumerationMutation(v156);
        v108 = *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * v107);
        v167 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v175, "objectForKeyedSubscript:", v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "firstObject");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "sessionConfiguration");
        v111 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D8B9F0], "createWithManagedObject:", v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        if (v112)
        {
          objc_msgSend(v75, "addObject:", v112);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v113 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v111, "sessionIdentifier");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "sessionStartDate");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v160, "stringFromDate");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = (void *)MEMORY[0x1E0D8BA28];
            objc_msgSend(v111, "sessionManagerState");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "convertSessionStateToString:", (int)objc_msgSend(v116, "sessionState"));
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D8B9F0], "sessionTypeToString:", (int)objc_msgSend(v111, "sessionType"));
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v175, "objectForKeyedSubscript:", v108);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = objc_msgSend(v119, "count");
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)&buf[4] = v114;
            v202 = 2112;
            v203 = (uint64_t)v158;
            v204 = 2112;
            v205 = (uint64_t)v117;
            v206 = 2112;
            v207 = v118;
            v208 = 2048;
            v209 = v120;
            _os_log_impl(&dword_1D1A22000, v113, OS_LOG_TYPE_INFO, "uuid, %@, startDate, %@, session state, %@, session type, %@, states count, %lu", buf, 0x34u);

            v105 = v155;
            v106 = v153;

            v75 = v154;
          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v113 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v111, "sessionIdentifier");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "sessionStartDate");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "stringFromDate");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            v122 = (void *)MEMORY[0x1E0D8BA28];
            objc_msgSend(v111, "sessionManagerState");
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "convertSessionStateToString:", (int)objc_msgSend(v159, "sessionState"));
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D8B9F0], "sessionTypeToString:", (int)objc_msgSend(v111, "sessionType"));
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "conversation");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "primaryHandle");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316674;
            *(_QWORD *)&buf[4] = "-[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:]_block_invoke";
            v202 = 2112;
            v203 = (uint64_t)v121;
            v204 = 2112;
            v205 = (uint64_t)v152;
            v206 = 2112;
            v207 = v151;
            v208 = 2112;
            v209 = (uint64_t)v123;
            v210 = 2112;
            v211 = v124;
            v212 = 2112;
            v213 = v125;
            _os_log_error_impl(&dword_1D1A22000, v113, OS_LOG_TYPE_ERROR, "%s,Could not convert MO to valid config, uuid, %@, startDate, %@, session state, %@, session type, %@, conversation, %@ primaryHandle, %@", buf, 0x48u);

            v75 = v154;
            v105 = v155;

            v106 = v153;
          }
        }

        objc_autoreleasePoolPop(v167);
        ++v107;
      }
      while (v105 != v107);
      v105 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v179, v214, 16);
    }
    while (v105);
  }

  v126 = v150;
  objc_msgSend((id)v150[2].i64[0], "timeInADayInterval");
  v127 = objc_claimAutoreleasedReturnValue();
  if (!v127)
  {
    v76 = v147;
    v70 = v148;
    v6 = v164;
    v72 = 0;
    goto LABEL_81;
  }
  v128 = (void *)v127;
  v129 = objc_msgSend((id)v150[2].i64[0], "pickOneConfigInTimeInADayInterval");

  v70 = v148;
  v6 = v164;
  v72 = 0;
  if (!v129)
    goto LABEL_80;
  objc_msgSend(v75, "sortUsingComparator:", &__block_literal_global_17);
  v130 = (void *)objc_opt_new();
  if (objc_msgSend(v75, "count") == 1)
    goto LABEL_77;
  v168 = v130;
  v131 = 0;
  v132 = v75;
  v133 = 0;
  while (1)
  {
    if (!objc_msgSend(v132, "count"))
    {
      v141 = v133;
      goto LABEL_76;
    }
    v134 = (void *)MEMORY[0x1D8231EA8]();
    v135 = (void *)objc_opt_class();
    objc_msgSend(v132, "objectAtIndexedSubscript:", v131);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v131 + 1;
    objc_msgSend(v132, "objectAtIndexedSubscript:", v131 + 1);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v126[2].i64[0], "timeInADayInterval");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = v133;
    v140 = objc_msgSend(v135, "areSessionConfigsInTheSameInterval:config2:timeInADayInterval:error:", v136, v138, v139, &v178);
    v141 = v178;

    v6 = v164;
    v70 = v148;
    if ((v140 & 1) == 0)
      break;
LABEL_70:
    objc_autoreleasePoolPop(v134);
    v131 = v137;
    v133 = v141;
    v143 = v137 >= objc_msgSend(v132, "count") - 1;
    v126 = v150;
    v72 = 0;
    if (v143)
      goto LABEL_76;
  }
  if (!v141)
  {
    v132 = v154;
    objc_msgSend(v154, "objectAtIndexedSubscript:", v131);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "addObject:", v142);

    goto LABEL_70;
  }
  objc_autoreleasePoolPop(v134);
  v126 = v150;
  v72 = 0;
  v132 = v154;
LABEL_76:

  v130 = v168;
  v75 = v132;
LABEL_77:
  if (objc_msgSend(v75, "count"))
  {
    objc_msgSend(v75, "objectAtIndexedSubscript:", objc_msgSend(v75, "count") - 1);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "addObject:", v144);

  }
  objc_msgSend(v130, "allObjects");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = objc_msgSend(v145, "mutableCopy");

  v75 = (void *)v146;
LABEL_80:
  v76 = v147;
LABEL_81:
  if (objc_msgSend((id)v126[2].i64[0], "sortBySessionStartDate"))
  {
    v176[0] = MEMORY[0x1E0C809B0];
    v176[1] = 3221225472;
    v176[2] = __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_2;
    v176[3] = &unk_1E92997F0;
    v177 = (id)v126[2].i64[0];
    objc_msgSend(v75, "sortUsingComparator:", v176);

  }
  (*(void (**)(void))(v126[3].i64[0] + 16))();

LABEL_84:
}

uint64_t __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_60(uint64_t a1, void *a2)
{
  void *v3;
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
  double v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  unsigned int v20;
  id v22;
  id v23;

  objc_msgSend(a2, "sessionStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "timeInADayInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getDateUsingYearMonthDayFromDate:hoursMinsSecsFromDate:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "timeInADayInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duration");
  objc_msgSend(v7, "dateByAddingTimeInterval:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "timeInADayInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getDateUsingYearMonthDayFromDate:hoursMinsSecsFromDate:", v3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "timeInADayInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "duration");
  objc_msgSend(v13, "dateByAddingTimeInterval:", -v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v17 = objc_msgSend((id)objc_opt_class(), "isDateBetweenStartDate:endDate:targetDate:error:", v7, v9, v3, &v23);
  v18 = v23;
  if (v18)
  {
    v19 = 0;
  }
  else
  {
    v22 = 0;
    v20 = objc_msgSend((id)objc_opt_class(), "isDateBetweenStartDate:endDate:targetDate:error:", v16, v13, v3, &v22);
    v18 = v22;
    if (v18)
      v19 = 0;
    else
      v19 = v17 | v20;
  }

  return v19;
}

uint64_t __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "sessionStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "ascending"))
  {
    objc_msgSend(v5, "sessionStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
  }
  else
  {
    objc_msgSend(v6, "sessionStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
  }
  objc_msgSend(v8, "sessionStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

uint64_t __65__SMSessionStore__fetchSessionConfigurationsWithOptions_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeSessionManagerStatus:(id)a3 handler:(id)a4
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
  block[2] = __52__SMSessionStore_storeSessionManagerStatus_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __52__SMSessionStore_storeSessionManagerStatus_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", a1[5], 0);
  objc_msgSend(v2, "storeWritableObjects:handler:", v3, a1[6]);

}

- (void)updateSessionManagerStatus:(id)a3 handler:(id)a4
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
  block[2] = __53__SMSessionStore_updateSessionManagerStatus_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __53__SMSessionStore_updateSessionManagerStatus_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", a1[5], 0);
  objc_msgSend(v2, "updateWritableObjects:handler:", v3, a1[6]);

}

- (void)storeSessionManagerStates:(id)a3 handler:(id)a4
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
  block[2] = __52__SMSessionStore_storeSessionManagerStates_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __52__SMSessionStore_storeSessionManagerStates_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeWritableObjects:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)storeSessionConfigurations:(id)a3 handler:(id)a4
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
  block[2] = __53__SMSessionStore_storeSessionConfigurations_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __53__SMSessionStore_storeSessionConfigurations_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeWritableObjects:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeSessionManagerStatus:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SMSessionStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke;
  block[3] = &unk_1E9299330;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke_2;
    v15 = &unk_1E9297A30;
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v16 = v3;
    v17 = v4;
    v18 = v5;
    v6 = (void *)MEMORY[0x1D8232094](&v12);
    objc_msgSend(*(id *)(a1 + 40), "_performBlock:contextType:errorHandler:", v6, 0, *(_QWORD *)(a1 + 48), v12, v13, v14, v15);

    v7 = v16;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D18598];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("requires valid sessionManagerStatus.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);

  }
}

void __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMSessionManagerStatusMO fetchRequest](SMSessionManagerStatusMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v4);
  objc_msgSend(v8, "setResultType:", 2);
  v9 = *(void **)(a1 + 40);
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke_3;
  v11[3] = &unk_1E9297568;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v9, "executeDeleteRequests:context:handler:", v10, v3, v11);

}

void __53__SMSessionStore_removeSessionManagerStatus_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Store,SMSCS,removeSessionManagerStatus,completed, error, %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)clearSessionsWithHandler:(id)a3
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
  v7[2] = __43__SMSessionStore_clearSessionsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __43__SMSessionStore_clearSessionsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearSessionsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_clearSessionsWithHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStore removeAll:handler:](self, "removeAll:handler:", v5, v4);

}

- (void)deleteSessionsPredating:(id)a3 handler:(id)a4
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
  block[2] = __50__SMSessionStore_deleteSessionsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __50__SMSessionStore_deleteSessionsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteSessionsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deleteSessionsPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  SMSessionStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__SMSessionStore__deleteSessionsPredating_handler___block_invoke;
    v10[3] = &unk_1E9297A30;
    v11 = v6;
    v12 = self;
    v8 = v7;
    v13 = v8;
    v9 = (void *)MEMORY[0x1D8232094](v10);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 0, v8);

  }
}

void __51__SMSessionStore__deleteSessionsPredating_handler___block_invoke(_QWORD *a1, void *a2)
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
  +[SMSessionConfigurationMO fetchRequest](SMSessionConfigurationMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K < %@)"), CFSTR("sessionStartDate"), a1[4]);
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

- (void)deleteSessionMonitorStatesPredating:(id)a3 handler:(id)a4
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
  block[2] = __62__SMSessionStore_deleteSessionMonitorStatesPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __62__SMSessionStore_deleteSessionMonitorStatesPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteSessionMonitorStatesPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deleteSessionMonitorStatesPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  SMSessionStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__SMSessionStore__deleteSessionMonitorStatesPredating_handler___block_invoke;
    v10[3] = &unk_1E9297A30;
    v11 = v6;
    v12 = self;
    v8 = v7;
    v13 = v8;
    v9 = (void *)MEMORY[0x1D8232094](v10);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 0, v8);

  }
}

void __63__SMSessionStore__deleteSessionMonitorStatesPredating_handler___block_invoke(_QWORD *a1, void *a2)
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
  +[SMSessionMonitorStateMO fetchRequest](SMSessionMonitorStateMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K < %@)"), CFSTR("date"), a1[4]);
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

- (void)deleteTriggerDestinationStatesPredating:(id)a3 handler:(id)a4
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
  block[2] = __66__SMSessionStore_deleteTriggerDestinationStatesPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __66__SMSessionStore_deleteTriggerDestinationStatesPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteTriggerDestinationStatesPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deleteTriggerDestinationStatesPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  SMSessionStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__SMSessionStore__deleteTriggerDestinationStatesPredating_handler___block_invoke;
    v10[3] = &unk_1E9297A30;
    v11 = v6;
    v12 = self;
    v8 = v7;
    v13 = v8;
    v9 = (void *)MEMORY[0x1D8232094](v10);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 0, v8);

  }
}

void __67__SMSessionStore__deleteTriggerDestinationStatesPredating_handler___block_invoke(_QWORD *a1, void *a2)
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
  +[SMTriggerDestinationStateMO fetchRequest](SMTriggerDestinationStateMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K < %@)"), CFSTR("date"), a1[4]);
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

- (void)deleteSessionsAssociatedWithSessionConfiguration:(id)a3 handler:(id)a4
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
  block[2] = __75__SMSessionStore_deleteSessionsAssociatedWithSessionConfiguration_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __75__SMSessionStore_deleteSessionsAssociatedWithSessionConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteSessionsAssociatedWithSessionConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deleteSessionsAssociatedWithSessionConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  SMSessionStore *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __76__SMSessionStore__deleteSessionsAssociatedWithSessionConfiguration_handler___block_invoke;
    v16[3] = &unk_1E9299838;
    v17 = v6;
    v18 = self;
    v8 = a4;
    v9 = (void *)MEMORY[0x1D8232094](v16);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v9, 0, v8);

    v10 = v17;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D18598];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("requires valid sessionConfiguration.");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = a4;
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 0, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a4 + 2))(v14, v15);

  }
}

void __76__SMSessionStore__deleteSessionsAssociatedWithSessionConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMSessionConfigurationMO fetchRequest](SMSessionConfigurationMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("sessionIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v4);
  objc_msgSend(v8, "setResultType:", 2);
  v9 = *(void **)(a1 + 40);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeDeleteRequests:context:handler:", v10, v3, &__block_literal_global_93);

}

void __76__SMSessionStore__deleteSessionsAssociatedWithSessionConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionStore _deleteSessionsAssociatedWithSessionConfiguration:handler:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, session deletion failed with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (id)fetchRequestFromOptions:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a5)
  {
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0D18598];
      v17 = *MEMORY[0x1E0CB2D50];
      v18[0] = CFSTR("the SMSessionStore doesn't support enumeration");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_retainAutorelease(v11);
      *a5 = v12;

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", v16, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("options"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v16, 2u);
    }

  }
  return 0;
}

- (void)fetchSessionCountWithDateInterval:(id)a3 handler:(id)a4
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
  block[2] = __60__SMSessionStore_fetchSessionCountWithDateInterval_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __60__SMSessionStore_fetchSessionCountWithDateInterval_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSessionCountWithDateInterval:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchSessionCountWithDateInterval:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SMSessionStore _fetchSessionCountWithDateInterval:handler:]";
      v20 = 1024;
      LODWORD(v21) = 798;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SMSessionStore _fetchSessionCountWithDateInterval:handler:]";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, fetching session count with date interval, %@", buf, 0x16u);
  }

  v10 = objc_alloc(MEMORY[0x1E0D8B9F8]);
  LOBYTE(v14) = 0;
  v11 = (void *)objc_msgSend(v10, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", *MEMORY[0x1E0D8BD30], *MEMORY[0x1E0D8BD30], 0, 0, 0, 0, v14, v6, 0, 0, 0, 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__SMSessionStore__fetchSessionCountWithDateInterval_handler___block_invoke;
  v15[3] = &unk_1E9297EE0;
  v16 = v6;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  -[SMSessionStore _fetchSessionConfigurationsWithOptions:handler:](self, "_fetchSessionConfigurationsWithOptions:handler:", v11, v15);

}

void __61__SMSessionStore__fetchSessionCountWithDateInterval_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  id v28;
  id obj;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v28 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[SMSessionStore _fetchSessionCountWithDateInterval:handler:]_block_invoke";
    v45 = 2048;
    v46 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, fetched session configurations with count, %lu", buf, 0x16u);
  }

  v30 = v5;
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.sessionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(void **)(a1 + 32);
    v10 = objc_msgSend(v30, "count");
    v11 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 136315906;
    v44 = "-[SMSessionStore _fetchSessionCountWithDateInterval:handler:]_block_invoke";
    v45 = 2112;
    v46 = v9;
    v47 = 2048;
    v48 = v10;
    v49 = 2048;
    v50 = v11;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, fetched session configs with interval, %@, count, %lu, unique count, %lu", buf, 0x2Au);
  }
  v27 = a1;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v12)
  {
    v13 = v12;
    v31 = *(_QWORD *)v38;
    v32 = 0;
    v14 = v30;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v38 != v31)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v17 = v14;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v34;
          while (2)
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v34 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
              objc_msgSend(v22, "sessionID", v27);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23 == v16
                && (objc_msgSend(v22, "conversation"), v24 = (void *)objc_claimAutoreleasedReturnValue(), v23 = v16, v24))
              {
                objc_msgSend(v22, "conversation");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isGroup");

                if (v26)
                {
                  ++v32;
                  goto LABEL_23;
                }
              }
              else
              {

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v19)
              continue;
            break;
          }
LABEL_23:
          v14 = v30;
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v13);
  }
  else
  {
    v32 = 0;
    v14 = v30;
  }

  (*(void (**)(_QWORD, uint64_t, uint64_t, id))(*(_QWORD *)(v27 + 40) + 16))(*(_QWORD *)(v27 + 40), objc_msgSend(obj, "count"), v32, v28);
}

- (void)storeTriggerDestinationStates:(id)a3 handler:(id)a4
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
  block[2] = __56__SMSessionStore_storeTriggerDestinationStates_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __56__SMSessionStore_storeTriggerDestinationStates_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeWritableObjects:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4
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
  block[2] = __68__SMSessionStore_fetchTriggerDestinationStateWithSessionID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __68__SMSessionStore_fetchTriggerDestinationStateWithSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTriggerDestinationStateWithSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __69__SMSessionStore__fetchTriggerDestinationStateWithSessionID_handler___block_invoke;
    v17[3] = &unk_1E9297A80;
    v18 = v6;
    v9 = v7;
    v19 = v9;
    v10 = (void *)MEMORY[0x1D8232094](v17);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __69__SMSessionStore__fetchTriggerDestinationStateWithSessionID_handler___block_invoke_104;
    v15[3] = &unk_1E9297568;
    v16 = v9;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v10, 1, v15);

    v11 = v18;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSessionStore _fetchTriggerDestinationStateWithSessionID:handler:]";
      v22 = 1024;
      LODWORD(v23) = 870;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSessionStore _fetchTriggerDestinationStateWithSessionID:handler:]";
      v22 = 2112;
      v23 = v13;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%s: handler is a required parameter, %@", buf, 0x16u);
    }

  }
}

void __69__SMSessionStore__fetchTriggerDestinationStateWithSessionID_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  _QWORD v42[4];

  v42[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMTriggerDestinationStateMO fetchRequest](SMTriggerDestinationStateMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
  v42[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("sessionIdentifier_v2"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v10);

  }
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchLimit:", 1);
  v32 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v32;
  v13 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 136315906;
    v35 = "-[SMSessionStore _fetchTriggerDestinationStateWithSessionID:handler:]_block_invoke";
    v36 = 2112;
    v37 = v4;
    v38 = 2048;
    v39 = v15;
    v40 = 2112;
    v41 = v12;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }

  if (!v12 && objc_msgSend(v11, "count"))
  {
    v24 = v11;
    v25 = a1;
    v26 = v4;
    v27 = v3;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v35 = "-[SMSessionStore _fetchTriggerDestinationStateWithSessionID:handler:]_block_invoke";
            v36 = 2112;
            v37 = v21;
            _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%s, triggerDestinationState, %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0D8BAA8], "createWithManagedObject:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v23);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v18);
    }

    v4 = v26;
    v3 = v27;
    a1 = v25;
    v11 = v24;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __69__SMSessionStore__fetchTriggerDestinationStateWithSessionID_handler___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearTriggerDestinationStatesWithHandler:(id)a3
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
  v7[2] = __59__SMSessionStore_clearTriggerDestinationStatesWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __59__SMSessionStore_clearTriggerDestinationStatesWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearTriggerDestinationStatesWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_clearTriggerDestinationStatesWithHandler:(id)a3
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

- (void)storeSessionMonitorStates:(id)a3 handler:(id)a4
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
  block[2] = __52__SMSessionStore_storeSessionMonitorStates_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __52__SMSessionStore_storeSessionMonitorStates_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeWritableObjects:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4
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
  block[2] = __74__SMSessionStore_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __74__SMSessionStore_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMostRecentSessionMonitorStateWithSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__SMSessionStore__fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke;
    v17[3] = &unk_1E9297A80;
    v18 = v6;
    v9 = v7;
    v19 = v9;
    v10 = (void *)MEMORY[0x1D8232094](v17);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __75__SMSessionStore__fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke_106;
    v15[3] = &unk_1E9297568;
    v16 = v9;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v10, 1, v15);

    v11 = v18;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSessionStore _fetchMostRecentSessionMonitorStateWithSessionID:handler:]";
      v22 = 1024;
      LODWORD(v23) = 963;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("handler is a required parameter.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSessionStore _fetchMostRecentSessionMonitorStateWithSessionID:handler:]";
      v22 = 2112;
      v23 = v13;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%s: handler is a required parameter, %@", buf, 0x16u);
    }

  }
}

void __75__SMSessionStore__fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
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
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  _QWORD v43[4];

  v43[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SMSessionMonitorStateMO fetchRequest](SMSessionMonitorStateMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 0);
  v43[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("sessionIdentifier"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v10);

  }
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchLimit:", 1);
  v33 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v33;
  v13 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 136315906;
    v36 = "-[SMSessionStore _fetchMostRecentSessionMonitorStateWithSessionID:handler:]_block_invoke";
    v37 = 2112;
    v38 = v4;
    v39 = 2048;
    v40 = v15;
    v41 = 2112;
    v42 = v12;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }

  if (!v12 && objc_msgSend(v11, "count"))
  {
    v26 = a1;
    v27 = v4;
    v28 = v3;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v36 = "-[SMSessionStore _fetchMostRecentSessionMonitorStateWithSessionID:handler:]_block_invoke";
            v37 = 2112;
            v38 = v21;
            _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%s, sessionMonitorState, %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0D8BA48], "createWithManagedObject:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v23);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v18);
    }

    v4 = v27;
    v3 = v28;
    a1 = v26;
    v12 = 0;
  }
  v24 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v13, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v24 + 16))(v24, v25, v12);

}

uint64_t __75__SMSessionStore__fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke_106(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearSessionMonitorStatesWithHandler:(id)a3
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
  v7[2] = __55__SMSessionStore_clearSessionMonitorStatesWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__SMSessionStore_clearSessionMonitorStatesWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearSessionMonitorStatesWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_clearSessionMonitorStatesWithHandler:(id)a3
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

+ (id)getDateUsingYearMonthDayFromDate:(id)a3 hoursMinsSecsFromDate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 28, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 224, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setDay:", objc_msgSend(v9, "day"));
  objc_msgSend(v11, "setMonth:", objc_msgSend(v9, "month"));
  objc_msgSend(v11, "setYear:", objc_msgSend(v9, "year"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateFromComponents:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)isDateBetweenStartDate:(id)a3 endDate:(id)a4 targetDate:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (!a6)
      goto LABEL_20;
    v15 = CFSTR("startDate");
    goto LABEL_19;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", v21, 2u);
    }

    if (!a6)
      goto LABEL_20;
    v15 = CFSTR("endDate");
LABEL_19:
    _RTErrorInvalidParameterCreate((uint64_t)v15);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
LABEL_23:
    *a6 = v18;
    goto LABEL_24;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: targetDate", v20, 2u);
    }

    if (a6)
    {
      v15 = CFSTR("targetDate");
      goto LABEL_19;
    }
LABEL_20:
    v13 = 0;
    goto LABEL_24;
  }
  if (objc_msgSend(v9, "compare:", v11) == 1)
  {
    v13 = 0;
    if (!a6)
      goto LABEL_24;
    goto LABEL_22;
  }
  v13 = objc_msgSend(v12, "compare:", v10) != 1;
  if (a6)
  {
LABEL_22:
    v18 = 0;
    goto LABEL_23;
  }
LABEL_24:

  return v13;
}

+ (BOOL)areSessionConfigsInTheSameInterval:(id)a3 config2:(id)a4 timeInADayInterval:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  char v33;
  id *v34;
  NSObject *v35;
  const __CFString *v36;
  NSObject *v37;
  void *v39;
  void *v40;
  id *v41;
  void *v42;
  void *v43;
  uint8_t v44[16];
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
    {
      v41 = a6;
      v12 = (void *)objc_opt_class();
      objc_msgSend(v9, "sessionStartDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getDateUsingYearMonthDayFromDate:hoursMinsSecsFromDate:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "duration");
      objc_msgSend(v15, "dateByAddingTimeInterval:");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_opt_class();
      objc_msgSend(v9, "sessionStartDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "getDateUsingYearMonthDayFromDate:hoursMinsSecsFromDate:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "duration");
      v43 = v19;
      objc_msgSend(v19, "dateByAddingTimeInterval:", -v20);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_opt_class();
      objc_msgSend(v10, "sessionStartDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "getDateUsingYearMonthDayFromDate:hoursMinsSecsFromDate:", v22, v23);
      v24 = v10;
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "duration");
      objc_msgSend(v25, "dateByAddingTimeInterval:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_opt_class();
      v40 = v24;
      objc_msgSend(v24, "sessionStartDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "getDateUsingYearMonthDayFromDate:hoursMinsSecsFromDate:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "duration");
      objc_msgSend(v30, "dateByAddingTimeInterval:", -v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToDate:", v25) && (objc_msgSend(v39, "isEqualToDate:", v26) & 1) != 0)
      {
        v33 = 1;
        v34 = v41;
        if (!v41)
          goto LABEL_22;
      }
      else
      {
        v34 = v41;
        if (objc_msgSend(v43, "isEqualToDate:", v30))
        {
          v33 = objc_msgSend(v42, "isEqualToDate:", v32);
          if (!v41)
            goto LABEL_22;
        }
        else
        {
          v33 = 0;
          if (!v41)
          {
LABEL_22:

            v10 = v40;
            goto LABEL_23;
          }
        }
      }
      *v34 = 0;
      goto LABEL_22;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v44 = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: config2", v44, 2u);
    }

    if (a6)
    {
      v36 = CFSTR("config2");
      goto LABEL_18;
    }
LABEL_19:
    v33 = 0;
    goto LABEL_23;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: config1", buf, 2u);
  }

  if (!a6)
    goto LABEL_19;
  v36 = CFSTR("config1");
LABEL_18:
  _RTErrorInvalidParameterCreate((uint64_t)v36);
  v33 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v33;
}

- (void)_logStoreWithReason:(id)a3 handler:(id)a4
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
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__SMSessionStore__logStoreWithReason_handler___block_invoke;
  v14[3] = &unk_1E9297A08;
  v15 = v7;
  v17 = a2;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __46__SMSessionStore__logStoreWithReason_handler___block_invoke_118;
  v12[3] = &unk_1E9297568;
  v13 = v16;
  v10 = v16;
  v11 = v7;
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v14, 1, v12);

}

void __46__SMSessionStore__logStoreWithReason_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *context;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "start logging local store with reason, %@", buf, 0xCu);
    }

  }
  v23 = a1;
  +[SMSessionManagerStateMO fetchRequest](SMSessionManagerStateMO, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
  v42[0] = CFSTR("sessionConfiguration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v7);

  v8 = objc_msgSend(v6, "setFetchLimit:", 5);
  v9 = 0;
  v10 = 0;
  v24 = v6;
  v25 = v3;
  do
  {
    context = (void *)MEMORY[0x1D8231EA8](v8);
    v32 = 0;
    objc_msgSend(v3, "executeFetchRequest:error:", v6, &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v32;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v11;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v10);
          objc_msgSend(MEMORY[0x1E0D8BA28], "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            ++v9;
            *(_DWORD *)buf = 134218242;
            v34 = v9;
            v35 = 2112;
            v36 = v16;
            _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%lu, sessionManagerState, %@", buf, 0x16u);
          }

        }
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      }
      while (v13);
    }

    v6 = v24;
    objc_msgSend(v24, "setFetchOffset:", objc_msgSend(v24, "fetchOffset") + objc_msgSend(v10, "count"));
    v3 = v25;
    objc_msgSend(v25, "reset");
    objc_autoreleasePoolPop(context);
    v8 = objc_msgSend(v10, "count");
  }
  while (v8 && v9 <= 9 && !v27);
  if (*(_QWORD *)(v23 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(v23 + 32);
      *(_DWORD *)buf = 138412290;
      v34 = v19;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "end logging local store with reason, %@", buf, 0xCu);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(v23 + 48));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v34 = (unint64_t)v21;
    v35 = 2112;
    v36 = v24;
    v37 = 2048;
    v38 = v9;
    v39 = 2112;
    v40 = v27;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  v22 = *(_QWORD *)(v23 + 40);
  if (v22)
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v27);

}

uint64_t __46__SMSessionStore__logStoreWithReason_handler___block_invoke_118(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)logStoreWithReason:(id)a3 handler:(id)a4
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
  block[2] = __45__SMSessionStore_logStoreWithReason_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __45__SMSessionStore_logStoreWithReason_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logStoreWithReason:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
