@implementation RTSettledStateTransitionStore

- (void)enumerateStoredSettledStateTransitionsWithOptions:(id)a3 enumerationBlock:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
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
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  RTSettledStateTransitionStore *v32;
  _QWORD v33[4];
  id v34;
  char v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  NSObject *v41;
  uint64_t v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v35 = 1;
    if (v7)
    {
      +[RTSettledStateTransitionMO fetchRequest](RTSettledStateTransitionMO, "fetchRequest");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), objc_msgSend(v7, "ascending"));
      v37 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setSortDescriptors:](v9, "setSortDescriptors:", v11);

      objc_msgSend(v7, "dateInterval");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0CB3528];
        v14 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v7, "dateInterval");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dateInterval");
        v32 = self;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("date"), v16, CFSTR("date"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "orPredicateWithSubpredicates:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setPredicate:](v9, "setPredicate:", v21);

        self = v32;
      }
      objc_msgSend(v7, "limit");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v7, "limit");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setFetchLimit:](v9, "setFetchLimit:", objc_msgSend(v23, "unsignedIntegerValue"));

      }
      if (objc_msgSend(v7, "batchSize"))
      {
        v24 = objc_msgSend(v7, "batchSize");
        if (v24 >= 0x400)
          v25 = 1024;
        else
          v25 = v24;
      }
      else
      {
        v25 = 1024;
      }
      -[NSObject setFetchBatchSize:](v9, "setFetchBatchSize:", 1024);
      -[NSObject setFetchLimit:](v9, "setFetchLimit:", v25);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __100__RTSettledStateTransitionStore_enumerateStoredSettledStateTransitionsWithOptions_enumerationBlock___block_invoke;
      v33[3] = &unk_1E929F360;
      v34 = v8;
      v30 = (void *)MEMORY[0x1D8232094](v33);
      -[RTStore enumerateType:fetchRequest:enumerationBlock:](self, "enumerateType:fetchRequest:enumerationBlock:", objc_opt_class(), v9, v30);

    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0D18598];
      v42 = *MEMORY[0x1E0CB2D50];
      v43[0] = CFSTR("requires non-nil options.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 7, v28);
      v9 = objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocationStore);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v31;
        v40 = 2112;
        v41 = v9;
        _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      (*((void (**)(id, _QWORD, NSObject *, char *))v8 + 2))(v8, 0, v9, &v35);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", buf, 2u);
    }
  }

}

uint64_t __100__RTSettledStateTransitionStore_enumerateStoredSettledStateTransitionsWithOptions_enumerationBlock___block_invoke(uint64_t a1)
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

- (void)_purgeSettledStateTransitionsPredating:(id)a3 handler:(id)a4
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

- (void)purgeSettledStateTransitionsPredating:(id)a3 handler:(id)a4
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
  block[2] = __79__RTSettledStateTransitionStore_purgeSettledStateTransitionsPredating_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __79__RTSettledStateTransitionStore_purgeSettledStateTransitionsPredating_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeSettledStateTransitionsPredating:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
