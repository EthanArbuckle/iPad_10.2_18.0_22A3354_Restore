@implementation TIUserModelValues

- (TIUserModelValues)initWithInputMode:(id)a3 context:(id)a4 userModelDataStore:(id)a5 durableCounters:(id)a6 settingsDictionary:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TIUserModelValues *v17;
  TIUserModelValues *v18;
  uint64_t v19;
  NSMutableDictionary *transientCounters;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TIUserModelValues;
  v17 = -[TIUserModelValues init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_inputMode, a3);
    objc_storeStrong((id *)&v18->_context, a4);
    objc_storeStrong((id *)&v18->_userModelStore, a5);
    objc_storeStrong((id *)&v18->_durableCounters, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    transientCounters = v18->_transientCounters;
    v18->_transientCounters = (NSMutableDictionary *)v19;

    objc_storeStrong((id *)&v18->_settingsDictionary, a7);
  }

  return v18;
}

- (void)extendCountersForWeeklyMetricKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[TIUserModelValues getTransientCounterForKey:](self, "getTransientCounterForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "extendToNumberOfDays:", kFeatureUsageQueryTimeFrame);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)persistForDate:(id)a3
{
  id v4;
  NSMutableDictionary *transientCounters;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  transientCounters = self->_transientCounters;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__TIUserModelValues_persistForDate___block_invoke;
  v9[3] = &unk_1E243B1C0;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](transientCounters, "enumerateKeysAndObjectsUsingBlock:", v9);
  IXADefaultLogFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Persisting user model transient counters."), "-[TIUserModelValues persistForDate:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_18C56E000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
}

- (void)loadTransientCounter:(id)a3 forNumberOfDays:(int)a4 fromLoadedDate:(id)a5
{
  uint64_t v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  TIUserModelValues *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
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
  id v45;
  void *v46;
  id obj;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v6 = *(_QWORD *)&a4;
  v57 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v45 = a5;
  v46 = v7;
  v8 = objc_msgSend(v7, "days");
  if (v8 < (int)v6)
  {
    v9 = v8;
    IXADefaultLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("%s Loading additional data for transient counter %@."), "-[TIUserModelValues loadTransientCounter:forNumberOfDays:fromLoadedDate:]", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v37;
      _os_log_debug_impl(&dword_18C56E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    objc_msgSend(v7, "extendToNumberOfDays:", v6);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v45, (double)(int)v6 * -86400.0);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v45, (double)v9 * -86400.0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)kUserModelDatabasePrefix;
    objc_msgSend(v7, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingString:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = self;
    v41 = (void *)v15;
    v42 = (void *)v12;
    v43 = (void *)v11;
    -[TIUserModelDataStoring getAllValuesForKey:forInputMode:fromDate:toDate:](self->_userModelStore, "getAllValuesForKey:forInputMode:fromDate:toDate:", v15, self->_inputMode, v11, v12);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x1E0CB3710];
          v23 = objc_opt_class();
          objc_msgSend(v21, "properties");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0;
          objc_msgSend(v22, "unarchivedObjectOfClass:fromData:error:", v23, v24, &v49);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v49;

          if (v26)
          {
            IXADefaultLogFacility();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v31 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v26, "userInfo");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "objectForKey:", CFSTR("message"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "stringWithFormat:", CFSTR("%s   %@"), "-[TIUserModelValues loadTransientCounter:forNumberOfDays:fromLoadedDate:]", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v56 = v33;
              _os_log_error_impl(&dword_18C56E000, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

              v16 = self;
            }

          }
          else if (objc_msgSend(v25, "isEqual:", v16->_context))
          {
            objc_msgSend(v21, "timestamp");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "timeIntervalSinceDate:", v28);
            v30 = v29;

            v16 = self;
            -[TIUserModelValues addEntry:toCounter:forDaysPrior:](self, "addEntry:toCounter:forDaysPrior:", v21, v46, (int)(v30 / 86400.0));
          }

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v18);
    }
    IXADefaultLogFacility();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v38 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v46, "name");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%s Additional data loaded for transient counter %@."), "-[TIUserModelValues loadTransientCounter:forNumberOfDays:fromLoadedDate:]", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v40;
      _os_log_debug_impl(&dword_18C56E000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

}

