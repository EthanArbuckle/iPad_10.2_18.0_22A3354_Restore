@implementation HKSPAnalyticsStore

- (HKSPAnalyticsStore)initWithUserDefaults:(id)a3 diagnosticsOptInStatusProvider:(id)a4
{
  id v7;
  id v8;
  HKSPAnalyticsStore *v9;
  HKSPAnalyticsStore *v10;
  uint64_t v11;
  id diagnosticsOptInStatusProvider;
  HKSPAnalyticsStore *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPAnalyticsStore;
  v9 = -[HKSPAnalyticsStore init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    v11 = objc_msgSend(v8, "copy");
    diagnosticsOptInStatusProvider = v10->_diagnosticsOptInStatusProvider;
    v10->_diagnosticsOptInStatusProvider = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_diagnosticsOptInStatusProvider, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (HKSPAnalyticsStore)initWithUserDefaults:(id)a3
{
  return -[HKSPAnalyticsStore initWithUserDefaults:diagnosticsOptInStatusProvider:](self, "initWithUserDefaults:diagnosticsOptInStatusProvider:", a3, &__block_literal_global_14);
}

BOOL __43__HKSPAnalyticsStore_initWithUserDefaults___block_invoke()
{
  return +[HKSPAnalyticsManager defaultIsDiagnosticDataSubmissionAllowed](HKSPAnalyticsManager, "defaultIsDiagnosticDataSubmissionAllowed");
}

- (void)writeWindDownActions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  HKSPAnalyticsWindDownEventDataWrapper *v15;
  void *v16;
  HKSPAnalyticsWindDownEventDataWrapper *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  HKSPAnalyticsStore *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSPLogForCategory(0x11uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = objc_opt_class();
    v33 = 2114;
    v34 = v4;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Writing wind down actions to defaults: %{public}@", buf, 0x16u);
  }

  if (v4 && objc_msgSend(v4, "count"))
  {
    v24 = self;
    v6 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v15 = [HKSPAnalyticsWindDownEventDataWrapper alloc];
          objc_msgSend(v4, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[HKSPAnalyticsWindDownEventDataWrapper initWithEventDatums:](v15, "initWithEventDatums:", v16);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 0, &v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v25;
    if (v19)
    {
      HKSPLogForCategory(0x11uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        v33 = 2114;
        v34 = v19;
        _os_log_error_impl(&dword_1A4F0E000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Unabled to archive wind down actions with error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      -[HKSPAnalyticsStore userDefaults](v24, "userDefaults");
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject hksp_setObject:forKey:](v20, "hksp_setObject:forKey:", v18, CFSTR("sleepAnalyticWindDownActions"));
    }

  }
  else
  {
    HKSPLogForCategory(0x11uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_impl(&dword_1A4F0E000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all wind down actions", buf, 0xCu);
    }

    -[HKSPAnalyticsStore userDefaults](self, "userDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hksp_removeObjectForKey:", CFSTR("sleepAnalyticWindDownActions"));
  }

}

- (id)readAllWindDownActions
{
  uint64_t (**v3)(void);
  char v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[HKSPAnalyticsStore diagnosticsOptInStatusProvider](self, "diagnosticsOptInStatusProvider");
  v3 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v4 = v3[2]();

  if ((v4 & 1) != 0)
  {
    -[HKSPAnalyticsStore userDefaults](self, "userDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hksp_dataForKey:", CFSTR("sleepAnalyticWindDownActions"));
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3710];
      v8 = objc_opt_class();
      v32 = 0;
      objc_msgSend(v7, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v8, objc_opt_class(), v6, &v32);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v32;
      if (v10)
      {
        HKSPLogForCategory(0x11uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v34 = (uint64_t)v10;
          _os_log_error_impl(&dword_1A4F0E000, v11, OS_LOG_TYPE_ERROR, "Unabled to unarchive wind down actions with error: %{public}@", buf, 0xCu);
        }

      }
      if (v9)
      {
        v26 = v10;
        v27 = v6;
        v12 = objc_alloc(MEMORY[0x1E0C99E08]);
        objc_msgSend(v9, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v9, "allKeys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v29 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v9, "objectForKeyedSubscript:", v20, v26, v27);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "eventDatums");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, v20);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v17);
        }

        HKSPLogForCategory(0x11uLL);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v34 = v24;
          v35 = 2114;
          v36 = v14;
          _os_log_impl(&dword_1A4F0E000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reading wind down actions from defaults: %{public}@", buf, 0x16u);
        }

        v10 = v26;
        v6 = v27;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0C9AA70];
      }

    }
    else
    {
      HKSPLogForCategory(0x11uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = objc_opt_class();
        _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] No wind down actions stored in defaults", buf, 0xCu);
      }
      v14 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    HKSPLogForCategory(0x11uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = objc_opt_class();
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unable to read stored actions", buf, 0xCu);
    }
    v14 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v14;
}

- (void)setBaselineForWindDownActions:(id)a3 onMorningIndex:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HKSPLogForCategory(0x11uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting baseline wind down actions for morning index %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[HKSPAnalyticsStore _setWindDownActions:forMorningIndex:overwriteExisting:](self, "_setWindDownActions:forMorningIndex:overwriteExisting:", v6, a4, 0);

}

- (void)updateWindDownActions:(id)a3 onMorningIndex:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HKSPLogForCategory(0x11uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating wind down actions for morning index %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[HKSPAnalyticsStore _setWindDownActions:forMorningIndex:overwriteExisting:](self, "_setWindDownActions:forMorningIndex:overwriteExisting:", v6, a4, 1);

}

- (id)windDownActionsForMorningIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HKSPAnalyticsStore readAllWindDownActions](self, "readAllWindDownActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory(0x11uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Wind down actions for morning index %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);

  }
  v10 = (void *)objc_msgSend(v6, "copy");
  v11 = v10;
  if (!v10)
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v12 = v10;

  return v12;
}

