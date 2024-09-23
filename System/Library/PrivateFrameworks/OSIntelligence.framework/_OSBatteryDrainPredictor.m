@implementation _OSBatteryDrainPredictor

- (_OSBatteryDrainPredictor)init
{
  _OSBatteryDrainPredictor *v2;
  os_log_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_OSBatteryDrainPredictor;
  v2 = -[_OSBatteryDrainPredictor init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "batteryDrainPrediction");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

  }
  return v2;
}

+ (id)predictor
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)behaviorDescription:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Unknown");
  else
    return *(&off_1E7D7BEA8 + a3 - 1);
}

- (int64_t)historicalClassification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *log;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 28, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v6, -604800.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_OSBatteryDrainPredictor drainPerDayFromDate:forNumberOfDays:](self, "drainPerDayFromDate:forNumberOfDays:", v7, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl(&dword_1C34CE000, log, OS_LOG_TYPE_DEFAULT, "Drain per day: %@", buf, 0xCu);
  }
  objc_msgSend(v8, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v10);
        if ((int)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "intValue") > 90)
          ++v13;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }
  v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v13;
    _os_log_impl(&dword_1C34CE000, v16, OS_LOG_TYPE_DEFAULT, "Number of days that cross the threshold %d", buf, 8u);
  }
  v17 = 2;
  v18 = 3;
  if (v13 >= 8)
    v18 = 0;
  if (v13 >= 5)
    v17 = v18;
  if (v13 >= 2)
    v19 = v17;
  else
    v19 = 1;

  return v19;
}

- (void)logCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *log;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  log = self->_log;
  v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[_OSBatteryDrainPredictor logCompletion:].cold.2(log, v4);
  }
  else if (v7)
  {
    -[_OSBatteryDrainPredictor logCompletion:].cold.1(log, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (id)drainPerDayFromDate:(id)a3 forNumberOfDays:(int)a4
{
  NSObject *log;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  __int128 v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  _OSBatteryDrainPredictor *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  _dayDrainInfo *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v35 = self;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    -[_OSBatteryDrainPredictor drainPerDayFromDate:forNumberOfDays:].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "components:fromDate:", 28, v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dateFromComponents:", v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a4 >= 1)
  {
    v15 = 0;
    *(_QWORD *)&v14 = 138412546;
    v29 = v14;
    do
    {
      objc_msgSend(v33, "dateByAddingTimeInterval:", (double)v15 * 86400.0, v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateByAddingTimeInterval:", 86399.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v35->_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v29;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v17;
        _os_log_debug_impl(&dword_1C34CE000, v18, OS_LOG_TYPE_DEBUG, "Processing events from %@ to %@", buf, 0x16u);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v39 = __Block_byref_object_copy__2;
      v40 = __Block_byref_object_dispose__2;
      v41 = objc_alloc_init(_dayDrainInfo);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v16, v17, 0, 0, 0);
      BiomeLibrary();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "Device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "Power");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "BatteryLevel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "publisherWithOptions:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "filterWithIsIncluded:", &__block_literal_global_1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = 3221225472;
      v37[2] = __64___OSBatteryDrainPredictor_drainPerDayFromDate_forNumberOfDays___block_invoke_2;
      v37[3] = &unk_1E7D7BE60;
      v37[4] = v35;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __64___OSBatteryDrainPredictor_drainPerDayFromDate_forNumberOfDays___block_invoke_3;
      v36[3] = &unk_1E7D7BE88;
      v36[4] = buf;
      v37[0] = MEMORY[0x1E0C809B0];
      v26 = (id)objc_msgSend(v25, "sinkWithCompletion:receiveInput:", v37, v36);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "drainSoFar"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v27, v16);

      _Block_object_dispose(buf, 8);
      ++v15;
    }
    while (a4 != v15);
  }

  return v32;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)logCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C34CE000, a1, a3, "Completed processing stream \n", a5, a6, a7, a8, 0);
}

- (void)logCompletion:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = 136315138;
  v7 = objc_msgSend(v5, "UTF8String");
  _os_log_debug_impl(&dword_1C34CE000, v3, OS_LOG_TYPE_DEBUG, "Error: %s\n", (uint8_t *)&v6, 0xCu);

}

- (void)drainPerDayFromDate:(uint64_t)a3 forNumberOfDays:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C34CE000, a1, a3, "\n\nOperators\n", a5, a6, a7, a8, 0);
}

@end
