@implementation REPeriodOfDayPredictor

+ (double)updateInterval
{
  return 3600.0;
}

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)REPeriodOfDayPredictor;
  v2 = -[REPredictor _init](&v17, sel__init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)v2[9];
    v2[9] = v3;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_defaultDayPeriodsOfDayForDate:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v2[8];
    v2[8] = v6;

    +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v2[11];
    v2[11] = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BEA9950]), "initWithIdentifier:", CFSTR("com.apple.RelevanceEngine.REPeriodOfDayPredictor"));
    v11 = (void *)v2[12];
    v2[12] = v10;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    RESignificantTimeChangeNotification();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__handleSignificantTimeChange, v13, 0);

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __31__REPeriodOfDayPredictor__init__block_invoke;
    v15[3] = &unk_24CF8AAF0;
    v16 = v2;
    objc_msgSend(v16, "onQueue:", v15);

  }
  return v2;
}

uint64_t __31__REPeriodOfDayPredictor__init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateNextDateUpdateTimer");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)REPeriodOfDayPredictor;
  -[REPredictor dealloc](&v5, sel_dealloc);
}

- (id)_defaultDayPeriodsOfDayForDate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke;
  v27[3] = &unk_24CF8BD48;
  v6 = v4;
  v28 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v27);
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke_2;
  v25[3] = &unk_24CF8BD48;
  v8 = v6;
  v26 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v25);
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke_3;
  v23[3] = &unk_24CF8BD70;
  v21 = v8;
  v24 = v21;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B2434](v23);
  v11 = v3;
  ((void (**)(_QWORD, id, uint64_t))v10)[2](v10, v3, -3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = -2; i != 4; ++i)
  {
    v15 = v12;
    ((void (**)(_QWORD, void *, uint64_t))v10)[2](v10, v11, i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v16, v17);
    objc_msgSend(v13, "addObject:", v18);

  }
  -[REPeriodOfDayPredictor _periodsOfDayForSleepIntervals:](self, "_periodsOfDayForSleepIntervals:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dateBySettingHour:minute:second:ofDate:options:", 7, 0, 0, a2, 0);
}

uint64_t __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dateBySettingHour:minute:second:ofDate:options:", 21, 0, 0, a2, 0);
}

id __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, a3, a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_handleSignificantTimeChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __54__REPeriodOfDayPredictor__handleSignificantTimeChange__block_invoke;
  v2[3] = &unk_24CF8AAF0;
  v2[4] = self;
  -[REPredictor onQueue:](self, "onQueue:", v2);
}

uint64_t __54__REPeriodOfDayPredictor__handleSignificantTimeChange__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__REPeriodOfDayPredictor__handleSignificantTimeChange__block_invoke_2;
  v3[3] = &unk_24CF8BD98;
  v3[4] = v1;
  return objc_msgSend(v1, "enumerateObservers:", v3);
}

void __54__REPeriodOfDayPredictor__handleSignificantTimeChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "periodOfDayPredictorDidUpdatePredictedIntervals:", *(_QWORD *)(a1 + 32));

}

- (unint64_t)currentPeriodOfDay
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  -[NSLock lock](self->_storedPeriodsLock, "lock");
  v3 = (void *)-[NSArray copy](self->_storedPeriods, "copy");
  -[NSLock unlock](self->_storedPeriodsLock, "unlock");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = REIndexOfDateInPeriodsOfDay(v4, v3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    RELogForDomain(8);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[REPeriodOfDayPredictor currentPeriodOfDay].cold.1();

    -[REPeriodOfDayPredictor _defaultDayPeriodsOfDayForDate:](self, "_defaultDayPeriodsOfDayForDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", REIndexOfDateInPeriodsOfDay(v4, v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "periodOfDay");

  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "periodOfDay");
  }

  return v9;
}

