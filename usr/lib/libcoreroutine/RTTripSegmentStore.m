@implementation RTTripSegmentStore

- (RTTripSegmentStore)initWithPersistenceManager:(id)a3
{
  RTTripSegmentStore *v4;
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
  v10.super_class = (Class)RTTripSegmentStore;
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

- (void)_fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4
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
    v18[2] = __60__RTTripSegmentStore__fetchTripSegmentsWithOptions_handler___block_invoke;
    v18[3] = &unk_1E9297A08;
    v19 = v7;
    v21 = a2;
    v11 = v8;
    v20 = v11;
    v12 = (void *)MEMORY[0x1D8232094](v18);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __60__RTTripSegmentStore__fetchTripSegmentsWithOptions_handler___block_invoke_14;
    v16[3] = &unk_1E9297568;
    v17 = v11;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 1, v16);

  }
}

void __60__RTTripSegmentStore__fetchTripSegmentsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
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
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  void *v66;
  _QWORD v67[7];

  v67[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTTripSegmentMO fetchRequest](RTTripSegmentMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0x1E0C99000;
  v50 = v3;
  v51 = v4;
  if (v5)
  {
    v41 = (void *)MEMORY[0x1E0CB3528];
    v7 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "startDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "endDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("%@ <= %K AND %K <= %@"), v47, CFSTR("startDate"), CFSTR("endDate"), v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v45;
    v8 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "startDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "endDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("%@ <= %K AND %K <= %@"), v42, CFSTR("startDate"), CFSTR("startDate"), v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v39;
    v9 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "startDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:", CFSTR("%@ <= %K AND %K <= %@"), v36, CFSTR("endDate"), CFSTR("endDate"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v67[2] = v11;
    v12 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K <= %@ AND %@ <= %K"), CFSTR("startDate"), v14, v16, CFSTR("endDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "orPredicateWithSubpredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setPredicate:", v19);

    v4 = v51;
    v3 = v50;

    v6 = 0x1E0C99000uLL;
  }
  objc_msgSend(*(id *)(a1 + 32), "limit");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 32), "limit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v21, "unsignedIntegerValue"));

  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("startDate"), objc_msgSend(*(id *)(a1 + 32), "isAscending"));
  v66 = v22;
  objc_msgSend(*(id *)(v6 + 3360), "arrayWithObjects:count:", &v66, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v23);

  objc_msgSend(v4, "setFetchBatchSize:", 10);
  v56 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v56);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v56;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 138413058;
    v59 = v34;
    v60 = 2112;
    v61 = v4;
    v62 = 2048;
    v63 = v35;
    v64 = 2112;
    v65 = v25;
    _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v25)
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v28 = v24;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v53;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v53 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(MEMORY[0x1E0D18528], "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v32));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
            objc_msgSend(v27, "addObject:", v33);

          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v30);
    }

    v3 = v50;
    v4 = v51;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __60__RTTripSegmentStore__fetchTripSegmentsWithOptions_handler___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTripSegmentsWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __59__RTTripSegmentStore_fetchTripSegmentsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __59__RTTripSegmentStore_fetchTripSegmentsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTripSegmentsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchTripSegmentsWithUUID:(id)a3 handler:(id)a4
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
    v18[2] = __57__RTTripSegmentStore__fetchTripSegmentsWithUUID_handler___block_invoke;
    v18[3] = &unk_1E9297A08;
    v19 = v7;
    v21 = a2;
    v11 = v8;
    v20 = v11;
    v12 = (void *)MEMORY[0x1D8232094](v18);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __57__RTTripSegmentStore__fetchTripSegmentsWithUUID_handler___block_invoke_21;
    v16[3] = &unk_1E9297568;
    v17 = v11;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 1, v16);

  }
}

void __57__RTTripSegmentStore__fetchTripSegmentsWithUUID_handler___block_invoke(uint64_t a1, void *a2)
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
  +[RTTripSegmentMO fetchRequest](RTTripSegmentMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ == %K"), *(_QWORD *)(a1 + 32), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("startDate"), 1);
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
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
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
          objc_msgSend(MEMORY[0x1E0D18528], "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16));
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

uint64_t __57__RTTripSegmentStore__fetchTripSegmentsWithUUID_handler___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTripSegmentsWithUUID:(id)a3 handler:(id)a4
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
  block[2] = __56__RTTripSegmentStore_fetchTripSegmentsWithUUID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __56__RTTripSegmentStore_fetchTripSegmentsWithUUID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchTripSegmentsWithUUID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_storeTripSegment:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v10;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "CRTSM,RTTripSegmentStore,storeTripSegment,%@", buf, 0xCu);

  }
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStore storeWritableObjects:handler:](self, "storeWritableObjects:handler:", v9, v7);

}

