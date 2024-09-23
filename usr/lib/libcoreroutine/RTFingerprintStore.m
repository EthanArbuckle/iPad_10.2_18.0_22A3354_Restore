@implementation RTFingerprintStore

- (void)appendWiFiAccessPointsToLastFingerprint:(id)a3 handler:(id)a4
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
  block[2] = __70__RTFingerprintStore_appendWiFiAccessPointsToLastFingerprint_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __70__RTFingerprintStore_appendWiFiAccessPointsToLastFingerprint_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendWiFiAccessPointsToLastFingerprint:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchFingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 filteredBySettledState:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__RTFingerprintStore_fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke;
  block[3] = &unk_1E9297910;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __95__RTFingerprintStore_fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)fetchWifiAccessPointsForFingerprint:(id)a3 fetchLimit:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__RTFingerprintStore_fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __77__RTFingerprintStore_fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchWifiAccessPointsForFingerprint:fetchLimit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)clearWithHandler:(id)a3
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

- (void)purgePredating:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("start");
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

- (void)_appendWiFiAccessPointsToLastFingerprint:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SEL v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __71__RTFingerprintStore__appendWiFiAccessPointsToLastFingerprint_handler___block_invoke;
      v16[3] = &unk_1E9297938;
      v9 = v8;
      v18 = v9;
      v17 = v7;
      v19 = a2;
      v10 = (void *)MEMORY[0x1D8232094](v16);
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v10, 2, v9);

    }
    else if (v8)
    {
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[RTFingerprintStore _appendWiFiAccessPointsToLastFingerprint:handler:]";
      v24 = 1024;
      v25 = 93;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: accessPoints (in %s:%d)", buf, 0x12u);
    }

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("requires a non-nil accessPoints.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      (*((void (**)(id, void *))v8 + 2))(v8, v15);

  }
}

void __71__RTFingerprintStore__appendWiFiAccessPointsToLastFingerprint_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  NSObject *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v26 = 0;
  +[RTFingerprintMO fetchLastByStartDateInManagedObjectContext:error:](RTFingerprintMO, "fetchLastByStartDateInManagedObjectContext:error:", v3, &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v26;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
LABEL_20:
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    goto LABEL_21;
  }
  if (v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          +[RTWiFiAccessPointMO managedObjectWithAccessPoint:inManagedObjectContext:](RTWiFiAccessPointMO, "managedObjectWithAccessPoint:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v4, "addWifiAccessPointsObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v10);
    }
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0D18398]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v14, "initWithIdentifier:settledState:start:accessPoints:", v15, 0, v16, *(_QWORD *)(a1 + 32));

    v17 = +[RTFingerprintMO managedObjectWithFingerprint:inManagedObjectContext:](RTFingerprintMO, "managedObjectWithFingerprint:inManagedObjectContext:", v8, v3);
  }

  v21 = 0;
  v18 = objc_msgSend(v3, "save:", &v21);
  v6 = v21;
  if ((v18 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationStore);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v20;
      v29 = 2112;
      v30 = v6;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    goto LABEL_20;
LABEL_21:

}