- (NSDateInterval)intervalForCurrentPeriodOfDay
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSLock lock](self->_storedPeriodsLock, "lock");
  v3 = (void *)-[NSArray copy](self->_storedPeriods, "copy");
  -[NSLock unlock](self->_storedPeriodsLock, "unlock");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = REIndexOfDateInPeriodsOfDay(v4, v3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    RELogForDomain(8);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[REPeriodOfDayPredictor currentPeriodOfDay].cold.1();

    -[REPeriodOfDayPredictor _defaultDayPeriodsOfDayForDate:](self, "_defaultDayPeriodsOfDayForDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", REIndexOfDateInPeriodsOfDay(v4, v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDateInterval *)v9;
}

- (id)dateIntervalForNextPeriodOfDay:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REPeriodOfDayPredictor dateIntervalForNextPeriodOfDay:afterDate:](self, "dateIntervalForNextPeriodOfDay:afterDate:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB0];
    if (a3 > 2)
      v9 = 0;
    else
      v9 = off_24CF8BEE8[a3];
    -[REPeriodOfDayPredictor _defaultDayPeriodsOfDayForDate:](self, "_defaultDayPeriodsOfDayForDate:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Unable to find %@ after date %@ in default dates: %@"), v9, v5, v10);

  }
  return v6;
}

- (id)dateIntervalForNextPeriodOfDay:(unint64_t)a3 afterDate:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  __CFString *v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  unint64_t j;
  void *v16;
  void *v17;
  int v19;
  __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[NSLock lock](self->_storedPeriodsLock, "lock");
  v7 = (void *)-[NSArray copy](self->_storedPeriods, "copy");
  -[NSLock unlock](self->_storedPeriodsLock, "unlock");
  v8 = REIndexOfDateInPeriodsOfDay(v6, v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v8 + 1; i < objc_msgSend(v7, "count"); ++i)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "periodOfDay") == a3)
      {
        objc_msgSend(v12, "interval");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }

    }
  }
  RELogForDomain(8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (a3 > 2)
      v10 = 0;
    else
      v10 = off_24CF8BEE8[a3];
    v19 = 138412546;
    v20 = v10;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_2132F7000, v9, OS_LOG_TYPE_INFO, "Unable to find %@ in current data: %@\nfalling back to default data", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REPeriodOfDayPredictor _defaultDayPeriodsOfDayForDate:](self, "_defaultDayPeriodsOfDayForDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  for (j = REIndexOfDateInPeriodsOfDay(v6, v14) + 1; ; ++j)
  {
    if (j >= objc_msgSend(v14, "count"))
    {
      v17 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v14, "objectAtIndexedSubscript:", j);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "periodOfDay") == a3)
      break;

  }
  objc_msgSend(v16, "interval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:

  return v17;
}

- (id)dateIntervalForPreviousPeriodOfDay:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REPeriodOfDayPredictor dateIntervalForPreviousPeriodOfDay:beforeDate:](self, "dateIntervalForPreviousPeriodOfDay:beforeDate:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB0];
    if (a3 > 2)
      v9 = 0;
    else
      v9 = off_24CF8BEE8[a3];
    -[REPeriodOfDayPredictor _defaultDayPeriodsOfDayForDate:](self, "_defaultDayPeriodsOfDayForDate:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Unable to find %@ before date %@ in default dates: %@"), v9, v5, v10);

  }
  return v6;
}

