@implementation TIUserModel

- (TIUserModel)initWithInputMode:(id)a3 userModelDataStore:(id)a4
{
  return -[TIUserModel initWithInputMode:userModelDataStore:weeklyMetricKeys:fromDate:explicitTearDown:](self, "initWithInputMode:userModelDataStore:weeklyMetricKeys:fromDate:explicitTearDown:", a3, a4, 0, 0, 0);
}

- (TIUserModel)initWithInputMode:(id)a3 userModelDataStore:(id)a4 weeklyMetricKeys:(id)a5 fromDate:(id)a6 explicitTearDown:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TIUserModel *v17;
  TIUserModel *v18;
  uint64_t v19;
  NSArray *weeklyMetricKeys;
  uint64_t v21;
  NSMutableDictionary *durableCounters;
  uint64_t v23;
  NSMutableDictionary *userModelValuesCollection;
  NSDate *loadedDate;
  void *v26;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)TIUserModel;
  v17 = -[TIUserModel init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_inputMode, a3);
    objc_storeStrong((id *)&v18->_userModelStore, a4);
    v19 = objc_msgSend(v15, "copy");
    weeklyMetricKeys = v18->_weeklyMetricKeys;
    v18->_weeklyMetricKeys = (NSArray *)v19;

    objc_storeStrong((id *)&v18->_fromDate, a6);
    v18->_explicitTearDown = a7;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    durableCounters = v18->_durableCounters;
    v18->_durableCounters = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    userModelValuesCollection = v18->_userModelValuesCollection;
    v18->_userModelValuesCollection = (NSMutableDictionary *)v23;

    loadedDate = v18->_loadedDate;
    v18->_loadedDate = 0;

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
    v18->_userModelRateLimitingDisabled = objc_msgSend(v26, "BOOLForKey:", CFSTR("userModelRateLimitingDisabled"));

  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_explicitTearDown)
    -[TIUserModel persistForDate:](self, "persistForDate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TIUserModel;
  -[TIUserModel dealloc](&v3, sel_dealloc);
}

- (void)tearDown
{
  if (self->_explicitTearDown)
    -[TIUserModel persistForDate:](self, "persistForDate:", 0);
}

- (NSArray)contexts
{
  -[TIUserModel loadIfNecessary](self, "loadIfNecessary");
  return (NSArray *)-[NSMutableDictionary allKeys](self->_userModelValuesCollection, "allKeys");
}

- (void)configureDurableCounterForName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  TIUserModelCounter *v7;
  TIUserModelCounter *v8;
  void *v9;
  void *v10;
  void *v11;
  TIUserModelCounter *v12;
  id v13;

  v4 = (void *)kUserModelDatabasePrefix;
  v5 = a3;
  objc_msgSend(v4, "stringByAppendingString:", v5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[TIUserModelDataStoring getDurableValueForKey:](self->_userModelStore, "getDurableValueForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [TIUserModelCounter alloc];
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "creationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastUpdateDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TIUserModelCounter initWithName:initialCount:creationDate:lastUpdateDate:](v8, "initWithName:initialCount:creationDate:lastUpdateDate:", v5, v9, v10, v11);

  }
  else
  {
    v12 = -[TIUserModelCounter initWithName:](v7, "initWithName:", v5);
  }
  -[NSMutableDictionary setObject:forKey:](self->_durableCounters, "setObject:forKey:", v12, v5);

}