- (id)getTransientCounterForKey:(id)a3
{
  id v4;
  TIUserModelIndexedCounter *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_transientCounters, "objectForKey:", v4);
  v5 = (TIUserModelIndexedCounter *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[TIUserModelIndexedCounter initWithName:]([TIUserModelIndexedCounter alloc], "initWithName:", v4);
    -[NSMutableDictionary setObject:forKey:](self->_transientCounters, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)addInteger:(int)a3 toCounterWithKey:(id)a4 andCandidateLength:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  -[TIUserModelValues getTransientCounterForKey:](self, "getTransientCounterForKey:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithInteger:forIndex:", v6, -[TIUserModelValues indexFromCandidateLength:forCounter:](self, "indexFromCandidateLength:forCounter:", v5, v8));

}

- (void)addDouble:(double)a3 toCounterWithKey:(id)a4 andCandidateLength:(int)a5
{
  uint64_t v5;
  id v8;

  v5 = *(_QWORD *)&a5;
  -[TIUserModelValues getTransientCounterForKey:](self, "getTransientCounterForKey:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithDouble:forIndex:", -[TIUserModelValues indexFromCandidateLength:forCounter:](self, "indexFromCandidateLength:forCounter:", v5, v8), a3);

}

- (int)indexFromCandidateLength:(int)a3 forCounter:(id)a4
{
  int v5;
  int v6;

  v5 = objc_msgSend(a4, "bucketCount");
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = v5;
  if (v6 <= 1)
    v6 = 1;
  return v6 - 1;
}

- (void)addToTransientCounterFromDatabaseEntry:(id)a3 withWeeklyMetricKeys:(id)a4 fromLoadedDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringFromIndex:", objc_msgSend((id)kUserModelDatabasePrefix, "length"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v10);
  v12 = v11;

  -[TIUserModelValues getTransientCounterForKey:](self, "getTransientCounterForKey:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelValues addEntry:toCounter:forDaysPrior:](self, "addEntry:toCounter:forDaysPrior:", v8, v13, (int)(v12 / 86400.0));

}

- (void)addEntry:(id)a3 toCounter:(id)a4 forDaysPrior:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = *(_QWORD *)&a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "secondaryValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  v11 = objc_msgSend(v7, "bucketCount");
  if ((int)v10 >= v11)
    v12 = (v11 - 1);
  else
    v12 = v10;
  objc_msgSend(v8, "value");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v15, "intValue");
  objc_msgSend(v8, "realValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v7, "updateWithLoadedInteger:andDouble:forIndex:andDaysPrior:", v13, v12, v5);

}

- (id)countsFromTransientCounterWithName:(id)a3 forNumberOfDays:(int)a4 fromLoadedDate:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  -[TIUserModelValues getTransientCounterForKey:](self, "getTransientCounterForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelValues loadTransientCounter:forNumberOfDays:fromLoadedDate:](self, "loadTransientCounter:forNumberOfDays:fromLoadedDate:", v9, v5, v8);

  objc_msgSend(v9, "countsForNumberOfDays:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)aggregatedCountFromTransientCounterWithName:(id)a3 forNumberOfDays:(int)a4 fromLoadedDate:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  -[TIUserModelValues getTransientCounterForKey:](self, "getTransientCounterForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelValues loadTransientCounter:forNumberOfDays:fromLoadedDate:](self, "loadTransientCounter:forNumberOfDays:fromLoadedDate:", v9, v5, v8);

  objc_msgSend(v9, "aggregatedCountForNumberOfDays:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)settingValueFromName:(id)a3
{
  void *v3;

  -[NSDictionary objectForKey:](self->_settingsDictionary, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (TIAnalyticsMetricsContext)context
{
  return self->_context;
}

- (TIUserModelDataStoring)userModelDataStore
{
  return self->_userModelStore;
}

- (NSDictionary)durableCounters
{
  return self->_durableCounters;
}

- (NSDictionary)settingsDictionary
{
  return self->_settingsDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsDictionary, 0);
  objc_storeStrong((id *)&self->_transientCounters, 0);
  objc_storeStrong((id *)&self->_durableCounters, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userModelStore, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

uint64_t __36__TIUserModelValues_persistForDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "doPersist:forDate:forContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

@end