- (id)dateIntervalForPreviousPeriodOfDay:(unint64_t)a3 beforeDate:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v20;
  __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[NSLock lock](self->_storedPeriodsLock, "lock");
  v7 = (void *)-[NSArray copy](self->_storedPeriods, "copy");
  -[NSLock unlock](self->_storedPeriodsLock, "unlock");
  v8 = REIndexOfDateInPeriodsOfDay(v6, v7);
  if ((unint64_t)(v8 - 0x7FFFFFFFFFFFFFFFLL) < 0x8000000000000002)
  {
LABEL_5:
    RELogForDomain(8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (a3 > 2)
        v12 = 0;
      else
        v12 = off_24CF8BEE8[a3];
      v20 = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_2132F7000, v11, OS_LOG_TYPE_INFO, "Unable to find %@ in current data: %@\nfalling back to default data", (uint8_t *)&v20, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[REPeriodOfDayPredictor _defaultDayPeriodsOfDayForDate:](self, "_defaultDayPeriodsOfDayForDate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = REIndexOfDateInPeriodsOfDay(v6, v15);
    if ((unint64_t)(v16 - 0x7FFFFFFFFFFFFFFFLL) < 0x8000000000000002)
    {
LABEL_15:
      v13 = 0;
    }
    else
    {
      v17 = v16 + 1;
      while (1)
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v17 - 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "periodOfDay") == a3)
          break;

        if ((unint64_t)--v17 < 2)
          goto LABEL_15;
      }
      objc_msgSend(v18, "interval");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = v8 + 1;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9 - 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "periodOfDay") == a3)
        break;

      if ((unint64_t)--v9 < 2)
        goto LABEL_5;
    }
    objc_msgSend(v10, "interval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)update
{
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, a1, a3, "Updating period of day predictions", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __32__REPeriodOfDayPredictor_update__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  BOOL v29;
  BOOL v30;
  void *v31;
  char v32;
  id obj;
  _QWORD v35[5];
  char v36;
  BOOL v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v39;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v7);
        if (objc_msgSend(v3, "count"))
        {
          objc_msgSend(v3, "lastObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "endDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "startDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v10, "isDate:equalToDate:toUnitGranularity:", v11, v12, 128);

          v14 = objc_msgSend(v9, "intersectsDateInterval:", v8);
          if ((v13 & 1) != 0 || v14)
          {
            if (v14)
            {
              RELogForDomain(8);
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v43 = v9;
                v44 = 2112;
                v45 = v8;
                _os_log_debug_impl(&dword_2132F7000, v15, OS_LOG_TYPE_DEBUG, "Found overlapping intervals %@ and %@", buf, 0x16u);
              }

            }
            objc_msgSend(v3, "removeLastObject");
            REDateIntervalUnion(v9, v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v16);

          }
          else
          {
            objc_msgSend(v3, "addObject:", v8);
          }

        }
        else
        {
          objc_msgSend(v3, "addObject:", v8);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  RELogForDomain(8);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    __32__REPeriodOfDayPredictor_update__block_invoke_cold_2();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_73);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterUsingPredicate:", v19);

  objc_msgSend(*(id *)(a1 + 32), "_periodsOfDayForSleepIntervals:", v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_defaultDayPeriodsOfDayForDate:", v17);
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }
  RELogForDomain(8);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    __32__REPeriodOfDayPredictor_update__block_invoke_cold_1();

  v23 = objc_msgSend(*(id *)(a1 + 32), "currentPeriodOfDay");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "lock");
  v24 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isEqualToArray:", v20);
  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(void **)(v25 + 64);
  *(_QWORD *)(v25 + 64) = v20;
  v27 = v20;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "unlock");
  v28 = objc_msgSend(*(id *)(a1 + 32), "currentPeriodOfDay");
  v29 = v23 == v28;
  v30 = v23 != v28;
  v31 = *(void **)(a1 + 32);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  if (v29)
    v32 = v24;
  else
    v32 = 1;
  v35[2] = __32__REPeriodOfDayPredictor_update__block_invoke_74;
  v35[3] = &unk_24CF8BE00;
  v35[4] = v31;
  v36 = v32;
  v37 = v30;
  objc_msgSend(v31, "onQueue:", v35);

}

BOOL __32__REPeriodOfDayPredictor_update__block_invoke_71(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "duration");
  return v2 >= 10000.0;
}

uint64_t __32__REPeriodOfDayPredictor_update__block_invoke_74(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "finishFetchingData");
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "updateObservers");
  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__REPeriodOfDayPredictor_update__block_invoke_2;
  v7[3] = &unk_24CF8BD98;
  v7[4] = v3;
  objc_msgSend(v3, "enumerateObservers:", v7);
  if (*(_BYTE *)(a1 + 41))
  {
    v4 = *(void **)(a1 + 32);
    v6[0] = v2;
    v6[1] = 3221225472;
    v6[2] = __32__REPeriodOfDayPredictor_update__block_invoke_3;
    v6[3] = &unk_24CF8BD98;
    v6[4] = v4;
    objc_msgSend(v4, "enumerateObservers:", v6);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateNextDateUpdateTimer");
}