- (void)configureDurableCounters
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[TIUserModel configurationDelegate](self, "configurationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "durableCounterKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[TIUserModel configureDurableCounterForName:](self, "configureDurableCounterForName:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)valuesFromContext:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  char v8;
  void *v9;
  objc_class *v10;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_userModelValuesCollection, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (objc_class *)objc_opt_class();
    -[TIUserModel configurationDelegate](self, "configurationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[TIUserModel configurationDelegate](self, "configurationDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_msgSend(v9, "userModelValuesClass");

      if (-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()))
        v6 = v10;
    }
    v5 = (void *)objc_msgSend([v6 alloc], "initWithInputMode:context:userModelDataStore:durableCounters:settingsDictionary:", self->_inputMode, v4, self->_userModelStore, self->_durableCounters, self->_settingsDictionary);
    objc_msgSend(v5, "extendCountersForWeeklyMetricKeys:", self->_weeklyMetricKeys);
    -[NSMutableDictionary setObject:forKey:](self->_userModelValuesCollection, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)loadIfNecessary
{
  if (!self->_loadedDate)
    -[TIUserModel doLoad](self, "doLoad");
}

- (void)doLoad
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSDate *fromDate;
  NSDate *v12;
  NSDate *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  TIUserModel *v35;
  void *v36;
  NSDate *v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  IXADefaultLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading user model."), "-[TIUserModel doLoad]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v4;
    _os_log_impl(&dword_18C56E000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  IXADefaultLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading settings."), "-[TIUserModel doLoad]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v6;
    _os_log_impl(&dword_18C56E000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  -[TIUserModel loadSettings](self, "loadSettings");
  IXADefaultLogFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading durable counters."), "-[TIUserModel doLoad]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v8;
    _os_log_impl(&dword_18C56E000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  -[TIUserModel configureDurableCounters](self, "configureDurableCounters");
  IXADefaultLogFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading transient counters"), "-[TIUserModel doLoad]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v10;
    _os_log_impl(&dword_18C56E000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  fromDate = self->_fromDate;
  if (fromDate)
  {
    v12 = fromDate;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeZone:", v15);

  v34 = v14;
  objc_msgSend(v14, "startOfDayForDate:", v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", (double)(unint64_t)kFeatureUsageQueryTimeFrame * -86400.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v13;
  -[TIUserModelDataStoring getDailyAndWeeklyValuesForKeyPrefix:forInputMode:weeklyKeySuffixes:endDate:](self->_userModelStore, "getDailyAndWeeklyValuesForKeyPrefix:forInputMode:weeklyKeySuffixes:endDate:", kUserModelDatabasePrefix, self->_inputMode, self->_weeklyMetricKeys, v13);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v41;
    v35 = self;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1E0CB3710];
        v22 = objc_opt_class();
        objc_msgSend(v20, "properties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        objc_msgSend(v21, "unarchivedObjectOfClass:fromData:error:", v22, v23, &v39);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v39;

        if (v25)
        {
          IXADefaultLogFacility();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v25, "userInfo");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectForKey:", CFSTR("message"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("%s   %@"), "-[TIUserModel doLoad]", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v46 = v29;
            _os_log_error_impl(&dword_18C56E000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            self = v35;
          }
        }
        else
        {
          -[TIUserModel valuesFromContext:](self, "valuesFromContext:", v24);
          v26 = objc_claimAutoreleasedReturnValue();
          -[NSObject addToTransientCounterFromDatabaseEntry:withWeeklyMetricKeys:fromLoadedDate:](v26, "addToTransientCounterFromDatabaseEntry:withWeeklyMetricKeys:fromLoadedDate:", v20, self->_weeklyMetricKeys, v37);
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v17);
  }
  -[TIUserModelDataStoring purgeDataForKeyPrefix:forInputMode:beforeDate:](self->_userModelStore, "purgeDataForKeyPrefix:forInputMode:beforeDate:", kUserModelDatabasePrefix, self->_inputMode, v32);
  objc_storeStrong((id *)&self->_loadedDate, v37);
  IXADefaultLogFacility();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s User model loaded."), "-[TIUserModel doLoad]");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v31;
    _os_log_impl(&dword_18C56E000, v30, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
}

- (id)populateSettingsDictionary
{
  void *v2;
  void *v3;

  -[TIUserModel configurationDelegate](self, "configurationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settingsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loadSettings
{
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9692;
  v10 = __Block_byref_object_dispose__9693;
  v11 = 0;
  if (pthread_main_np())
  {
    -[TIUserModel populateSettingsDictionary](self, "populateSettingsDictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v7[5];
    v7[5] = v3;

  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __27__TIUserModel_loadSettings__block_invoke;
    v5[3] = &unk_1E243B578;
    v5[4] = self;
    v5[5] = &v6;
    TIDispatchSync(MEMORY[0x1E0C80D38], v5);
  }
  objc_storeStrong((id *)&self->_settingsDictionary, (id)v7[5]);
  _Block_object_dispose(&v6, 8);

}

- (NSDictionary)cachedSettingsDictionary
{
  -[TIUserModel loadIfNecessary](self, "loadIfNecessary");
  return self->_settingsDictionary;
}

- (BOOL)persistForDate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  double v11;
  NSObject *v12;
  void *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  NSMutableDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_loadedDate)
  {
    IXADefaultLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Persisting user model."), "-[TIUserModel persistForDate:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v6;
      _os_log_impl(&dword_18C56E000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    objc_msgSend(v4, "timeIntervalSince1970");
    if (v4)
    {
      if (v7 - self->_timeOfLastPersist < 600.0 && !self->_userModelRateLimitingDisabled)
      {
        IXADefaultLogFacility();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s User model persistence not required due to rate limiting."), "-[TIUserModel persistForDate:]");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v41 = v9;
          _os_log_impl(&dword_18C56E000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
        v10 = 0;
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "timeIntervalSince1970");
    self->_timeOfLastPersist = v11;
    -[TIUserModel trackPowerLogIfNecessary](self, "trackPowerLogIfNecessary");
    IXADefaultLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Persisting transient counters."), "-[TIUserModel persistForDate:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v13;
      _os_log_impl(&dword_18C56E000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = self->_userModelValuesCollection;
    v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v14);
          -[NSMutableDictionary objectForKey:](self->_userModelValuesCollection, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "persistForDate:", v4);

        }
        v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v16);
    }

    IXADefaultLogFacility();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Persisting durable counters."), "-[TIUserModel persistForDate:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v21;
      _os_log_impl(&dword_18C56E000, v20, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = self->_durableCounters;
    v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          -[NSMutableDictionary objectForKey:](self->_durableCounters, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "doPersist:forDate:", self->_userModelStore, v4);

        }
        v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v24);
    }

    IXADefaultLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    v10 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s User model persisted."), "-[TIUserModel persistForDate:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v28;
      _os_log_impl(&dword_18C56E000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    goto LABEL_32;
  }
  v10 = 1;
LABEL_33:

  return v10;
}

- (void)addToDurableCounter:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[TIUserModel loadIfNecessary](self, "loadIfNecessary");
  -[NSMutableDictionary objectForKey:](self->_durableCounters, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "add:", v4);
}

- (void)resetDurableCounterForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIUserModel loadIfNecessary](self, "loadIfNecessary");
  -[NSMutableDictionary objectForKey:](self->_durableCounters, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "reset");
}

- (void)addIntegerToTransientCounter:(int)a3 forKey:(id)a4 andCandidateLength:(int)a5 andContext:(id)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  id v12;

  v6 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a4;
  -[TIUserModel loadIfNecessary](self, "loadIfNecessary");
  -[TIUserModel valuesFromContext:](self, "valuesFromContext:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addInteger:toCounterWithKey:andCandidateLength:", v8, v11, v6);
}

- (void)addDoubleToTransientCounter:(double)a3 forKey:(id)a4 andCandidateLength:(int)a5 andContext:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v11 = a4;
  -[TIUserModel loadIfNecessary](self, "loadIfNecessary");
  -[TIUserModel valuesFromContext:](self, "valuesFromContext:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addDouble:toCounterWithKey:andCandidateLength:", v11, v6, a3);
}

- (int)valueForDurableKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[TIUserModel loadIfNecessary](self, "loadIfNecessary");
  -[NSMutableDictionary objectForKey:](self->_durableCounters, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  return v7;
}

- (TIUserModelConfigurationDelegate)configurationDelegate
{
  return (TIUserModelConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_configurationDelegate);
}

- (void)setConfigurationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configurationDelegate, a3);
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (NSArray)weeklyMetricKeys
{
  return self->_weeklyMetricKeys;
}

- (void)setWeeklyMetricKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (BOOL)explicitTearDown
{
  return self->_explicitTearDown;
}

- (NSDate)loadedDate
{
  return self->_loadedDate;
}

- (void)setLoadedDate:(id)a3
{
  objc_storeStrong((id *)&self->_loadedDate, a3);
}

- (BOOL)userModelRateLimitingDisabled
{
  return self->_userModelRateLimitingDisabled;
}

- (void)setUserModelRateLimitingDisabled:(BOOL)a3
{
  self->_userModelRateLimitingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
  objc_storeStrong((id *)&self->_weeklyMetricKeys, 0);
  objc_destroyWeak((id *)&self->_configurationDelegate);
  objc_storeStrong((id *)&self->_settingsDictionary, 0);
  objc_storeStrong((id *)&self->_userModelValuesCollection, 0);
  objc_storeStrong((id *)&self->_durableCounters, 0);
  objc_storeStrong((id *)&self->_userModelStore, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

void __27__TIUserModel_loadSettings__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "populateSettingsDictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
