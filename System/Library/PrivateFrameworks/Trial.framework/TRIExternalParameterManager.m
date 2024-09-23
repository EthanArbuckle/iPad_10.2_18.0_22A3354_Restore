@implementation TRIExternalParameterManager

- (TRIExternalParameterManager)init
{
  TRIBiomeDataStreamProvider *v3;
  TRIExternalParameterManager *v4;

  v3 = objc_alloc_init(TRIBiomeDataStreamProvider);
  v4 = -[TRIExternalParameterManager initWithProvider:](self, "initWithProvider:", v3);

  return v4;
}

- (TRIExternalParameterManager)initWithProvider:(id)a3
{
  id v5;
  TRIExternalParameterManager *v6;
  TRIExternalParameterManager *v7;
  void *v8;
  uint64_t v9;
  _PASLock *lock;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRIExternalParameterManager;
  v6 = -[TRIExternalParameterManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paramProvider, a3);
    v8 = (void *)objc_opt_new();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v8);
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v9;

    -[TRIExternalParameterManager _fetchSiriDeviceAggregationIdRotationDate](v7, "_fetchSiriDeviceAggregationIdRotationDate");
  }

  return v7;
}

- (NSDate)siriDeviceAggregationIdRotationDate
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__TRIExternalParameterManager_siriDeviceAggregationIdRotationDate__block_invoke;
  v5[3] = &unk_1E3BFFDD0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __66__TRIExternalParameterManager_siriDeviceAggregationIdRotationDate__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

- (void)_fetchSiriDeviceAggregationIdRotationDate
{
  uint64_t v3;
  void *v4;
  TRIExternalParameterProviding *paramProvider;
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke;
  v7[3] = &unk_1E3BFFE20;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v4 = (void *)MEMORY[0x1A1AC6D30](v7);
  paramProvider = self->_paramProvider;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke_15;
  v6[3] = &unk_1E3BFFE48;
  v6[4] = self;
  -[TRIExternalParameterProviding readLastDataStreamEventForIdentifier:withFilter:eventHandler:](paramProvider, "readLastDataStreamEventForIdentifier:withFilter:eventHandler:", CFSTR("Siri.AnalyticsIdentifiers.UserAggregationId"), v6, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (v6)
  {
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "Error reading Siri.AnalyticsIdentifiers.UserAggregationId data stream %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v10 = (void *)*((_QWORD *)WeakRetained + 2);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke_13;
    v11[3] = &unk_1E3BFFDF8;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v5;
    v13 = &v14;
    objc_msgSend(v10, "runWithLockAcquired:", v11);
    if (*((_BYTE *)v15 + 24))
      objc_msgSend(v8, "_updateSystemInfo");

  }
  _Block_object_dispose(&v14, 8);

}

void __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke_13(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3[1];
  objc_msgSend(*(id *)(a1 + 32), "_readSiriDeviceAggregationIdRotationDateFromEvent:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_storeStrong(v3 + 1, v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "isEqualToDate:", v5) ^ 1;
  }
  else
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_19B89C000, v6, OS_LOG_TYPE_DEFAULT, "UserAggregationId rotation date is null, eventBody: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

BOOL __72__TRIExternalParameterManager__fetchSiriDeviceAggregationIdRotationDate__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  _BOOL8 v17;

  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("effectiveFrom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validityDays"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("effectiveFrom"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(*(id *)(a1 + 32), "_readSiriDeviceAggregationIdRotationDateFromEvent:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  v16 = v15;

  v17 = v10 < v16 && v10 >= v13;
LABEL_9:

  return v17;
}

- (id)_readSiriDeviceAggregationIdRotationDateFromEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    TRILogCategory_ClientFramework();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v16 = 0;
      goto LABEL_10;
    }
    LOWORD(v22) = 0;
    v18 = "Invalid event body for Siri.AnalyticsIdentifiers.UserAggregationId data stream";
    v19 = v17;
    v20 = 2;
LABEL_12:
    _os_log_error_impl(&dword_19B89C000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v22, v20);
    goto LABEL_9;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("effectiveFrom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validityDays"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    TRILogCategory_ClientFramework();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v22 = 138412290;
    v23 = v4;
    v18 = "Invalid type for Siri.AnalyticsIdentifiers.UserAggregationId event %@";
    v19 = v17;
    v20 = 12;
    goto LABEL_12;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("effectiveFrom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validityDays"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setDay:", v13);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v14, v11, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v16;
}

- (void)_updateSystemInfo
{
  notify_post("com.apple.trial.external-parameter-change");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_paramProvider, 0);
}

@end