void __32__REPeriodOfDayPredictor_update__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "periodOfDayPredictorDidUpdatePredictedIntervals:", *(_QWORD *)(a1 + 32));

}

void __32__REPeriodOfDayPredictor_update__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "periodOfDayPredictorDidUpdateCurrentPeriodOfDay:", *(_QWORD *)(a1 + 32));

}

- (void)_getAllSleepIntervalsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62__REPeriodOfDayPredictor__getAllSleepIntervalsWithCompletion___block_invoke;
    v6[3] = &unk_24CF8BE50;
    v6[4] = self;
    v7 = v4;
    -[REPeriodOfDayPredictor _getHistoricSleepIntervalsWithCompletion:](self, "_getHistoricSleepIntervalsWithCompletion:", v6);

  }
}

void __62__REPeriodOfDayPredictor__getAllSleepIntervalsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__REPeriodOfDayPredictor__getAllSleepIntervalsWithCompletion___block_invoke_2;
  v6[3] = &unk_24CF8BE50;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "_getPredictedSleepIntervalsWithCompletion:", v6);

}

void __62__REPeriodOfDayPredictor__getAllSleepIntervalsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_periodsOfDayForSleepIntervals:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __57__REPeriodOfDayPredictor__periodsOfDayForSleepIntervals___block_invoke;
  v12 = &unk_24CF8BE78;
  v13 = v4;
  v14 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

void __57__REPeriodOfDayPredictor__periodsOfDayForSleepIntervals___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _REPeriodOfDay *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _REPeriodOfDay *v15;
  void *v16;
  _REPeriodOfDay *v17;
  _REPeriodOfDay *v18;
  void *v19;
  _REPeriodOfDay *v20;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = -[_REPeriodOfDay initWithInterval:periodOfDay:]([_REPeriodOfDay alloc], "initWithInterval:periodOfDay:", v5, 2);
  objc_msgSend(v6, "addObject:", v7);

  v8 = a3 + 1;
  if (v8 < objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "compare:", v11) == -1)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v10, v11);
      REDateIntervalMidpoint(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = [_REPeriodOfDay alloc];
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v10, v14);
      v17 = -[_REPeriodOfDay initWithInterval:periodOfDay:](v15, "initWithInterval:periodOfDay:", v16, 0);

      v18 = [_REPeriodOfDay alloc];
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v14, v11);
      v20 = -[_REPeriodOfDay initWithInterval:periodOfDay:](v18, "initWithInterval:periodOfDay:", v19, 1);

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);

    }
    else
    {
      RELogForDomain(8);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __57__REPeriodOfDayPredictor__periodsOfDayForSleepIntervals___block_invoke_cold_1();

    }
  }

}

- (void)_getPredictedSleepIntervalsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  HKSPSleepStore *sleepStore;
  id v11;
  NSObject *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  REDuetKnowledgeStore *knowledgeStore;
  void *v44;
  REPeriodOfDayPredictor *v45;
  void *v46;
  void *v47;
  void (**v48)(_QWORD, _QWORD);
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  void (**v54)(_QWORD, _QWORD);
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[REPredictor beginFetchingData](self, "beginFetchingData");
    v5 = MEMORY[0x24BDAC760];
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke;
    v58[3] = &unk_24CF8BE50;
    v58[4] = self;
    v49 = v4;
    v59 = v49;
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v58);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sleepStore = self->_sleepStore;
    v57 = 0;
    -[HKSPSleepStore currentSleepScheduleWithError:](sleepStore, "currentSleepScheduleWithError:", &v57);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v57;
    if (v11)
    {
      RELogForDomain(8);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v11;
        _os_log_impl(&dword_2132F7000, v12, OS_LOG_TYPE_DEFAULT, "Unable to get the current sleep schedule: %@", buf, 0xCu);
      }

    }
    v50 = v11;
    if (v51)
    {
      v45 = self;
      v13 = v7;
      v48 = v6;
      v55[0] = v5;
      v55[1] = 3221225472;
      v55[2] = __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_79;
      v55[3] = &unk_24CF8BD70;
      v47 = v8;
      v56 = v8;
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B2434](v55);
      v46 = v9;
      v15 = v9;
      v16 = 1;
      v17 = v15;
      do
      {
        v18 = v17;
        ((void (**)(_QWORD, id, uint64_t))v14)[2](v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[RESleepScheduleEntry sleepEntryForDatesWithCurrent:next:schedule:](_TtC15RelevanceEngine20RESleepScheduleEntry, "sleepEntryForDatesWithCurrent:next:schedule:", v18, v17, v51);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bedtime");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "wakeupTime");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          v22 = v21 == 0;
        else
          v22 = 1;
        if (!v22)
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v20, v21);
          objc_msgSend(v13, "addObject:", v23);

        }
        ++v16;
      }
      while (v16 != 4);
      v7 = v13;
      if (objc_msgSend(v13, "count"))
      {
        -[REPredictor finishFetchingData](v45, "finishFetchingData");
        (*((void (**)(id, void *))v49 + 2))(v49, v13);

        v24 = v56;
        v6 = v48;
        v9 = v46;
        v8 = v47;
LABEL_27:

        goto LABEL_28;
      }

      v6 = v48;
      v9 = v46;
      v8 = v47;
      self = v45;
    }
    -[REDuetKnowledgeStore sleepInterval](self->_knowledgeStore, "sleepInterval", v45);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    RELogForDomain(8);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
    {
      v27 = v9;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v24;
        _os_log_impl(&dword_2132F7000, v26, OS_LOG_TYPE_DEFAULT, "Received expected in bed period: %@", buf, 0xCu);
      }

      objc_msgSend(v24, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "components:fromDate:", 224, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nextDateAfterDate:matchingHour:minute:second:options:", v30, objc_msgSend(v29, "hour"), objc_msgSend(v29, "minute"), objc_msgSend(v29, "second"), 1024);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_alloc(MEMORY[0x24BDD1508]);
      objc_msgSend(v24, "duration");
      if (v33 < 0.0)
        v33 = 0.0;
      v34 = (void *)objc_msgSend(v32, "initWithStartDate:duration:", v31, v33);
      objc_msgSend(v7, "addObject:", v34);
      v35 = (void *)objc_msgSend(v7, "copy");
      ((void (**)(_QWORD, void *))v6)[2](v6, v35);

      v9 = v27;
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[REPeriodOfDayPredictor _getPredictedSleepIntervalsWithCompletion:].cold.1(v26, v36, v37, v38, v39, v40, v41, v42);

      -[REDuetKnowledgeStore queryForPredictedChargingEventsWithMinimumDuration:](self->_knowledgeStore, "queryForPredictedChargingEventsWithMinimumDuration:", 60.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      knowledgeStore = self->_knowledgeStore;
      -[REPredictor queue](self, "queue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_81;
      v52[3] = &unk_24CF8BEC8;
      v53 = v7;
      v54 = v6;
      -[REDuetKnowledgeStore executeQuery:responseQueue:completion:](knowledgeStore, "executeQuery:responseQueue:completion:", v29, v44, v52);

      v31 = v53;
    }

    goto LABEL_27;
  }
LABEL_28:

}

