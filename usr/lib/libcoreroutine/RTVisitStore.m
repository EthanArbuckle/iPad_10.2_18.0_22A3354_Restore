@implementation RTVisitStore

uint64_t __47__RTVisitStore_fetchVisitsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchVisitsWithOptions:(id)a3 handler:(id)a4
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
  block[2] = __47__RTVisitStore_fetchVisitsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_fetchVisitsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__RTVisitStore__fetchVisitsWithOptions_handler___block_invoke;
    v14[3] = &unk_1E9297A08;
    v15 = v7;
    v17 = a2;
    v10 = v8;
    v16 = v10;
    v11 = (void *)MEMORY[0x1D8232094](v14);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __48__RTVisitStore__fetchVisitsWithOptions_handler___block_invoke_20;
    v12[3] = &unk_1E9297568;
    v13 = v10;
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 1, v12);

  }
}

void __48__RTVisitStore__fetchVisitsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
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
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
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
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  id v75;
  void *v76;
  _BYTE v77[128];
  _QWORD v78[5];

  v78[2] = *MEMORY[0x1E0C80C00];
  v55 = a2;
  +[RTVisitMO fetchRequest](RTVisitMO, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "confidence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "confidence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("confidence"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  v57 = v4;
  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0x1E0CB3000uLL;
  v56 = v3;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0CB3528];
    v12 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "startDate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "endDate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("entryDate"), v52, CFSTR("entryDate"), v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v50;
    v13 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dateInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("exitDate"), v15, CFSTR("exitDate"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "orPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addObject:", v20);

    v10 = 0x1E0CB3000;
    v3 = v56;

  }
  objc_msgSend(*(id *)(a1 + 32), "sources");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "sources");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v64 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("source"), *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
      }
      while (v26);
    }

    v10 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addObject:", v30);

    v3 = v56;
  }
  v31 = v57;
  if (objc_msgSend(v57, "count"))
  {
    objc_msgSend(*(id *)(v10 + 1320), "andPredicateWithSubpredicates:", v57);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicate:", v32);

  }
  objc_msgSend(*(id *)(a1 + 32), "limit");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v55;
  if (v33)
  {
    objc_msgSend(*(id *)(a1 + 32), "limit");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFetchLimit:", objc_msgSend(v35, "unsignedIntegerValue"));

  }
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("detectionDate"), objc_msgSend(*(id *)(a1 + 32), "ascending"));
  v76 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v37);

  objc_msgSend(v3, "setFetchBatchSize:", 10);
  v62 = 0;
  objc_msgSend(v55, "executeFetchRequest:error:", v3, &v62);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v62;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v38, "count");
    *(_DWORD *)buf = 138413058;
    v69 = v48;
    v70 = 2112;
    v71 = v3;
    v72 = 2048;
    v73 = v49;
    v74 = 2112;
    v75 = v39;
    _os_log_debug_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v39)
  {
    v41 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v38, "count"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v42 = v38;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v59 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(MEMORY[0x1E0D18578], "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47)
            objc_msgSend(v41, "addObject:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      }
      while (v44);
    }

    v34 = v55;
    v3 = v56;
    v31 = v57;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __48__RTVisitStore__fetchVisitsWithOptions_handler___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_storeVisit:(id)a3 handler:(id)a4
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

- (void)storeVisit:(id)a3 handler:(id)a4
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
  block[2] = __35__RTVisitStore_storeVisit_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __35__RTVisitStore_storeVisit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeVisit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_purgeVisitsPredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("detectionDate");
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

- (void)purgeVisitsPredating:(id)a3 handler:(id)a4
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
  block[2] = __45__RTVisitStore_purgeVisitsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __45__RTVisitStore_purgeVisitsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeVisitsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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
  v12[0] = CFSTR("the visit store doesn't support enumeration");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return 0;
}

@end