- (id)uncollectedWindDownActions
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HKSPAnalyticsStore readAllWindDownActions](self, "readAllWindDownActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v2, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "na_filter:", &__block_literal_global_193_0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

uint64_t __48__HKSPAnalyticsStore_uncollectedWindDownActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wasCollected") ^ 1;
}

- (id)windDownActionsAfterMorningIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HKSPAnalyticsStore readAllWindDownActions](self, "readAllWindDownActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__HKSPAnalyticsStore_windDownActionsAfterMorningIndex___block_invoke;
    v10[3] = &__block_descriptor_40_e30_B24__0__NSNumber_8__NSArray_16l;
    v10[4] = a3;
    objc_msgSend(v4, "na_filter:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory(0x11uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Wind down actions after morning index %{public}@: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v5;
}

BOOL __55__HKSPAnalyticsStore_windDownActionsAfterMorningIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") > *(_QWORD *)(a1 + 32);
}

- (void)removeAllWindDownActionsBeforeMorningIndex:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HKSPAnalyticsStore windDownActionsAfterMorningIndex:](self, "windDownActionsAfterMorningIndex:", a3 - 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory(0x11uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all wind down actions before morning index %{public}@ except for %{public}@", (uint8_t *)&v9, 0x20u);

  }
  -[HKSPAnalyticsStore writeWindDownActions:](self, "writeWindDownActions:", v5);

}

- (void)markAllActionsAsCollected
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HKSPAnalyticsStore readAllWindDownActions](self, "readAllWindDownActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "na_map:", &__block_literal_global_196_0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[HKSPAnalyticsStore writeWindDownActions:](self, "writeWindDownActions:", v4);
}

id __47__HKSPAnalyticsStore_markAllActionsAsCollected__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "wasCollected"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(v2, "collectedEventDataCopy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (void)_setWindDownActions:(id)a3 forMorningIndex:(int64_t)a4 overwriteExisting:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t (**v9)(void);
  char v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[HKSPAnalyticsStore diagnosticsOptInStatusProvider](self, "diagnosticsOptInStatusProvider");
  v9 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v10 = v9[2]();

  if ((v10 & 1) != 0)
  {
    -[HKSPAnalyticsStore readAllWindDownActions](self, "readAllWindDownActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");

    v13 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v28 = v15;
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v29 = v8;
      v17 = v8;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            v23 = objc_msgSend(v16, "indexOfObject:", v22);
            if (v23 == 0x7FFFFFFFFFFFFFFFLL || !v5)
            {
              if (v23 == 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(v16, "addObject:", v22);
            }
            else
            {
              objc_msgSend(v16, "replaceObjectAtIndex:withObject:", v23, v22);
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v19);
      }

      v25 = (void *)objc_msgSend(v16, "copy");
      v8 = v29;
      v13 = 0x1E0CB3000;
    }
    else
    {
      v25 = (void *)objc_msgSend(v8, "copy");
    }
    objc_msgSend(*(id *)(v13 + 2024), "numberWithInteger:", a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v25, v26);

    v27 = -[NSObject copy](v12, "copy");
    -[HKSPAnalyticsStore writeWindDownActions:](self, "writeWindDownActions:", v27);

  }
  else
  {
    HKSPLogForCategory(0x11uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = objc_opt_class();
      _os_log_impl(&dword_1A4F0E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cannot persist new actions", buf, 0xCu);
    }
  }

}

- (HKSPUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (id)diagnosticsOptInStatusProvider
{
  return self->_diagnosticsOptInStatusProvider;
}

- (void)setDiagnosticsOptInStatusProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