void __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  REUpNextDuplicateIntervalsByAddingUnit(a2, 16, 1uLL, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  RELogForDomain(8);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2132F7000, v4, OS_LOG_TYPE_INFO, "Updated predicted sleep events: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishFetchingData");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_79(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, a3, a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  RELogForDomain(8);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_81_cold_1();

  if (v3)
  {
    objc_msgSend(v3, "transitionDates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_82;
    v9[3] = &unk_24CF8BEA0;
    v10 = v5;
    v11 = v3;
    v12 = *(id *)(a1 + 32);
    v6 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  }
  v7 = *(_QWORD *)(a1 + 40);
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

void __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_82(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  id v12;

  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a3 - 1;
    v6 = a2;
    objc_msgSend(v4, "objectAtIndex:", v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v12, v6);

    v8 = *(void **)(a1 + 40);
    REDateIntervalMidpoint(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      if (v11 > 0.78)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
    }

  }
}

- (void)_getHistoricSleepIntervalsWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  HKSPSleepStore *sleepStore;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  REDuetKnowledgeStore *knowledgeStore;
  void *v52;
  REPeriodOfDayPredictor *v53;
  id v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  void (**v59)(id, void *);
  _QWORD v60[4];
  id v61;
  id v62;
  void *v63;
  uint8_t buf[4];
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    sleepStore = self->_sleepStore;
    v62 = 0;
    -[HKSPSleepStore currentSleepScheduleWithError:](sleepStore, "currentSleepScheduleWithError:", &v62);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v62;
    if (v9)
    {
      RELogForDomain(8);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v9;
        _os_log_impl(&dword_2132F7000, v10, OS_LOG_TYPE_DEFAULT, "Unable to get the current sleep schedule: %@", buf, 0xCu);
      }

    }
    if (v8)
    {
      v53 = self;
      v54 = v9;
      v11 = v5;
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke;
      v60[3] = &unk_24CF8BD70;
      v55 = v6;
      v61 = v6;
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B2434](v60);
      v13 = -3;
      ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v56, -3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        v15 = v14;
        ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v56, ++v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[RESleepScheduleEntry sleepEntryForDatesWithCurrent:next:schedule:](_TtC15RelevanceEngine20RESleepScheduleEntry, "sleepEntryForDatesWithCurrent:next:schedule:", v15, v14, v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bedtime");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "wakeupTime");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          v19 = v18 == 0;
        else
          v19 = 1;
        if (!v19)
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v17, v18);
          objc_msgSend(v11, "addObject:", v20);

        }
      }
      while (v13);
      v5 = v11;
      if (objc_msgSend(v11, "count"))
      {
        v21 = (void *)objc_msgSend(v11, "copy");
        v4[2](v4, v21);

        v22 = v61;
        v9 = v54;
        v6 = v55;
LABEL_31:

        goto LABEL_32;
      }

      v6 = v55;
      self = v53;
      v9 = v54;
    }
    -[REDuetKnowledgeStore sleepInterval](self->_knowledgeStore, "sleepInterval", v53);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    RELogForDomain(8);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v22;
        _os_log_impl(&dword_2132F7000, v24, OS_LOG_TYPE_DEFAULT, "Received expected in bed period (using for historic calculation): %@", buf, 0xCu);
      }

      v25 = objc_msgSend(v22, "containsDate:", v56);
      objc_msgSend(v22, "startDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v25 & 1) == 0)
      {
        objc_msgSend(v6, "components:fromDate:", 224, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -1, v28, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = objc_msgSend(v27, "hour");
        v31 = v9;
        v32 = v6;
        v33 = objc_msgSend(v27, "minute");
        v34 = objc_msgSend(v27, "second");
        v35 = v32;
        v36 = v33;
        v6 = v32;
        v9 = v31;
        objc_msgSend(v35, "nextDateAfterDate:matchingHour:minute:second:options:", v29, v30, v36, v34, 1024);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v37 = objc_alloc(MEMORY[0x24BDD1508]);
      objc_msgSend(v22, "duration");
      if (v38 < 0.0)
        v38 = 0.0;
      v39 = (void *)objc_msgSend(v37, "initWithStartDate:duration:", v26, v38);
      v63 = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v63, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      REUpNextDuplicateIntervalsByAddingUnit(v40, 16, 0xFFFFFFFFFFFFFFFFLL, 3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v41);

      RELogForDomain(8);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[REPeriodOfDayPredictor _getHistoricSleepIntervalsWithCompletion:].cold.2();

      v43 = (void *)objc_msgSend(v5, "copy");
      v4[2](v4, v43);

    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[REPeriodOfDayPredictor _getHistoricSleepIntervalsWithCompletion:].cold.1(v24, v44, v45, v46, v47, v48, v49, v50);

      -[REDuetKnowledgeStore queryForHistoricChargingEventsWithMinimumDuration:inThePastDays:](self->_knowledgeStore, "queryForHistoricChargingEventsWithMinimumDuration:inThePastDays:", 3, 60.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      knowledgeStore = self->_knowledgeStore;
      -[REPredictor queue](self, "queue");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke_86;
      v57[3] = &unk_24CF8BEC8;
      v58 = v5;
      v59 = v4;
      -[REDuetKnowledgeStore executeQuery:responseQueue:completion:](knowledgeStore, "executeQuery:responseQueue:completion:", v26, v52, v57);

      v39 = v58;
    }

    goto LABEL_31;
  }
LABEL_32:

}

id __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, a3, a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  RELogForDomain(8);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke_86_cold_1();

  if (v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "confidence", (_QWORD)v16);
          if (v11 > 0.779999971)
          {
            v12 = *(void **)(a1 + 32);
            objc_msgSend(v10, "interval");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  v14 = *(_QWORD *)(a1 + 40);
  v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", (_QWORD)v16);
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

}

- (void)_queue_updateNextDateUpdateTimer
{
  REUpNextTimer *periodOfDayUpdateTimer;
  void *v4;
  void *v5;
  REUpNextTimer *v6;
  REUpNextTimer *v7;
  _QWORD v8[4];
  id v9;
  id location;

  periodOfDayUpdateTimer = self->_periodOfDayUpdateTimer;
  if (periodOfDayUpdateTimer)
    -[REUpNextTimer invalidate](periodOfDayUpdateTimer, "invalidate");
  -[REPeriodOfDayPredictor _nextDayPeriodUpdateDate](self, "_nextDayPeriodUpdateDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[REPredictor queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke;
  v8[3] = &unk_24CF8ABD0;
  objc_copyWeak(&v9, &location);
  +[REUpNextTimer timerWithFireDate:queue:block:](REUpNextTimer, "timerWithFireDate:queue:block:", v4, v5, v8);
  v6 = (REUpNextTimer *)objc_claimAutoreleasedReturnValue();
  v7 = self->_periodOfDayUpdateTimer;
  self->_periodOfDayUpdateTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = MEMORY[0x24BDAC760];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke_2;
    v5[3] = &unk_24CF8BD98;
    v5[4] = WeakRetained;
    objc_msgSend(WeakRetained, "enumerateObservers:", v5);
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke_3;
    v4[3] = &unk_24CF8AAF0;
    v4[4] = v2;
    objc_msgSend(v2, "onQueue:", v4);
  }

}

void __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "periodOfDayPredictorDidUpdateCurrentPeriodOfDay:", *(_QWORD *)(a1 + 32));

}