- (void)_fetchFingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 filteredBySettledState:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    if (v10)
    {
      if (v11)
        goto LABEL_13;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[RTFingerprintStore _fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:]";
        v43 = 1024;
        v44 = 164;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
      }

      if (v11)
      {
LABEL_13:
        if (a5 >= 3)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v42 = "-[RTFingerprintStore _fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:]";
            v43 = 1024;
            v44 = 166;
            _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTScenarioTriggerSettledStateIsValid(settledState) (in %s:%d)", buf, 0x12u);
          }

        }
        if (v10)
        {
          if (v11)
          {
            if ((objc_msgSend(v10, "isOnOrBefore:", v11) & 1) != 0)
            {
              if (a5 < 3)
              {
                v17 = MEMORY[0x1E0C809B0];
                v28[0] = MEMORY[0x1E0C809B0];
                v28[1] = 3221225472;
                v28[2] = __96__RTFingerprintStore__fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke;
                v28[3] = &unk_1E92979A0;
                v29 = v10;
                v30 = v11;
                v32 = a5;
                v18 = v12;
                v31 = v18;
                v19 = (void *)MEMORY[0x1D8232094](v28);
                v26[0] = v17;
                v26[1] = 3221225472;
                v26[2] = __96__RTFingerprintStore__fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke_3;
                v26[3] = &unk_1E9297568;
                v27 = v18;
                -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v19, 1, v26);

                v13 = v29;
                goto LABEL_27;
              }
              v20 = (void *)MEMORY[0x1E0CB35C8];
              v21 = *MEMORY[0x1E0D18598];
              v33 = *MEMORY[0x1E0CB2D50];
              v34 = CFSTR("requires a valid settledState.");
              v22 = (void *)MEMORY[0x1E0C99D80];
              v23 = &v34;
              v24 = &v33;
            }
            else
            {
              v20 = (void *)MEMORY[0x1E0CB35C8];
              v21 = *MEMORY[0x1E0D18598];
              v35 = *MEMORY[0x1E0CB2D50];
              v36 = CFSTR("requires startDate to be before or equal to endDate.");
              v22 = (void *)MEMORY[0x1E0C99D80];
              v23 = &v36;
              v24 = &v35;
            }
          }
          else
          {
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = *MEMORY[0x1E0D18598];
            v37 = *MEMORY[0x1E0CB2D50];
            v38 = CFSTR("requires a valid endDate.");
            v22 = (void *)MEMORY[0x1E0C99D80];
            v23 = &v38;
            v24 = &v37;
          }
        }
        else
        {
          v20 = (void *)MEMORY[0x1E0CB35C8];
          v21 = *MEMORY[0x1E0D18598];
          v39 = *MEMORY[0x1E0CB2D50];
          v40 = CFSTR("requires a valid startDate.");
          v22 = (void *)MEMORY[0x1E0C99D80];
          v23 = &v40;
          v24 = &v39;
        }
        objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 7, v25);
        v13 = objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, _QWORD, NSObject *))v12 + 2))(v12, 0, v13);
        goto LABEL_27;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[RTFingerprintStore _fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:]";
      v43 = 1024;
      v44 = 165;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate (in %s:%d)", buf, 0x12u);
    }

    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_27:

}

void __96__RTFingerprintStore__fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _RTMap *v12;
  void *v13;
  id v14;

  v3 = a2;
  +[RTFingerprintMO fetchRequest](RTFingerprintMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(%K >= %@) AND (%K <= %@) AND (%K == %@)"), CFSTR("start"), v6, CFSTR("start"), v7, CFSTR("settledState"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v9);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v14 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v14;
  if (v11)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v12 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v10);
    -[_RTMap withBlock:](v12, "withBlock:", &__block_literal_global_4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(a1[6] + 16))();
  }

}

uint64_t __96__RTFingerprintStore__fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D18398], "createWithManagedObject:", a2);
}

uint64_t __96__RTFingerprintStore__fetchFingerprintsBetweenStartDate_endDate_filteredBySettledState_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchWifiAccessPointsForFingerprint:(id)a3 fetchLimit:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (v8)
    {
      v10 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __78__RTFingerprintStore__fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke;
      v20[3] = &unk_1E9297A08;
      v21 = v8;
      v23 = a4;
      v11 = v9;
      v22 = v11;
      v12 = (void *)MEMORY[0x1D8232094](v20);
      v18[0] = v10;
      v18[1] = 3221225472;
      v18[2] = __78__RTFingerprintStore__fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke_3;
      v18[3] = &unk_1E9297568;
      v19 = v11;
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 1, v18);

      v13 = v21;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[RTFingerprintStore _fetchWifiAccessPointsForFingerprint:fetchLimit:handler:]";
        v28 = 1024;
        v29 = 238;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprint (in %s:%d)", buf, 0x12u);
      }

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v24 = *MEMORY[0x1E0CB2D50];
      v25 = CFSTR("requires a valid fingerprint.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v17);
      v13 = objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, NSObject *))v9 + 2))(v9, 0, v13);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __78__RTFingerprintStore__fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke(uint64_t a1, void *a2)
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
  id v12;
  _RTMap *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTWiFiAccessPointMO fetchRequest](RTWiFiAccessPointMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("wifiAccessPoints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRelationshipKeyPathsForPrefetching:", v5);

  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K.%K = %@"), CFSTR("fingerprint"), CFSTR("identifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v4, "setFetchLimit:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("date"), 1);
  v16 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v10);

  v15 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v15;
  if (v12)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v13 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v11);
    -[_RTMap withBlock:](v13, "withBlock:", &__block_literal_global_43);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __78__RTFingerprintStore__fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D18580], "createWithManagedObject:", a2);
}

uint64_t __78__RTFingerprintStore__fetchWifiAccessPointsForFingerprint_fetchLimit_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  v12[0] = CFSTR("RTFingerprintStore doesn't support enumeration");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return 0;
}

@end