- (void)storeTripSegment:(id)a3 handler:(id)a4
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
  block[2] = __47__RTTripSegmentStore_storeTripSegment_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __47__RTTripSegmentStore_storeTripSegment_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeTripSegment:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_purgeTripSegmentsPredating:(id)a3 handler:(id)a4
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

  -[RTStore purgePredating:predicateMappings:purgeLimit:handler:](self, "purgePredating:predicateMappings:purgeLimit:handler:", v8, v11, 100, v7);
}

- (void)purgeTripSegmentsPredating:(id)a3 handler:(id)a4
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
  block[2] = __57__RTTripSegmentStore_purgeTripSegmentsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __57__RTTripSegmentStore_purgeTripSegmentsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeTripSegmentsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  char *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  RTTripSegmentStore *v22;
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
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
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
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ invoked", buf, 0x16u);

  }
  if (v7)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__RTTripSegmentStore__purgeTripSegmentsOnDateInterval_handler___block_invoke;
    v20[3] = &unk_1E9297A30;
    v21 = v7;
    v22 = self;
    v10 = v8;
    v23 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v20);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 0, v10);

    v12 = v21;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[RTTripSegmentStore _purgeTripSegmentsOnDateInterval:handler:]";
      v28 = 1024;
      LODWORD(v29) = 244;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D18598];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("requires a non-nil dateInterval.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      (*((void (**)(id, void *))v8 + 2))(v8, v12);
  }

}

void __63__RTTripSegmentStore__purgeTripSegmentsOnDateInterval_handler___block_invoke(uint64_t a1, void *a2)
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
  id v25;
  _QWORD v26[6];

  v26[4] = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v24 = (void *)objc_opt_new();
  +[RTTripSegmentMO fetchRequest](RTTripSegmentMO, "fetchRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3528];
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%@ <= %K AND %K <= %@"), v22, CFSTR("startDate"), CFSTR("endDate"), v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%@ <= %K AND %K <= %@"), v19, CFSTR("startDate"), CFSTR("startDate"), v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%@ <= %K AND %K <= %@"), v6, CFSTR("endDate"), CFSTR("endDate"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v8;
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K <= %@ AND %@ <= %K"), CFSTR("startDate"), v10, v11, CFSTR("endDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "orPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPredicate:", v14);

  objc_msgSend(v20, "setFetchLimit:", 100);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v20);
  objc_msgSend(v15, "setResultType:", 2);
  objc_msgSend(v24, "addObject:", v15);
  objc_msgSend(*(id *)(a1 + 40), "executeDeleteRequests:context:handler:", v24, v25, *(_QWORD *)(a1 + 48));

}

- (void)purgeTripSegmentsOnDateInterval:(id)a3 handler:(id)a4
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
  block[2] = __62__RTTripSegmentStore_purgeTripSegmentsOnDateInterval_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __62__RTTripSegmentStore_purgeTripSegmentsOnDateInterval_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeTripSegmentsOnDateInterval:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_deleteTripSegmentWithUUID:(id)a3 handler:(id)a4
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
  RTTripSegmentStore *v32;
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
      v42 = "-[RTTripSegmentStore _deleteTripSegmentWithUUID:handler:]";
      v43 = 1024;
      LODWORD(v44) = 309;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuid (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
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
  v39 = CFSTR("identifier");
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
        v27 = __57__RTTripSegmentStore__deleteTripSegmentWithUUID_handler___block_invoke;
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

void __57__RTTripSegmentStore__deleteTripSegmentWithUUID_handler___block_invoke(uint64_t a1, void *a2)
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

- (void)deleteTripSegmentWithUUID:(id)a3 handler:(id)a4
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
  block[2] = __56__RTTripSegmentStore_deleteTripSegmentWithUUID_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __56__RTTripSegmentStore_deleteTripSegmentWithUUID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteTripSegmentWithUUID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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
  v12[0] = CFSTR("the trip segment store doesn't support enumeration");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return 0;
}

@end