uint64_t __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateNextDateUpdateTimer");
}

- (id)_nextDayPeriodUpdateDate
{
  void *v2;
  void *v3;
  void *v4;

  -[REPeriodOfDayPredictor intervalForCurrentPeriodOfDay](self, "intervalForCurrentPeriodOfDay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 60.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)storedPeriods
{
  return self->_storedPeriods;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_periodOfDayUpdateTimer, 0);
  objc_storeStrong((id *)&self->_storedPeriodsLock, 0);
  objc_storeStrong((id *)&self->_storedPeriods, 0);
}

- (void)currentPeriodOfDay
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, v0, v1, "Unable to find now in current data: %@\nfalling back to default data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __32__REPeriodOfDayPredictor_update__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_2132F7000, v0, v1, "Determined periods of day: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __32__REPeriodOfDayPredictor_update__block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_2132F7000, v0, OS_LOG_TYPE_DEBUG, "Determined sleep intervals: %@\nFor date: %@", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __57__REPeriodOfDayPredictor__periodsOfDayForSleepIntervals___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_2132F7000, v0, OS_LOG_TYPE_ERROR, "Trying to create invalid interval from %@ to %@", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)_getPredictedSleepIntervalsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, a1, a3, "Falling back to device plug-in predictions", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_81_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_2132F7000, v0, v1, "Received predicted sleep events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_getHistoricSleepIntervalsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, a1, a3, "Falling back to device plug-in history", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_getHistoricSleepIntervalsWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_2132F7000, v0, v1, "Updated historic sleep events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke_86_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_2132F7000, v0, v1, "Received historic sleep events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
